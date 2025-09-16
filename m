Return-Path: <linux-i2c+bounces-12980-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F6DB5980B
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 15:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BC1A461A94
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 13:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBC43191AF;
	Tue, 16 Sep 2025 13:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTS8BzXa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9C52E1EFD;
	Tue, 16 Sep 2025 13:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758030267; cv=none; b=OC0ysiBLUrRFSw5RVZI0+np/BSmghw+hRlTodTaZxiuT4pWXycVIRRiBN+LT+2aajZJoRXOK2C0TZxTQavFX5Tpkc0OpBVy2M7PrFgNpLegVMZyi0S6kmyEhoQYdkS7m1vq1jRwjNLNcI0BMeaNw0MnZ89ATCt57plLn6DBr0Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758030267; c=relaxed/simple;
	bh=PiqUhXW6QToZ6nQDeenBB20ifChYwsOqZj1pkylev8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6ns+IndkykldsYbuSFz4vfPRmVDpxyXtzIlcoYXYL//RnOZkV395sH7UQQ3S8CVgGgYqx4Az6sd7oajnrE9D7y8G/816fN/m7Oh/QBAMCTuF+k3hWDR4ETsISguLuLied0b76UV4sLomixNSvqqhV8k/wMJutd6Y5lldZ69QJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTS8BzXa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09390C4CEEB;
	Tue, 16 Sep 2025 13:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758030266;
	bh=PiqUhXW6QToZ6nQDeenBB20ifChYwsOqZj1pkylev8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TTS8BzXaWnZ22mESEIXs1e3yx/TuBOHORy3r8nH8bkXlMdUTu5hwLKER1I5fkX912
	 OLlv33kVMWxsxjhceEwtHFJv7EnxvHC6vRFLUIawEb49hEa9JlLGujuDkNVrNHyKuK
	 1qYBNu7dS7o7OChnp/5d2lCXTGxzaT/XOdmGdMwd0snMoExH08Ja5eXDivsE9YkSfn
	 PZsH0VF9jLDM8JVfd0qHM3TTU6hNXmP2r86h7fMHNKcKcwcV1K7u9odEAwu/0nEYEU
	 aDZsEmqAAdVYdvANj2PYTc07mvpRkt+2eifr7UZZDASyI51n2Zs5YCYKsl5ijq4NdT
	 vGLPZuPAcX4Ww==
Date: Tue, 16 Sep 2025 14:44:19 +0100
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
Message-ID: <20250916134419.GD3585920@google.com>
References: <20250912091952.1169369-1-a0282524688@gmail.com>
 <175803019322.3799290.6641375066506606941.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175803019322.3799290.6641375066506606941.b4-ty@kernel.org>

On Tue, 16 Sep 2025, Lee Jones wrote:

> On Fri, 12 Sep 2025 17:19:45 +0800, a0282524688@gmail.com wrote:
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
>       commit: 51dad33ede63618a6b425c650f3042d85e646dac
> [2/7] gpio: Add Nuvoton NCT6694 GPIO support
>       commit: 611a995e8ae1a52e34abb80ae02800ea100bdf84
> [3/7] i2c: Add Nuvoton NCT6694 I2C support
>       commit: c5cf27dbaeb6e12ea1703ee896dd4b42e92343aa
> [4/7] can: Add Nuvoton NCT6694 CANFD support
>       commit: 8a204684d0ffdf8d39c16d70fc6f1000e831ef27
> [5/7] watchdog: Add Nuvoton NCT6694 WDT support
>       commit: f9d737a7d84ff4c1df4244361e66ddda400678dc
> [6/7] hwmon: Add Nuvoton NCT6694 HWMON support
>       commit: 197e779d29d87961be12eb6429dda472a843830f
> [7/7] rtc: Add Nuvoton NCT6694 RTC support
>       commit: d463bb140583609f78f61d48c3dfb6f46c5cb062

Okay, everything applied just fine this time.

Submitted for build testing, if all is well, I'll submit a PR soon.

Note to self: ib-mfd-gpio-hwmon-i2c-can-rtc-watchdog-6.18

-- 
Lee Jones [李琼斯]

