'use client'

import axios from "axios";
import {useEffect, useState} from "react";

//A page which displays a table containing data from a get request
export default function Home() {
  //The variable to hold the data from the get request
  const [customers, setCustomers] = useState([]);

  //Call the get request immediately on startup
  useEffect(() => {
    getCustomers();
  }, []);

  //The get request
  const getCustomers = () => {
    axios.get(`http://localhost:8000/getCustomers`).then(r => {
      setCustomers(r.data.map())
    })
  }

  //Build the actual skeleton of the page
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">\
      <div>
        <table>
          {customers.map((c) => (
            <tr key={c.customer_id}>
              {Object.values(c).map((val) => {
                console.log(val)
                return (<td>{val}</td>)
              })}
            </tr>
          ))}
        </table>
      </div>
    </main>
  );
}
