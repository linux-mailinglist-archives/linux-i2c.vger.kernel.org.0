Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4D4F4F05DA
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Apr 2022 21:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236151AbiDBTgu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Apr 2022 15:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbiDBTgt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Apr 2022 15:36:49 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8ACC5594;
        Sat,  2 Apr 2022 12:34:57 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id p8so5457208pfh.8;
        Sat, 02 Apr 2022 12:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=013L1S5NasV2n9G+gcZ5vDiuVC6AUnzPa8ca+juX9NA=;
        b=OyuchNJKTM3kf8o74NLy6CYnAK4iJ9pZz9uFHe5MiPeTt/sn5juX12/x+KuyPx/bDr
         t9lmubfH4yfFZa3/qJr50KtoHtjpBYsbR8HR+u3bRPCDhl0KE6QNlDjh8U+v7dWzP6yY
         hl5HBzUgWV/2cKqeqBHt12PpeL55KW2jABhAjgfbD3hAgoei4KHuvmi+rtag4CXXRZog
         bOMvsmgL7yO+gHJ5MddUG9yI8LhgdbES0cGdeEp/eSa2LkdulRwEX5/2zNEGKI6fqiPG
         wvC5GTWiFz40FzlZ6V3dQjLh4QdwWnBUVEqRTzK8MYS+UM5rFTsfEhd5T1ZTHqJh+z+j
         OByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=013L1S5NasV2n9G+gcZ5vDiuVC6AUnzPa8ca+juX9NA=;
        b=BTIHZsqA9nbHurKtczCiY9uo+L90q6mInQOTaHpB+ESAReYLqcPsioF50ak/lPwGZW
         TlhINF6/t+wffnm32FDzxOYvOixQQ1gznXRhvrGLEQBrGrI/L0KpiFhK0i5WUmI6f3pt
         6pHX+dPcUhangaKwOWU6A1JInMuVS7tsctUcBfcvyko2kTaao//g2cuRynWuKtNhxcsw
         SVjXYN+sNamWPGpM5NHs9wipQwzrCCovDSNegEgCAc76O2bmpV7oXKdmpSadXPiwNWlB
         l5RebB3SGAManZkWIr9lfHMh10uOUutjt15Fm+Y8xlYaU7VGFP0LHxPgHuIqL0x/G5fY
         2y1g==
X-Gm-Message-State: AOAM533LrniAyyq5wYsH/zv60OBjs7Ak4PlNd0uHyTb+g0s3SdDsEF2/
        JleZtXVPgSuOi+1DDd4qCCp+bwPgUA8=
X-Google-Smtp-Source: ABdhPJw4CbbZW9c/Ju1yu5pk5Dk4iAgMrh57D88CxdNkJyCODeTAB44jPG27DJH48jNOPVtVyRVwdA==
X-Received: by 2002:a63:79c4:0:b0:386:5a8a:e2a5 with SMTP id u187-20020a6379c4000000b003865a8ae2a5mr19744665pgc.458.1648928097301;
        Sat, 02 Apr 2022 12:34:57 -0700 (PDT)
Received: from 9a2d8922b8f1 ([122.161.51.18])
        by smtp.gmail.com with ESMTPSA id o14-20020a056a0015ce00b004fab49cd65csm6871745pfu.205.2022.04.02.12.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 12:34:56 -0700 (PDT)
Date:   Sun, 3 Apr 2022 01:04:51 +0530
From:   Kuldeep Singh <singh.kuldeep87k@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: i2c: Add Qualcomm Geni based QUP i2c
 bindings
Message-ID: <20220402193451.GD35664@9a2d8922b8f1>
References: <20220402051206.6115-1-singh.kuldeep87k@gmail.com>
 <20220402051206.6115-2-singh.kuldeep87k@gmail.com>
 <dcca767e-2ad6-4d81-d273-3878b07bbc8c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcca767e-2ad6-4d81-d273-3878b07bbc8c@linaro.org>
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Apr 02, 2022 at 08:24:25PM +0200, Krzysztof Kozlowski wrote:
> On 02/04/2022 07:12, Kuldeep Singh wrote:
> > GENI(generic interface) based Qualcomm Universal Peripheral controller
> > can support multiple serial interfaces like spi,uart and i2c.
> > 
> 
> Few more comments.
> 
> (...)
> 
> > +
> > +  clock-frequency:
> > +    description: Desired I2C bus clock frequency in Hz
> 
> Skip description, it's common for I2C controllers.

ok.

> 
> > +    default: 100000
> > +
> > +  interconnects:
> > +    maxItems: 3
> > +
> > +  interconnect-names:
> > +    items:
> > +      - const: qup-core
> > +      - const: qup-config
> > +      - const: qup-memory
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  required-opps:
> > +    maxItems: 1
> > +
> > +  dmas:
> > +    maxItems: 2
> > +
> > +  dma-names:
> > +    items:
> > +      - const: tx
> > +      - const: rx
> > +
> > +  pinctrl-0: true
> > +  pinctrl-1: true
> > +
> > +  pinctrl-names:
> > +    minItems: 1
> > +    items:
> > +      - const: default
> > +      - const: sleep
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> 
> These are not needed, they come from schema.

Yes. I will update in v2. Thanks!

-Kuldeep
