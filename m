Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C77493541E2
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Apr 2021 13:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235091AbhDELzQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Apr 2021 07:55:16 -0400
Received: from mga18.intel.com ([134.134.136.126]:3197 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233778AbhDELzP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Apr 2021 07:55:15 -0400
IronPort-SDR: 8OKhLOOrVILWGUlPpnk79x9SOfr6O8ZFC/3Jthdy1FmuDf8g6mg22RswVlYZrkNACtI/vfgQV4
 rvshMRSyEmBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9944"; a="180369817"
X-IronPort-AV: E=Sophos;i="5.81,306,1610438400"; 
   d="scan'208";a="180369817"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2021 04:55:09 -0700
IronPort-SDR: lvCz5YQ3hu6F1EWnO35gp0ow77sH81xKQI7b+ZXGY+9LY1hKA8E9c62igLvEGcFyW7H+qMMKva
 f0JQkS2Z9n0w==
X-IronPort-AV: E=Sophos;i="5.81,306,1610438400"; 
   d="scan'208";a="395785573"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2021 04:55:07 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lTNou-001Pml-E5; Mon, 05 Apr 2021 14:55:04 +0300
Date:   Mon, 5 Apr 2021 14:55:04 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        yangyicong <yangyicong@huawei.com>
Subject: Re: [PATCH v1 1/1] i2c: designware: Adjust bus_freq_hz when refuse
 high speed mode set
Message-ID: <YGr6mGz+DZ5y8eNA@smile.fi.intel.com>
References: <20210331110510.67523-1-andriy.shevchenko@linux.intel.com>
 <07b6264280314d919f2747290bb80b01@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07b6264280314d919f2747290bb80b01@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 31, 2021 at 09:37:41PM +0000, Song Bao Hua (Barry Song) wrote:
> > From: Andy Shevchenko [mailto:andriy.shevchenko@linux.intel.com]
> > Sent: Thursday, April 1, 2021 12:05 AM
> > To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>; Serge Semin
> > <Sergey.Semin@baikalelectronics.ru>; linux-i2c@vger.kernel.org;
> > linux-kernel@vger.kernel.org

...

> > Fixes: b6e67145f149 ("i2c: designware: Enable high speed mode")
> > Reported-by: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thanks for fixing that.
> 
> Reviewed-by: Barry Song <song.bao.hua@hisilicon.com>

Thanks!
Wolfram, can be this applied for v5.12-rc7?

-- 
With Best Regards,
Andy Shevchenko


