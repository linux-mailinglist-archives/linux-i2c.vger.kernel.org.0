Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCBD565347A
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Dec 2022 18:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbiLURAG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Dec 2022 12:00:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbiLURAF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Dec 2022 12:00:05 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7270389;
        Wed, 21 Dec 2022 09:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671642003; x=1703178003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OxB3GIagG4prnpjR0RwHNDbt7vllm8UyDdcUdNKt41c=;
  b=F2Kw3QY8E5/b/d5e1C/FBrT22PhoUcH9DfHdbrub5PZVX1QzsckCtgYY
   9bRzj+7mEL9phRTEGBOPo50ZhEPxEhdOZlIIlzYEYp50opiptty5peGiu
   bLmQUlnMR5ZD/zxNMP/K9tbZgV5jNmFMfOGv0J2hJR85gsshcPuEFXAmB
   jXBzq0xYX6vMz31DN6Gq3tqvpbMCoaJUCbo3ylfmQzJbSf36Ts5CBMKI8
   RwF8MK3HDv0+mCRoXlSh08HsxCQ+A+shilVVmjTbX7cgT4FKgSfKKjpZg
   ryVHjubNNfqlK4y7LPFsUj8JHxNw55IQ1MP8rFg6m4z5HGifL8j/9baVZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="299597046"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; 
   d="scan'208";a="299597046"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2022 08:59:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="644910548"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; 
   d="scan'208";a="644910548"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 21 Dec 2022 08:59:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p82RY-00Darf-1X;
        Wed, 21 Dec 2022 18:59:48 +0200
Date:   Wed, 21 Dec 2022 18:59:48 +0200
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
Message-ID: <Y6M7hHVcEEyqg/b2@smile.fi.intel.com>
References: <20221220164806.77576-1-hhhawa@amazon.com>
 <Y6Hs1xwB45K3Ufb8@smile.fi.intel.com>
 <cc16a489-f711-0c54-8576-ef7974b3cb79@amazon.com>
 <Y6ILydYEWzJdzwBJ@smile.fi.intel.com>
 <Y6IMhZsbOk/J9xZB@smile.fi.intel.com>
 <42585223-2d92-5a9e-3707-d5e70fe6937b@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42585223-2d92-5a9e-3707-d5e70fe6937b@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 20, 2022 at 09:43:25PM +0200, Hawa, Hanna wrote:
> On 12/20/2022 9:27 PM, Andy Shevchenko wrote:
> > Thinking more on this, I would probably replace the order of arguments to make
> > it ' + offset - N' in each case. Since plus will be on the previous line and
> > become first it will be easier to parse the arithmetical expression.
> 
> Do you want this change in the same patch? i don't think it's related here..
> I can push separated change

Up to you. If you think it's not suitable, then don't change.

-- 
With Best Regards,
Andy Shevchenko


