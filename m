Return-Path: <linux-i2c+bounces-12877-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8F1B53595
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 16:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FFDA176944
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 14:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC1C342C8E;
	Thu, 11 Sep 2025 14:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNlN2Sbb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72E7219301;
	Thu, 11 Sep 2025 14:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601219; cv=none; b=XBMiR78BY8QeB9UMwz7HOQtHfpud0px+qhuB83+WLq3hmjPAYpNrUA34GwQOtH9PPlhbyLOcYB1mhFFR6mu2Az6a+trEBBrjalX0/GktALnrgpSbTEpqNnd3l+D2AjLnlXwuIwAWr9vHozstFplQi9u/AUaEE2VOVm5Ov5fvxpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601219; c=relaxed/simple;
	bh=OUJiGi+94fM5sV3cXCPP5CAqq/OJPC2n5Oez5un9aqc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D3A5RW9GRjrKg/i3vA5aS7vh/12mIDTLW+Y8ewDslvjtRHQHnkymIMAGOfK4JA7OpugHo5804cao8k2yZLoyjd/MHGTCkoDvsokWQE3mYu4SsCBOCC1ucCMD/j0L1kgBIM/9X/tCPEo5v64rQnBbzWIwxp23fcD6RtVukkQeBb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNlN2Sbb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02AC2C4CEF9;
	Thu, 11 Sep 2025 14:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757601218;
	bh=OUJiGi+94fM5sV3cXCPP5CAqq/OJPC2n5Oez5un9aqc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HNlN2SbbDPOYRE/qguGJ3QO6dg+GeXXMXenRHR7nT6YKwB3MB7vGyJtGbkZYYtPA9
	 ad2K+IGKQZDDl0JPzJLrXbV/R9QWQ44uMNWqKQ2uJ9zP1rUN66zwQBYiUxvLKl1Nax
	 wqDrUrPbYR3nmRBNpqmPcAYVb8WuzU8OxhUx6e0RggeZR2oPT2yN5phYEg3NW7Zjb+
	 HKTwyjTs3ilfq2mtWZSqAVcUFdzdbCG1xq/BwtRPigu2+WXkL9mZ/Ms2bcsXqHyoJ7
	 XsR1BeazIXyvTkUS9WU+HrRzWKB9n5LLlbkQmClXkEl2nC6JuJQ1kEFD+lZI2cPEP5
	 /ord5gwiNcx+A==
From: Lee Jones <lee@kernel.org>
To: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
 brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de, 
 mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, davem@davemloft.net, 
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
 wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
 alexandre.belloni@bootlin.com, a0282524688@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, 
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-usb@vger.kernel.org
In-Reply-To: <20250904015048.1801451-1-a0282524688@gmail.com>
References: <20250904015048.1801451-1-a0282524688@gmail.com>
Subject: Re: [PATCH RESEND v14 0/7] Add Nuvoton NCT6694 MFD drivers
Message-Id: <175760121375.1552180.14414071756142571293.b4-ty@kernel.org>
Date: Thu, 11 Sep 2025 15:33:33 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Thu, 04 Sep 2025 09:50:41 +0800, a0282524688@gmail.com wrote:
> From: Ming Yu <a0282524688@gmail.com>
> 
> This patch series introduces support for Nuvoton NCT6694, a peripheral
> expander based on USB interface. It models the chip as an MFD driver
> (1/7), GPIO driver(2/7), I2C Adapter driver(3/7), CANfd driver(4/7),
> WDT driver(5/7), HWMON driver(6/7), and RTC driver(7/7).
> 
> [...]

Applied, thanks!

[1/7] mfd: Add core driver for Nuvoton NCT6694
      commit: 8c13787893fde313190b7dc844a24114dcc172a2
[2/7] gpio: Add Nuvoton NCT6694 GPIO support
      (no commit info)
[3/7] i2c: Add Nuvoton NCT6694 I2C support
      (no commit info)
[4/7] can: Add Nuvoton NCT6694 CANFD support
      (no commit info)
[5/7] watchdog: Add Nuvoton NCT6694 WDT support
      (no commit info)
[6/7] hwmon: Add Nuvoton NCT6694 HWMON support
      (no commit info)
[7/7] rtc: Add Nuvoton NCT6694 RTC support
      (no commit info)

--
Lee Jones [李琼斯]


