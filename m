Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC386D396F
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Apr 2023 19:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbjDBR0Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Apr 2023 13:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbjDBR0Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Apr 2023 13:26:24 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA77E7DB2;
        Sun,  2 Apr 2023 10:26:22 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso18395889wms.1;
        Sun, 02 Apr 2023 10:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680456381;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/vbuti5krowtrunNTliRTFxJEP25/MzDnPfiiGQsdeo=;
        b=J8pksCugxMr7bNtJ0/qlJ10Lptx3EC19lN5z0s2GXmprRrIdmcWo1XMFCfUn7NJ14z
         q++BYaehv+imhuaKg5o+SmZ5oX5gOtxhjWoX0ed0jSwWohiQIBtn2v6+eo1CQclstfNK
         I1KthpbxHxvg222LwDWep11UAaY8FQ3g9ytU/50M5oO51DrrVlYc3K5yQ+jQ9goyYIGc
         y6yC8D68mPCkirbDK87ugI7LDhxCk9bD4CW38wdiP17sEedkMdp8rfqhdgV2k4dpLzTt
         Jp9EheRPAm3LT80wLYfZ47azt2yNF2VvGNJVZVeRQz/wO4twCX7ro3bbEOQ3gR/vcsw+
         E7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680456381;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vbuti5krowtrunNTliRTFxJEP25/MzDnPfiiGQsdeo=;
        b=ahXAs1H+gXq406VTQ563Wgw3YyytDpeV3gdeTWtMKNBw0aa9/M18M596WJsmEEj1vi
         mZeRrZZziARrn0iInFWIFo/D1SXejV10Dej44OLboUg8rFU52yO9NxuZxXIxtau7bRC2
         1KRPHxrpXkQ0auEsK1Psy6k/kEgwcZA5Ylyesm9ws6KW0IZwtZrDzLkSsDA3oVEY0sCh
         nesw7ATWsyFg2ObixXcNUyxu/JbYhlfUoIA6GjHfrmd+k2FY5/ix5jc232j75fwvH+i6
         bY3S6gdV0i5dqMAwdUqC07BUs7d70T23bY8gH9bZkpHBmFvYtzc0v9PCLNruFBlXxFOb
         BJAQ==
X-Gm-Message-State: AAQBX9chjJPh1HEXJlMTz5OIC9sTVFZNpQqT7TFGsXzUIAkrRHqxtgY9
        B86dXhFYKIuZSuzbhiZg1wk=
X-Google-Smtp-Source: AKy350YkZU0wUME6kjYWBKsiN+B6Bd5JavScpbV6FA4h3HrYDvcxwr2Qsm/WheupkAVb02tDYveAgg==
X-Received: by 2002:a05:600c:2144:b0:3ef:6396:d9b3 with SMTP id v4-20020a05600c214400b003ef6396d9b3mr21145158wml.18.1680456381192;
        Sun, 02 Apr 2023 10:26:21 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id h14-20020adffd4e000000b002c71a32394dsm7659691wrs.64.2023.04.02.10.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 10:26:20 -0700 (PDT)
Message-ID: <77528d8d-29f3-9bae-33f3-3296c9c8b0b1@gmail.com>
Date:   Sun, 2 Apr 2023 19:26:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 00/17] MT6795 Helio X10 and Sony Xperia M5: DT step 2!
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     qii.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 27/03/2023 10:36, AngeloGioacchino Del Regno wrote:
> Changes in v2:
>   - Squashed the addition of mediatek,mt6795-gce.h header with the
>     commit adding the MT6795 GCE compatible.
> 
> This series further enhances the support for the MT6795 Helio X10 SoC
> and the Sony Xperia M5 smartphone.
> 
> In particular, for the SoC support, this adds:
>   - Frequency Hopping support
>   - I2C controllers
>   - Power domains
>   - IOMMU support and LARBs
>   - GCE/CMDQ Mailbox
>   - VDECSYS and VENCSYS clocks
>   - MMSYS support
> 
> ...and, on the Xperia M5 smartphone, this adds:
>   - Frequency Hopping with Spread Spectrum for MAINPLL, MPLL, MSDCPLL
>   - Touchscreen support (Synaptics S2726, fw id: 1898977, RMI4 protocol)
>   - Accelerometer
>   - Magnetometer
>   - Proximity sensor
>   - NFC support
> 
> ...all of which was successfully tested on the Xperia M5 smartphone.
> 
> This series depends on [1] for the MMSYS support.
> 
> Plan for step 3 is to push upstream full display support, which does
> already work on my custom tree ;-)
> 
> [1]: https://lore.kernel.org/all/20230309102618.114157-1-angelogioacchino.delregno@collabora.com/
> 
> Cheers!
> 

Applied all but:
4/17 dt-binding already applied
7/17 dt-binding not applied
8/17 we are missing the dt binding

Thanks a lot for the great work
Matthias

> AngeloGioacchino Del Regno (17):
>    arm64: dts: mediatek: mt6795: Add Frequency Hopping Controller node
>    arm64: dts: mediatek: mt6795: Add apmixedsys syscon node
>    arm64: dts: mediatek: mt6795: xperia-m5: Enable Frequency Hopping
>    dt-bindings: i2c: i2c-mt65xx: Add compatible for MT6795 Helio X10
>    arm64: dts: mediatek: mt6795: Add nodes for I2C controllers
>    arm64: dts: mediatek: mt6795: Add SoC power domains
>    dt-bindings: mailbox: mediatek,gce-mailbox: Add support for MT6795
>    arm64: dts: mediatek: mt6795: Add support for the CMDQ/GCE mailbox
>    arm64: dts: mediatek: mt6795: Add MMSYS node for multimedia clocks
>    arm64: dts: mediatek: mt6795: Add VDECSYS and VENCSYS clocks
>    arm64: dts: mediatek: mt6795: Add support for IOMMU and LARBs
>    arm64: dts: mediatek: mt6795-xperia-m5: Enable I2C 0-3 busses
>    arm64: dts: mediatek: mt6795-xperia-m5: Add Synaptics RMI4 Touchscreen
>    arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMA255 Accelerometer
>    arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMM050 Magnetometer
>    arm64: dts: mediatek: mt6795-xperia-m5: Add Sensortek STK3310
>      Proximity
>    arm64: dts: mediatek: mt6795-xperia-m5: Add NXP PN547 NFC on I2C3
> 
>   .../devicetree/bindings/i2c/i2c-mt65xx.yaml   |   4 +
>   .../mailbox/mediatek,gce-mailbox.yaml         |  20 +-
>   .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 166 ++++++++++++
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi      | 245 ++++++++++++++++++
>   include/dt-bindings/gce/mediatek,mt6795-gce.h | 123 +++++++++
>   5 files changed, 550 insertions(+), 8 deletions(-)
>   create mode 100644 include/dt-bindings/gce/mediatek,mt6795-gce.h
> 
