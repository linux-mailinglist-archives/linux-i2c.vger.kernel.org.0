Return-Path: <linux-i2c+bounces-819-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8152D813F97
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 03:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D14B1F22D43
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 02:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2F7A44;
	Fri, 15 Dec 2023 02:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ISAgexRu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DF1A38
	for <linux-i2c@vger.kernel.org>; Fri, 15 Dec 2023 02:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=TwBE
	iHEpUbhtrkorike2pkAY7DbUk61pqDisyiVmNIc=; b=ISAgexRuVWXqtud5L/8M
	WuMqnXw9WppTZycTirMNJF47efuX+/YwQAPP/WknMvuqu2jC0qV7hA5znD/bCpm6
	I//ObAk4sGby2IRK8Jxsxo8MiJqcrQ7WE557UL3AIkHtt2QsmFQAAa080CiohqXg
	wHwPSy7wWg3cw2RcHcHdgqPq35noSVSPym9QFPTtv8c7vdRAkSofsEQYcTpOVjJx
	V4+8UT7K0BEA0xrEVzC9QiQdMPt0v4lh9wjA4BHlV9hVKjrpcF6sdBqJFEcNHsUK
	2BJTQFu+1asElcKejFtSGR4OkagABKXIYK5uUf8o2pmC2Vyzq6KTJT3v4vJl5zRh
	Tw==
Received: (qmail 1100441 invoked from network); 15 Dec 2023 03:10:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Dec 2023 03:10:31 +0100
X-UD-Smtp-Session: l3s3148p1@ED5t54IMYMMujnuR
Date: Fri, 15 Dec 2023 03:10:28 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: rcar: add FastMode+ support for Gen4
Message-ID: <ZXu1lMgg8dc40PVC@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20231214074358.8711-1-wsa+renesas@sang-engineering.com>
 <20231214074358.8711-3-wsa+renesas@sang-engineering.com>
 <20231214205449.x7bbu7i7m52ihibz@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A/YQQ/mR7JlW/8CY"
Content-Disposition: inline
In-Reply-To: <20231214205449.x7bbu7i7m52ihibz@zenone.zhora.eu>


--A/YQQ/mR7JlW/8CY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> as we were here we could have written the register values as
> 0x%x, but it's also OK to keep the change with a minimal impact.

I think it is OK like it is because the datasheet also uses decimal
values in the formulas.

> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks!

   Wolfram


--A/YQQ/mR7JlW/8CY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmV7tZAACgkQFA3kzBSg
KbY/NA//fvFqdNgWEsXUtKHDPd6njCRFknId5nlIWCwqK0IEyEW3F+7DvNViRWg4
MW4fqfW2vFyXx62C2/hovPDfPwWy2ifJ2vvETPzmDnjJv3gOCOO5x7h43h21Fsg2
zBFz6CodLgXX+pc0mvUw7tJy85UspGwZlTwiq0iIzLuwyo3m9HwJu3yWU/xBslKf
2qVHOzJ9Xo1rAwx6B7AT5+7yTSiUYagJjG6JJjqn/VUJGcQoX0l5/PRoCVlsjz1C
29WJU8S1HIa/LI+EtPo+5TvmSN7o12uTK8EVWzFajtSgsMdiO5eMRm+C0HOzGdAA
t40tQIHS75BWkJAacsbY+BD7rP43Xoami+7ap36ww3b9KGTbHPiLAqcF+Di/5QBi
n9tUWG5tW0uH2KjVH13ygGAo7O7awvT4HpoIyIPuamyFBgmLguzX5oxWZwWI0bog
jNclfkv8zPGXUmVxnP1zygVp9p7Ec/eyF+GxbwsfejTYKRYLPKHFhrJ+/KQfkp1F
CE7wh53pEL151QFdXPwuD1x/ID7M5BeKhMc3Oyi4MAwq+xz04aRoGA/xEIkLMP0M
AUWhOAjjd0AoI7446crdb60TXsMxiRa0oi6/Ktcj3eG8EHFBHP1NCf0nYilV7r7X
dM+sAiaiq538+Ljo9vHcr8d9Ajwi1WxGvhM7fk2OQRqN70H9HAs=
=7mmp
-----END PGP SIGNATURE-----

--A/YQQ/mR7JlW/8CY--

