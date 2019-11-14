Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F25EFC07D
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2019 08:06:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfKNHFy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Nov 2019 02:05:54 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:5919 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbfKNHFx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Nov 2019 02:05:53 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dccfc990000>; Wed, 13 Nov 2019 23:04:57 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 13 Nov 2019 23:05:53 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 13 Nov 2019 23:05:53 -0800
Received: from [10.26.11.169] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Nov
 2019 07:05:49 +0000
Subject: Re: [PATCH 4/4] i2c: tegra: Use dma_request_chan() directly for
 channel request
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        <ludovic.desroches@microchip.com>, <agross@kernel.org>,
        <wsa+renesas@sang-engineering.com>, <ldewangan@nvidia.com>
CC:     <vkoul@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <digetx@gmail.com>,
        <linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <bjorn.andersson@linaro.org>
References: <20191113092235.30440-1-peter.ujfalusi@ti.com>
 <20191113092235.30440-5-peter.ujfalusi@ti.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <f30dcd10-69ea-3bf7-99b2-8d12fc5e4cc0@nvidia.com>
Date:   Thu, 14 Nov 2019 07:05:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113092235.30440-5-peter.ujfalusi@ti.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1573715097; bh=O6KZFyLZuFHEE0pSxKeMDrvyD0ZoQtkJ/GCRvWgCOI8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Kop+Xy25OEwejkOYPUki5yFu/wE3V2TRZSLTdL9ZwBNiV74MidPTkwLngo6wP9OCt
         yINidW4LI0EIzHazIA08czYJYDjhLA6I82mHJD5y8zmYXVLpqvjxLOtkgKC8cH8jbh
         eb599Q8qMFPUPEdrWRwE5+53ME9JMqOMbkVDczWPEbhk6iVEyCCFCIZRitDOrMJzVI
         Lzmeh3Klywnr9XqW8+97lw3+N3Hp8nPsuScAoG3LaV9ZlOJJOm4DeDbeSCsHt1mtcu
         U1eh954ISYvcs+bJYm2UUDLlY5ERYT3ogitpvhf581kvp47BzVY0oL7Je/lzr5K1on
         PWn34Qx06XZDA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 13/11/2019 09:22, Peter Ujfalusi wrote:
> dma_request_slave_channel_reason() is:
> #define dma_request_slave_channel_reason(dev, name) \
> 	dma_request_chan(dev, name)
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index c1683f9338b4..a98bf31d0e5c 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -413,7 +413,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>  		return 0;
>  	}
>  
> -	chan = dma_request_slave_channel_reason(i2c_dev->dev, "rx");
> +	chan = dma_request_chan(i2c_dev->dev, "rx");
>  	if (IS_ERR(chan)) {
>  		err = PTR_ERR(chan);
>  		goto err_out;
> @@ -421,7 +421,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>  
>  	i2c_dev->rx_dma_chan = chan;
>  
> -	chan = dma_request_slave_channel_reason(i2c_dev->dev, "tx");
> +	chan = dma_request_chan(i2c_dev->dev, "tx");
>  	if (IS_ERR(chan)) {
>  		err = PTR_ERR(chan);
>  		goto err_out;
> 
Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers!
Jon


-- 
nvpublic
