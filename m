Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2B164AA8D0
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Feb 2022 13:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379843AbiBEMsJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Feb 2022 07:48:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379783AbiBEMsI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Feb 2022 07:48:08 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F03AC061353
        for <linux-i2c@vger.kernel.org>; Sat,  5 Feb 2022 04:48:06 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id o1-20020a1c4d01000000b0034d95625e1fso11220356wmh.4
        for <linux-i2c@vger.kernel.org>; Sat, 05 Feb 2022 04:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+LPvcJ2sd5T7CufgUritnA87r/Y5fUmsfeCEUXpPT6E=;
        b=ef9uwCGIArsx4B0HtycPruLj7UAWV4CigNy4UIbrAY3TClE0iuhryFmiNJKx4dleOg
         yyA8XqUKF5FM5R0ZmQ30vYByA8DSGJmY1TsX6/zSWJZFfk0llkoBeDYYfGosdLSfS1Qk
         ehwqDZwKdRwafW/+lg86kz2XUanNm8jZ2g1Tq7SHg0v14EVQKAHRJo/skJ8OeVrzD+qe
         INtz/+NvmVRRRwzbvAvsNRauN2oObdpKRtrpXXNHFSpmjS9UzLj2X4Y5eLvobCaKL1lB
         pNd8r5wOZfbFPBEjDbWF5O1+0RDhRc7+e1YfuhSc0UOQQWl8ouLqrtx+n2EqpOuOXDST
         UQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+LPvcJ2sd5T7CufgUritnA87r/Y5fUmsfeCEUXpPT6E=;
        b=d195mZns2WU2pUS8IQovca8SqJsnrETfZnIHQoceTVaRIQLG5c8fvhuopIN2jbGkTx
         aVTdzxH2sEOtOPCFCc8m48XsogKu9/JT3gMM9bBBUJS/3uRtwqVoCNFYgQXtnVyPqtZd
         J/+HO6oU67WvsQBBOxcyeVgZTdKCiF0MYDKEuAtMQjzzfGAIVkjLmdDjSrxrEl/bY57H
         nVYslOntqAvpVaz7fAKvXsFOiy8OrS2hkMZnKnkfA3i7gSmkOPN1MR+34+rOVOvbtDmH
         GBa+HOcioDPiVkrTGXLawrVeNxpANnzmrY4lxXOCGnHS8eX6lKszedlTdOnwq7mIiKKG
         bVMQ==
X-Gm-Message-State: AOAM530X5uqhi8KtGyPjSw+8sMjS3RafIZUQjHi9HkqTx3pwl4D5+kIk
        ajqp7quCF9VIFJKdhm1hGuMJaA==
X-Google-Smtp-Source: ABdhPJxpq/DFWpEEyQIsjuuaVvilLjogf6JlPr9dXqoGfRGP3jRw+knIrG8WTJYlwwMgH5tU0Wc1Vw==
X-Received: by 2002:a05:600c:3217:: with SMTP id r23mr2998357wmp.159.1644065284763;
        Sat, 05 Feb 2022 04:48:04 -0800 (PST)
Received: from [192.168.2.116] ([109.78.72.167])
        by smtp.gmail.com with ESMTPSA id m8sm4429538wrn.106.2022.02.05.04.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Feb 2022 04:48:04 -0800 (PST)
Message-ID: <c610ce52-e1ef-393c-0948-57a4c6f07d72@conchuod.ie>
Date:   Sat, 5 Feb 2022 12:48:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v5 06/12] dt-bindings: pwm: add microchip corepwm binding
Content-Language: en-US
To:     Conor.Dooley@microchip.com, geert@linux-m68k.org,
        u.kleine-koenig@pengutronix.de
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        aou@eecs.berkeley.edu, atishp@rivosinc.com, bin.meng@windriver.com,
        brgl@bgdev.pl, Daire.McNamara@microchip.com,
        devicetree@vger.kernel.org, heiko@sntech.de,
        Ivan.Griffin@microchip.com, jassisinghbrar@gmail.com,
        krzysztof.kozlowski@canonical.com, lee.jones@linaro.org,
        Lewis.Hanly@microchip.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
        robh@kernel.org, thierry.reding@gmail.com
References: <20220201075824.aixrvkvmjde2ihxx@pengutronix.de>
 <20220202123542.3721512-1-conor.dooley@microchip.com>
 <CAMuHMdWrmuY7pwY8U0t9LumEvUTBEA06uV7hNyKFAPMQtE98_A@mail.gmail.com>
 <3862e358-901c-e848-71af-01eceed26f74@microchip.com>
 <CAMuHMdXvw9cNNzBhp-sSMTXxP2eALhB=fD78Wgx-kks7wr6oiQ@mail.gmail.com>
 <fa747594-a112-d313-5de3-2330bf5ddc8a@microchip.com>
From:   Conor Dooley <mail@conchuod.ie>
In-Reply-To: <fa747594-a112-d313-5de3-2330bf5ddc8a@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Geert, Uwe,

Hopefully the following does a better job of explaining the two parameters?

Thanks,
Conor.

