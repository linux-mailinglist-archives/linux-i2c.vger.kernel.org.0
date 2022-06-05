Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2C9F53DC24
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Jun 2022 16:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240353AbiFEOHu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jun 2022 10:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232620AbiFEOHt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jun 2022 10:07:49 -0400
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E86F711C20;
        Sun,  5 Jun 2022 07:07:48 -0700 (PDT)
Received: by mail-oi1-f174.google.com with SMTP id l81so1132829oif.9;
        Sun, 05 Jun 2022 07:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oJ7ks90HcU/OcpWfL85BQOKA+f8sVJfLNmPUt93F2Rk=;
        b=bbVEdwmCgd+qFk1tN5zoEPtC6unce8upxojBQus0omAEDobpIJqS/ezgVdQKD1m7mH
         Rd4xc0EZIR4GaXctATzIbD8PNuOAu8MCnQOWSzvTdtklXUctN1066ppqcPGXKoS2gNE1
         OSUygg3Teqm5RW++Q6uW0fnJLiijXfSNN2hB6Qm1IAyott27kJ5JUlvrJ9FhNCKXSr5N
         D6KISYYV2J5LFH7xCgYiUTu/ochMYv14qmy6/q0oZSzkfFYpkXkjVpZGOL9D9iV3oZSU
         LwMC4mv3U1PIReWtsc/87s7GtaJJ7KKhllrZEu6JWS7F4/mHHvdhA+E6Wzn4xJ1LG5E2
         iJ6Q==
X-Gm-Message-State: AOAM533QuhYsJgJnaKJurAZNF/wCC2s17Ubn7/27vcyINncJQ+JAyL6k
        JJ5egQltOcIAZq61lu2dL/nFFBSjZQ==
X-Google-Smtp-Source: ABdhPJyPTp6ALHoagqZq3P3vIRSTm+NfA4hUpoCAYc5YYjMkWQYj9w/6S9aoRfKe77v9qpgKj4CAHg==
X-Received: by 2002:a05:6808:2010:b0:32b:17fa:a7e9 with SMTP id q16-20020a056808201000b0032b17faa7e9mr11090598oiw.173.1654438068047;
        Sun, 05 Jun 2022 07:07:48 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.0])
        by smtp.gmail.com with ESMTPSA id gz9-20020a056870280900b000e686d1386dsm5601419oab.7.2022.06.05.07.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 07:07:47 -0700 (PDT)
Received: (nullmailer pid 3419293 invoked by uid 1000);
        Sun, 05 Jun 2022 14:07:44 -0000
Date:   Sun, 5 Jun 2022 09:07:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Robert Marko <robimarko@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: qcom,i2c-qup: convert to dtschema
Message-ID: <20220605140744.GA3416078-robh@kernel.org>
References: <20220604164653.79284-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220604164653.79284-1-robimarko@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jun 04, 2022 at 06:46:53PM +0200, Robert Marko wrote:
> Convert DT bindings for Qualcomm QUP I2C controller to DT schema format.
> 
> Old text bindings were missing usage of DMA so that was documented, as
> well as the max clock-frequency.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-qup.txt  | 40 ---------
>  .../devicetree/bindings/i2c/qcom,i2c-qup.yaml | 83 +++++++++++++++++++
>  2 files changed, 83 insertions(+), 40 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml

This one is already done.

Rob
