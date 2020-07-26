Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE6822E372
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 01:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727863AbgGZX6B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Jul 2020 19:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbgGZX6A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Jul 2020 19:58:00 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62FE0C0619D2;
        Sun, 26 Jul 2020 16:58:00 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v4so5601726ljd.0;
        Sun, 26 Jul 2020 16:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OxetVxTZd90jQL+ll8MOqzxKnNYoWK4Jslvp4O484LI=;
        b=O5ADtGYB6niebi1ReSmHcPlmxcxR1ADgc0hdTdtruo330iW83t1WGIxmnPDLuyKt7B
         uzqm3QhDKXOXU1YKcqcpc9QfZx7XIe6waEJ6mMEa1DHhfwLp0m8NGSNtTzfwyzOGA/AV
         oYN+kLVyoEW/CDivC6Km5DWpo/b1Hll54v4QR/7bl0PW0DyS1kteidd/lN5UaA9o4VPO
         AKL8wEHHC/+CozrnENmpf4RKD61zva3k0ArzUQ7ojKMmT+2bdWPxGPLwI3E+va12Lamb
         CO9sHoyYlCkn8iP7UfiuvPmN2bM5Y7vP3ToZ7nVWhOmnN5OsEYs7UGhhNWy7M+Ed8XeD
         lXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OxetVxTZd90jQL+ll8MOqzxKnNYoWK4Jslvp4O484LI=;
        b=Os43iKhnYcwl+oxWC+TCBFHX+VmEwNop54YgbkPHek/XRPaFZUjlbPEeWXXcoE9rI7
         aHXKnz5XNpKWfxUI9pB+jcFBaglTgZItPpW6angFZrwk7bl2zLaYaLjyg4caZQ505DZk
         sOVc7L0nLisYK++0YMjIzfWvu82kzfiObO43I/u6C3zvHlHqRcueoVNENtbXucorXs56
         Z5aX5sJNN8OcRhIQLbqCtEz3QrGQZf9NIw+qIy66lfnBvrwBZhwULCiu+PCDfyCvemSs
         I5YNpD+GlPKtN3WmLS9vfpBgDDEwAA8+hnstp/iQZEpgZudOvoVpACPm5E/EqQjjXdIQ
         t23g==
X-Gm-Message-State: AOAM533lhS7y5jAtnnZHLywws5/vWUJ5qdzxTsKhwllBTBToMMrI/7Ig
        ge8SNGJJcZxN9LuPd9vYD8IiOMSc
X-Google-Smtp-Source: ABdhPJw03o4rEx6v88fj8MYbGoZ/n+kuRLCgiju6T387weRkXRxOaEUyvFWlOeh4ziLNdI2CtFbawA==
X-Received: by 2002:a2e:3e17:: with SMTP id l23mr8984665lja.177.1595807878557;
        Sun, 26 Jul 2020 16:57:58 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id n25sm2028504lji.28.2020.07.26.16.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2020 16:57:58 -0700 (PDT)
Subject: Re: [RFC PATCH v4 05/14] i2c: tegra: Avoid tegra_i2c_init_dma() for
 Tegra210 vi i2c
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
 <1595548272-9809-6-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6dec1975-5b5c-8677-5be6-e95cc0e8e34d@gmail.com>
Date:   Mon, 27 Jul 2020 02:57:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595548272-9809-6-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

24.07.2020 02:51, Sowjanya Komatineni пишет:
> VI I2C is on host1x bus so APB DMA can't be used for Tegra210 VI
> I2C and there are no tx and rx dma channels for VI I2C.
> 
> So, avoid attempt of requesting DMA channels.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 1bf3666..00d3e4d 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -421,7 +421,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>  	dma_addr_t dma_phys;
>  	int err;
>  
> -	if (!i2c_dev->hw->has_apb_dma)
> +	if (!i2c_dev->hw->has_apb_dma || i2c_dev->is_vi)
>  		return 0;
>  
>  	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
