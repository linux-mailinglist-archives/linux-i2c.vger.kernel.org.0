Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4822735E386
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 18:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbhDMQLf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 12:11:35 -0400
Received: from mga18.intel.com ([134.134.136.126]:63683 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229688AbhDMQLf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 12:11:35 -0400
IronPort-SDR: +xQa/0wutpQD1JR6BbOYvJ8KbTWK+K9UdLd9IO4L3259UOaVvqqpjxi1VynkAKBkNmKjblqBQ/
 NTDR3illgmwg==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="181960433"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="181960433"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 09:06:16 -0700
IronPort-SDR: cgWWa0iz+VLdT3WVostn4jI8FnE6X6OWhiKPmCp+UKaqb2qQIrNhYMaOH9DDrFl4eAen4qgeVk
 6yL76JmciwDA==
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="383356826"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 09:06:13 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lWLYI-003niG-0z; Tue, 13 Apr 2021 19:06:10 +0300
Date:   Tue, 13 Apr 2021 19:06:10 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 0/2] mfd: =?iso-8859-1?Q?int?=
 =?iso-8859-1?Q?el=5Fquark=5Fi2c=5Fgpio=3A_Covert_I=B2?= =?iso-8859-1?Q?C?=
 part to software nodes
Message-ID: <YHXBcljcZM/RTURY@smile.fi.intel.com>
References: <20210331154851.8456-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210331154851.8456-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 31, 2021 at 06:48:49PM +0300, Andy Shevchenko wrote:
> Since we have software nodes support in MFD core, we may start converting
> intel_quark_i2c_gpio driver to use it. For the starter it converts I²C part.
> and as a result we get rid of platform data for I²C DesignWare driver.
> 
> This series depends on the stuff in MFD. OTOH the DesignWare patch should not
> be in conflict with other patches floating around (against I²C DesignWare
> driver). In any case I guess the procedure is pretty much standard, i.e. Lee
> creates an immutable branch that Wolfram can pull into his tree.

Lee, can you, please, apply this series?
It seems we have all Acked by respective maintainer(s).

> Andy Shevchenko (2):
>   mfd: intel_quark_i2c_gpio: Convert I²C to use software nodes
>   i2c: designware: Get rid of legacy platform data
> 
>  drivers/i2c/busses/i2c-designware-platdrv.c  |  7 +---
>  drivers/mfd/intel_quark_i2c_gpio.c           | 41 +++++++++++++-------
>  include/linux/platform_data/i2c-designware.h | 13 -------
>  3 files changed, 27 insertions(+), 34 deletions(-)
>  delete mode 100644 include/linux/platform_data/i2c-designware.h
> 
> -- 
> 2.30.2
> 

-- 
With Best Regards,
Andy Shevchenko


