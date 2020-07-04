Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD42214455
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jul 2020 08:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgGDGjV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Jul 2020 02:39:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:59086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726178AbgGDGjV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 4 Jul 2020 02:39:21 -0400
Received: from localhost (p54b3324c.dip0.t-ipconnect.de [84.179.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D28602084C;
        Sat,  4 Jul 2020 06:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593844760;
        bh=45cSZBppduxUtJsDIYw17MTTo5gleF7cqrf5UjUXBx8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0L/gJxhqAfw1cvF7lL9YWvURvhYpuNLTwnaP/nWBHEo5FQ714Uy2AgJ+W182urFLl
         LD1qnp5gFXRd9QbdMvcY6LG5I3S8N2K5w8EdKcb+XP/dCnmCs7ePgvcmnptfpgcz4c
         a7bTSmcUa3FG8Z4AK67ZbiQR0BSfFTP8zjvy70UU=
Date:   Sat, 4 Jul 2020 08:39:18 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com, joel@jms.id.au
Subject: Re: [PATCH v2 2/2] i2c: fsi: Prevent adding adapters for ports
 without dts nodes
Message-ID: <20200704063918.GH1041@kunai>
References: <20200609201555.11401-1-eajames@linux.ibm.com>
 <20200609201555.11401-3-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SdvjNjn6lL3tIsv0"
Content-Disposition: inline
In-Reply-To: <20200609201555.11401-3-eajames@linux.ibm.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SdvjNjn6lL3tIsv0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2020 at 03:15:55PM -0500, Eddie James wrote:
> Ports should be defined in the devicetree if they are to be enabled on
> the system.

The patch description does not really fit anymore, does it? There is no
change in behaviour, we just remove a redundant check.

>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> Changes since v1:
>  - Remove the check for null device node since that is checked in
>    of_device_is_available
>=20
>  drivers/i2c/busses/i2c-fsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index 977d6f524649..10332693edf0 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -703,7 +703,7 @@ static int fsi_i2c_probe(struct device *dev)
> =20
>  	for (port_no =3D 0; port_no < ports; port_no++) {
>  		np =3D fsi_i2c_find_port_of_node(dev->of_node, port_no);
> -		if (np && !of_device_is_available(np))
> +		if (!of_device_is_available(np))
>  			continue;
> =20
>  		port =3D kzalloc(sizeof(*port), GFP_KERNEL);
> --=20
> 2.24.0
>=20

--SdvjNjn6lL3tIsv0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8AJBEACgkQFA3kzBSg
KbaPNg//Sr6yNyXIIri+b6ymg7B26p/rXy+8iwVBc2JCz1jAOACCqF/sfFA1dfZD
vwU1QBkExWamoYHAgWd2bQTh/WUiavGt5pbKqA6I2NsjGu5Qs/Hen6cgv0k4v16V
K5H9KnxTqqteE34MzlD0sYV+NqPgOK2ihtAbvC3UL4W+yGX8RS26rXqLeYpzQAV2
qLy9cRrJhE54xB/7hgxwnyjeKp6jlG5QzSeROqO/scxeeQEPbhEzVlm4f3i196/B
JFzQ4nP9EuaL75xsruhV90eT8A8bxSRRb1RQJvFMJaPowNlCXXoCTHonNu0FClkW
6WC5vO4nbQUF6S/9n9suYpGvuhBSEWkuTafUhTVEZN+IZA3fp4YbfsLKPXMq+2BZ
q/MBdipW2PKTTJZ9xWIlMYhtDOmhM9iDeiYR243RaCMo1mvNkQCKtCcNJmUoWt6N
WoNr2nd2jsnhFJYFq2Bjk2UiEhk3sNUPEqclJuq/i5+NJYN6punVc7lQhpOjS38I
w8Zf7gHrJNiDYBwpsg2zpkAZ8j+aiPzHQTvsQypF9L9s4LlbDzP5lEc1lGM7Lctd
6XXlka9Rg8XIk/UUYYWz0k/WFGciX3z3D/dQdDWC4Cn5aqnCY/hwjDQeGLEr1RUA
RRbjlbNzju88KaXgj9zew4D+OXxyR6kydsncXdAz/DZHdhvB5ZQ=
=WrgO
-----END PGP SIGNATURE-----

--SdvjNjn6lL3tIsv0--
