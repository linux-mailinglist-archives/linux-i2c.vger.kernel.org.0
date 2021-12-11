Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B24C1471607
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Dec 2021 21:07:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbhLKUHH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Dec 2021 15:07:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhLKUHH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Dec 2021 15:07:07 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4323C061714;
        Sat, 11 Dec 2021 12:07:06 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id k37so24037531lfv.3;
        Sat, 11 Dec 2021 12:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=V6k4x0T7Yqsqy3kx1XMpcmFJUv6IYhjnuml9BcYpxwI=;
        b=OH2nqH0ctm+57VkHHrVdtF+TIRGAm4m3tyrLhEMZwyWSAeoe9TwQXNs5+AK2A1efD8
         4uqHyHkagVUMsjabIwBubnhph4guhBG5AyjGg2lbOI5/f7ClBPWD1cdjyh1E8mo0/7kM
         9Jyvn31rGpL93pbe8qvuf/Ojfuz/5T1T4ei5oomMiRbzpmTGn3kcdUZxPQWQ8RyPquon
         Bmm7p2WAtZ59yOB8+HH6Mzup+xK5/9zA129VLDsWdT2ZACE3+lThpQtA/KcZ2uw592sE
         1pzh3SmwKFmVMlkCTeMoN6gBj+qtcsvAiQ/P6/JtFZYmmxIUa/2UKnQ0F2AVLV1xZkkm
         4S6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V6k4x0T7Yqsqy3kx1XMpcmFJUv6IYhjnuml9BcYpxwI=;
        b=sUddSG76mMJYPa75L6z5RrmM6nVkwfdvgedK60hkZjg+yKNyan5bR+MM5Inxl3nset
         5qUXJDmPsYWVZTxpK830aLSH2fOMZJ/II+dhb02FzSabNfwd2x14QAUoM3z53e4Q87aw
         wWWlK5+DI7SQa+SQo7eByHqxK5iz6LwaKBYVw8WrGfU8jZuYBm+poMnZCNekDPMOgBIb
         IcitMBbQJBYEk6isPMRMZpMEGKDyW8aozAKLQ4O5aNgRdcEj+yYrfXxDluVWIH0RIY5D
         RA3UPIOdbKqk54G+BuSomlgUtELxaYYwdMThKALY2A9KqRKEM36UQqoqyKoPOkOxb26Z
         d7GA==
X-Gm-Message-State: AOAM533NyeWhnORMTnppjUm82o7bZ7tNsdsX2lw8ayRfb5gCI9xC/nAJ
        I14WLlmImkdllmOxcRcB4QscF18UXbU=
X-Google-Smtp-Source: ABdhPJzgtXQot799eer8wTzEJr1EcVdUEu+BL+wJIYOLmb/XRVe5ysC0wpdCJ5YOdO2YXZAXiwoYDQ==
X-Received: by 2002:a05:6512:14b:: with SMTP id m11mr18738289lfo.681.1639253224777;
        Sat, 11 Dec 2021 12:07:04 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id 76sm720330ljj.69.2021.12.11.12.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Dec 2021 12:07:04 -0800 (PST)
Subject: Re: [PATCH 2/2] i2c: tegra: Add SMBus block read and SMBus alert
 functions
To:     Akhil R <akhilrajeev@nvidia.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
 <1639062321-18840-3-git-send-email-akhilrajeev@nvidia.com>
 <72ea6030-5f2d-4f51-3a42-8386c3638c65@gmail.com>
 <BN9PR12MB52733A443AA5D5A690CE7132C0719@BN9PR12MB5273.namprd12.prod.outlook.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b004092e-5662-c9e0-71d8-d45a0635e1be@gmail.com>
Date:   Sat, 11 Dec 2021 23:07:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <BN9PR12MB52733A443AA5D5A690CE7132C0719@BN9PR12MB5273.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

10.12.2021 12:38, Akhil R пишет:
>>> +struct tegra_i2c_smbalert {
>> smbalert isn't a word, should be smbus_alert. Same for the GPIO name and
>> other places.
> The actual notation, I suppose, is SMBALERT#. If you see it is better to make it 
> smbus_alert, I can update it. 'smbalert' also looks good to me though.

smbus_alert is better

>>> +     struct i2c_smbus_alert_setup alert_data;
>>> +     struct i2c_client *ara;
>> What "ara" stands for? Please use meaningful names, like alert_dev for
>> example.
> i2c-smbus.c uses the same name to refer to the smbus alert i2c_client.
> I thought to use the same for consistency with the core and other drivers.
> It stands for "Alert response address".

Please add doc comment for the struct with the explained name then.

>> I don't see where this member is used at all, please remove it.
> Wouldn't it be good to have it stored so that it is handy if using any other 
> function later, like i2c_handle_smbus_alert. Moreover, I thought to keep
> the usage consistent with other drivers having similar function.

Please add it only once it will be actually needed.
