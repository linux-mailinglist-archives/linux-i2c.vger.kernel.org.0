Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E9EE22B0A2
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 15:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728914AbgGWNib (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 09:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbgGWNib (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jul 2020 09:38:31 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EB1BC0619DC;
        Thu, 23 Jul 2020 06:38:31 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id b25so6370884ljp.6;
        Thu, 23 Jul 2020 06:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gbgUXJzoQmu/CyHCYX1gPrRyz6UxytrtLC+nHiKEIms=;
        b=aBqqAbltM+xUguh9M2EcIA+vB5pJzYcXMV5fiW4zGf61niGUcbpW3cIHgEPvNA7sb+
         1MyJ3xoYb84iLhvCsV5kvenqFl05rD+1Fi3Z4S5PEyS7b0JMoPVn8mCntT8XutBLkAYE
         F6PQZybyGVUsAv541gjmniPmlHxoJONtO5lUESWACgtKovG4ZqZnkXbVD67VNoe1dDYu
         wLtkRkRQthfaJqDlxTVSZMNsQhx8lpjaH91Lnn1TR9dNIc37j7U4nLjKP0dy31+y2+J0
         7RluXMONkHpUC0OnOTaiua+r6AiE0vZ91Qmet1fvR+QcfPvSHDRxOlKAeAOeWsJZg4o8
         P6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gbgUXJzoQmu/CyHCYX1gPrRyz6UxytrtLC+nHiKEIms=;
        b=K44QRLEBbxS6aN2Iw9PpuNE9hkIKTnLGzN6InNvQyGgBfsbFmNVh6yof7XplIgGdoI
         k5WYPABLTcxHa77AXj6/EDDmLeqrWYGcCcTJaXaBIIgKJslvTlLmo+GTaWpXUUKAFTXk
         XHFeZhIu+tY3qm0VMYZqXJuj/egidCzyP8I/d9svm3oS77ZFIZf6TGegwf6Z+AqqjYSY
         bTCRrq5TcJwmTndY4MxTLxigNOOSS42bF9w0Oya3FvRI2BmDarDgyvZiK5HN9UPk1zCN
         Zeh2jZZYVhOYW6MtoEkHCzlCirq7cGj3mmNhGSMPtkIiogjsrhA47TI24bL09FOzgpK0
         pDFg==
X-Gm-Message-State: AOAM532nRIGh0Sr3WoKELURbbjD1AtfF88+EYhyFXncDvGnUpms1KN97
        ByxOyqZqAWcxSOZpIcX0oIs=
X-Google-Smtp-Source: ABdhPJynw6GyobMp/esQBz7xcF000oGh7ygbZLr7nBdNnBkky7FVmbk0iWMPgEgaixlrJU4iDTjKLA==
X-Received: by 2002:a2e:9957:: with SMTP id r23mr2131437ljj.127.1595511509830;
        Thu, 23 Jul 2020 06:38:29 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id h6sm2861765lfc.84.2020.07.23.06.38.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 06:38:29 -0700 (PDT)
Subject: Re: [PATCH 6/7] i2c: tegra: DMA support for t186 and t194
To:     Krishna Yarlagadda <kyarlagadda@nvidia.com>,
        linux-i2c@vger.kernel.org, thierry.reding@gmail.com
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldewangan@nvidia.com,
        smohammed@nvidia.com, rgumasta@nvidia.com
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
 <1595506733-10307-6-git-send-email-kyarlagadda@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <18e4e5df-3d8f-3e52-b9b2-ff0558d6196c@gmail.com>
Date:   Thu, 23 Jul 2020 16:38:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595506733-10307-6-git-send-email-kyarlagadda@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

23.07.2020 15:18, Krishna Yarlagadda пишет:
> Enable GPC DMA support for Tegra186 and Tegra194
> 
> Signed-off-by: Rajesh Gumasta <rgumasta@nvidia.com>
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 8ab968e..77198fc 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -236,6 +236,7 @@ struct tegra_i2c_hw_feature {
>  	u32 setup_hold_time_hs_mode;
>  	bool has_interface_timing_reg;
>  	bool has_slcg_support;
> +	bool has_gpc_dma;
>  };
>  
>  /**
> @@ -432,11 +433,18 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>  	dma_addr_t dma_phys;
>  	int err;
>  
> -	if (!i2c_dev->hw->has_apb_dma)
> -		return 0;
> -
> -	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
> -		dev_dbg(i2c_dev->dev, "Support for APB DMA not enabled!\n");
> +	if (i2c_dev->hw->has_gpc_dma) {
> +		if (!IS_ENABLED(CONFIG_TEGRA_GPC_DMA)) {

Single line, please.

> +			dev_dbg(i2c_dev->dev, "Support for GPC DMA not enabled!\n");
> +			return 0;
> +		}
> +	} else if (i2c_dev->hw->has_apb_dma) {
> +		if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {

Here too.

> +			dev_dbg(i2c_dev->dev, "Support for APB DMA not enabled!\n");
> +			return 0;
> +		}
> +	} else {
> +		dev_dbg(i2c_dev->dev, "DMA is not enabled!\n");

Also, please drop all the exclamation marks.
