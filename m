Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30ABD34FE2B
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 12:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235014AbhCaKhL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 06:37:11 -0400
Received: from mga01.intel.com ([192.55.52.88]:52359 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235008AbhCaKhL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 06:37:11 -0400
IronPort-SDR: HULCGkifXHuM7sfrHYjtpnHVJ7cblpFYN9oSjha7pFhA2uyhlbnCLrL3ga8+TulAAtUJjGICYK
 eqGOfDx1q2tw==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="212214523"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="212214523"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 03:37:10 -0700
IronPort-SDR: 9F+ResvEgMQiDlMStCWq+OExbElArCl/HcSa8WaKojl1qgzlcOw9V7M+guWm1LjkZ8i/3hu4a9
 fD8a9acslRNw==
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="527720046"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 03:37:05 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lRYDe-00HZzX-H8; Wed, 31 Mar 2021 13:37:02 +0300
Date:   Wed, 31 Mar 2021 13:37:02 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org,
        digetx@gmail.com, treding@nvidia.com,
        jarkko.nikula@linux.intel.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        mika.westerberg@linux.intel.com, prime.zeng@huawei.com,
        linuxarm@huawei.com
Subject: Re: [PATCH 5/5] i2c: designware: Switch over to
 i2c_freq_mode_string()
Message-ID: <YGRQzoifaWcYrt8k@smile.fi.intel.com>
References: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
 <1617113966-40498-6-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617113966-40498-6-git-send-email-yangyicong@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 30, 2021 at 10:19:26PM +0800, Yicong Yang wrote:
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Use generic i2c_freq_mode_string() helper to print chosen bus speed.

Since it will be a new version (based on Jarkko's comments), I guess you may
add his Ack here that he gave against standalone submission of this patch.

What Bary reported I will fix separately.

-- 
With Best Regards,
Andy Shevchenko


