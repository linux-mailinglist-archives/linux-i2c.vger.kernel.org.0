Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07DE7192771
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Mar 2020 12:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbgCYLp2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Mar 2020 07:45:28 -0400
Received: from mga17.intel.com ([192.55.52.151]:52302 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726313AbgCYLp2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 25 Mar 2020 07:45:28 -0400
IronPort-SDR: SSQCXVZTQoGTTgtIergnhl8vLsAhsyKIiqHbhcE0UXVfcGDMT7xO1zYn/y9efJIhHwQD64MH90
 E5D6+JGyTM/g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2020 04:45:28 -0700
IronPort-SDR: OSzoowj66qDfrFrPJMR2bQE1On/mvQ2xGiNjuZaMTUyvaZir6eL4PCU21dBKvxohuq34NySs1a
 +4aheidMzaaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="238501662"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 25 Mar 2020 04:45:26 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jH4TR-00Co9H-J4; Wed, 25 Mar 2020 13:45:29 +0200
Date:   Wed, 25 Mar 2020 13:45:29 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v1 1/2] i2c: designware: Make master module optional
Message-ID: <20200325114529.GU1922688@smile.fi.intel.com>
References: <20200323100451.28808-1-andriy.shevchenko@linux.intel.com>
 <c3d2d5ff-605a-bdb7-275b-872fdfd10ccd@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3d2d5ff-605a-bdb7-275b-872fdfd10ccd@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 25, 2020 at 09:47:47AM +0200, Jarkko Nikula wrote:
> On 3/23/20 12:04 PM, Andy Shevchenko wrote:
> > In some cases we know that the controller will be always used in slave mode and
> > master is just a bulk. In order to drop that, introduce a separate configuration
> > parameter for master mode. Default it to core to avoid regressions.

> I think we should go to a opposite direction - reduce the number of
> I2C_DESIGNWARE_ config options rather than add new ones. We already have 5
> config options for it.
> 
> Size of i2c-designware-core.ko is around 12 kB with all master, slave and
> Baytrail semaphore code built in so I don't think it justifies the added
> config complexity. I think distributions will have anyway all of those
> options set.

I would rather go with conditional based on I²C generic options, like I2C_SLAVE.
Do we have something similar for master?

> Having those code in separate modules and load only when needed might make
> sense as that would save a few kB of RAM.

...which makes sense for embedded systems where exactly the device represents
I²C slave.

-- 
With Best Regards,
Andy Shevchenko


