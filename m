Return-Path: <linux-i2c+bounces-14846-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D875DCE7170
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 15:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1534302BA96
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 14:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9BEA320CA7;
	Mon, 29 Dec 2025 14:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="qNKoPPdK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF61C32039E;
	Mon, 29 Dec 2025 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767019126; cv=none; b=W8oxtmNHGQ2UiK5uEePIM5kMeQKFrIzXDV3aMnyddz70PNllaQeZ7/H+BWmPjIhNdqRssikIhOG1NXxCJlRtecM5o7mXhYaFqe+yqPOYDLIa85osueP3J6KtwgUuPw/ZAebP8U8Bg4qAxO/K9M5vrYJeyD+WrPr2PAn5KrRIbuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767019126; c=relaxed/simple;
	bh=GHXf+pyh0a1v0GbSo2DfEVVsrnac8rjQk00yfkax9GE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPjm7cCNB7bMwnMCEJJTNLVipmqFNQpI8ReNIFdHAvBY679JED+wcktm+h8B2ZkxiytZhcwWV+Af41kf1AnIXhdKhFZS2Y22duHy4NwOT0KDkA8yjKTgfX4YHsIvzcZJULwvcdpFaqRxvj44mTNH7uzZM4yr9Xf7+WseN/V/KxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=qNKoPPdK; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=0orO2Mu5RW0+CIqVx1kqy5o1A29osmYYi9KlgczG9N0=; b=qNKoPPdKDzv26nsl3UgI0IImCL
	3CcL58xm2LKXUlLmDSaMrfpEW6C5II/z/AAGkvN3G6JY2hwP3dAfIIT4KMjq3MuUeZXSIfu9x6JxR
	VsKe7UyfNUpJKVhvariW5A9qrJ5i7Iw8HfNcuW6IjsAwioVqLfqaf39hRfTCmorSRpeBGskqGmnpe
	MQ0ngCJdSUwlzuPjvCpvWBEua6ufgjCrHIgO0zJjIB40X434WQE//LqP+U5TPDFJiDUA1VO1r23R1
	rAvPhcC6ewjI2htFShs3Lylu+XtHGOWLin63CVTPhnPLhnYJXlhrehCX0OUe6DcuB4+kfQcAthWe6
	AAeYNoUA==;
Received: from [2a01:e34:ec5d:a742:6075:34ff:c68a:2cc7] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vaEOI-00000003LCa-1jo4;
	Mon, 29 Dec 2025 15:38:34 +0100
Date: Mon, 29 Dec 2025 15:38:33 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 0/2] i2c: spacemit: introduce pio for k1
Message-ID: <aVKSaXWr2d0H2d65@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2025-12-26 11:31, Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C in atomic context.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Troy Mitchell (2):
>       i2c: spacemit: replace i2c_xfer_msg()
>       i2c: spacemit: introduce pio for k1
> 
>  drivers/i2c/busses/i2c-k1.c | 307 +++++++++++++++++++++++++++++++++-----------
>  1 file changed, 230 insertions(+), 77 deletions(-)
> ---
> base-commit: 8dd7d777904fbe2e684d1f1942f81256ca6fd312
> change-id: 20250814-k1-i2c-atomic-f1a90cd34364

Thanks for this new version. Both commits are:

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

