Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF36D5B4553
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Sep 2022 11:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiIJJD1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Sep 2022 05:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiIJJD0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Sep 2022 05:03:26 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA6058B69;
        Sat, 10 Sep 2022 02:03:23 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id z25so6701077lfr.2;
        Sat, 10 Sep 2022 02:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=2Nsa+O3pVP6MJ7YCkX7zCjo6X+CFgNIWDZFGfNsG0Xg=;
        b=d/Ul18F3Q6Tzv/cctjKeCRzL+RLSXmgyRWCRz3TWxrXSwNJi0PhhzSMqhAZapXPjKY
         lBDsBzPs5ppreZT4Fo/6FnQtBgPdbPtxfAghPMFr6/SJV2hkEcZdOBq0uTkmeYmz75JG
         31Ao4+wYE0Vgzh63hgxTwu2Oz+3GxzF1lw6YAznHKFVhD2nvgUptSnNYAj01J68XBeDl
         +2EbPr52agGWMFAZALtmO45nqKXW/VUpxzml2aU/eF4kRy17zX0aCafylIn1rtPU4zou
         NYaDAX8ricYhPPoEu2lJoLmLrVAZUkI4uuuSYpLovP2jBydmOkzwUoMvyaTihcLhwWA+
         Z+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2Nsa+O3pVP6MJ7YCkX7zCjo6X+CFgNIWDZFGfNsG0Xg=;
        b=X8xKRt6v/zXJF1P/ApyRHeUOXxLwpo7WPcvicv/kbfFjpZnGaQmbBln+GZ0Y+I75d/
         b0T9u+ko5saPanMu64Kmn9zgp5oQZTNl/X0oT8Tw3nYOVYpriKY/oBPmDTN03v0/zlaV
         8eneP4dGbNwSZOmdK5FUROTqA98nAU53GZa6P01eSuDcUNeRImG5/Iy0/NwrCnruXJAT
         lMjYXSVcMXPvRyNpwdBwxtZjmU72a+vzwwiEAFgdSM960AZYSysDSgtI5sd+YTCj/Qos
         YgbLjbf9Gyy6ncV2Xizsb7FmIs+Q/jhmKAC4A45neyVOcnUs06p3G/yrO4YGxJ1w5RQy
         VSEg==
X-Gm-Message-State: ACgBeo3olPpkvHnb0pktb/o1jdQnF2LLISZox67MLHkLnhMW/Wtm4Ujx
        /zqdPnZSX7ZgaSvywNc3puU=
X-Google-Smtp-Source: AA6agR6TPxd483GNC1JffV9J4DtoffRf0u7h2ChlvHz+joh3E0oPJhlXWLH+UF3VAPB28YvTY4nQNQ==
X-Received: by 2002:a05:6512:1309:b0:492:e273:d800 with SMTP id x9-20020a056512130900b00492e273d800mr5387848lfu.93.1662800601708;
        Sat, 10 Sep 2022 02:03:21 -0700 (PDT)
Received: from [192.168.2.145] (109-252-122-187.nat.spd-mgts.ru. [109.252.122.187])
        by smtp.googlemail.com with ESMTPSA id j19-20020a056512345300b0048a982ad0a8sm92458lfr.23.2022.09.10.02.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 02:03:20 -0700 (PDT)
Message-ID: <3a6057c6-0f9d-66ea-d15d-33a6c7f1a8c7@gmail.com>
Date:   Sat, 10 Sep 2022 12:03:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/3] i2c: tegra: Add GPCDMA support
Content-Language: en-US
To:     Akhil R <akhilrajeev@nvidia.com>, christian.koenig@amd.com,
        devicetree@vger.kernel.org, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        robh+dt@kernel.org, sumit.semwal@linaro.org,
        thierry.reding@gmail.com, wsa@kernel.org
References: <20220906144716.16274-1-akhilrajeev@nvidia.com>
 <20220906144716.16274-2-akhilrajeev@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220906144716.16274-2-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

06.09.2022 17:47, Akhil R пишет:
> Enable support for GPCDMA, which is used in I2C controllers
> in Tegra 186 and above. The chips before that used APB DMA.
> This change works under the presumption that all chips apart from
> those supporting APB DMA is using GPCDMA.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 031c78ac42e6..954022c04cc4 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -443,11 +443,16 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>  	u32 *dma_buf;
>  	int err;
>  
> -	if (!i2c_dev->hw->has_apb_dma || i2c_dev->is_vi)
> +	if (i2c_dev->is_vi)
>  		return 0;
>  
> -	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
> -		dev_dbg(i2c_dev->dev, "DMA support not enabled\n");
> +	if (!i2c_dev->hw->has_apb_dma) {
> +		if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
> +			dev_dbg(i2c_dev->dev, "APB DMA support not enabled\n");
> +			return 0;
> +		}
> +	} else if (!IS_ENABLED(CONFIG_TEGRA186_GPC_DMA)) {
> +		dev_dbg(i2c_dev->dev, "GPC DMA support not enabled\n");
>  		return 0;
>  	}
>  

To me the symmetrical if-else will look a bit better, but that's a too
minor nit.

if () {
	if ()
} else {
	if ()
}

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
