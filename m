Return-Path: <linux-i2c+bounces-2255-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4139E8750D3
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 14:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAE0028A05B
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 13:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB86012EBC8;
	Thu,  7 Mar 2024 13:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fivetechno.de header.i=@fivetechno.de header.b="nL43zlXd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from wp725.webpack.hosteurope.de (wp725.webpack.hosteurope.de [80.237.130.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489F312E1FB;
	Thu,  7 Mar 2024 13:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709819234; cv=none; b=mlO5KGPuGzz09Of1DhbUg2BbiXOx/2Gzngk/mccPNpbzoy0RWVEuglRizXPbiPvx/pZ1K8BDQCJ5lPAV+bmOKIVh4osv0FWEDq1FbScUy2am7uYQu866JNLfpjVvB0LwtX24PURI8wAXSCtWvhrXCwIRonKE73fM8yDOovTlt/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709819234; c=relaxed/simple;
	bh=dv62tGRYptDubici5vM7ijhoWIhLm4YHQ1AoA3GAGlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hp9Nwa14h6bEdz3NyOM2DYq1OeAObeRajxz60Edta2jV0NzHqlLYVGAYAUG7d6mvbmWCfPZTtvIbgPKLezc0KiZ/eLdOBP+EbvuG+QcnY01I0Mgt66Zban6Bmsa0dPEyerh+/ViWhsZuUbmbRJmD9VTfspORYxUWLaZQfgNyP6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fivetechno.de; spf=pass smtp.mailfrom=fivetechno.de; dkim=pass (2048-bit key) header.d=fivetechno.de header.i=@fivetechno.de header.b=nL43zlXd; arc=none smtp.client-ip=80.237.130.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fivetechno.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fivetechno.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fivetechno.de; s=he121032; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=L3pILwjmWiNz/UuxYopFxz90O1sPL169tOa3rXJQcXc=; t=1709819232;
	x=1710251232; b=nL43zlXd8jFdtBaft5Qw2hoC/rhg3dMAkK+0dHQ3+ONMGbYzUBu6BkL74ezik
	4MOrRDG+hUuf85y9UZjgbBx1kMbWy+h/fM0zb83HSEOBisCSHViCSCEZtNua/+uZX3/HtijJMAQtv
	YXdQcagC8MmNZknBnb0dV+X34ZN27UYJivJr5sUfniKVjN+k2uzbjj2feotdCtkliAuSeELME9I3G
	3pfvZX79+WCT5FlZppdbKiHdQ3Vrv7bBFay9MeUV7hpswqgAJZWADnJpo2sN2nU3+vxXjz9qh+tg/
	kNPp7sk42qnxaKZcgjo4FbVxnmwOt9ADSGdcpn6dhAh6fhckvQ==;
Received: from p5098d998.dip0.t-ipconnect.de ([80.152.217.152] helo=hermes.fivetechno.de); authenticated
	by wp725.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	id 1riDoU-0002B4-Do; Thu, 07 Mar 2024 14:29:34 +0100
X-Virus-Scanned: by amavisd-new 2.12.1 using newest ClamAV at
	linuxbbg.five-lan.de
