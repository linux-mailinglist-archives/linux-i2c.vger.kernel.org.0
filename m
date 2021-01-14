Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30CBD2F6B11
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jan 2021 20:36:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730055AbhANTe7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jan 2021 14:34:59 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:35900 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730053AbhANTe7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Jan 2021 14:34:59 -0500
Received: by mail-ot1-f41.google.com with SMTP id c18so489260oto.3;
        Thu, 14 Jan 2021 11:34:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eI8l+V6eQQiWW/5DwoRdpvUakrm5Guzq/DjH0wy08Nk=;
        b=g6Ybvts/oIXBvo/JvR8+OlXziKWRy+y4dRLiMdMVXNuu7dfChtui2YfeiwUSs4SgKV
         kVV+BDdxjC2k+5HYbcKSHK4IE6o/NvvSZ9gAAM2JIJ1XF4Yd7QZNWPTvGoAlMBHg4Eua
         Zs8sQuvjPAlVCGnlljNleDffm+DPpQJI6ybCWRavM3UJCLmcPRyBG/uV6RXXSAV+67lq
         lcLx0EkVyozGLOnfFpNhjXmWYbcBUuZAfsQlF/hEoTkTry1ZlzcdsKQsrp4WU8HSfQf/
         UV3itGsKUGh3ETOrDkVoA7v4StRZ9vXAi3Iq8XY2Bk9jug++wITUVzfgoSM49pdkiFhe
         GjBQ==
X-Gm-Message-State: AOAM530eOCdOA/tnx57dq9Kla9MqT0FiJTjFYqlpq5ykSxZ0CrytR2g5
        a4Z5I5Fcm5yXzrBSKYo8YQ==
X-Google-Smtp-Source: ABdhPJzZGm3tm2YipNiZXiwkgdTGjwip3XbzYmF7W2P/A2RmxSmGhJeANzlHhOVW99a1Pxj8qfSMaQ==
X-Received: by 2002:a9d:5ad:: with SMTP id 42mr5617424otd.154.1610652858214;
        Thu, 14 Jan 2021 11:34:18 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s139sm1232680oih.10.2021.01.14.11.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 11:34:17 -0800 (PST)
Received: (nullmailer pid 3438451 invoked by uid 1000);
        Thu, 14 Jan 2021 19:34:16 -0000
Date:   Thu, 14 Jan 2021 13:34:16 -0600
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
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: aspeed: add buffer and DMA mode
 transfer support
Message-ID: <20210114193416.GA3432711@robh.at.kernel.org>
References: <20210112003749.10565-1-jae.hyun.yoo@linux.intel.com>
 <20210112003749.10565-2-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210112003749.10565-2-jae.hyun.yoo@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 11, 2021 at 04:37:46PM -0800, Jae Hyun Yoo wrote:
> Append bindings to support buffer mode and DMA mode transfer.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
> Changes since v1:
> - Removed buffer reg settings from default device tree and added the settings
>   into here to show the predefined buffer range per each bus.
> 
>  .../devicetree/bindings/i2c/i2c-aspeed.txt    | 126 +++++++++++++++++-
>  1 file changed, 119 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> index b47f6ccb196a..978e8402fdfc 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> @@ -3,7 +3,62 @@ Device tree configuration for the I2C busses on the AST24XX, AST25XX, and AST26X
>  Required Properties:
>  - #address-cells	: should be 1
>  - #size-cells		: should be 0
> -- reg			: address offset and range of bus
> +- reg			: Address offset and range of bus registers.
> +
> +			  An additional SRAM buffer address offset and range is
> +			  optional in case of enabling I2C dedicated SRAM for
> +			  buffer mode transfer support. If the optional range
> +			  is defined, buffer mode will be enabled.
> +			  - AST2400
> +			    &i2c0 { reg = <0x40 0x40>, <0x800 0x80>; };
> +			    &i2c1 { reg = <0x80 0x40>, <0x880 0x80>; };
> +			    &i2c2 { reg = <0xc0 0x40>, <0x900 0x80>; };
> +			    &i2c3 { reg = <0x100 0x40>, <0x980 0x80>; };
> +			    &i2c4 { reg = <0x140 0x40>, <0xa00 0x80>; };
> +			    &i2c5 { reg = <0x180 0x40>, <0xa80 0x80>; };
> +			    &i2c6 { reg = <0x1c0 0x40>, <0xb00 0x80>; };
> +			    &i2c7 { reg = <0x300 0x40>, <0xb80 0x80>; };
> +			    &i2c8 { reg = <0x340 0x40>, <0xc00 0x80>; };
> +			    &i2c9 { reg = <0x380 0x40>, <0xc80 0x80>; };
> +			    &i2c10 { reg = <0x3c0 0x40>, <0xd00 0x80>; };
> +			    &i2c11 { reg = <0x400 0x40>, <0xd80 0x80>; };
> +			    &i2c12 { reg = <0x440 0x40>, <0xe00 0x80>; };
> +			    &i2c13 { reg = <0x480 0x40>, <0xe80 0x80>; };

All this information doesn't need to be in the binding.

It's also an oddly structured dts file if this is what you are doing...

