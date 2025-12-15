Return-Path: <linux-i2c+bounces-14536-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4AFCBCAA3
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 07:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D1893012BD5
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 06:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C30E30BB82;
	Mon, 15 Dec 2025 06:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dvI6p0RY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23C22F0C7A
	for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 06:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765780863; cv=none; b=MTXpClbGNSYiBqxQRLzS/aVr5uHvzRstOl46NsqQY3H+wFs0TXaodWKmCVPj199A275/5OqHvZ3W9344AgFV1q0C11l02a2PhIsS1bFcJYIfACTodI16cj4ctwF71IeLXeGx/1PzygQXmBSHYFa6TZk9WLOpf+4uSwIOzUryWDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765780863; c=relaxed/simple;
	bh=bovRohOjrnspp3eGzmgPrlXPHskRpn9wXmWdGvm8o2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZGe2gPvgrLxiJhMFGJf7Nze1Gu22XYEMna2S6ZfumicE5ReLjNO2+ldG1ZUY+ti6L3g1wenWSvF6TvlJIA0LLut5dcXRAoSsFzpbIYaU5Xiu8XokryN2xfgXisBZOCMFFkJOEiL8uj9ZC2K+nDJDZXaH6f9ptQUqH0p49WojGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dvI6p0RY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HIIh
	FfQq12NCHXfgja4uUWzHo6u0L/7RP7RNsE2kKqA=; b=dvI6p0RY8JaXcUX5RIR8
	gwVjym31AVczgxqOdy8LPhcVCJCBtjfPZNnjTxOBMxOvl9BRnIRwlTYwNzYm0YFP
	LuB8PRSiUFEHg2t1NLRDweiByv1G4nIgjgmVLP9+m62U0NKUu4yMWOn90772bqNJ
	HxaY7RMTk/XhMec7WrypXB+e6DUJsgXTSDjX/CS1RSSLtpbwcOiqmgjBTgWmWeQt
	bYVnfR91EbA0Ovw+hEEFP2nbIrw0ujfiMM/RYIyVc6AwCLObCZT+BGzBM3s8Fxhk
	l9fc/OtfORK3r96Q763F+pkg0tfK/niw6ha65ivG3bHekVyt3DUZG1ydKzTJoH3c
	jg==
Received: (qmail 863878 invoked from network); 15 Dec 2025 07:40:54 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Dec 2025 07:40:54 +0100
X-UD-Smtp-Session: l3s3148p1@KXwL5PdFr8HN3IHi
Date: Mon, 15 Dec 2025 15:40:43 +0900
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: i2c-host for v6.19, part 2
Message-ID: <aT-ta1j1JB0FOiMK@shikoro>
References: <tm7m6za7jhdmq3rqdmutir65yw2mo4qty6qonsfyjgsqxdsl3w@dvom6ilx4vhc>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dr0nGRMS1Lswajhi"
Content-Disposition: inline
In-Reply-To: <tm7m6za7jhdmq3rqdmutir65yw2mo4qty6qonsfyjgsqxdsl3w@dvom6ilx4vhc>


--dr0nGRMS1Lswajhi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> here is the second part of the pull request for this merge
> window.

as you could notice, I was not able to do a second pull request parallel
to the conferences. I am sorry about that, but since most patches in
here are rc1-cleanups or ID additions, I think I can send them for -rc2.
Except...

>       i2c: designware: Optimize flag reading in i2c_dw_read()
>       i2c: designware: Sort compatible strings in alphabetical order
>       i2c: designware: Add dedicated algorithm for AMD NAVI

... these three, sadly, they are beyond bugfixes and cleanups. They
don't look super urgent, though, so while it is a bit sad, it is not
blocking anything else. So, could you kindly:

a) send me a PR for rc2 without the above three patches

b) put the three patches into your branch for 6.20?

?

Thank you, and I wish us good luck with the next cycle :)

   Wolfram


--dr0nGRMS1Lswajhi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmk/rWcACgkQFA3kzBSg
KbavnA/9FGsLROChO2mpdT6Kdcu60jLeMl5M7H7DEQF9QzOQn4wPB0vrkCXY02rb
zT09v0PtJ8dW01y4rJx4HYAfcSQw1naG+zRb6I2rjuKam79W/vLH3DuWMYyy4QOQ
EKv23L8OIRmGAxxuFuTt0yo6opjsuXcA2OjTO8TFVkIDBKFqucZTywW20g8SRHTc
jWThzO4yGIzhsKzKB4NlHZkBAA2MHm5WNBU2lFGeYwnzaj3eUpNjHOZFkPIEDX0b
aP12Haps5nqPoRjIcd1KRtNTYCE+EPD1B/ZW42dfJa4Zj0rhNRoOrae+n3TD00Rs
EpaporY6oGREPlevYIzyJQJpI0tEhyq23DpPyuOLZgQdUZksnYem2d9GXI+c7lO8
+xb/Z0r4nxTiNTCD/zWgPwplJL3vXIfho18H3sVoBqpTshlY42DI5yY848OCXFG9
fOk1Z0Ix6CWr7XWxz9RO6dtJbv3UqGxSCYFnPnKAkFHV47oA39cyu6qXaeW5rFLb
DVxtV9/FMi2CM5zcE8CFyCVgA8/9zBPS7b8IgwzpmAl3+fCdfyjq6xWlwmPGyhZ3
LVH7NlxIYog3Va+LhqAAlCtRG3wu88Jim4zXfFhsWhXoElc69N2yw2jeucEI2WqO
0T+00ID/FKfTm1efq3j2u6soB63gIJ81SosOiEmWZGWr/xmomxc=
=Ijgc
-----END PGP SIGNATURE-----

--dr0nGRMS1Lswajhi--

