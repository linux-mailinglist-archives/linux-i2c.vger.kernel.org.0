Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B90160B37B
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 19:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235238AbiJXRH0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 13:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233893AbiJXRHJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 13:07:09 -0400
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45852D4A3D;
        Mon, 24 Oct 2022 08:41:50 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id i127so11420106ybc.11;
        Mon, 24 Oct 2022 08:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qVg+okVBVsVNqz1/oTqCye1j7oYLVkbnznHF/a3NqAY=;
        b=5xCgqx5WQQWXYUZHUGbJvoyxaErx/ZXYtkV0+unq/iuGq2mfuzaOgT/y7u8no0dpuc
         t1zlmiJyH+DAoKbmUaH4YC5/lT8zKupSg8vz+LJj248PZyqMkB+e78A3N2Kd5nQiBqSG
         jcXChDAcwLc3V8vLrk6zlbluTMKAw5pRbAKPOIl6A6gzEusLaj8POiSFFxhnbvpS9HHp
         HeEtYBSFHstLYh0OEB/LGjYN6Z7xy666HMlo+1xc2M5tqZOKB8rXALKI6axNuXV6L3su
         SoOHFleWAZm/lieEpaXob2K/gODQNYNMpnnLG+HeGNuzUFbxvdY1fYUqn1goCrG4CoNP
         Z6/g==
X-Gm-Message-State: ACrzQf0gc+mOXSGvMUeW5OBxGyM0JCkBFJ7m4BPXHkjq8FPyx8RfFyNS
        JFEFeJ7TO2ZwB+KGke5FtyqzRurczg==
X-Google-Smtp-Source: AMsMyM4AQUZXFNB/vdlLThjKII2zhkC/sXhO+TloBWEatc44pTvPltXHFlhLlkEuJZKFRaMFbLyLtA==
X-Received: by 2002:a05:6830:4120:b0:661:d839:cc63 with SMTP id w32-20020a056830412000b00661d839cc63mr16898634ott.51.1666618203612;
        Mon, 24 Oct 2022 06:30:03 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j31-20020a056870051f00b0012c21a64a76sm14191930oao.24.2022.10.24.06.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 06:30:03 -0700 (PDT)
Received: (nullmailer pid 1686092 invoked by uid 1000);
        Mon, 24 Oct 2022 13:30:04 -0000
From:   Rob Herring <robh@kernel.org>
To:     Wayne Chang <waynec@nvidia.com>
Cc:     jonathanh@nvidia.com, linux-phy@lists.infradead.org,
        robh+dt@kernel.org, gregkh@linuxfoundation.org, kishon@ti.com,
        vkoul@kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, mathias.nyman@intel.com,
        heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
        thierry.reding@gmail.com, devicetree@vger.kernel.org,
        treding@nvidia.com, krzysztof.kozlowski+dt@linaro.org,
        balbi@kernel.org, ajayg@nvidia.com, jckuo@nvidia.com,
        p.zabel@pengutronix.de
In-Reply-To: <20221024074128.1113554-3-waynec@nvidia.com>
References: <20221024074128.1113554-1-waynec@nvidia.com> <20221024074128.1113554-3-waynec@nvidia.com>
Message-Id: <166661789886.1678573.2345753570567106623.robh@kernel.org>
Subject: Re: [PATCH 02/11] dt-bindings: usb: Add NVIDIA Tegra XUSB host controller binding
Date:   Mon, 24 Oct 2022 08:30:04 -0500
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 24 Oct 2022 15:41:19 +0800, Wayne Chang wrote:
> Add device-tree binding documentation for the XUSB host controller present
> on Tegra194 and Tegra234 SoC. This controller supports the USB 3.1
> specification.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
>  .../bindings/usb/nvidia,tegra-xhci.yaml       | 213 ++++++++++++++++++
>  1 file changed, 213 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xhci.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/usb/nvidia,tegra-xhci.example.dts:36.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/usb/nvidia,tegra-xhci.example.dtb] Error 1
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

