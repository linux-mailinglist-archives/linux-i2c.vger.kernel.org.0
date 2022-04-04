Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00F404F1E2C
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Apr 2022 00:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244162AbiDDVyr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Apr 2022 17:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380582AbiDDVj2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Apr 2022 17:39:28 -0400
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBB762D5;
        Mon,  4 Apr 2022 14:30:53 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id i11-20020a9d4a8b000000b005cda3b9754aso8089621otf.12;
        Mon, 04 Apr 2022 14:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b9wwey9wuXrqTYmL5LovEHPsQHQwTlggC3S8jKSb4ns=;
        b=GWz30ebiKeIxVZKH899pFkanFUpb9Fbf/8+jZ6u4QAxtiv3VP/oNrS6CpkIhWZdtpV
         XTYrySxJDw6SQFZ33hkL1bEUlQbc8DoDQc44V4PFLM496abfoBHbzaTyO7E9LKn9n8fi
         /qXA+cXy/6fIP0TICFCy5bmrXreYYn8jFUYPxi5rltSweAMMRCZ/LOl2OTOxgLJEshCD
         SnnaQ7BxXuAgDCOEPgG10L6pJ4fcMZIrCErzeuRvtI77aCFZmzcmzoDQ+VS/8OdTDZ6S
         V96vXJmYry+WJwsaAX9YkKbwC3MpXsJIUlLuKfPlgnjn9T6dTKDFawM7R0Kobh7fUbRD
         kDMw==
X-Gm-Message-State: AOAM533RteEARLfVkQ0CrKgTKiUj1UtSBWBP35SOBV6jV8ECOlKtKyRv
        cAlAfhsaZDwOB5GiAogDgg==
X-Google-Smtp-Source: ABdhPJx+s+eTM1npBYS8mqdR8sb1Ff6dAakzIAXsNmPfXBn853KX39fvIdVHvMdojukhEQpNOpjHWw==
X-Received: by 2002:a9d:3e14:0:b0:5b2:5647:8891 with SMTP id a20-20020a9d3e14000000b005b256478891mr112440otd.22.1649107801571;
        Mon, 04 Apr 2022 14:30:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m13-20020a056820050d00b003297b35bc63sm599769ooj.40.2022.04.04.14.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 14:30:01 -0700 (PDT)
Received: (nullmailer pid 2017375 invoked by uid 1000);
        Mon, 04 Apr 2022 21:30:00 -0000
Date:   Mon, 4 Apr 2022 16:30:00 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 8/9] dt-bindings: i2c: qcom,i2c-qup: convert to
 dtschema
Message-ID: <YktjWOS4U1qtzJve@robh.at.kernel.org>
References: <20220402184011.132465-1-krzysztof.kozlowski@linaro.org>
 <20220402184011.132465-9-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220402184011.132465-9-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 02 Apr 2022 20:40:10 +0200, Krzysztof Kozlowski wrote:
> Convert the Qualcomm Universal Peripheral (QUP) I2C controller to DT
> Schema.
> 
> Add missing properties: dma and dma-names, pinctrl states (to indicate
> support for sleep pinctrl).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-qup.txt  | 40 ---------
>  .../devicetree/bindings/i2c/qcom,i2c-qup.yaml | 89 +++++++++++++++++++
>  2 files changed, 89 insertions(+), 40 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
