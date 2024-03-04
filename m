Return-Path: <linux-i2c+bounces-2176-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB4E8706C0
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 17:16:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93BA528D711
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 16:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD734C634;
	Mon,  4 Mar 2024 16:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="WwPAwkJE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2084.outbound.protection.outlook.com [40.107.8.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C68A4D5B7;
	Mon,  4 Mar 2024 16:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.8.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709568964; cv=fail; b=hQOXPeLJ+xR2+2XV5WWnEkK+08FQTjbEGDtRGCWEUA41LsP8Z7mN+b6Sllowt5XO//X2QG1zf9p+d7jUMgc4HwioPoR+jp/60AMjJ0fHaiYnQhKTb8pmhQl1t4AHqcbgxI8DwRn37mT23hcWQM09bkThA7s7DAJJtTtW1alPEK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709568964; c=relaxed/simple;
	bh=r8L8OmcBAFVQieXkwkkQcxlqJGM3vJduaGVphdDvqOI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jez1PY07VTTO06RjmLyvMjWp1mgaYP2YoKlXTzl5L0/6ZHBKecJFRNjHOFGvC/XPF8wJnUZQ5nrAks+LMOR52ZYtOShKLrH3EQWPbLcwE7GIzgRDvvWrNduo7Nm/2/B+r8r1dCIFcQJgtqTUEUrjYoKhf1E9UNIfeBV+p54+9f8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=WwPAwkJE; arc=fail smtp.client-ip=40.107.8.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocSD22CUzFbxPJ0rV9AtZ/wfvxWUQM2Eum51yfxYZ9/VzVMY/KXAUCG7qB+Y6ZUp+F/MidMydpX4gj4Ru0rjpN6Psf4JRsHlwJCeqcCjG8xn2BGcWVY7Kl0FN1G65shY0UvkQHEVoI+WKinjpL1ZrC4mWo2foXGYlLtUsjULjsVbr4xZ1HLcbICSeQ1rGAfguPZPK3ftMxp9eynDYZ/ofdZ3ZGc4Qnj4vm56A2NsTrC/ze4sl5pFb9bBA2y5C82jA4FWKPbtxIB3JPy5Ux+HynVyQ7g96qfEpWPk6VpQJWdLX0gcM5/oZro/8YMoCo/N157M0qL3sADBaICmQaf47w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLWrDOb3qwcu0hhaI9F81MXmgjxyHBNTVGIDeh9LrHc=;
 b=JBbeXk7uka9jLidATWQcUG0FTtJyunbwtYLR/C9zggiUs9s27W4762kkGW/y78m/sLCO2CAgQxCSKns6HmJ89b5EBG2aR7JzYCKAO3jsw4gNOQqy3HdGPbxwqIXDNf2EPSWlTdKkb4zvcep2Anf6IfwdvaO7xYk79wU+G8J72scmTcAeCH+m0UpZzOvPAmKB++g5oo7ZR3owaOhjPEjxo/sEoNo+UogUPNo8gM/E3sUhknumWst045kyhOV8hMJvAE0DaMlWL6yWsFlt5lil1xjX7GX3MlUXhc7PPBJHgbB3iJ/zwEywuV+92/Gmf6l4F4eoF3xvmvcn19ZlMSv6Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLWrDOb3qwcu0hhaI9F81MXmgjxyHBNTVGIDeh9LrHc=;
 b=WwPAwkJEUPowq54IeSF3jKWxmhJLK58HS8h7shI7Kxt6wg5k6d4C6Ch7Uw3ACkTo5wardOjT2Th2zW3R9OoTDLzpWZC1/Ogb0UWNIGL8FWkgGtttfJT+uVlOl7I84RjqL+v39vtgkZ17h8IrkYQQqlWSf2t/HX2bwdhO2kiCmS4=