> +
> +			  - AST2500
> +			    &i2c0 { reg = <0x40 0x40>, <0x200 0x10>; };
> +			    &i2c1 { reg = <0x80 0x40>, <0x210 0x10>; };
> +			    &i2c2 { reg = <0xc0 0x40>, <0x220 0x10>; };
> +			    &i2c3 { reg = <0x100 0x40>, <0x230 0x10>; };
> +			    &i2c4 { reg = <0x140 0x40>, <0x240 0x10>; };
> +			    &i2c5 { reg = <0x180 0x40>, <0x250 0x10>; };
> +			    &i2c6 { reg = <0x1c0 0x40>, <0x260 0x10>; };
> +			    &i2c7 { reg = <0x300 0x40>, <0x270 0x10>; };
> +			    &i2c8 { reg = <0x340 0x40>, <0x280 0x10>; };
> +			    &i2c9 { reg = <0x380 0x40>, <0x290 0x10>; };
> +			    &i2c10 { reg = <0x3c0 0x40>, <0x2a0 0x10>; };
> +			    &i2c11 { reg = <0x400 0x40>, <0x2b0 0x10>; };
> +			    &i2c12 { reg = <0x440 0x40>, <0x2c0 0x10>; };
> +			    &i2c13 { reg = <0x480 0x40>, <0x2d0 0x10>; };
> +
> +			  - AST2600
> +			    &i2c0 { reg = <0x80 0x80>, <0xc00 0x20>; };
> +			    &i2c1 { reg = <0x100 0x80>, <0xc20 0x20>; };
> +			    &i2c2 { reg = <0x180 0x80>, <0xc40 0x20>; };
> +			    &i2c3 { reg = <0x200 0x80>, <0xc60 0x20>; };
> +			    &i2c4 { reg = <0x280 0x80>, <0xc80 0x20>; };
> +			    &i2c5 { reg = <0x300 0x80>, <0xca0 0x20>; };
> +			    &i2c6 { reg = <0x380 0x80>, <0xcc0 0x20>; };
> +			    &i2c7 { reg = <0x400 0x80>, <0xce0 0x20>; };
> +			    &i2c8 { reg = <0x480 0x80>, <0xd00 0x20>; };
> +			    &i2c9 { reg = <0x500 0x80>, <0xd20 0x20>; };
> +			    &i2c10 { reg = <0x580 0x80>, <0xd40 0x20>; };
> +			    &i2c11 { reg = <0x600 0x80>, <0xd60 0x20>; };
> +			    &i2c12 { reg = <0x680 0x80>, <0xd80 0x20>; };
> +			    &i2c13 { reg = <0x700 0x80>, <0xda0 0x20>; };
> +			    &i2c14 { reg = <0x780 0x80>, <0xdc0 0x20>; };
> +			    &i2c15 { reg = <0x800 0x80>, <0xde0 0x20>; };
> +
>  - compatible		: should be "aspeed,ast2400-i2c-bus"
>  			  or "aspeed,ast2500-i2c-bus"
>  			  or "aspeed,ast2600-i2c-bus"
> @@ -17,6 +72,25 @@ Optional Properties:
>  - bus-frequency	: frequency of the bus clock in Hz defaults to 100 kHz when not
>  		  specified
>  - multi-master	: states that there is another master active on this bus.
> +- aspeed,dma-buf-size	: size of DMA buffer.
> +			    AST2400: N/A
> +			    AST2500: 2 ~ 4095
> +			    AST2600: 2 ~ 4096

If based on the SoC, then all this can be implied from the compatible 
string.

> +
> +			  If both DMA and buffer modes are enabled in device
> +			  tree, DMA mode will be selected.
> +
> +			  AST2500 has these restrictions:
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
>  
>  Example:
>  
> @@ -26,12 +100,21 @@ i2c {
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
> @@ -39,11 +122,40 @@ i2c {
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  		reg = <0x40 0x40>;
> -		compatible = "aspeed,ast2400-i2c-bus";
> +		compatible = "aspeed,ast2500-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
>  		bus-frequency = <100000>;
>  		interrupts = <0>;
>  		interrupt-parent = <&i2c_ic>;
>  	};
> +
> +	/* buffer mode transfer enabled */
> +	i2c1: i2c-bus@80 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		#interrupt-cells = <1>;
> +		reg = <0x80 0x40>, <0x210 0x10>;
> +		compatible = "aspeed,ast2500-i2c-bus";
> +		clocks = <&syscon ASPEED_CLK_APB>;
> +		resets = <&syscon ASPEED_RESET_I2C>;
> +		bus-frequency = <100000>;
> +		interrupts = <1>;
> +		interrupt-parent = <&i2c_ic>;
> +	};
> +
> +	/* DMA mode transfer enabled */
> +	i2c2: i2c-bus@c0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		#interrupt-cells = <1>;
> +		reg = <0xc0 0x40>;
> +		aspeed,dma-buf-size = <4095>;
> +		compatible = "aspeed,ast2500-i2c-bus";
> +		clocks = <&syscon ASPEED_CLK_APB>;
> +		resets = <&syscon ASPEED_RESET_I2C>;
> +		bus-frequency = <100000>;
> +		interrupts = <2>;
> +		interrupt-parent = <&i2c_ic>;
> +	};
>  };
> -- 
> 2.17.1
> 
