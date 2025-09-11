Return-Path: <linux-i2c+bounces-12876-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E484BB5358A
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 16:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07DF21CC2D4D
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 14:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E18341663;
	Thu, 11 Sep 2025 14:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9S5eHE3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE0E340DBE;
	Thu, 11 Sep 2025 14:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601214; cv=none; b=u1700NvgEuRFLmuhVUo7v5nhU6HpDObV5eGenLJ9yO3wQ6OqyOpEDMiBUj7lMmPFNxodwajFzsTfJ02qmXVpo8bR/0otJ57wfYBnEgOHu0r83N49/CypvWvJDBFzLSE5B34DR1OfbsYIV2FksO6QeQGCeIMPo90tvRGCZ6lA+rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601214; c=relaxed/simple;
	bh=FP9aVxJALnyUuimzNS8mo8smzmfLA1mcpQwmRFMbltE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c36T0vW+2iAFlMyDxSrSp9Lz1utkVh/F6KvKx1dVzQNI9PBlyf+6pzPkgaph6sUIB8Tey4A/kDH8uS4SgnWSV0t7YjgFcjLFqn6gN/+GbOEMQc2490OtJftTi5wRxM+/UjZ3onurQm4WBcVrfvtIk0SC2PKakyO9ymwcjcC9dqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9S5eHE3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051C7C4CEF0;
	Thu, 11 Sep 2025 14:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757601213;
	bh=FP9aVxJALnyUuimzNS8mo8smzmfLA1mcpQwmRFMbltE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=e9S5eHE3qcSq7dt6emzYHKMTIlVfrvYb2GSCQa9u2bJzAlZB96Uy+Ta21Klw0Y/5E
	 gUitbr9n0NZltFfGpH6Nx38hOelKjzE+yMehEDJCMGxUnzffFL6Fj/grQ31sSLi28Q
	 l3yhoZ/eEprN3Xu7xhwY9SNZ9yvMihoOGRI5pC/aNVjdOb6hQFDnRfFvX4PrEE5H5L
	 ueuUJowAluzOF6k0PSiLEC3KAiYznOdBih/U1lWE2EONefT6e9wyW1s6YrbdMFv2tW
	 9CFNMvuq2eZynw1s+D8Qwhh4K+xc7keK5oh1p2+E4YDfjgvV32LBCJUK/iW9c87NWm
	 rlNq1M/sSV5kQ==
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
In-Reply-To: <20250825092403.3301266-1-a0282524688@gmail.com>
References: <20250825092403.3301266-1-a0282524688@gmail.com>
Subject: Re: [PATCH RESEND v14 0/7] Add Nuvoton NCT6694 MFD drivers
Message-Id: <175760120875.1552180.9512711135722714327.b4-ty@kernel.org>
Date: Thu, 11 Sep 2025 15:33:28 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Mon, 25 Aug 2025 17:23:56 +0800, a0282524688@gmail.com wrote:
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


