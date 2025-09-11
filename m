Return-Path: <linux-i2c+bounces-12879-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECDEB535C4
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 16:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53A087A880B
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 14:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571E3341662;
	Thu, 11 Sep 2025 14:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="poEx3AVu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DEB189906;
	Thu, 11 Sep 2025 14:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601436; cv=none; b=qR6i1SKnIxD5uUs5lB2wpp95uqRQ275NIrE2Rx4v0lR01yzczfuu3TDDkYujU4yJOWnvpBy/2qChlKTJPLcJYreYoCCq4plgWbCfZARqvKmXDzSD8Uh2d7zBnV/vtsUL6YKNGYp7QJyc6uKvoTIz6bcg3oNnrpWvanhqmXdrNqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601436; c=relaxed/simple;
	bh=1uq3j5GPcDQePdt4YoD1jR895AQejZTyfOLzC81OMs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fq51Y7utL0VCpiVe++8KsTm3IC+hnWh+/LRKMZ7j8/eZp0ai4Le2N9yTt/ydIX4EQ/nuLmB9/xUd4D+n1c3ELxs+HwJ377O0fdJFTKwXInnd/55aQYbKwM7lr/FAwjjtj0PeI0drEzIo/WJrrN419G+CVAh3zFQVlL3JSmVg4qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=poEx3AVu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23FBC4CEF0;
	Thu, 11 Sep 2025 14:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757601433;
	bh=1uq3j5GPcDQePdt4YoD1jR895AQejZTyfOLzC81OMs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=poEx3AVukISUDuuoOMtMsnSAs1SQT+F2uLTaYOHF4r9RFtr7aE/0aW43XZL0R3mXe
	 fYEp9v0FUb0LCkuk4SvqQ/PoPO9rVnw1799b0CzgIpc29qR+cglMq/hwhyDqAuYrAI
	 PzTFASlK5cJKfcsKu5pkQSPAaTNNZv1IOGf+uE+zika+GoMKEfYEwR9YVTDUHBWpkW
	 V976XgpLzNcasNt6ohIUUvuF44PYCQlxMVImFMuNYYNZvTiamdrynAdzRM4bRvtDxg
	 l60kqKL25Vu8MAchG+h3z6MvklCdiexV5rdRolRgjM9avaIHoFhJDOqFggIhQv8YcA
	 jh7okJEY3wgRg==
Date: Thu, 11 Sep 2025 15:37:06 +0100
From: Lee Jones <lee@kernel.org>
To: tmyu0@nuvoton.com, linus.walleij@linaro.org, brgl@bgdev.pl,
	andi.shyti@kernel.org, mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
	jdelvare@suse.com, alexandre.belloni@bootlin.com,
	a0282524688@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH RESEND v14 0/7] Add Nuvoton NCT6694 MFD drivers
Message-ID: <20250911143706.GL9224@google.com>
References: <20250825092403.3301266-1-a0282524688@gmail.com>
 <175760120875.1552180.9512711135722714327.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175760120875.1552180.9512711135722714327.b4-ty@kernel.org>

On Thu, 11 Sep 2025, Lee Jones wrote:

> On Mon, 25 Aug 2025 17:23:56 +0800, a0282524688@gmail.com wrote:
> > From: Ming Yu <a0282524688@gmail.com>
> > 
> > This patch series introduces support for Nuvoton NCT6694, a peripheral
> > expander based on USB interface. It models the chip as an MFD driver
> > (1/7), GPIO driver(2/7), I2C Adapter driver(3/7), CANfd driver(4/7),
> > WDT driver(5/7), HWMON driver(6/7), and RTC driver(7/7).
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/7] mfd: Add core driver for Nuvoton NCT6694
>       commit: 8c13787893fde313190b7dc844a24114dcc172a2
> [2/7] gpio: Add Nuvoton NCT6694 GPIO support
>       (no commit info)
> [3/7] i2c: Add Nuvoton NCT6694 I2C support
>       (no commit info)
> [4/7] can: Add Nuvoton NCT6694 CANFD support
>       (no commit info)
> [5/7] watchdog: Add Nuvoton NCT6694 WDT support
>       (no commit info)
> [6/7] hwmon: Add Nuvoton NCT6694 HWMON support
>       (no commit info)
> [7/7] rtc: Add Nuvoton NCT6694 RTC support
>       (no commit info)

I have no idea what this is about!

Looks like b4 just had some kind of breakdown!

To be clear, none of these have been applied.

-- 
Lee Jones [李琼斯]

