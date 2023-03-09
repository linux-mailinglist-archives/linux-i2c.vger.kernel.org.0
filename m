Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2B2B6B25EF
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 14:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbjCINxt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 08:53:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231349AbjCINxN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 08:53:13 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E04B279B6;
        Thu,  9 Mar 2023 05:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678369990; x=1709905990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xtyjN8N9CskNv1W3i/7qlrqnVRGswKQxahZF51RSw/o=;
  b=REBcnK/vDj3VUR318TA/nI0ax7pbSNpMjFvUWNCpiaMX0s30PGJ46B3/
   GVHH+3XL8flhLImG6rDLyeHOqrpTTVlGT982oARHzCIb/2BSKA87O7a6R
   XfwedHPE6RFMd/WGWxzFJJl6hGvbpacJZxEgVbV94gN+qakifrw0cnhlo
   DqXqNaBh3B4ycPTw5YA5l3HYrIjL3cF3kXNPz6CgbZBRy1ItjQZQjkkSr
   J3d5mN0SXhLWVDhibhEW3Zkwzqhf44I3Zkn94FVKCoa1ahmC2xF9q2DHg
   +HFEX1iroEfpKs7ktw9/OaFXxQmU3gVrr2fFsShdeXCLaZKx7t4On4QhJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="422716867"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="422716867"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 05:53:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="707616466"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="707616466"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 09 Mar 2023 05:53:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1paGhY-000Lat-0T;
        Thu, 09 Mar 2023 15:53:00 +0200
Date:   Thu, 9 Mar 2023 15:52:59 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Ye Xiang <xiang.ye@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Message-ID: <ZAnku01goVDCuNM+@smile.fi.intel.com>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-3-xiang.ye@intel.com>
 <2865f3d0-428b-0df1-fc50-f6af3cb9dac3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2865f3d0-428b-0df1-fc50-f6af3cb9dac3@suse.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 09, 2023 at 02:40:10PM +0100, Oliver Neukum wrote:
> On 09.03.23 08:10, Ye Xiang wrote:
> 
> > +#define LJCA_GPIO_BUF_SIZE 60
> > +struct ljca_gpio_dev {
> > +	struct platform_device *pdev;
> > +	struct gpio_chip gc;
> > +	struct ljca_gpio_info *gpio_info;
> > +	DECLARE_BITMAP(unmasked_irqs, LJCA_MAX_GPIO_NUM);
> > +	DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
> > +	DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
> > +	u8 *connect_mode;
> > +	/* mutex to protect irq bus */
> > +	struct mutex irq_lock;
> > +	struct work_struct work;
> > +	/* lock to protect package transfer to Hardware */
> > +	struct mutex trans_lock;
> > +
> > +	u8 obuf[LJCA_GPIO_BUF_SIZE];
> > +	u8 ibuf[LJCA_GPIO_BUF_SIZE];
> 
> And here we have a violation of DMA coherency rules.
> Basically you cannot embed buffers into other data structures
> if they can be subject to DMA.

Huh?!

The problem here is alignment. But other than that I can't see the issue with
embedding into structures the instances of which will be allocated on the heap.

-- 
With Best Regards,
Andy Shevchenko


