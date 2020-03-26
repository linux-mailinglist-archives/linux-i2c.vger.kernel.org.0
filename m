Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6BD193DC3
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 12:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbgCZLQe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 07:16:34 -0400
Received: from mga14.intel.com ([192.55.52.115]:46569 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727688AbgCZLQe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 07:16:34 -0400
IronPort-SDR: e3VbePad0nW/e8dEObwaoQFs7tUT6Op1T9D0PpBC1b5fgdTBotJPYmHSEEaY0WMij3uE16xA0L
 JQKvxaKk/7cQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 04:16:34 -0700
IronPort-SDR: 5pfhECZ6Nxh72iWXLJEwEXaPfH6xptg85128w4PSREmlSgIhXeW9aQp2rQWd/qEE+gX9O1icjZ
 v1Y+URlohs0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,308,1580803200"; 
   d="scan'208";a="247515749"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 26 Mar 2020 04:16:32 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jHQV1-00D6Iq-4v; Thu, 26 Mar 2020 13:16:35 +0200
Date:   Thu, 26 Mar 2020 13:16:35 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH] i2c: refactor parsing of timings
Message-ID: <20200326111635.GO1922688@smile.fi.intel.com>
References: <20200326101647.1756-1-wsa+renesas@sang-engineering.com>
 <20200326104701.GM1922688@smile.fi.intel.com>
 <20200326110042.GB1538@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326110042.GB1538@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 26, 2020 at 12:00:42PM +0100, Wolfram Sang wrote:
> 
> > However, looking into the code, I would go a bit further (perhaps as a separate
> > change) and export parsing of clock-frequency, because tons of drivers only
> > need one property, i.e. clock-frequency out of firmware.
> 
> Cool idea. Could be easily something like this (typed from the top of my
> head):
> 
> static inline u32 i2c_parse_fw_bus_speed(struct device *dev)
> {
> 	u32 speed;
> 
> 	i2c_parse_timing(dev, "clock-frequency", &speed, I2C_MAX_STANDARD_MODE_FREQ, true);
> 
> 	return speed;
> }

Yes, looks like this, thanks!

-- 
With Best Regards,
Andy Shevchenko


