import { Link } from "react-router-dom";
import network from "../utils/network";
import { getToken } from "../utils/auth";
function Navbar() {
  const onlogout = () => {
    network.logout();
    window.location.reload();
    window.location.href = "/";
  };
  const token = getToken();
  return (
    <nav className="nav">
      <Link to="/">
        <img src="/assets/logof.png" alt=" logo" className="nav__logo" />
      </Link>
      <ul className="nav__links">
        <li className="nav__item">
          <Link className="nav__link" to="/">
            Home
          </Link>
        </li>
        {token && (
          <li className="nav__item">
            <Link className="nav__link" to="/todos">
              Tasks
            </Link>
          </li>
        )}
        {!token && (
          <>
            <li className="nav__item">
              <Link className="nav__link nav__link--btn" to="/login">
                Login
              </Link>
            </li>
            <li className="nav__item">
              <Link className="nav__link nav__link--btn " to="/signup">
                Get Started
              </Link>
            </li>
          </>
        )}
        {token && (
          <li className="nav__item" onClick={onlogout}>
            <Link className="nav__link nav__link--btn ">Logout</Link>
          </li>
        )}
      </ul>
    </nav>
  );
}

export default Navbar;
