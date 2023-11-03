Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96BFF7E003B
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Nov 2023 11:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjKCKV2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Nov 2023 06:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbjKCKV1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Nov 2023 06:21:27 -0400
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6416DD7;
        Fri,  3 Nov 2023 03:21:21 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3b2ea7cc821so1151539b6e.1;
        Fri, 03 Nov 2023 03:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699006880; x=1699611680;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LTK0kHcHXKMRZq1fvvgaafZQnou0Z3OBHj53xDl18ng=;
        b=krDEccaDbi8+KyNYPJSB9o/DVnlanAGiJ+TMq3mKErSAx/8HKbtyFSRiswcCYOqm0w
         twX2D4Je3U3fA+WnIldVeJta57lbsn8rd040pS3xxTj+dFJohTCfJYpYhVmJVmMOOsi8
         xbOeGvdRnD/E4VHc9udSEmD30YeJ+zSC05WYwYibxtrN9Q+Xo3nEQz19R6UYM6XRLG/g
         gRydDOL8CMBWEgt46H8rIyBLP+lb5sbq733M8YznjwNDyeiNBSB9JCVeqkw7lPE7d7mQ
         V7y2DnBWT2mbzG3ngN/+UGdhuSIfpKBL07FGaxMBrEByXKiYOiJGRPUXQQlJipq3cR8p
         UaIA==
X-Gm-Message-State: AOJu0YyB1kTta9uVRqikz4tzKlFW8wclZzSl4mZOQdNpZbDvFgoiEgeX
        ptTTPoQgbGeCU+FEILtcpQ==
X-Google-Smtp-Source: AGHT+IHoi5Ah7YtWDdBl+iV5e4j5JCiHEOTBVVHtU82pAReNiVxK6n+DZFFTwx3DoOB3eowJfeBlBg==
X-Received: by 2002:aca:1204:0:b0:3b2:ecab:900e with SMTP id 4-20020aca1204000000b003b2ecab900emr20799399ois.15.1699006880535;
        Fri, 03 Nov 2023 03:21:20 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u21-20020a056808115500b003af60f06629sm229573oiu.6.2023.11.03.03.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 03:21:19 -0700 (PDT)
Received: (nullmailer pid 488800 invoked by uid 1000);
        Fri, 03 Nov 2023 10:21:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>
Cc:     Baolin Wang <baolin.wang@linux.alibaba.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        huangzheng lai <laihuangzheng@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Xiongpeng Wu <xiongpeng.wu@unisoc.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>
In-Reply-To: <20231103091653.4591-1-Huangzheng.Lai@unisoc.com>
References: <20231103091653.4591-1-Huangzheng.Lai@unisoc.com>
Message-Id: <169900687819.488783.15775505208515245193.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: i2c: Add yaml for Spreadtrum I2C
 controller
Date:   Fri, 03 Nov 2023 05:21:18 -0500
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Fri, 03 Nov 2023 17:16:53 +0800, Huangzheng Lai wrote:
> Add a yaml file to replace the txt file. Due to the recent addition
> of the 'reset' framework to the Spreadtrum I2C driver to reset the
> controller, information related to the 'reset' attribute has been
> added to the bindings file.
> 
> Change in V2
> -Rename 'i2c-sprd.txt' to 'sprd,sc9860-i2c.yaml'.
> -Add ref to i2c-controller.
> -Drop items in 'compatible'.
> -Add describe for 'reg' items.
> -Drop 'clocks' description and just maxItems: 3.
> -Fix typo in 'clo-frequency': Contains.
> -Add explanation in commit message explaining why 'resets' be added.
> -Drop '#size-cells' and 'address-cells' in properties and required.
> -Drop description of 'resets'.
> -Add child node in examples.
> 
> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
> ---
>  .../devicetree/bindings/i2c/i2c-sprd.txt      | 31 --------
>  .../bindings/i2c/sprd,sc9860-i2c.yaml         | 75 +++++++++++++++++++
>  2 files changed, 75 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-sprd.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/sprd,sc9860-i2c.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/sprd,sc9860-i2c.example.dtb: i2c@2240000: '#address-cells', '#size-cells', 'charger@63' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/i2c/sprd,sc9860-i2c.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231103091653.4591-1-Huangzheng.Lai@unisoc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

