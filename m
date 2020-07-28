Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFA55230871
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 13:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728999AbgG1LQH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 07:16:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:41496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728954AbgG1LQG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Jul 2020 07:16:06 -0400
Received: from localhost (p54b330d0.dip0.t-ipconnect.de [84.179.48.208])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7B9C2065C;
        Tue, 28 Jul 2020 11:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595934965;
        bh=5jhO09j+PziKJ9BELKyYp1HAPTUwHVDSwK7wfN+OPKE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iim1zefEW/AFfRCs5jUoM7wds4gh8OFBVpTQcVP9QwjBmuEHeKCyXx4baeidZP1Ll
         fYZyqdwtZjq07QEDtS2YmOfscrPR+ucnrLWs8VVoAaqKdvcHg/KeH4NyfTK7dxCrzb
         5x7b7jTgv402rCfI2H9jyz0CoWMWjE4EqJTEFWKc=
Date:   Tue, 28 Jul 2020 13:16:02 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     daniel.stodden@gmail.com
Cc:     linux-i2c@vger.kernel.org, jdelvare@suse.de,
        Daniel Stodden <dns@arista.com>
Subject: Re: [RFC PATCH] i2c: Support Smbus 3.0 block sizes up to 255 bytes.
Message-ID: <20200728111602.GC980@ninjato>
References: <20200728004708.4430-1-daniel.stodden@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dkEUBIird37B8yKS"
Content-Disposition: inline
In-Reply-To: <20200728004708.4430-1-daniel.stodden@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dkEUBIird37B8yKS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


>  * Allocated bit 4 (I2C_SMBUS3_BLOCK=3D0x10), to simplify Smbus2
>    compatibility: I2C_SMBUS_*BLOCK* =3D (<old type>|0x10)

I think the code becomes easier to understand, if we use new transfer
types a bit more explicitly. Also, I am not sure of the extra bit
because it is not clearly visible that types >=3D 16 and <=3D 31 will have a
special meaning. We could do like this if we sacrifice one number for
an unused BROKEN with 255 byte:

-#define I2C_SMBUS_BLOCK_DATA	    5
+#define I2C_SMBUS2_BLOCK_DATA	    5 /* 32 byte only, deprecated */
-#define I2C_SMBUS_I2C_BLOCK_BROKEN  6
+#define I2C_SMBUS2_I2C_BLOCK_BROKEN  6 /* 32 byte only, deprecated */
-#define I2C_SMBUS_BLOCK_PROC_CALL   7		/* SMBus 2.0 */
+#define I2C_SMBUS2_BLOCK_PROC_CALL   7		/* SMBus 2.0, 32 byte only, deprec=
ated */
-#define I2C_SMBUS_I2C_BLOCK_DATA    8
+#define I2C_SMBUS2_I2C_BLOCK_DATA    8 /* 32 byte only, deprecated */

+#define I2C_SMBUS_BLOCK_DATA		9
+#define I2C_SMBUS_I2C_BLOCK_BROKEN	10 /* FIXME: probably say "don't use" h=
ere
+#define I2C_SMBUS_BLOCK_PROC_CALL	11 /* SMBus >=3D 2.0 */
+#define I2C_SMBUS_I2C_BLOCK_DATA	12
> =20

> +	user_len =3D kmalloc_array(nmsgs, sizeof(*user_len), GFP_KERNEL);
> +	if (!user_len) {
> +		res =3D -ENOMEM;
> +		goto out;
> +	}

Maybe on stack? I2C_RDWR_IOCTL_MAX_MSGS will ensure this will stay at a
sane value.

> @@ -313,7 +357,19 @@ static noinline int i2cdev_ioctl_smbus(struct i2c_cl=
ient *client,
>  		union i2c_smbus_data __user *data)
>  {
>  	union i2c_smbus_data temp =3D {};
> -	int datasize, res;
> +	int block_max, datasize, res;
> +

'size' is really a misleading name :(

+	if (size <=3D I2C_SMBUS2_I2C_BLOCK_DATA) {
+		if (size >=3D I2C_SMBUS2_BLOCK_DATA)
+			size +=3D I2C_SMBUS_BLOCK_DATA - I2C_SMBUS2_BLOCK_DATA;
+		block_max =3D I2C_SMBUS_BLOCK_MAX;
+	} else {
+		block_max =3D I2C_SMBUS3_BLOCK_MAX;
+	}

Would this work, too?


--dkEUBIird37B8yKS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8gCO4ACgkQFA3kzBSg
KbbxDg//Yz8gTx5Dt4YuH5pndhRaWNBGtAa+kVd/ItsvnXRpgEcxrb/Rnlpn72Xk
Kb0yNoPto9/xsLduMs7XEXvaQXkgXpJpi5V4BilvXYaKdOT5ik/BEY2TI+YUpdup
Mxv4UF+gCCGMLS4s1QQa1K8joYX1YjVVm5PkiWnRZFJGS+2tCES9/rewInJcYEgh
b6eZn5iZgWhWUWuhvAmRko/7ReQubJYrpdF3n6EzVetq7qdfMaNLJPv0pHbLzSKR
sueVxG1O5R8ma2SXshClcNXC6FrpVsTzjkRctFHnmxP9K7I6MO15kWi0inc4Z+ih
Sg0Lw1RePLvDeVqxAfrX9wI/IBXx1xM02yVvXwKht1lRCdpVT9ZkivQF9FtNVFwa
oMoggjn54JH2kouus7+7IcwcWkU/BICuKOjTiydlUu+uG+JTdRwlareXkkq/+hga
qEKGQn1xOVP1C/+4QmH+CXqQwo6rxbNOUvmbH8+/qkhQ86HhFU+L0lhALplHeWI8
AqriaA7tTzieL4DyOe2jwXqbH6HvwhoLVqq9r4WNtK+KJ+K/YU2RaxkoNWTVLx1L
erXe5NR4+u3L5Wd6XUborQjgfyKkUarG7vqglBu17Kl30ryVCOVcR/a53BrkjIDi
kI4+IW8D9SOW57wvFPRHxn29vMQv88bGOtIHsSAHFs9DOKoT9GI=
=roS3
-----END PGP SIGNATURE-----

--dkEUBIird37B8yKS--
