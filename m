Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 369C326DC26
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgIQM4U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:56:20 -0400
Received: from mga03.intel.com ([134.134.136.65]:6354 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727179AbgIQM4T (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 17 Sep 2020 08:56:19 -0400
X-Greylist: delayed 517 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 08:56:18 EDT
IronPort-SDR: ENU+rvd2fj0D+le23FdZuw9xJFhRzvQBYAxdC6ep4G3FKKvboan0mpd1kFCzziBYCNHKH5Rkfp
 22jgyhB+3ARQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="159738927"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; 
   d="scan'208";a="159738927"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 05:47:37 -0700
IronPort-SDR: UZvmrhAvKT85vhrcQe42e72CtXVDWzwCMm5Z5JIyJnyyTwPdR87fq+D/dfl+/fD/a//Nli247W
 rvFMUbUJ+OnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; 
   d="scan'208";a="336400715"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 17 Sep 2020 05:47:34 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kItJy-00HKDV-It; Thu, 17 Sep 2020 15:47:30 +0300
Date:   Thu, 17 Sep 2020 15:47:30 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sultan Alsawaf <sultan@kerneltoast.com>
Cc:     linux-i2c@vger.kernel.org, jikos@kernel.org,
        aaron.ma@canonical.com, admin@kryma.net,
        benjamin.tissoires@redhat.com, hdegoede@redhat.com,
        hn.chen@weidahitech.com, jarkko.nikula@linux.intel.com,
        kai.heng.feng@canonical.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com,
        vicamo.yang@canonical.com, wsa@kernel.org
Subject: Re: [PATCH v2 2/4] i2c: designware: Ensure tx_buf_len is nonzero for
 SMBus block reads
Message-ID: <20200917124730.GL3956970@smile.fi.intel.com>
References: <20200917052256.5770-1-sultan@kerneltoast.com>
 <20200917052256.5770-3-sultan@kerneltoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917052256.5770-3-sultan@kerneltoast.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 16, 2020 at 10:22:54PM -0700, Sultan Alsawaf wrote:
> From: Sultan Alsawaf <sultan@kerneltoast.com>
> 
> The point of adding a byte to len in i2c_dw_recv_len() is to make sure
> that tx_buf_len is nonzero, so that i2c_dw_xfer_msg() can let the i2c
> controller know that the i2c transaction can end. Otherwise, the i2c
> controller will think that the transaction can never end for block
> reads, which results in the stop-detection bit never being set and thus
> the transaction timing out.
> 
> Adding a byte to len is not a reliable way to do this though; sometimes
> it lets tx_buf_len become zero, which results in the scenario described
> above. Therefore, just directly ensure tx_buf_len cannot be zero to fix
> the issue.

I got only patch 2/4, where the other 3 along with cover letter?

-- 
With Best Regards,
Andy Shevchenko


