Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58C7954BAE0
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 21:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbiFNTpw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 15:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232052AbiFNTpv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 15:45:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85F32F653;
        Tue, 14 Jun 2022 12:45:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A90B9B81A49;
        Tue, 14 Jun 2022 19:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54EAFC3411B;
        Tue, 14 Jun 2022 19:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655235947;
        bh=sRj9QqcT3Nw4rNOZc0Sbv8PIRN6PrIu3+9GiIRKgDBY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LSqI/o5pKIw/X4uduqTGfcLjZKmD7BvPMU41XiC72p/1iDKVUiM9OghN+eVGkKFLn
         FReJ1SokdCrzvacvn5qSDUi63pNYcuWcPcOtgnw6L7Cq+8Er6UtOvSbl2e5QoFhVFU
         R4m9LRABi0zWh3bDmXE2kjMk7IlZbxIe+e7G7wkvJXzXXAKduWeICDkIN74MZ16OlN
         ot6tFHcZbdNtdgX6KFhF4r74cjGNy4DN73FJk/bz8oeRCYk/4v3JNaHVNgJFnuYGLX
         6IZNBHfO2B+4AqxD+tVDjvWjmDcaGYfHFvaK2AuNnunu0gf62/8o6ZBi0TlJX1dwHi
         oGDFhUMULRKtg==
Date:   Tue, 14 Jun 2022 21:45:42 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: core: fix potential use-after-free on adapter
 removal
Message-ID: <YqjlZuFGl0dAUZyd@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <a9dc272e4e06db661125b7b4c330821b532afc4d.1642209079.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UZJMXc0kkQpxFheL"
Content-Disposition: inline
In-Reply-To: <a9dc272e4e06db661125b7b4c330821b532afc4d.1642209079.git.mirq-linux@rere.qmqm.pl>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UZJMXc0kkQpxFheL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Micha=C5=82,

I finally had a look at your patch...

> put_device(&adap->dev) might free the memory pointed to by `adap`,
> so we shouldn't read adap->owner after that.
>=20
> Fix by saving module pointer before calling put_device().

=2E.. and found a different approach for this problem from 2019:

http://patchwork.ozlabs.org/project/linux-i2c/patch/1577439272-10362-1-git-=
send-email-vulab@iscas.ac.cn/

I think this is also proper. I found other subsystems in the kernel
first putting the module, then the device. Do you see problems with the
above patch?

Thanks for looking into the issue!

   Wolfram

>=20
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/i2c/i2c-core-base.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 2c59dd748a49..5d694f8ce9ef 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2464,11 +2464,14 @@ EXPORT_SYMBOL(i2c_get_adapter);
> =20
>  void i2c_put_adapter(struct i2c_adapter *adap)
>  {
> +	struct module *owner;
> +
>  	if (!adap)
>  		return;
> =20
> +	owner =3D adap->owner;
>  	put_device(&adap->dev);
> -	module_put(adap->owner);
> +	module_put(owner);
>  }
>  EXPORT_SYMBOL(i2c_put_adapter);
> =20
> --=20
> 2.30.2
>=20

--UZJMXc0kkQpxFheL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKo5WEACgkQFA3kzBSg
KbY6JA//aK2Xf/g0uNzKw+J1YzA4kzVCkNfx/EeJKT8BpsZVb4Vse4EZaaBn4TFi
jvNLEVsVL4noVL7AlA2nPAspcYy9kPMnf9JHJmNOtdUEL6ZHnBuaHspeIEVHhMVb
EHp6i6WYLtTmsNjKI6J+d7HAwVLfoIyNqZ7MHlCF0/0+a180qZC6LFdkocMgmCAB
WAbqb7olP/q6rsUzCgRQ5IMgWwbRSpcw5lKkV4vaEe1RuzhsRjNmrFi8jXan2vOw
+bKSvaA9+nFO8C1MwT3xzhor/e+VlzjmgfwC8L41/t/7UfIdq/GBmIRbyvhztyqc
0LZtT7gzaN9ACAVBLB51gpUcJ5wSb92Ovq2wYpWXvlYKMKLqXtGw95iszQv58bPn
JwLNLmaNCvUWKGgOgMk5Sd8JWMugh7CliA6ZolExeXg8q1elC0gonQbeh/qMzGrv
usaoOAigIqkyct6beot8MCwD900Dg81fqJIkADW8Dk2VV7Fdv+2qh7+XQqGprmAP
aXZkBvgP1W6bECXRG/MmUi/6J7FREgPhvjXD5Ayq7GYOwaJ8fZQzkxQb2FoIgHlr
ajMfIaxGGWqtTTa5bdTi8bfooLL5+jiizmL8hhxP52q1uHK5frVNOwZPyFaOk04M
7DGMmvNnFHqcBdvnTXrhHyAF5WVNilBFBv5UV5NTdcHuCHX4aRo=
=O5Us
-----END PGP SIGNATURE-----

--UZJMXc0kkQpxFheL--
