Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0FA92E9755
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Jan 2021 15:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbhADOdr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Jan 2021 09:33:47 -0500
Received: from mga11.intel.com ([192.55.52.93]:10796 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725921AbhADOdr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 4 Jan 2021 09:33:47 -0500
IronPort-SDR: JK2C9YBUp9iwxNmJJ4GwP02ew2+81lKqEN9pE+0Fz9EYbGGGdlmot7fGl2TKKP1op+1VCeJ7qO
 vrMcKEkzhVIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9853"; a="173451606"
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; 
   d="scan'208";a="173451606"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 06:32:01 -0800
IronPort-SDR: Uix+D27Pg0YlT2piB9iohvrmtx02tsYjTiY+txbZH4Q0drNlZCS3MTQGuvtxJSLXQHlcDvlXP1
 RKTi4+BvnRkQ==
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; 
   d="scan'208";a="397420166"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 06:31:59 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kwQus-001b3F-0h; Mon, 04 Jan 2021 16:33:02 +0200
Date:   Mon, 4 Jan 2021 16:33:02 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v1 1/3] gpiolib: Follow usual pattern for
 gpiod_remove_lookup_table() call
Message-ID: <20210104143302.GZ4077@smile.fi.intel.com>
References: <20201228200618.58716-1-andriy.shevchenko@linux.intel.com>
 <CAMpxmJUM-6p_V5c6y+7kzhx92V1qEYC5xNS_PNDLcQYTOzHA2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJUM-6p_V5c6y+7kzhx92V1qEYC5xNS_PNDLcQYTOzHA2A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 04, 2021 at 03:24:47PM +0100, Bartosz Golaszewski wrote:
> On Mon, Dec 28, 2020 at 9:06 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > The usual pattern for the remove calls, like gpiod_remove_lookup_table(),
> > is to be NULL-aware, i.o.w. become a no-op whenever parameter is NULL.
> > Update gpiod_remove_lookup_table() call to follow this pattern.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/gpio/gpiolib.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index b02cc2abd3b6..611d6ea82d75 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -3460,6 +3460,10 @@ EXPORT_SYMBOL_GPL(gpiod_add_lookup_table);
> >   */
> >  void gpiod_remove_lookup_table(struct gpiod_lookup_table *table)
> >  {
> > +       /* Nothing to remove */
> > +       if (!table)
> > +               return;
> > +
> >         mutex_lock(&gpio_lookup_lock);
> >
> >         list_del(&table->list);
> > --
> > 2.29.2
> >
> 
> Applied, thanks!

Thanks. Though I think it can be also applied to I²C tree since dependency?
Any tags / immutable branch for Wolfram?

-- 
With Best Regards,
Andy Shevchenko


