Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6B113129F
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 14:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgAFNNX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jan 2020 08:13:23 -0500
Received: from sauhun.de ([88.99.104.3]:38672 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726173AbgAFNNX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 Jan 2020 08:13:23 -0500
Received: from localhost (p54B338AC.dip0.t-ipconnect.de [84.179.56.172])
        by pokefinder.org (Postfix) with ESMTPSA id D41522C0686;
        Mon,  6 Jan 2020 14:13:20 +0100 (CET)
Date:   Mon, 6 Jan 2020 14:13:19 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: fix bus recovery stop mode timing
Message-ID: <20200106131319.GB1290@ninjato>
References: <E1igWvB-0001ib-PV@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Content-Disposition: inline
In-Reply-To: <E1igWvB-0001ib-PV@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Russell,

On Sun, Dec 15, 2019 at 04:39:05PM +0000, Russell King wrote:
> The I2C specification states that tsu:sto for standard mode timing must
> be at minimum 4us. Pictographically, this is:
>=20
> SCL: ____/~~~~~~~~~
> SDA: _________/~~~~
>        ->|    |<- 4us minimum
>=20
> We are currently waiting 2.5us between asserting SCL and SDA, which is
> in violation of the standard. Adjust the timings to ensure that we meet
> what is stipulated as the minimum timings to ensure that all devices
> correctly interpret the STOP bus transition.
>=20
> This is more important than trying to generate a square wave with even
> duty cycle.

Ack.

> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

> -		/* Creating STOP again, see above */

Can we keep this comment, though? I think it still has value together
with the other comment above it.

> -		ndelay(RECOVERY_NDELAY / 2);
> +		if (scl)  {
> +			/* Honour minimum tsu:sto */
> +			ndelay(RECOVERY_NDELAY);
> +		} else {
> +			/* Honour minimum tf and thd:dat */
> +			ndelay(RECOVERY_NDELAY / 2);
> +		}

Thanks,

   Wolfram


--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4TMm8ACgkQFA3kzBSg
KbYsohAAkYc3F+hEq+6jb6N0PikbKCHvfjTqS6p5LBWVuQklvZ9MJKU/KH6MYnSe
Zn7QwfPddsE1WIBZSBxTMkVdi8K6FA1qp5DhNCGJA6ju3YdzS2Ml/b55bZAwEooh
Uc4MM9sia8vd1M9SmJdTz1Al3cvFUk28nySsJ+7FutjDXszrJl+48QROM2Re/lpW
MvjGdPWqmGEKF9zRarCsCyi/8CY5HweqVPifUOsdhxS9IeS9CwWxwJ7ijS+vaH07
jHbSPiIFnENO8Y8t+FWEIXGXSHiPB0cb0ZQ+nHTOAqLjT8bUd0p2Jq/H+B+JNs0Z
2pQe9Wt+wzDxikuHOd9eoHUqn/t6duM2dY4HOXRNSLRjd/m2frLa/FSUtvlVL+ld
AQJ8zqYxvyrcD5MIuOvC7871Ws8TLFrmxSoNo7+5Aa33DrgQtIONJAQacGRog9pB
GbgOUArmVsLPOEKr71/bXqTqQ88DdpEVF1KGK3On+dw67Bu6tvhYpiwxwagl8OsW
yn/cNPjZuHTFftxMyqDgggJB7sB1scc7LvEvZEuLGW5G8wiLhqaMAWHhHojvteSw
3POawMOnNADSuIzqCyPy1+ivyaqq2EcwzBnoO/2Y+mY1ZRs1PLP6NQuw5XdWSHL4
Cw76xFYc8tU3giGZlfntTBf0RXHhsEObUu5NWI5p6l8eLVGqgtw=
=xWNC
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
