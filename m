Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFFF34E964
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 15:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232184AbhC3Njt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 09:39:49 -0400
Received: from mga03.intel.com ([134.134.136.65]:23566 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232066AbhC3NjT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Mar 2021 09:39:19 -0400
IronPort-SDR: PrfpChyIvN36fzQkMK+cLda2BjOdXoH5q3In/spj1n6unQaQDQ+LhlqqDF8LSXJW/dlUFL4wdW
 mjvmulxglI4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="191796410"
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="191796410"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 06:39:11 -0700
IronPort-SDR: ASyF6wG85LHS5Df9Uj2pMmyMtD7Q96EeTc+i7s4DumQBFsZ2wiGwOLjHJynNIKHZfh485veMnD
 X0qwkX6a1ZTw==
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="445133796"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 06:39:08 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lREaH-00HL7g-8Z; Tue, 30 Mar 2021 16:39:05 +0300
Date:   Tue, 30 Mar 2021 16:39:05 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org, digetx@gmail.com,
        treding@nvidia.com, jarkko.nikula@linux.intel.com,
        rmk+kernel@armlinux.org.uk, song.bao.hua@hisilicon.com,
        john.garry@huawei.com, prime.zeng@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH v4 0/4] Add support for HiSilicon I2C controller
Message-ID: <YGMp+X9Ntuc3jd3J@smile.fi.intel.com>
References: <1617109549-4013-1-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617109549-4013-1-git-send-email-yangyicong@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 30, 2021 at 09:05:45PM +0800, Yicong Yang wrote:
> Add driver and MAINTAINERS for HiSilicon I2C controller on Kunpeng SoC. Also
> provide the devm_*() variants for adding the I2C adapters and a public
> api to provide I2C frequency mode strings.
> 
> Change since v3:

> - split the bus mode string api to I2C as suggested by Andy

I have prepared patch to convert i2c designware to use it.
So, feel free to attach to your series in v5.

> - simplify the devm variants and change the export format
> - address the comments of the HiSilicon I2C driver from Andy and Dmitry, thanks!
> Link: https://lore.kernel.org/linux-i2c/1616411413-7177-1-git-send-email-yangyicong@hisilicon.com/
> 
> Change since v2:
> - handle -EPROBE_DEFER case when get irq number by platform_get_irq()
> Link: https://lore.kernel.org/linux-i2c/1615296137-14558-1-git-send-email-yangyicong@hisilicon.com/
> 
> Change since v1:
> - fix compile test error on 32bit arch, reported by intel lkp robot:
>   64 bit division without using kernel wrapper in probe function.
> Link:https://lore.kernel.org/linux-i2c/1615016946-55670-1-git-send-email-yangyicong@hisilicon.com/
> 
> Yicong Yang (4):
>   i2c: core: add managed function for adding i2c adapters
>   i2c: core: add api to provide frequency mode strings
>   i2c: add support for HiSilicon I2C controller
>   MAINTAINERS: Add maintainer for HiSilicon I2C driver
> 
>  MAINTAINERS                   |   7 +
>  drivers/i2c/busses/Kconfig    |  10 +
>  drivers/i2c/busses/Makefile   |   1 +
>  drivers/i2c/busses/i2c-hisi.c | 510 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/i2c/i2c-core-base.c   |  26 +++
>  include/linux/i2c.h           |  21 ++
>  6 files changed, 575 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-hisi.c
> 
> -- 
> 2.8.1
> 

-- 
With Best Regards,
Andy Shevchenko


