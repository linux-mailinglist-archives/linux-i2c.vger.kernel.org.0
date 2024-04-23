Return-Path: <linux-i2c+bounces-3066-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F018AE31D
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 12:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93C8128AB46
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 10:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A288585C65;
	Tue, 23 Apr 2024 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KwIJrc7A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B6A824A4;
	Tue, 23 Apr 2024 10:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713869629; cv=none; b=iTM2wGl4UDGy7Eqt2A0PKr7s4EByaD6VNCKkxMgxFXaqELsN/1tTjx9MkMWTPMQNdu2bKzsVYz134D9fw7mO/tbfNH2smhZk/YReYSElUDsZc9V6ATLTD4BI+IglIt2k3WueEtTQvWbcwEPDmUrbsPO3QOEDF2taKCN5ceypCPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713869629; c=relaxed/simple;
	bh=LrmdXQwT4U4g4BrzSOIGcl4UVDjaVzUdJEoh8Po20rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cjc5OzdU7YeMYkC5hoGuhxKH7jx4LCAipEfPK4GQ/2/sisnaW50gTUCu6bCfJWIs7NUtlwoYOAas9awQJYmSh8szlDLnlET9gCmCp3ie5q0WXSrjCH7ColwFvmirDwFhvAngRnRiF/uj+a6/zY+QJK2esW4SOACiJV8nGr01YeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KwIJrc7A; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3442E000A;
	Tue, 23 Apr 2024 10:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713869624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LO0/KBAgvShTcAJdKgnWdGKkN3QsevtB0Y7cE2P2ynU=;
	b=KwIJrc7A3BRzlbEC4BAMGMC3UhWnjAUAKktH+AeN9xTRxinYxN4uHtqrXp3BAMpGSCtKuW
	EHdUq5EIvACj1peiZv3/QYxbj+pk5rhhVMPokdO6cRPcJ05lF455YRvnu70XV+wQUHSNzN
	MOLdzjs6cmPSEIYHt+hbeRMIWH51OYlGYNVFuQAa09/GVl+uaG6Uw2gTxKwFVASzLbFf+L
	i2Sh+JmqFAz6E9pux/W/+n8AbPEfEPufhexCHt8Nih224Js90u0RciZ5cjH84Bbb4HScMD
	9E7THt+SiW1Qo9zHY9y86QjvrCr3hUycq7V9K66jwGFcWIDxmM2k/aRt1NhqDw==
Message-ID: <c5ed5bed-9c93-47eb-8277-d78e12e96b42@bootlin.com>
Date: Tue, 23 Apr 2024 12:53:42 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/11] gpio: pca953x: move suspend()/resume() to
 suspend_noirq()/resume_noirq()
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>,
 Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gregory.clement@bootlin.com,
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com>
 <20240102-j7200-pcie-s2r-v5-1-4b8c46711ded@bootlin.com>
 <CAMuHMdVnKX23yi7ir1LVxfXAMeeWMFzM+cdgSSTNjpn1OnC2xw@mail.gmail.com>
 <CAHp75Vf+F3ArczHQ+nSmP4uFvRdMAQWufmR6xR0xtbHfVvFm-g@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAHp75Vf+F3ArczHQ+nSmP4uFvRdMAQWufmR6xR0xtbHfVvFm-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

On 4/23/24 12:34, Andy Shevchenko wrote:
> On Tue, Apr 23, 2024 at 12:42 PM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Tue, Apr 16, 2024 at 3:31 PM Thomas Richard
>> <thomas.richard@bootlin.com> wrote:
> 
> ...
> 
>>         +i2c-rcar e66d8000.i2c: error -16 : 10000005
> 
> It probably means that I²C host controller is already in power off
> mode and can't serve anymore.

Hello,

Yes the i2c controller is already off.
In fact it's the same issue I had with the i2c-omap driver.
In suspend-noirq, the runtime pm is disabled, so you can't wakeup a
device. More details available in this thread [1].
So the trick is to wakeup the device during suspend (like I did for the
i2c-omap driver [2].

[1]
https://lore.kernel.org/all/f68c9a54-0fde-4709-9d2f-0d23a049341b@bootlin.com/
[2]
https://lore.kernel.org/all/20240102-j7200-pcie-s2r-v5-2-4b8c46711ded@bootlin.com/

I think the patch below should fix the issue.

--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1232,7 +1232,7 @@ static void rcar_i2c_remove(struct platform_device
*pdev)
        pm_runtime_disable(dev);
 }

-static int rcar_i2c_suspend(struct device *dev)
+static int rcar_i2c_suspend_noirq(struct device *dev)
 {
        struct rcar_i2c_priv *priv = dev_get_drvdata(dev);

@@ -1240,7 +1240,7 @@ static int rcar_i2c_suspend(struct device *dev)
        return 0;
 }

-static int rcar_i2c_resume(struct device *dev)
+static int rcar_i2c_resume_noirq(struct device *dev)
 {
        struct rcar_i2c_priv *priv = dev_get_drvdata(dev);

@@ -1248,8 +1248,23 @@ static int rcar_i2c_resume(struct device *dev)
        return 0;
 }

+static int rcar_i2c_suspend(struct device *dev)
+{
+       pm_runtime_get_sync(dev);
+
+       return 0;
+}
+
+static int rcar_i2c_resume(struct device *dev)
+{
+       pm_runtime_put(dev);
+
+       return 0;
+}
+
 static const struct dev_pm_ops rcar_i2c_pm_ops = {
-       NOIRQ_SYSTEM_SLEEP_PM_OPS(rcar_i2c_suspend, rcar_i2c_resume)
+       NOIRQ_SYSTEM_SLEEP_PM_OPS(rcar_i2c_suspend_noirq,
rcar_i2c_resume_noirq)
+       SYSTEM_SLEEP_PM_OPS(rcar_i2c_suspend, rcar_i2c_resume)
 };

 static struct platform_driver rcar_i2c_driver = {

> 
>>         +pca953x 4-0020: Failed to sync GPIO dir registers: -16
>>         +pca953x 4-0020: Failed to restore register map: -16
>>         +pca953x 4-0020: PM: dpm_run_callback(): pca953x_resume_noirq
>> returns -16
>>         +pca953x 4-0020: PM: failed to resume async noirq: error -16
> 
> Yeah, with this it's kinda forcing _every_ I²C host controller PM to
> be moved also to noirq() or alike.

Yes indeed.
But this controller is already in noirq().
So the issue was already there.
We never saw it because we never did i2c accesses in noirq().

Best Regards,

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


