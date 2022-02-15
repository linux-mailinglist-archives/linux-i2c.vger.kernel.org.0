Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9620C4B681C
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 10:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbiBOJrK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 04:47:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbiBOJrJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 04:47:09 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F9DE6C09;
        Tue, 15 Feb 2022 01:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644918420; x=1676454420;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=E/JsYUfIGC9aSLOn8ZRZyR06XP7CeXXL9wOY5wpZbgg=;
  b=gV3BNUZH3lJ2uTo+ZyoIB2UQK+151DkiceB5JWUL1frky+BY22mCy6eZ
   Acsd/VA0CFrFj0HIGjFGjspWY0mhhzZfHzzWpcsKTTbwSRcWgFxHNnGtz
   KfRGm5rrc/tSmxT+bh7kegMlrKWvch+fUMx/SSkUah1A+mLkyBH71vIQj
   ju4XH2Z5U8nCbGfHd/sPi+xafq4vqEy/Oq+741ufQXczzrbesPolUTaCf
   IBwMH0fqKX0nlAgjj2EBg5GWpffxBbVBHfMUWYaWY0QUiZEHlzzthjPfe
   W10gj8hqXttQq2wEslopzQmVg71KXIwQENsRAWo3dBwntnJYuTVmqaRyf
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="233852838"
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; 
   d="scan'208";a="233852838"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 01:47:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; 
   d="scan'208";a="587592065"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 01:46:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nJuPL-004rzU-7m;
        Tue, 15 Feb 2022 11:46:03 +0200
Date:   Tue, 15 Feb 2022 11:46:02 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: Re: [PATCH v3 1/5] i2c: Introduce common module to instantiate CCGx
 UCSI
Message-ID: <Ygt2WhpJNF1/3k1j@smile.fi.intel.com>
References: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
 <YgttZtBkiV8k0ph/@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgttZtBkiV8k0ph/@kunai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 15, 2022 at 10:07:50AM +0100, Wolfram Sang wrote:
> On Wed, Jan 05, 2022 at 04:19:31PM +0200, Andy Shevchenko wrote:
> > Introduce a common module to provide an API to instantiate UCSI device
> > for Cypress CCGx Type-C controller. Individual bus drivers need to select
> > this one on demand.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Applied to for-next, thanks!

Thank you!

I hope at least AMD guys would be happy and can utilize this module for their
new hardware.

-- 
With Best Regards,
Andy Shevchenko


