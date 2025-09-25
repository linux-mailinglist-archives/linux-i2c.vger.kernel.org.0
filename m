Return-Path: <linux-i2c+bounces-13173-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBE9BA1545
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 22:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA08F1C239EA
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 20:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6914A31D739;
	Thu, 25 Sep 2025 20:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="sFD9E9MP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8A926CE33;
	Thu, 25 Sep 2025 20:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.113.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758831130; cv=none; b=SiUZv28GWaEr8nK++9DDbtUDdysZIfZGM9dmfOiwOKXsBduGTEnt7sxT1rM4D9mI9d1uW6lVBckK9XfoTzQzjKddr4TzAiEAmir2L1j5/0UnRYfu5vSzIpDBT9CA9PR+9N/BT48bIJ5/oxS83x8qe/6TgOL2Ub1DH/gACMWphiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758831130; c=relaxed/simple;
	bh=d+lsLcUzOu2XEl+MNvOGLdNwB3NBh9LpotafXD22ILk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XECbNDM2ngXzWlQ2wh1PGaFlTccyUjUan0FoyEhsUuoa8akPWPW5zstwV/Eb9NEULnTuRfBOJbh7yoSNh3c82BxfjkXVZRhYYozLDvMvV+yytBx2XOQqfXzOCro3bbbU6gFM0SX394BOxAL/s9ITvAnnjkubseILZghRJak30ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=sFD9E9MP; arc=none smtp.client-ip=195.154.113.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=ORkT1a+9XuyN/XSBDila+ea6DXmpE9sH45Swm+wsPeM=; b=sFD9E9MPW0oWpYAj82rWjeTeOZ
	j4iGgDrOm8OtQS/UHGVeHbt7e0VArYve8K/G3XFrjL2VRNzk1e59myuwiWNyGPt6AWBPN6oTUgCdt
	eOkG82vzvneyIJYU2gl6vWV02z8GyFVHmD7DbEK74RF/EhO7464gGU34+EuENSVuDVI1avnemy4Vo
	r1XeOF18d0yefscjgoD9pCdYYoG7NGJJoXFfa/7fAIyHUJ6ytyQoOBHbWe3K8Y/4XJgJwNe9CNPib
	cOHYAvvi3Ijv8wQPnbjtnfOCaCebuNjxOFMqyW+yTQMGBdVmF2E/l9qedJ0ETJf4QvadQhLAGzcIT
	VAu4OYRQ==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v1sJZ-00F7Tf-3B;
	Thu, 25 Sep 2025 22:11:42 +0200
Date: Thu, 25 Sep 2025 22:11:41 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 2/6] i2c: spacemit: remove stop function to avoid bus
 error
Message-ID: <aNWh_dfyfCsqZ8av@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-2-46dc13311cda@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-k1-i2c-atomic-v2-2-46dc13311cda@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2025-09-25 10:02, Troy Mitchell wrote:
> Previously, STOP handling was split into two separate steps:
>   1) clear TB/STOP/START/ACK bits
>   2) issue STOP by calling spacemit_i2c_stop()
> 
> This left a small window where the control register was updated
> twice, which can confuse the controller. While this race has not
> been observed with interrupt-driven transfers, it reliably causes
> bus errors in PIO mode.
> 
> Inline the STOP sequence into the IRQ handler and ensure that
> control register bits are updated atomically in a single writel().
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 26 +++++++-------------------
>  1 file changed, 7 insertions(+), 19 deletions(-)

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

