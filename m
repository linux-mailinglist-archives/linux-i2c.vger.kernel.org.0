Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB75A45F6F7
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 23:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbhKZWxO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Nov 2021 17:53:14 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:54208 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239549AbhKZWvO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Nov 2021 17:51:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:To:From:Date:From:Sender:Reply-To:Subject:Date:
        Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=L0jL/JDF3mZatKYXvhswt5OjSKQ39TiN08Rrl5nIFCs=; b=Gf9nbyq4kEILLJ1Qbhs6/h/5X6
        gnDTUoaqg+UO/tWYpMbIuDN1c0V8Z8AgbeyH2dwvusnYmjPfeDWNVhIB1Yw4XzY5wKpOW/T87T8Rl
        IXcv4m+5lqjsNIHKRLYw+Bl2f+aefYRc6GAuIWTvsKjEPSaK7RebWrb27BZuBpoCz990=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1mqk0Z-00EjZD-N8; Fri, 26 Nov 2021 23:47:55 +0100
Date:   Fri, 26 Nov 2021 23:47:55 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     wsa@kernel.org, broonie@kernel.org, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Patrice Chotard <patrice.chotard@foss.st.com>
Subject: Re: [RFC] sti: Conflict in node name for an IP supporting both I2C
 and SPI
Message-ID: <YaFkG85DHMMRiD7O@lunn.ch>
References: <20211125210428.GA27075@gnbcxl0045.gnb.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125210428.GA27075@gnbcxl0045.gnb.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 25, 2021 at 10:04:28PM +0100, Alain Volmat wrote:
> Hello,
> 
> in the STi platform [1], the I2C and SPI controllers are handled by the
> same IP, which can be configured in either one or the other mode.
> This leads to warnings during the DT build and I was wondering if you could
> give me some hints about how such situation should be handled since this
> concern DT warnings but also bindings and YAML.
> 
> In the SoC DT (dtsi), for each IP, there are 2 entries:
> 
> One for the I2C mode (implemented by the driver i2c/busses/i2c-st.c)
>                 i2c@9840000 {
>                         compatible = "st,comms-ssc4-i2c";
>                         interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
>                         reg = <0x9840000 0x110>;
>                         clocks = <&clk_s_c0_flexgen CLK_EXT2F_A9>;
>                         clock-names = "ssc";
>                         clock-frequency = <400000>;
>                         pinctrl-names = "default";
>                         pinctrl-0 = <&pinctrl_i2c0_default>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> 
>                         status = "disabled";
>                 };
> 
> One for the SPI mode (implemented by the driver spi/spi-st-ssc4.c)
>                 spi@9840000 {
>                         compatible = "st,comms-ssc4-spi";
>                         reg = <0x9840000 0x110>;
>                         interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&clk_s_c0_flexgen CLK_EXT2F_A9>;
>                         clock-names = "ssc";
>                         pinctrl-0 = <&pinctrl_spi0_default>;
>                         pinctrl-names = "default";
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> 
>                         status = "disabled";
>                 };
> 
> So basically, there are 2 nodes, one for each mode, and enabling one or the
> other mode is done within the board DT.
> Since the address is the same, this obviously leads to warning during the build
> of the DT.
> 
> arch/arm/boot/dts/stih407-family.dtsi:363.15-376.5: Warning (unique_unit_address): /soc/i2c@9840000: duplicate unit-address (also used in node /soc/spi@9840000)

How about making the compiler look at the status value. So long as
only zero or one is enabled, it should not be an issue. If you have
two or more nodes enabled for an address, then you want a warning or
error.

     Andrew
