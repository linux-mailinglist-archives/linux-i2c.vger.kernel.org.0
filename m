Return-Path: <linux-i2c+bounces-10376-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA01A8A8E0
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 22:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA9321894630
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 20:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5150A2528E1;
	Tue, 15 Apr 2025 20:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gXBsYPGF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF4123C390
	for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 20:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744747821; cv=none; b=sEW6522OTc1p9KN3nOfq6xmbpb05YT0C1sQlG25Qd1PPNIDXLKou/1hxIF/pP3atysQkPSsjWQSzPQPEgInqLcgBqlz8C6xrqisiwKzWeQyDqJGFJyciP1F6pW1/BkWzWhy3C/yTUk/1hXzlf/fFNB2QDoCMnDzXX7gOprXbsOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744747821; c=relaxed/simple;
	bh=zGG+N2yDwyHXaC8GqSc/AOf+1VKFF/p9dMDTYi0UHqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRlCW/IlhmZBBZi/7kZ8/8miAxJyW+D3kvFSC/cGdZZRKVO0805sW9jSuTn/waRMjLAx11YWsSvhRDTB8iZPo2R7O/LaAE7DpUFgzTMV9NYj5GY9Rc5fcBVBfdq4VirCMD0SNfMGyE7F7+YMbG4qCZVI2FuYHLoVNgBncm+iwyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gXBsYPGF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zGG+
	N2yDwyHXaC8GqSc/AOf+1VKFF/p9dMDTYi0UHqM=; b=gXBsYPGFYyCw9LzzMGNp
	yeTFAfEqmfACTJOIyrkkUq/6YTwKTxVlihAPY5unvLR5l/C/7rOS8sMtD/gX4NLp
	KmRU5tWCNK1gAzh0t0Wn0tW6/20SV8BR9aK0LPS4sDczpg9kMyDaLDUDXR3NSkMi
	mUWZbwWrUzuaTzQChXqVdevgvit2A5ls/xXEAmmycFH5+jO9RWymdfxHeIHYmtJR
	2vpBPjex3sGJUQzF+D+M+AUW6hi3h+biAjD1fK5aqVe+5E/o5wlTnRQVGneWnZAY
	AA5RHs3+u4inwn8P60OeVSI2yvgdGYfq8pnRWe/3/uEVIeahdS4o7pV7USZUsHmE
	Qw==
Received: (qmail 431605 invoked from network); 15 Apr 2025 22:10:16 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Apr 2025 22:10:16 +0200
X-UD-Smtp-Session: l3s3148p1@qAbOwdYyOJQujnsq
Date: Tue, 15 Apr 2025 22:10:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 6/7] i2c: core: Deprecate of_node in struct
 i2c_board_info
Message-ID: <Z_69Jml3-CKi13wB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
 <20250414100409.3910312-7-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BDuoVd6siomLyXJY"
Content-Disposition: inline
In-Reply-To: <20250414100409.3910312-7-andriy.shevchenko@linux.intel.com>


--BDuoVd6siomLyXJY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> that Linux kernel supports. Deprecate of_node in struct i2c_board_info,
> so users will be warned and in the future remove it completely.

Is there a plan or volunteer to do the conversion?


--BDuoVd6siomLyXJY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf+vSYACgkQFA3kzBSg
KbbJRw//f8nF3y4JXlYuzHQYvfsPNwImoeiIwRs1xXyFnA46CXf3UJLeT6fI4yBn
Bw2RtzqlcBKjooOd6lEKVRRV6MLDJ6V0kr3ywesZ66S7mQr5NELdltGNY/f0ee2k
2Bp+8zdgGPzV4hnsztOpE/Kc5Cy6c1D4lkM+kl2sAG2RRw//TL4/AZVCbcPOZXd9
Ap/hoHpSLKim+FwAAjYLiono3+gxjlZmgPlSUpIwYvfmATS9O/hB5hNgAjTIkPhW
Q9+LsNyZBZfl8s8V7OD1iDl5EcjNl8iDa8VqPMq5q0BagH0QnqGjiwueOI37dW09
FN7U89XBLnq7xc1kuCK9H//JalLbzW5Sk1D8vOa7prl4WoEJdEAqCTpRPmReK6BA
++zPMDBWYKgVOD/uGN3Lm7041UyuC3vl5riA9P+v7lv4airT6PAx0bonVaJqdv6I
vKUOVM3JPgWxOCVgpIwT/+4Q12vb3svOpBmFJvWyIr4XEgHrbwu4XidJIpsZXXwX
23edA4BWkMsD63SqBGUKF3iAOAajXYQ4pJDgHuzU5UX9QCfnSNgO+EZAte0QfR8e
31dypYq/IqoBwR1LSUDT6UFgK/9RvbVQO6PUzbdA2nkSYmnecG+/fG+XtL9JnyqG
I3cPw5igTWLITYVUAjZDjqSZ2wx2X4rnqkSf/i1ajQE0osz86Ps=
=42VF
-----END PGP SIGNATURE-----

--BDuoVd6siomLyXJY--

