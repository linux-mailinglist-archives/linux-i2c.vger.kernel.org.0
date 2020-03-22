Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE3E18EA08
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Mar 2020 17:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgCVQIM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Mar 2020 12:08:12 -0400
Received: from sauhun.de ([88.99.104.3]:51242 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbgCVQIM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 22 Mar 2020 12:08:12 -0400
Received: from localhost (p54B33042.dip0.t-ipconnect.de [84.179.48.66])
        by pokefinder.org (Postfix) with ESMTPSA id 85F752C0064;
        Sun, 22 Mar 2020 17:08:10 +0100 (CET)
Date:   Sun, 22 Mar 2020 17:08:10 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Chuhong Yuan <hslester96@gmail.com>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: ismt: Add missed pci_release_region
Message-ID: <20200322160810.GE1091@ninjato>
References: <20191109075435.29871-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WK3l2KTTmXPVedZ6"
Content-Disposition: inline
In-Reply-To: <20191109075435.29871-1-hslester96@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WK3l2KTTmXPVedZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 09, 2019 at 03:54:35PM +0800, Chuhong Yuan wrote:
> ismt_remove forgets to call pci_release_region when remove.
> Add the call to fix it.
>=20
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>

Chuhong Yuan, your To-Header is broken, so you never got a response.

Adding the maintainers to CC.

> ---
>  drivers/i2c/busses/i2c-ismt.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
> index 2f95e25a10f7..c393e629cac3 100644
> --- a/drivers/i2c/busses/i2c-ismt.c
> +++ b/drivers/i2c/busses/i2c-ismt.c
> @@ -943,6 +943,8 @@ static void ismt_remove(struct pci_dev *pdev)
>  	struct ismt_priv *priv =3D pci_get_drvdata(pdev);
> =20
>  	i2c_del_adapter(&priv->adapter);
> +
> +	pci_release_region(pdev, SMBBAR);
>  }
> =20
>  static struct pci_driver ismt_driver =3D {
> --=20
> 2.23.0
>=20

--WK3l2KTTmXPVedZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl53jWkACgkQFA3kzBSg
KbadnA//eQplvA8z67DNvwnKu7axmBSmXZJ5g08p7uRCMcQGKeRejgeZfVRxfAWf
pBguFEjzNC3TqxGDIoIjohQZwmCLPEE46n0FZ7TmC8+kjwUgX0oREHRWwj3SWJza
oMXucUG5YWz14vq6H+RSfntBoucgD4Q5QyD62wx8wURhv+JnbBRIlX20rcpqaNe6
jSj9KVMMjlYregckEfyRFis/c5D+4PT/zSHNO6/R4F6sN/dWdky1qCjKIsjU78SM
43bPEh0OUglNjqOlyTn0KcL3OL05E6XNnRFlgY8lwf+9Zx1ar5TpEAuI/e1rpS9u
aWY7nIeG0jDyxOyRdzWINfF4DM6arutYE0z2l2AU3NRRyOGvSIwCZNN6Sfv1PiIq
XSZesG/WETXgJ/zMZjymL0k0pOesXAqncguMHWZ73mg4qKqOTAk/NaI+yBSVzX/L
THCZHXeVI0MBAvKMRXPmKjv8p9zK6HeaATo517xjlpkh30iHFVYU/4qZz6gjooMg
X2ChDbh49IqW6YBvDBXorp6iB00rxsd8s8J1EPIv7rClWqLBWdOEqVhqbgDWTkd7
QavCXGYkyS2ChTQ2Vel2Dn+YCaehc7d19k+9nZcfJb/66Ewtk9UKcYyrqQGVKABc
emR05tRP8uT00Td+EVMuMXBvoErfujDxE58YArYyDOPGDRACw/Y=
=qmLy
-----END PGP SIGNATURE-----

--WK3l2KTTmXPVedZ6--
