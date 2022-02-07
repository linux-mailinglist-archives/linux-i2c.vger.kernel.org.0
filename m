Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 586E14ABF4D
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 14:24:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386959AbiBGNTl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 08:19:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449002AbiBGNOi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 08:14:38 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95512C043181;
        Mon,  7 Feb 2022 05:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644239677; x=1675775677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ugw6VHighrhQDjS9nDrgU6Gp603CM4GjJYcOJX8CFzo=;
  b=VDGaXvBYSqBzJVX0LJP6acFFFBGCjchrZFDykJZLLUmjrb3XQasWHjPg
   zklT+1HdArIzFg7pRA6Xsot/iJhIb6BvS3XWDs1SRX1V1TKPwVeknsrZm
   dshMO6JqB29kgQ7u0Asq7vFxgwGZ7ZXFCZxuoW7JDUf9B1yyqYAsCY2ej
   LEDRIcXbwrywd72+Qg4I9gVFdjZpuSNBp2NgDLd1A67lg3o9ZZWkRrg64
   itFqdnP6FKFIzqOSugPihTwceIfSWs+KOLy+aDZiaFFq9cI5Ksk6qpB+0
   iYJ9zRcRSL4CWcT0yu6TkK2RRe4ntKVU4fI2PtJFYUa2wLDg835NWrac7
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="246301284"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="246301284"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 05:14:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="584828064"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 05:14:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nH3pl-001uYa-DZ;
        Mon, 07 Feb 2022 15:13:33 +0200
Date:   Mon, 7 Feb 2022 15:13:33 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: Re: [PATCH v3 1/5] i2c: Introduce common module to instantiate CCGx
 UCSI
Message-ID: <YgEa/blO2UMzztCq@smile.fi.intel.com>
References: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
 <Ye7AhqMsOkfvHOAg@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ye7AhqMsOkfvHOAg@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 24, 2022 at 05:06:47PM +0200, Andy Shevchenko wrote:
> On Wed, Jan 05, 2022 at 04:19:31PM +0200, Andy Shevchenko wrote:
> > Introduce a common module to provide an API to instantiate UCSI device
> > for Cypress CCGx Type-C controller. Individual bus drivers need to select
> > this one on demand.
> 
> Ajay, is it possible to get your tag on the series, please?

Wolfram, can you remind, please, what the process is, if there is
a non-responsive (in a meaningful period of time) maintainer?

-- 
With Best Regards,
Andy Shevchenko


