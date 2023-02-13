Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E14A694B35
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Feb 2023 16:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjBMPdF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 13 Feb 2023 10:33:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjBMPdD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Feb 2023 10:33:03 -0500
Received: from out-mx.sasg.de (out-mx.sasg.de [95.142.65.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01AE9765
        for <linux-i2c@vger.kernel.org>; Mon, 13 Feb 2023 07:32:59 -0800 (PST)
Received: from exch2012.heineopto.de (unknown [217.239.128.75])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by out-mx.sasg.de (Postfix) with ESMTPS id 1418A22C9A;
        Mon, 13 Feb 2023 16:32:58 +0100 (CET)
Received: from exch2012.heineopto.de (fd00:0:0:1080::10) by
 exch2012.heineopto.de (fd00:0:0:1080::10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.2375.34; Mon, 13 Feb 2023 16:32:57 +0100
Received: from exch2012.heineopto.de ([fe80::29f7:554e:2485:f599]) by
 exch2012.heineopto.de ([fe80::29f7:554e:2485:f599%12]) with mapi id
 15.01.2375.034; Mon, 13 Feb 2023 16:32:57 +0100
From:   <RRademacher@heine.com>
To:     <laurent.pinchart@ideasonboard.com>
CC:     <linux-i2c@vger.kernel.org>
Subject: AW: #Extern_Re: AW: #Extern_Re: question about devicetree entry
 pca954x
Thread-Topic: #Extern_Re: AW: #Extern_Re: question about devicetree entry
 pca954x
Thread-Index: AQHZMaf4pAvJYJLXN06F6qaGLQ2Y/66w7dQAgAAvzxKAAAjPZYATr6v1gAMysICABPPKMQ==
Date:   Mon, 13 Feb 2023 15:32:57 +0000
Message-ID: <95d8af0e9cf84914a7c3a197b24fc510@heine.com>
References: <6c4c41f6cac34573b2c5ab14cb0ba27e@heine.com>
 <Y9LBNnW1Vx9pIy5r@pendragon.ideasonboard.com>
 <234d0cd7383d4bad8aeda4f22feef575@heine.com>
 <ca5f86514fc54f7a92dba756a301564d@heine.com>
 <21db1f24116f4796be6c5468db1e8e9a@heine.com>,<Y+YjDWqYGDeAxdkt@pendragon.ideasonboard.com>
In-Reply-To: <Y+YjDWqYGDeAxdkt@pendragon.ideasonboard.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [46.114.175.124]
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

Hello Mr. Pinchart,

i attached new generated kernellog lines, hoping these snippets contain the data you need.
I separated the lines a bit to make the DBGMSGs stand out from the other content. Only lines related to the two drivers or chip.c are included.
Down below there is a snipped from /proc/interrupts.

[    6.888610] bus: 'i2c': add driver pca954x
[    6.888676] bus: 'i2c': driver_probe_device: matched device 3-0070 with driver pca954x
[    6.888686] bus: 'i2c': really_probe: probing driver pca954x with device 3-0070
[    6.888775] pca954x 3-0070: no init pinctrl state
[    6.888784] pca954x 3-0070: no sleep pinctrl state
[    6.888787] pca954x 3-0070: no idle pinctrl state

[    6.888829] [DBGMSG] pca954x_probe :entering pca954x_probe

[    6.888836] pca954x 3-0070: GPIO lookup for consumer reset
[    6.888839] pca954x 3-0070: using device tree for GPIO lookup
[    6.888853] of_get_named_gpiod_flags: can't parse 'reset-gpios' property of node '/soc@0/bus@30800000/
i2c@30a50000/i2c4-mux-pca9544@70[0]'
[    6.888861] of_get_named_gpiod_flags: can't parse 'reset-gpio' property of node '/soc@0/bus@30800000/i
2c@30a50000/i2c4-mux-pca9544@70[0]'
[    6.888866] pca954x 3-0070: using lookup tables for GPIO lookup
[    6.888870] pca954x 3-0070: No GPIO consumer reset found

[    6.908207] device: 'i2c-4': device_add
[    6.908240] bus: 'i2c': add device i2c-4
[    6.908278] PM: Adding info for i2c:i2c-4
[    6.908291] device: 'i2c-4': device_add
[    6.908331] PM: Adding info for No Bus:i2c-4
[    6.911389] device: '4-0039': device_add
[    6.945282] bus: 'i2c': add device 4-0039
[    7.069423] PM: Adding info for i2c:4-0039
[    7.121093] i2c i2c-3: Added multiplexed i2c bus 4
[    7.121162] device: 'i2c-5': device_add
[    7.122267] bus: 'i2c': add device i2c-5
[    7.122327] PM: Adding info for i2c:i2c-5
[    7.122381] device: 'i2c-5': device_add
[    7.122501] PM: Adding info for No Bus:i2c-5
[    7.123477] device: '5-0039': device_add
[    7.123543] bus: 'i2c': add device 5-0039
[    7.123666] PM: Adding info for i2c:5-0039
[    7.126408] i2c i2c-3: Added multiplexed i2c bus 5
[    7.182032] device: 'i2c-6': device_add
[    7.187695] bus: 'i2c': add device i2c-6
[    7.187766] device: 'i2c-6': device_add
[    7.189430] device: '6-0039': device_add
[    7.189473] bus: 'i2c': add device 6-0039
[    7.189503] PM: Adding info for i2c:6-0039
[    7.193883] i2c i2c-3: Added multiplexed i2c bus 6
[    7.199087] device: 'i2c-7': device_add
[    7.199286] bus: 'i2c': add device i2c-7
[    7.199307] PM: Adding info for i2c:i2c-7
[    7.199328] device: 'i2c-7': device_add
[    7.199361] PM: Adding info for No Bus:i2c-7
[    7.199586] i2c i2c-3: Added multiplexed i2c bus 7
[    7.211760] pca954x 3-0070: registered 4 multiplexed busses for I2C mux pca9544

[    7.222122] [DBGMSG] pca954x_probe :leaving pca954x_probe

[    7.222138] driver: 'pca954x': driver_bound: bound to device '3-0070'
[    7.291190] bus: 'i2c': really_probe: bound device 3-0070 to driver pca954x
[    7.403877] bus: 'i2c': add driver apds9960
[    7.417379] bus: 'i2c': driver_probe_device: matched device 4-0039 with driver apds9960
[    7.422911] bus: 'i2c': really_probe: probing driver apds9960 with device 4-0039
[    7.422941] apds9960 4-0039: no pinctrl handle

[    7.422990] [DBGMSG] apds9960_probe :enter apds probe
[    7.743904] [DBGMSG] apds9960_probe :client->irq: 0x5F / interrupt_handler_fxn: 0x92D0B3C

[    7.744063] device: 'iio:device0': device_add
[    7.752407] bus: 'iio': add device iio:device0
[    7.752431] PM: Adding info for iio:iio:device0
[    7.752573] driver: 'apds9960': driver_bound: bound to device '4-0039'
[    7.752580] devices_kset: Moving 4-0039 to end of list
[    7.752584] PM: Moving i2c:4-0039 to end of list
[    7.752588] devices_kset: Moving iio:device0 to end of list
[    7.752591] PM: Moving iio:iio:device0 to end of list

[   58.703133] [DBGMSG] pca954x_irq_handler :entering pca954x_irq_handler
[   58.703975] [DBGMSG] pca954x_irq_handler :i2c_smbus_read::retval=0x14
[   58.710540] [DBGMSG] pca954x_irq_handler :i=0x0 | bit: 0x4 isset in register = true
[   58.710543] [DBGMSG] pca954x_irq_handler :irq= 0x65 / child_irq =0xE7
[   58.724634] [DBGMSG] handle_nested_irq :entering handle_nested_irq
[   58.724637] [DBGMSG] handle_nested_irq :irq: 0xE7
[   58.724640] [DBGMSG] handle_nested_irq :irq_desc->name: null
[   58.724642] [DBGMSG] handle_nested_irq :irq_desc->parent_irq: 0x00
[   58.724645] [DBGMSG] handle_nested_irq :irqd_irq_disabled: true
[   58.724645] [DBGMSG] handle_nested_irq :action: false or null
[   58.724647] [DBGMSG] handle_nested_irq :result of (unlikely(!action || irqd_irq_disabled(&desc->irq_data))) : true
[   58.724649] [DBGMSG] handle_nested_irq :goto out_unlock
[   58.724651] [DBGMSG] handle_nested_irq :leaving handler
[   58.724654] [DBGMSG] pca954x_irq_handler :leaving pca954x_irq_handler




root@testsystem:~# cat /proc/interrupts 
           CPU0       CPU1       CPU2       CPU3       

 95:          0          0          0          0  gpio-mxc   0 Edge      apds9960_event
101:          1          0          0          0  gpio-mxc   6 Edge      pca954x


Regards,
Ralf Rademacher


Von: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Gesendet: Freitag, 10. Februar 2023 11:57
An: Rademacher Ralf
Cc: linux-i2c@vger.kernel.org
Betreff: #Extern_Re: AW: #Extern_Re: question about devicetree entry pca954x
    
Warnung: Achtung - Diese E-Mail stammt von einer externen Quelle. Seien Sie vorsichtig mit Links und Anhängen.

Warning: Attention - This e-mail is from an external source. Be careful with links and attachments.

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
> [   28.830817] [DBGMSG] pca954x_irq_handler :entering pca954x_irq_handler
> [   28.831363] [DBGMSG] pca954x_irq_handler :i2c_smbus_read::retval=14
> [   28.837918] [DBGMSG] pca954x_irq_handler :i=0 | bit: 4 isset in register = true
> [   28.837921] [DBGMSG] pca954x_irq_handler :irq= 0x65 // child_irq =0xe7
> [   28.851527] [DBGMSG] handle_nested_irq :entering handle_nested_irq
> [   28.851542] Call trace:
> [   28.851555]  dump_backtrace+0x0/0x178
> [   28.851561]  show_stack+0x24/0x30
> [   28.889839]  dump_stack+0xb4/0x114
> [   28.893245]  handle_nested_irq+0x44/0x23c
> [   28.897258]  pca954x_irq_handler+0xf4/0x138 [i2c_mux_pca954x]
> [   28.903006]  irq_thread_fn+0x30/0xa0
> [   28.906581]  irq_thread+0x150/0x248
> [   28.910068]  kthread+0x140/0x160
> [   28.913297]  ret_from_fork+0x10/0x1c
> [   28.916901] [DBGMSG] handle_nested_irq :irq: 0xe7
> [   28.916905] [DBGMSG] handle_nested_irq :irq_desc->name: (null)
> [   28.921447] [DBGMSG] handle_nested_irq :irq_desc->parent_irq: 0x0
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
    
