Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61EF55894D3
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Aug 2022 01:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237676AbiHCX3p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Aug 2022 19:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbiHCX3o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Aug 2022 19:29:44 -0400
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4392B606;
        Wed,  3 Aug 2022 16:29:43 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id i84so1468438ioa.6;
        Wed, 03 Aug 2022 16:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=sdo65sIiJ/1e4LTGR8d4rY9CIwQ/LQr23+diMXKcltg=;
        b=sh8yRgXbaU1McnxFiT3XZSE6yTRU0LVINRfLfdg+jmJeebEla4InhzJ1NPSEt4g+TL
         +SArWrdc70LNXUokjr8AHDbZnGKt1RD8ZsUKGW9Wu3brGZ3cvV3bAugfrK2BR/1jWv3A
         u+g0COQaxCeavYQI4RbZwgj7CdR/qOKwk2d4JkXEFJIq4gs+EMtN8u6kgn7GLwIltvYB
         ZcjjTX7BS+Tz/d6nvXX+Zvi+vqs38cSG2sIEV3cpq0lWZ6B++O05/nyhli59Z2nKMEIe
         59jCFZ+PY3AeaFmXtqq/nkFfjVF9TreZY+pADQgIvew3ei4Jvpzw4Qf6Ssfa2VehsjZG
         3NKQ==
X-Gm-Message-State: AJIora/1RlKQTXSh39x6YK5l4UM/WQuMnfKPa5F/NMOdkoH0H/mZveFz
        0a6i+wBVzfA2mwNT72WCiA==
X-Google-Smtp-Source: AGRyM1sFvLFTGq9eSistBVGf0FU9EbMxueHo6TwUz7AZ8/kMHkoYCXuXqd9eF6s1NOWh7AFPU7QAdQ==
X-Received: by 2002:a05:6638:16cf:b0:341:4543:b354 with SMTP id g15-20020a05663816cf00b003414543b354mr12103411jat.114.1659569383002;
        Wed, 03 Aug 2022 16:29:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id j4-20020a026304000000b00341d7c43ed5sm8105880jac.73.2022.08.03.16.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 16:29:42 -0700 (PDT)
Received: (nullmailer pid 2813125 invoked by uid 1000);
        Wed, 03 Aug 2022 23:29:40 -0000
Date:   Wed, 3 Aug 2022 17:29:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-i2c@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH 5/5] dt-bindings: i2c: qcom,i2c-cci: convert to dtschema
Message-ID: <20220803232940.GA2813072-robh@kernel.org>
References: <20220802153947.44457-1-krzysztof.kozlowski@linaro.org>
 <20220802153947.44457-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802153947.44457-6-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 02 Aug 2022 17:39:47 +0200, Krzysztof Kozlowski wrote:
> Convert the Qualcomm Camera Control Interface (CCI) I2C controller to DT
> schema.  The original bindings were not complete, so this includes
> changes:
> 1. Add address/size-cells.
> 2. Describe the clocks per variant.
> 3. Use more descriptive example based on sdm845.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/i2c/i2c-qcom-cci.txt  |  96 -------
>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 242 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 243 insertions(+), 97 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
