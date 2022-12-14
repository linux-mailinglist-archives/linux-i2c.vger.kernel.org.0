Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55EA364C851
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Dec 2022 12:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238154AbiLNLpI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Dec 2022 06:45:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238282AbiLNLox (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Dec 2022 06:44:53 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8404D20F5A;
        Wed, 14 Dec 2022 03:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671018292; x=1702554292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bLTygroHr1awOhjJHORd5gWEa2Lf7PhYZ+JxJ4mtm4w=;
  b=gtcliDlXi8LPBvoLQMzrNyLE53HJuVEm2q2XuUM4GfoAc2TjBY+1tJ4W
   CsraLQ6HssatmF8T+yAyctdZI7u0UFRBi3flbE9a07G6xJtabCVE9kY12
   He+4R1dqdf2u47OlQHJ9EOZr4bq/4aQ60YXHz0TWP7jF7OXXnrEjtd+Cf
   lxU2z/500yqUDZ3tix7+ORSdYgt9rAccZ0PrWjiNFM/j9ebjyt9EdT5eT
   60AzgP1lddyDxFWlnHKz01aUrFxTpP5Qld9agV/hBuOuqj0hQZq81tLoX
   O+S01GsPQ29pnpe6Y0B27eLOtoDgBdH0WaYv3IjlqGxD5Y/MiYPr2dDUS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="380585159"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="380585159"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 03:44:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="791277863"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="791277863"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 14 Dec 2022 03:44:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p5QBq-009mZL-1v;
        Wed, 14 Dec 2022 13:44:46 +0200
Date:   Wed, 14 Dec 2022 13:44:46 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com,
        lareine@amazon.com
Subject: Re: [PATCH 1/1] i2c: designware: use u64 for clock freq to avoid u32
 multiplication overflow
Message-ID: <Y5m3Lh0wte/HN9NH@smile.fi.intel.com>
References: <20221214103418.64431-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221214103418.64431-1-hhhawa@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 14, 2022 at 10:34:18AM +0000, Hanna Hawa wrote:
> From: Lareine Khawaly <lareine@amazon.com>
> 
> In functions i2c_dw_scl_lcnt() and i2c_dw_scl_hcnt() may have overflow
> by depending on the values of the given parameters including the ic_clk.
> For example in our usecase where ic_clk >= 1000000, multiplication of

It's hard to count 0:s, can you use plain words instead (like million, billion)?

> ic_clk * 4700 will result in 32 bit overflow.

> This commit change the ic_clk to be u64 parameter to avoid the overflow.

Read Submitting Patches about imperative mood in the commit messages.

...

Smells like you are missing the Fixes tag.

-- 
With Best Regards,
Andy Shevchenko


