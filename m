Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D17A318D053
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Mar 2020 15:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbgCTOXc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Mar 2020 10:23:32 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33581 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbgCTOX2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Mar 2020 10:23:28 -0400
Received: by mail-lf1-f66.google.com with SMTP id c20so4711486lfb.0;
        Fri, 20 Mar 2020 07:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Mm4E0gIkkkgsirbE3p4vjRzb5lUFQedGY2BkFL7msqc=;
        b=Vz5xvrBESxBPJCtBr1x/44QGyJgzBlAiVsHQeoWX26C3Knhd3msjacb0MV1KqmWQIA
         zc39BuSmosHKlatEoJRB1U7z+C30GuF7QD5xiAqJcjY+8NwANIQb6yjlj4aSbuCIUa8T
         qJKtjXaclkvgfBjzUq7q/ZT+HWOEpaqwaf8S5CkCA92SQYygBfyvi9r8Rj6M00VtysQQ
         35YfnGTEybXdLbE2wWZO5tqP3Rz25MqFo9k+po7UkLIDiY/r1uOWuknDWajrlGMxDp6j
         AmoET7kIs+fR5zcjcwzwshT4eQxgfRIzOp8PjN4KsYLS+0zA4A6DZi/JjNKZ306Eh/Ph
         HDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mm4E0gIkkkgsirbE3p4vjRzb5lUFQedGY2BkFL7msqc=;
        b=O6H0I4yUqgcpujj7cVgcB7J2vpsaJbPJ4Y+PmHg5NGNGd8qkTPHyz8ejbQxK++B8cf
         GQ5ChC+UrXg/awfW/IzaUSkLTzFKBRHkjd2Lp6qjQJqeAb5pCjXcwFXT1jF9Ls5x2YiV
         S3vPbr3n6aspkSfjzK07pTTd7u2NbJpUqOoNWlmHQ1G6uudaknscZDE0DFjnEN0khhSw
         3RcxfS64Gd2SWu3YIuohlF9gDUbFiYSa1sAZA8nfgcfjlp2aPI1bBXbi/TEa96JdXtGl
         nKo4VkPD82rY/LgmiLHw1Hj1kCH6AuEq2Jyonu+IUPInmhtelCeNcSUySfHcLKa4OYEV
         OMMw==
X-Gm-Message-State: ANhLgQ0mMueNqVeKaKwqL18rt16Ihefw8wg0uAA0wrccyXyLsv6z5vxS
        e77Ky2aIDKGawWTwRy6uLXw=
X-Google-Smtp-Source: ADFU+vu+znbL8IHqM0nrxUSRNjzwNcCHm0LTvrBjpTasGqsfS5eSFWCgbOvJUr/m1gDosozoephQaQ==
X-Received: by 2002:a19:6406:: with SMTP id y6mr5602360lfb.125.1584714206885;
        Fri, 20 Mar 2020 07:23:26 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id u1sm3392760lju.95.2020.03.20.07.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2020 07:23:26 -0700 (PDT)
Subject: Re: [PATCH v3 6/6] i2c: drivers: Use generic definitions for bus
 frequencies
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
References: <20200316154929.20886-1-andriy.shevchenko@linux.intel.com>
 <20200316154929.20886-6-andriy.shevchenko@linux.intel.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <44e50f6f-9674-60e6-9217-aeba96ef011d@gmail.com>
Date:   Fri, 20 Mar 2020 17:23:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200316154929.20886-6-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

16.03.2020 18:49, Andy Shevchenko пишет:
> Since we have generic definitions for bus frequencies, let's use them.

...
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index cbc2ad49043e..4c4d17ddc96b 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -123,10 +123,6 @@
>  #define I2C_THIGH_SHIFT				8
>  #define I2C_INTERFACE_TIMING_1			0x98
>  
> -#define I2C_STANDARD_MODE			100000
> -#define I2C_FAST_MODE				400000
> -#define I2C_FAST_PLUS_MODE			1000000
...

For NVIDIA Tegra I2C:

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
