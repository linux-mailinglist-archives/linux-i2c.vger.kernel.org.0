Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC11E6BCDBE
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Mar 2023 12:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbjCPLPJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Mar 2023 07:15:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbjCPLPI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Mar 2023 07:15:08 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F4B1AC;
        Thu, 16 Mar 2023 04:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678965307; x=1710501307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yf7ZJaTKSxrkhuNZwjaQtlBE1NFrRCOy0rji0qyweFQ=;
  b=WFQJ0MYyF1ggzRUU+rWumExOSGe+KzkZYeQR7O95rJQ/Fksv8jeC3ux2
   639LHymk/xFTbLPwNjrHvsvvGCakinJdaqRrLHZ4cmOwqIC2dmKHn2Xer
   EAAtn0WTZ90rR3m6Aj5F3g0GPlXL82Fs97tbR4FzTQQkpbPhKIkWTbI3e
   2I6AHFaiuQsW2u0qV4C6PmkW+IoqqhZZ/sHUthePh2wCeNmirv3E0txpo
   NFqGuCrR8WQLV4+6AQa54AEsBstR2cTaBdVdBmHFaeb3G7kQUFfMUFCZc
   ZEUiPqTMpYrI4BtypsTGSegkf3BVNtoqh+vqpPTYKggGTXlcr7MN2hSL2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="339484733"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="339484733"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 04:14:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="748822253"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="748822253"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 16 Mar 2023 04:14:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pclZG-004PrB-0F;
        Thu, 16 Mar 2023 13:14:46 +0200
Date:   Thu, 16 Mar 2023 13:14:45 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        wsa@kernel.org, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH i2c-master] i2c: microchip: pci1xxxx: Update Timing
 registers
Message-ID: <ZBL6JWXKCLsLyNzn@smile.fi.intel.com>
References: <20230316033223.2046359-1-tharunkumar.pasumarthi@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316033223.2046359-1-tharunkumar.pasumarthi@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 16, 2023 at 09:02:23AM +0530, Tharun Kumar P wrote:
> Update I2C timing registers based on latest hardware design.

What about older designs?

> Fixes: 361693697249 ("i2c: microchip: pci1xxxx: Add driver for I2C host controller in multifunction endpoint of pci1xxxx switch")
> 
> Signed-off-by: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>

Blank lines are not allowed in the tag block of the commit messages.

-- 
With Best Regards,
Andy Shevchenko


