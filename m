Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30CB61E4892
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 17:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390364AbgE0PxY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 11:53:24 -0400
Received: from mga02.intel.com ([134.134.136.20]:18233 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730681AbgE0Pwk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 11:52:40 -0400
IronPort-SDR: 2PmsTAisMn82Rly0A7ZkBfdS8Qmx0dzj7UdC7KTSbbRIQeQZvZvmZkAbhh1/XaFK1Cjd4gNrZN
 B1ptQ9kMo98w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 08:52:39 -0700
IronPort-SDR: 6YhWIySeoBxP4RHsRtDP4kdHvHlwrWX91anzrnOVHK/y5q7DzF2CnJFga66qMCQf60brEM38t5
 0uDaifa1ajXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; 
   d="scan'208";a="442571050"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 27 May 2020 08:52:36 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdyMB-009Fql-2r; Wed, 27 May 2020 18:52:39 +0300
Date:   Wed, 27 May 2020 18:52:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/11] i2c: designware: Add Baikal-T1 System I2C
 support
Message-ID: <20200527155239.GI1634618@smile.fi.intel.com>
References: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
 <20200527120111.5781-12-Sergey.Semin@baikalelectronics.ru>
 <20200527140303.GC1634618@smile.fi.intel.com>
 <20200527150431.z25aibkn6edplneh@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527150431.z25aibkn6edplneh@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 06:04:31PM +0300, Serge Semin wrote:
> On Wed, May 27, 2020 at 05:03:03PM +0300, Andy Shevchenko wrote:
> > On Wed, May 27, 2020 at 03:01:11PM +0300, Serge Semin wrote:

...

> > > +static struct regmap_config bt1_i2c_cfg = {
> > > +	.reg_bits = 32,
> > > +	.val_bits = 32,
> > > +	.reg_stride = 4,
> > > +	.fast_io = true,
> > > +	.reg_read = bt1_i2c_read,
> > > +	.reg_write = bt1_i2c_write,
> > > +	.max_register = DW_IC_COMP_TYPE

And perhaps add a comma?

> > > +};

-- 
With Best Regards,
Andy Shevchenko


