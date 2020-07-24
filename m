Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1594622CED6
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 21:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgGXTpU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jul 2020 15:45:20 -0400
Received: from www.zeus03.de ([194.117.254.33]:57796 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726411AbgGXTpU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Jul 2020 15:45:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Eh8C7lhYPilo0pJK1tao0ffKb4ge
        4wHU1nxtEKHZroI=; b=GvZcyUa0wyKnzpx2a18ZeF1sAqeISBF2gGtUK/re1ydW
        /a0301/C/639LFzH7bYxkX/pcWGLyBoDZ5xkJeWN6XPJ/7GuQnVnm842vEYbWqA0
        +klm2epLwU73oxpMsITBkVYEcQd1KUPJuneBdoiYr6Sg+L0Dscg0ugckZKrEaTo=
Received: (qmail 3785575 invoked from network); 24 Jul 2020 21:45:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jul 2020 21:45:18 +0200
X-UD-Smtp-Session: l3s3148p1@ecx0NjWrEJ8gAwDPXwcRAJKYSnl1dekZ
Date:   Fri, 24 Jul 2020 21:45:18 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org, Robert Richter <rrichter@marvell.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        David Daney <david.daney@cavium.com>,
        Jan Glauber <jan.glauber@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] i2c: octeon: check correct size of maximum
 RECV_LEN packet
Message-ID: <20200724194518.GE1227@ninjato>
References: <20200628115245.9638-1-wsa+renesas@sang-engineering.com>
 <20200628115245.9638-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xJK8B5Wah2CMJs8h"
Content-Disposition: inline
In-Reply-To: <20200628115245.9638-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xJK8B5Wah2CMJs8h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 28, 2020 at 01:52:45PM +0200, Wolfram Sang wrote:
> I2C_SMBUS_BLOCK_MAX defines already the maximum number as defined in the
> SMBus 2.0 specs. I don't see a reason to add 1 here.
>=20
> Fixes: 886f6f8337dd ("i2c: octeon: Support I2C_M_RECV_LEN")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Robert, is this correct?

>=20
> Only build tested, I don't have the HW. Please let me know if I
> overlooked something, but to the best of my knowledge, this +1 is wrong.
>=20
>  drivers/i2c/busses/i2c-octeon-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2=
c-octeon-core.c
> index d9607905dc2f..845eda70b8ca 100644
> --- a/drivers/i2c/busses/i2c-octeon-core.c
> +++ b/drivers/i2c/busses/i2c-octeon-core.c
> @@ -347,7 +347,7 @@ static int octeon_i2c_read(struct octeon_i2c *i2c, in=
t target,
>  		if (result)
>  			return result;
>  		if (recv_len && i =3D=3D 0) {
> -			if (data[i] > I2C_SMBUS_BLOCK_MAX + 1)
> +			if (data[i] > I2C_SMBUS_BLOCK_MAX)
>  				return -EPROTO;
>  			length +=3D data[i];
>  		}
> --=20
> 2.20.1
>=20

--xJK8B5Wah2CMJs8h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8bOk4ACgkQFA3kzBSg
KbZ7Og/9HlQQB0vH7HZ75JzWgb891fo1M+KGscuFvi2OhZlBX4bTvQq1ZvdXBRVB
FjkKmOLhuuC5xveSCxZKMbl0VE8HsteM5GkbNSazuNnlNbnel1GqzCnYXDQSL67J
+B/20Q+LNnreOHeX9LtqDjiA6f2UsIxEqbfzIPyGjGCSXh+/TpH0ftMunKL2Xzci
svPjHneGv59b5kIgdIkB7Etq9oP+pvMtIJt7zMMaSFtLFY+qNtlnSgIixuOYuuSg
JLu1qV1GGoMKGI1/61z+65FbKsFeaCKJOmLrmewcp5nqelY0NZCImebAWPBTfXUM
D+/wCp1izdRe+4kaigrxe8klRU81n1twBIBerO/saSAgGjGV56fVYWjRAq4ZbvTx
kh5IPSKN3uzbbipDzul+kOm1AV/AYYIr9Xu+aQuIZnWfjGztAqLmRLe5wh+K3mog
fxtrlxHU6q/anv4cjL+KnzIxqwri+l1Jj7wqb9YYWVLLRGSNIT4vKCaO7cbZjIDu
J1rJjR4QS1ZJpzsuCxH0Zkos97Gj/TKRTFZA5VB1UL5GqSvWDj+E30eOKuIVs9kn
SWosT+f8P9t9eBKEZ93RBH9DCFknjIgYQ/+9oJuQYvoegu/1Xp0G2YfVFP0AMi3T
P1BagBiYIHo3vyyk3tEhjeUsie2k8f/v592VODK+kynt+bqYOv8=
=CkOK
-----END PGP SIGNATURE-----

--xJK8B5Wah2CMJs8h--
