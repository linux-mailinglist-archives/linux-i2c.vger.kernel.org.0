Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 297E77AD073
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Sep 2023 08:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232217AbjIYGrD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Sep 2023 02:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232174AbjIYGq6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Sep 2023 02:46:58 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E15412A;
        Sun, 24 Sep 2023 23:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695624412; x=1727160412;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=r8QYj5J8IuB6vx5ClC9+kjrfx09WCtLHhZ6OBLtXhhU=;
  b=NuQUoiaU1HT4YtQCP3YPl04wyZSHD+zgWs6oqGQc9QZTH4HSyfcblkyk
   ee+9NMvhjZHv/BGJ5rcWGMgewS0AFS3CQXgUQRf/7XeD7/YymIz7JM2iB
   CAwNFmeHaYlBn2Y+0MoeHm1LMa1C4FcORRpJxCG1r6cJDdoLgUUmWvdmZ
   JztPtJUdesj5P1lzcO8NCviVsMF0y52nJ72DdtETi9d4Zs1SjaHwgS5Nx
   T6VYHy9cncFdvskE5USkIt71YbrJOTlSqfvv1k9zStez2IRSP3QqTodFc
   JpZF5ERTEG7EH6Efy9HpUM+IFnelr0oIsQWzlCjxSAHzOofo6Ip8PlVMv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385010391"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="385010391"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 23:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="748249030"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="748249030"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 23:46:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qkfMj-00000000Gqn-3VAm;
        Mon, 25 Sep 2023 09:46:45 +0300
Date:   Mon, 25 Sep 2023 09:46:45 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 1/9] i2c: designware: Move has_acpi_companion() to
 common code
Message-ID: <ZREs1XQzPe9GqlbK@smile.fi.intel.com>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-2-andriy.shevchenko@linux.intel.com>
 <20230725214521.zxjqinryvva2zanx@intel.intel>
 <928d54c4-ec71-5f09-ed66-5f9c52aca6ba@linux.intel.com>
 <ZMgWJY3w/HhsZvVd@smile.fi.intel.com>
 <2e2f4d7e-2831-9161-9564-3d1e89511727@linux.intel.com>
 <ZRCiYI5SMEVxxJ98@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRCiYI5SMEVxxJ98@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Sep 24, 2023 at 10:56:00PM +0200, Wolfram Sang wrote:
> On Thu, Aug 03, 2023 at 04:43:32PM +0300, Jarkko Nikula wrote:
> > On 7/31/23 23:14, Andy Shevchenko wrote:

...

> > Moving to common code I don't know how well it's splittable into smaller
> > patches or would single bigger patch look better.
> 
> Does this all mean that the series needs to be refactored?

At least that is my impression. Just have no time to look at it (yet).

-- 
With Best Regards,
Andy Shevchenko


