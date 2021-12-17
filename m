Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D249B47973A
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 23:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhLQWfx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 17:35:53 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:39466 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbhLQWfx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 17:35:53 -0500
Received: by mail-ot1-f45.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso4626464ots.6;
        Fri, 17 Dec 2021 14:35:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J4DYNTGLKsNllhlZP5UzFn5QSbl8iajzWrMddWGIWbU=;
        b=7IURN/Il9CrcLDfPpbebLVp0sXe/aQtoG5KhWb1vifvvDDWfmlWCLB0c8DL0XoZVwS
         QWlKRLAKKRRtjhJFq7QMdk2Y/DRcRGsGxyrybDJxBxiLVgVp6Y7uluE1/+iaY3haZFYu
         3xRL3rbDV9I7r5LkDEW37nopNfAKDRgUHFFDlkIHsXvgdKJGeKAl7oRShGToH1/W9+ob
         boPqpc5+SYJ8ybNeGtDJ+vw+rFP7TaJQqD8pnaEHbDebziesQI/egm/c+HBDHLROjNIo
         YbN4/7M7qE+8b0o9s8cUgjRcwyD2NM5K+9EpYUQiJpVqBf5mhIXetd5ysgP4mRtuwa9L
         xHqw==
X-Gm-Message-State: AOAM530aTL1ILgv+qFW1NLvS1hkhqMU32cUQLLNAAukZ0j2CND20x9UE
        59r4+nHk+q1GsqEA0sXArw==
X-Google-Smtp-Source: ABdhPJwA6bC7jdfXWBmXyn6Ibryq5iC3mT5dthn/zszJAy4c+zq/dPKNtMtxKCagpUGuxyOdTjh4tQ==
X-Received: by 2002:a9d:373:: with SMTP id 106mr3745784otv.127.1639780552343;
        Fri, 17 Dec 2021 14:35:52 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q10sm1935250oiw.17.2021.12.17.14.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 14:35:51 -0800 (PST)
Received: (nullmailer pid 3706948 invoked by uid 1000);
        Fri, 17 Dec 2021 22:35:50 -0000
Date:   Fri, 17 Dec 2021 16:35:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: i2c: aspeed: Document interrupt
 controller properties
Message-ID: <Yb0Qxjt/R0OwOWDe@robh.at.kernel.org>
References: <20211217165658.2650677-1-thierry.reding@gmail.com>
 <20211217165658.2650677-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217165658.2650677-3-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 17, 2021 at 05:56:57PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Document the interrupt-controller and #interrupt-cells properties that
> are used by some instances of the aspeed-i2c device tree nodes.

I though you agreed with my patch removing "#interrupt-cells"? I thought 
the interrupt part was split to another node "aspeed,ast2500-i2c-ic".


> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> index f597f73ccd87..2a74551c72c0 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -28,6 +28,12 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  interrupt-controller:
> +    description: marks this device as being an interrupt provider
> +
> +  "#interrupt-cells":
> +    const: 1
> +
>    clocks:
>      maxItems: 1
>      description:
> -- 
> 2.34.1
> 
> 
