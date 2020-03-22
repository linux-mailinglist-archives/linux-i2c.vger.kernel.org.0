Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAC5D18E9E8
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Mar 2020 16:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgCVP4z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Mar 2020 11:56:55 -0400
Received: from sauhun.de ([88.99.104.3]:51134 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbgCVP4z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 22 Mar 2020 11:56:55 -0400
Received: from localhost (p54B33042.dip0.t-ipconnect.de [84.179.48.66])
        by pokefinder.org (Postfix) with ESMTPSA id 6400C2C0064;
        Sun, 22 Mar 2020 16:56:53 +0100 (CET)
Date:   Sun, 22 Mar 2020 16:56:52 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Xu Wang <vulab@iscas.ac.cn>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: Fix a potential use after free
Message-ID: <20200322155652.GC1091@ninjato>
References: <1577439272-10362-1-git-send-email-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="H8ygTp4AXg6deix2"
Content-Disposition: inline
In-Reply-To: <1577439272-10362-1-git-send-email-vulab@iscas.ac.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--H8ygTp4AXg6deix2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2019 at 09:34:32AM +0000, Xu Wang wrote:
> Free the adap structure only after we are done using it.
> This patch just moves the put_device() down a bit to avoid the
> use after free.
>=20
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Do you have a testcase to reproduce it?

I wonder because we are freeing the device structure which is embedded
inside the adap structure, not the adap structure itself. Or?

> ---
>  drivers/i2c/i2c-core-base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 9f8dcd3..160d43e 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2301,8 +2301,8 @@ void i2c_put_adapter(struct i2c_adapter *adap)
>  	if (!adap)
>  		return;
> =20
> -	put_device(&adap->dev);
>  	module_put(adap->owner);
> +	put_device(&adap->dev);
>  }
>  EXPORT_SYMBOL(i2c_put_adapter);
> =20
> --=20
> 2.7.4
>=20

--H8ygTp4AXg6deix2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl53isAACgkQFA3kzBSg
KbYjVQ//YLOOhtSoKVw5BP0gfEP0MKQ3+62E6Jt3VnIw9lP/6HPEuLg47deiPSaq
cz1bI+JD3u+TlFemJtWKbFn/41I5musXXfDYzmOWrDa3iGJ4M2fTE6BuVkN87pvy
L3v7Lpbd8yvsA8QPX0UOgyuG0TURtw9T2ZYT3XVnjBeojTbISFaOPz0qyRuVQovn
S2Ov5aGgRtrHPfsVOfSCKF9Wdq5dfjvQAeQVA7uiHILTvYjVLglUD4ugHjVl7jt+
Wpy2VAGfz+Ero6V3qSCuOQ7i628NZsg2XQ6dA1Awi8SbiUfE9/LzAfDjRT2ot91U
JNfLSWQvGCOUfQzLZjkk4WzkF2Q91ocuzpHNatnusnwb+CRAeH9VYsFjVC3qVHMD
bSWet/OpsbP3b0sz2U0VHmHvdStkwjw9Oczt3u8EC3RoiskUCdLDWDJKcbG8HUyx
giEmgXaEHKKZw/0Hx4Z1BircivOPboGohzO5mShLuVY69WbQAptjLC+EO2zw5fgg
rHwhKfc0lTZyfPV81ijcJqDHqMsnLsQLDfsU3h4W8fqGrw/Nr9AJu3FpkeCv1f6U
0R7QUWbA7SATR4MCGosdCfngwPAHZQ1FOQsOnfwICeXgbNrzuH5srHs4jm5pyOI2
WhM1EBvqtI2xCLiqNNUuLNT4QPF4VdxsdUdiE2xULM+IMsTkp9c=
=Urp0
-----END PGP SIGNATURE-----

--H8ygTp4AXg6deix2--
