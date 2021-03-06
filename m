Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 634B532FD1F
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Mar 2021 21:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbhCFUa5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 6 Mar 2021 15:30:57 -0500
Received: from mail-qk1-f175.google.com ([209.85.222.175]:42785 "EHLO
        mail-qk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbhCFUaW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 6 Mar 2021 15:30:22 -0500
Received: by mail-qk1-f175.google.com with SMTP id z190so5596426qka.9;
        Sat, 06 Mar 2021 12:30:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vpEE2LuMpf4oBZ8J8QruUIPmRVLcDf+SwJ7KDyqdFnU=;
        b=dLyvd0kY26cBPjKvMyMPKu5IFtxIaVc8AZaaP4WR57SNS9reJBWdz76mfs1H6G59Ii
         07SaYrUzuST73gCZVLMB+ywovmlQ871R3wJAc94EZCPIqNvGOKa5Gbqq/LOYPLIonb0Y
         MpRD1Ploef2g2q8SbO7XCJoamMZlV68bKYYx+MY8mmOAIlLZzytLb8bJfUSj47fT0n5f
         d1mJjD+XbryMKSoLlgnZwJZ2lf9zSoT/8jLAWZDx8iv/GPfP4b5G/vYRlM7Tk5HPjZSL
         jgACMLsn/KrDdL7r4769m7fNBcbC8Wm2opc+jqp7Hv3XSIOnadvBeoFclrOzO6+l07xj
         L/sg==
X-Gm-Message-State: AOAM532B9GXOSdCm4sKh+l5E0WpccIpYNqNQvHsGZdx8DSQ9rfHqktUP
        j0KMKj1Exdeeo9p3EwmnAQ==
X-Google-Smtp-Source: ABdhPJy2fN2QBGV1lFAQNmt1/5joJHNHyoDWnAGMQoA/TNIDZatmXya4MAGjs7h+WUTWaxosvqM0QQ==
X-Received: by 2002:a37:7747:: with SMTP id s68mr15511713qkc.198.1615062621871;
        Sat, 06 Mar 2021 12:30:21 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
        by smtp.gmail.com with ESMTPSA id 9sm4357749qtx.46.2021.03.06.12.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 12:30:20 -0800 (PST)
Received: (nullmailer pid 1164606 invoked by uid 1000);
        Sat, 06 Mar 2021 20:30:11 -0000
Date:   Sat, 6 Mar 2021 13:30:11 -0700
From:   Rob Herring <robh@kernel.org>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org
Subject: Re: [PATCH v4 1/4] dt-bindings: i2c: aspeed: add transfer mode
 support
Message-ID: <20210306203011.GA1152769@robh.at.kernel.org>
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
 <20210224191720.7724-2-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210224191720.7724-2-jae.hyun.yoo@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 24, 2021 at 11:17:17AM -0800, Jae Hyun Yoo wrote:
> Append bindings to support transfer mode.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> ---
> Changes since v3:
> - None
> 
> Changes since v2:
> - Moved SRAM resources back to default dtsi and added mode selection
>   property.
> 
> Changes since v1:
> - Removed buffer reg settings from default device tree and added the settings
>   into here to show the predefined buffer range per each bus.
> 
>  .../devicetree/bindings/i2c/i2c-aspeed.txt    | 37 +++++++++++++++----
>  1 file changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> index b47f6ccb196a..242343177324 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> @@ -17,6 +17,20 @@ Optional Properties:
>  - bus-frequency	: frequency of the bus clock in Hz defaults to 100 kHz when not
>  		  specified
>  - multi-master	: states that there is another master active on this bus.
> +- aspeed,i2c-xfer-mode	: should be "byte", "buf" or "dma" to select transfer
> +			  mode defaults to "byte" mode when not specified.
> +
> +			  I2C DMA mode on AST2500 has these restrictions:
> +			    - If one of these controllers is enabled
> +				* UHCI host controller
> +				* MCTP controller
> +			      I2C has to use buffer mode or byte mode instead
> +			      since these controllers run only in DMA mode and
> +			      I2C is sharing the same DMA H/W with them.
> +			    - If one of these controllers uses DMA mode, I2C
> +			      can't use DMA mode
> +				* SD/eMMC
> +				* Port80 snoop

How does one decide between byte or buf mode? 

>  
>  Example:
>  
> @@ -26,20 +40,29 @@ i2c {
>  	#size-cells = <1>;
>  	ranges = <0 0x1e78a000 0x1000>;
>  
> -	i2c_ic: interrupt-controller@0 {
> -		#interrupt-cells = <1>;
> -		compatible = "aspeed,ast2400-i2c-ic";
> +	i2c_gr: i2c-global-regs@0 {
> +		compatible = "aspeed,ast2500-i2c-gr", "syscon";
>  		reg = <0x0 0x40>;
> -		interrupts = <12>;
> -		interrupt-controller;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x40>;
> +
> +		i2c_ic: interrupt-controller@0 {
> +			#interrupt-cells = <1>;
> +			compatible = "aspeed,ast2500-i2c-ic";
> +			reg = <0x0 0x4>;
> +			interrupts = <12>;
> +			interrupt-controller;
> +		};
>  	};
>  
>  	i2c0: i2c-bus@40 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
> -		reg = <0x40 0x40>;
> -		compatible = "aspeed,ast2400-i2c-bus";
> +		reg = <0x40 0x40>, <0x200 0x10>;
> +		compatible = "aspeed,ast2500-i2c-bus";


The example changes are all unrelated to adding the new property. Should 
be a separate patch or just dropped.

>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
>  		bus-frequency = <100000>;
> -- 
> 2.17.1
> 
