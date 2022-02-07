Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC4D14AC967
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 20:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238094AbiBGTYS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 14:24:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238286AbiBGTSt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 14:18:49 -0500
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EDEBC0401DA;
        Mon,  7 Feb 2022 11:18:49 -0800 (PST)
Received: by mail-oo1-f50.google.com with SMTP id w5-20020a4a9785000000b0030956914befso14850496ooi.9;
        Mon, 07 Feb 2022 11:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Oi2kawlC4oTchPx3SrKG6H/+C9rTjQ5ALT7bD0kBsbM=;
        b=IOTn6/dSrBVkIMLAN09WuDkrWnvOYpwd+c+bOOqH4eh43iGsETPMnjN9ZHeoRMzOZi
         rzgPkOr1LVAJJqN+d9vZi6WRqkHq3o+JpvgbDWCcixAk/hLJTMsed3uajQXoi61F40yx
         pZvDE/IPf+wmjMSLJ8zJ120bNL0HJzlugJXImEHuY06QyE71vSHKtdk6CbC4hrxBUCGI
         wSdxgoQhycGcp1GjWDZY+neV74iELNSJRpEwm+RbnFWrqq6QQv5+9IvW4ZaP194zjNcR
         IYMoVxx6SFy6MhgFzTpFyUYUCUMt/tWiK4gsNEBOv9qo+8Cma7gcRg29KiF7gpo61JN+
         pUxQ==
X-Gm-Message-State: AOAM532/s4MsmU+C3erDAeOtjsiX+l+rqvOWgjg/R+qNFySwDnlStAOU
        l3MMHGmGXpcXrGOf7dD61hunbbL2gA==
X-Google-Smtp-Source: ABdhPJzBiNPIh1ptFdSeOpWdwMnIEqTUUUtar0nzIrVQLmfyaZJXVUoObXYgq94h6Np8yJjB7Lly4w==
X-Received: by 2002:a05:6871:4192:: with SMTP id lc18mr138702oab.207.1644261528365;
        Mon, 07 Feb 2022 11:18:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m26sm4295846ooa.36.2022.02.07.11.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 11:18:47 -0800 (PST)
Received: (nullmailer pid 738937 invoked by uid 1000);
        Mon, 07 Feb 2022 19:18:46 -0000
Date:   Mon, 7 Feb 2022 13:18:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: i2c: samsung,s3c2410-i2c: convert to
 dtschema
Message-ID: <YgFwlgXnHTIUVeOH@robh.at.kernel.org>
References: <20220131172713.208976-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131172713.208976-1-krzysztof.kozlowski@canonical.com>
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

On Mon, 31 Jan 2022 18:27:13 +0100, Krzysztof Kozlowski wrote:
> Convert the Samsung S3C24xx/S3C64xx/S5PV210/Exynos SoC I2C Controller
> bindings to DT schema format.
> 
> The conversion includes also changes/fixes to the bindings, matching the
> real hardware and existing Linux driver:
> 1. Do not require interrupts on samsung,exynos5-sata-phy-i2c, because
>    there is no such.
> 2. Do not allow gpios on samsung,exynos5-sata-phy-i2c, because they are
>    hard-wired just like for HDMI phy.
> 3. Do not require samsung,i2c-sda-delay and use default of 0.
> 4. Require clock, which was always required but missing in bindings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/i2c/i2c-s3c2410.txt   |  58 -------
>  .../bindings/i2c/samsung,s3c2410-i2c.yaml     | 164 ++++++++++++++++++
>  2 files changed, 164 insertions(+), 58 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-s3c2410.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
> 

Applied, thanks!
