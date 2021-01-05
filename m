Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5DF22EA840
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 11:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbhAEKK3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 05:10:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:57188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727766AbhAEKK3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 05:10:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8CAB224F9;
        Tue,  5 Jan 2021 10:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609841388;
        bh=HmyOizCQtTbylZzje0b7B8wp+VcKNzMquuZ2Q2QzkEU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pZEm4RCnd5uN5RtXj5yH5hIvkIAUy0ba5GJvzZOgCkgLrW8sqXO8RlSOQk0G+huZj
         uDzOP6EIpw+9xTTIjFAVkdPw1b4vpTjxSGKZDfrgBgBLOL/IxecP9OdrdqaaWBx8WZ
         v0NTcICEXdeRsA6b9pRr4OL/ivOPXa54J40oKsM/qavlyiyXSYw6ij8s0pWxJT/62q
         IF8aCREZHehnPEEdhim7RuxsgF2J1nYg+M5rdGS/wm4Njp8OK1OQbxHLxK6S3vyCSH
         UZinDRAETskreWuUNHG3G43pzHPHJ0S2Dt5XcerrPsVs82oKgeMH8eQgY0Mmt0K3L6
         AYpOx8HEUJdpw==
Date:   Tue, 5 Jan 2021 11:09:42 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     trix@redhat.com, Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: remove h from printk format specifier
Message-ID: <20210105100942.GC2000@ninjato>
References: <20201215183327.2072052-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Content-Disposition: inline
In-Reply-To: <20201215183327.2072052-1-trix@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 10:33:27AM -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
>=20
> See Documentation/core-api/printk-formats.rst.
> h should no longer be used in the format specifier for printk.
>=20
> Signed-off-by: Tom Rix <trix@redhat.com>

Adding Jean to CC. Jean, I'd think %02x would be better, what do you
think?

> ---
>  drivers/i2c/i2c-smbus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
> index d3d06e3b4f3b..5cd2cf84659e 100644
> --- a/drivers/i2c/i2c-smbus.c
> +++ b/drivers/i2c/i2c-smbus.c
> @@ -396,7 +396,7 @@ void i2c_register_spd(struct i2c_adapter *adap)
> =20
>  		if (!IS_ERR(i2c_new_scanned_device(adap, &info, addr_list, NULL))) {
>  			dev_info(&adap->dev,
> -				 "Successfully instantiated SPD at 0x%hx\n",
> +				 "Successfully instantiated SPD at 0x%x\n",
>  				 addr_list[0]);
>  			dimm_count--;
>  		}
> --=20
> 2.27.0
>=20

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0OuYACgkQFA3kzBSg
Kbb9eBAAmrMQ4FK1H+OtDnfVnNPa3ye/mWq/+PuJOzmVewqmtsKC4xA7Hk7HvrHO
BScpKEE02adiPmcPj6tN6v8C16ZgfFHhV+nPeIK/D2v5I15LfXFTjtRVXSMH/dcE
m+9gd9EUJsEXBM7jQAgkB46tcSIOJ9SZLvR4M5huVhFwKZOFrLspMsrSux+3Sajy
6jjUKxCuRsP5td0I1w+uIVgq9saS5WsYqof1AohOAU6AtWxxyHKLvUEWvO23JHNp
ZCzg4935TSoPyDP7j/WPo/0/rv5Zb7ZXp3AVu0374njCaF+ICqv1s55CJe1NLncX
LLIc6euq+jl8hT1GXuIbpVZZv6TTZPHAqsuQLv01tn/YQME/M1n37iMyo+m/KQgS
rU/qNtcToA4rCi1T5nN8grC1ulp7KLkQSg4DAt7b8LJXwFHdrPLTvqMjMXXJfAUw
gVHzyXJO/beE4/cjvZzOSj/RkISfU0DAplPGfDnjdYAjb5XniR/bj4p2Puq2sFqC
BpLyXbvkKFi5sYlau7zbqjpNXMbENufd2/o4ClVma9pyJtnC3Yt+n3Qj1ZiyTqFQ
7Aa9JvcAWuK7UXjXOcLhVDPYgtNmJL2IPXDPpbRPvEiluubrtBeD46EBTiDtD/3r
wwJJowtARwnU7cURMpOGcIfhan5ojSPHjD49o6zDS/Amc7McLCs=
=Mi4G
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--
