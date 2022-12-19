Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A36FC650C19
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 13:47:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbiLSMrv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 07:47:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232011AbiLSMru (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 07:47:50 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E45FE08B;
        Mon, 19 Dec 2022 04:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671454069; x=1702990069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YdeN24uKlY+W6D4DRm1ZbkxWFnDoKsKo2OT7/hHOnqE=;
  b=cy5xOkSZkQfasOLYdf66T9ST6MQ+eUXlepdKIfmdfgKGvi3bV08hiHHQ
   MFJhhhXeYhlC5Y3S/avdOFNLc+7wTL4l3AsFNj2p7+EaY/wFutG60lK+Y
   1NZticjiAglOvKZIISl0Ux5+6qt5qPcywIwj583XydIyzL8nsTq1OFBog
   8k4OLE2eKniJSaBYZ1WnGzMlg7fTPEM2IwzajdVUoDe3Z8lq5yE7Y1BaW
   Zdp9E1gZgz7ry/nToBdTSTg8eke/PIzmE34wx2+HPM1HKqGfL/Qkjmtxh
   3fX1qBkJwabFUtKeOv+wF/SWmuHe4K4XWFPHkcbXkRe5PB7z+vsDNv/hk
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="321233966"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="321233966"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2022 04:47:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="683003041"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="683003041"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 19 Dec 2022 04:47:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p7FYW-00CI8V-1p;
        Mon, 19 Dec 2022 14:47:44 +0200
Date:   Mon, 19 Dec 2022 14:47:44 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Richard Fitzgerald <rf@opensource.cirrus.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, wsa@kernel.org, hdegoede@redhat.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v3] i2c: designware: Fix unbalanced suspended flag
Message-ID: <Y6BdcEHydaa1gLBI@smile.fi.intel.com>
References: <20221219112019.882092-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221219112019.882092-1-rf@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 19, 2022 at 11:20:19AM +0000, Richard Fitzgerald wrote:
> Ensure that i2c_mark_adapter_suspended() is always balanced by a call to
> i2c_mark_adapter_resumed().
> 
> dw_i2c_plat_resume() must always be called, so that
> i2c_mark_adapter_resumed() is called. This is not compatible with
> DPM_FLAG_MAY_SKIP_RESUME, so remove the flag.
> 
> Since the controller is always resumed on system resume the
> dw_i2c_plat_complete() callback is redundant and has been removed.

> The unbalanced suspended flag was introduced by
> commit c57813b8b288 ("i2c: designware: Lock the adapter while setting the
> suspended flag")

Seems like indentation got broken - the commit and hash can be on previous
line, but it's minor thingy here.

> Before that commit, the system and runtime PM used the same functions. The
> DPM_FLAG_MAY_SKIP_RESUME was used to skip the system resume if the driver
> had been in runtime-suspend. If system resume was skipped, the suspended
> flag would be cleared by the next runtime resume. The check of the
> suspended flag was _after_ the call to pm_runtime_get_sync() in
> i2c_dw_xfer(). So either a system resume or a runtime resume would clear
> the flag before it was checked.
> 
> Having introduced the unbalanced suspended flag with that commit, a further
> commit 80704a84a9f8 ("i2c: designware: Use the
> i2c_mark_adapter_suspended/resumed() helpers")
> 
> changed from using a local suspended flag to using the
> i2c_mark_adapter_suspended/resumed() functions. These use a flag that is
> checked by I2C core code before issuing the transfer to the bus driver, so
> there was no opportunity for the bus driver to runtime resume itself before
> the flag check.

> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: c57813b8b288 ("i2c: designware: Lock the adapter while setting the suspended flag")

Usually we put other tags, that submitter brought themselves, before SoB.
But again, it's minor thingy.

-- 
With Best Regards,
Andy Shevchenko


