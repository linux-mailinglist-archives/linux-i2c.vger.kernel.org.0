Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9119162606C
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 18:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233876AbiKKRci (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 12:32:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233495AbiKKRch (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 12:32:37 -0500
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EADB1A815;
        Fri, 11 Nov 2022 09:32:36 -0800 (PST)
Received: by mail-oo1-f46.google.com with SMTP id g15-20020a4a894f000000b0047f8e899623so742090ooi.5;
        Fri, 11 Nov 2022 09:32:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=po5PnrsJOrtibdnuIvtZD7NvBSBhlNi4tJ/oxCe6Y54=;
        b=jmxR6IKM9dqcj9G9TrskMylPFv5RloIgAzl+OCCYtSun8kgucvQcU/F6q3xVBrj3KP
         GXcYqaeFZYDsBNDtlXZYbSBefSOJdMtZllCtlriashRiT8MhgdYhhJgkmnwj1d+CooKb
         FELCWilELDlAopGB4emihseZmOmhNL3HojMk0w90b7+BgT359zBiRi01pxLhIGutjCgS
         BTFFlOOQiDcPwYeMeEr/pvbRDZzGgPkXpWic7X01zoKwHFAO0NENJdMcF/G9IjAUai2Y
         v5QcJJetEle+LGgric1evzJsPqKe34zgzNXDGWRqsqjFVY3JfUxkwGKsva0A6GTEnSRl
         A6Jg==
X-Gm-Message-State: ANoB5pmcE1RgqcE7b2Ic3DueyyuLoiNloxnZSPm3UVWWBP8DdQmX1qDu
        SkCQKZ4ergOH3EE5XmxLaw==
X-Google-Smtp-Source: AA0mqf4Z94tBfrdLD8Dbj2VxNYqWTWzdRAPZ/PPQAwiuJKHfq3mYjcMCQnCCnCuCCJIqaSvKoTgpGg==
X-Received: by 2002:a4a:a78b:0:b0:498:260c:d780 with SMTP id l11-20020a4aa78b000000b00498260cd780mr1380739oom.27.1668187955744;
        Fri, 11 Nov 2022 09:32:35 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i2-20020a4ac502000000b00480816a5b8csm999120ooq.18.2022.11.11.09.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 09:32:35 -0800 (PST)
Received: (nullmailer pid 3566720 invoked by uid 1000);
        Fri, 11 Nov 2022 17:32:36 -0000
Date:   Fri, 11 Nov 2022 11:32:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Wayne Chang <waynec@nvidia.com>, mathias.nyman@intel.com,
        p.zabel@pengutronix.de, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-tegra@vger.kernel.org,
        singhanc@nvidia.com, balbi@kernel.org,
        linux-phy@lists.infradead.org, vkoul@kernel.org,
        thierry.reding@gmail.com, ajayg@nvidia.com,
        heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
        treding@nvidia.com, jckuo@nvidia.com, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 02/13] dt-bindings: usb: Add NVIDIA Tegra234 XUSB host
 controller binding
Message-ID: <20221111173236.GA3561612-robh@kernel.org>
References: <20221111101509.999589-1-waynec@nvidia.com>
 <20221111101509.999589-3-waynec@nvidia.com>
 <166817308790.3060162.14990231448404857914.robh@kernel.org>
 <5782d31a-9a0c-33da-ff84-20cae29f977e@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5782d31a-9a0c-33da-ff84-20cae29f977e@nvidia.com>
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

On Fri, Nov 11, 2022 at 02:38:21PM +0000, Jon Hunter wrote:
> 
> On 11/11/2022 13:30, Rob Herring wrote:
> > 
> > On Fri, 11 Nov 2022 18:14:58 +0800, Wayne Chang wrote:
> > > Add device-tree binding documentation for the XUSB host controller present
> > > on Tegra234 SoC. This controller supports the USB 3.1 specification.
> > > 
> > > Signed-off-by: Wayne Chang <waynec@nvidia.com>
> > > ---
> > > V1 -> V2: new change for adding nvidia,tegra234-xusb.yaml
> > >   .../bindings/usb/nvidia,tegra234-xusb.yaml    | 159 ++++++++++++++++++
> > >   1 file changed, 159 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> > > 
> > 
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Error: Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.example.dts:36.27-28 syntax error
> > FATAL ERROR: Unable to parse input tree
> > make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.example.dtb] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [Makefile:1492: dt_binding_check] Error 2
> 
> This compiles fine on top of -next. We are just missing the change that
> populates the required definitions.

Where exactly is that mentioned in the commit msg?

No maintainer can take patches which apply against linux-next, so not a 
good dependency to mention either.

Rob
