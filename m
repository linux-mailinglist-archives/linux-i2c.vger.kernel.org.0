Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 343F43476EB
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 12:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232347AbhCXLQv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 07:16:51 -0400
Received: from mga17.intel.com ([192.55.52.151]:20263 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232239AbhCXLQq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Mar 2021 07:16:46 -0400
IronPort-SDR: EVGn+vzF2qdPSjRi6c2LcIShfxXd8Tmp+SEQ/AY7P/kxLJRh4Vc01ijdHKtkxfBRU1l4KuPfPU
 57QKQjzRBHqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="170656594"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="170656594"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 04:16:46 -0700
IronPort-SDR: 5FkzPh59ZIQerq+UR1XzVTQMrDCJlpxrG3QhVno3R2m3ws3cHmi/LqqkjWy88U1gXTKoCjUnSB
 xLf15oSrCh2Q==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="452553659"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 04:16:41 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lP1V8-00FeRb-SI; Wed, 24 Mar 2021 13:16:38 +0200
Date:   Wed, 24 Mar 2021 13:16:38 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org, digetx@gmail.com,
        treding@nvidia.com, jarkko.nikula@linux.intel.com,
        rmk+kernel@armlinux.org.uk, song.bao.hua@hisilicon.com,
        john.garry@huawei.com, prime.zeng@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH v3 2/3] i2c: add support for HiSilicon I2C controller
Message-ID: <YFsfljiMwvlz8aNn@smile.fi.intel.com>
References: <1616411413-7177-1-git-send-email-yangyicong@hisilicon.com>
 <1616411413-7177-3-git-send-email-yangyicong@hisilicon.com>
 <YFjOLTpe7fYvE9C1@smile.fi.intel.com>
 <439bfa6f-139a-ee5b-d8c7-324e5084ecb3@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <439bfa6f-139a-ee5b-d8c7-324e5084ecb3@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 24, 2021 at 06:21:36PM +0800, Yicong Yang wrote:
> On 2021/3/23 1:04, Andy Shevchenko wrote:
> > On Mon, Mar 22, 2021 at 07:10:12PM +0800, Yicong Yang wrote:

...

> >> +static const char *hisi_i2c_speed_string(u32 bus_freq_hz)
> >> +{
> >> +	switch (bus_freq_hz) {
> >> +	case I2C_MAX_STANDARD_MODE_FREQ:
> >> +		return "100K";
> >> +	case I2C_MAX_FAST_MODE_FREQ:
> >> +		return "400K";
> >> +	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
> >> +		return "3.4M";
> >> +	default:
> >> +		return "unknown";
> >> +	}
> >> +}
> > 
> > Just realized that if you print the name of the mode (and maybe frequency
> > value) then it can be moved to generic I²C code and other will benefit out of
> > this (DesignWare is the first in my mind).
> 
> sure, that's good. but the i2c core doesn't make use of the speed mode
> information so maybe print of this information is rather driver depended.

Yes, but it's useful. And since we will have at least two users of this it is a
good justification to use I²C core to keep and provide this API.

-- 
With Best Regards,
Andy Shevchenko


