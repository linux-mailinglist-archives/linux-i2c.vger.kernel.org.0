Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75350389B2
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 14:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728265AbfFGMEj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 08:04:39 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:54934 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbfFGMEj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 08:04:39 -0400
Received: by mail-it1-f195.google.com with SMTP id m138so649985ita.4;
        Fri, 07 Jun 2019 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fOCFQ7DfeD4FySaGvW8y28hy2IeEuA+85rbbCCWdbYI=;
        b=svT2no4K27pO065v9E6aaRoGozdWuuJdh669Pq08fhVr11RxZgol7SzicsI0T1fnAU
         mKOhi85myER7gbaxLze29VdjazBqgV2EdHa99toeC9ghvUEniEK0g9t6958lo+SQ+ABD
         tsPkwo7bchbAXn+6hOZsl8GxrnmaXDd5OYMTITlxBpoFZHEkSeyFMRKIPj5rLqhh4z8J
         Pdx18mpVpVjyNlI9TIUml/GlmJLsV5kcUIebllYYLkeTWkdxN36nsVdxCYuv6gGVe/tz
         DDf/rgknll3yt1yIhUI4gjea79+6UIfOI7+qnhQGNak2o7JVcUJgX/A4GaSVre3d0IYz
         IBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fOCFQ7DfeD4FySaGvW8y28hy2IeEuA+85rbbCCWdbYI=;
        b=fddp0TqJe5iCINfXYAwxBrOw15p44BviqGMFakzmsYiIUhqC1kB0exgDK/E4Xz+ffX
         MgwHmnaD5aSVp0zyX8c+71cmabGWh15oamrn+BVNZs6E9rfGAB+KJ3c+iVCoPc8a9S1f
         2YkArnxht55agb0W+15RHL51fb87Xmdbm6NW5q75FW0ZKXu0so1JnJVOAa3H5RPU4zhX
         4be3Lc9nAWzoFSf7jlQKqMsetJhjwbWPP80I16EXwH/uuKxnCtgsm35fBDhfn8fCGyh5
         x3K4tyPFIJHo77vbkZs79RRoEBsfBB7epnWTFk6X0HZ0bocCpd3faiNgWaOmaw2Ku5tx
         u7OA==
X-Gm-Message-State: APjAAAVNAkXl+WoCSPnqZS70r8uMSVd2x3zbaLSnGahlijl/7Ns2eZKB
        JUM/gyWK3dF/hDP30PXDCUc=
X-Google-Smtp-Source: APXvYqxbr4EVg4+Cba05JcweoCg6PbgGifohvcNett6bdH3y4l+26SWfCPAReVKp9AQ98gL7mmUfLA==
X-Received: by 2002:a24:720a:: with SMTP id x10mr3891005itc.161.1559909078360;
        Fri, 07 Jun 2019 05:04:38 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-170-54.pppoe.mtu-net.ru. [91.76.170.54])
        by smtp.googlemail.com with ESMTPSA id 20sm609643iog.62.2019.06.07.05.04.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 05:04:37 -0700 (PDT)
Subject: Re: [PATCH V1 4/6] i2c: tegra: add spinlock definition comment
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559908507-31192-1-git-send-email-bbiswas@nvidia.com>
 <1559908507-31192-4-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <18cd06dd-d28a-12c3-74fd-4877a81e91ef@gmail.com>
Date:   Fri, 7 Jun 2019 15:04:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559908507-31192-4-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

07.06.2019 14:55, Bitan Biswas пишет:
> Fix checkpatch.pl CHECK as follows:
> CHECK: spinlock_t definition without comment
> +       spinlock_t xfer_lock;
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 2d381de..bececa6 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -269,6 +269,7 @@ struct tegra_i2c_dev {
>  	u32 bus_clk_rate;
>  	u16 clk_divisor_non_hs_mode;
>  	bool is_multimaster_mode;
> +	/* xfer_lock: lock to serialize transfer submission and processing */
>  	spinlock_t xfer_lock;
>  	struct dma_chan *tx_dma_chan;
>  	struct dma_chan *rx_dma_chan;
> 

Thanks!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