microchip,sync-update-mask:
   description: |
     Depending on how the IP is instantiated, there are two modes of
     operation. In synchronous mode, all channels are updated at the
     beginning of the PWM period, and in asynchronous mode updates
     happen as the control registers are written. A 16 bit wide
     "SHADOW_REG_EN" parameter of the IP core controls whether
     synchronous mode is possible for each channel, and is set by the
     bitstream programmed to the FPGA. If the IP core is instantiated
     with SHADOW_REG_ENx=1, both registers that control the duty cycle
     for channel x have a second "shadow"/buffer reg synthesised.
     At runtime a bit wide register exposed to APB can be used to toggle
     on/off synchronised mode for all channels it has been synthesised
     for.
     Each bit corresponds to a PWM channel & represents whether
     synchronous mode is possible for that channel.

   $ref: /schemas/types.yaml#/definitions/uint32
   default: 0

microchip,dac-mode-mask:
   description: |
     Optional, per-channel Low Ripple DAC mode is possible on this IP
     core. It creates a minimum period pulse train whose High/Low
     average is that of the chosen duty cycle. This "DAC" will have far
     better bandwidth and ripple performance than the standard PWM
     algorithm can achieve. A 16 bit DAC_MODE module parameter of the IP
     core, set at instantiation and by the bitstream programmed to the
     FPGA, determines whether a given channel operates in regular PWM or
     DAC mode.
     Each bit corresponds to a PWM channel & represents whether DAC mode
     is enabled for that channel.

   $ref: /schemas/types.yaml#/definitions/uint32
   default: 0

On 02/02/2022 14:37, Conor.Dooley@microchip.com wrote:
> On 02/02/2022 14:02, Geert Uytterhoeven wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> On Wed, Feb 2, 2022 at 2:46 PM <Conor.Dooley@microchip.com> wrote:
>>> On 02/02/2022 13:28, Geert Uytterhoeven wrote:
>>>> On Wed, Feb 2, 2022 at 1:33 PM <conor.dooley@microchip.com> wrote:
>>>>>> On 01/02/2022 07:58, Uwe Kleine-König wrote:
>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>> On Mon, Jan 31, 2022 at 11:47:21AM +0000, conor.dooley@microchip.com wrote:
>>>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>>>
>>>>>>> Add device tree bindings for the Microchip fpga fabric based "core" PWM
>>>>>>> controller.
>>>>>>>
>>>>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>>>>>
>>>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>>>>> ---
>>>>>>> .../bindings/pwm/microchip,corepwm.yaml       | 75 +++++++++++++++++++
>>>>
>>>>>>> +  microchip,sync-update:
>>>>>>> +    description: |
>>>>>>> +      In synchronous mode, all channels are updated at the beginning of the PWM period.
>>>>>>> +      Asynchronous mode is relevant to applications such as LED control, where
>>>>>>> +      synchronous updates are not required. Asynchronous mode lowers the area size,
>>>>>>> +      reducing shadow register requirements. This can be set at run time, provided
>>>>>>> +      SHADOW_REG_EN is asserted. SHADOW_REG_EN is set by the FPGA bitstream programmed
>>>>>>> +      to the device.
>>>>>>> +      Each bit corresponds to a PWM channel & represents whether synchronous mode is
>>>>>>> +      possible for the PWM channel.
>>>>>>> +
>>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint16
>>>>>>> +    default: 0
>>>>>>
>>>>>> I'm not sure I understand this correctly. This is a soft-core and you
>>>>>> can synthesize it either with or without the ability to do synchronous
>>>>>> updates or not, right? All 16 channels share the same period length and
>>>>>> in the simple implementation changing the duty cycle is done at once
>>>>>> (maybe introducing a glitch) and in the more expensive implementation
>>>>>> there is a register to implement both variants?
>>>>>
>>>>> Correct. If the IP is instantiated with SHADOW_REG_ENx=1, both
>>>>> registers that control the duty cycle for channel x have a second
>>>>> "shadow reg" synthesised. At runtime a bit wide register exposed to
>>>>> APB can be used to toggle on/off synchronised mode for all channels
>>>>> it has been synthesised for.
>>>>>
>>>>> I will reword this description since it is not clear.
>>>>
>>>> Shouldn't it use a different compatible value instead?
>>>> Differentiation by properties is not recommended, as it's easy to
>>>> miss a difference.
>>>
>>> Either you have something in mind that I've not thought of, or I've done
>>> a bad job of explaining again. The buffer/"shadow" registers are
>>> synthesised on a per channel basis, so any combination of the 16
>>> channels may have this capability. The same applies to the DAC mode, per
>>> channel there too.
>>
>> Oops, hadn't noticed this is per channel. Indeed, then a different
>> compatible value is futile.
>> So since "microchip,sync-update" is a bitmask, perhaps it should be
>> called "microchip,sync-update-mask"?
>> Same for "microchip,dac-mode" -> "microchip,dac-mode-mask"?
> 
> Adding -mask sounds good to me.
> 
>> Also, using different integer sizes than uint32 is frowned upon, unless
>> there is a very good reason to do so. I can imagine a future version
>> would support more channels, and then uint16 becomes a limitation.
> 
> Sure, uint32 it is.
> 
>> For both: Rob?
> 
> Both of these properties fall under the "DO attempt to make bindings
> complete even if a driver doesn’t support some features" category, so I
> am perfectly happy to change these properties to whatever is convention
> (or ultimately drop them for the sake of the remainder of the series).
> 
> Thanks,
> Conor.
> 
