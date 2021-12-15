Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE0DA475A2C
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 14:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237695AbhLON7v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 08:59:51 -0500
Received: from mga01.intel.com ([192.55.52.88]:59541 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234687AbhLON7v (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Dec 2021 08:59:51 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="263380945"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="263380945"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 05:59:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="545583808"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 05:59:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mxUnn-006clc-Nj;
        Wed, 15 Dec 2021 15:58:39 +0200
Date:   Wed, 15 Dec 2021 15:58:39 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 1/6] i2c: designware-pci: Use temporary variable for
 struct device
Message-ID: <Ybn0jwp1uIsjkOAM@smile.fi.intel.com>
References: <20211213180034.30929-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213180034.30929-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 13, 2021 at 08:00:29PM +0200, Andy Shevchenko wrote:
> Use temporary variable for struct device to make code neater.

Jarkko, thanks for review, but I have to postpone this and UCSI series
due to lack of time. It seems it requires more work than I expected.
Feel free to incorporate individual patches to your own submissions
regarding to this driver.

-- 
With Best Regards,
Andy Shevchenko


