Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC8BE4760E0
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 19:38:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343849AbhLOShd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 13:37:33 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:40682 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234977AbhLOShc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Dec 2021 13:37:32 -0500
Received: by mail-ot1-f50.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so26004432otj.7;
        Wed, 15 Dec 2021 10:37:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1SeB84S69bpsa1PObCsguFCuIUK1jo7w+NpM6xYNgYQ=;
        b=Rnh2ScQCEF00qB4lnQkgT6Nun2wNiZfwDmLuy0wYrDYy+qOaCiqPB6tHmOABQl9oF4
         p5K9YDLXEkUMwBybvJfcOoAyliXQYgt5T69oUtOJP0YUQHxMAQDwn29yaICiANKtspbL
         PVUbhgB21M+ye3BM69lHum+ZWUSBaXyG3bT9LGZBNdKhDNA1yebRGHN2jlm6EuSeVsQA
         H1bh//6AxYcgAwUZGrpFeCygDc/4RWvICkOV1JfHMGmKZLhaFR2hRV43F9kZTmeEIfLU
         tJQr4O1CCFuy3q31qHOppyyi7EG4eYZQwsTGv7qX7Giio+MENpC3+9/82HG4IBR8vkLg
         vjKQ==
X-Gm-Message-State: AOAM532aknhuKlGSoEH2mzmpkDO2G1U8T4zU05auxUXuOZNJ6vvEAPwa
        xqglP1yEN766dWiUpFjemA==
X-Google-Smtp-Source: ABdhPJwjTsE+G4GlNjpU1uHHk79mPFLVzI/DID9ltvFzWeKtA+cshnlVlgrxc/OfhJkOkys0N0IFIw==
X-Received: by 2002:a05:6830:1ddd:: with SMTP id a29mr9883407otj.311.1639593451526;
        Wed, 15 Dec 2021 10:37:31 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id b22sm474096oib.41.2021.12.15.10.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 10:37:30 -0800 (PST)
Received: (nullmailer pid 1614869 invoked by uid 1000);
        Wed, 15 Dec 2021 18:37:29 -0000
Date:   Wed, 15 Dec 2021 12:37:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     andy.shevchenko@gmail.com, christian.koenig@amd.com,
        digetx@gmail.com, dri-devel@lists.freedesktop.org,
        jonathanh@nvidia.com, ldewangan@nvidia.com,
        linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-tegra@vger.kernel.org, p.zabel@pengutronix.de,
        sumit.semwal@linaro.org, thierry.reding@gmail.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: tegra: Add SMBus feature properties
Message-ID: <Ybo16aNZ5MBW6XY6@robh.at.kernel.org>
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
 <1639062321-18840-2-git-send-email-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1639062321-18840-2-git-send-email-akhilrajeev@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 09, 2021 at 08:35:20PM +0530, Akhil R wrote:
> Tegra I2C can use a gpio as an smbus-alert. Document the usage of
> the same.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
> index 3f2f990..71ee79b 100644
> --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
> @@ -70,6 +70,10 @@ Required properties:
>    - rx
>    - tx
>  
> +optional properties:
> +- smbalert-gpio: Must contain an entry for the gpio to be used as smbus alert.
> +  It will be used only if optional smbus-alert property is present.

There's already a standard way to do this with interrupts. And GPIOs can 
be interrupts usually.

> +
>  Example:
>  
>  	i2c@7000c000 {
> -- 
> 2.7.4
> 
> 
