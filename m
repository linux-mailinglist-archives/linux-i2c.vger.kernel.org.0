Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE006B2649
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 15:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbjCIOHp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 09:07:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbjCIOHI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 09:07:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02E05D747;
        Thu,  9 Mar 2023 06:06:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7584C61B5C;
        Thu,  9 Mar 2023 14:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5766AC433EF;
        Thu,  9 Mar 2023 14:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678370774;
        bh=HukZ+ILxzTnCQfpiikli+vpJ+j7QZXr1rOExU9Cd028=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A7w0BiKmJDFqnf6FXNmD0HW/rcBRaXuGdvtl/atJt2ssNfdcEieJ5YyfIALm53wLC
         cgIMAHNHnbHvWfY9g6zZcHICQFsiHvDJNq2sx9TcWl8DAjgCrjnWA/G/jIKMfspZiI
         PrIOXv6CaBrI25isoxOuosC+ZtG82vx0B9SKkWpM=
Date:   Thu, 9 Mar 2023 15:06:11 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Oliver Neukum <oneukum@suse.com>, Ye Xiang <xiang.ye@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
        wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v4 2/5] gpio: Add support for Intel LJCA USB GPIO driver
Message-ID: <ZAnn07XEqxeV8Bpq@kroah.com>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-3-xiang.ye@intel.com>
 <2865f3d0-428b-0df1-fc50-f6af3cb9dac3@suse.com>
 <ZAnku01goVDCuNM+@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAnku01goVDCuNM+@smile.fi.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 09, 2023 at 03:52:59PM +0200, Andy Shevchenko wrote:
> On Thu, Mar 09, 2023 at 02:40:10PM +0100, Oliver Neukum wrote:
> > On 09.03.23 08:10, Ye Xiang wrote:
> > 
> > > +#define LJCA_GPIO_BUF_SIZE 60
> > > +struct ljca_gpio_dev {
> > > +	struct platform_device *pdev;
> > > +	struct gpio_chip gc;
> > > +	struct ljca_gpio_info *gpio_info;
> > > +	DECLARE_BITMAP(unmasked_irqs, LJCA_MAX_GPIO_NUM);
> > > +	DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
> > > +	DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
> > > +	u8 *connect_mode;
> > > +	/* mutex to protect irq bus */
> > > +	struct mutex irq_lock;
> > > +	struct work_struct work;
> > > +	/* lock to protect package transfer to Hardware */
> > > +	struct mutex trans_lock;
> > > +
> > > +	u8 obuf[LJCA_GPIO_BUF_SIZE];
> > > +	u8 ibuf[LJCA_GPIO_BUF_SIZE];
> > 
> > And here we have a violation of DMA coherency rules.
> > Basically you cannot embed buffers into other data structures
> > if they can be subject to DMA.
> 
> Huh?!
> 
> The problem here is alignment. But other than that I can't see the issue with
> embedding into structures the instances of which will be allocated on the heap.

As you said, the problem is alignment.
