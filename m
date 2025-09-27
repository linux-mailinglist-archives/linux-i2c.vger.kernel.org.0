Return-Path: <linux-i2c+bounces-13229-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D88BA5D2B
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 11:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 378C22A0641
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 09:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4262D6E54;
	Sat, 27 Sep 2025 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="SjeJHjMJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A4419D8A8;
	Sat, 27 Sep 2025 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758966948; cv=none; b=cKlva0NLau+WGBcQU7D1cehusKAve7yicTtjMkaVEVbtBdv/XEZ5mBh1zZuo3/HYBBQrBL6iTKYPMMblQYH9Htp06vCgiDK3guunq3kGjzrTVxhcxUf+h8zGkqzfRX6L2RKeXQ94xDqFyhIJQbGESLnizKwNsj1MIhME4+WMQzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758966948; c=relaxed/simple;
	bh=vZYRM9We68PY5bzW+mep7saHNgFyKx1w2gIgo8SgjhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eT5L259YXFiucZSedhIui3C5wEajLxUpagUoXCrksAoeX6vIyHFVyUV+t5zFRVEOI5WYRwAGYQj8Gd5r2VZK6YUvZH/87kb1AOgju4JvgxPy+RBBLOeheq9bvmIK0jYAp7yGc0ULOF4w0Uj7zpgrtmAYvuC027Y1pLzsJYKlvds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=SjeJHjMJ; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: by dvalin.narfation.org (Postfix) id 7E4F12009B;
	Sat, 27 Sep 2025 09:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1758966945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NrSAgxU+9YeCHtVaP0jKYn4zosRC1XzjUsd/n3nJXIc=;
	b=SjeJHjMJQDZuFMwR+RzUJoFTy5PkdmJX8fO/IXKQSi4rA+uITiu7SRkWlKjOnbwm3H/3Wt
	rTC2vKXRTqN28ZumCgp+jeV9Xrgss0jJcndfbGiDZj6Ezm4jBTTi70meb7Mwi1q69RARXN
	onkdyFyvO+uaD8anokOLxLyyvfvmtZg=
From: Sven Eckelmann <sven@narfation.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jonas Jelonek <jelonek.jonas@gmail.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Harshal Gohel <hg@simonwunderlich.de>,
 Simon Wunderlich <sw@simonwunderlich.de>, Andi Shyti <andi.shyti@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject:
 Re: [PATCH i2c-host v6] i2c: rtl9300: Implement I2C block read and write
Date: Sat, 27 Sep 2025 11:55:42 +0200
Message-ID: <13214546.O9o76ZdvQC@sven-desktop>
In-Reply-To: <aNZQnlUML0jIhXIM@shikoro>
References:
 <20250926-i2c-rtl9300-multi-byte-v6-1-a2d7d8926105@narfation.org>
 <1838669.VLH7GnMWUR@ripper> <aNZQnlUML0jIhXIM@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6390856.DvuYhMxLoT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart6390856.DvuYhMxLoT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Sat, 27 Sep 2025 11:55:42 +0200
Message-ID: <13214546.O9o76ZdvQC@sven-desktop>
In-Reply-To: <aNZQnlUML0jIhXIM@shikoro>
MIME-Version: 1.0

On Friday, 26 September 2025 10:36:46 CEST Wolfram Sang wrote:
> On Fri, Sep 26, 2025 at 10:34:40AM +0200, Sven Eckelmann wrote:
> > On Friday, 26 September 2025 10:16:19 CEST Jonas Jelonek wrote:
> > > Thanks for taking care of this quickly.
> > > Maybe we should include another patch here which fixes the committed version
> > > of my patch, i.e. removing I2C_FUNC_SMBUS_I2C_BLOCK, with CC to stable. Since
> > > the patch was also merged to stable, it is somewhat broken there now.
> > 
> > Yes, sounds good. Will submit it [1] tomorrow after the ~24h dwell time (if no 
> > one else requests anything different).
> 
> I am getting a little confused already, so please make sure I know which
> patches to apply where in what order.

Understandable, there was a lot going on at the same time for this niche i2c 
host driver. Please check the "Order" in 
https://lore.kernel.org/r/20250927-i2c-rtl9300-multi-byte-v7-0-c0fd0e78b818@narfation.org

Kind regards,
	Sven
--nextPart6390856.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaNe0ngAKCRBND3cr0xT1
yx/4AP96lqHWOBRWXDAhxg3asK2u2BXqd5Tz2nevvpr7U7N6hAEAno2TbZh9DaDS
xE0qWFUyZenBR0PD7DwolpZ08CHd9Qg=
=G/Hv
-----END PGP SIGNATURE-----

--nextPart6390856.DvuYhMxLoT--




