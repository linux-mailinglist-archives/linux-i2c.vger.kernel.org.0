Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D681846F6D1
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 23:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233605AbhLIWbc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 17:31:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbhLIWbc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 17:31:32 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21521C061746;
        Thu,  9 Dec 2021 14:27:58 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id z7so14713735lfi.11;
        Thu, 09 Dec 2021 14:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=vB6UFMMKeMbML0pasfrlK2ON8jLTtffrDd18+0fvXTM=;
        b=iddzqvFmZjbr0V4tMd5txSDNy7G2HAtwVp5YCUKPc9Li6DCaSw1Dl939MACHK+hypd
         dUgBtSYybk5qW4WJpYOYiRhaLY0cMX7W309R/DHAihMWKLZC6l26Oj+s6L9LLUReNWr0
         jUamKjDqSmseia/nXvbIs29In+ghj1NOlsW6tQAA8bKp02+OId7jO9dTdNKyI6qbnZSr
         sjV7hqSqDOhL93lfp5thW2Bu+JR5fc3kRlu2xTw7E6gvYphreWnD61oFXgsJgjdE/S9U
         wPVcajc5uLx685kx2V4dyVaEUwd7fLfg6qi7qMy4SojfN/cWKQHX/IUPBu62pepXEn08
         u+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vB6UFMMKeMbML0pasfrlK2ON8jLTtffrDd18+0fvXTM=;
        b=XPfZuYZEMVdEDzJYCTcxa0Rp5UfbH+dBtg/3XA2Old65OTCv/ss37XfRI07Qtemq/a
         VXnHih7cOlM+r3716yl0/VasGVxoUg4UIojyepPxlYOCcgpwX8IW3RkeDVe4l8sSgoMJ
         l8x58H3Rx1DDj2p7AB9VSeRj3ezwzeUWJaR1sT+KySCouyj2DprzJzog+UBd+EjtxHDD
         VMFDHo2bG4qfeU8PVXFbCX+cZTDQlP5vPcGyysg9M/Gbc9fWv1GpUFGH1EIDW4XsbgsE
         m71rWsjrEUBVNAMJ8c28cXSIrtitmCv6+LEUApO/DJe+dLN0A2vdWzbLThjDFQSD4zMi
         oC1A==
X-Gm-Message-State: AOAM530qw+oqk5alzqsOxMi+WLI7PPT02+O+4EyBPZUjfuxbboeD0ODX
        2HA7O9/UN1cnibVoreuiVbUsPKStiZs=
X-Google-Smtp-Source: ABdhPJzFdHGaxPfjywJc1hIiA9ySfrY8guYDU1C2I16TpAhgmS6ic0/GqJw1gbuLNpG04WutziYJSg==
X-Received: by 2002:a05:6512:31cf:: with SMTP id j15mr8629350lfe.229.1639088876408;
        Thu, 09 Dec 2021 14:27:56 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id k6sm122488lfu.218.2021.12.09.14.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 14:27:56 -0800 (PST)
Subject: Re: [PATCH v2] i2c: tegra: use i2c_timings for bus clock freq
To:     Akhil R <akhilrajeev@nvidia.com>, andy.shevchenko@gmail.com,
        jonathanh@nvidia.com, ldewangan@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, thierry.reding@gmail.com
References: <1639067318-29014-1-git-send-email-akhilrajeev@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c9eceaba-df4e-0e75-d6a7-87cfdf45fced@gmail.com>
Date:   Fri, 10 Dec 2021 01:27:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1639067318-29014-1-git-send-email-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

09.12.2021 19:28, Akhil R пишет:
> -	err = device_property_read_u32(i2c_dev->dev, "clock-frequency",
> -				       &i2c_dev->bus_clk_rate);
> -	if (err)
> -		i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;
> +	i2c_parse_fw_timings(i2c_dev->dev, &i2c_dev->timings, true);

Was this patch tested at all? Apparently it wasn't compile-tested.

drivers/i2c/busses/i2c-tegra.c: In function ‘tegra_i2c_parse_dt’:
drivers/i2c/busses/i2c-tegra.c:1635:13: warning: unused variable ‘err’ [-Wunused-variable]
 1635 |         int err;

BTW, MM, DRI and media mailing lists have nothing to do with this patch
