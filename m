Return-Path: <linux-i2c+bounces-13200-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 258D9BA2F6C
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 10:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60D601BC52F4
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 08:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EBA291C1E;
	Fri, 26 Sep 2025 08:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="2TpVmVGJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A777028468E;
	Fri, 26 Sep 2025 08:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758875687; cv=none; b=Ilov3N3QHywmS+h33NLGPaT8xu0UoLBr3YraraqYSe7neiQV1LUmJf8FXPg28oWw50jpL7teA2z8sgpG+u62463SxzRQ0laBnvKWVI3muKiBU4VcXggIDE9Rn1VDL3Aov6TBgiC64AGfWhaATu1t8SJ1wDDAKryo9LZv9glTfUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758875687; c=relaxed/simple;
	bh=e7bC5dq79R0/pER0WTMpPyYrC1z5CQDbs4cXjxBNCZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZCnAEJexSsbpcFGUlyKD9Ghp36/IlQZRjJPHLpBF8EVTWTKlk2wTs+TIdz4C/mv80ptnoX+MVAlrSjCAAfViU9uwhG9856wV2HQhfS/GdKKJ5OZxsIhtvtEiN3j5O+SWMZfs+hyITwJzP3QIW0xOtKB2G9ZLVAHO3VlJIJkH0YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=2TpVmVGJ; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: by dvalin.narfation.org (Postfix) id 174EF1FF81;
	Fri, 26 Sep 2025 08:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1758875683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9XrSAzEucZFOR6gasbmAqA8NKfemBpNqV2GtSG31dZc=;
	b=2TpVmVGJDnsM/KR2PdQeimUKDYa6pDctXGELfRRFb1d7lhh5UqjIpmTzfrfbDat5mj7Lwm
	0kWc5o316hcsPL1vyVZDZWnhB1jFwpj63Rdo6ntWJkLyFmRfb9lO21uzLS82RLWY4Hxa8K
	/conjNbdBlL9y6P3zGA2Pn2GeloTcoI=
From: Sven Eckelmann <sven@narfation.org>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Harshal Gohel <hg@simonwunderlich.de>,
 Simon Wunderlich <sw@simonwunderlich.de>, Andi Shyti <andi.shyti@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject:
 Re: [PATCH i2c-host v6] i2c: rtl9300: Implement I2C block read and write
Date: Fri, 26 Sep 2025 10:34:40 +0200
Message-ID: <1838669.VLH7GnMWUR@ripper>
In-Reply-To: <f62668cb-ad01-495e-86c3-82f92fa5ad90@gmail.com>
References:
 <20250926-i2c-rtl9300-multi-byte-v6-1-a2d7d8926105@narfation.org>
 <f62668cb-ad01-495e-86c3-82f92fa5ad90@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart8626536.NyiUUSuA9g";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart8626536.NyiUUSuA9g
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Date: Fri, 26 Sep 2025 10:34:40 +0200
Message-ID: <1838669.VLH7GnMWUR@ripper>
In-Reply-To: <f62668cb-ad01-495e-86c3-82f92fa5ad90@gmail.com>
MIME-Version: 1.0

On Friday, 26 September 2025 10:16:19 CEST Jonas Jelonek wrote:
> Thanks for taking care of this quickly.
> Maybe we should include another patch here which fixes the committed version
> of my patch, i.e. removing I2C_FUNC_SMBUS_I2C_BLOCK, with CC to stable. Since
> the patch was also merged to stable, it is somewhat broken there now.

Yes, sounds good. Will submit it [1] tomorrow after the ~24h dwell time (if no 
one else requests anything different).

Kind regards,
	Sven

[1] https://git.open-mesh.org/linux-merge.git/log/?h=b4/i2c-rtl9300-multi-byte
--nextPart8626536.NyiUUSuA9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaNZQIAAKCRBND3cr0xT1
y7chAPsF660TksdGuA5+SMesRqo5wB4PizTEzjzF0XszWFKL0gEAzwlFr5aMprGu
oW0uigo4g8iSv6BEli+p3EcTzZABPgc=
=o6t8
-----END PGP SIGNATURE-----

--nextPart8626536.NyiUUSuA9g--




