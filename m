Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5927653E2B7
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 10:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbiFFIjh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 04:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232376AbiFFIjW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 04:39:22 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A6F433E95;
        Mon,  6 Jun 2022 01:39:11 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id u12-20020a17090a1d4c00b001df78c7c209so17304410pju.1;
        Mon, 06 Jun 2022 01:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=9jt8S5U1f1kOACj8Cd91MdGJdCEtZCqF+0G+U8Im1w0=;
        b=Hvc4xds3Ld7nAJoFdHYgv6+UFN82CWncpDasinypvWoPemToMat6BoFjtJTCdNtruy
         xpm0n7Ecsr9mqwIrgfF6+2JuLkB3pkqNOk1gdBx7tWSUfOB5WPreDXz1YV6TSZRLoC53
         dkWeL14FRfZQh4I1nArWCy/RtcNe0rKjqYoxPtMhAp33eQF7bjyYyjYnAQOM727//P0X
         28z86ae0g4jemj+bzT0QCHanlHnlKulad53O8aID3XjFS1PKnLAT0Iu/1J6achDaY+3j
         02GXlT31Eykn1GX/23JF98/HAjrkTcbX+pi/6tzzrI28/c6rajgm1qIHBD1B9BvvCBxm
         AU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=9jt8S5U1f1kOACj8Cd91MdGJdCEtZCqF+0G+U8Im1w0=;
        b=eLt0rZz49MSXFtbN9FpW6MOBCIeME/zyR1NHjbRsY5ejk32I76z49TONdYHlAp5Nfo
         wnwEvqZmnkEO3/J4frOXWO+VP2Z6TFjzo4xEoOLMDolJmtJzvCEsSsIKybXXZOR8upK9
         3+76H9Id3egSMtVkTVf7Y1V566enn4H10nh2yDUXZjmciZS4bNwW4ifQt5FyxxaNhzCd
         8UExUzpEZ8TAxav35M0rgEZHWbJeO6aTju7hzhkgk9wjDzAjF597jscxr993koEsxCbY
         2THkLewzaWAKheBk9itCPyblhuZ/aRFtg5OfXfbgcD1pMGnw1F5aoWtQniz3esoQD9E9
         asdg==
X-Gm-Message-State: AOAM532/Gm5LOaISX03xbrv6Fs2gUJo9oG1JK+mVtK+vusjSwvEClEsi
        JGzOqR4jd0V4VueWUCoyHde5Ebr5gWgHow==
X-Google-Smtp-Source: ABdhPJx2O4PvrW1/HZhvHE0AP+0R76eiX3FJho3sOmcdSrrlkGiC8gY1b7TUVBkwObCt32ewEIRH0w==
X-Received: by 2002:a17:903:186:b0:167:62b0:a556 with SMTP id z6-20020a170903018600b0016762b0a556mr10753955plg.122.1654504750423;
        Mon, 06 Jun 2022 01:39:10 -0700 (PDT)
Received: from [10.10.12.193] (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a1a4300b001e2f53e1042sm11948045pjl.7.2022.06.06.01.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 01:39:10 -0700 (PDT)
Message-ID: <f0a8c3fd-8013-0f7f-b7f8-5e9e85395543@gmail.com>
Date:   Mon, 6 Jun 2022 16:39:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From:   Potin Lai <potin.lai.pt@gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: aspeed-i2c: add properties for manual
 clock setting
To:     Rob Herring <robh@kernel.org>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Rayn Chen <rayn_chen@aspeedtech.com>,
        Patrick Williams <patrick@stwcx.xyz>,
        Potin Lai <potin.lai@quantatw.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20220601041512.21484-1-potin.lai.pt@gmail.com>
 <20220601041512.21484-3-potin.lai.pt@gmail.com>
 <20220605214700.GA3558088-robh@kernel.org>
Content-Language: en-US
In-Reply-To: <20220605214700.GA3558088-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Rob Herring 於 2022/6/6 上午 05:47 寫道:
> On Wed, Jun 01, 2022 at 12:15:12PM +0800, Potin Lai wrote:
>> Add following properties for manual tuning clock divisor and cycle of
>> hign/low pulse witdh.
>>
>> * aspeed,i2c-manual-clk: Enable aspeed i2c clock manual setting
>> * aspeed,i2c-base-clk-div: Base Clock divisor (tBaseClk)
>> * aspeed,i2c-clk-high-cycle: Cycles of clock-high pulse (tClkHigh)
>> * aspeed,i2c-clk-low-cycle: Cycles of clock-low pulse (tClkLow)
>>
>> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
>> ---
>>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 44 +++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>> index ea643e6c3ef5..e2f67fe2aa0c 100644
>> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>> @@ -12,6 +12,28 @@ maintainers:
>>  allOf:
>>    - $ref: /schemas/i2c/i2c-controller.yaml#
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          const: st,stm32-uart
> stm32 uart?
Sorry, I will remove it.
>> +
>> +    then:
>> +      properties:
>> +        aspeed,i2c-clk-high-cycle:
>> +          maximum: 8
>> +        aspeed,i2c-clk-low-cycle:
>> +          maximum: 8
>> +
>> +  - if:
>> +      required:
>> +        - aspeed,i2c-manual-clk
>> +
>> +    then:
>> +      required:
>> +        - aspeed,i2c-base-clk-div
>> +        - aspeed,i2c-clk-high-cycle
>> +        - aspeed,i2c-clk-low-cycle
> 'dependencies' can better express this than an if/then.
>
> However, I think this should all be done in a common way.
>
>> +
>>  properties:
>>    compatible:
>>      enum:
>> @@ -49,6 +71,28 @@ properties:
>>      description:
>>        states that there is another master active on this bus
>>  
>> +  aspeed,i2c-manual-clk:
>> +    type: boolean
>> +    description: enable manual clock setting
> No need for this as presence of the other properties can determine this.
>
>> +
>> +  aspeed,i2c-base-clk-div:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192,
>> +           16384, 32768]
>> +    description: base clock divisor
> Specify the i2c bus frequency and calculate the divider.
>
>> +
>> +  aspeed,i2c-clk-high-cycle:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 1
>> +    maximum: 16
>> +    description: cycles of master clock-high pulse width
>> +
>> +  aspeed,i2c-clk-low-cycle:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 1
>> +    maximum: 16
>> +    description: cycles of master clock-low pulse width
> These 2 should be common. I think you just need a single property 
> expressing duty cycle.
>
> Rob

Got it, thank you for the suggestion of duty cycle.
I will use duty cycle for next version.

Potin

