Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 690A226E5AF
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 21:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgIQTzZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 15:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727777AbgIQO5q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 10:57:46 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63799C06174A;
        Thu, 17 Sep 2020 07:57:19 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id c2so2286388ljj.12;
        Thu, 17 Sep 2020 07:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n0joxHTLl3BqxQ6ij0VXBgOyNi8Eer/XXbvWMRdVNFY=;
        b=irr5qCIjdOYv20J8iTCaTRA5UJ8jnzNtuQ9wBAKUkBkUwYZvSpC/yLVt7ThRgwXQ3B
         sAUAzvzQiKgn6uepWWSuEPmVz6AgknRFD868eBfrgomBpnC125FhY/EeTGUpTSm4EjC9
         y90PFg52OzZ5LKvpAMAB/vVIvpPXfMTxkIIDssejlrp/YCzJN5iEAdDOK9wprJcz/blX
         XYdmup+XrgixfQUOA4hklmzYVqN/FszMsZ8QEph+f65iaugTJXhxnuorpw7OqYYL9Vk7
         t8goGMla2PD6wfNBb1hJInCz+6Al0znr5ED4bTqS3Fq69eQDa2TN4Ys8SrknAT+w41tV
         7nvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n0joxHTLl3BqxQ6ij0VXBgOyNi8Eer/XXbvWMRdVNFY=;
        b=PSo1alyDuynrGPcrAxt+CcAStZ+K+d5aQcjbOrPtmTymCzHfcwmOJa2dm6w1ORnXEa
         17O15R/GlKK749BNEwak3wA0a40kng2HuLEhWy6/Skr0k4GTjq9zQ7nqipNXv4h9voaA
         mJYIbisHQPOGhTn+IpMCpbqslUEC2aP4lqpJf7SKg1s0l80WvsFVcSuBlngIurb5O9XF
         zyeBHik9dxugun6M2xqF4RIMxW/lpEM5WlPSbgwW7dJGt3T4CSaDwAA5XDEIwpJPwat0
         8k9p/i7/KGX5qLnvhVbH1qrm20Rr4WeBPloqk234oFpEGKqzL+F3/C2Q/j/RBrT3dXS3
         taNQ==
X-Gm-Message-State: AOAM533eQ4e9Sw2gtNdrRpU+vVmlcnCSgJeG0fTzbbywEF0TQv3qCWa3
        QK+8QEPuqOlZB0InRG0MSUZYQoc7r3g=
X-Google-Smtp-Source: ABdhPJxDy3ZIF2c4BkIXP4LkxiCyIhhPar673IiuvvC9LBQ6MF45yrzV0/L+xC0E2Z0ABrAbjVzUPQ==
X-Received: by 2002:a2e:810a:: with SMTP id d10mr10798579ljg.302.1600354637605;
        Thu, 17 Sep 2020 07:57:17 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id 140sm5274211lfj.146.2020.09.17.07.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 07:57:16 -0700 (PDT)
Subject: Re: [PATCH v7 01/34] i2c: tegra: Make tegra_i2c_flush_fifos() usable
 in atomic transfer
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-2-digetx@gmail.com> <20200917111057.GM3515672@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9beab533-8734-f18b-887d-d0e8cc09bb72@gmail.com>
Date:   Thu, 17 Sep 2020 17:57:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917111057.GM3515672@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.09.2020 14:10, Thierry Reding пишет:
> On Wed, Sep 09, 2020 at 01:39:33AM +0300, Dmitry Osipenko wrote:
>> The tegra_i2c_flush_fifos() shouldn't sleep in atomic transfer and jiffies
>> are not updating if interrupts are disabled. Let's switch to use iopoll
>> API helpers for register-polling. The iopoll API provides helpers for both
>> atomic and non-atomic cases.
>>
>> Note that this patch doesn't fix any known problem because normally FIFO
>> is flushed at the time of starting a new transfer.
>>
>> Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 25 ++++++++++++++++---------
>>  1 file changed, 16 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 00d3e4d7a01e..ab88cdd70376 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -470,9 +470,9 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>>  
>>  static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
>>  {
>> -	unsigned long timeout = jiffies + HZ;
>> -	unsigned int offset;
>> -	u32 mask, val;
>> +	u32 mask, val, offset, reg_offset;
> 
> Is there are reason why we need reg_offset? Seems to me like we could
> simplify this, see below.

The reason is that this patch addresses potential problem, hence it's
not a cleanup change and it should be kept minimal.

>> +	void __iomem *addr;
>> +	int err;
>>  
>>  	if (i2c_dev->hw->has_mst_fifo) {
>>  		mask = I2C_MST_FIFO_CONTROL_TX_FLUSH |
>> @@ -488,12 +488,19 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
>>  	val |= mask;
>>  	i2c_writel(i2c_dev, val, offset);
>>  
>> -	while (i2c_readl(i2c_dev, offset) & mask) {
>> -		if (time_after(jiffies, timeout)) {
>> -			dev_warn(i2c_dev->dev, "timeout waiting for fifo flush\n");
>> -			return -ETIMEDOUT;
>> -		}
>> -		usleep_range(1000, 2000);
>> +	reg_offset = tegra_i2c_reg_addr(i2c_dev, offset);
>> +	addr = i2c_dev->base + reg_offset;
> 
> Why not just:
> 
> 	offset = tegra_i2c_reg_offset(i2c_dev, offset);
> 	addr = i2c_dev->base + offset;
> 
> or even just:
> 
> 	addr = i2c_dev->base + tegra_i2c_reg_offset(i2c_dev, offset);
> 
> ? That makes the patch much smaller because you don't have to rewrite
> the whole variable declaration block and just add the "addr" and "err"
> variables while removing "timeout".

There is a further "cleanup" patch named "Factor out register polling
into separate function" that already implements yours suggestion.
