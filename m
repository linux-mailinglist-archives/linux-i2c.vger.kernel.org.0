Return-Path: <linux-i2c+bounces-12875-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0588DB53580
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 16:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E7267A6E58
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 14:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D57633EB0D;
	Thu, 11 Sep 2025 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nuojx2Vl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E0A33CE9F;
	Thu, 11 Sep 2025 14:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601211; cv=none; b=j/KBWU352Om+yOBZDNl5RXTGtBTfz+jF4v371oDcbUJflQBdb0YOfLvlrcG7VqMZOx9VAQFNVp84qvQOv7hCfhdRG/E5sE/ggkjgFAYH05h0egpPJEukjLpdtD7lmNeYMfsWCG3rk/eSZYXyWX1BQX6bj0VtsVFM8xDz/oErk2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601211; c=relaxed/simple;
	bh=VknHXt4LplxbC+RtRdbSVloO2q04brRlFbVLiPqTwTM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b9FHvT9KdIvzb00ovRS4LQcwCoKrNxnWHfrpXqNSijbx5IZnkw0pXBv4k1hr98vM4ZPVYKOqfeuPi4ryIRzjOXIt39M/x4owh1DdnlUWeO74HTWIvo8QRYPh7mODAki4neXmvIHpsJ5eIGfCxydhuv9K3Fu/CM2oWbSn05r1oT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nuojx2Vl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF47C4CEF1;
	Thu, 11 Sep 2025 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757601208;
	bh=VknHXt4LplxbC+RtRdbSVloO2q04brRlFbVLiPqTwTM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nuojx2VlzTv0H2yyDy1sGm6RWQYlYevIkjeAwJm1Nq8ikF/OfCntuRooyF239m7YQ
	 85L2dhGazuLlnacTK4vA2DjiTyyYboa7/Sa4xQi/y3176HTEx/2jbLNvG4/8e3BVxh
	 U3Y2nneAsmi+dpjMBH4fhEo3oOUchoV8PuKz1mNmxWTFfAJgA+mwzMsCeFFYHmkC+E
	 VAzVLwESX50aCGHR2Xy581eCj1LcVbLi6HsXwyi2r5S7FJVe/REFooXF8Zwu5ASiLY
	 58uRvUo4OmzlP1I3Zi0jpzKd9WUzw1RZh4UrObFVkknfNp/eZ+TsHvbSFoHdPTHE5C
	 BMdVcPukypBWQ==
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
In-Reply-To: <20250715025626.968466-1-a0282524688@gmail.com>
References: <20250715025626.968466-1-a0282524688@gmail.com>
Subject: Re: [PATCH v14 0/7] Add Nuvoton NCT6694 MFD drivers
Message-Id: <175760120359.1552180.13642892946623465762.b4-ty@kernel.org>
Date: Thu, 11 Sep 2025 15:33:23 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Tue, 15 Jul 2025 10:56:19 +0800, a0282524688@gmail.com wrote:
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


