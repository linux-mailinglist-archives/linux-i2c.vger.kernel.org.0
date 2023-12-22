Return-Path: <linux-i2c+bounces-947-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACA981C794
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 10:48:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F3121F251F4
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 09:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6F0FBED;
	Fri, 22 Dec 2023 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8g3yywj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD26AFBE5
	for <linux-i2c@vger.kernel.org>; Fri, 22 Dec 2023 09:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B289BC433C8;
	Fri, 22 Dec 2023 09:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703238515;
	bh=HgWUu3jgLiF/HoUr4aEQ4OJhT6SnjVYCiVI9BJj4x84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C8g3yywjn9FsMA4+sFjx/8s5roswFxukqOU46JZ6HaxqpNs0CgI5s8lGX9DlmYq94
	 fzxAekFB0Bgc9hfXPxQJyHbg40bUxyWiUyMurz3HwKe2InVKfQ8+CqMe8m0zN4JhFO
	 OUAG0VzKZiUbr7UF6NbKI1EZNE2cXiRCsJf+Ccj+gTz1YwgsV/Jb8dOxdr2mqdKwr+
	 SNpeb/LaCjgSRNzxsnnb1/C+C0/6y007RbcOjMpeLM0GM1OEVKNehNKFa/8TufItvG
	 oOSZ4mcqRaMjns/AAkW76gO5A4/fV8ZuPu8gRpXqci7yaeYvErOirc27c4KoZgVcmW
	 FDPjVakS03zJg==
Date: Fri, 22 Dec 2023 10:48:32 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v3 05/12] i2c: wmt: Reduce redundant: function parameter
Message-ID: <ZYVbcK3vqQZgG0Pc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
References: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
 <a37db0cdf8d5a43cd90430361aac24cb4362847b.1698889581.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fS/0nGT/kBkKDXee"
Content-Disposition: inline
In-Reply-To: <a37db0cdf8d5a43cd90430361aac24cb4362847b.1698889581.git.hanshu-oc@zhaoxin.com>


--fS/0nGT/kBkKDXee
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2023 at 10:53:55AM +0800, Hans Hu wrote:
> Use more appropriate parameter passing to reduce the amount of code
>=20
> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
> ---

Because I like most cleanups here: applied to for-next, thanks!

But this patch likely reveals a bug in the driver:

> -static int wmt_i2c_read(struct i2c_adapter *adap, struct i2c_msg *pmsg,
> -			int last)
> +static int wmt_i2c_read(struct wmt_i2c_dev *i2c_dev, struct i2c_msg *pms=
g)

It is valid for an I2C transfer, that the last message is a read
message. So, instead of dropping it, I think the read function needs to
handle 'last' as well.

Because this bug is already present in the driver, and I don't want to
make rebasing a next version of this series too difficult, I argue that
we fix it after your changes are included.

Happy hacking!


--fS/0nGT/kBkKDXee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFW28ACgkQFA3kzBSg
KbZeJw//YcCiaL/x2KZAAJaKub7PWCyx0vEwxBhIlRTAMHtg1uZra8esCiQTQMYC
vq1Tpxo62v17Ve8eYFsAznPf7V4TKJoVcBMjEZGcROBiofMvgZDKFrsQw/zA+Vla
ZzvOxuM/jnFPIobUmTmeJz4j5ZRhgSK/XdSREgiLSq06qK91vUejkGlmAkDVTUwZ
SwRrQPpd0gHxIS3cX1kTczNrxN929m57XMRoeFJUpEeAWR2At65kGnseNYnN7PgU
50VqakfPYPVz17muduBzKaxFWWM0fkjO6Q264AMHlVYYq6jWNJ03cHj3+m5X/goi
GPi/p5T7Egul644WTotJDs5a02omGzZTeoK6ARwV+AO4PvTjrYcSY1Yl951sHoPi
GEDYPG7b13vM+01xUb89jbWvX8X6P2hMvFBDx/XxTIm5+YK2AppSivhidXLpz1ZU
IXKlP2B3SPqur9Z8cewQNjQe5POR0LMq/ZoOLRQEN8A3tYdDIdb8jpEp/iA/Oy3E
ESgZ0cMlztKbWQBElhnqqI779V47AgAjpzFmPcEM0rDD/tDOhqYkggYGX7ZP9cDQ
CSRFlwDXCfPr0hMx5H+iwyL0keGZKufz/u1n+YenS8IulTG1cLhxXxWUeMAvpLut
7zhXNPJYq6LjPPDs5Cflm1ynY8m1dZwaXwalKf1yij264FNstAc=
=dxDg
-----END PGP SIGNATURE-----

--fS/0nGT/kBkKDXee--