Received: from [192.168.178.100] (p508f320b.dip0.t-ipconnect.de [80.143.50.11])
	(authenticated bits=0)
	by hermes.fivetechno.de (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id 427DTVIU021364
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 7 Mar 2024 14:29:32 +0100
Message-ID: <a46e91ad-8cbc-4a4d-9268-f27906077e68@fivetechno.de>
Date: Thu, 7 Mar 2024 14:29:31 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c: exynos5: Init data before registering interrupt
 handler
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Andi Shyti
 <andi.shyti@kernel.org>,
        Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
References: <CGME20240305105548eucas1p110f1ecf1570ff69a618ca86297eeba89@eucas1p1.samsung.com>
 <20240305-i2c_exynos5-v3-1-17a749688806@axis.com>
 <949c82da-f0dc-4824-ac57-bc86ae42d871@samsung.com>
From: Markus Reichl <m.reichl@fivetechno.de>
Content-Language: de-DE
Autocrypt: addr=m.reichl@fivetechno.de; keydata=
 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
 ZnS2JHg/17+ErCtiUzuJ5EGMPA==
In-Reply-To: <949c82da-f0dc-4824-ac57-bc86ae42d871@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;m.reichl@fivetechno.de;1709819232;308ca482;
X-HE-SMSGID: 1riDoU-0002B4-Do

Hi Marek,

Am 07.03.24 um 12:41 schrieb Marek Szyprowski:
> On 05.03.2024 11:50, Jesper Nilsson wrote:
> > devm_request_irq() is called before we initialize the "variant"
> > member variable from of_device_get_match_data(), so if an interrupt
> > is triggered inbetween, we can end up following a NULL pointer
> > in the interrupt handler.
> >
> > This problem was exposed when the I2C controller in question was
> > (mis)configured to be used in both secure world and Linux.
> >
> > That this can happen is also reflected by the existing code that
> > clears any pending interrupts from "u-boot or misc causes".
> >
> > Move the clearing of pending interrupts and the call to
> > devm_request_irq() to the end of probe.
> >
> > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> > Fixes: 218e1496135e ("i2c: exynos5: add support for HSI2C on Exynos5260 SoC")
> > Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
> > ---
> > Changes in v3:
> > - Avoid multiple assignment
> > - Link to v2: https://lore.kernel.org/r/20240304-i2c_exynos5-v2-1-7b9c312be719@axis.com
> >
> > Changes in v2:
> > - Use dev_err_probe() instead of open coding it
> > - Dropped the return failure if we can't find a match in devicetree
> > - Link to v1: https://lore.kernel.org/r/20240304-i2c_exynos5-v1-1-e91c889d2025@axis.com
> > ---
> >   drivers/i2c/busses/i2c-exynos5.c | 29 +++++++++++++++--------------
> >   1 file changed, 15 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> > index 385ef9d9e4d4..8458e22313a7 100644
> > --- a/drivers/i2c/busses/i2c-exynos5.c
> > +++ b/drivers/i2c/busses/i2c-exynos5.c
> > @@ -906,23 +906,9 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
> >   	i2c->adap.algo_data = i2c;
> >   	i2c->adap.dev.parent = &pdev->dev;
> >   
> > -	/* Clear pending interrupts from u-boot or misc causes */
> > -	exynos5_i2c_clr_pend_irq(i2c);
> > -
> >   	spin_lock_init(&i2c->lock);
> >   	init_completion(&i2c->msg_complete);
> >   
> > -	i2c->irq = ret = platform_get_irq(pdev, 0);
> > -	if (ret < 0)
> > -		goto err_clk;
> > -
> > -	ret = devm_request_irq(&pdev->dev, i2c->irq, exynos5_i2c_irq,
> > -			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c);
> > -	if (ret != 0) {
> > -		dev_err(&pdev->dev, "cannot request HS-I2C IRQ %d\n", i2c->irq);
> > -		goto err_clk;
> > -	}
> > -
> >   	i2c->variant = of_device_get_match_data(&pdev->dev);
> >   
> >   	ret = exynos5_hsi2c_clock_setup(i2c);
> > @@ -940,6 +926,21 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
> >   	clk_disable(i2c->clk);
> >   	clk_disable(i2c->pclk);
> >   
> > +	/* Clear pending interrupts from u-boot or misc causes */
> > +	exynos5_i2c_clr_pend_irq(i2c);
>
> Just above this call the clocks have been disabled, so any access to the 
> i2c host registers will result in freeze or external abort (depending on 
> the soc/cpu).
>
> To make things worse, this patch moved registering the interrupt handler 
> after the i2c_add_adapter() call. This means that all i2c devices that 
> will be probbed directly from i2c_add_adapter() won't be able to access 
> the i2c bus, as the host controller is still not fully functional that 
> time yet.
>
> This breaks today's linux-next on all Exynos5+ platforms. Has anyone 
> tested this change?
Tested this patch on top of stable 6.7.9, breaks booting odroid-xu4.

Gruß,
--
Markus

>
> > +
> > +	ret = platform_get_irq(pdev, 0);
> > +	if (ret < 0)
> > +		goto err_clk;
> > +	i2c->irq = ret;
> > +
> > +	ret = devm_request_irq(&pdev->dev, i2c->irq, exynos5_i2c_irq,
> > +			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c);
> > +	if (ret != 0) {
> > +		dev_err(&pdev->dev, "cannot request HS-I2C IRQ %d\n", i2c->irq);
> > +		goto err_clk;
> > +	}
> > +
> >   	return 0;
> >   
> >    err_clk:
> >
> Best regards


