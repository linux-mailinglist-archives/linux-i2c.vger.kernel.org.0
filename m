Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98E1967D3BE
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jan 2023 19:06:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbjAZSG5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Jan 2023 13:06:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjAZSG5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Jan 2023 13:06:57 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 403CF23D83
        for <linux-i2c@vger.kernel.org>; Thu, 26 Jan 2023 10:06:56 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27110975;
        Thu, 26 Jan 2023 19:06:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674756414;
        bh=AK5yBVehLJnEdWBBhtUAWEwRSlRLu9T3pmG7LXxnG8s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hlyGRZMxL+4lTvQUu8KAJqAHmWmZkNq0z7zpXUKFxkhqXI1EvLFMSOsSL9yfz5zWk
         bdgygRc1PC4Q1WDEslAGBSf+C9tAJ00qyMvQqbUnCJ6QyiTe1lGuw4vXZ/tF7woFuN
         RRCMkAUFmXOrqbx8179EnlTzV55HQHQkCakwL3AE=
Date:   Thu, 26 Jan 2023 20:06:46 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     RRademacher@heine.com
Cc:     linux-i2c@vger.kernel.org
Subject: Re: question about devicetree entry pca954x
Message-ID: <Y9LBNnW1Vx9pIy5r@pendragon.ideasonboard.com>
References: <6c4c41f6cac34573b2c5ab14cb0ba27e@heine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6c4c41f6cac34573b2c5ab14cb0ba27e@heine.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

On Thu, Jan 26, 2023 at 05:05:47PM +0000, RRademacher@heine.com wrote:
> Hello Mr. Pinchart,
> 
> you are listed as maintainer in the i2c-mux-pca954x.yaml file.
> 
>  
> May I ask if you could take a few minutes and have a look at the following
> problem, if you can spot a bug in the second DT snippet?
> 
> Because on the internet you can only find examples where devices are used
> behind the pca954x which do not use an interrupt.
> 
>  
> 
> Let me tell you about the problem.
> 
> At our old device we had implemented this, which worked perfect:
> 
>  
> &i2c4 {
>     pinctrl-names = "default","gpio";
>     pinctrl-0 = <&pinctrl_i2c4>;
>     pinctrl-1 = <&pinctrl_i2c4_gpio>;
>     sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>     scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>     clock-frequency = <400000>;
>     status = "okay";
> 
>     touchscreen@26 {
>         compatible = "ilitek,ili2117";
>         reg = <0x26>;
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_ili2117_62>;
>         interrupt-parent = <&gpio2>;
>         interrupts = <7 IRQ_TYPE_EDGE_RISING>;
>         reset-gpios = <&pca9554_interface 0 GPIO_ACTIVE_LOW>;
>     };
> 
>         proximity@39 {
>                 compatible = "avago,apds9960";
>                 reg = <0x39>;
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&pinctrl_apds9960_39>;
>                 interrupt-parent = <&gpio2>;
>                 interrupts = <6 IRQ_TYPE_EDGE_RISING>;
>         };
> .....
>  
> 
> Then we want more proximity sensors in this device, that we decided to add the
> PCA9544A.
> 
> &i2c4 {
> .....
>  
>     i2c4_mux_apds: i2c4-mux-pca9544@70 {
>         compatible = "nxp,pca9544";
>         #address-cells = <1>;
>         #size-cells = <0>;
>         reg = <0x70>;
>         interrupt-parent = <&gpio2>;
>         interrupt-controller;
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_pca9544a_70>;
>         interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
> 
>         i2c@0 {
>             #address-cells = <1>;
>             #size-cells = <0>;
>             reg = <0>;
> 
>             proximity@39 {
>                 compatible = "avago,apds9960";
>                 reg = <0x39>;
>                 interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
>                 interrupt-parent = <&i2c4_mux_apds>;
>                 };
>         };
> 
>  
>  
> Both drivers (pca954x and apds9960) request threaded irqs in their probe
> function, but it does not work together. Although the apds9960 also gets one
> assigned, when the handle_nested_irq function is called (After everything has
> been initialized. However, this seems to be the second call to this function!
> First call seems to be inside the initialization phase.) the irq seems to be
> disabled. And thus the processing does not start.
> 
> I think that the problem is in my devicetree entry, that the soc doesn't really
> know how to handle the interrupt of the apds9960.

How are interrupts connected at the hardware level ? Is the APDS9960
interrupt connected to the INT0 pin of the PCA9544 ?

You have switched from IRQ_TYPE_EDGE_RISING to IRQ_TYPE_EDGE_FALLING for
the APDS9960, is that intentional ?

Is there any message printed to the kernel log around the time where
either driver is probed, or when the APDS9960 interrupt is supposed to
occur, that may indicate a problem ?

-- 
Regards,

Laurent Pinchart
