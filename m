Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 532FB45CB06
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Nov 2021 18:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242931AbhKXRca (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Nov 2021 12:32:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242092AbhKXRca (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Nov 2021 12:32:30 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F26BAC061574;
        Wed, 24 Nov 2021 09:29:19 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id e11so6925289ljo.13;
        Wed, 24 Nov 2021 09:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ydUydaywLW87b6G3VEUPeR5PFEYyoQL/BmcPvqzWAYE=;
        b=CyZhQDspBWd+9xlvoI5RVBF+09UDksRX0c03lZTTtQ/7SilD8KdMDQ1DZ6hrVRsZiN
         t5TvcoXmsHKHYC/JfKthFjYHWPYsQ/OMcKcorVPvFI56Ixyxi4EHeeN9XC2OAqThTn1Y
         BZYL/5rzIqHLBqJJvNVsAg9l8SHRJr4C92FiFHueGuN0c1b9wVcUf4SEmShRwu2IFJrF
         +cuzJDzIeEQguNTtO4g5XNPNQhbpLGJDADTNg/Ueg0q3pddl+TdM8mT+gOK9VY6n05JH
         ySR9yR9+/228BIGVgHT/9r6ERxG+jbMRR5lASbNaab1UyapCu3GIu51cPhA9DVC1evnD
         biUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ydUydaywLW87b6G3VEUPeR5PFEYyoQL/BmcPvqzWAYE=;
        b=2QUO7rBWvaGtTfoK4H8AFzItdz3uOlKQoOYT9kBtXKYBSsKYTmtGAMqpAjUiW6G0YD
         /w1SYlvuoAIXM1s0n4PVow+t94h1kjFa/kdVNRte2FNRMzBYhbdv7D3c96V6e3171nIm
         TUtghViYBTTc8JafF23rgu1cuy8QjE1i+szLJVSPJ5xDIOiDqw8ZvWQkj0TqzOdSKolv
         OOzKDwOuuGN5d0HIPa4+dRP3eI3xAxKL8PaOxmF+srCuhGEvulc+w3lqo/PCjVj0YT1h
         OB+LQRq6NK5IZqGtzs0NWdR98EZPb22Cdb2D34vk1Tdti7GtZ3FVIDnQc7PDMDoJI+W5
         07jg==
X-Gm-Message-State: AOAM530h4sez5ugjwGHceTeTyu6+Izo9/IS+s3yrDKQ/e1JJXXOszxNu
        Fr+qlgYIXWLG0O5ny0gVXzs=
X-Google-Smtp-Source: ABdhPJxPXUgL5sbmJ8QgM/1O4cZrC1JEdGxYpsxf6RgyOm2YXACjxbTj8io/Abcqz4xAMIM9ZZpS1w==
X-Received: by 2002:a2e:9806:: with SMTP id a6mr17728616ljj.185.1637774958306;
        Wed, 24 Nov 2021 09:29:18 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id e17sm40549lfq.102.2021.11.24.09.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 09:29:18 -0800 (PST)
Subject: Re: [PATCH v2] i2c: tegra: Add ACPI support
To:     Akhil R <akhilrajeev@nvidia.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc:     Shardar Mohammed <smohammed@nvidia.com>
References: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
 <1637651753-5067-1-git-send-email-akhilrajeev@nvidia.com>
 <eebf20ea-6a7f-1120-5ad8-b6dc1f9935e6@gmail.com>
 <BN9PR12MB5273A7628D80076F4EF2CC69C0619@BN9PR12MB5273.namprd12.prod.outlook.com>
 <b06a5072-f0f4-c9f9-f9a2-8d76b4432415@gmail.com>
 <BN9PR12MB5273CA3AA78636EB0500897AC0619@BN9PR12MB5273.namprd12.prod.outlook.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4af00198-82b8-6611-544e-4bba51354278@gmail.com>
Date:   Wed, 24 Nov 2021 20:29:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <BN9PR12MB5273CA3AA78636EB0500897AC0619@BN9PR12MB5273.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

24.11.2021 19:40, Akhil R пишет:
>> 24.11.2021 10:18, Akhil R пишет:
>>>> *i2c_dev)
>>>>>               i2c_dev->is_vi = true;  }
>>>> How are you going to differentiate the VI I2C from a non-VI? This
>>>> doesn't look right.
>>> This patch adds the ACPI support to only non-VI I2C. The device_ids in
>>> match table are added accordingly. I suppose, of_device_is_compatible
>>> always returns false as there is no device tree.
>>> Agree with the other comments.
>>
>> Will the VI I2C have a different ACPI ID or how it's going to work?
> As there is a different compatible for VI I2C in device tree, I suppose the ACPI
> would have a different ID as well. I think the logic would also need an update 
> if to have VI I2C using the ACPI. But that wasn't actually considered in this patch.

Thanks, you could reflected it in the commit message.
