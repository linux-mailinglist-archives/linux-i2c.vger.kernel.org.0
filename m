Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF6FD4F1E1E
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Apr 2022 00:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240429AbiDDVyo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Apr 2022 17:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386607AbiDDVjB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Apr 2022 17:39:01 -0400
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1378836B4B;
        Mon,  4 Apr 2022 14:30:14 -0700 (PDT)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-deb9295679so12305934fac.6;
        Mon, 04 Apr 2022 14:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qO84CfyeG8iQGLXkEG50rgeD59wqZwaLgIBh/t/ojMg=;
        b=HsmJIsf61LqqCsikAYhyggZusCW9413QaQsJybN0D5n2szIq4UAcUtH4gplqM7Uu1P
         59vAP+nI5RlE8fmgKNy43gzbgEFB2c5F2U4ozRRLJV2J+W4gYTSooGxz3mrRI0ya8gPE
         oanIChNbMno+8+ixxh7Tk3qQPFhuEZqU3l6UqXnJJukKyTD1B/Vf7NtUDiyPQLcFVAV0
         97aoRC49qCQUJc4HQqDe3GygpXtMZ4mqzNOE5TBVHdEvX5ix37vPjos0EntxncnL+vMF
         MnMpqYNGAHox8UXkHiHytuicNxRKXbNwLwvpH6Xe0OJf9HBXMzmcay4PH2B9T+adC6qH
         1oBQ==
X-Gm-Message-State: AOAM531GxnWuRbas+HsHf7U4+QVVaysAcu5B6d968SND06edoUNGNqsA
        C4D1JqeQC7FYRtIX5+nobKpNHaOC3w==
X-Google-Smtp-Source: ABdhPJz7wTyN+ISEFmrLxVwpC8vLauUt6p+w3JsBQDP0IZwbVZUQL9Jq3oj+UEBZux7/f3TlPP5uqQ==
X-Received: by 2002:a05:6870:8327:b0:d7:8685:5129 with SMTP id p39-20020a056870832700b000d786855129mr92203oae.75.1649107761930;
        Mon, 04 Apr 2022 14:29:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id fz16-20020a056870ed9000b000dde87bcdfdsm4587637oab.53.2022.04.04.14.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 14:29:21 -0700 (PDT)
Received: (nullmailer pid 2016194 invoked by uid 1000);
        Mon, 04 Apr 2022 21:29:20 -0000
Date:   Mon, 4 Apr 2022 16:29:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-serial@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 6/9] spi: dt-bindings: qcom,spi-qup: convert to
 dtschema
Message-ID: <YktjMPY6/DCrJ9mv@robh.at.kernel.org>
References: <20220402184011.132465-1-krzysztof.kozlowski@linaro.org>
 <20220402184011.132465-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220402184011.132465-7-krzysztof.kozlowski@linaro.org>
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

On Sat, 02 Apr 2022 20:40:08 +0200, Krzysztof Kozlowski wrote:
> Convert the Qualcomm Universal Peripheral (QUP) Serial Peripheral
> Interface (SPI) bindings to DT Schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
> ---
>  .../devicetree/bindings/spi/qcom,spi-qup.txt  | 103 ------------------
>  .../devicetree/bindings/spi/qcom,spi-qup.yaml |  81 ++++++++++++++
>  2 files changed, 81 insertions(+), 103 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qup.txt
>  create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qup.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