Received: from AS4P250CA0022.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::12)
 by AS8PR02MB8295.eurprd02.prod.outlook.com (2603:10a6:20b:523::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 16:15:58 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::f2) by AS4P250CA0022.outlook.office365.com
 (2603:10a6:20b:5e3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38 via Frontend
 Transport; Mon, 4 Mar 2024 16:15:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 16:15:58 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 4 Mar
 2024 17:15:58 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 4 Mar
 2024 17:15:58 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 4 Mar 2024 17:15:58 +0100
Received: from pc36611-1939.se.axis.com (pc36611-1939.se.axis.com [10.88.125.175])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 129BC159AD;
	Mon,  4 Mar 2024 17:15:58 +0100 (CET)
Received: by pc36611-1939.se.axis.com (Postfix, from userid 363)
	id 00D5C629C1; Mon,  4 Mar 2024 17:15:57 +0100 (CET)
Date: Mon, 4 Mar 2024 17:15:57 +0100
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Jesper Nilsson <jesper.nilsson@axis.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	<linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>
Subject: Re: [PATCH] i2c: exynos5: Init data before registering interrupt
 handler
Message-ID: <20240304161557.GS30969@axis.com>
References: <20240304-i2c_exynos5-v1-1-e91c889d2025@axis.com>
 <vpe5jvnhz3r5cpfiofwrelp62awe74knbxrz47i2deflczx276@yahhrshr355r>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <vpe5jvnhz3r5cpfiofwrelp62awe74knbxrz47i2deflczx276@yahhrshr355r>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A67:EE_|AS8PR02MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: e583dec0-28f2-45e2-9a0f-08dc3c6660b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	syK8xdjqAQZvj/4d6YfzELojNAjWfe76HZNbstyF8LNd2EiI1H8r9kSVQ+PT6bbw0rQdcfFlFLeiGPaQtuGpYK/FL6NENcXAPa6bO9IRjV+fc2GMjGdgpC3Z4YCUVIawI8XaWOzIyyJBRDnMj0c0DfdOD54ZpPpaXa68VOk5gJdjuSlpxePDmmHh9Rltwl+pj9QqZiAp/aogtFqcpkho8BBw2ZdCif4DNqAX0ylNjmbEID+Emd1Ote6A9HCEhX7iqkXywslnrToTj11PDAk7f2/NUtfTE8njnT19YpqTBAbgcICiRHxA4W6pNe2+jmpD9xoAaAT9gXWfYtJxt8QXMkAICBIdF/snFOsDYW1zg7DUIS1PwRVX94gZYfHYR2boGk128kfwLlNXJmkxe3ON1IkpXDQVUFjC8XqssFitCCnrvdveOGOjlOH+VpZcl9wDim+JJexjp7FeBF1er2NK3PUw5CpmMBKn4zX3IzYqReMQfi/S3ZccViVw9NyMKwAxCFy2M9EXzEnOuRIdNR0oJzIOMeX/I1+WGwMLNfakDYkwcW6Ky6o2QoQpULWUDkP0GyzCJVeUSWCe2b6qRfBpvgfLl06SPSmDkEtfno1uvN2JaO4BivABj48OPLxTVP7JPh9xf8b5HnxhUkEFPvhgTo9GgJOcbHx69rQqOsewbX9IwOUY1v8uuduCkrz7dpHUBrDfSGv41iy0XqIMfmzbTs1jIUV3u0Oo33s5ST/evOLD5lfUymys8RWO3J/9ENvQ
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 16:15:58.6406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e583dec0-28f2-45e2-9a0f-08dc3c6660b9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB8295

On Mon, Mar 04, 2024 at 04:04:08PM +0100, Andi Shyti wrote:
> Hi Jesper,

Hi Andi,

> On Mon, Mar 04, 2024 at 12:01:14PM +0100, Jesper Nilsson wrote:
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
> 
> I'm OK with moving the irq request at the end and I'm going to
> give my r-b anyway. There is still one comment below.

Thanks.

> > Additionally, return failure if we can't find a match in devicetree.
> > 
> > Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
> 
> The way you are describing it you would need the Fixes tag here
> and this patch should be treated as a fix.

Ok, the variant member was introduced in:

218e1496135e ("i2c: exynos5: add support for HSI2C on Exynos5260 SoC")

Before that, the ordering didn't matter.

> Nevertheless, I think that it's odd that the device is sending
> interrupts at this phase and the real fix should be preventing
> the controller to send interrupts here.

I found this bug when we moved control of an I2C bus into secure
world (OP-TEE) and hadn't removed it from devicetree config.
Since we hadn't enabled the secure parts yet, the kernel could still get
the interrupt, even when OP-TEE was performing I2C transfers.

> How have you tested this patch?

This was tested in our ARTPEC-8 SoC, which includes the same IP the
exynos SoCs, both with and without the problematic configuration
described above.

> > ---
> >  drivers/i2c/busses/i2c-exynos5.c | 32 ++++++++++++++++++--------------
> >  1 file changed, 18 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> > index 385ef9d9e4d4..eba717e5cad7 100644
> > --- a/drivers/i2c/busses/i2c-exynos5.c
> > +++ b/drivers/i2c/busses/i2c-exynos5.c
> > @@ -906,24 +906,14 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
> >  	i2c->adap.algo_data = i2c;
> >  	i2c->adap.dev.parent = &pdev->dev;
> >  
> > -	/* Clear pending interrupts from u-boot or misc causes */
> > -	exynos5_i2c_clr_pend_irq(i2c);
> > -
> >  	spin_lock_init(&i2c->lock);
> >  	init_completion(&i2c->msg_complete);
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
> >  	i2c->variant = of_device_get_match_data(&pdev->dev);
> > +	if (!i2c->variant) {
> > +		dev_err(&pdev->dev, "can't match device variant\n");
> > +		return -ENODEV;
> 
> return dev_err_probe(), please.

Will do.

> Andi

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com

