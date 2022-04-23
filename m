Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D19E350CD15
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Apr 2022 20:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236807AbiDWTAp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 Apr 2022 15:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236814AbiDWTAo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 23 Apr 2022 15:00:44 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD591C65F8
        for <linux-i2c@vger.kernel.org>; Sat, 23 Apr 2022 11:57:46 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id k23so22286824ejd.3
        for <linux-i2c@vger.kernel.org>; Sat, 23 Apr 2022 11:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PZYZo4riuAASrgNYiBnvXj2fNHSGkngTmMftoxnKnxw=;
        b=S99uY+KgXY67ufTlCYtEQPsZsiZ7a7vlBE3DAb0FD3v0RBR/yokzgKtQjAIpzjjDT1
         Q0LN16pQ0xVe0KyOph982meSjp8BtRoTgVC2DGFAWD+zKev1g4ZL/HA+VbwZxhMTT8R1
         F0EMdytvzkupg9J+f2A7mRXhu4/LqvM6nICpukdsx8Hf2AOcG6H4NG8ghnNk4cyNEZTH
         UXt4Pav/LF89DbfIROk4zoLnWmvlrgshaR25g3/sbuze5/8RxKV1mxBmOAAEEjE6Ud/G
         J5I2x3AeZiJSHEzkvAzqywQZwy9MDJwaVYEDvi97GhkfOrKtKfPuAsVk/CMnZuxtPkbt
         LSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PZYZo4riuAASrgNYiBnvXj2fNHSGkngTmMftoxnKnxw=;
        b=Hw9g0KBsuU/B1uSHExcTDFcQ8khb55KERcP/XeU20oNlxOcRDQGmqQmOjbqdHNqDue
         toh7oC3e9j9oP8CvqknxOiHZx+gpFX6e5LutvvBGSlep7ztmEQx54Yf8fbF4B4kiW+tU
         FO6rPUVKPtAku667PTKFiYLaAZjJoQSDUC3rpSJXMtIY9WUEbEiormRaITHYJ6cz1i8E
         A4Dy2Sg6JWUk3rhkzJtTAeXPo24j0oSQ7cZCn/fos/QWERs3Bg4G/adAZPYBvv67d0f2
         CLBtFJPivhXY6Anx4obeLQR4bfcmjp4qK+4QX3uKAxnHmkI0a+fPHp9Q7QusA/vmG4y4
         ykLg==
X-Gm-Message-State: AOAM533e72v9xMkZqI48/i5Vot4Nl4oOlB1HcXf2MwUrWAO4iaR+fScN
        j31J6p1S3sSUDXWhCNao8GXmkA==
X-Google-Smtp-Source: ABdhPJz2nWyRKZg1zq6pTJKVo9fEAxz7J/WZFcUk2197nRcFLmsa6ZBUp2Uv9560LFLVvyWESQ3dDQ==
X-Received: by 2002:a17:907:6d17:b0:6ef:f06c:89 with SMTP id sa23-20020a1709076d1700b006eff06c0089mr9807501ejc.649.1650740264867;
        Sat, 23 Apr 2022 11:57:44 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p12-20020a50c94c000000b00425c48132bfsm1831124edh.55.2022.04.23.11.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 11:57:44 -0700 (PDT)
Message-ID: <a5ed1592-630a-0c42-151e-6271989f07d9@linaro.org>
Date:   Sat, 23 Apr 2022 20:57:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: i2c: renesas,riic: Document RZ/G2UL SoC
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220423132043.139672-1-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220423132043.139672-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23/04/2022 15:20, Biju Das wrote:
> Document RZ/G2UL I2C bindings. RZ/G2UL I2C is identical to one found on
> the RZ/G2L SoC. No driver changes are required as RZ/G2L compatible
> string "renesas,riic-rz" will be used as a fallback.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
