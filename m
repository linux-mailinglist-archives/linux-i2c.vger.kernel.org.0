Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 361643E90A3
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 14:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237780AbhHKMXq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 08:23:46 -0400
Received: from mga18.intel.com ([134.134.136.126]:35393 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237913AbhHKMXO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 08:23:14 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="202281062"
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
   d="scan'208";a="202281062"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 05:22:47 -0700
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
   d="scan'208";a="445911372"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 05:22:45 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mDnFo-007ord-28; Wed, 11 Aug 2021 15:22:40 +0300
Date:   Wed, 11 Aug 2021 15:22:40 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsa@kernel.org
Subject: Re: [PATCH v3 1/3] units: Add SI metric prefix definitions
Message-ID: <YRPBEMVzQK7AbrSL@smile.fi.intel.com>
References: <20210712142027.22900-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712142027.22900-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 12, 2021 at 05:20:25PM +0300, Andy Shevchenko wrote:
> Sometimes it's useful to have well-defined SI metric prefix to be used
> to self-describe the formulas or equations.
> 
> List most popular ones in the units.h.

Wolfram, can we have this applied or commented? It seems we are going to have
more users of these definitions (I have recently reviewed one of IIO driver
where two of them are in use).


-- 
With Best Regards,
Andy Shevchenko


