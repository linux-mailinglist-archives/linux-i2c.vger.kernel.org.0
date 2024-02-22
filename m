Return-Path: <linux-i2c+bounces-1910-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E3485F272
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 09:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C56D128938D
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 08:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980421CF9C;
	Thu, 22 Feb 2024 08:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="di7usoBB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED361B819
	for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 08:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708589127; cv=none; b=ldFNIT25OGVPIipGSy/JwOg2mQWI9qeMq1CTAqQbXOVM5VNk/cNjOGGryKSdUpuDb5xy8g86bUG5JU7KqfrUL9O4qK02pzcNbf7avNJKqIGglGvJxAEPonnKMY1+OXgUph0lR4EDZCAaKnUKZTNwEg83MpbNpLwittZyBPvSIvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708589127; c=relaxed/simple;
	bh=QL5xT9/jYZaLY0gNRestMnTY/ze839aLxh2Y3nXkWDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZGnPWoy7sIUzvghO4dmT04J4PH3ZhQdl6LNNK/aC7Rpmydu4ieSlrtYR9qJz8Q4nObWeknYamkvv7nXVmf2UravG+e+MbbElLmY4Txy/InRhATjCJMP5YLcFyXp2vibldS7NXl6mztmInsAcHiM/azSeiypCWDqSJUT52Cq4v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=di7usoBB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QL5x
	T9/jYZaLY0gNRestMnTY/ze839aLxh2Y3nXkWDg=; b=di7usoBBJBsxQs1NMKek
	tTJGWTrHfCkJN2PrZc+9jx7baqG2iebwjHqdY7F6zOF7YXw+Nr7/zyW7uNYR1ybl
	Cvc2bYWgx1HxswowvBtLDgfFIx91golS0DqYGlnAzDZnO06XN4sdUos7g/LVQmZN
	i4sC9pBVmFxPaxixJ990TspFn3vg2UTcvRkfgBW+1zjBCAwb9mApaS+M7JPfV2an
	tahTxGwoL0PZMe+dRBiB5eLsPP9TsyU5vYn5ekHXEDlMeH/3mD2dBblnmCgVFCdk
	oV5UsAwetD1Rio5pCn5D95BiJxeZvGiZtuAULfYkCqIRpa+KJVjpMOrW0p94+2U7
	sw==
Received: (qmail 3884259 invoked from network); 22 Feb 2024 09:05:16 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Feb 2024 09:05:16 +0100
X-UD-Smtp-Session: l3s3148p1@R3FP5/MR+qAujnsZ
Date: Thu, 22 Feb 2024 09:05:15 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	Corey Minyard <minyard@acm.org>,
	Andrew Manley <andrew.manley@sealingtech.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: imx: when being a target, mark the last read as
 processed
Message-ID: <ZdcAOwHWWYQZe3wE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	Corey Minyard <minyard@acm.org>,
	Andrew Manley <andrew.manley@sealingtech.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240221193013.14233-2-wsa+renesas@sang-engineering.com>
 <kgfagzj5vez56levwam6n6tzxl2lu7efnw5x3eadl3uophxism@ph2tghrvedg5>
 <ZdZ_PsNhQ9S1Eab-@shikoro>
 <Zdb-EHnTiez6KP-K@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jkgNTKjjcVM+jmPc"
Content-Disposition: inline
In-Reply-To: <Zdb-EHnTiez6KP-K@pengutronix.de>


--jkgNTKjjcVM+jmPc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 08:56:00AM +0100, Oleksij Rempel wrote:

> > > > When being a target, NAK from the controller means that all bytes h=
ave
> > > > been transferred. So, the last byte needs also to be marked as
> > > > 'processed'. Otherwise index registers of backends may not increase.
> > > >=20
> > > > Signed-off-by: Corey Minyard <minyard@acm.org>
> > > > Tested-by: Andrew Manley <andrew.manley@sealingtech.com>
> > > > Reviewed-by: Andrew Manley <andrew.manley@sealingtech.com>
> > > > Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > > > [wsa: fixed comment and commit message to properly describe the cas=
e]
> > > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > >=20
> > > is this a fix?
> >=20
> > In deed, it is:
> >=20
> > Fixes: f7414cd6923f ("i2c: imx: support slave mode for imx I2C driver")
>=20
> Looks good :)
> Are any action needed on my side?

Nope. All tags are still valid, I'd say, because I didn't change any code.

Thanks!


--jkgNTKjjcVM+jmPc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXXADsACgkQFA3kzBSg
KbbwkA/+LRNQhXhak4TaZVdgCFqaF4XuPEa1bzs9BwnBYsZG6iOWxmpOFVIS3PTw
/CkmYJqtfS7d8ZqePNBXVRZnOH65xX9is66PCtGt4ozPRw8D5QELzBJnsc4Em9ra
WeUofTGNtYr/0FBG+fypE8y7yf7XY3hQqeqhEq9s2+I5ONxybHu0TFxMKNgAXDjK
Ayc61UaPEOTiT+12Kg1HBWxxzX9FnqUP87JWY8x7o7tf0xN/zXuLs1wDIuH9gWZf
GSgs82aqU5mC4vz6TgZOiscwQxwYfqP8k3Ztj+53B9LzV3IeLeqiw1YGfWtM/wSU
GYUQUZdO8w79Fld5KePO/XJUU9v8mn8Ye3LF9dmtVpID3i6ByhCPIl/GX+NxGOfL
J7XFIgyGPOCq2WuEv9Gg7+OoiBLBv81CaYjPzVRAz73H59cgBDAvy/TFAAO7WYRz
wBmfC0Z8QbbnmD1sISc69HQBkdl1ymL4X/MQEn9j9/GfCGTKVH9ak/z/XFDzxJCB
aXejjwyHMKII+gm+jn3y8uGKthh0RRG7Fyzv0rZvLoqr7Qqmlq46TRz02vo97kiY
9F5YEZnNZokTJOF/xzSlgYtIMlLQTFuBBCuJ76m2ojXzHgvR3MCNPBQCtreHTfCg
B8mt1L3KFYmVwyHeAd7ARxs32a3NmMUxGv7zVy9SHh9E0x0GCq4=
=XJvn
-----END PGP SIGNATURE-----

--jkgNTKjjcVM+jmPc--

