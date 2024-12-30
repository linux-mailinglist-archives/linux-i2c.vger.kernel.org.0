Return-Path: <linux-i2c+bounces-8816-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F7C9FE2B6
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 06:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B6A7188219A
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 05:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DE117B4FF;
	Mon, 30 Dec 2024 05:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="j6IRiyX7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-69.smtpout.orange.fr [193.252.22.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB0AD530;
	Mon, 30 Dec 2024 05:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735538198; cv=none; b=Z2DyuAnMS8xBl855be1PZ+NG1Gr1AcuD9mROx7tR+Rge62vMerXMSH79NvEVYTBoGC86GvTgddxPMKZj7dLXMZ8jpICJ6HLp/591fhoMvdTH1alx6QPAnZeydM4RwlUx2dyOKFpoF/ooR3GLtftTUIS0Mtaozi6/Jl+QQppeAE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735538198; c=relaxed/simple;
	bh=Caw9X8c/AOtLaoZfOjcBP14dg+I4hMHOLVkb6e9X5yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n/KHpsSWUoKi9RbvN4MTzG5ZtsKNNUpA3OaNwa3g8X/oehcCmnqel1isRNEnTmrBDHP4yvizoXGx+t0MWnLiG236NYonhr7vX7NgugzSshEFE34/9JabuB8dl3F+aV6BAPQyWBZfGqhbvgqpHKzRNj04+v7tUA4gR01uhMFs3jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=j6IRiyX7; arc=none smtp.client-ip=193.252.22.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id S8l8tkZLcoTrQS8lDt2Yra; Mon, 30 Dec 2024 06:56:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1735538188;
	bh=Q9QNz/+pHQJbKYhMRfdFe0lkRXf4CyHO3rSJeyUsCU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=j6IRiyX71wSiQDpGnqShqQc0icg8rLYcWvDOXoDTPpUWjIFNOGxgGxr4C2xf8O/53
	 MO8dLaRaz7RLLZhnIk53tQzBB9hwzB+CqWrRtIQMSEGwCOLP2cj1Z3/F8Jfsrel2wc
	 x/BqcB2mypIZUadkNHT+h7Znwc0ljChfm0ru739Tahb6PzU1h2uuhK7WL3Lq1CQVd4
	 3DAQzGlqowTjLzSoAByShXybbGw6aK48Ms0H4MSIpuigkvlf7byIKp0RnEONpkskgJ
	 fmlCY3gHCCRYzUdMDXcRqKWIEqx87Bsb4c7B3gcW1tk7Cf1mnctatwW5NSVj27J9w2
	 1/7v1skZDoxYw==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Mon, 30 Dec 2024 06:56:28 +0100
X-ME-IP: 124.33.176.97
Message-ID: <41f77d39-bce3-4e3b-98c8-f248b723a24c@wanadoo.fr>
Date: Mon, 30 Dec 2024 14:56:09 +0900
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] can: Add Nuvoton NCT6694 CAN support
To: Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, tmyu0@nuvoton.com,
 lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 andi.shyti@kernel.org, mkl@pengutronix.de, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
 jdelvare@suse.com, alexandre.belloni@bootlin.com
References: <20241227095727.2401257-1-a0282524688@gmail.com>
 <20241227095727.2401257-5-a0282524688@gmail.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
In-Reply-To: <20241227095727.2401257-5-a0282524688@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/12/2024 at 18:57, Ming Yu wrote:
> This driver supports Socket CANfd functionality for NCT6694 MFD
> device based on USB interface.
> 
> Signed-off-by: Ming Yu <a0282524688@gmail.com>
> ---

(...)

> +config CAN_NCT6694
> +	tristate "Nuvoton NCT6694 Socket CANfd support"
> +	depends on MFD_NCT6694

I think it would be better to do a

	select MFD_NCT6694

here.

Then, make MFD_NCT6694 an hidden configuration in a similar fashion as
MFD_CORE. Alone, CONFIG_MFD_NCT6694 does nothing, so better to hide it
from the end user.

The comment also applies to the other patches.

> +	help
> +	  If you say yes to this option, support will be included for Nuvoton
> +	  NCT6694, a USB device to socket CANfd controller.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called nct6694_canfd.
> +

(...)

Yours sincerely,
Vincent Mailhol


