Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 764501A4937
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Apr 2020 19:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgDJRiG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Apr 2020 13:38:06 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38547 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgDJRiG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Apr 2020 13:38:06 -0400
Received: by mail-ot1-f68.google.com with SMTP id d18so2517091otc.5;
        Fri, 10 Apr 2020 10:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=50MgVueUpRLYPxEqiQO+BlISCgjHmB6+RHj/Bt+hChk=;
        b=i1Uw3rj9Jsi/ZJ4eQGCFxr5twSHq39BbAslofbSweiI6oUTPt5YgoAB7GsOcN8QjjA
         BflfAL3ub7qWuTYA0RzExLS85xlaPTCGyh3eS3ObpxidVKCYoW55cWjrY8Rcn3tGTgkK
         CptI8vOjfA5234pPy00dtTmfg8XRLbnaGmIVHp1OQvMxrSLkMllixfFpSTiicCaFWAAz
         HWv6p5hWCFPCZaFJVDjcAsR0OCLkdQvJCjYPi3zkT9HIEji5Eq+yO7ntv6Dy5qE1F2hv
         z5YFhtTRLlAll5xk8UIdtgu4u8oyBoN1iRQTf9+ox9PMG029Q3ceZBBvajZE6Dci7Ruu
         Rrvg==
X-Gm-Message-State: AGi0PuagJdBqh0hihpp3e+yktSnqf6ELyCoE14rOEw2qmQXjfuAvbWxZ
        aIpvG1sXP8iKPb0HoEkxIS3ONb0=
X-Google-Smtp-Source: APiQypLT0MlacQQNQZZQqIkajF6n5AyLq3+3It3FwTj1+j2Ey5SGoCvK6DDLKSDwBXipp0K8VdxJDA==
X-Received: by 2002:a9d:5a9:: with SMTP id 38mr4505161otd.331.1586540285527;
        Fri, 10 Apr 2020 10:38:05 -0700 (PDT)
Received: from rob-hp-laptop (ip-99-203-29-27.pools.spcsdns.net. [99.203.29.27])
        by smtp.gmail.com with ESMTPSA id c18sm1554480oig.53.2020.04.10.10.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 10:38:04 -0700 (PDT)
Received: (nullmailer pid 29638 invoked by uid 1000);
        Fri, 10 Apr 2020 17:04:35 -0000
Date:   Fri, 10 Apr 2020 12:04:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: regroup documentation of bindings
Message-ID: <20200410170435.GA23398@bogus>
References: <20200330002220.3575-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200330002220.3575-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 30, 2020 at 02:22:20AM +0200, Wolfram Sang wrote:
> Some bindings are for the bus master, some are for the slaves.
> Regroup them and give them seperate headings to make it clear.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 63 +++++++++++--------
>  1 file changed, 38 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> index 9a53df4243c6..aa74dd0e63e3 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -2,10 +2,10 @@ Generic device tree bindings for I2C busses
>  ===========================================
>  
>  This document describes generic bindings which can be used to describe I2C
> -busses in a device tree.
> +busses and their child devices in a device tree.
>  
> -Required properties
> --------------------
> +Required properties (per bus)
> +-----------------------------
>  
>  - #address-cells  - should be <1>. Read more about addresses below.
>  - #size-cells     - should be <0>.
> @@ -16,18 +16,13 @@ For other required properties e.g. to describe register sets,
>  clocks, etc. check the binding documentation of the specific driver.
>  
>  The cells properties above define that an address of children of an I2C bus
> -are described by a single value. This is usually a 7 bit address. However,
> -flags can be attached to the address. I2C_TEN_BIT_ADDRESS is used to mark a 10
> -bit address. It is needed to avoid the ambiguity between e.g. a 7 bit address
> -of 0x50 and a 10 bit address of 0x050 which, in theory, can be on the same bus.
> -Another flag is I2C_OWN_SLAVE_ADDRESS to mark addresses on which we listen to
> -be devices ourselves.
> +are described by a single value.
>  
> -Optional properties
> --------------------
> +Optional properties (per bus)
> +-----------------------------
>  
>  These properties may not be supported by all drivers. However, if a driver
> -wants to support one of the below features, it should adapt the bindings below.
> +wants to support one of the below features, it should adapt these bindings.
>  
>  - clock-frequency
>  	frequency of bus clock in Hz.
> @@ -73,31 +68,49 @@ wants to support one of the below features, it should adapt the bindings below.
>  	i2c bus clock frequency (clock-frequency).
>  	Specified in Hz.
>  
> -- interrupts
> -	interrupts used by the device.
> -
> -- interrupt-names
> -	"irq", "wakeup" and "smbus_alert" names are recognized by I2C core,
> -	other names are	left to individual drivers.
> -
> -- host-notify
> -	device uses SMBus host notify protocol instead of interrupt line.
> -
>  - multi-master
>  	states that there is another master active on this bus. The OS can use
>  	this information to adapt power management to keep the arbitration awake
>  	all the time, for example.
>  
> -- wakeup-source
> -	device can be used as a wakeup source.
> +Required properties (per child device)
> +--------------------------------------
> +
> +- compatible
> +	name of I2C slave device following generic names recommended practice.

generic names is for node names not compatibles.

>  
>  - reg
> -	I2C slave addresses
> +	One or many I2C slave addresses. These are usually a 7 bit addresses.
> +	However, flags can be attached to an address. I2C_TEN_BIT_ADDRESS is
> +	used to mark a 10 bit address. It is needed to avoid the ambiguity
> +	between e.g. a 7 bit address of 0x50 and a 10 bit address of 0x050
> +	which, in theory, can be on the same bus.
> +	Another flag is I2C_OWN_SLAVE_ADDRESS to mark addresses on which we
> +	listen to be devices ourselves.
> +
> +Optional properties (per child device)
> +--------------------------------------
> +
> +These properties may not be supported by all drivers. However, if a driver
> +wants to support one of the below features, it should adapt these bindings.
> +
> +- host-notify
> +	device uses SMBus host notify protocol instead of interrupt line.
> +
> +- interrupts
> +	interrupts used by the device.
> +
> +- interrupt-names
> +	"irq", "wakeup" and "smbus_alert" names are recognized by I2C core,
> +	other names are	left to individual drivers.
>  
>  - reg-names
>  	Names of map programmable addresses.
>  	It can contain any map needing another address than default one.
>  
> +- wakeup-source
> +	device can be used as a wakeup source.
> +
>  Binding may contain optional "interrupts" property, describing interrupts
>  used by the device. I2C core will assign "irq" interrupt (or the very first
>  interrupt if not using interrupt names) as primary interrupt for the slave.
> -- 
> 2.20.1
> 
