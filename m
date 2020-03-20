Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44EA218D44A
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Mar 2020 17:23:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbgCTQX0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Mar 2020 12:23:26 -0400
Received: from mga07.intel.com ([134.134.136.100]:4028 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727151AbgCTQX0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 20 Mar 2020 12:23:26 -0400
IronPort-SDR: 9BxctjwABzZfOCpg5scIPpMmuzwJaEUF8qbjz7xD87V1u38UCsL1hXcIG8acZdmvvulPyqba3H
 b6t7uvFDB7jA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2020 09:23:26 -0700
IronPort-SDR: g5LVtE4OZ3pywpKSX6Lxgy6+NZWG6rhqONRbuf/kqaP4ZxzrleNLULmJPH7GAarY4kgoqhG1j6
 DLqYM599GcaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,285,1580803200"; 
   d="scan'208";a="392201158"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 20 Mar 2020 09:23:24 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jFKQg-00BVKI-F6; Fri, 20 Mar 2020 18:23:26 +0200
Date:   Fri, 20 Mar 2020 18:23:26 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 2/6] i2c: core: Allow override timing properties with 0
Message-ID: <20200320162326.GD1922688@smile.fi.intel.com>
References: <20200316154929.20886-1-andriy.shevchenko@linux.intel.com>
 <20200316154929.20886-2-andriy.shevchenko@linux.intel.com>
 <20200320144357.GA1282@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320144357.GA1282@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 20, 2020 at 03:43:57PM +0100, Wolfram Sang wrote:
> 
> > +	struct i2c_timings i2c_t = {0};
> 
> Simply '... = { }'?

I prefer C standard over GCC extension.

-- 
With Best Regards,
Andy Shevchenko


