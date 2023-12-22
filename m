Return-Path: <linux-i2c+bounces-948-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1191781C799
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 10:51:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0AB62875FA
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 09:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E63FBE8;
	Fri, 22 Dec 2023 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VZHshSW/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9272CFBE4
	for <linux-i2c@vger.kernel.org>; Fri, 22 Dec 2023 09:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D02FC433C7;
	Fri, 22 Dec 2023 09:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703238673;
	bh=NQhigQIaLQFBOJ9ISdMPF6RvM307oX4mSNpdsA6E3M4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VZHshSW/Vrbiqes9iu42ys5jcB4BSVrbqN2s3XShy7bWtXkk3jom+p0PMR2WDJ5YB
	 XEQIfLwGsgMrEjTsX/Zpje2//p5KLdIjQvz2QKik6LYGSgc3ulz2xM0cYgN9VjR4eT
	 VqRlk+chLy6NN9u1eGfofEZWzs3N4zj3whHUsMImvYMphfJvJFmL5caxniBWaJnfns
	 DBf/ee0rjzt2e8R87s/4OJnnj0FTS5gNl60nHcphSKmuLp2Ig2JtOQ3szQkF4G3luG
	 8aTVY0zuNR7na1vzw81TjEaGJzv6v8J2ZIJffiz6dZtxLeAone4OGUV4oIRshrydtb
	 kzgL8oAi1qzIQ==
Date: Fri, 22 Dec 2023 10:51:09 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v3 06/12] i2c: wmt: delete .remove_new
Message-ID: <ZYVcDUnv3Y6x0HHa@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
References: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
 <5b4dc259cb10e8e8c4a1dcb2aab37f2d4d89dbef.1698889581.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n2sq/V7PM8yR6Co6"
Content-Disposition: inline
In-Reply-To: <5b4dc259cb10e8e8c4a1dcb2aab37f2d4d89dbef.1698889581.git.hanshu-oc@zhaoxin.com>


--n2sq/V7PM8yR6Co6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> -	/* Disable interrupts, clock and delete adapter */
> -	writew(0, i2c_dev->base + REG_IMR);
> -	clk_disable_unprepare(i2c_dev->clk);

NACK to this patch. The above lines are very important and need to stay.
It is, in fact, very dangerous to use devm_* and to not take care that
interrupts are disabled before leaving remove().

I'd suggest to simply drop this patch.

> -	i2c_del_adapter(&i2c_dev->adapter);
> +	return devm_i2c_add_adapter(&pdev->dev, &i2c_dev->adapter);
>  }
> =20
>  static const struct of_device_id wmt_i2c_dt_ids[] =3D {
> @@ -402,7 +388,6 @@ static const struct of_device_id wmt_i2c_dt_ids[] =3D=
 {
> =20
>  static struct platform_driver wmt_i2c_driver =3D {
>  	.probe		=3D wmt_i2c_probe,
> -	.remove_new	=3D wmt_i2c_remove,
>  	.driver		=3D {
>  		.name	=3D "wmt-i2c",
>  		.of_match_table =3D wmt_i2c_dt_ids,
> --=20
> 2.34.1
>=20

--n2sq/V7PM8yR6Co6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFXA0ACgkQFA3kzBSg
KbZTdw/+ISLxgRN0RcDAEjhqC6FfCSMkda9wNZi7Zo4hDQkCf3V/g/5Zxj+TiyGk
4OcBqqA8g7TbQnKQfP0zwX7/0NzVPdAqtifc/TF10EqKY1IodsVuEXzDIuXsRXuP
SWY59ltdo3NN7ABTLueXcSar1aK0REH/3t7oSPt5LjZZI8MzJuNHBDbjoaeNLvYR
dI908MjEdh4rvGfqrjVTqhFAk6tvnRUqCJtkrLPOkMpYr3hMnCbi9mF1j9zIfNac
R/CYmVCm/0qMIYlH3KdeCtMDgRJrQpPYVVpjzbniS7aHBaM5XRT6JCyMxaBZnx2V
yUP4/Hkxdm1Xb5PqhOTMqHcUXqnRc3vybbMcCClop/uyix7C3o4RTaOu0Z28ocso
UwWkIo9/H3wHx0UDoMh1P9NMOOdE3se8Tfqj3qofex15AhluCiZdz9JHT6M6g3zS
IFR/Xc9gKvDiFuUUgqLkAERHuS64NmvkKff9UEbSXzx4uXDL5p8tohxb2GgGwIFH
A9mhNjxuj3GT09O0h0qza4rwVHXC0N4yy527GdqFBrP0vB+sH8NktyeAcwLpqDBH
jduEFO8pB23ayZ1XEik1UnsP9uCz/LqoSux1o6usXHTYh3TtL0pbXYQvrIdQpPNP
KOgIZMf+Qgu4gIcXPWSY0hRU/yr3cZAxrlhguQRtth6oRGmHPk4=
=CjRO
-----END PGP SIGNATURE-----

--n2sq/V7PM8yR6Co6--

