Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 300C3356912
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 12:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346591AbhDGKId (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 06:08:33 -0400
Received: from mga14.intel.com ([192.55.52.115]:17651 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350779AbhDGKIa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 7 Apr 2021 06:08:30 -0400
IronPort-SDR: 1fzvL/0U7EtzTDKbCWj4vLw++H+LkFEQfeeOAjiU6MGg4uILnIcU76T6Bv1J9t8CT0vhuYN18p
 H8DWFh88HM5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="192814496"
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; 
   d="scan'208";a="192814496"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2021 03:08:18 -0700
IronPort-SDR: gT6+aDFfU1Bgz1CRtrbrf+lOr9DXJ8IKMm8iqu/Lkhh5JP1qpt2Penz4DMR1OC9o5j9wfnOpfY
 DVe710Ab8Tvw==
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; 
   d="scan'208";a="598297243"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2021 03:08:15 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lU56a-001yx0-7S; Wed, 07 Apr 2021 13:08:12 +0300
Date:   Wed, 7 Apr 2021 13:08:12 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org,
        digetx@gmail.com, treding@nvidia.com,
        jarkko.nikula@linux.intel.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        mika.westerberg@linux.intel.com, prime.zeng@huawei.com,
        linuxarm@huawei.com
Subject: Re: [PATCH v6 2/5] i2c: core: add api to provide frequency mode
 strings
Message-ID: <YG2EjHuMb92mX5G5@smile.fi.intel.com>
References: <1617197790-30627-1-git-send-email-yangyicong@hisilicon.com>
 <1617197790-30627-3-git-send-email-yangyicong@hisilicon.com>
 <20210406195414.GG3122@kunai>
 <0d48f447-d1f2-1c86-27f4-3c8b23dcaf30@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d48f447-d1f2-1c86-27f4-3c8b23dcaf30@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 07, 2021 at 04:29:29PM +0800, Yicong Yang wrote:
> On 2021/4/7 3:54, Wolfram Sang wrote:
> > 
> >> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> >> index 10bd0b0..7268180 100644
> >> --- a/include/linux/i2c.h
> >> +++ b/include/linux/i2c.h
> >> @@ -47,6 +47,26 @@ typedef int (*i2c_slave_cb_t)(struct i2c_client *client,
> >>  #define I2C_MAX_HIGH_SPEED_MODE_FREQ	3400000
> >>  #define I2C_MAX_ULTRA_FAST_MODE_FREQ	5000000
> >>  
> >> +static inline const char *i2c_freq_mode_string(u32 bus_freq_hz)
> >> +{
> >> +	switch (bus_freq_hz) {
> >> +	case I2C_MAX_STANDARD_MODE_FREQ:
> >> +		return "Standard Mode (100 kHz)";
> >> +	case I2C_MAX_FAST_MODE_FREQ:
> >> +		return "Fast Mode (400 kHz)";
> >> +	case I2C_MAX_FAST_MODE_PLUS_FREQ:
> >> +		return "Fast Mode Plus (1.0 MHz)";
> >> +	case I2C_MAX_TURBO_MODE_FREQ:
> >> +		return "Turbo Mode (1.4 MHz)";
> >> +	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
> >> +		return "High Speed Mode (3.4 MHz)";
> >> +	case I2C_MAX_ULTRA_FAST_MODE_FREQ:
> >> +		return "Ultra Fast Mode (5.0 MHz)";
> >> +	default:
> >> +		return "Unknown Mode";
> >> +	}
> >> +}
> > 
> > Any reason ehy this is an inline function? My gut feeling says it would
> > be better added to the core?
> > 
> 
> it's not a complicated function so i didn't think it'll make much difference,
> so i just put it in the header along with the coresponding macro definitions.
> do you want me to move it to the core?

I guess exporting will save few dozens of bytes if the function is used more
than once. (All strings will be duplicated or multiplied in that case)

-- 
With Best Regards,
Andy Shevchenko


