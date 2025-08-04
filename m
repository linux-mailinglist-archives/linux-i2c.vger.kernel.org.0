Return-Path: <linux-i2c+bounces-12140-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0932AB19D77
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 10:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EFC854E0F1A
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 08:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89922405ED;
	Mon,  4 Aug 2025 08:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="kt2tlI++"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B28423FC49;
	Mon,  4 Aug 2025 08:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754295542; cv=none; b=KxhMJxQD0Aa2nvoyI4YvHkX+O2bOS2oEM6CkWciLz8juAOUsbMw1iIr7kdBJ13Ya+lT4IgR9ALGTzt/RH2xtKe3uun1/Kb0sylj9TjlcUJd978JBMNYGbGqD4y0SsdP+LcXWrOAF9KR/DwLvpIBKebpskj1CMSp7kK9eS05D4pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754295542; c=relaxed/simple;
	bh=g6EJh1n2WSQD/1vG/Is0MzDNH630mElXTom5J7MZbNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hu5WVvLprBnNDP9DRVjRD0mVzIUn3xi+HAOAynMdYrE6sC1kCbKnA4S/iS4T9DoRuV+ydP7mHFq0AuKSILcQ8sCwo7Z9oQ8Og2iYecUPwJ0WP203YawqkAfDhAaskn49CfymjXbkQwEUKsN2kbM5EpaArFBXSOR4GNp0WPrzrR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=kt2tlI++; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754295536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hFEfCpN1HAzXaCGydWyLSkODJhZU2UgS6N8Bxt3onNg=;
	b=kt2tlI++idWEPuv563+cG/w7jOTmN37N5mU8055rGAaUhSF92XeSE7lMuxVvdRhP36vW9x
	GEssdHGIHPCx2q/kXBbtXTYj/4Ty+L3YdPgDH8IfreFE4VnX102dlGrtaQZFEePcLCTN6m
	j/lwGMhNQU9c1r0tOkxf7PLGF6IYiA8=
From: Sven Eckelmann <sven@narfation.org>
To: chris.packham@alliedtelesis.co.nz, Alex Guo <alexguo1023@gmail.com>
Cc: alexguo1023@gmail.com, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] i2c: rtl9300: Fix out-of-bounds bug in rtl9300_i2c_smbus_xfer
Date: Mon, 04 Aug 2025 10:18:53 +0200
Message-ID: <4670491.LvFx2qVVIh@ripper>
In-Reply-To: <20250615235248.529019-1-alexguo1023@gmail.com>
References: <20250615235248.529019-1-alexguo1023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2378689.ElGaqSPkdT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2378689.ElGaqSPkdT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Mon, 04 Aug 2025 10:18:53 +0200
Message-ID: <4670491.LvFx2qVVIh@ripper>
In-Reply-To: <20250615235248.529019-1-alexguo1023@gmail.com>
References: <20250615235248.529019-1-alexguo1023@gmail.com>
MIME-Version: 1.0

On Monday, 16 June 2025 01:52:48 CEST Alex Guo wrote:
> The data->block[0] variable comes from user. Without proper check,
> the variable may be very large to cause an out-of-bounds bug.
> 
> Fix this bug by checking the value of data->block[0] first.
> 
> Similar commit:
> 1. commit 39244cc7548 ("i2c: ismt: Fix an out-of-bounds bug in
> ismt_access()")
> 2. commit 92fbb6d1296 ("i2c: xgene-slimpro: Fix out-of-bounds
> bug in xgene_slimpro_i2c_xfer()")
[...]

Please correct me but it looks like this fix was not yet applied to the tree. 
But Chris Packham pointed out that this conflicts with my fixes for SMBUS/
SMBUS_I2C.

I would like to add my patchset on top of this (to avoid problems with stable 
submission) and add the Fixes: and Cc: stable@vger.kernel.org.

I hope it is ok for you when I would pick this up. I would resubmit the fixes 
patchset this evening (GMT+2).

You can preview it at 
https://git.open-mesh.org/linux-merge.git/log/?h=b4/i2c-rtl9300-multi-byte

Kind regards,
	Sven

--nextPart2378689.ElGaqSPkdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaJBs7QAKCRBND3cr0xT1
ywisAP0eSnn6q6yqwv0DyAHN499wiytQiZnH8612kZq7cUp+BgD/bkvf677SatPE
BN7ZUMGkQX4Pgg/l8xtAjxbDr+YLgAU=
=kfms
-----END PGP SIGNATURE-----

--nextPart2378689.ElGaqSPkdT--




