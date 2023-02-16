Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6689699E79
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 21:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjBPU7h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 15:59:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbjBPU7g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 15:59:36 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC28D50AD4;
        Thu, 16 Feb 2023 12:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676581173; x=1708117173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=m6xJyyYjGPUDKkt0EXkhSgCh2Fgyf0MYeh6BEYTORh8=;
  b=WvTaGjF2v/9bEVnRMRBrizYnahWC+D2/6lyYT2vfbCWmNOIzlArGCI7q
   qPtbfd6Xe9sID+NvU1+yBoUucpe7GPvl0xx6PnIbni3GX8bNFsSBtkvrj
   hdTlw0k1XETYFritYpd6MJqA3TEehcghe7cwzUg4bxlUkvCoIemhx5uIh
   p6Tqny9cR6KJgftz81u+8XFy6HyX8ngzdBvcdwo8RytqTyGRCTY+iWOy9
   XNWXwQw2y1FHyscyPXBcltocI4NEIdR29ExGrosFuAIZTJvEzkXm2DogY
   TUOPSfo/wF+2WxvSlKH3efXfi41EZ7dPRrLdSYMwC2M5RX2sVF1KNnDy3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331838791"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="331838791"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 12:59:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="700681863"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="700681863"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 16 Feb 2023 12:59:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pSlLk-007wCt-1m;
        Thu, 16 Feb 2023 22:59:28 +0200
Date:   Thu, 16 Feb 2023 22:59:28 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Thomas Rijo-john <Rijo-john.Thomas@amd.com>,
        Lendacky Thomas <Thomas.Lendacky@amd.com>,
        herbert@gondor.apana.org.au,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] i2c: designware: Use PCI PSP driver for communication
Message-ID: <Y+6ZMEoQ2UoH7SxD@smile.fi.intel.com>
References: <20230209223811.4993-1-mario.limonciello@amd.com>
 <20230209223811.4993-7-mario.limonciello@amd.com>
 <703033aa-1293-307d-42a2-9734a51c7190@linux.intel.com>
 <ca9c0f77-c191-d88a-22a1-315ca97f17e8@amd.com>
 <Y+5EI3XGBzuwwVBV@smile.fi.intel.com>
 <9523a6ce-0220-e939-392d-2b48b2a4dc48@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9523a6ce-0220-e939-392d-2b48b2a4dc48@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 16, 2023 at 02:55:07PM -0600, Limonciello, Mario wrote:
> On 2/16/2023 08:56, Andy Shevchenko wrote:
> > On Thu, Feb 16, 2023 at 07:29:53AM -0600, Mario Limonciello wrote:
> > > On 2/16/23 07:27, Jarkko Nikula wrote:
> > > > On 2/10/23 00:38, Mario Limonciello wrote:

...

> > > > >      config I2C_DESIGNWARE_AMDPSP
> > > > >        bool "AMD PSP I2C semaphore support"
> > > > > -    depends on X86_MSR
> > > > >        depends on ACPI
> > > > >        depends on I2C_DESIGNWARE_PLATFORM
> > > > > +    depends on CRYPTO_DEV_SP_PSP && !(I2C_DESIGNWARE_PLATFORM=y &&
> > > > > CRYPTO_DEV_CCP_DD=m)
> > > > >        help
> > > > 
> > > > Would this look better if split? I.e.
> > > > 
> > > >      depends on CRYPTO_DEV_SP_PSP
> > > >      depends on !(I2C_DESIGNWARE_PLATFORM=y && CRYPTO_DEV_CCP_DD=m)
> > > Yes, thanks I'll change that for next version.
> > 
> > I'm wondering if this is homegrown implementation of 'imply' keyword?
> > 
> 
> Like this?
> 
> config I2C_DESIGNWARE_AMDPSP
>    depends on CRYPTO_DEV_SP_PSP
>    depends on CRYPTO_DEV_CCP_DD
> 
> config CRYPTO_DEV_CCP_DD
>    imply I2C_DESIGNWARE_PLATFORM

Looks okay, but I'm not familiar with this code. The documentation about
'imply' can be found here:

https://www.kernel.org/doc/html/latest/kbuild/kconfig-language.html#menu-attributes


-- 
With Best Regards,
Andy Shevchenko


