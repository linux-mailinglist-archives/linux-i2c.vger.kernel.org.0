Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0BEB691D63
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Feb 2023 11:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbjBJK53 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Feb 2023 05:57:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232259AbjBJK50 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Feb 2023 05:57:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FA2F6FEBC
        for <linux-i2c@vger.kernel.org>; Fri, 10 Feb 2023 02:57:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5B75E70;
        Fri, 10 Feb 2023 11:57:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676026639;
        bh=jB1qcFuHGkIEoCxgh26RsG8rAylF+W1lH/xIqsA6V3Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QwCvjYcBHeaBtLNth889MtbiJIowPSSx+Vn2sNL3DRd8tyzcBiLKsQ0Aq34rEaFzC
         WguVa0cNJhCQVvOBMyLiMCAie+Ef1pXAxRsDGZ8gQ7rt3m+PzCuv5bsxE+wQDlWn7b
         qFrwn/OAijukOUF74Z8Yav2r0uUWyu4y4r+FkmQE=
Date:   Fri, 10 Feb 2023 12:57:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     RRademacher@heine.com
Cc:     linux-i2c@vger.kernel.org
Subject: Re: AW: #Extern_Re: question about devicetree entry pca954x
Message-ID: <Y+YjDWqYGDeAxdkt@pendragon.ideasonboard.com>
References: <6c4c41f6cac34573b2c5ab14cb0ba27e@heine.com>
 <Y9LBNnW1Vx9pIy5r@pendragon.ideasonboard.com>
 <234d0cd7383d4bad8aeda4f22feef575@heine.com>
 <ca5f86514fc54f7a92dba756a301564d@heine.com>
 <21db1f24116f4796be6c5468db1e8e9a@heine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21db1f24116f4796be6c5468db1e8e9a@heine.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

I'm sorry for the late reply, I've been very busy lately.

On Wed, Feb 08, 2023 at 03:56:15PM +0000, RRademacher@heine.com wrote:
> Hello Mr. Pinchart,
> 
> following on from our previous conversation, I have since observed the
> following.
> 
> The first call of handle_nested_interrupt() during startup was a
> result of another driver and had nothing to do with the problem. i
> used dump_stack() to find the callee.

OK, that makes sense.

> For the problem, the current debug output reduces to the following: 
> 
> [   28.830817] [DBGMSG] pca954x_irq_handler :entering pca954x_irq_handler
> [   28.831363] [DBGMSG] pca954x_irq_handler :i2c_smbus_read::retval=14
> [   28.837918] [DBGMSG] pca954x_irq_handler :i=0 | bit: 4 isset in register = true
> [   28.837921] [DBGMSG] pca954x_irq_handler :irq= 0x65 // child_irq =0xe7
> [   28.851527] [DBGMSG] handle_nested_irq :entering handle_nested_irq
> [   28.851542] Call trace:
> [   28.851555]  dump_backtrace+0x0/0x178
> [   28.851561]  show_stack+0x24/0x30
> [   28.889839]  dump_stack+0xb4/0x114
> [   28.893245]  handle_nested_irq+0x44/0x23c
> [   28.897258]  pca954x_irq_handler+0xf4/0x138 [i2c_mux_pca954x]
> [   28.903006]  irq_thread_fn+0x30/0xa0
> [   28.906581]  irq_thread+0x150/0x248
> [   28.910068]  kthread+0x140/0x160
> [   28.913297]  ret_from_fork+0x10/0x1c
> [   28.916901] [DBGMSG] handle_nested_irq :irq: 0xe7
> [   28.916905] [DBGMSG] handle_nested_irq :irq_desc->name: (null)
> [   28.921447] [DBGMSG] handle_nested_irq :irq_desc->parent_irq: 0x0
> 
> Do you have any idea what the problem could be? 
> I have no idea about, why the interrupt is disabled and why the action of the threaded interrupt is null
> Is it possible that I have forgotten something in the DeviceTree entry?

Nothing immediately strikes me as wrong in your device tree.

