Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61F594F8687
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Apr 2022 19:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243500AbiDGRtA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Apr 2022 13:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235671AbiDGRs7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Apr 2022 13:48:59 -0400
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D632186FB;
        Thu,  7 Apr 2022 10:46:58 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-d39f741ba0so7107973fac.13;
        Thu, 07 Apr 2022 10:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MmJLuyekwoblpDX5b95jqgHit0wkMxVufsew2de6Slo=;
        b=0T5kaHlE1ipsHES8GxwMFE+DH+UvG7yo9S1SjOA8OaNGX0IYQzJZo76rn0/intxKMZ
         K8NK3KQ1dN+0sl8WOZ02/N46Lc8fb9hrdG7BdBQd2iepC2Bim6q1d53u3BLucg4zT9pu
         O5kShshmE5PSZIfYNoVJqV0hZ+vGJI8F3GV5Gp9/M2YeuL1sMKhqbJtxOGn5yZUnclsv
         9MvEAozfXc7r2sGIEsRav/byS/MGRed01yqoFimbNOb7vvXb9E1hDvlrp5Jr1uDG1OY1
         rxI1Ll9U6ANtOtjiPL6Q5XEX2Lp8guKUMCzVwiZXEuCELrGDCMXgTFmJdlu3R/TlmPyD
         V+FA==
X-Gm-Message-State: AOAM530oNeayLCliorKugaC151UzHBIFWIX6pJXW/QHK11eSjUUf03Kw
        7cLwE1yj+jZ9IFecKMYE2Q==
X-Google-Smtp-Source: ABdhPJw754vwBgnN/nBlQiTizQIA1UI3kDsgOYrCH4cfGSEpTe/2uKtRnMgf93qE3ml0Uw6wprvEeA==
X-Received: by 2002:a05:6870:2310:b0:da:b3f:2b76 with SMTP id w16-20020a056870231000b000da0b3f2b76mr6804229oao.277.1649353617755;
        Thu, 07 Apr 2022 10:46:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o17-20020a9d5c11000000b005b2611a13edsm8263373otk.61.2022.04.07.10.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:46:57 -0700 (PDT)
Received: (nullmailer pid 1614078 invoked by uid 1000);
        Thu, 07 Apr 2022 17:46:56 -0000
Date:   Thu, 7 Apr 2022 12:46:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org,
        Kuldeep Singh <singh.kuldeep87k@gmail.com>
Subject: Re: [PATCH v4 0/9] dt-bindings: qcom: convert entire GSBI (QUP
 I2C/SPI/UART) to DT schema
Message-ID: <Yk8jkJepgcRMo73l@robh.at.kernel.org>
References: <20220405063451.12011-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405063451.12011-1-krzysztof.kozlowski@linaro.org>
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

On Tue, Apr 05, 2022 at 08:34:42AM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> Changes since v3
> ================
> 1. Correct dmas in serial/UART bindings example.
> 2. Use "const" in compatible for GSBI.
> 3. Add review tags.
> 
> Changes since v2
> ================
> 1. Several new schema patches (GSBI, I2C and UART schema).
> 2. Several DTS fixes for clocks and DMAs. The choice of dma tx-rx
>    and clocks core-iface was by more-or-less number of fixes needed.
> 3. Add Kuldeep acks to patches without changes.
> 
> Changes since v1
> ================
> 1. Fix path in com/qcom,gsbi.txt.
> 2. Merge clock-names in example, correct $ref path (Kuldeep).
> 
> Merging
> =======
> 1. The DTS patches are independent and silence warnings pointed
>     out by schema.
> 
> 2. The DT schema patches should be taken together as GSBI (final patch)
>    depends on previous bindings.
> 
> Best regards,
> Krzysztof
> 
> Cc: Kuldeep Singh <singh.kuldeep87k@gmail.com>
> 
> Krzysztof Kozlowski (9):
>   arm64: dts: qcom: align dmas in I2C/SPI/UART with DT schema
>   arm64: dts: qcom: align clocks in I2C/SPI with DT schema
>   ARM: dts: qcom: ipq4019: align dmas in SPI/UART with DT schema
>   ARM: dts: qcom: ipq4019: align clocks in I2C with DT schema
>   ARM: dts: qcom: msm8660: disable GSBI8
>   spi: dt-bindings: qcom,spi-qup: convert to dtschema
>   dt-bindings: serial: qcom,msm-uartdm: convert to dtschema
>   dt-bindings: i2c: qcom,i2c-qup: convert to dtschema
>   dt-bindings: qcom: qcom,gsbi: convert to dtschema

Patches 6-9 applied.

Rob
