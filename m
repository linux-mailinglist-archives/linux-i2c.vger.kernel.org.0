Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF84A3E94D2
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 17:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233364AbhHKPoQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 11:44:16 -0400
Received: from mga05.intel.com ([192.55.52.43]:55438 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233350AbhHKPoQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 11:44:16 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="300734698"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="300734698"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 08:43:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="590134580"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 08:43:51 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mDqOQ-008BvL-24; Wed, 11 Aug 2021 18:43:46 +0300
Date:   Wed, 11 Aug 2021 18:43:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 2/9] i2c: i801: make p2sb_spinlock a mutex
Message-ID: <YRPwMkQFLWfpTULY@smile.fi.intel.com>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <90aee333-6490-db08-01ae-c0de1e18368a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90aee333-6490-db08-01ae-c0de1e18368a@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 06, 2021 at 11:13:29PM +0200, Heiner Kallweit wrote:
> p2sb_spinlock is used in i801_add_tco_spt() only, and in process context
> only. Therefore a mutex is sufficient, and we can make the definition
> local to i801_add_tco_spt().

The problem with either AFAICT is that it should actually hold PCI rescan lock.
See the discussion with Message-ID
20210308122020.57071-1-andriy.shevchenko@linux.intel.com for the details.

-- 
With Best Regards,
Andy Shevchenko


