Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 747C17000AC
	for <lists+linux-i2c@lfdr.de>; Fri, 12 May 2023 08:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240127AbjELGjQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 May 2023 02:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240123AbjELGjQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 May 2023 02:39:16 -0400
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451BAD2DB;
        Thu, 11 May 2023 23:39:09 -0700 (PDT)
X-QQ-mid: Yeas54t1683873496t612t58675
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [125.119.253.217])
X-QQ-SSF: 00400000000000F0FNF000000000000
From:   =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 15562655820059693255
To:     "'Andrew Lunn'" <andrew@lunn.ch>
Cc:     <netdev@vger.kernel.org>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <Jose.Abreu@synopsys.com>, <hkallweit1@gmail.com>,
        <linux@armlinux.org.uk>, <linux-i2c@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <mengyuanlou@net-swift.com>
References: <20230509022734.148970-1-jiawenwu@trustnetic.com> <20230509022734.148970-7-jiawenwu@trustnetic.com> <ab8852ce-72e8-4d5b-8c88-772a6c9f1485@lunn.ch>
In-Reply-To: <ab8852ce-72e8-4d5b-8c88-772a6c9f1485@lunn.ch>
Subject: RE: [PATCH net-next v7 6/9] net: txgbe: Support GPIO to SFP socket
Date:   Fri, 12 May 2023 14:38:15 +0800
Message-ID: <019201d9849c$54e88730$feb99590$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJdw4zS3rpHMobUlf9gBLGLbLpYXQGeWQPmAvTOeO2uKNBTkA==
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

On Thursday, May 11, 2023 8:32 PM, Andrew Lunn wrote:
> > +static int txgbe_gpio_get(struct gpio_chip *chip, unsigned int
> > +offset) {
> > +	struct wx *wx = gpiochip_get_data(chip);
> > +	struct txgbe *txgbe = wx->priv;
> > +	int val;
> > +
> > +	val = rd32m(wx, WX_GPIO_EXT, BIT(offset));
> > +
> > +	txgbe->gpio_orig &= ~BIT(offset);
> > +	txgbe->gpio_orig |= val;
> > +
> > +	return !!(val & BIT(offset));
> > +}
> 
> > +static void txgbe_irq_handler(struct irq_desc *desc) {
> > +	struct irq_chip *chip = irq_desc_get_chip(desc);
> > +	struct wx *wx = irq_desc_get_handler_data(desc);
> > +	struct txgbe *txgbe = wx->priv;
> > +	irq_hw_number_t hwirq;
> > +	unsigned long gpioirq;
> > +	struct gpio_chip *gc;
> > +	u32 gpio;
> > +
> > +	chained_irq_enter(chip, desc);
> > +
> > +	gpioirq = rd32(wx, WX_GPIO_INTSTATUS);
> > +
> > +	/* workaround for hysteretic gpio interrupts */
> > +	gpio = rd32(wx, WX_GPIO_EXT);
> > +	if (!gpioirq)
> > +		gpioirq = txgbe->gpio_orig ^ gpio;
> 
> Please could you expand on the comment. Are you saying that
> WX_GPIO_INTSTATUS sometimes does not contain the GPIO which caused the
> interrupt? If so, you then compare the last gpio_get with the current value and
> assume that is what caused the interrupt?

Yes. Sometime there is a lag in WX_GPIO_INTSTATUS. When the GPIO interrupt
cause,  the GPIO state has been back to its previous state. So I added this
workaround to save some...but only if there are other interrupts at the same
time, i.e. txgbe_irq_handler() called.

But I will remove it in the next version, because I find a more accurate solution.

> 
> > +
> > +	gc = txgbe->gpio;
> > +	for_each_set_bit(hwirq, &gpioirq, gc->ngpio)
> > +		generic_handle_domain_irq(gc->irq.domain, hwirq);
> > +
> > +	chained_irq_exit(chip, desc);
> > +
> > +	/* unmask interrupt */
> > +	if (netif_running(wx->netdev))
> > +		wx_intr_enable(wx, TXGBE_INTR_MISC(wx));
> 
> Is that a hardware requirement, that interrupts only work when the interface is
> running? Interrupts are not normally conditional like this, at least when the SoC
> provides the GPIO controller.

Should we handle the interrupts when interface is not running?


