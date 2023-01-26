Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7EE867D612
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jan 2023 21:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbjAZUS4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 26 Jan 2023 15:18:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjAZUSw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Jan 2023 15:18:52 -0500
Received: from out-mx.sasg.de (out-mx.sasg.de [95.142.65.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E80E3A840
        for <linux-i2c@vger.kernel.org>; Thu, 26 Jan 2023 12:18:49 -0800 (PST)
Received: from exch2012.heineopto.de (unknown [217.239.128.75])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by out-mx.sasg.de (Postfix) with ESMTPS id ED1FC20473;
        Thu, 26 Jan 2023 21:18:47 +0100 (CET)
Received: from exch2012.heineopto.de (10.80.0.10) by exch2012.heineopto.de
 (10.80.0.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.2375.34; Thu, 26
 Jan 2023 21:18:42 +0100
Received: from exch2012.heineopto.de ([fe80::29f7:554e:2485:f599]) by
 exch2012.heineopto.de ([fe80::29f7:554e:2485:f599%12]) with mapi id
 15.01.2375.034; Thu, 26 Jan 2023 21:18:42 +0100
From:   <RRademacher@heine.com>
To:     <laurent.pinchart@ideasonboard.com>
CC:     <linux-i2c@vger.kernel.org>
Subject: AW: #Extern_Re: question about devicetree entry pca954x
Thread-Topic: #Extern_Re: question about devicetree entry pca954x
Thread-Index: AQHZMaf4pAvJYJLXN06F6qaGLQ2Y/66w7dQAgAAvzxI=
Date:   Thu, 26 Jan 2023 20:18:42 +0000
Message-ID: <234d0cd7383d4bad8aeda4f22feef575@heine.com>
References: <6c4c41f6cac34573b2c5ab14cb0ba27e@heine.com>,<Y9LBNnW1Vx9pIy5r@pendragon.ideasonboard.com>
In-Reply-To: <Y9LBNnW1Vx9pIy5r@pendragon.ideasonboard.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [91.137.63.64]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org







Von: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Gesendet: Donnerstag, 26. Januar 2023 19:06
An: Rademacher Ralf
Cc: linux-i2c@vger.kernel.org
Betreff: #Extern_Re: question about devicetree entry pca954x
�   
Warnung: Achtung - Diese E-Mail stammt von einer externen Quelle. Seien Sie vorsichtig mit Links und Anh�ngen.

Warning: Attention - This e-mail is from an external source. Be careful with links and attachments.

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
>���� pinctrl-names = "default","gpio";
>���� pinctrl-0 = <&pinctrl_i2c4>;
>���� pinctrl-1 = <&pinctrl_i2c4_gpio>;
>���� sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>���� scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>���� clock-frequency = <400000>;
>���� status = "okay";
>
>���� touchscreen@26 {
>�������� compatible = "ilitek,ili2117";
>�������� reg = <0x26>;
>�������� pinctrl-names = "default";
>�������� pinctrl-0 = <&pinctrl_ili2117_62>;
>�������� interrupt-parent = <&gpio2>;
>�������� interrupts = <7 IRQ_TYPE_EDGE_RISING>;
>�������� reset-gpios = <&pca9554_interface 0 GPIO_ACTIVE_LOW>;
>���� };
>
>�������� proximity@39 {
>���������������� compatible = "avago,apds9960";
>���������������� reg = <0x39>;
>���������������� pinctrl-names = "default";
>���������������� pinctrl-0 = <&pinctrl_apds9960_39>;
>���������������� interrupt-parent = <&gpio2>;
>���������������� interrupts = <6 IRQ_TYPE_EDGE_RISING>;
>�������� };
> .....
>
>
> Then we want more proximity sensors in this device, that we decided to add the
> PCA9544A.
>
> &i2c4 {
> .....
>
>���� i2c4_mux_apds: i2c4-mux-pca9544@70 {
>�������� compatible = "nxp,pca9544";
>�������� #address-cells = <1>;
>�������� #size-cells = <0>;
>�������� reg = <0x70>;
>�������� interrupt-parent = <&gpio2>;
>�������� interrupt-controller;
>�������� pinctrl-names = "default";
>�������� pinctrl-0 = <&pinctrl_pca9544a_70>;
>�������� interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
>
>�������� i2c@0 {
>������������ #address-cells = <1>;
>������������ #size-cells = <0>;
>������������ reg = <0>;
>
>������������ proximity@39 {
>���������������� compatible = "avago,apds9960";
>���������������� reg = <0x39>;
>���������������� interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
>���������������� interrupt-parent = <&i2c4_mux_apds>;
>���������������� };
>�������� };
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

Yes, it is.



You have switched from IRQ_TYPE_EDGE_RISING to IRQ_TYPE_EDGE_FALLING for
the APDS9960, is that intentional ?

Yes, I assumed this is correct, because APDS9960 datasheet tells me that: "Interrupt open drain (active low)". So i thought i have to detect the falling edge, not the rising edge.
The same in the datasheet of PCA9544A, there are 4 active low interrupt inputs.



Is there any message printed to the kernel log around the time where
either driver is probed, or when the APDS9960 interrupt is supposed to
occur, that may indicate a problem ?

I have inserted some DBGMSGs into the functions handle_nested_irq and in the pca954x_probe.
during pca954x driver probe, there is the following output:

[��� 2.869856] [DBGMSG] handle_nested_irq :irq = 0xdf
[��� 2.869858] [DBGMSG] handle_nested_irq :action = 0x7ba41100
[��� 2.874477] [DBGMSG] handle_nested_irq :irqd_irq_disabled(&desc->irq_data): false
[��� 2.874479] [DBGMSG] handle_nested_irq :(unlikely(!action || irqd_irq_disabled(&desc->irq_data))): false
[��� 2.874501] [DBGMSG] handle_nested_irq :action->irq:df | action->dev_id:0x7ba64810 

when a apds sends the interrupt signal to the pca954x, this happens:

[ 9336.607055] [DBGMSG] pca954x_irq_handler :pca954x_irq_handler starts
[ 9336.607908] [DBGMSG] pca954x_irq_handler :i2c_smbus_read::retval=14
[ 9336.613255] [DBGMSG] pca954x_irq_handler :i=0 | bit: 4 is set in register
[ 9336.619539] [DBGMSG] pca954x_irq_handler :irq= 0x65 // child_irq =0xe7
[ 9336.619542] [DBGMSG] handle_nested_irq :irq = 0xe7
[ 9336.632516] [DBGMSG] handle_nested_irq :action = 0x0
[ 9336.632519] [DBGMSG] handle_nested_irq :irqd_irq_disabled(&desc->irq_data):true
[ 9336.632521] [DBGMSG] handle_nested_irq :(unlikely(!action || irqd_irq_disabled(&desc->irq_data))):true
[ 9336.632523] [DBGMSG] handle_nested_irq :goto out_unlock

Regards,
Ralf Rademacher

--
Regards,

Laurent Pinchart
    
