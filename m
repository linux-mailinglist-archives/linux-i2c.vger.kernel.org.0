Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB6D6D0C73
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Mar 2023 19:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbjC3ROr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Mar 2023 13:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbjC3ROq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Mar 2023 13:14:46 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0BBD199E;
        Thu, 30 Mar 2023 10:14:44 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id n10-20020a05600c4f8a00b003ee93d2c914so13501558wmq.2;
        Thu, 30 Mar 2023 10:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680196483;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RaRoSIyeWAS0YcglF+MkDSwOdoe0p8vmqc9euKe3n3Y=;
        b=DmATT2St4cxNQNUXVh6ikGXrHCSQf/Uf/9U+isdD8i+7RAZWEQsl80EmF5Q4aHjnHy
         zm967qSSxVqnwsXVjD1FzUoMnFDKhm0tuUv0BR+9vlhT/IC2AwLUkxKN3Jhv5BM7c9JL
         yUR3dQMDSoDnfk1q3dc7Cyb6FbmAsrwB9pUr7UHjDEsxA0FbrjqYlGyHWEmyeN/6vwyQ
         iNYj2pUTVISqsHsNfDKbIV7iHhh1XwAh94NlJjMfeWEro0m985BuKpV+vZN1lgUo7cfW
         lHwWI6VMJFfHXPNtgGjLXxg6SWS6sxe3ZKo56u7tLoPm7UgVQVeGF7NlPU0RPB5dC5Yv
         q0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680196483;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RaRoSIyeWAS0YcglF+MkDSwOdoe0p8vmqc9euKe3n3Y=;
        b=76CFA76WZ9RX8e1D1ZQ0fVRDizi0qaqTP21MRShWS0ntPqZX/kfe5n1LDjzS4+anjl
         VrFCF0StZkmCoIE/pCjhpWU3p0Ba7U9W/HHiBMtkk2dM9r2DLN8nyZBrncpxOWsgIp1n
         PBwfn804dkpemgOE47TCRXiIjIEgw2gMsaKql7dDqWT0yCydemmYURlRh70Vjm1OnyRc
         /QijCznC6CaOqHpZVLFFVyQ/tOHEn2YxasfMY3HTznAEryYA4Z6K4ncxMgisZ+J8qJrM
         oVX2q30RRXIqFi2F/D3ipWFvGjkYBSVmtbchRtG+vSSnUQx4HJjJ3FPdPApSnTXnyo2S
         OBHw==
X-Gm-Message-State: AO0yUKWtjxgbNVQRKC/pRW/PvVcx/lx0oefM+yt2zS5br0mOMIcjbpkl
        ZzMosEpesUh2E+ZgzNkVLTs=
X-Google-Smtp-Source: AK7set8caITXbfz/b/v8RPFfOoVv240ptkKm7Gl5BrTyyi/tNMGt7vUfhWHV/SMHnibfOS0cfpU6uA==
X-Received: by 2002:a05:600c:218d:b0:3ed:9576:34ce with SMTP id e13-20020a05600c218d00b003ed957634cemr18141275wme.9.1680196483237;
        Thu, 30 Mar 2023 10:14:43 -0700 (PDT)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n18-20020a1c7212000000b003eafc47eb09sm6418137wmc.43.2023.03.30.10.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 10:14:42 -0700 (PDT)
Message-ID: <c654905d-a8c8-fafb-b8c5-2992b7cac0d8@gmail.com>
Date:   Thu, 30 Mar 2023 19:14:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk
 board
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>
References: <20221122-mt8365-i2c-support-v6-0-e1009c8afd53@baylibre.com>
 <20221122-mt8365-i2c-support-v6-2-e1009c8afd53@baylibre.com>
 <945d8a82-80b3-8ae2-3b2a-7011621ad8d9@collabora.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <945d8a82-80b3-8ae2-3b2a-7011621ad8d9@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 28/03/2023 12:04, AngeloGioacchino Del Regno wrote:
> Il 28/03/23 11:04, Alexandre Mergnat ha scritto:
>> Enable the I2C0 bus provides communication with:
>> - The integrated RT9466 Switching Battery Charger.
>> - The integrated MT6691 LP4X buck for VDDQ.
>> - The integrated MT6691 LP4X buck for VDD2.
>> - The pin header, to plug external I2C devices.
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts 
>> b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
>> index 4683704ea235..adc79ba14b33 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
>> @@ -87,6 +87,13 @@ optee_reserved: optee@43200000 {
>>       };
>>   };
>> +&i2c0 {
>> +    clock-frequency = <100000>;
>> +    pinctrl-0 = <&i2c0_pins>;
>> +    pinctrl-names = "default";
>> +    status = "okay";
>> +};
>> +
>>   &pio {
>>       gpio_keys: gpio-keys-pins {
>>           pins {
>> @@ -96,6 +103,14 @@ pins {
>>           };
>>       };
>> +    i2c0_pins: i2c0-pins {
>> +        pins {
>> +            bias-pull-up;
> 
> I prefer seeing pinmux first, any other properties last....
> If Matthias can please fix that while applying...
> 

Done and queued the whole series.

Thanks!
Matthias

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> 
