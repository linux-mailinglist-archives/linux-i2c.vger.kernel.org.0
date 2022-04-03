Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF26D4F0A25
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Apr 2022 16:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350400AbiDCOWd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 Apr 2022 10:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236161AbiDCOWd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 Apr 2022 10:22:33 -0400
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF93396A1;
        Sun,  3 Apr 2022 07:20:38 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id n19-20020a9d7113000000b005cd9cff76c3so5577360otj.1;
        Sun, 03 Apr 2022 07:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=IhdvutP6+1VN96Sw+l5rljGDZzsDxpR3h7q1f/N7UZo=;
        b=ifeO/0nr8m0s/2shOX7IKX9aVXd9LriBiEeK8vAvxvajBL2YfxBGMPaGG9TnLH++Lh
         a3eSo1M+FpOfH52OT5Xhg4Hq5TK/De3JoUwl2UVFClqwSae3y7twKwFwy7BQ9uTJLFPq
         PeS7RvKArYT6euY3wovGMLfXtXMP+DjxDXZ3ukIo2iIuCInJnYSMDUzs4UXEXe9/lTky
         ZIqsUL3n36OB/qAqNLGnCKFLJes0+w8bubK32p28pHCWdoAfmPC/jWy4KK7aO7LPNLOP
         K+dwfR3ExaMVLQ63JWw5pnMtM2MvLzmyLflRuXqfr38aO8fk9MPvv5URaVpX2aVDIzVD
         k1FA==
X-Gm-Message-State: AOAM531sLtIZHVpY1R9J+C1hVPBL8XvfYVwBUBSMLWMVxOCY+EAOLdZu
        VTns3u/sgGr9nRotFVhZ/w==
X-Google-Smtp-Source: ABdhPJwL6nKTkad4e13KB87xfRjBKcTmMkYqLyj+VlysWvRbdX14GGrw5+09grM+gkgg3WSF68Touw==
X-Received: by 2002:a05:6830:34a1:b0:5c4:3dca:b666 with SMTP id c33-20020a05683034a100b005c43dcab666mr10640719otu.328.1648995637852;
        Sun, 03 Apr 2022 07:20:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 190-20020a4a0dc7000000b003244ae0bbd5sm3032383oob.7.2022.04.03.07.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 07:20:37 -0700 (PDT)
Received: (nullmailer pid 3013370 invoked by uid 1000);
        Sun, 03 Apr 2022 14:20:36 -0000
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-spi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20220402184011.132465-8-krzysztof.kozlowski@linaro.org>
References: <20220402184011.132465-1-krzysztof.kozlowski@linaro.org> <20220402184011.132465-8-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 7/9] dt-bindings: serial: qcom,msm-uartdm: convert to dtschema
Date:   Sun, 03 Apr 2022 09:20:36 -0500
Message-Id: <1648995636.595500.3013369.nullmailer@robh.at.kernel.org>
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

On Sat, 02 Apr 2022 20:40:09 +0200, Krzysztof Kozlowski wrote:
> Convert the Qualcomm MSM Serial UARTDM bindings to DT Schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/serial/qcom,msm-uartdm.txt       |  81 -------------
>  .../bindings/serial/qcom,msm-uartdm.yaml      | 112 ++++++++++++++++++
>  2 files changed, 112 insertions(+), 81 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt
>  create mode 100644 Documentation/devicetree/bindings/serial/qcom,msm-uartdm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.example.dt.yaml: serial@f991e000: dma-names:0: 'tx' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.example.dt.yaml: serial@f991e000: dma-names:1: 'rx' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.yaml

doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt references a file that doesn't exist: Documentation/devicetree/bindings/spi/qcom,spi-qup.txt
Warning: Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt references a file that doesn't exist: Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt
Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt: Documentation/devicetree/bindings/spi/qcom,spi-qup.txt
Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt: Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

