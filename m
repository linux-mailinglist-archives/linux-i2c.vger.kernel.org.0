Return-Path: <linux-i2c+bounces-11796-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84861AF682F
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 04:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4A49521D4F
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 02:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04B81FDA94;
	Thu,  3 Jul 2025 02:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="iXQRXRKL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-70.smtpout.orange.fr [193.252.22.70])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB891E51EB;
	Thu,  3 Jul 2025 02:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751510686; cv=none; b=LbetmefWeHabBSnu7g7UeQqflV8/7qQqb4dCu7gPOEv1/Sa97dYYunZ/j4er1gSXgeZADqcqdG6w2czWftT9izP10cwqdIvmIQdqRML0pW+rsrTPfTdK9G2HvFyvmoYbCDJf4lnb0XfzlJ6bcPGmM5ETttgBi1L8VjJcQXHhsB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751510686; c=relaxed/simple;
	bh=WgbSXIsjCcwNK+L/EUnxevkdq+CUcqhuSViQKFcXTjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XBbY5gRh31/SRBM6h5z2jB79SVosGiF0+g7lzFNQkum0S/SzYbECPwhBD5jMBmUGglXYP0/rRWbYxHl/4l6pVQTHs5qMnEhMZSp5ZCtCFMedd+MG570PdY7fUUHk42Zq7PrZEpOJloEe96KSdHO6DZfhzlTl7+VfPdflDCyUX9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=iXQRXRKL; arc=none smtp.client-ip=193.252.22.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id X9w4uFmBje9b2X9w5ufiLf; Thu, 03 Jul 2025 04:44:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1751510679;
	bh=6u4dQwo3U5CVNhb6hsocU5gXqojJ+ccC7r8jooA/t4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=iXQRXRKLyqFhiDoWzZ4/cZ3rhPOqFo2X1WYTGinZ4rICj+IyL+vqDaXboDyyr0Z//
	 LwRAGJ5KcZInhwjhI4s7dqP4FkeYA5CSovuyJ5djeYoZlSYfbdEMIPEudIjYHj48KL
	 UA4WbyPAI70FpPFXeSvl43wLPyiyrF9aX9b22E/3cQNHhswOGXQPJ/ZV7YoqdQeeZf
	 NuB9yP+fEgfrJNzo9m3ndWoGP+SG3Xcs1Bphx9MSjb3n7EyilA14PUh2I+pbhLR1Fs
	 HnLB+ueM9kGix6pOSNobbxBmv7APRg/dMAu2VEc5wr6jUEqc3nhIwg7kKv53PPDEs/
	 32YSrY7dwvHcw==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 03 Jul 2025 04:44:39 +0200
X-ME-IP: 124.33.176.97
Message-ID: <0360d2e0-e071-4259-a7c7-23c31e52e563@wanadoo.fr>
Date: Thu, 3 Jul 2025 11:44:27 +0900
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Ming Yu <a0282524688@gmail.com>, Lee Jones <lee@kernel.org>
Cc: tmyu0@nuvoton.com, linus.walleij@linaro.org, brgl@bgdev.pl,
 andi.shyti@kernel.org, mkl@pengutronix.de, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
 jdelvare@suse.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250627102730.71222-1-a0282524688@gmail.com>
 <20250627102730.71222-2-a0282524688@gmail.com>
 <20250702161513.GX10134@google.com>
 <CAOoeyxXWbjWvOgsSvXb9u2y6yFExq347ceZe96bm9w+GQAp2Rg@mail.gmail.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <CAOoeyxXWbjWvOgsSvXb9u2y6yFExq347ceZe96bm9w+GQAp2Rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/07/2025 à 11:39, Ming Yu wrote:
> Dear Lee,
> 
> Thanks for your feedback and review.
> Currently, the status of the sub-device drivers is as follows (A/R/T):
>     [v13,1/7] mfd: Add core driver for Nuvoton NCT6694 (- - -)
>     [v13,2/7] gpio: Add Nuvoton NCT6694 GPIO support (1 1 -)
>     [v13,3/7] i2c: Add Nuvoton NCT6694 I2C support (1 - -)
>     [v13,4/7] can: Add Nuvoton NCT6694 CANFD support (- 2 -)

For the CAN driver, my Reviewed-by can be interpreted as an Acked-by :)

>     [v13,5/7] watchdog: Add Nuvoton NCT6694 WDT support (1 - -)
>     [v13,6/7] hwmon: Add Nuvoton NCT6694 HWMON support (- 1 -)
>     [v13,7/7] rtc: Add Nuvoton NCT6694 RTC support (1 - -)


Yours sincerely,
Vincent Mailhol


