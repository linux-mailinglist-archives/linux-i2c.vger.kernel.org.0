Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E28C56B922
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jul 2022 14:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237981AbiGHMD0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jul 2022 08:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234089AbiGHMD0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jul 2022 08:03:26 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2259D9B195;
        Fri,  8 Jul 2022 05:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657281805; x=1688817805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1c1SIewMi8wo8xiu8UtWUxGMy8SzGNzCPCBAbWZOjv8=;
  b=ZJ5C3Okevd1d/yY+cU5fu3FWkI6sO+d9H6BErWIKwVaY63Tfp9JRwpkt
   GLhT5FuoG4U8gUk51wrKY6oXtQj3m/g1ulg8aFCIaLKzYUrR/hiv5p6az
   d9WEsDkPP2JdQI/erSpg6NxbsKiqc/QIngsbYS/1quwoPSipAFC+xTn6Q
   /vKeEARhhU9hKK3ZgW4txAkxcCgfgenLIupvHBJ+Z7E+EBMhugrmvReUj
   C3RzJMbGyWyJSxQw6W4hD7IHTu5hq1jjvOkuPyU26eHWip+7jFv/Ps/Wm
   5DTiVO4tZJgQPPweBKhLxr2GADRJJLPpRJKhPAGLB0UM8+NU/tFuOm8EG
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="285393445"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="285393445"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 05:03:24 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="696863643"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 05:03:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o9mhc-00182S-1B;
        Fri, 08 Jul 2022 15:03:20 +0300
Date:   Fri, 8 Jul 2022 15:03:20 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     kernel test robot <lkp@intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kbuild-all@lists.01.org,
        Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: Re: [PATCH v2 1/1] i2c: scmi: Replace open coded
 device_get_match_data()
Message-ID: <YsgdCFJicXA8AXUw@smile.fi.intel.com>
References: <20220708100216.84300-1-andriy.shevchenko@linux.intel.com>
 <202207081957.tSlBfZYh-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202207081957.tSlBfZYh-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 08, 2022 at 07:50:47PM +0800, kernel test robot wrote:
> Hi Andy,
> 
> I love your patch! Perhaps something to improve:

> All warnings (new ones prefixed by >>):

Sorry with that. New sparse is too noisy to see usefull output through.
I'll fix in v3.

-- 
With Best Regards,
Andy Shevchenko


