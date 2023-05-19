Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0C86708DC5
	for <lists+linux-i2c@lfdr.de>; Fri, 19 May 2023 04:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjESC0a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 May 2023 22:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjESC0a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 May 2023 22:26:30 -0400
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60991E4A;
        Thu, 18 May 2023 19:26:24 -0700 (PDT)
X-QQ-mid: Yeas5t1684463112t045t22887
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [115.200.228.151])
X-QQ-SSF: 00400000000000F0FNF000000000000
From:   =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 16046267783000829659
To:     "'Andrew Lunn'" <andrew@lunn.ch>
Cc:     "'Andy Shevchenko'" <andy.shevchenko@gmail.com>,
        <netdev@vger.kernel.org>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <Jose.Abreu@synopsys.com>, <hkallweit1@gmail.com>,
        <linux@armlinux.org.uk>, <linux-i2c@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <mengyuanlou@net-swift.com>
References: <20230515063200.301026-1-jiawenwu@trustnetic.com> <20230515063200.301026-7-jiawenwu@trustnetic.com> <ZGH-fRzbGd_eCASk@surfacebook> <00cd01d9879f$8e444950$aaccdbf0$@trustnetic.com> <CAHp75VdthEZL6GvT5Q=f7rbcDfA5XX=7-VLfVz1kZmBFem_eCA@mail.gmail.com> <016701d9886a$f9b415a0$ed1c40e0$@trustnetic.com> <90ef7fb8-feac-4288-98e9-6e67cd38cdf1@lunn.ch> <025b01d9897e$d8894660$899bd320$@trustnetic.com> <1e1615b3-566c-490c-8b1a-78f5521ca0b0@lunn.ch>
In-Reply-To: <1e1615b3-566c-490c-8b1a-78f5521ca0b0@lunn.ch>
Subject: RE: [PATCH net-next v8 6/9] net: txgbe: Support GPIO to SFP socket
Date:   Fri, 19 May 2023 10:25:11 +0800
Message-ID: <028601d989f9$230ee120$692ca360$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQHvj8QD3pC+6Aq9H9h6P1+q5LrHRgMH5FTyAkITzAABJU2Y7wJ7xjhgAYjDQqsBr+FHUgDJ87o1AYTHtNeuwTkbsA==
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



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Thursday, May 18, 2023 8:49 PM
> To: Jiawen Wu <jiawenwu@trustnetic.com>
> Cc: 'Andy Shevchenko' <andy.shevchenko@gmail.com>; netdev@vger.kernel.org; jarkko.nikula@linux.intel.com;
> andriy.shevchenko@linux.intel.com; mika.westerberg@linux.intel.com; jsd@semihalf.com; Jose.Abreu@synopsys.com;
> hkallweit1@gmail.com; linux@armlinux.org.uk; linux-i2c@vger.kernel.org; linux-gpio@vger.kernel.org; mengyuanlou@net-swift.com
> Subject: Re: [PATCH net-next v8 6/9] net: txgbe: Support GPIO to SFP socket
> 
> > > I _think_ you are mixing upstream IRQs and downstream IRQs.
> > >
> > > Interrupts are arranged in trees. The CPU itself only has one or two
> > > interrupts. e.g. for ARM you have FIQ and IRQ. When the CPU gets an
> > > interrupt, you look in the interrupt controller to see what external
> > > or internal interrupt triggered the CPU interrupt. And that interrupt
> > > controller might indicate the interrupt came from another interrupt
> > > controller. Hence the tree structure. And each node in the tree is
> > > considered an interrupt domain.
> > >
> > > A GPIO controller can also be an interrupt controller. It has an
> > > upstream interrupt, going to the controller above it. And it has
> > > downstream interrupts, the GPIO lines coming into it which can cause
> > > an interrupt. And the GPIO interrupt controller is a domain.
> > >
> > > So what exactly does gpio_regmap_config.irq_domain mean? Is it the
> > > domain of the upstream interrupt controller? Is it an empty domain
> > > structure to be used by the GPIO interrupt controller? It is very
> > > unlikely to have anything to do with the SFP devices below it.
> >
> > Sorry, since I don't know much about interrupt,  it is difficult to understand
> > regmap-irq in a short time. There are many questions about regmap-irq.
> >
> > When I want to add an IRQ chip for regmap, for the further irq_domain,
> > I need to pass a parameter of IRQ, and this IRQ will be requested with handler:
> > regmap_irq_thread(). Which IRQ does it mean?
> 
> That is your upstream IRQ, the interrupt indicating one of your GPIO
> lines has changed state.
> 
> > In the previous code of using
> > devm_gpiochip_add_data(), I set the MSI-X interrupt as gpio-irq's parent, but
> > it was used to set chained handler only. Should the parent be this IRQ? I found
> > the error with irq_free_descs and irq_domain_remove when I remove txgbe.ko.
> 
> Do you have one MSI-X dedicated for GPIOs. Or is it your general MAC
> interrupt, and you need to read an interrupt controller register to
> determine it was GPIOs which triggered the interrupt?

I have one MSI-X interrupt for all general MAC interrupt (see TXGBE_PX_MISC_IEN_MASK).
It has 32 bits to indicate various interrupts, GPIOs are the one of them. When GPIO
interrupt is determined, GPIO_INT_STATUS register should be read to determine
which GPIO line has changed state.

> If you are getting errors when removing the driver it means you are
> missing some level of undoing what us done in probe. Are you sure
> regmap_del_irq_chip() is being called on unload?

I used devm_* all when I registered them.

> > As you said, the interrupt of each tree node has its domain. Can I understand
> > that there are two layer in the interrupt tree for MSI-X and GPIOs, and requesting
> > them separately is not conflicting? Although I thought so, but after I implement
> > gpio-regmap, SFP driver even could not find gpio_desc. Maybe I missed something
> > on registering gpio-regmap...
> 
> That is probably some sort of naming issue. You might want to add some
> prints in swnode_find_gpio() and gpiochip_find() to see what it is
> looking for vs what the name actually is.

Thanks for the advice, I'll try again today.

