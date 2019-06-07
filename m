Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 173F3389A4
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 14:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbfFGMDg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 08:03:36 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41296 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727693AbfFGMDg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 08:03:36 -0400
Received: by mail-io1-f68.google.com with SMTP id w25so1188323ioc.8;
        Fri, 07 Jun 2019 05:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GgXoFELKujxQgUrezAAIwZ5mmg2bA18yn3NhTCK/a9o=;
        b=Gfv6svS8YD/Un6/WbVbWBDpEhBuWSCmc8gR8TuS1lOM04tWPGjItbH192WVGrXGIq9
         YWPiPkkWzBOq4lUkQ2w0J01Wvzr1Mrm4Ub83/CchzJX00sNG3iQoYIHAA0F9wtneEd/7
         +Z7gm9Js9ooU5BP8QB/vzSxhIiX8AwX4L6DBGHKTpAbQL372Brc4GbSOC1eV1qo4SSXH
         FqI3XyGDzvCR1jWoGBV5F4EqxZQEB9DqReTkw9kLSQ0lc4Eu/TuQ2r4qupk/Vl4NpMEU
         gMgo2GrA15VsZaVwl16IUfPVLuVw3wg+xuBIckDGZojLxmFi8xrA/tD+PIaCyAMJPIan
         RE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GgXoFELKujxQgUrezAAIwZ5mmg2bA18yn3NhTCK/a9o=;
        b=PDIFk3oZoki/UFVGec+22BUa8DZe4ToM/Na5hP/9NGRZyR85uyPJUT65G8FSseg3WB
         Lnlo+avgFkxBgFAcEp5xV2EfeuWza0n6gH4s1sL3JnHBdoDKnJc6z4wxJR6hlnwyskLg
         7keK3aJUQiZCg+wzcHXjCS6XuwXrwBfvCAOrmJ5i7aw0P22y1Bylbcsw375VvPtsx5uO
         vnspz7uqqGbtFocV/Rr4KbYkt4fjbVh0LXDEuMA2jEeE7HCA5L9ueey3ve/kbZvZUSmz
         Ob+naolXUxeet4xU3x7zsxxRB8fA1GgaaBLJyI1PiApM7WkPHNpYcoTd86sxuNZTy52B
         NLbA==
X-Gm-Message-State: APjAAAXQAi30lnekrsQCfEbDyzYKpo9jKZ/GFLt+YM4PGwlwyjMYdeOX
        P2f/EHUh5GxllWheXa4l5TO70xeZ
X-Google-Smtp-Source: APXvYqyhDRAczyuhdmyHfJssHOFcvBSTHT/TX+0ZgWpoDooliH8aAZ7l8qOPeLIGqFS9C9NeV8LH/A==
X-Received: by 2002:a6b:4f14:: with SMTP id d20mr17443949iob.219.1559909015258;
        Fri, 07 Jun 2019 05:03:35 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-170-54.pppoe.mtu-net.ru. [91.76.170.54])
        by smtp.googlemail.com with ESMTPSA id i131sm595627iof.34.2019.06.07.05.03.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 05:03:34 -0700 (PDT)
Subject: Re: [PATCH V1 2/6] i2c: tegra: remove unnecessary variable init
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
 <1559908507-31192-2-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9acd02f4-9b37-c31d-b6ae-af8c99bc8d9a@gmail.com>
Date:   Fri, 7 Jun 2019 15:03:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559908507-31192-2-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

07.06.2019 14:55, Bitan Biswas пишет:
> Remove variable initializations in functions that
> are followed by assignments before use
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 00692d8..f7116b7 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -689,7 +689,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
>  	u32 val;
>  	int err;
>  	u32 clk_divisor, clk_multiplier;
> -	u32 tsu_thd = 0;
> +	u32 tsu_thd;
>  	u8 tlow, thigh;
>  
>  	err = pm_runtime_get_sync(i2c_dev->dev);
> @@ -1218,7 +1218,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>  {
>  	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
>  	int i;
> -	int ret = 0;
> +	int ret;
>  
>  	ret = pm_runtime_get_sync(i2c_dev->dev);
>  	if (ret < 0) {
> @@ -1489,7 +1489,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  	void __iomem *base;
>  	phys_addr_t base_phys;
>  	int irq;
> -	int ret = 0;
> +	int ret;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	base_phys = res->start;
> 

Thanks!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
