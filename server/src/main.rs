use std::fs;
use std::io::prelude::*;
use std::net::{TcpListener, TcpStream};
//use std::path::Path;

// constants for server configuration
const HOST: &str = "127.0.0.1";
const PORT: &str = "8477";
//const ROOT_DIR: &str = "www";

fn main() 
{
    // binding to the host and port
    let endpoint = format!("{}:{}", HOST, PORT);
    let listener = TcpListener::bind(endpoint).unwrap();
    println!("web server is hosted at: {}\n web server is listening to the port: {}\n", HOST, PORT);

    println!("link is:\nhttp://{}:{}/", HOST, PORT);

    for _ in listener.incoming()
    {
        print!("\n\tconnection established\n\n");
        break;
    }

    for incoming_stream in listener.incoming() 
    {
        let mut stream = incoming_stream.unwrap();
        handle_connection(&mut stream);
    }
}

fn handle_connection(stream: &mut TcpStream) 
{
    let mut buffer = [0; 1024];
    stream.read(&mut buffer).unwrap();

    // Convert the request buffer to a string
    let request_line = buffer.lines().next().unwrap().unwrap();

    let (response, filename) = if request_line == "GET / HTTP/1.1" 
    {
        ("HTTP/1.1 200 OK", "src/elements/index.html")
    } else {
        ("HTTP/1.1 404 NOT FOUND", "src/elements/404.html")
    };
    
    let contents = fs::read_to_string(filename).unwrap();
    let length = contents.len();

    let response =
        format!("{response}\r\nContent-Length: {length}\r\n\r\n{contents}");

    stream.write_all(response.as_bytes()).unwrap();
}

