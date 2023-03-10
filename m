Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 270016B37CC
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Mar 2023 08:53:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjCJHxT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Mar 2023 02:53:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbjCJHxR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Mar 2023 02:53:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B432A9BA;
        Thu,  9 Mar 2023 23:53:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BB74CB821CF;
        Fri, 10 Mar 2023 07:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023D7C433D2;
        Fri, 10 Mar 2023 07:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678434793;
        bh=9+QnbrppRJUwYF5GQ0ybibMT/QYcq+oKbMtLdejGYtw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bMC/euHR3lJgI/9XAsPmsikWdtsw7K6Acm68qQcRF105K4vwO660CvWNSph8rTWWM
         908+o8hbQsIOh158ciTspUwYqA02OhIBFs/4Zn/dvwKeJsOLC96ZUwYtFdjb1aKUL7
         jjNAfj7/L6iPoUFPvCHM2D9cQouWrHimGHkbBx5I=
Date:   Fri, 10 Mar 2023 08:53:10 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Ye, Xiang" <xiang.ye@intel.com>
Cc:     Oliver Neukum <oneukum@suse.com>, Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v4 2/5] gpio: Add support for Intel LJCA USB GPIO driver
Message-ID: <ZArh5iMkdj0L9AXZ@kroah.com>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-3-xiang.ye@intel.com>
 <2865f3d0-428b-0df1-fc50-f6af3cb9dac3@suse.com>
 <ZAqyhXt9nNIE9Ej7@ye-NUC7i7DNHE>
 <ZArYCD0r6n0sJ7LI@kroah.com>
 <ZArem5MwWrgOY2nJ@ye-NUC7i7DNHE>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZArem5MwWrgOY2nJ@ye-NUC7i7DNHE>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 10, 2023 at 03:39:07PM +0800, Ye, Xiang wrote:
> On Fri, Mar 10, 2023 at 08:11:04AM +0100, Greg Kroah-Hartman wrote:
> > On Fri, Mar 10, 2023 at 01:01:11PM +0800, Ye, Xiang wrote:
> > > On Thu, Mar 09, 2023 at 02:40:10PM +0100, Oliver Neukum wrote:
> > > > 
> > > > 
> > > > On 09.03.23 08:10, Ye Xiang wrote:
> > > > 
> > > > > +#define LJCA_GPIO_BUF_SIZE 60
> > > > > +struct ljca_gpio_dev {
> > > > > +	struct platform_device *pdev;
> > > > > +	struct gpio_chip gc;
> > > > > +	struct ljca_gpio_info *gpio_info;
> > > > > +	DECLARE_BITMAP(unmasked_irqs, LJCA_MAX_GPIO_NUM);
> > > > > +	DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
> > > > > +	DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
> > > > > +	u8 *connect_mode;
> > > > > +	/* mutex to protect irq bus */
> > > > > +	struct mutex irq_lock;
> > > > > +	struct work_struct work;
> > > > > +	/* lock to protect package transfer to Hardware */
> > > > > +	struct mutex trans_lock;
> > > > > +
> > > > > +	u8 obuf[LJCA_GPIO_BUF_SIZE];
> > > > > +	u8 ibuf[LJCA_GPIO_BUF_SIZE];
> > > > 
> > > > And here we have a violation of DMA coherency rules.
> > > > Basically you cannot embed buffers into other data structures
> > > > if they can be subject to DMA.
> > > But obuf and ibuf does not used to do DMA transfer here.
> > > It is actually copied from or to ljca buffer to do URB transfer.
> > 
> > urb transfers _ARE_ DMA transfers.
> > 
> > > Should it still need to follow the DMA coherency rules?
> > 
> > Yes, all buffers for USB urbs are required to follow those rules.
> But these two buffers are not used to do USB urb transfer directly.
> For the "u8 obuf[LJCA_GPIO_BUF_SIZE]",  it will be copied to ljca buffer
> ("header->data" as below code [1] showed) first. Then the "header" is used
> to do the actual urb transfer.
> 
> And the "header" is allocated by using kmalloc. It should has met the DMA
> coherency rules.
> 
> [1] """
> struct ljca_msg *header;
> ...
> header = kmalloc(msg_len, GFP_KERNEL);
> if (!header)
> 	return -ENOMEM;

Ok, that's good, but why have 2 buffers for this then?

thanks,

greg k-h
