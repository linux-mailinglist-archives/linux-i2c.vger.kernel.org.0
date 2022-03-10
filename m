Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD3E4D554E
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Mar 2022 00:27:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344685AbiCJX1Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Mar 2022 18:27:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344681AbiCJX1Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Mar 2022 18:27:25 -0500
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D241965EF;
        Thu, 10 Mar 2022 15:26:24 -0800 (PST)
Received: by mail-ot1-f51.google.com with SMTP id k9-20020a056830242900b005ad25f8ebfdso5141773ots.7;
        Thu, 10 Mar 2022 15:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+s6KNXZdiBvTEP75VpeCRS663HA+85mBzyoPKeJTnv0=;
        b=0JGni/yEt967rRpgUcW0agVy3qJgsjMXqFNAd0Gkk324bLFDgk+/PDbT84e+r1qDfD
         6z4rOMLqn/VHhJ8q50tA3X6F1aqlNpKK4DBalZhcSoGIUqbN1BCqX7kRR703ETbZXeWV
         mlOrrupQyO1EvbhczD2fgo/GmRpmxndPuSxn/d9jmFYtKfkIUp48l6Gvxm8SaDmNPRMH
         w/A+QFYR5CXVPmP/X3nSmWbRLCLaa3fgqZ53mujyW1rUwQaG0ir+s8MqVOQv2XBvWVxj
         1JNNBzSoY7fqkghO2DcH5t/5bDB9SRb3m0b701OovjLnvNsG4/DHMtw+S/5a4xobFbTS
         FyyQ==
X-Gm-Message-State: AOAM531QXlX3c2d6BV+X2g70dDrURYI1GMwEN+/mLkHwWIM62X0CM2nP
        ubiaoC+WJKDFzRhrLjBZeqdNpZxo9w==
X-Google-Smtp-Source: ABdhPJwiy3Bz5xnm5Cc/M5DrPqDSk2qmnkJz0zxcYzDXDIp5Nwgi2PuYMikQ6z/OHYX8BoEAwRLLFQ==
X-Received: by 2002:a9d:19ca:0:b0:5b2:6128:d4ec with SMTP id k68-20020a9d19ca000000b005b26128d4ecmr3662273otk.201.1646954781979;
        Thu, 10 Mar 2022 15:26:21 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g6-20020a056870a24600b000da0df8b3cesm2794727oai.20.2022.03.10.15.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 15:26:21 -0800 (PST)
Received: (nullmailer pid 2293927 invoked by uid 1000);
        Thu, 10 Mar 2022 23:26:19 -0000
Date:   Thu, 10 Mar 2022 17:26:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sergiu Moga <sergiu.moga@microchip.com>
Cc:     krzysztof.kozlowski@canonical.com, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
        nicolas.ferre@microchip.com, robh+dt@kernel.org,
        claudiu.beznea@microchip.com
Subject: Re: [PATCH v2 2/3] dt-bindings: i2c: convert i2c-at91 to json-schema
Message-ID: <YiqJG369C521YS7a@robh.at.kernel.org>
References: <20220310114553.184763-1-sergiu.moga@microchip.com>
 <20220310114553.184763-3-sergiu.moga@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310114553.184763-3-sergiu.moga@microchip.com>
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

On Thu, 10 Mar 2022 13:45:52 +0200, Sergiu Moga wrote:
> Convert I2C binding for Atmel/Microchip SoCs to Device Tree Schema
> format.
> 
> Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
> ---
>  .../bindings/i2c/atmel,at91sam-i2c.yaml       | 140 ++++++++++++++++++
>  .../devicetree/bindings/i2c/i2c-at91.txt      |  82 ----------
>  2 files changed, 140 insertions(+), 82 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-at91.txt
> 

Applied, thanks!
