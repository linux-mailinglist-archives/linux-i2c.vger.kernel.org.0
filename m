Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 361A260E143
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Oct 2022 14:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbiJZM4P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Oct 2022 08:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233367AbiJZM4O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Oct 2022 08:56:14 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3DEFDAC6B
        for <linux-i2c@vger.kernel.org>; Wed, 26 Oct 2022 05:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666788973; x=1698324973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kyhpUikuGFLHKo2ioFMlMZ//ZaX8FD0v5Vs7erLnsms=;
  b=NhWOjYjSk7omqp+jErxRS4r0iTFUx5im7M5FvZPmotJqVp1Rapnl5EIf
   5QLgrpqwq5GnuNw46e+DARuhEl8i7fw7Gs2BYzEmEGrG7wdl57uP+Z2hK
   M+FPA0xZkxYo2STu4SB6TliX+R5RnE3VOH38Qr6nKTpxt085zVg4KIjvt
   7suksGBp531oMGYk349VYl4R/xovB+dwLBbvPE/YVEhW6RCKOdhjvD864
   Apsq2GQZsIQOlHu8yp+UkkQK5KexWZ+i5t3v9uA8ycPQSJ5ZNzOTJk3nH
   cc8X1Esn1RqB5WBxQcyp5sjE6Me0XdYLVF5EbUt/2SRGEmouDXNxgpZuN
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="288332731"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="288332731"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 05:56:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="631995118"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="631995118"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 26 Oct 2022 05:56:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1onfx3-002eUo-04;
        Wed, 26 Oct 2022 15:56:09 +0300
Date:   Wed, 26 Oct 2022 15:56:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Luis Oliveira <luis.oliveira@synopsys.com>
Subject: Re: [PATCH 00/11] i2c: designware: Slave fixes and generic cleanups
Message-ID: <Y1kuaJhWugXx3nin@smile.fi.intel.com>
References: <20221026123912.2833271-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026123912.2833271-1-jarkko.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 26, 2022 at 03:39:01PM +0300, Jarkko Nikula wrote:
> Hi
> 
> I discovered recently while doing other cleanups.that reads and writes
> from I2C bus to i2c-designware-slave.c don't work correctly.
> 
> First two patches are fixes to slave code and meant for normal development
> cycle since it looks these issues have been always here.
> 
> I Cc'ed Michael Wu <michael.wu@vatics.com> who has fixed
> i2c-designware-slave.c before and Tian Ye <tianye@sugon.com> who recently
> reported a write issue.
> 
> Could you test first two patches (or the whole set) that my patches won't
> cause regressions to your existing test cases or does the 2nd patch fix
> the write issue?
> 
> Rest of patches are minor changes and cleanups to both master and slave
> parts.

> Patchset is done on top of commit fd142e074e89 ("Merge branch
> 'i2c/for-current-fixed' into i2c/for-next") but may apply on top of
> v6.1-rc1 too.

Side note, using --base in `git-format-patch --cover-letter` will help a lot
(esp. CIs that take it into consideration).

-- 
With Best Regards,
Andy Shevchenko


