Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 372C9700320
	for <lists+linux-i2c@lfdr.de>; Fri, 12 May 2023 10:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240276AbjELI6q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 May 2023 04:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240273AbjELI6h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 May 2023 04:58:37 -0400
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D454D10E67;
        Fri, 12 May 2023 01:58:32 -0700 (PDT)
X-QQ-mid: Yeas3t1683881853t174t45976
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [125.119.253.217])
X-QQ-SSF: 00400000000000F0FNF000000000000
From:   =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 2705097927430388980
To:     <andy.shevchenko@gmail.com>
Cc:     <netdev@vger.kernel.org>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <Jose.Abreu@synopsys.com>, <andrew@lunn.ch>,
        <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <linux-i2c@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <mengyuanlou@net-swift.com>
References: <20230509022734.148970-1-jiawenwu@trustnetic.com> <20230509022734.148970-7-jiawenwu@trustnetic.com> <ZF1T62BnVFgR33w0@surfacebook>
In-Reply-To: <ZF1T62BnVFgR33w0@surfacebook>
Subject: RE: [PATCH net-next v7 6/9] net: txgbe: Support GPIO to SFP socket
Date:   Fri, 12 May 2023 16:57:32 +0800
Message-ID: <000001d984af$c9bc89e0$5d359da0$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQJdw4zS3rpHMobUlf9gBLGLbLpYXQGeWQPmAYIr88uuNK3a0A==
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FROM_EXCESS_BASE64,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> > +static int txgbe_gpio_direction_out(struct gpio_chip *chip, unsigned int offset,
> > +				    int val)
> > +{
> > +	struct wx *wx = gpiochip_get_data(chip);
> > +	u32 mask;
> > +
> > +	mask = BIT(offset) | BIT(offset - 1);
> > +	if (val)
> > +		wr32m(wx, WX_GPIO_DR, mask, mask);
> > +	else
> > +		wr32m(wx, WX_GPIO_DR, mask, 0);
> > +
> > +	wr32m(wx, WX_GPIO_DDR, BIT(offset), BIT(offset));
> 
> Can you explain, what prevents to have this flow to be interleaved by other API
> calls, like ->direction_in()? Didn't you missed proper locking schema?

It's true, I should add spinlock for writing GPIO registers.

> 
> > +	return 0;
> > +}
> 
> ...
> 
> > +	switch (type) {
> > +	case IRQ_TYPE_EDGE_BOTH:
> > +		level |= BIT(hwirq);
> > +		break;
> > +	case IRQ_TYPE_EDGE_RISING:
> > +		level |= BIT(hwirq);
> > +		polarity |= BIT(hwirq);
> > +		break;
> > +	case IRQ_TYPE_EDGE_FALLING:
> > +		level |= BIT(hwirq);
> 
> > +		polarity &= ~BIT(hwirq);
> 
> This...
> 
> > +		break;
> > +	case IRQ_TYPE_LEVEL_HIGH:
> > +		level &= ~BIT(hwirq);
> 
> ...and this can be done outside of the switch-case. Then you simply set certain
> bits where it's needed.
> 
> > +		polarity |= BIT(hwirq);
> > +		break;
> > +	case IRQ_TYPE_LEVEL_LOW:
> > +		level &= ~BIT(hwirq);
> > +		polarity &= ~BIT(hwirq);
> > +		break;
> 
> default?

Do you mean that treat IRQ_TYPE_LEVEL_LOW as default case, clear level and
polarity firstly, then set the bits in other needed case? 