Could you share the output of `cat /proc/interrupts` ? If the IRQ
numbers listed in the log above (0x65 and 0xe7) have changed, please
also share the new log, I want to correlate those numbers to
/proc/interrupt entries.

> On Donnerstag, 26. Januar 2023 21:33, Rademacher Ralf wrote:
> >     
> > Mr. Pinchart,
> > 
> > i have to correct myself:
> > the first call of handle_nested_interrupt happens already before
> > pca954x_probe. i added some more DBGMSGs
> > 
> > [    2.869856] [DBGMSG] handle_nested_irq :irq = 0xdf
> > [    2.869858] [DBGMSG] handle_nested_irq :action = 0x7ba41100
> > [    2.874477] [DBGMSG] handle_nested_irq :irqd_irq_disabled(&desc->irq_data): false
> > [    2.874479] [DBGMSG] handle_nested_irq :(unlikely(!action || irqd_irq_disabled(&desc->irq_data))): false
> > [    2.874501] [DBGMSG] handle_nested_irq :action->irq:df | action->dev_id:0x7ba64810
> > [    6.373737] [DBGMSG] pca954x_probe :enter fxn
> > [    6.973918] [DBGMSG] pca954x_probe :leave fxn
> > 
> > On Donnerstag, 26. Januar 2023 21:18, Rademacher Ralf wrote:
> > > On Donnerstag, 26. Januar 2023 19:06, Laurent Pinchart wrote:
> > > > On Thu, Jan 26, 2023 at 05:05:47PM +0000, RRademacher@heine.com wrote:
> > > > > Hello Mr. Pinchart,
> > > > >
> > > > > you are listed as maintainer in the i2c-mux-pca954x.yaml file.
> > > > >
> > > > > May I ask if you could take a few minutes and have a look at the following
> > > > > problem, if you can spot a bug in the second DT snippet?
> > > > >
> > > > > Because on the internet you can only find examples where devices are used
> > > > > behind the pca954x which do not use an interrupt.
> > > > >
> > > > > Let me tell you about the problem.
> > > > >
> > > > > At our old device we had implemented this, which worked perfect:
> > > > >
> > > > >
> > > > > &i2c4 {
> > > > >     pinctrl-names = "default","gpio";
> > > > >     pinctrl-0 = <&pinctrl_i2c4>;
> > > > >     pinctrl-1 = <&pinctrl_i2c4_gpio>;
> > > > >     sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > > >     scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > > >     clock-frequency = <400000>;
> > > > >     status = "okay";
> > > > >
> > > > >     touchscreen@26 {
> > > > >         compatible = "ilitek,ili2117";
> > > > >         reg = <0x26>;
> > > > >         pinctrl-names = "default";
> > > > >         pinctrl-0 = <&pinctrl_ili2117_62>;
> > > > >         interrupt-parent = <&gpio2>;
> > > > >         interrupts = <7 IRQ_TYPE_EDGE_RISING>;
> > > > >         reset-gpios = <&pca9554_interface 0 GPIO_ACTIVE_LOW>;
> > > > >     };
> > > > >
> > > > >         proximity@39 {
> > > > >                 compatible = "avago,apds9960";
> > > > >                 reg = <0x39>;
> > > > >                 pinctrl-names = "default";
> > > > >                 pinctrl-0 = <&pinctrl_apds9960_39>;
> > > > >                 interrupt-parent = <&gpio2>;
> > > > >                 interrupts = <6 IRQ_TYPE_EDGE_RISING>;
> > > > >         };
> > > > > .....
> > > > >
> > > > >
> > > > > Then we want more proximity sensors in this device, that we decided to add the
> > > > > PCA9544A.
> > > > >
> > > > > &i2c4 {
> > > > > .....
> > > > >
> > > > >     i2c4_mux_apds: i2c4-mux-pca9544@70 {
> > > > >         compatible = "nxp,pca9544";
> > > > >         #address-cells = <1>;
> > > > >         #size-cells = <0>;
> > > > >         reg = <0x70>;
> > > > >         interrupt-parent = <&gpio2>;
> > > > >         interrupt-controller;
> > > > >         pinctrl-names = "default";
> > > > >         pinctrl-0 = <&pinctrl_pca9544a_70>;
> > > > >         interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
> > > > >
> > > > >         i2c@0 {
> > > > >             #address-cells = <1>;
> > > > >             #size-cells = <0>;
> > > > >             reg = <0>;
> > > > >
> > > > >             proximity@39 {
> > > > >                 compatible = "avago,apds9960";
> > > > >                 reg = <0x39>;
> > > > >                 interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
> > > > >                 interrupt-parent = <&i2c4_mux_apds>;
> > > > >             };
> > > > >         };
> > > > >
> > > > >
> > > > >
> > > > > Both drivers (pca954x and apds9960) request threaded irqs in their probe
> > > > > function, but it does not work together. Although the apds9960 also gets one
> > > > > assigned, when the handle_nested_irq function is called (After everything has
> > > > > been initialized. However, this seems to be the second call to this function!
> > > > > First call seems to be inside the initialization phase.) the irq seems to be
> > > > > disabled. And thus the processing does not start.
> > > > >
> > > > > I think that the problem is in my devicetree entry, that the soc doesn't really
> > > > > know how to handle the interrupt of the apds9960.
> > > > 
> > > > How are interrupts connected at the hardware level ? Is the APDS9960
> > > > interrupt connected to the INT0 pin of the PCA9544 ?
> > > 
> > > Yes, it is.
> > > 
> > > > You have switched from IRQ_TYPE_EDGE_RISING to IRQ_TYPE_EDGE_FALLING for
> > > > the APDS9960, is that intentional ?
> > > 
> > > Yes, I assumed this is correct, because APDS9960 datasheet tells me
> > > that: "Interrupt open drain (active low)". So i thought i have to
> > > detect the falling edge, not the rising edge. The same in the
> > > datasheet of PCA9544A, there are 4 active low interrupt inputs.
> > > 
> > > > Is there any message printed to the kernel log around the time where
> > > > either driver is probed, or when the APDS9960 interrupt is supposed to
> > > > occur, that may indicate a problem ?
> > > 
> > > I have inserted some DBGMSGs into the functions handle_nested_irq
> > > and in the pca954x_probe. during pca954x driver probe, there is the
> > > following output:
> > > 
> > > [    2.869856] [DBGMSG] handle_nested_irq :irq = 0xdf
> > > [    2.869858] [DBGMSG] handle_nested_irq :action = 0x7ba41100
> > > [    2.874477] [DBGMSG] handle_nested_irq :irqd_irq_disabled(&desc->irq_data): false
> > > [    2.874479] [DBGMSG] handle_nested_irq :(unlikely(!action || irqd_irq_disabled(&desc->irq_data))): false
> > > [    2.874501] [DBGMSG] handle_nested_irq :action->irq:df | action->dev_id:0x7ba64810
> > > 
> > > when a apds sends the interrupt signal to the pca954x, this happens:
> > > 
> > > [ 9336.607055] [DBGMSG] pca954x_irq_handler :pca954x_irq_handler starts
> > > [ 9336.607908] [DBGMSG] pca954x_irq_handler :i2c_smbus_read::retval=14
> > > [ 9336.613255] [DBGMSG] pca954x_irq_handler :i=0 | bit: 4 is set in register
> > > [ 9336.619539] [DBGMSG] pca954x_irq_handler :irq= 0x65 // child_irq =0xe7
> > > [ 9336.619542] [DBGMSG] handle_nested_irq :irq = 0xe7
> > > [ 9336.632516] [DBGMSG] handle_nested_irq :action = 0x0
> > > [ 9336.632519] [DBGMSG] handle_nested_irq :irqd_irq_disabled(&desc->irq_data):true
> > > [ 9336.632521] [DBGMSG] handle_nested_irq :(unlikely(!action || irqd_irq_disabled(&desc->irq_data))):true
> > > [ 9336.632523] [DBGMSG] handle_nested_irq :goto out_unlock

-- 
Regards,

Laurent Pinchart
