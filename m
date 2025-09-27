Return-Path: <linux-i2c+bounces-13217-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7E3BA57DA
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 03:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB09E384254
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 01:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2257E1F4CAE;
	Sat, 27 Sep 2025 01:24:37 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DAD1D5160;
	Sat, 27 Sep 2025 01:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758936276; cv=none; b=mDjDqNB6dZ+g/qecANvcx5BZcZt5BeaUeS1b/T5PWEfkid4+8ntU7DUnO9xbEdFeofdaFVHtbmUQa+0xfGNjFxGNLgHxRCQXKnkYOdh+BcXhLy6NLajzfgdGVgMLhueLsru5RX3RvcAemIFpgB3z60p3zHJSpGAQVvaPNPxMYZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758936276; c=relaxed/simple;
	bh=bUNKqHaD1iuHkc+tCOCnIlukWdMGz5DnxxFyK7q2skM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhpwJXp8ExiyAuPz22qBnuRr2Vx2G9lC2JWSO5m0DrQg+MBna9bQjoxigQjzCJfyupW091Nm2Agd6QrwSAd+rR8UOa3d/bnqZ02cUTFonDupNBqhQa5giD5rgyloWVZfpkcWVBo3LpGhgNs1o0ETnl7OEM4+vH+5nCefg5n0UL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id AC438340D3C;
	Sat, 27 Sep 2025 01:24:34 +0000 (UTC)
Date: Sat, 27 Sep 2025 09:24:29 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <20250927012429-GYA1330052@gentoo.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250926111055-GYB1324993@gentoo.org>
 <E4EE696368DDDB1E+aNaRl8upyNeld9zX@troy-wujie14pro-arch>
 <aNajJ0RZ4Ku0eDXr@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aNajJ0RZ4Ku0eDXr@shikoro>

Hi Troy,

On 16:28 Fri 26 Sep     , Wolfram Sang wrote:
> 
> > Since patches 1–5 have already been merged,
> > should I keep the current version number and just send this single patch ?
> 
> Yes, please.
> 
I agree, please do increase the patch version, have a formal cover letter,
document the changes, and add old patch URL link..

-- 
Yixun Lan (dlan)

