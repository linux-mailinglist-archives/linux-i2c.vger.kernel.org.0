Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9214537499B
	for <lists+linux-i2c@lfdr.de>; Wed,  5 May 2021 22:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhEEUrF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 May 2021 16:47:05 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:46900 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbhEEUrE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 May 2021 16:47:04 -0400
Received: by mail-ot1-f41.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso2911910otb.13;
        Wed, 05 May 2021 13:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=uZEiv6HhKLNAH9Vt/Wy6pfuXYHRwYyJTO0WuIw2tkrw=;
        b=sVA6FMNeIPoqJivSfQtVHFPlSNTXAWW96kr2nkxc+QEmCLT4Lej7FGfX4bC6gzK8fC
         Vm6ACVwGoVvbZ4IYO1RkQ5WsVmJ1/JLHKKKsFdtIOb1TbuzAA7mXa+rs07lij0kIIFRA
         hpWMPEOL2hj5X3v6dhg4xp41mcpuAK844fPkzk8qfi0nPXvBVyrlFvrCQcwaFdzKo2ft
         T51ECE4/VLkKSRSyt6R1uPVcB/b6xVtlfZsLiEeq8Hs57VNDHoIYNb+pA3MN56YxpBg7
         o9eJC/SSeY4ch3qhdDb4PGqY8AtmXLq3lrYcN4qu5yXrBwcyYGgNY7HtagM+3mSNHEhA
         d8cA==
X-Gm-Message-State: AOAM5316dnrf9OlSA5t91oZXDMTR9NktCOaVuTbOWy2hTeYk2QFO8L/I
        nTW7vCqaFI444aAaikmQ5Q==
X-Google-Smtp-Source: ABdhPJwYwQ8Hlr8qqvXdBp8FirB3rHUuf1rsEjTkWzeI3cLmeoa11IrsotcWMA9VweyaQWNxoyU2qg==
X-Received: by 2002:a9d:479a:: with SMTP id b26mr488275otf.180.1620247567209;
        Wed, 05 May 2021 13:46:07 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 88sm133743otx.2.2021.05.05.13.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 13:46:06 -0700 (PDT)
Received: (nullmailer pid 2773322 invoked by uid 1000);
        Wed, 05 May 2021 20:46:05 -0000
From:   Rob Herring <robh@kernel.org>
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20210505065511.918-1-vigneshr@ti.com>
References: <20210505065511.918-1-vigneshr@ti.com>
Subject: Re: [PATCH] dt-bindings: i2c: Move i2c-omap.txt to YAML format
Date:   Wed, 05 May 2021 15:46:05 -0500
Message-Id: <1620247565.552433.2773321.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 05 May 2021 12:25:11 +0530, Vignesh Raghavendra wrote:
> Convert i2c-omap.txt to YAML schema for better checks and documentation.
> 
> Following properties were used in DT but were not documented in txt
> bindings and has been included in YAML schema:
> 1. Include ti,am4372-i2c compatible
> 2. Include dmas property used in few OMAP dts files
> 3. Document clocks property
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  .../devicetree/bindings/i2c/i2c-omap.txt      | 37 ---------
>  .../devicetree/bindings/i2c/ti,omap4-i2c.yaml | 75 +++++++++++++++++++
>  2 files changed, 75 insertions(+), 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-omap.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/i2c/ti,omap4-i2c.example.dts:22.31-32 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:377: Documentation/devicetree/bindings/i2c/ti,omap4-i2c.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1414: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1474101

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

