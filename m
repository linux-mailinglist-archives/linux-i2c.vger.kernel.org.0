Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 344265ABA07
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Sep 2022 23:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbiIBVaE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Sep 2022 17:30:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbiIBVaC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Sep 2022 17:30:02 -0400
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F825A15C;
        Fri,  2 Sep 2022 14:30:02 -0700 (PDT)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-11eb44f520dso7852175fac.10;
        Fri, 02 Sep 2022 14:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=gOAzsL9bsAt7jlkpt+vaf6xyvNBMEcyrbnj+YjtEFYc=;
        b=5fDAY4x2dMqzPEgQUedR8J7stknjQuZ70tT/QFejKOgrcfOCeiWTTaGNVc19filzOq
         ctpYMN8D5bXF8/zBD6aEsr9d5PGJ+vyQzGNsOKxpDLN6++FvlMX1NJdvrpTX4QVMCt8T
         Sw+J3GRV85TU9H6ornGH/WqREHzhUsKJ4LX6yw6hTVzwM1rHa//YhQ1ockzkxX0LO/nA
         sS7GMLAKs+aweWxHm+Uwbes4snTgN74xzvQAWzZgZ1dtMj3o32uEzZJrGSSeGwxz8rOf
         g3zgwpDzikUfx+l5KEELPH4kY/cBRK22XyzfnunyGfsxmD4CM3vNSACPtatsXzAxKkWT
         VZkQ==
X-Gm-Message-State: ACgBeo2ti5+ghXwAoYZhEkSekCRsrP9FnFQ8DRP5vewHwBIAPPZ7HG80
        JU7kTePiA1oNzH6OwhFq/A==
X-Google-Smtp-Source: AA6agR5FyIT3medZqlb0ztfVLiAWmg0Ir31ztuO4VBzvFV7cYnSkWqB9g9H+Fvmqw+fsq/JV6Chk/Q==
X-Received: by 2002:a05:6870:b3aa:b0:11f:5995:8e2e with SMTP id w42-20020a056870b3aa00b0011f59958e2emr3398439oap.204.1662154201303;
        Fri, 02 Sep 2022 14:30:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r33-20020a05687108a100b0011e37fb5493sm1684953oaq.30.2022.09.02.14.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 14:30:00 -0700 (PDT)
Received: (nullmailer pid 447636 invoked by uid 1000);
        Fri, 02 Sep 2022 21:29:59 -0000
Date:   Fri, 2 Sep 2022 16:29:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-i2c@vger.kernel.org,
        Robert Foss <robert.foss@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH] dt-bindings: i2c: qcom,i2c-cci: specify SM8450 CCI clocks
Message-ID: <20220902212959.GA447603-robh@kernel.org>
References: <20220901074218.21108-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901074218.21108-1-krzysztof.kozlowski@linaro.org>
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

On Thu, 01 Sep 2022 10:42:18 +0300, Krzysztof Kozlowski wrote:
> Document clocks for SM8450 Camera Control Interface I2C controller.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Based on:
> 1. https://lore.kernel.org/all/20220901073504.3077363-1-vladimir.zapolskiy@linaro.org/
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
