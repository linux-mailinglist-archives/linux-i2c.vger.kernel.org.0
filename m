Return-Path: <linux-i2c+bounces-8169-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D189D7560
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Nov 2024 16:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 096D32855B4
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Nov 2024 15:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB98B2500B1;
	Sun, 24 Nov 2024 15:32:26 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B472500A1;
	Sun, 24 Nov 2024 15:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732462346; cv=none; b=Bzuzgb5u3KnY2uQ2tAt0TyONHMZLGcapZrw2jLpUoIF4/Je39mRBVPVwl3RjZN0wQVPRQLkTrCfUcIpDGfk8lG7t5d89PPhWqYTQKPiozfczkfngODwYaAsmYZyG9o44KPDEskKkU5wn+yN6hxle+N39v2juH4bCJ/ho+KfilaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732462346; c=relaxed/simple;
	bh=r4cqQ8x73yV5c4ZrFuKzmCWAiAAuK+5dZHm6PMgswsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4YstI1tcmxHUjvw9xUI81sgOCbwixGXtpDO7AKzPcleiKkklhjuE5Ty/mYHSu0OGPyMa0j44vh4UUKCBmuBz1qzIGsShQ7Linl4Wz2KvfwabtLknhvHqw9u0awhexVdoPZX3RNC/msSoCFcbFEh+hA/MFenopCFtinCvJhbuWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Sun, 24 Nov 2024 23:32:13 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <20241124153213-GYA3212048@gentoo>
References: <20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com>
 <20241112-k1-i2c-master-v3-2-5005b70dc208@gmail.com>
 <20241114064943-GYA998060@gentoo>
 <46a81098-3092-44a0-a625-bd17b4ba0e2b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46a81098-3092-44a0-a625-bd17b4ba0e2b@gmail.com>

Hi Troy:

On 12:11 Thu 21 Nov     , Troy Mitchell wrote:
> Hi, Yixun. thanks for ur review.
> 
> On 2024/11/14 14:49, Yixun Lan wrote:
> > On 11:07 Tue 12 Nov     , Troy Mitchell wrote:
> >> From: Troy Mitchell <troymitchell988@gmail.com>
> >>
> >> This patch introduces basic I2C support for the SpacemiT K1 SoC,
> >> utilizing interrupts for transfers.
> >>
> >> The driver has been tested using i2c-tools on a Bananapi-F3 board,
> >> and basic I2C read/write operations have been confirmed to work.
> >>
> >> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> >> ---
> >>  drivers/i2c/busses/Kconfig  |  19 ++
> >>  drivers/i2c/busses/Makefile |   1 +
> >>  drivers/i2c/busses/i2c-k1.c | 656 ++++++++++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 676 insertions(+)
> >>
...
> >> +
> >> +static int spacemit_i2c_probe(struct platform_device *pdev)
> >> +{
> >> +	struct spacemit_i2c_dev *i2c;
> >> +	struct device_node *of_node = pdev->dev.of_node;
> >> +	struct clk *clk;
> >> +	int ret = 0;
> >> +
> >> +	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
> >> +	if (!i2c)
> >> +		return -ENOMEM;
> >> +
> >> +	i2c->dev = &pdev->dev;
> >> +
> >> +	i2c->base = devm_platform_ioremap_resource(pdev, 0);
> >> +	if (IS_ERR(i2c->base))
> >> +		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->base), "failed to do ioremap");
> >> +
> >> +	i2c->irq = platform_get_irq(pdev, 0);
> >> +	if (i2c->irq < 0)
> >> +		return dev_err_probe(&pdev->dev, i2c->irq, "failed to get irq resource");
> >> +
> >> +	ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
> >> +			       IRQF_NO_SUSPEND | IRQF_ONESHOT, dev_name(i2c->dev), i2c);
> >> +	if (ret)
> >> +		return dev_err_probe(&pdev->dev, ret, "failed to request irq");
> >> +
> >> +	disable_irq(i2c->irq);
> >> +
> >> +	clk = devm_clk_get_enabled(&pdev->dev, NULL);
> >> +	if (IS_ERR(clk))
> >> +		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "failed to enable clock");
> >> +
> > I'd suggest also to handle pin request here, since pinctrl driver is merged
> > 
> > https://lore.kernel.org/all/CACRpkdYnaJsKKfcdhHeMGTTp86M+wNODzZx2e=OYbxQ4Jc4Rjw@mail.gmail.com/
> sry, I don't understand what pin I need to request?
> > 

I was suggesting to add devm_pinctrl_get(), but after checking,
this is not needed anymore since it's already handled by device core,
so no need to change here..

check drivers/core/pinctrl.c -> pinctrl_bind_pins()

> >> +	i2c_set_adapdata(&i2c->adapt, i2c);
> >> +	i2c->adapt.owner = THIS_MODULE;
> >> +	i2c->adapt.algo = &spacemit_i2c_algo;
> >> +	i2c->adapt.dev.parent = i2c->dev;
> >> +	i2c->adapt.nr = pdev->id;
> >> +
> >> +	i2c->adapt.dev.of_node = of_node;
> >> +	i2c->adapt.algo_data = i2c;
> >> +
> >> +	strscpy(i2c->adapt.name, "spacemit-i2c-adapter", sizeof(i2c->adapt.name));
> >> +
> >> +	init_completion(&i2c->complete);
> >> +
> >> +	ret = i2c_add_numbered_adapter(&i2c->adapt);
> >> +	if (ret)
> >> +		return dev_err_probe(&pdev->dev, ret, "failed to add i2c adapter");
> >> +
> >> +	platform_set_drvdata(pdev, i2c);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static void spacemit_i2c_remove(struct platform_device *pdev)
> >> +{
> >> +	struct spacemit_i2c_dev *i2c = platform_get_drvdata(pdev);
> >> +
> >> +	i2c_del_adapter(&i2c->adapt);
> >> +}
> >> +
> >> +static const struct of_device_id spacemit_i2c_of_match[] = {
> >> +	{ .compatible = "spacemit,k1-i2c", },
> >> +	{ /* sentinel */ }
> >> +};
> >> +MODULE_DEVICE_TABLE(of, spacemit_i2c_of_match);
> >> +
> >> +static struct platform_driver spacemit_i2c_driver = {
> >> +	.probe = spacemit_i2c_probe,
> >> +	.remove = spacemit_i2c_remove,
> >> +	.driver = {
> >> +		.name = "i2c-k1",
> >> +		.of_match_table = spacemit_i2c_of_match,
> >> +	},
> >> +};
> >> +module_platform_driver(spacemit_i2c_driver);
> >> +
> >> +MODULE_LICENSE("GPL");
> >> +MODULE_DESCRIPTION("I2C bus driver for SpacemiT K1 SoC");
> >>
> >> -- 
> >> 2.34.1
> >>
> > 
> 
> -- 
> Troy Mitchell

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

