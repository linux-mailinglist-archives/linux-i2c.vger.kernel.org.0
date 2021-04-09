Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39BBC359C2F
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Apr 2021 12:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232965AbhDIKgi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Apr 2021 06:36:38 -0400
Received: from mga18.intel.com ([134.134.136.126]:53503 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232796AbhDIKgh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 9 Apr 2021 06:36:37 -0400
IronPort-SDR: Cu/14eqW35xcxHW8mwSBXtM4BwskmQBbeKL5Pp7Elp4ouZ0QHH9/zQb900XClUrS92Cj6HX3e5
 mXa8H+iLRy4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="181268901"
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="181268901"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 03:36:24 -0700
IronPort-SDR: JUN6OsiiL7YlLceFG2CwMSggCHYJg4I7zhEqbvonH8wtObAJzul8wB5aan5WA3Ioiut/M9gssH
 TOuNQnH8X8PQ==
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="520238000"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 03:36:20 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lUoUr-002Vbk-Qc; Fri, 09 Apr 2021 13:36:17 +0300
Date:   Fri, 9 Apr 2021 13:36:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Yicong Yang <yangyicong@hisilicon.com>,
        linux-i2c@vger.kernel.org, Sergey.Semin@baikalelectronics.ru,
        linux-kernel@vger.kernel.org, digetx@gmail.com, treding@nvidia.com,
        jarkko.nikula@linux.intel.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        mika.westerberg@linux.intel.com, prime.zeng@huawei.com,
        linuxarm@huawei.com
Subject: Re: [PATCH v7 2/5] i2c: core: add api to provide frequency mode
 strings
Message-ID: <YHAuIdwKMjZuDmXU@smile.fi.intel.com>
References: <1617880641-664-1-git-send-email-yangyicong@hisilicon.com>
 <1617880641-664-3-git-send-email-yangyicong@hisilicon.com>
 <20210408205551.GD1900@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408205551.GD1900@kunai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 08, 2021 at 10:55:51PM +0200, Wolfram Sang wrote:
> 
> > +const char *i2c_freq_mode_string(u32 bus_freq_hz)
> > +{
> > +	switch (bus_freq_hz) {
> > +	case I2C_MAX_STANDARD_MODE_FREQ:
> > +		return "Standard Mode (100 kHz)";
> 
> Sorry, I just noticed just now. Shouldn't we also support lower
> frequencies than the maximum one? I.e.
> 
> 	if (bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ)
>  		return "Standard Mode (max 100 kHz)";
> 	else if (bus_freq_hz <= ... )
> 
> ?

Can we add this later if needed?
Because in such case additionally printing bus_freq_hz will be fine, no?

But putting max to each frequency representation in the list of strings sounds
good to me.


-- 
With Best Regards,
Andy Shevchenko


