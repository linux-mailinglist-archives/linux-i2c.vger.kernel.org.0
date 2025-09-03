Return-Path: <linux-i2c+bounces-12575-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E330B419FB
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 11:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 332584E33F7
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 09:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABAD12F3618;
	Wed,  3 Sep 2025 09:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aaJiHxMm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1952EB5BD;
	Wed,  3 Sep 2025 09:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756891678; cv=none; b=e7EzWgq2MNihAEdzbpe7OnWjfNha5VsEwhYRFCDzTyuRTvwPsm2oa4jGgiMHhpLqP6NDdd8sWnZKZo207whlrKGBsLiqNEo8tTNpz9LXNLfX8bUUc2ME/S+KdRn3MPKvJ8XEBUYs0GhzILeBTd0qoyaPV+DLrsRdMgZ8KyV1h48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756891678; c=relaxed/simple;
	bh=zoygvyrvbpRQP0lvFaQr5ZvBPQrrVcLHonREwQLABLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1fxwRSilvqOszdpkL1hYBIDVSkQNt+pzpB130KhXKmhpap8ryjjiVrm1WlqssNg2Ki9XN0zo1z3vwlszlgRjzXJykI/kqyqv8Az5FE44PUVlVhCDEpb+0zFv8m6Z+XFd0JNF1BDthpljebKmYhWAln1aKPBjuCKFm8I3O/FdL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aaJiHxMm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094DEC4CEF0;
	Wed,  3 Sep 2025 09:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756891677;
	bh=zoygvyrvbpRQP0lvFaQr5ZvBPQrrVcLHonREwQLABLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aaJiHxMmxm+KDWV54GEw0wFKqHa23MozUT9t1F6E6ykgPQidtVov9eFpwyt2PT/e1
	 ykvXi8dABrzbhFHZac+ksIqZX5jqvgdo+i/bFDYYqs72VAONSagJP7/hSdvvYCxKz1
	 eI1/thKT/ROliJ9DvpqJgMsGdmQ2Nm7CxoQr1q03RenOSahf10HJFkPQBnUPtjYevu
	 7P7PWKjHLGsxIaf3fDgTDHGDy72eJAoJ0j0J3xFjm2UsyWc53a8WTuSfAJkdS7HDlA
	 Rn/Cqm6KHIE+bQpWm2+d5YOls7aiPXWdMtpkunQRf6ofwIiK55Vv7GdgjI45bB7G7g
	 0BP6SbigvujPw==
Date: Wed, 3 Sep 2025 10:27:50 +0100
From: Lee Jones <lee@kernel.org>
To: a0282524688@gmail.com
Cc: tmyu0@nuvoton.com, linus.walleij@linaro.org, brgl@bgdev.pl,
	andi.shyti@kernel.org, mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
	jdelvare@suse.com, alexandre.belloni@bootlin.com,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH RESEND v14 0/7] Add Nuvoton NCT6694 MFD drivers
Message-ID: <20250903092750.GG2163762@google.com>
References: <20250825092403.3301266-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250825092403.3301266-1-a0282524688@gmail.com>

On Mon, 25 Aug 2025, a0282524688@gmail.com wrote:

> From: Ming Yu <a0282524688@gmail.com>
> 
> This patch series introduces support for Nuvoton NCT6694, a peripheral
> expander based on USB interface. It models the chip as an MFD driver
> (1/7), GPIO driver(2/7), I2C Adapter driver(3/7), CANfd driver(4/7),
> WDT driver(5/7), HWMON driver(6/7), and RTC driver(7/7).

Doesn't apply.

Please rebase onto v6.17-rc1 and submit a [RESEND].

-- 
Lee Jones [李琼斯]

