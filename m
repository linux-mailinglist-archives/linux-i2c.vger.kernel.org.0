Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7D3D53BCD5
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jun 2022 18:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237272AbiFBQvX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jun 2022 12:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237260AbiFBQvW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jun 2022 12:51:22 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF99D20041C
        for <linux-i2c@vger.kernel.org>; Thu,  2 Jun 2022 09:51:21 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id a2so8732534lfc.2
        for <linux-i2c@vger.kernel.org>; Thu, 02 Jun 2022 09:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bIYxg97S3iyb88OPVfILFUeTiGl49+1AUub1JCJFPwM=;
        b=gyKQk6duqaY8p7ECxAheGlUvVafZxj3GcSakRdZVY9S9pg5jLA98VJdKJIjKO8IWa6
         aykLPjVOSu268iU/Nqmx2swGTsq3t/dljKu9dXWa5uaB+D5IulwVZ1PFakxV6k2u1r74
         +/bpxhNxAdJJurIlJESteqlSC/ZVGoV+na9O81kJl8TOgekAfZpw20Lg3eZPpl0qMrav
         uLq5fWhELUeaSeuxR1gI6P0HZUaS+FLnWJyA634GI+hHsUyJAqEJN/g53eGkRMsRNM9M
         Iqu8DGErCNhuFWXHj/Utls6r2laizX43NSttES4VgjSP6JzykZb8/6xgQ2F+V3I8xIp6
         UGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bIYxg97S3iyb88OPVfILFUeTiGl49+1AUub1JCJFPwM=;
        b=OW8JkIu/Cu8dMWWBLq9XZ0ujMUlmkpEmcX4qmN08g34xJMZZpXz33DsWL9MTCKq5SS
         rVT1BIYBL5yfRQnDbUhMixFwG6izYIo/BiSheEbZ2R3Rco0b3TKMnbeBem5qVn2EQmJJ
         r85kpVFzNVEPP9jTDHen/d8dvItGBZmhhKiD8rA6Dm3k75FdcupmZQUzuIUJZ1G8YDa4
         TV5egt/XYF+OwassryqeQT7huXcs3ktC7n//Pvcohh1BReLB8dJP9M5NJIGT67F0Kgco
         BDSPsLeQt48rOCfGrY0pUJfxsQrDY6MvK+qiS0U0UsNe3JlLLkDMcYgZ8uWlLs3FtA4k
         VclA==
X-Gm-Message-State: AOAM531uB5SbQ8VZh5BpYY2Tp26fkl/lDnrhBUe1qwJcO/r/SsOq1E6H
        rk0B/k3JALo+pykV3uDpK3CP4g==
X-Google-Smtp-Source: ABdhPJyU9mGY24plO74VPhqxYIT23T3tnqboyVirH15zzi94tzDkXf6p0mF1lTPa1/gJ+qkH6xRGiw==
X-Received: by 2002:a05:6512:b2a:b0:479:12f5:91ba with SMTP id w42-20020a0565120b2a00b0047912f591bamr1897717lfu.443.1654188680139;
        Thu, 02 Jun 2022 09:51:20 -0700 (PDT)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id h11-20020a0565123c8b00b00477cae4880fsm1105013lfv.260.2022.06.02.09.51.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 09:51:19 -0700 (PDT)
Message-ID: <ff845970-3db3-f078-12b0-d8b111e380fa@linaro.org>
Date:   Thu, 2 Jun 2022 19:51:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] i2c: qcom-cci: simplify access to bus data structure
Content-Language: en-US
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220602131528.2246339-1-vladimir.zapolskiy@linaro.org>
 <CAMZdPi-iK0_OHdtdz9gakUoBqLJQyzjvntBQfvxObYPz-8e-DQ@mail.gmail.com>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAMZdPi-iK0_OHdtdz9gakUoBqLJQyzjvntBQfvxObYPz-8e-DQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Loic,

On 6/2/22 16:49, Loic Poulain wrote:
> On Thu, 2 Jun 2022 at 15:15, Vladimir Zapolskiy
> <vladimir.zapolskiy@linaro.org> wrote:
>>
>> Trivial non-functional change, which adds an alias to an extensively
>> used data location.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   drivers/i2c/busses/i2c-qcom-cci.c | 28 +++++++++++++++-------------
>>   1 file changed, 15 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
>> index 8d078bdb5c1b..c4a4a4b54131 100644
>> --- a/drivers/i2c/busses/i2c-qcom-cci.c
>> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
>> @@ -541,6 +541,7 @@ static int cci_probe(struct platform_device *pdev)
>>                  return -ENOENT;
>>
>>          for_each_available_child_of_node(dev->of_node, child) {
>> +               struct cci_master *master;
>>                  u32 idx;
>>
>>                  ret = of_property_read_u32(child, "reg", &idx);
>> @@ -555,27 +556,28 @@ static int cci_probe(struct platform_device *pdev)
>>                          continue;
>>                  }
>>
>> -               cci->master[idx].adap.quirks = &cci->data->quirks;
>> -               cci->master[idx].adap.algo = &cci_algo;
>> -               cci->master[idx].adap.dev.parent = dev;
>> -               cci->master[idx].adap.dev.of_node = of_node_get(child);
>> -               cci->master[idx].master = idx;
>> -               cci->master[idx].cci = cci;
>> +               master = &cci->master[idx];
>> +               master->adap.quirks = &cci->data->quirks;
>> +               master->adap.algo = &cci_algo;
>> +               master->adap.dev.parent = dev;
>> +               master->adap.dev.of_node = of_node_get(child);
>> +               master->master = idx;
>> +               master->cci = cci;
>>
>> -               i2c_set_adapdata(&cci->master[idx].adap, &cci->master[idx]);
>> -               snprintf(cci->master[idx].adap.name,
>> -                        sizeof(cci->master[idx].adap.name), "Qualcomm-CCI");
>> +               i2c_set_adapdata(&master->adap, master);
>> +               snprintf(master->adap.name, sizeof(master->adap.name),
>> +                        "Qualcomm-CCI");
> 
> Let's use a single line for snprintf now.

thank you for review, let me send v2.

--
Best wishes,
Vladimir
