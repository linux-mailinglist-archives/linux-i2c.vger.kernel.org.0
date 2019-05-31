Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DED4F30A6B
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2019 10:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbfEaIhJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 May 2019 04:37:09 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:17795 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfEaIhJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 May 2019 04:37:09 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf0e7b40000>; Fri, 31 May 2019 01:37:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 31 May 2019 01:37:08 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 31 May 2019 01:37:08 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 May
 2019 08:37:07 +0000
Subject: Re: [PATCH] i2c: tegra: Avoid error message on deferred probe
To:     Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>
References: <20190527102939.7616-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <8106bcc4-6417-1c43-99af-18056d8d51df@nvidia.com>
Date:   Fri, 31 May 2019 09:37:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190527102939.7616-1-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559291828; bh=trN/OTWlYTfpcvHfKy8yOeMWA2H3/turqmywvBWtSjU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=fk+UOAi8RXQzWdFH9XGNV3J1qLMavAOr+w/HVzJDxjTTitzd3UucBMEyB4VoMPS2j
         jeuuiknzdkqPelMf/z07oDAMnhzLGAM/yf/wp2KCfLDaNLr3f2YSmtPavMrmVtU2pK
         LYS1uGAN0tXKCT7w9ozR3WuMKzBf6g/xmpzV+QfhrMSvMD8oXNLUKaD7QsJAr5mPsR
         anLAP0ZxKDcPbd425BLRIrdAlx6fP9jubVA5Di8o6BqnAO1FWUVCsDzr+FRNJ1A9Cj
         hPZ1JSUYsC8wIWBgPyxavWLKAfqDgBUdtHhW6QEdAibP4I2AyAbp3s2Q0ea7pOM+mj
         BJ31sDaIZ3kVQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 27/05/2019 11:29, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> If the driver defers probe because of a missing clock, avoid outputting
> an error message. The clock will show up eventually.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index ebaa78d17d6e..6bfd5297f425 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1517,7 +1517,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  
>  	div_clk = devm_clk_get(&pdev->dev, "div-clk");
>  	if (IS_ERR(div_clk)) {
> -		dev_err(&pdev->dev, "missing controller clock\n");
> +		if (PTR_ERR(div_clk) != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "missing controller clock\n");
> +
>  		return PTR_ERR(div_clk);
>  	}

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
