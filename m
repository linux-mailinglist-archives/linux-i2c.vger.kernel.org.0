Return-Path: <linux-i2c+bounces-13178-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFABBA166C
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 22:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF97016CC8E
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 20:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F308C31DD94;
	Thu, 25 Sep 2025 20:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="Y++JrFAP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D6C23B63E;
	Thu, 25 Sep 2025 20:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.113.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758833036; cv=none; b=qCQ4PfMm4/eUGmDPeG8XSYIVK5N/lOBYx01BcNO2uQr95kWUYWWqaCkG3baDYGUYEEkZ4BXA9Soy4iKIwdoiZSmlE2ZpQ+2PJc8+ZeH+SJLQX/5cr/yIL6Q6YbyxQUxOmPOcv2GmM98ZmK63H0xzWnuWXnnt97STT9S0IaQLCLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758833036; c=relaxed/simple;
	bh=ISiLHViaUVdyzmO12BC5DIwTid9c4aCgKSwzsfHts3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FudehCYIAFvPxqurf+ZwW+M6e2WWldbhuVgv+h+z2CiSEWb2v/Jaz7ejv+C0tXR6WNCBjiKT+e4toKRL4DnSNN04mleiNJkaSb1Jf94HSOhw+gXOhx5y6cQp6CK6YLc0Jt18kWneEl/pquaJ9QI33rpwYN/GpTlhBJh1NK1++bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=Y++JrFAP; arc=none smtp.client-ip=195.154.113.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=4UPhqJyqDdo7HbLIJEZkSkpz7oEBPZnMvb+OE+vj1Tk=; b=Y++JrFAP3VKxvpNaqvNc4EQ2pR
	Yj4CCRh4oszZX/r7zlHc8pClbJY2nknmq24lnXbUOeDda10jn3Gxd8tGHFjfkYzkkYloxb55qgFBX
	tafaVKHFiFOymh6Fc/BlK4mt3wI9oZpMzcvouwaJq50Z60Ep/q69VQSf9PWsLfXNWe94830S/rxz1
	rW8XLkHq511xIVVEBRfYfJdgaIaShOZK/OCatkwKY5s2uhccloMD8o4GnmqgUhnn87gBIoRKTCN/k
	53tdIalX48djp/JM/awZJgBolzv04mBcYC18gtMj32VsJBjT8pRqig3mPKxI74UbFvYRP6ryaPADR
	AJQ5oHHw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v1soc-00F9XR-00;
	Thu, 25 Sep 2025 22:43:46 +0200
Date: Thu, 25 Sep 2025 22:43:45 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 5/6] i2c: spacemit: ensure SDA is released after bus
 reset
Message-ID: <aNWpgYjiMtZJrBOm@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-5-46dc13311cda@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-k1-i2c-atomic-v2-5-46dc13311cda@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2025-09-25 10:02, Troy Mitchell wrote:
> After performing a conditional bus reset, the controller must ensure
> that the SDA line is actually released.
> 
> Previously, the reset routine only performed a single check,
> which could leave the bus in a locked state in some situations.
> 
> This patch introduces a loop that toggles the reset cycle and issues
> a reset request up to SPACEMIT_BUS_RESET_CLK_CNT_MAX times, checking
> SDA after each attempt. If SDA is released before the maximum count,
> the function returns early. Otherwise, a warning is emitted.
> 
> This change improves bus recovery reliability.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

