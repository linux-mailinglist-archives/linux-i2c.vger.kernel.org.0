Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E635A382E08
	for <lists+linux-i2c@lfdr.de>; Mon, 17 May 2021 15:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235802AbhEQN4h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 May 2021 09:56:37 -0400
Received: from mga14.intel.com ([192.55.52.115]:57324 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232924AbhEQN4h (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 May 2021 09:56:37 -0400
IronPort-SDR: 50HQd2RBXs2WDefU5PDrLMn3Hfxq2HSE2HS9tiEfiPiKyIczZGr1G8rnKxq4M5Z9+6X9k4pSFO
 +5Th9inZl/1A==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="200158629"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="200158629"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 06:55:20 -0700
IronPort-SDR: fSvTIsGurRYgent6K79/Xss7RZBAXtHTtan8QeTT6bMNbdqDs74os5Lq6si6KvOPFhpRFikhlQ
 bQQOXRAWnvVQ==
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="472415095"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 06:55:19 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lidiH-00CkQX-9r; Mon, 17 May 2021 16:55:17 +0300
Date:   Mon, 17 May 2021 16:55:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v1 1/1] i2c: core: Make debug message even more debuggish
Message-ID: <YKJ1xShXHesBnII+@smile.fi.intel.com>
References: <20210428145751.4934-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210428145751.4934-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 28, 2021 at 05:57:51PM +0300, Andy Shevchenko wrote:
> One may notice that dev_printk(KERN_DEBUG ...) is *not* an equivalent
> to dev_dbg(). It will be printed whenever loglevel is high enough.
> And currently it will be the only message in the I²C core in some
> configurations that got printed under above conditions.
> 
> Moving to dev_dbg() will hide it in the configurations where Dynamic Debug
> is enabled and hence align with all other debug messages in the I²C core..

Wolfram, any comment on this?

-- 
With Best Regards,
Andy Shevchenko


