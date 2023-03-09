Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398796B2717
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 15:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231916AbjCIOhk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 09:37:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbjCIOhD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 09:37:03 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C82EF7EDB;
        Thu,  9 Mar 2023 06:36:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 83592B81F64;
        Thu,  9 Mar 2023 14:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D55C433D2;
        Thu,  9 Mar 2023 14:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678372607;
        bh=cv3mRrc0sgN9ywJSYCA+9wt3Wst1MMWKr0adp0O6Ytc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZnlJg+V+FlDZKUMZYNweebr4HU0P3ux8UprrorgPpU/iAGltdDeYk9lMEx3iqcRGP
         OUWFc608w3PwiGVkEHqS7I+izSZOsSYFmdNrE1VVOPPb0+M33frIdVQ59kW0087Wkw
         e/cJZzKSgKNWX4426M5uYZxVpGj2NQg37Zzep5Rg=
Date:   Thu, 9 Mar 2023 15:36:44 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Oliver Neukum <oneukum@suse.com>,
        Ye Xiang <xiang.ye@intel.com>, Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
        wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v4 2/5] gpio: Add support for Intel LJCA USB GPIO driver
Message-ID: <ZAnu/GlpS32BgmqG@kroah.com>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-3-xiang.ye@intel.com>
 <2865f3d0-428b-0df1-fc50-f6af3cb9dac3@suse.com>
 <ZAnku01goVDCuNM+@smile.fi.intel.com>
 <CACRpkdYQfT=JXvmjKR_9O74H2dmwx1EF4QjCHM6fKAetpbrMOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYQfT=JXvmjKR_9O74H2dmwx1EF4QjCHM6fKAetpbrMOg@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 09, 2023 at 03:18:53PM +0100, Linus Walleij wrote:
> On Thu, Mar 9, 2023 at 2:53 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Mar 09, 2023 at 02:40:10PM +0100, Oliver Neukum wrote:
> > > On 09.03.23 08:10, Ye Xiang wrote:
> > >
> > > > +#define LJCA_GPIO_BUF_SIZE 60
> > > > +struct ljca_gpio_dev {
> > > > +   struct platform_device *pdev;
> > > > +   struct gpio_chip gc;
> > > > +   struct ljca_gpio_info *gpio_info;
> > > > +   DECLARE_BITMAP(unmasked_irqs, LJCA_MAX_GPIO_NUM);
> > > > +   DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
> > > > +   DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
> > > > +   u8 *connect_mode;
> > > > +   /* mutex to protect irq bus */
> > > > +   struct mutex irq_lock;
> > > > +   struct work_struct work;
> > > > +   /* lock to protect package transfer to Hardware */
> > > > +   struct mutex trans_lock;
> > > > +
> > > > +   u8 obuf[LJCA_GPIO_BUF_SIZE];
> > > > +   u8 ibuf[LJCA_GPIO_BUF_SIZE];
> > >
> > > And here we have a violation of DMA coherency rules.
> > > Basically you cannot embed buffers into other data structures
> > > if they can be subject to DMA.
> >
> > Huh?!
> >
> > The problem here is alignment. But other than that I can't see the issue with
> > embedding into structures the instances of which will be allocated on the heap.
> 
> Yups. And I think the solution looks something like this:
> 
> u8 obuf[LJCA_GPIO_BUF_SIZE] __aligned(8);
> u8 ibuf[LJCA_GPIO_BUF_SIZE] __aligned(8);
> 
> __aligned(4) if it's 32bit DMA I guess? 8 always works that's
> why we use it all over the IIO subsystem.

To make it all simple, just make obuf and ibuf pointers to the data you
allocate with a call to kmalloc().

thanks,

greg k-h
