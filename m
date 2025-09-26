Return-Path: <linux-i2c+bounces-13201-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24481BA2F8A
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 10:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7539C1BC5B74
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 08:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E9B292B44;
	Fri, 26 Sep 2025 08:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HoxS6S1I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02372877D2
	for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 08:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758875810; cv=none; b=WJByGS0aNReNkCwJxXNhsTqWbDLDlb0KbiL4m6ldfAk0/4GxyXvnJ/oG5D4MZlnmILdC/rRwzLxj0A99aer3u80OP2q3IjgQy+5T0OlDTpVyIGd04HBT1QpOTaHlSsNP6rv2qWFmCI2L9YgglkZCXw9i65XrpU+toykF+6tQpa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758875810; c=relaxed/simple;
	bh=AyoP09dzhKaJvyx2bCcuFsSFwVxCWxPhWMr1szx8ePM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+AycWeUtW2nKo86yGd3SYBKAGbLASoAv76T89LZq74bg830xPk1+IVSZtvKvw9AC98aicgbl3gNDCg1uvW2Jr/X4XCZqqdcMzD25F7tAgdo3sLVUnpxE/dNCdwcOA+hd33RnG+cphNBO42Z1ka9nt73rjRoXTdKyxEo3CAl4/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HoxS6S1I; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=AyoP
	09dzhKaJvyx2bCcuFsSFwVxCWxPhWMr1szx8ePM=; b=HoxS6S1INt5tx8m8B0H3
	e03M01Bmsxi6wX/MICeyzunPDX+81v8VyDYFdutvUQe4UXpFAFQSJIz+MzFl0+gu
	DMRfbR0pfFYjZiU5ImKBKCuGnHX8u/BNPaBZOsg11MLRLEXbrXHwxXLesQFfBeG7
	06aNby6E2riBARQKZB/M9w8KiTv+TIxep9mpnV7h3QUXqp6XFdKuLegNNIOQQxEX
	EdIGYqfAgS0xWYFXLvbuVKbs5w4jdIpkrLdhdpaAV93P/v8sMhz/0WFisYxuGeO4
	2xuzm8oBPx+qwR9yKNFqRQS6wrjlSe49+cQenV+iS6Mmk1bysP3j3TYKj1YoYf4Z
	sg==
Received: (qmail 2185253 invoked from network); 26 Sep 2025 10:36:46 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2025 10:36:46 +0200
X-UD-Smtp-Session: l3s3148p1@1U2mL7A/hLUgAwDPXwQHAL/S9V79e5yL
Date: Fri, 26 Sep 2025 10:36:46 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sven Eckelmann <sven@narfation.org>
Cc: Jonas Jelonek <jelonek.jonas@gmail.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Harshal Gohel <hg@simonwunderlich.de>,
	Simon Wunderlich <sw@simonwunderlich.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH i2c-host v6] i2c: rtl9300: Implement I2C block read and
 write
Message-ID: <aNZQnlUML0jIhXIM@shikoro>
References: <20250926-i2c-rtl9300-multi-byte-v6-1-a2d7d8926105@narfation.org>
 <f62668cb-ad01-495e-86c3-82f92fa5ad90@gmail.com>
 <1838669.VLH7GnMWUR@ripper>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bNfsYQOh5oOXa3OE"
Content-Disposition: inline
In-Reply-To: <1838669.VLH7GnMWUR@ripper>


--bNfsYQOh5oOXa3OE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 10:34:40AM +0200, Sven Eckelmann wrote:
> On Friday, 26 September 2025 10:16:19 CEST Jonas Jelonek wrote:
> > Thanks for taking care of this quickly.
> > Maybe we should include another patch here which fixes the committed ve=
rsion
> > of my patch, i.e. removing I2C_FUNC_SMBUS_I2C_BLOCK, with CC to stable.=
 Since
> > the patch was also merged to stable, it is somewhat broken there now.
>=20
> Yes, sounds good. Will submit it [1] tomorrow after the ~24h dwell time (=
if no=20
> one else requests anything different).

I am getting a little confused already, so please make sure I know which
patches to apply where in what order.


--bNfsYQOh5oOXa3OE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjWUJ4ACgkQFA3kzBSg
KbYfpg/9FFUP/XnZDYRIzij6nnuEkFAW7LWuuHstXrNzef3o/ZvN+RyRmHw0/9+9
PsoGud2DG7R7T7cz1rf4Jprue+YV/WXw2peeCjOlASGG/gL5Osoy2L9qGUVHYhJ5
uGjkCViXShKWBE3IxCQ6JtmMQ81o8ksR4iqK7Xd6cl8eWyIgmiKUMZlWbame0sFX
a4+BqCkAib/LWd7oeBtw2Zg7/p2D6QQ0DlVxifbypXrRVlC3TgpCbwL/v7GaftY8
P9F8i0sdIhzGhsQ+7+u1ArilSoxqPl/wKdJN1+9c1Z+5lztAibvG6fe55OtvYh28
27zJbzxwfC/9wQ0XwJeE9pABHc0tv1c3nW0KkIrX9HFtsbDTNvQFyZRXOj45XUlC
ner/wQRGVX1hwAoSFcWk0utJbE0Nq3jr3XoFccGQbw7RRrQsXEzPK4fiMe7jiasR
byZUsv62I2OqcA+1hzd+9ibd+q7UEAngFV5d9i1AcmJU/GntQZPXDlqTaNT8lfBk
nE3kVgAMuFe4K+HBjTaQBvzPlAvkF5MxQekAHQCVtuJNKQAm5HNR35dUfes8D/Zw
9ag+vhVNmhhD2ogHsMfP8W8mkq80UiUBwMwj0x54qv+D+RU1LJbsKkymmezj1pjZ
y1D2AasPc5N1qFgaP8JKzEip3xNeC//IGHqtFrgg3lqc2NUAXGs=
=c21p
-----END PGP SIGNATURE-----

--bNfsYQOh5oOXa3OE--

