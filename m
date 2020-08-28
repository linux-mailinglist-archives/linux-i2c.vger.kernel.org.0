Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF4F255D49
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Aug 2020 17:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgH1PFA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Aug 2020 11:05:00 -0400
Received: from mga05.intel.com ([192.55.52.43]:57521 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726197AbgH1PE7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Aug 2020 11:04:59 -0400
IronPort-SDR: p7sfbRPNmj84KYrSgWHDw2zzpY/ZTjMIo5VqQOWT1J3l/DCQC8J3iyxsp85Lr8ynn99UisQDvp
 pugGdg54nSZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="241493276"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; 
   d="scan'208";a="241493276"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2020 08:04:52 -0700
IronPort-SDR: 6et0OiDMIzv1MUGplu4+aXGbkV/iNLTsXtcNIG9Y/3UagwSzcrXW8tNGxvdjGQXqLRLOkzdZHq
 4ofqV1g0Dcvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; 
   d="scan'208";a="329977446"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 28 Aug 2020 08:04:50 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kBftn-00C93p-CX; Fri, 28 Aug 2020 18:02:39 +0300
Date:   Fri, 28 Aug 2020 18:02:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v1] i2c: ismt: Add support for Intel Emmitsburg PCH
Message-ID: <20200828150239.GU1891694@smile.fi.intel.com>
References: <20200615161001.12817-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615161001.12817-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 15, 2020 at 07:10:01PM +0300, Andy Shevchenko wrote:
> Add PCI ID for the Intel Emmitsburg PCH iSMT SMBus controller.

Seth, Neil, any tag for this?
Wolfram, this is an ID and I don't think silence from maintainers prevent us to
add it. What do you think?

-- 
With Best Regards,
Andy Shevchenko


