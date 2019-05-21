Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 226A12566E
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 19:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbfEURQv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 13:16:51 -0400
Received: from mga12.intel.com ([192.55.52.136]:32068 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727898AbfEURQv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 13:16:51 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 May 2019 10:16:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,495,1549958400"; 
   d="scan'208";a="174089577"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga002.fm.intel.com with ESMTP; 21 May 2019 10:16:48 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hT8Nb-0001m7-WF; Tue, 21 May 2019 20:16:48 +0300
Date:   Tue, 21 May 2019 20:16:47 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     wsa@the-dreams.de, mika.westerberg@linux.intel.com,
        jarkko.nikula@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com, jbroadus@gmail.com,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 2/5] i2c: acpi: Use available IRQ helper functions
Message-ID: <20190521171647.GM9224@smile.fi.intel.com>
References: <20190521150502.27305-1-ckeepax@opensource.cirrus.com>
 <20190521150502.27305-3-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521150502.27305-3-ckeepax@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 21, 2019 at 04:04:59PM +0100, Charles Keepax wrote:
> Use the available IRQ helper functions, most of the functions have
> additional helpful side affects like configuring the trigger type of the
> IRQ.

More logical to me is to do this as a first patch in the series.
Besides that, I would really split it into two:
- exporting helper;
- using it.

-- 
With Best Regards,
Andy Shevchenko


