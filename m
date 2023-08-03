Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 519FB76E7E7
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Aug 2023 14:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234508AbjHCMIc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Aug 2023 08:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233022AbjHCMIb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Aug 2023 08:08:31 -0400
Received: from mgamail.intel.com (unknown [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C41B2726;
        Thu,  3 Aug 2023 05:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691064511; x=1722600511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=W9WrDaxZ1zss8xkQxPhTAl9aUu71gCJ8rlzShkPklVI=;
  b=MCBKl/Qq9sJvParDV9pP6hl9ICg4Z5dUqFDFH45LcqqoDpaWkiuNtKky
   fhlvohjb5h30mxJuOs+xpouFWdeBwOQNyzY9aEaZ4zfFPzP7Uk18apLNU
   mwcogWD7apZeNWtsyMPm+/kY9zfLOaQigy3GjBAQvqQY3zbZ2vVoAQpKy
   FIH7H5j9JQ/ySyOHDyhlVjT5ZD0csfYFIzvV9XJHxEKaWgBKQH/hg8vem
   ZFisZiK7k4EA6tZsq8inMLcpwCgS+ZwOuuD0qPBELtfmpCRfYYhqf2UY2
   5ysxoPnUaazSbR9fvrFVn+SpI5cnXqA97lpTKU8XtY/kDGu97nvT/RPSZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="368752501"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="368752501"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 05:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="794976976"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="794976976"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 03 Aug 2023 05:08:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qRX7z-00BWy1-1o;
        Thu, 03 Aug 2023 15:08:27 +0300
Date:   Thu, 3 Aug 2023 15:08:27 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 RESEND 3/4] i2c: i2c-core-of: Convert
 i2c_of_match_device_sysfs() to non-static
Message-ID: <ZMuYu7SaMRNFFWVq@smile.fi.intel.com>
References: <20230803103102.323987-1-biju.das.jz@bp.renesas.com>
 <20230803103102.323987-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230803103102.323987-4-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 03, 2023 at 11:31:01AM +0100, Biju Das wrote:
> Currently i2c_of_match_device_sysfs() is used by i2c_of_match_device().
> Convert this to non-static function for finding match data for the I2C
> sysfs interface using i2c_device_get_match_data() for code reuse.
> 
> While at it, fix the below issues:
>  1) Replace 'of_device_id*'->'of_device_id *' in function definition.
>  2) Fix the alignment in the function definition.
>  3) Change the struct i2c_client parameter as const to avoid overriding
>     the client pointer.

All makes sense
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


