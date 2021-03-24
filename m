Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE1F3476C3
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 12:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhCXLFV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 07:05:21 -0400
Received: from mga14.intel.com ([192.55.52.115]:13764 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231546AbhCXLFO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Mar 2021 07:05:14 -0400
IronPort-SDR: /lhXqndxlx9vE4GBtbAaRmPbyC7c6BqzYAW7J8HHwtp2UVM7tvZaTzZ0ID5N+Y1MxqKoRqsbrM
 SHAPoWk26xug==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="190091764"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="190091764"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 04:05:14 -0700
IronPort-SDR: U4/rXhMDc0NZV3AdldCZVVReztUOV/HAIuhXqbnwVhsoCffoESQgKPylKdHaiDf2L0Fh6hftWK
 4t3czdWmsCyQ==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="452550650"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 04:05:11 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lP1K0-00FeGF-C7; Wed, 24 Mar 2021 13:05:08 +0200
Date:   Wed, 24 Mar 2021 13:05:08 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org, digetx@gmail.com,
        treding@nvidia.com, jarkko.nikula@linux.intel.com,
        rmk+kernel@armlinux.org.uk, song.bao.hua@hisilicon.com,
        john.garry@huawei.com, prime.zeng@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH v3 1/3] i2c: core: add managed function for adding i2c
 adapters
Message-ID: <YFsc5PVFbchSNpF4@smile.fi.intel.com>
References: <1616411413-7177-1-git-send-email-yangyicong@hisilicon.com>
 <1616411413-7177-2-git-send-email-yangyicong@hisilicon.com>
 <YFjHVQlbygLljCvp@smile.fi.intel.com>
 <f91c36f4-bcad-ba49-5c30-88c359946f20@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f91c36f4-bcad-ba49-5c30-88c359946f20@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 24, 2021 at 04:26:54PM +0800, Yicong Yang wrote:
> On 2021/3/23 0:35, Andy Shevchenko wrote:
> > On Mon, Mar 22, 2021 at 07:10:11PM +0800, Yicong Yang wrote:
> >> Some I2C controller drivers will only unregister the I2C
> >> adapter in their .remove() callback, which can be done
> >> by simply using a managed variant to add the I2C adapter.
> >>
> >> So add the managed functions for adding the I2C adapter.
> > 
> > ...
> > 
> >> +static void devm_i2c_del_adapter(struct device *dev, void *ptr);
> > 
> > Can we instead of forward declaration simply move below to be after
> > devm_i2c_del_adapter()?
> 
> i just want to put the devm variant near i2c_add_adapter, i'll address
> this if it's unnecessary.

Please, address.

-- 
With Best Regards,
Andy Shevchenko


