Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75A734885A
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 18:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfFQQIN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 12:08:13 -0400
Received: from mga09.intel.com ([134.134.136.24]:39197 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726028AbfFQQIN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 Jun 2019 12:08:13 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jun 2019 09:08:12 -0700
X-ExtLoop1: 1
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2019 09:08:11 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hcuB0-0007W1-Jn; Mon, 17 Jun 2019 19:08:10 +0300
Date:   Mon, 17 Jun 2019 19:08:10 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v1 2/3] i2c: i801: Use match_string() helper to simplify
 the code
Message-ID: <20190617160810.GG9224@smile.fi.intel.com>
References: <20190613164529.63482-1-andriy.shevchenko@linux.intel.com>
 <20190613164529.63482-2-andriy.shevchenko@linux.intel.com>
 <20190617161644.781a1940@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617161644.781a1940@endymion>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 17, 2019 at 04:16:44PM +0200, Jean Delvare wrote:
> On Thu, 13 Jun 2019 19:45:28 +0300, Andy Shevchenko wrote:
> > match_string() returns the array index of a matching string.
> > Use it instead of the open-coded implementation.
> 
> Nice, I didn't know about this utility function.
> 
> Don't we need to include <linux/string.h> though? Or is it another
> undocumented exception?

Here it is a nice catch! I will update.

-- 
With Best Regards,
Andy Shevchenko


