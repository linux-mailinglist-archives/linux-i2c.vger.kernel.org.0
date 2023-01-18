Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFCC467259E
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 18:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjARRzY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 12:55:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbjARRzX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 12:55:23 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 155ED4ED0C;
        Wed, 18 Jan 2023 09:55:22 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id mg12so12818292ejc.5;
        Wed, 18 Jan 2023 09:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SfP2OGVBENhrrwDYTJ9/KvuOKzBuFDLKUT+DnHGhsBk=;
        b=gQIt/wxXSHJLcR9Fx4M3vyuYNI2J2FFIn3VLREyUk8A6ycq5f8zJrzYFo4bIrlyb4d
         4GCWBHzuHsm1sK5vBpVFLfTGXrWIj3UcPiZ9svUUvRSdd032eunoglCgsuqlXhFoaOU3
         aHbBhJdzZOOwm4cs62oFD/9PmawQLy4KSSAsOJfj/uf4mkQtHHwddkC533f6ahNkyL63
         V+qAtdbSDHA3gnfzU7/0eploax0Rh6Uus89jhx4q9BsZ0NpwrGNRw9NfpbZbVc6U2ihJ
         KuvRFNI4SnSyGmhnt2T3poTpuk1kWToDDW3q/iicA7RJ72qZUjqi8wK9FDZDeViEqt3j
         sdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SfP2OGVBENhrrwDYTJ9/KvuOKzBuFDLKUT+DnHGhsBk=;
        b=YfYJCWHYMX2iw76mwfBlD/CxgUV/pA6yH+VLcO4qd+S7w06e6wWbuL9SiHjY/cFxh2
         BNm+6KjJZOIYvQ3uk3tjKitfEgiWc4seGBtob1Ur1dnxjMJd5glnlGM5Zk9KeDEqUodK
         Tah8HIIBAcj0td/nFPSjXVmf2aXO7EX8Osz847ZqAwCBJjhvIOYZxntaaw14HZ/OXMAE
         wXbAGd7AJ0iMWNpRWfCMeYBw/uC9yPhXDOyq2YWmOyi7J4npZWBTHQtIwmcbRAf+R5+3
         dvopFNzn240S1HnglW7b8RQB3r6mkliK1kzJ5AQW4esX472hPK0oI99cSRzY7LfgcgHA
         y7MQ==
X-Gm-Message-State: AFqh2kqAMMI4KNRgipshmYRnTvAERRLzU1v+7Odc8ozydjY/vRdw4lWh
        uMtFtGentHn1R1mxuDGg1UU7GKO28go=
X-Google-Smtp-Source: AMrXdXsZ9cCq8lod5AHsSVI+9nzNNhW2oRPkBwK0XHdf04vRFqXlni8PgCVpLk5SWKtLTm2tgI0vzw==
X-Received: by 2002:a17:906:df48:b0:86b:49c6:259a with SMTP id if8-20020a170906df4800b0086b49c6259amr7170290ejc.62.1674064520415;
        Wed, 18 Jan 2023 09:55:20 -0800 (PST)
Received: from ?IPV6:2a02:3100:94be:5400:80c7:5ea4:ed2f:1a59? (dynamic-2a02-3100-94be-5400-80c7-5ea4-ed2f-1a59.310.pool.telefonica.de. [2a02:3100:94be:5400:80c7:5ea4:ed2f:1a59])
        by smtp.googlemail.com with ESMTPSA id q18-20020a17090676d200b00857c2c29553sm10680860ejn.197.2023.01.18.09.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 09:55:19 -0800 (PST)
Message-ID: <b6c4d504-3171-c84b-81f1-6f4da668fa52@gmail.com>
Date:   Wed, 18 Jan 2023 18:55:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/3] dt-bindings: i2c-gpio: Add properties for dealing
 with write-only SDA/SCL w/o pullup
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <57666b4f-4c12-7feb-caf1-5bd38908bfc7@gmail.com>
 <fa28a480-1980-16dd-0263-ae4866e7c7cc@gmail.com>
 <20230118163208.GA117919-robh@kernel.org>
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20230118163208.GA117919-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18.01.2023 17:32, Rob Herring wrote:
> On Tue, Jan 17, 2023 at 09:36:05PM +0100, Heiner Kallweit wrote:
>> There are slave devices that understand I2C but have read-only SDA and
>> SCL. Examples are FD650 7-segment LED controller and its derivatives.
>> Typical board designs don't even have a pull-up for both pins.
>> Therefore add properties for not using open-drain. For write-only SCL
>> we have a property already, add one for write-only SDA.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>> v4:
>> - add no-pullup properties
>> ---
>>  .../devicetree/bindings/i2c/i2c-gpio.yaml        | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
>> index e0d76d5eb..67898cc52 100644
>> --- a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
>> @@ -33,6 +33,10 @@ properties:
>>        open drain.
>>      maxItems: 1
>>  
>> +  i2c-gpio,sda-output-only:
>> +    description: sda as output only
>> +    type: boolean
>> +
>>    i2c-gpio,scl-output-only:
>>      description: scl as output only
>>      type: boolean
>> @@ -63,6 +67,18 @@ properties:
>>        GPIO line used for SCL into open drain mode, and that something is not
>>        the GPIO chip. It is essentially an inconsistency flag.
>>  
>> +  i2c-gpio,sda-has-no-pullup:
>> +    type: boolean
>> +    description: sda is used in a non-compliant way and has no pull-up.
>> +      Therefore disable open-drain. This property is mutually-exclusive
>> +      with i2c-gpio,sda-open-drain.
>> +
>> +  i2c-gpio,scl-has-no-pullup:
>> +    type: boolean
>> +    description: scl is used in a non-compliant way and has no pull-up.
>> +      Therefore disable open-drain. This property is mutually-exclusive
>> +      with i2c-gpio,scl-open-drain.
> 
> The mutual-exclusion can be expressed as a schema instead:
> 
> allOf:
>   - not:
>       required:
>         - i2c-gpio,scl-has-no-pullup
>         - i2c-gpio,scl-open-drain
>   - not:
>       required:
>         - i2c-gpio,sda-has-no-pullup
>         - i2c-gpio,sda-open-drain
> 
> Using 'dependencies' with a schema would also work.
> 
Great, I wasn't aware of options to express mutually-exclusive properties.

I'll wait a little for other feedback regarding the series and then submit
a new version incl. the extended schema.

> Rob

Heiner
