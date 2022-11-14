Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5CE62890B
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Nov 2022 20:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237134AbiKNTQc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Nov 2022 14:16:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237049AbiKNTQX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Nov 2022 14:16:23 -0500
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D77626559;
        Mon, 14 Nov 2022 11:16:22 -0800 (PST)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-13bef14ea06so13609605fac.3;
        Mon, 14 Nov 2022 11:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I4+f1aO3gmprHFq9BhzibsrK6OYsmewgEJsEFY5Pjy0=;
        b=HNLEQDwMR/YL7RM1g9H46ywTjLFuGKBC5ddGquiLWBQwV+kYpnnydDx+ugZlU8v6wb
         kMLdl7e7XBK0/nt8nIRZOjmZtYh2VQqIw2Jz3RP4IOF+bzIhdjlC0wKYL4qbr4Lbo9Vb
         3ZYquaO5SwXIgIEBCrOg+g6wBVNLom6GMq23Dt9auGVE99SUMH03nK7lw/D2UB9T1AJP
         +kl1gzgm6QGVRqzi7IV2MmB+XQeYoRPJRkQC+GpVdiTE2f8pCqhe1X3Su6Y5jA8bsRNi
         dxdg3mk0TssipkwLN93Mdhhqo+X76dGUsFpz/giO8EeKtBsTVaWN0tPF9kCmzDzTGfHJ
         ApaQ==
X-Gm-Message-State: ANoB5pnqufqCX7iEkDCeurfMauR0uYw8JKjDhe5/XzjyDIRjESVXoGp7
        Ubvl+tBVjNMusTZV935tHg==
X-Google-Smtp-Source: AA0mqf6j7s/VG/hdXgynB9cq6S6yLO1RAvuKf3dvEzuWl+k5KgAmesbYjYIGgadz69prHluNbWTfsQ==
X-Received: by 2002:a05:6870:9a98:b0:132:a2bd:428b with SMTP id hp24-20020a0568709a9800b00132a2bd428bmr7782000oab.113.1668453381848;
        Mon, 14 Nov 2022 11:16:21 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id eq23-20020a056870a91700b00132741e966asm5344907oab.51.2022.11.14.11.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 11:16:21 -0800 (PST)
Received: (nullmailer pid 3190194 invoked by uid 1000);
        Mon, 14 Nov 2022 19:16:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Wayne Chang <waynec@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, ajayg@nvidia.com,
        singhanc@nvidia.com, devicetree@vger.kernel.org,
        thierry.reding@gmail.com, treding@nvidia.com,
        linux-tegra@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, robh+dt@kernel.org, jckuo@nvidia.com,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        jonathanh@nvidia.com, vkoul@kernel.org, balbi@kernel.org,
        p.zabel@pengutronix.de, mathias.nyman@intel.com
In-Reply-To: <20221114124053.1873316-3-waynec@nvidia.com>
References: <20221114124053.1873316-1-waynec@nvidia.com>
 <20221114124053.1873316-3-waynec@nvidia.com>
Message-Id: <166845336035.3185553.484885991952704522.robh@kernel.org>
Subject: Re: [PATCH v3 02/13] dt-bindings: usb: Add NVIDIA Tegra234 XUSB host
 controller binding
Date:   Mon, 14 Nov 2022 13:16:23 -0600
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Mon, 14 Nov 2022 20:40:42 +0800, Wayne Chang wrote:
> Add device-tree binding documentation for the XUSB host controller present
> on Tegra234 SoC. This controller supports the USB 3.1 specification.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
> depends on the following change
> https://lore.kernel.org/all/20221003125141.123759-1-jonathanh@nvidia.com/
> V2 -> V3:nothing has changed but added the dependency here
> V1 -> V2:new change for adding nvidia,tegra234-xusb.yaml
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

