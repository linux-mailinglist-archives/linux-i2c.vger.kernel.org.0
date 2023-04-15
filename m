Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 731336E2FCA
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Apr 2023 10:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjDOIwA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Apr 2023 04:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjDOIv7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Apr 2023 04:51:59 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A26BA420F
        for <linux-i2c@vger.kernel.org>; Sat, 15 Apr 2023 01:51:53 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id xi5so51458748ejb.13
        for <linux-i2c@vger.kernel.org>; Sat, 15 Apr 2023 01:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681548712; x=1684140712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=727pFB0FjNdVpuuxEzPiPIWkdzw9KyCLThLHjRqD2eQ=;
        b=lRQjOACQ945GGlASX3gK/8NJ2LavL17Q9KB6T+XTYMzJz8cUarJhJrrbZLSgJmaAfK
         35KaE66Yda5UmRDeD0GwhnzQJ66L+WszeeFIT8YCAsz0BO3DI7v3dsYINa5cu9tpQB/D
         hYIn/BUyHvm9Zt3gBFR0i9t8hl9RE3WYgMgagzE9GIvYRUSJVTnFN4dIlIZua5HFDwvH
         1twvgqSElT9TltVISyOO5mIZfPvLlJ4C7M+7FPDWvawtfwT6GlxPwGTMtaGIFMuGhict
         KxAnMCCukC9WTv5lIZQyIsi/+dBPAd3QsyyDBdPopNG6XV72gP9dqEHg/j0todk2jV/b
         GryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681548712; x=1684140712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=727pFB0FjNdVpuuxEzPiPIWkdzw9KyCLThLHjRqD2eQ=;
        b=if1xXyDNqY2YaNh7O7wG1RZtEYNFZPEH1ABDgSO1Dpo2BCcbqzj/LJci00yuk0/Vhi
         7L39LdjclwZq6JGjdR+meFDQnxf9CGNMXtOLU/2evMWrgXKsaM5CdZHQB0FvZQ93YsYe
         QMLRKRDFnt6ddxV8yCdlzRh6IphD4eyMpu14jRL2dt3q5O9jNnj8iiVDWW6OfQUojzv0
         AH+v/mBTgmFH8aMT2dg2jU/XkEpVn3nv1mRjPWioQYgu8/Jkb4PhuGrtpTBZ/xP9M/xL
         AOqS57Oq+9Z6Vcc8wG5pH2MzVmC7k7eLw5UAwsLD1ftRicDOCMFeg3q6obk+nqoifCZ0
         h27Q==
X-Gm-Message-State: AAQBX9e7fTpEYGDpsAXtTdhdSUMzMGnhPOKR6HJzIIpBgLOEYZlWw3+R
        2JJQr+hBySBx32bgBLkPrFlNHg==
X-Google-Smtp-Source: AKy350b+paIPDOmroqwsh6MSvE6G8YXP/c1DRY4EhfNdOp2c8An4cPaK9RA0npi1LeYJFmQWlUBWYQ==
X-Received: by 2002:a17:907:3112:b0:880:a42d:dfb4 with SMTP id wl18-20020a170907311200b00880a42ddfb4mr1330403ejb.16.1681548712153;
        Sat, 15 Apr 2023 01:51:52 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a3bf:4ed:6c53:2a36? ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id i3-20020a1709061e4300b0092b8c1f41ebsm3481507ejj.24.2023.04.15.01.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Apr 2023 01:51:51 -0700 (PDT)
Message-ID: <b848415b-c697-60e9-dca2-97ef612e2a85@linaro.org>
Date:   Sat, 15 Apr 2023 10:51:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
To:     Ryan Chen <ryan_chen@aspeedtech.com>, jk@codeconstruct.com.au,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20230415012848.1777768-1-ryan_chen@aspeedtech.com>
 <20230415012848.1777768-2-ryan_chen@aspeedtech.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230415012848.1777768-2-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 15/04/2023 03:28, Ryan Chen wrote:
> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
> and description for ast2600-i2cv2.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

