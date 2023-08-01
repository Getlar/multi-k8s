import React from "../../../complex/client/node_modules/@types/react";
import { Link } from "react-router-dom";

const OtherPage = () => {
  return (
    <div>
      Im some other page!
      <Link to="/">Go back home</Link>
    </div>
  );
};

export default OtherPage;
