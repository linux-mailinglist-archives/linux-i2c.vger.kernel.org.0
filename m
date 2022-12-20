Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0026526E6
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 20:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbiLTT1M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 14:27:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbiLTT1L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 14:27:11 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C121E15A12;
        Tue, 20 Dec 2022 11:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671564430; x=1703100430;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JKi7Gbk8QaG/Kih0RcBWajsCoTFOfbRBkS4nokxwglo=;
  b=FiM5Q6mEnvFgXc1oVGo91q4SCN+FQQO1XHDFBYy7U2ukRChYxMQQd0pY
   npFm8QAQBfxwBcZU5KqPI6FaEjfAUKKxYteJYrF/DROC+EC5lO+K+/LBN
   NpLBvw1dSD2RGE7N0aMG6sNmsTCH6HMJ+yaHFBVrUZCuEFztTt4bIJ8fh
   LeNeVjdzPpEb8B9Nfmqmr6+EkZVp21BU/4eDQ4nBmjHmlEy7CrZAlGkoA
   ZKuNzHRtQ4eJACHyKaHllCLCL/6Jo183HSwnwtM8bFXkFsvfCMa1alY/B
   mzczSgWCp3ypr1wYOXd3JDFUb+4T81gZ6/yiRp6vbhWNeE12sOzd1VYDw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="381924653"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="381924653"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 11:27:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="825387496"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="825387496"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 20 Dec 2022 11:27:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p7iGU-00D9UL-0K;
        Tue, 20 Dec 2022 21:27:02 +0200
Date:   Tue, 20 Dec 2022 21:27:01 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Hawa, Hanna" <hhhawa@amazon.com>
Cc:     wsa@kernel.org, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        linus.walleij@linaro.org, ben-linux@fluff.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com,
        talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com,
        farbere@amazon.com, itamark@amazon.com,
        Lareine Khawaly <lareine@amazon.com>
Subject: Re: [PATCH v4 1/1] i2c: designware: use casting of u64 in clock
 multiplication to avoid overflow
Message-ID: <Y6IMhZsbOk/J9xZB@smile.fi.intel.com>
References: <20221220164806.77576-1-hhhawa@amazon.com>
 <Y6Hs1xwB45K3Ufb8@smile.fi.intel.com>
 <cc16a489-f711-0c54-8576-ef7974b3cb79@amazon.com>
 <Y6ILydYEWzJdzwBJ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6ILydYEWzJdzwBJ@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 20, 2022 at 09:23:53PM +0200, Andy Shevchenko wrote:
> On Tue, Dec 20, 2022 at 07:43:06PM +0200, Hawa, Hanna wrote:

...

> 		return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * tSYMBOL, MICRO) -
> 		       8 + offset;
> 
> 		return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tSYMBOL + tf), MICRO) -
> 		       3 + offset;
> 
> 	return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tLOW + tf), MICRO) -
> 	       1 + offset;

Thinking more on this, I would probably replace the order of arguments to make
it ' + offset - N' in each case. Since plus will be on the previous line and
become first it will be easier to parse the arithmetical expression.

-- 
With Best Regards,
Andy Shevchenko


