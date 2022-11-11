Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE834625B3E
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 14:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234027AbiKKNag (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 08:30:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233989AbiKKNa2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 08:30:28 -0500
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E6D6035E;
        Fri, 11 Nov 2022 05:30:27 -0800 (PST)
Received: by mail-ot1-f49.google.com with SMTP id j25-20020a056830015900b0066ca2cd96daso2781936otp.10;
        Fri, 11 Nov 2022 05:30:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+H4vFKcVhdT5utr9Kqit7Ee08fhFyoKnskQwRap40i4=;
        b=t/njWBcXTa8Dr+fhkIyziRfPcs94khjPZeqZpD/0IwIOarofKfEBKVLV7kW1EBVIGR
         Lu5zJ1tG+soMxGaMzNdDKQLWSFDkQM5lxg2tQ3crX2hEHWIgcl2QySh1k9htjAQeAWXp
         Khv3h3tc0hwkHviXpkOXExXEIKzhWaH8HyTFpFISusGxcRlmTfhzmpHcgRWrPDbrAEMK
         pwaVEn9HMaARs+g3xeYxb6WajXVtm5QmgRhffFpI+L6qbxn34kp82F8UyEDLY8/mae3i
         /r524jTMvqXYh7kMSwnmXBjBD+sKvu1lozc16obcmdgxD8H8NLqmRGSTlt6aHVedmacq
         42/g==
X-Gm-Message-State: ANoB5pnGvFUVgRCQ+ATsmrC/WJyE/foJdaMseSdafI1UWtCbdRWU7Tp3
        /EXn6aGLlYFSYOLd5+0joQ==
X-Google-Smtp-Source: AA0mqf5Qj3/GbhqnO2Nl2v5FMmObS8qqaAWio4R7QoQud1x66XkXmTZ4UJUHtqj+lywkDe6kiB/IQA==
X-Received: by 2002:a05:6830:4122:b0:66c:2b2c:e7aa with SMTP id w34-20020a056830412200b0066c2b2ce7aamr1162463ott.303.1668173426609;
        Fri, 11 Nov 2022 05:30:26 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 124-20020a4a1582000000b0047f72b6988fsm766425oon.45.2022.11.11.05.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 05:30:26 -0800 (PST)
Received: (nullmailer pid 3073768 invoked by uid 1000);
        Fri, 11 Nov 2022 13:30:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Wayne Chang <waynec@nvidia.com>
Cc:     mathias.nyman@intel.com, p.zabel@pengutronix.de,
        jonathanh@nvidia.com, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        linux-tegra@vger.kernel.org, singhanc@nvidia.com, balbi@kernel.org,
        linux-phy@lists.infradead.org, vkoul@kernel.org,
        thierry.reding@gmail.com, ajayg@nvidia.com,
        heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
        treding@nvidia.com, jckuo@nvidia.com, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org
In-Reply-To: <20221111101509.999589-3-waynec@nvidia.com>
References: <20221111101509.999589-1-waynec@nvidia.com>
 <20221111101509.999589-3-waynec@nvidia.com>
Message-Id: <166817308790.3060162.14990231448404857914.robh@kernel.org>
Subject: Re: [PATCH v2 02/13] dt-bindings: usb: Add NVIDIA Tegra234 XUSB host
 controller binding
Date:   Fri, 11 Nov 2022 07:30:24 -0600
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Fri, 11 Nov 2022 18:14:58 +0800, Wayne Chang wrote:
> Add device-tree binding documentation for the XUSB host controller present
> on Tegra234 SoC. This controller supports the USB 3.1 specification.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
> V1 -> V2: new change for adding nvidia,tegra234-xusb.yaml
>  .../bindings/usb/nvidia,tegra234-xusb.yaml    | 159 ++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.example.dts:36.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

