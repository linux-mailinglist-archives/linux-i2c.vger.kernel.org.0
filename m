Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0816E17BF91
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Mar 2020 14:51:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgCFNvf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Mar 2020 08:51:35 -0500
Received: from mga17.intel.com ([192.55.52.151]:41270 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbgCFNvf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Mar 2020 08:51:35 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Mar 2020 05:51:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,522,1574150400"; 
   d="scan'208";a="441945932"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 06 Mar 2020 05:51:32 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jADO2-007NDs-A3; Fri, 06 Mar 2020 15:51:34 +0200
Date:   Fri, 6 Mar 2020 15:51:34 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] i2c: designware: Add Baikal-T1 SoC I2C controller
 support
Message-ID: <20200306135134.GD1748204@smile.fi.intel.com>
References: <20200306131955.12806-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132348.71E638030793@mail.baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306132348.71E638030793@mail.baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 06, 2020 at 04:19:58PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> A third I2C controller embedded into the Baikal-T1 SoC is also fully
> based on the DW APB I2C core, but its registers are indirectly
> accessible via "command/data in/data out" trio. There is no difference
> other than that. So in order to have that controller supported by the
> common DW APB I2C driver we only need to introduce a new flag
> ACCESS_INDIRECT and use the access-registers to reach the I2C controller
> normal registers space in the dw_readl/dw_writel methods. Currently this
> flag is only enabled for the controllers with "be,bt1-i2c" compatible
> string.

See my response to cover letter.

>  drivers/i2c/busses/i2c-designware-common.c  | 79 ++++++++++++++++++---
>  drivers/i2c/busses/i2c-designware-core.h    | 14 ++++
>  drivers/i2c/busses/i2c-designware-master.c  |  1 +
>  drivers/i2c/busses/i2c-designware-platdrv.c |  1 +
>  drivers/i2c/busses/i2c-designware-slave.c   |  1 +

This should be split at least to two patches (preparation in the core followed
by switching users).

-- 
With Best Regards,
Andy Shevchenko


