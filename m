Return-Path: <linux-i2c+bounces-12878-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C008B535BE
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 16:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B95BFAA4F6F
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 14:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FDA346A19;
	Thu, 11 Sep 2025 14:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOOss4G4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D646C341ACE;
	Thu, 11 Sep 2025 14:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601352; cv=none; b=csaR7iOSREEmLGQ2fIjhdZ/ciE7u9ceNnoUa2x4okdsWpAFnhh437r3pbL/P1Uy196gXyVeegZAp+xd9meUjszlwiz235TGd1Q0I8eWKUKjOEUld40Si6XcR9CCPMX8UII+cyKQtaAu85U1i5fuCgZdefY8q97Ia5rrNPuOmKag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601352; c=relaxed/simple;
	bh=1OW818dins81Hk7V/WkyJPF3jtR2tkBRr05X2un5b+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5kA93Vv6HL6UDJhCIJbnfaPvwadxmR/Qc55udMXTllLczscEVlJBc6jytfYg+upg6QacHIjyw1kw4UnS7wtGcyPjW3I/0CCuh8a7zGHRkh37k8SdusS9jcEEu3dayjJeXbao5dXa5sShs/cLTXRjX1nwuOw2V79E17bXMW+a7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOOss4G4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6E4C4CEF0;
	Thu, 11 Sep 2025 14:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757601351;
	bh=1OW818dins81Hk7V/WkyJPF3jtR2tkBRr05X2un5b+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aOOss4G4Eb0pCtRlkSLvdTIL1kJnNLMh6oO2xAmldJDGjFBo3l4k1YhRqe8EUoK6P
	 9bcFxpBaPjSD6G+M15wy1XYz6jtNOZMeehIdapHBcTUt767NNrTLnAAuxLXTnBlOvS
	 +on0M3d5Ta3sEaL1Ty1RRANyi3RB1AXgg5K0gJfmKVrAnqLihWVEQFKjl0EMat5/Fc
	 Yfjlbw47cCwCva8MdoqumiBUYSLsTitA9noM2igwEQK/hyNQk8MLW5t1o3q1Fm+qOz
	 iGtBUsUYZxpUuI5P/oFb9Mzp57gnd7htub2h78L5sGG9DmKJed3A5A+5Z6K64K27Wx
	 ac8hLFDiLmQoQ==
Date: Thu, 11 Sep 2025 15:35:43 +0100
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
Message-ID: <20250911143543.GK9224@google.com>
References: <20250904015048.1801451-1-a0282524688@gmail.com>
 <175760121375.1552180.14414071756142571293.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175760121375.1552180.14414071756142571293.b4-ty@kernel.org>

On Thu, 11 Sep 2025, Lee Jones wrote:

> On Thu, 04 Sep 2025 09:50:41 +0800, a0282524688@gmail.com wrote:
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

