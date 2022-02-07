Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53AAE4ACA90
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 21:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbiBGUrv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 15:47:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241899AbiBGUcw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 15:32:52 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3036C0401E5
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 12:32:48 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id k18so26916059wrg.11
        for <linux-i2c@vger.kernel.org>; Mon, 07 Feb 2022 12:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lInl3v4291y96qRj5SmrtyZWxmX1JQwpyT8w4NZCIwE=;
        b=pZIbLbD2z5lCj7TnELtOL5EzoxwY+lBVxsw2GZfWwQfoK6YNhj3asWV4g24WsrMUDE
         Pc+FJHzk1Vwb1BcSpFfE0vnjX6h1xVtFhGSNFLyr3y/cTOKmdEePr+06n3Mz+WC3/mou
         J0mx4mjkkjxyu+eFle3FufFVo+vGPTRZhg5T5jQJ48QVvrT3A0n7LcYlyg2H/OCEMVaY
         BHT2Ifq4ujfMhMkTM0aqvNDcquf+yoJ9VFmdwFRw2RZHH8edWFGZNs69BbhMWPjcKkVn
         c9XLjQf3kynVd22B2/eWeltNLSu9E35+DnSu7D8cQx+vXVd+jI/IW0YoL7wlOaXz//Kt
         lNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lInl3v4291y96qRj5SmrtyZWxmX1JQwpyT8w4NZCIwE=;
        b=aTmUEtjZkGgUQxGxIcwExrMtNkwjUVXfYrbgWajCmk6ULxOZ4a6pVyTLRHTJwW4zP8
         3/4LR4yXJ6sWH1y3H0redzyjB/TdbVWJOF61X7q6jHwgfbAkm97MVhmFw6pQvc+N48QA
         ID6Azp11amvmUN6SiMrP4BQJVuOiH6YEOhjl7wwJj+3ietGFdDDkFPZJHnqWyPMSnWxW
         gyFrf/LlkUhSeR2sTOYkuUIRUMpNORDz+FgQDD12HuvTkQspoHqBdoynh4Il5vMPpioi
         Zf1omELUCJQaCZo2AWOIo9fyhXp+bbKWfHasNGjHQZ4PzcXzOWTBefgzRI4xyhGU6fv+
         CYUg==
X-Gm-Message-State: AOAM532As6pV08HP5kUZS60jZIrGGjpPhxIV1jr5PRMoux9Qw3telWVt
        g6bYmx+ZNBMvOF0oUN0sYIeAOA==
X-Google-Smtp-Source: ABdhPJxli8C56VbUUZpTG/k9gYuJnfVphrd7Cnfcv2luFPINoxa1eE5dK6Blkudp0C9VSCUYzi1P8w==
X-Received: by 2002:a5d:518f:: with SMTP id k15mr898486wrv.249.1644265966959;
        Mon, 07 Feb 2022 12:32:46 -0800 (PST)
Received: from [192.168.2.116] ([109.78.72.167])
        by smtp.gmail.com with ESMTPSA id t4sm10594105wro.71.2022.02.07.12.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 12:32:46 -0800 (PST)
Message-ID: <1cce8adf-1f49-b908-ee6e-f7c2ff6b5218@conchuod.ie>
Date:   Mon, 7 Feb 2022 20:32:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v6 02/12] dt-bindings: soc/microchip: add services as sub
 devs of sys ctrlr
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, conor.dooley@microchip.com
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, jassisinghbrar@gmail.com,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        lee.jones@linaro.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, geert@linux-m68k.org,
        krzysztof.kozlowski@canonical.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org,
        bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
        atishp@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>
References: <20220207162637.1658677-1-conor.dooley@microchip.com>
 <20220207162637.1658677-3-conor.dooley@microchip.com>
 <YgF8G/Eed03xn9iI@robh.at.kernel.org>
From:   Conor Dooley <mail@conchuod.ie>
In-Reply-To: <YgF8G/Eed03xn9iI@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 07/02/2022 20:07, Rob Herring wrote:
> On Mon, Feb 07, 2022 at 04:26:28PM +0000, conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Document mpfs-rng and mpfs-generic-service as subdevices of the system
>> controller.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>   .../microchip,mpfs-sys-controller.yaml        | 35 +++++++++++++++++--
>>   1 file changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
>> index f699772fedf3..b02c8bd72605 100644
>> --- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
>> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
>> @@ -13,7 +13,6 @@ description: |
>>     The PolarFire SoC system controller is communicated with via a mailbox.
>>     This document describes the bindings for the client portion of that mailbox.
>>   
>> -
>>   properties:
>>     mboxes:
>>       maxItems: 1
>> @@ -21,6 +20,38 @@ properties:
>>     compatible:
>>       const: microchip,mpfs-sys-controller
>>   
>> +  rng:
>> +    type: object
>> +
>> +    description: |
>> +      The hardware random number generator on the Polarfire SoC is
>> +      accessed via the mailbox interface provided by the system controller
>> +
>> +    properties:
>> +      compatible:
>> +        const: microchip,mpfs-rng
>> +
>> +    required:
>> +      - compatible
>> +
>> +  sysserv:
>> +    type: object
>> +
>> +    description: |
>> +      The PolarFire SoC system controller is communicated with via a mailbox.
>> +      This binding represents several of the functions provided by the system
>> +      controller which do not belong in a specific subsystem, such as reading
>> +      the fpga device certificate, all of which follow the same format:
>> +        - a command + optional payload sent to the sys controller
>> +        - a status + a payload returned to Linux
>> +
>> +    properties:
>> +      compatible:
>> +        const: microchip,mpfs-generic-service
>> +
>> +    required:
>> +      - compatible
>> +
>>   required:
>>     - compatible
>>     - mboxes
>> @@ -29,7 +60,7 @@ additionalProperties: false
>>   
>>   examples:
>>     - |
>> -    syscontroller: syscontroller {
>> +    syscontroller {
>>         compatible = "microchip,mpfs-sys-controller";
>>         mboxes = <&mbox 0>;
> 
> Removing the child nodes in the example doesn't address my comment. You
> still have them in the schema. IOW, this patch should be dropped unless
> you have reasons for child nodes other than I want to partition the OS
> drivers a certain way and creating DT nodes instantiates them for me.
> 
Obviously dropping this patch doesn't prevent me from instantiating the 
sub devices since it's not going to be done via DT anymore. Would you 
rather I replaced this patch with one adding a link to the online 
documentation [0] for them in the main description? I had left them in 
as I wasn't sure if you wanted the descriptions dropped entirely or not.

And yes, partition of the services is why I had originally gone for 
different drivers for the different aspects. Some of the services, like 
the RNG or reprogramming the FPGA from Linux have obvious subsystems to 
put them under, if it was just the eclectic mix of Microchip FPGA 
specific items I'd have not bothered with the partitioning.

Cheers,
Conor.

[0] 
https://onlinedocs.microchip.com/pr/GUID-1409CF11-8EF9-4C24-A94E-70979A688632-en-US-1/index.html
>>       };
>> -- 
>> 2.35.1
>>
>>
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
