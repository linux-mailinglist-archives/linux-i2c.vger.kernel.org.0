Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3FFD70D3B3
	for <lists+linux-i2c@lfdr.de>; Tue, 23 May 2023 08:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235053AbjEWGOP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 May 2023 02:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235026AbjEWGOM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 May 2023 02:14:12 -0400
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25AB5130;
        Mon, 22 May 2023 23:14:01 -0700 (PDT)
X-QQ-mid: Yeas53t1684822370t593t46247
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [122.235.247.1])
X-QQ-SSF: 00400000000000F0FNF000000000000
From:   =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 4582806537518009441
To:     "'Andrew Lunn'" <andrew@lunn.ch>,
        "'Michael Walle'" <michael@walle.cc>,
        "'Andy Shevchenko'" <andy.shevchenko@gmail.com>
Cc:     <netdev@vger.kernel.org>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <Jose.Abreu@synopsys.com>, <hkallweit1@gmail.com>,
        <linux@armlinux.org.uk>, <linux-i2c@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <mengyuanlou@net-swift.com>
References: <20230515063200.301026-1-jiawenwu@trustnetic.com> <20230515063200.301026-7-jiawenwu@trustnetic.com> <ZGH-fRzbGd_eCASk@surfacebook> <00cd01d9879f$8e444950$aaccdbf0$@trustnetic.com> <CAHp75VdthEZL6GvT5Q=f7rbcDfA5XX=7-VLfVz1kZmBFem_eCA@mail.gmail.com> <016701d9886a$f9b415a0$ed1c40e0$@trustnetic.com> <90ef7fb8-feac-4288-98e9-6e67cd38cdf1@lunn.ch> <025b01d9897e$d8894660$899bd320$@trustnetic.com> <1e1615b3-566c-490c-8b1a-78f5521ca0b0@lunn.ch> <028601d989f9$230ee120$692ca360$@trustnetic.com> <f0b571ab-544b-49c3-948f-d592f931673b@lunn.ch> <005a01d98c8b$e48d2b60$ada78220$@trustnetic.com>
In-Reply-To: <005a01d98c8b$e48d2b60$ada78220$@trustnetic.com>
Subject: RE: [PATCH net-next v8 6/9] net: txgbe: Support GPIO to SFP socket
Date:   Tue, 23 May 2023 14:12:49 +0800
Message-ID: <011c01d98d3d$99e6c6e0$cdb454a0$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHvj8QD3pC+6Aq9H9h6P1+q5LrHRgMH5FTyAkITzAABJU2Y7wJ7xjhgAYjDQqsBr+FHUgDJ87o1AYTHtNcC/cxtnwIXsv+OAc8FI2CukHcOoA==
Content-Language: zh-cn
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FROM_EXCESS_BASE64,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> > > > If you are getting errors when removing the driver it means you are
> > > > missing some level of undoing what us done in probe. Are you sure
> > > > regmap_del_irq_chip() is being called on unload?
> > >
> > > I used devm_* all when I registered them.
> >
> > Look at the ordering. Is regmap_del_irq_chip() being called too late?
> > I've had problems like this with the mv88e6xxx driver and its
> > interrupt controllers. I ended up not using devm_ so i had full
> > control over the order things got undone. In that case, the external
> > devices was PHYs, with the PHY interrupt being inside the Ethernet
> > switch, which i exposed using a Linux interrupt controller.
> 
> I use no devm_ functions to add regmap irq chip, register gpio regmap,
> and call their del/unregister functions at the position corresponding to
> release. irq_domain_remove() call trace still exist.
> 
> [  104.553182] Call Trace:
> [  104.553184]  <TASK>
> [  104.553185]  irq_domain_remove+0x2b/0xe0
> [  104.553190]  regmap_del_irq_chip.part.0+0x8a/0x160
> [  104.553196]  txgbe_remove_phy+0x57/0x80 [txgbe]
> [  104.553201]  txgbe_remove+0x2a/0x90 [txgbe]
> [  104.553205]  pci_device_remove+0x36/0xa0
> [  104.553208]  device_release_driver_internal+0xaa/0x140
> [  104.553213]  driver_detach+0x44/0x90
> [  104.553215]  bus_remove_driver+0x69/0xf0
> [  104.553217]  pci_unregister_driver+0x29/0xb0
> [  104.553220]  __x64_sys_delete_module+0x145/0x240
> [  104.553223]  ? exit_to_user_mode_prepare+0x3c/0x1a0
> [  104.553226]  do_syscall_64+0x3b/0x90
> [  104.553230]  entry_SYSCALL_64_after_hwframe+0x72/0xdc

I think this problem is caused by a conflict calling of irq_domain_remove()
between the two functions gpiochip_irqchip_remove() and regmap_del_irq_chip().
The front one is called by gpio_regmap_unregister().

I adjusted the order of release functions, regmap_del_irq_chip() first, then
gpio_regmap_unregister(). Log became:

[  383.261168] Call Trace:
[  383.261169]  <TASK>
[  383.261170]  irq_domain_remove+0x2b/0xe0
[  383.261174]  gpiochip_irqchip_remove+0xf0/0x210
[  383.261177]  gpiochip_remove+0x4a/0x110
[  383.261181]  gpio_regmap_unregister+0x12/0x20 [gpio_regmap]
[  383.261186]  txgbe_remove_phy+0x57/0x80 [txgbe]
[  383.261190]  txgbe_remove+0x2a/0x90 [txgbe]

irq_domain_remove() just free the memory of irq_domain, but its pointer address
still exists. So it will be called twice.


