Return-Path: <linux-i2c+bounces-2177-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC938706D3
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 17:18:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51853B28558
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 16:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037AF4C62A;
	Mon,  4 Mar 2024 16:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="BdAZStcd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D357A46BA0;
	Mon,  4 Mar 2024 16:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709569043; cv=fail; b=GuKkuHII3M8HM7K/3BTh0iUQoGpOZFTndOyGaxgMdyUMGG7xXN+l3tOuYs/vcxD9F1h7nLZBnfv1vGc7htTne/7Q5yLcLBeBkJag0gOyPgu8byj/gONkumpl0QNH2+q3683/e7fpak0YpJN6Va3ieqw/omukGbSST/Uj0w976OI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709569043; c=relaxed/simple;
	bh=E0GRFQ+ddfg+20L048w6VNnG5ALKE4+unskzwcLn1BE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEnYzGtVlgMlNcMoqJjZJNBceQtsMqGRmhbIX8u9jcGdFWXlSoZJ6ca40TWFX6T0QPyInNeYOKy6XWzHJ/daSfnlT6p2bUSIQI4fb3ML7dN6xiHpwYnJGMOnte/XfZORTKFGPpo8Y9DRwuPQpxyIbL1aPOtMQXJuHLRnZkG6Y7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=BdAZStcd; arc=fail smtp.client-ip=40.107.20.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQozS9ChAUc84lfb44EDHC21JKuqEx6iKUBfNkxUbs4lrKdCW5zpah/WDn8cQ96OaBPpWWxqYEQtDOMPls4ckqItwSBYVpqkjclcNayAoikhpBDk4OHCtXLUejeitW85x7Ppa5GjJEK1ueYICTlRJWomJ1kaFHRgBjl6fP1D/AubEn0sldzn1lg3DTcb0Am35KkphEuls4vqT3k54pGfm/JufGLfh2kussH321QqolIKRSP72YsRM9gY8Oz5KE3pWvADh43ir405+hNCdnJt5zxcecVJCnplUPWmMRkxuKAUuLkecm2Xf9d13XzjibSvJ/J3q4pcMydAge81dgOkag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRCRyTbJyV0/VuX7YXxeUW4q4muUvHZImqHNkxPJ6LU=;
 b=XZtT437QEYSKAlYghhuWmePafiWa8dDCsbolwSFzhrD0WqEC06PqbXNOuzjzIISIfiEVMWdLMn1JvCZM4dS+k2Am72PNks4SmdX0ZLEoQdqY4fxXyCYwa5kZJaTUrrGhpbGfcXyPc/9OfBGJz1RNdXnhquxgKGITEMuFQFCtnC7AcOnFlsBhWlyf5cQpm+D/20T/JZoGLOnyfupgcTjSuNtAlvBooehkTKPLV86S4O1ACQoMT4xnKuD2tm6dd2bsbfk7RMJQUUWyM8K9Rl6gASUopZ39xW7+ddexL1I2lKl4ld7P3h08S0zvfEeJX+b/+1S5AodUZbOtH5ztUwMxqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRCRyTbJyV0/VuX7YXxeUW4q4muUvHZImqHNkxPJ6LU=;
 b=BdAZStcdA0jeiIbX24WdnuzNiPltBVeJOL+eLQri8Mf/BYtMXCxmI8Xq4F2Ofczbugvi4ZLNgDCMH7UsJWksUOy9U+TEH21/uhx6EhYygkMiZbIwUsY56quWrcqgeOMo1bVOgztR+/Kb4ozvuf1IOlhv3XdaO+BwkxWJHjzMnNo=
