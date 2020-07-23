Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87F322B045
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 15:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbgGWNRo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 09:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728426AbgGWNRo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jul 2020 09:17:44 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA20EC0619DC;
        Thu, 23 Jul 2020 06:17:43 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id e8so6323101ljb.0;
        Thu, 23 Jul 2020 06:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=G/Iak3KWmwTfr90AhPB7sj206XANStLupsLTQbuvu64=;
        b=MxEfa0mDI0EvJs8GXP6HciFy10whZG1xFp9WnknWKxY46MujkTN2qwzokNUQC5lPOu
         ovFfyqkN67fz7uWOUvcvAyhXaTfbyhrQ2RtkMg7J2TigLAdadk7OI8U3ZjXnR5ZZ4o5N
         WQxsrG0KLTAiMRTZV59WSLAV0AXUevgMQfG4kRg31FCp5nvfISE89BLHy4mcX1WFUFUT
         8mcJmFigd3+KMzh84Zx+/iUWO5TrNE3KzdQL/pP2HFssYlzZPxlaqwyFQoy5ZUQ7+v2Z
         mNg2JstrdmY4cHvlZRobcWCIq5+BjYsD0CT43b7rv2zM5/XnziGLnxWRBDtVv5cfOSh/
         Fw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G/Iak3KWmwTfr90AhPB7sj206XANStLupsLTQbuvu64=;
        b=jZr9se+EZJUKpHinwikd99FoWWsmncG9cO3791OIGmdsjmuxwwMZYJT3cnE26nFiFG
         1L2VpAC8yIZwL6Z7j3ehflJqvi4+B2TzNTbN5Xx3yizwRD/JFDTaCLHrm09AlL5GmAOK
         mcGC56fEn4R5fT2XFzYh2J7xz6EN6orTOmx6azirHwgV4sBgnHQvquFpl/3ckveY+wAS
         7KGIqtjRvk7YCkldyYZQHNiIcDnlofxTl6UeeMcyLPnfTBn2XGOF7LyyMGB4VjrBQIqi
         YDEywq5b7d13PO2oPPuc5NfCqnpITXjC+b2cwN5whw0OnJ2sVDimMN3xXIIebLzkwy5v
         OVtw==
X-Gm-Message-State: AOAM533tAdM65X5970IY7pOsMITT1rnNmoXVEe9rptCtmY8MNteewJFC
        tByU8pv71MqDLNJEYYEXHLs=
X-Google-Smtp-Source: ABdhPJynnaMKqkvQHiicQFiIEkV1VDKXBfhhVumwNwRRfnPaoB8Tv3xbf9WPDQ8eBfoupHBIhfF7NA==
X-Received: by 2002:a2e:9bc4:: with SMTP id w4mr2062336ljj.391.1595510262473;
        Thu, 23 Jul 2020 06:17:42 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id 202sm2840464lfg.24.2020.07.23.06.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 06:17:41 -0700 (PDT)
Subject: Re: [PATCH 3/7] i2c: tegra: add flag for register write buffering
To:     Krishna Yarlagadda <kyarlagadda@nvidia.com>,
        linux-i2c@vger.kernel.org, thierry.reding@gmail.com
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldewangan@nvidia.com,
        smohammed@nvidia.com, rgumasta@nvidia.com
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
 <1595506733-10307-3-git-send-email-kyarlagadda@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fd8d2650-6450-be61-cd78-f57871984e4f@gmail.com>
Date:   Thu, 23 Jul 2020 16:17:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595506733-10307-3-git-send-email-kyarlagadda@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

23.07.2020 15:18, Krishna Yarlagadda пишет:
> In chips earlier to Tegra186, register write gets buffered. So to make
> sure register writes are completed, there is need to readback the
> register. Adding flag to disable this readback for Tegra186 and later
> chips.
> 
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index a841d6c..bdbbca0 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -220,6 +220,7 @@ struct tegra_i2c_hw_feature {
>  	bool has_mst_fifo;
>  	const struct i2c_adapter_quirks *quirks;
>  	bool supports_bus_clear;
> +	bool has_reg_write_buffering;
>  	bool has_apb_dma;
>  	u8 tlow_std_mode;
>  	u8 thigh_std_mode;
> @@ -325,8 +326,11 @@ static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>  	writel_relaxed(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
>  
>  	/* Read back register to make sure that register writes completed */
> -	if (reg != I2C_TX_FIFO)
> -		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
> +	if (i2c_dev->hw->has_reg_write_buffering) {
> +		if (reg != I2C_TX_FIFO)

Should be single line.

What problem does this solve? If there is no visible effect, then please
drop this patch.

> +			readl_relaxed(i2c_dev->base +
> +				      tegra_i2c_reg_addr(i2c_dev, reg));
> +	}
