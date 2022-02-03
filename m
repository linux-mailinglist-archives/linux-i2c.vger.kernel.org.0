Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 613184A8BD9
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Feb 2022 19:45:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353554AbiBCSpy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Feb 2022 13:45:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237341AbiBCSpy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Feb 2022 13:45:54 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34A9C06173B
        for <linux-i2c@vger.kernel.org>; Thu,  3 Feb 2022 10:45:53 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id n8so7919889lfq.4
        for <linux-i2c@vger.kernel.org>; Thu, 03 Feb 2022 10:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wwYYEzEJz/i613XhR2H6uN9ZfSJvUkN3a5GGPAJavSU=;
        b=UCEz0wqqlW8Yc99GZFrWrpWae1dY2uMQhgV5A1zNZ81+zFyXDtn6gwdJEG3i9CA7n9
         ZI7uJ4IMTXPWNRBgmt6D+mKDTjXypdZe9uDQlJUhwnvoVfJPoRcX9XRJaMHaf6+b07/P
         S5ECdCWEQ+MKRu5lF91635Ga7Muk1RcjCViHF4FR016EZn0DQB4cEy7hjIlJ2ivsDv+p
         3TgPppvAaDNaRtjm9AstaxRyLiuSTEgL+UKQQunLjvk6xY4HGu63u9TCWpkks5k6Tq+t
         eNMsq1/4dSjsByKHPHBWg8hu0OhWfm0lb/8c8bIliBHkqHVyfWqV3kVRAYj8W5s+hHmZ
         ylFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wwYYEzEJz/i613XhR2H6uN9ZfSJvUkN3a5GGPAJavSU=;
        b=Wji5+0CxcicAa4VUKXZQcWp17Zvpr+5M7UtxpBDg/56T+tOIyyGpGa+VLuU7vrGRYD
         vWRjVDymiweHItEfvRA4dNDxk/rxWrzWA+iKfDZ76MfE/LGKZSWJQ+HmjMefDf20N4pA
         e2i5pHVQXfR8F6nX1YByHHZ8UdSse5yFH4hBqqixnoyXspKOsxjCx0z6oAAX2R5aGfLp
         btE4LqA3HvFbugBY7a29plVTNAqM0SZJtoYyWlBpxbbOI9HO0+b9b0PSXVhuRgydmCWT
         2HzHwhd+DgUL4cT7PK8jKvbnwCPhVWDHnXeGgytmLUyoX9iN2E2V/1yMtb6cNaIxAzUX
         9YPg==
X-Gm-Message-State: AOAM532HA1wXpflnDPTSdLCRfcsN8P4UPe/Q4tspglNQ+K17XGe7au1w
        OaF4O7wJM+rVydfyTc6PHaOsxA==
X-Google-Smtp-Source: ABdhPJypHc+BzZOA5mXlLdu/HDx65VNakZJJNfdvhFtCFWCP3DXb1FVC1YBFf4Q7sv72Bq0LzxuICA==
X-Received: by 2002:a05:6512:689:: with SMTP id t9mr27943252lfe.334.1643913952122;
        Thu, 03 Feb 2022 10:45:52 -0800 (PST)
Received: from [192.168.1.102] (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id b18sm4374543lff.109.2022.02.03.10.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 10:45:51 -0800 (PST)
Subject: Re: [PATCH 5/9] i2c: qcom-cci: initialize CCI controller after
 registration of adapters
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164705.1712027-1-vladimir.zapolskiy@linaro.org>
 <CAMZdPi_mNzg4ET7FvMeNLiQxVJj7XU1DSxjSQ2CHLBvKu2XZzA@mail.gmail.com>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <a0b1a993-7358-4016-e8d5-538f87d3d252@linaro.org>
Date:   Thu, 3 Feb 2022 20:45:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAMZdPi_mNzg4ET7FvMeNLiQxVJj7XU1DSxjSQ2CHLBvKu2XZzA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Loic,

On 2/3/22 7:29 PM, Loic Poulain wrote:
> Hi Vladimir,
> 
> On Thu, 3 Feb 2022 at 17:47, Vladimir Zapolskiy
> <vladimir.zapolskiy@linaro.org> wrote:
>>
>> The change is wanted to postpone initialization of busses on CCI controller
>> by cci_init() and cci_reset() till adapters are registered, the later is
>> needed for adding I2C bus devices and get correspondent vbus regulators.
> 
> This is odd, I don't think it's a good idea to register an adapter
> which is not yet initialized. Could you elaborate on why you need to
> do this, if you can't access the controller without this regulator
> enabled, maybe it is more than vbus supply, and, in that case, it
> should be enabled from your probe function.

thank you for review, the controller can be accessed without a vbus regulator,
but I2C devices connected to the master controller can not.

The registration of a master controller device done by i2c_add_adapter()
should be safe to defer IMO, because there shall be no communication on
the bus at this point, there are no slaves before probe completion, thus
cci_init()/cci_reset() can be safely called afterwards.

The rationale of the change is to merge two loops over busses, see change 6/9,
keeping two loops extremely complicates the proper resource management.

--
Best wishes,
Vladimir

>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   drivers/i2c/busses/i2c-qcom-cci.c | 17 ++++++++---------
>>   1 file changed, 8 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
>> index cf54f1cb4c57..eebf9603d3d1 100644
>> --- a/drivers/i2c/busses/i2c-qcom-cci.c
>> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
>> @@ -630,14 +630,6 @@ static int cci_probe(struct platform_device *pdev)
>>          val = readl(cci->base + CCI_HW_VERSION);
>>          dev_dbg(dev, "CCI HW version = 0x%08x", val);
>>
>> -       ret = cci_reset(cci);
>> -       if (ret < 0)
>> -               goto error;
>> -
>> -       ret = cci_init(cci);
>> -       if (ret < 0)
>> -               goto error;
>> -
>>          for (i = 0; i < cci->data->num_masters; i++) {
>>                  if (!cci->master[i].cci)
>>                          continue;
>> @@ -649,6 +641,14 @@ static int cci_probe(struct platform_device *pdev)
>>                  }
>>          }
>>
>> +       ret = cci_reset(cci);
>> +       if (ret < 0)
>> +               goto error_i2c;
>> +
>> +       ret = cci_init(cci);
>> +       if (ret < 0)
>> +               goto error_i2c;
>> +
>>          pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
>>          pm_runtime_use_autosuspend(dev);
>>          pm_runtime_set_active(dev);
>> @@ -663,7 +663,6 @@ static int cci_probe(struct platform_device *pdev)
>>                          of_node_put(cci->master[i].adap.dev.of_node);
>>                  }
>>          }
>> -error:
>>          disable_irq(cci->irq);
>>   disable_clocks:
>>          cci_disable_clocks(cci);
>> --
>> 2.33.0
>>