Received: from AS9PR01CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::8) by PA4PR02MB6591.eurprd02.prod.outlook.com
 (2603:10a6:102:fd::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 16:17:19 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:20b:542:cafe::8e) by AS9PR01CA0030.outlook.office365.com
 (2603:10a6:20b:542::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38 via Frontend
 Transport; Mon, 4 Mar 2024 16:17:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 16:17:19 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 4 Mar
 2024 17:17:18 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 4 Mar
 2024 17:17:18 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 4 Mar 2024 17:17:18 +0100
Received: from pc36611-1939.se.axis.com (pc36611-1939.se.axis.com [10.88.125.175])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id A39F5159D3;
	Mon,  4 Mar 2024 17:17:18 +0100 (CET)
Received: by pc36611-1939.se.axis.com (Postfix, from userid 363)
	id 94643629C1; Mon,  4 Mar 2024 17:17:18 +0100 (CET)
Date: Mon, 4 Mar 2024 17:17:18 +0100
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Andi Shyti <andi.shyti@kernel.org>, Jesper Nilsson
	<jesper.nilsson@axis.com>, Alim Akhtar <alim.akhtar@samsung.com>,
	<linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>
Subject: Re: [PATCH] i2c: exynos5: Init data before registering interrupt
 handler
Message-ID: <20240304161718.GT30969@axis.com>
References: <20240304-i2c_exynos5-v1-1-e91c889d2025@axis.com>
 <vpe5jvnhz3r5cpfiofwrelp62awe74knbxrz47i2deflczx276@yahhrshr355r>
 <1f4a2ada-0867-4ee0-bf27-4d69ab85b2e4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1f4a2ada-0867-4ee0-bf27-4d69ab85b2e4@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000043:EE_|PA4PR02MB6591:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4124bd-7559-4420-a63c-08dc3c6690bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k1dEKfYVKl1+11EFlTfiBYTKYFBhMgb/edo88bJv5tKr8dMkUkHuWeScnxfNaUmEWmwr+roN81y7tUCoJIGVBj4XKiNMkZ3paHbg9FOzyqH4pQBMkRRz06Brio9hnJOzD2NaMLRBaFxpOaLM4XRWTknpir+umaP3BL2d5ZyimMiDhGG6OhWCbwNA+FTFZmOHXKHKp88xKH54uSZOSwf937KD2knNlLZqCFESKiJ1+Uh5NvsT+ihxz8uljq2MxpqeFquKax1uwvO/hTprfxpaBjzPm5wslooUcQak63m6008TG2Oi5evbJiKOtOczXXbTrE/D3rpCMzxepGMeDTQF4HC0xuaRuFuY6C/z1cH2xKOdAv0fzr8YcvsAdjk1lsLOHDIXpm71JCVhpUT/qfH3NOGbpbvBsE8OkH+M7wesPcHRK4F94+fezvH+IsibjtLXQfvWRYzjuA9rAe1AvTSfdIEkEqHyZsepPioF897ps89EpzOutybIbVvooBRmfu+t028PqepUecppzvBX6Qj764M5DFIMq8+Vwc7vFVxMDLf5+jBSm8h9ggP/TWTI4kBkCzIAOJzEQsFSyzaJOnU4dotn3sKAZACTVMdIU9gAULMTI9Az8WoANJprY7+ZF0x2c/eic9ekRuroAE/i6c4bxEfTuGQjIw/ZpeejGO3KHyI8VyaZ1cXKPkgXH8ootrDM02h27scPZ7K3oKCOwZxmb7IGcowdYFANrEmq/WRuFcxdeAKAmP3cl2qjmZKFvCJ2
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 16:17:19.2002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4124bd-7559-4420-a63c-08dc3c6690bb
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6591

On Mon, Mar 04, 2024 at 04:08:00PM +0100, Krzysztof Kozlowski wrote:
> On 04/03/2024 16:04, Andi Shyti wrote:
> >> -
> >>  	i2c->variant = of_device_get_match_data(&pdev->dev);
> >> +	if (!i2c->variant) {
> >> +		dev_err(&pdev->dev, "can't match device variant\n");
> >> +		return -ENODEV;
> > 
> > return dev_err_probe(), please.
> 
> How this condition even possibly happen? And how is this related to the
> problem described here?

No, it was not. That was part of the debugging before we understood
the real problem.

> No, don't mix two different issues.

No problem, I can drop this part.

> Best regards,
> Krzysztof

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com

