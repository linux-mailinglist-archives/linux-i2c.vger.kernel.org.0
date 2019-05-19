Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 128FB22785
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2019 19:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbfESRMS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 May 2019 13:12:18 -0400
Received: from sauhun.de ([88.99.104.3]:44722 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725766AbfESRMR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 19 May 2019 13:12:17 -0400
Received: from localhost (p5486CF3F.dip0.t-ipconnect.de [84.134.207.63])
        by pokefinder.org (Postfix) with ESMTPSA id D68EE2C374E;
        Sun, 19 May 2019 16:47:04 +0200 (CEST)
Date:   Sun, 19 May 2019 16:47:04 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH 1/4] i2c: nvidia-gpu: add runtime pm support
Message-ID: <20190519144704.GB7291@kunai>
References: <20190517163818.5007-1-ajayg@nvidia.com>
 <20190517163818.5007-2-ajayg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Content-Disposition: inline
In-Reply-To: <20190517163818.5007-2-ajayg@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c=
-nvidia-gpu.c
> index 1c8f708f212b..9d347583f8dc 100644
> --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> @@ -175,6 +175,7 @@ static int gpu_i2c_master_xfer(struct i2c_adapter *ad=
ap,
>  	 * The controller supports maximum 4 byte read due to known
>  	 * limitation of sending STOP after every read.
>  	 */
> +	pm_runtime_get_sync(i2cd->dev);
>  	for (i =3D 0; i < num; i++) {
>  		if (msgs[i].flags & I2C_M_RD) {
>  			/* program client address before starting read */
> @@ -189,7 +190,7 @@ static int gpu_i2c_master_xfer(struct i2c_adapter *ad=
ap,
>  			status =3D gpu_i2c_start(i2cd);
>  			if (status < 0) {
>  				if (i =3D=3D 0)
> -					return status;
> +					goto exit;
>  				goto stop;

Hmm, goto here, goto there... OK, the code didn't have a good flow even
before this patch.

>  			}
> =20
> @@ -206,13 +207,18 @@ static int gpu_i2c_master_xfer(struct i2c_adapter *=
adap,
>  	}
>  	status =3D gpu_i2c_stop(i2cd);
>  	if (status < 0)
> -		return status;
> +		goto exit;
> =20
> +	pm_runtime_mark_last_busy(i2cd->dev);
> +	pm_runtime_put_autosuspend(i2cd->dev);
>  	return i;
>  stop:
>  	status2 =3D gpu_i2c_stop(i2cd);
>  	if (status2 < 0)
>  		dev_err(i2cd->dev, "i2c stop failed %d\n", status2);
> +exit:
> +	pm_runtime_mark_last_busy(i2cd->dev);
> +	pm_runtime_put_autosuspend(i2cd->dev);
>  	return status;
>  }

I am not nacking this, yet the use of goto here seems too much for my
taste. If you could try refactoring the whole code (dunno, maybe using a
flag when to use stop?), I'd appreciate this.


--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzhbGQACgkQFA3kzBSg
KbZDyg//du45dCyEhsChHTtDukHd68YPJsYgjEHa6ZDQ8dmQDQJiviicLbXZ0x0Y
g2qHjrgTXw/RsBdCVclivdTW2JzbVSAVQ50yFF4Ra/7BtGcT7KPUTMf5p5x9O94O
ba5YQ1asZkuZK5DnICWzgAIiWsSQBo0IaBnXZQLD/km8kS3iJ+MQIKHUAjKrFrzm
HAREdnpyB/rmT46kICJep8ThVMwcz/mxVmAFX6dXNIKQSvASS220E2Zxc6HDKzby
8elZdG5lGeOHy8Qo1t2thBek7FnL5LQz3c6mlkmiLTkWwVcjOQeYkKa5c2V+rRUJ
u/W0QDMYZyExj2ISIrQTmrRt3D9jcVxYECI5RrtIqydKtTyxXOsYK/lITa5eYn0Z
P/mUEFBPxrtHJnZ10rnKHMsMRddrMpFDBd7QjSBgHG6ceSCM7Hb3zfxoq2mMcIod
9oGG1c8xcE6iWnuptldByzeEXT+yfkaKEVQzyPMPRMlzHCnrvGn6Ub3FU0N5/RXa
YtmZmnRwhqtQFtkCPZQZ5FkGapZyfswPgYQerDyjQj7CuHDTYLEtp1coV9MdhDCk
Pri2yTjLRDj/nSFn0MuoYPmNhaa8ZsNQUCpeVtMDe0w+Swk25NYAvZB9jbKkO1UR
wGrOFuHunOeG5s0TDeYFCAAeonj3pHSfumz34gorfmiLhxmUIyA=
=y56k
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--
