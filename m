Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5A9B784416
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Aug 2023 16:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236011AbjHVO1d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Aug 2023 10:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236668AbjHVO1c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Aug 2023 10:27:32 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF3DBCC7;
        Tue, 22 Aug 2023 07:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692714449; x=1724250449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M9Higi1Qpyuzzg3+bfM0Xic6CpKxViA+VTwwDQrp1G0=;
  b=LXF18x1WoLc01STezNiEbX3RaM4FSiNwW1PkweElkkzFl+8UXHgiqb40
   iq/azKotd77CeDI5aSo2sgibG4HmRmZIGoTA2YCFsqj3HYOdWu4QspvEc
   Kv4LLSFgRTMwnK+A2ZBEJp2ZfMTTwLZS98CMleyy1cUMAYDf4d/q2vMdm
   bf+H8vIYCdMSuNuD3PAvR2OaKPyxcCFeM/PztgLveKLedFaBJuZhx2uGE
   fpb/ahHkKPO3B7+OwDvaXpskY/bluIdshhc7EkqOdAa3yYgsF0bLGjRbA
   OM6ImMCTS5YWi6pPEx520eHjzR19vvNb0az/97GymY61PFS3/Ol0PigtC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="371317708"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="371317708"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 07:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="826347439"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="826347439"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Aug 2023 07:27:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qYSLo-00EDCE-2I;
        Tue, 22 Aug 2023 17:27:20 +0300
Date:   Tue, 22 Aug 2023 17:27:20 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yann Sionneau <ysionneau@kalrayinc.com>
Cc:     Yann Sionneau <ysionneau@kalray.eu>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] Currently if the SoC needs pinctrl to switch the SCL
 and SDA from the I2C function to GPI
Message-ID: <ZOTFyHzsOSvfzNjD@smile.fi.intel.com>
References: <20230822131123.5041-1-ysionneau@kalray.eu>
 <ZOS3cI7RL443mizj@smile.fi.intel.com>
 <b12f4f63-4504-e775-166d-9ea30dd97489@kalrayinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b12f4f63-4504-e775-166d-9ea30dd97489@kalrayinc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 22, 2023 at 04:15:25PM +0200, Yann Sionneau wrote:
> On 8/22/23 15:26, Andy Shevchenko wrote:
> > On Tue, Aug 22, 2023 at 03:11:23PM +0200, Yann Sionneau wrote:

...

> > You forgot my tag. Why?
> Woops sorry, I am not used to sending patches upstream. I didn't know I had
> to add the ack tag. Will do it!

Any tags, Acked-by, Reviewed-by, ...

> > Also I think this will generate more code and more noise in debug case.
> > So, I admit I gave a bad suggestion in previous round.
> Ah yes you are right in case of dbg+CONFIG_PINCTRL not set it will print
> both messages but just one is enough.
> > 
> > Please, go for v3 with my tag (as v5).
> > 
> Ok, I'll also add `i2c: designware: ` to $subject as Mika Westerberg
> suggested.

It seems that Subject was completely missing.
In the commit message it's a first line followed by a blank line.

-- 
With Best Regards,
Andy Shevchenko


