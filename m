Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 700BD35A81
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 12:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfFEKgg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 06:36:36 -0400
Received: from mga06.intel.com ([134.134.136.31]:10804 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727309AbfFEKgg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Jun 2019 06:36:36 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Jun 2019 03:36:35 -0700
X-ExtLoop1: 1
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga008.jf.intel.com with ESMTP; 05 Jun 2019 03:36:33 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hYTHV-0001TD-8j; Wed, 05 Jun 2019 13:36:33 +0300
Date:   Wed, 5 Jun 2019 13:36:33 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v3] i2c: mux/i801: Switch to use descriptor passing
Message-ID: <20190605103633.GV9224@smile.fi.intel.com>
References: <20190603220819.31701-1-linus.walleij@linaro.org>
 <e992bb50-cedc-74c0-cecd-8cac37ecaf69@axentia.se>
 <20190604224316.slrrlinhzngdan5o@mobilestation>
 <ee06c942-ad3d-b45b-f067-bbc988595733@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee06c942-ad3d-b45b-f067-bbc988595733@axentia.se>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 05, 2019 at 08:15:35AM +0000, Peter Rosin wrote:
> On 2019-06-05 00:43, Serge Semin wrote:
> > On Tue, Jun 04, 2019 at 09:06:22PM +0000, Peter Rosin wrote:
> >> On 2019-06-04 00:08, Linus Walleij wrote:

> > 2. My patchset splits platform_data-based and OF-based code up, which improves the
> > i2c-mux-gpio driver readability. Linus' patch doesn't provide the same way of
> > simplification, but no doubt simplify the code a bit.
> 
> So, I had a closer look, and yes, your patches do split up the of and
> plat code. But is this the right approach? The only user of the plat
> interface is the i2c-i801 driver (and I would really like for the
> plat interface to just go away). Linus' approach seem (to at least
> attempt) to consolidate the plat and of code paths so that the
> i2c-mux-gpio code can ignore the platform interface and only
> work with the gpiod interface. I like that.

I second the idea of drop legacy platform data support.

-- 
With Best Regards,
Andy Shevchenko


