Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAE9D4FEAC4
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Apr 2022 01:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbiDLXcV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Apr 2022 19:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbiDLXbz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Apr 2022 19:31:55 -0400
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E558B15B98E;
        Tue, 12 Apr 2022 15:27:14 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-df02f7e2c9so210636fac.10;
        Tue, 12 Apr 2022 15:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S/S1o5ASOF7/8+YPA6CC4QojK42QqA6NiYVB93lMJDo=;
        b=oRi4haQUGRGrCQh0wYV3BTazqTC9XUUIzyDmdDu+lbC33wLWEXwwhbfO+OTmtE2RrZ
         PKIpW+KI8mY5P9iwPUlEz4kKk2gGp0Hr61zWNYyG2SjVkJvlYx+x6b90RBAgAR5ukspr
         rwQhkMMf5kbd0QGhX7spm0uUQkwFgwe7Ow9+K1LbRqSQGT7Wl8TK/APP8momOXboN/xL
         YT6Apj+ng06gbfwWVqy27zjgasEmFJycm4jnAPvHJClAChLrIeDadfVHhqJj2Z+vKISL
         E/x0/Z9ocwAl1I3Kizj7o81ue/r04P1TSJ37Zl9MvLN9Wj4wdh/+f1yTZ8aZWEsEXHhl
         CR3Q==
X-Gm-Message-State: AOAM530B2nZK1CmQNY5NPt8pRiNGE7jdO2who1j3mkR+2S+VW50elW/0
        Tnx6UcPczMoz0EuJnVfmY4h7ufi35w==
X-Google-Smtp-Source: ABdhPJyu7Bikhshe6ov3GObcYk/5A9g9nL4qq8yl2XXXI+kqjY71yYo8BHWvINy+xvK8bsm7vZ/l1A==
X-Received: by 2002:a05:6870:1793:b0:de:a69a:118d with SMTP id r19-20020a056870179300b000dea69a118dmr3115029oae.163.1649798562760;
        Tue, 12 Apr 2022 14:22:42 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x24-20020a056870a79800b000e2e53716fbsm2218502oao.31.2022.04.12.14.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 14:22:42 -0700 (PDT)
Received: (nullmailer pid 965665 invoked by uid 1000);
        Tue, 12 Apr 2022 21:22:41 -0000
Date:   Tue, 12 Apr 2022 16:22:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     wsa@kernel.org, kernel@axis.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, krzk+dt@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: add property to avoid device
 detection
Message-ID: <YlXtobiXIyObF/7+@robh.at.kernel.org>
References: <20220412085046.1110127-1-vincent.whitchurch@axis.com>
 <20220412085046.1110127-2-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412085046.1110127-2-vincent.whitchurch@axis.com>
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

On Tue, Apr 12, 2022 at 10:50:45AM +0200, Vincent Whitchurch wrote:
> When drivers with ->detect callbacks are loaded, the I2C core does a
> bunch of transactions to try to probe for these devices, regardless of
> whether they are specified in the devicetree or not.  (This only happens
> on I2C controllers whose drivers enable the I2C_CLASS* flags, but this
> is the case for generic drivers like i2c-gpio.)
> 
> These kinds of transactions are unnecessary on systems where the
> devicetree specifies all the devices on the I2C bus, so add a property
> to indicate that the devicetree description of the hardware is complete
> and thus allow this discovery to be disabled.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
> 
> Notes:
>     v2:
>     - Change subject prefix
>     - Reword description of property
> 
>  Documentation/devicetree/bindings/i2c/i2c.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> index fc3dd7ec0445..960d1d5c9362 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -72,6 +72,10 @@ wants to support one of the below features, it should adapt these bindings.
>  	this information to adapt power management to keep the arbitration awake
>  	all the time, for example. Can not be combined with 'single-master'.
>  
> +- no-detect
> +	states that no other devices are present on this bus other than the
> +	ones listed in the devicetree.

This belongs in the schema instead:

https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml

Rob
