Return-Path: <linux-i2c+bounces-12979-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AA3B597F6
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 15:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90D941B2776E
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 13:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3C6315D30;
	Tue, 16 Sep 2025 13:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+qJiOF9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF1F28488D;
	Tue, 16 Sep 2025 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758030198; cv=none; b=AdTbZ7qkURDB88iGoQ/bvJpqLvCo/c/b94Qc9V/nbydTeaQ/1KtK08tfLF4CQDgSzU5BkKrhvvIMAcsYDKw3oOjHCDIzOzsge+GNjQwZF7CBw4eMrJNsymzBM/CXUAuoq1zEqFFMeA+A8XPhgJVBq4bTc3TOUbcjuE7oGHU+t7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758030198; c=relaxed/simple;
	bh=5EituY1Uhfg/b+Hco4rbTN/vr4sz2d7nMr/Zscfbt9E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nKFtbCnbLp3KjwG9zKtrGliG5xCFPdbAEOfXm8uXNM4PtHMUauqepDJboDpuG3K71bZQJFdwGD7y2Aydlnhfk0Mor8U6PxdNyPEM9/HSttTHFQjcxVRiSQjlldZ96QOCkrDRLglTyaFm+gLLyl6Rk9c/6ZOnjAZPDbwDig5tiRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+qJiOF9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E5CC4CEEB;
	Tue, 16 Sep 2025 13:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758030198;
	bh=5EituY1Uhfg/b+Hco4rbTN/vr4sz2d7nMr/Zscfbt9E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s+qJiOF9+BdQ5gUvgRwxoM9iaN9zoWG3JsbraSZGjDeACLcLdzOxPZS+a3yeuyLq8
	 PDVTPM+BU9OLQQ17t5eIYaXkmg0tRbhUkx2bLrMDJHVhKXt9rGfrm7UECNAX7zL97p
	 ycZ2xv7Y6mVZ8BGMHk8QiQMlwZ3iXcokVrLHRgUnO8dTGsWqZo1aMJGSfn7LYtql0C
	 rylaupWONDp3N+bm8MhrppaVAPNlPZAG2ssk0h7I6Oucw+PMjcPc1EpIflopocDFgj
	 IHEsXszaSUPqT9s7CP1Yl4D45ZWHgnBbf9AcsGMCW0it+i945jmsv2VKqjphTwd4vl
	 BuMfVLc5FB2LQ==
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
In-Reply-To: <20250912091952.1169369-1-a0282524688@gmail.com>
References: <20250912091952.1169369-1-a0282524688@gmail.com>
Subject: Re: [PATCH RESEND v14 0/7] Add Nuvoton NCT6694 MFD drivers
Message-Id: <175803019322.3799290.6641375066506606941.b4-ty@kernel.org>
Date: Tue, 16 Sep 2025 14:43:13 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Fri, 12 Sep 2025 17:19:45 +0800, a0282524688@gmail.com wrote:
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
      commit: 51dad33ede63618a6b425c650f3042d85e646dac
[2/7] gpio: Add Nuvoton NCT6694 GPIO support
      commit: 611a995e8ae1a52e34abb80ae02800ea100bdf84
[3/7] i2c: Add Nuvoton NCT6694 I2C support
      commit: c5cf27dbaeb6e12ea1703ee896dd4b42e92343aa
[4/7] can: Add Nuvoton NCT6694 CANFD support
      commit: 8a204684d0ffdf8d39c16d70fc6f1000e831ef27
[5/7] watchdog: Add Nuvoton NCT6694 WDT support
      commit: f9d737a7d84ff4c1df4244361e66ddda400678dc
[6/7] hwmon: Add Nuvoton NCT6694 HWMON support
      commit: 197e779d29d87961be12eb6429dda472a843830f
[7/7] rtc: Add Nuvoton NCT6694 RTC support
      commit: d463bb140583609f78f61d48c3dfb6f46c5cb062

--
Lee Jones [李琼斯]


