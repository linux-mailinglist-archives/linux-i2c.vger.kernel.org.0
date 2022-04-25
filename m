Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3D2250EBCD
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Apr 2022 00:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237573AbiDYWZC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Apr 2022 18:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343589AbiDYVm2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Apr 2022 17:42:28 -0400
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D290812862D;
        Mon, 25 Apr 2022 14:39:21 -0700 (PDT)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-e93bbb54f9so4804735fac.12;
        Mon, 25 Apr 2022 14:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M3R043itbLpaOlNutqBsUrB9rfl8TA7O8rvFQFaCgW0=;
        b=YGomX+gDZsUz0aV8H2oeclZGUzW+LXBRKYEPDf2G6d+g5Yb0l80UyvFwyxXiwm3zcd
         UP1YPzR2etRXQk4IUaavZewVmZtSUzNpC0av8wbe38dlb2CabyXh1AK7f22XQtqaGHHg
         kn+Rh9/+hIFLeX0zQXdjScuqOEJPCUEcOM13PDBRXuCxXws4L+fbJALV8lrxZyeUMk0b
         fOndJUX2w6yd1sWQvNMrU/RmNG1MAVoO/kCYfqqDW6ZIKDN8o1Qwm/tg6xvaNxDb+H+R
         wswI3bcci6unQC/eM5syQZwE35NDEtwjULPVLdA4arX1UWfM/Nkjs1XTfQ4hbgEgVIzd
         nHOg==
X-Gm-Message-State: AOAM5328xGLSzYmcMJVx29GcfaFAKznoQe1V/xjqLDoMzbRwjfDtIj6p
        FBNhcnUsAbf98WUktno+jw==
X-Google-Smtp-Source: ABdhPJx95JVH34JzFNbcrxkClorcgvSIy6VQetgVvlAGfeInSVtMGuS9SDe47ls3sAPTDW45mGk2tA==
X-Received: by 2002:a05:6870:618e:b0:e5:c2f3:e009 with SMTP id a14-20020a056870618e00b000e5c2f3e009mr8008861oah.10.1650922761186;
        Mon, 25 Apr 2022 14:39:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r8-20020a05683001c800b006059d4bc39dsm2893087ota.6.2022.04.25.14.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 14:39:20 -0700 (PDT)
Received: (nullmailer pid 334467 invoked by uid 1000);
        Mon, 25 Apr 2022 21:39:19 -0000
Date:   Mon, 25 Apr 2022 16:39:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Corey Minyard <minyard@acm.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-i2c@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        Open Source Submission <patches@amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        linux-arm-kernel@lists.infradead.org,
        Phong Vo <phong@os.amperecomputing.com>,
        openipmi-developer@lists.sourceforge.net
Subject: Re: [PATCH v7 2/3] bindings: ipmi: Add binding for SSIF BMC driver
Message-ID: <YmcVB/9lB6xkw4d2@robh.at.kernel.org>
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-3-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422040803.2524940-3-quan@os.amperecomputing.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 22 Apr 2022 11:08:02 +0700, Quan Nguyen wrote:
> Add device tree binding document for the SSIF BMC driver.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v7:
>   + Change compatible string from "ampere,ssif-bmc" to "ssif-bmc"  [Jae]
> 
> v6:
>   + None
> 
> v5:
>   + None
> 
> v4:
>   + Fix warning with dt_binding_check [Rob]
>   + Change aspeed-ssif-bmc.yaml to ssif-bmc.yaml [Quan]
> 
> v3:
>   + Switched to use DT schema format [Rob]
> 
> v2:
>   + None
> 
>  .../devicetree/bindings/ipmi/ssif-bmc.yaml    | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
