Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69146705D89
	for <lists+linux-i2c@lfdr.de>; Wed, 17 May 2023 04:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbjEQC4R convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 16 May 2023 22:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbjEQC4Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 22:56:16 -0400
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C49640F7;
        Tue, 16 May 2023 19:56:13 -0700 (PDT)
X-QQ-mid: Yeas44t1684292102t901t35219
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [115.200.228.151])
X-QQ-SSF: 00400000000000F0FNF000000000000
From:   =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 13198834293515255723
To:     "'Andy Shevchenko'" <andy.shevchenko@gmail.com>
Cc:     <netdev@vger.kernel.org>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <Jose.Abreu@synopsys.com>, <andrew@lunn.ch>,
        <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <linux-i2c@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <mengyuanlou@net-swift.com>
References: <20230515063200.301026-1-jiawenwu@trustnetic.com> <20230515063200.301026-7-jiawenwu@trustnetic.com> <ZGH-fRzbGd_eCASk@surfacebook> <00cd01d9879f$8e444950$aaccdbf0$@trustnetic.com> <CAHp75VdthEZL6GvT5Q=f7rbcDfA5XX=7-VLfVz1kZmBFem_eCA@mail.gmail.com>
In-Reply-To: <CAHp75VdthEZL6GvT5Q=f7rbcDfA5XX=7-VLfVz1kZmBFem_eCA@mail.gmail.com>
Subject: RE: [PATCH net-next v8 6/9] net: txgbe: Support GPIO to SFP socket
Date:   Wed, 17 May 2023 10:55:01 +0800
Message-ID: <016701d9886a$f9b415a0$ed1c40e0$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQHvj8QD3pC+6Aq9H9h6P1+q5LrHRgMH5FTyAkITzAABJU2Y7wJ7xjhgrupZZcA=
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FROM_EXCESS_BASE64,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> > > > +   gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
> > > > +   if (!gc)
> > > > +           return -ENOMEM;
> > > > +
> > > > +   gc->label = devm_kasprintf(dev, GFP_KERNEL, "txgbe_gpio-%x",
> > > > +                              (wx->pdev->bus->number << 8) | wx->pdev->devfn);
> > > > +   gc->base = -1;
> > > > +   gc->ngpio = 6;
> > > > +   gc->owner = THIS_MODULE;
> > > > +   gc->parent = dev;
> > > > +   gc->fwnode = software_node_fwnode(txgbe->nodes.group[SWNODE_GPIO]);
> > >
> > > Looking at the I²C case, I'm wondering if gpio-regmap can be used for this piece.
> >
> > I can access this GPIO region directly, do I really need to use regmap?
> 
> It's not a matter of access, it's a matter of using an existing
> wrapper that will give you already a lot of code done there, i.o.w.
> you don't need to reinvent a wheel.

I took a look at the gpio-regmap code, when I call devm_gpio_regmap_register(),
I should provide gpio_regmap_config.irq_domain if I want to add the gpio_irq_chip.
But in this use, GPIO IRQs are requested by SFP driver. How can I get irq_domain
before SFP probe? And where do I add IRQ parent handler?


