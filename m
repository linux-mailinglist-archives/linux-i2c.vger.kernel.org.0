Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02951652565
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 18:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233763AbiLTRPp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 12:15:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbiLTRPm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 12:15:42 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC916B72;
        Tue, 20 Dec 2022 09:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671556540; x=1703092540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xc2bOu5Jx2qLb5if/xEFuzyv4WYObGfuBikBeB+HOMo=;
  b=NIxkzJDwi0QFHKfBTU+9BEKRMUKFCeDYf0HAUB9EGCh0VvY0Es/00IP8
   CciWVEsulciUrHGdq72QcJfzyHewpn+0djdGz+LBB3aBJOJGyaWSajVml
   1Buj/W9EMOkXTPA+v6V8yyFDSlJWQhWR4Rf0RuJMFE9RqN6v6xijrAK4m
   46Pf2AmCHQRyHuWXzfHk133K0EbxGwI5WXkz5/Xnw6aqEaUt+X1msbE/Z
   m2rx9ufEpCGnsVZQ8+sSyZDPrF4JSLpnF/Cr4RCZmCZDW1CY89xWJkH0n
   o04HB91PGjcK9jaZqRNGB0ejMlMS3Vdq2LW4IhGUnyHg/WbC8QexFCaT5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="318361851"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="318361851"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 09:11:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="601173719"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="601173719"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 20 Dec 2022 09:11:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p7g9f-00D1PM-21;
        Tue, 20 Dec 2022 19:11:51 +0200
Date:   Tue, 20 Dec 2022 19:11:51 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hanna Hawa <hhhawa@amazon.com>
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
Message-ID: <Y6Hs1xwB45K3Ufb8@smile.fi.intel.com>
References: <20221220164806.77576-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221220164806.77576-1-hhhawa@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 20, 2022 at 04:48:06PM +0000, Hanna Hawa wrote:
> From: Lareine Khawaly <lareine@amazon.com>
> 
> In functions i2c_dw_scl_lcnt() and i2c_dw_scl_hcnt() may have overflow
> by depending on the values of the given parameters including the ic_clk.
> For example in our use case where ic_clk is larger than one million,
> multiplication of ic_clk * 4700 will result in 32 bit overflow.
> 
> Add cast of u64 to the calculation to avoid multiplication overflow, and
> use the corresponding define for divide.

...

> -		return DIV_ROUND_CLOSEST(ic_clk * tSYMBOL, MICRO) - 8 + offset;
> +		return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * tSYMBOL, MICRO) - 8 +
> +			offset;

Broken indentation.

...

> -		return DIV_ROUND_CLOSEST(ic_clk * (tSYMBOL + tf), MICRO) - 3 + offset;
> +		return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tSYMBOL + tf),
> +					     MICRO) - 3 + offset;

I would still go with 'MICRO) -' part to be on the previous line despite being
over 80, this is logical split which increases readability.

> -	return DIV_ROUND_CLOSEST(ic_clk * (tLOW + tf), MICRO) - 1 + offset;
> +	return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tLOW + tf), MICRO) - 1 +
> +		offset;

Broken indentation.

-- 
With Best Regards,
Andy Shevchenko


