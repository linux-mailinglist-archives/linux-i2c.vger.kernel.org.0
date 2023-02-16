Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB17C699EDC
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 22:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjBPVQN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 16:16:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbjBPVQM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 16:16:12 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 370123B864;
        Thu, 16 Feb 2023 13:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676582171; x=1708118171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pYDMhUJZT9iTDU3s07U04jLG4mJ8llVyNJOCxQLrvys=;
  b=nNuF6jmyfHs9N041cyo/vys5s7lPSc9ZQEKUx6KN1BL2S9BQlLpL+ovD
   cvBcex696Ttpjj6Q3ijJcFrH14cSh264vVbDBvSe7S/GM01QAn8okej5E
   DkB6316GPCwIjr7YrJYc0ZL/I6/81+FKy/zYTmxCdyi3AfjLTLNNG1lru
   HPz8ubHsUwHJYqSg4y6tp+CLbs+PjlTkqSpGqBkZIdC+aXAH6Iacz3Xch
   icTE7tS36WHG5vi6CYGxIqxvfT8cLL2kDp9u4n0N7li+KqcIdZiWVpN/L
   NZq0IxyWmBPhfmrhEdDnjjqt5syIZUQ3MMJusM1HwauOiswgCCs2FDcZq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="396517089"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="396517089"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 13:16:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="813136929"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="813136929"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2023 13:16:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pSlbq-007wYS-0d;
        Thu, 16 Feb 2023 23:16:06 +0200
Date:   Thu, 16 Feb 2023 23:16:05 +0200
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
Message-ID: <Y+6dFYd/0tSKriaj@smile.fi.intel.com>
References: <20230209223811.4993-1-mario.limonciello@amd.com>
 <20230209223811.4993-7-mario.limonciello@amd.com>
 <703033aa-1293-307d-42a2-9734a51c7190@linux.intel.com>
 <ca9c0f77-c191-d88a-22a1-315ca97f17e8@amd.com>
 <Y+5EI3XGBzuwwVBV@smile.fi.intel.com>
 <9523a6ce-0220-e939-392d-2b48b2a4dc48@amd.com>
 <Y+6ZMEoQ2UoH7SxD@smile.fi.intel.com>
 <d8a11223-36d1-a3bd-bfa2-a1c67b9ef250@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8a11223-36d1-a3bd-bfa2-a1c67b9ef250@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 16, 2023 at 03:01:35PM -0600, Limonciello, Mario wrote:
> On 2/16/2023 14:59, Andy Shevchenko wrote:
> > On Thu, Feb 16, 2023 at 02:55:07PM -0600, Limonciello, Mario wrote:
> > > On 2/16/2023 08:56, Andy Shevchenko wrote:
> > > > On Thu, Feb 16, 2023 at 07:29:53AM -0600, Mario Limonciello wrote:
> > > > > On 2/16/23 07:27, Jarkko Nikula wrote:
> > > > > > On 2/10/23 00:38, Mario Limonciello wrote:

...

> > > > > > >       config I2C_DESIGNWARE_AMDPSP
> > > > > > >         bool "AMD PSP I2C semaphore support"
> > > > > > > -    depends on X86_MSR
> > > > > > >         depends on ACPI
> > > > > > >         depends on I2C_DESIGNWARE_PLATFORM
> > > > > > > +    depends on CRYPTO_DEV_SP_PSP && !(I2C_DESIGNWARE_PLATFORM=y &&
> > > > > > > CRYPTO_DEV_CCP_DD=m)
> > > > > > >         help
> > > > > > 
> > > > > > Would this look better if split? I.e.
> > > > > > 
> > > > > >       depends on CRYPTO_DEV_SP_PSP
> > > > > >       depends on !(I2C_DESIGNWARE_PLATFORM=y && CRYPTO_DEV_CCP_DD=m)
> > > > > Yes, thanks I'll change that for next version.
> > > > 
> > > > I'm wondering if this is homegrown implementation of 'imply' keyword?
> > > 
> > > Like this?
> > > 
> > > config I2C_DESIGNWARE_AMDPSP
> > >     depends on CRYPTO_DEV_SP_PSP
> > >     depends on CRYPTO_DEV_CCP_DD
> > > 
> > > config CRYPTO_DEV_CCP_DD
> > >     imply I2C_DESIGNWARE_PLATFORM
> > 
> > Looks okay, but I'm not familiar with this code. The documentation about
> > 'imply' can be found here:
> > 
> > https://www.kernel.org/doc/html/latest/kbuild/kconfig-language.html#menu-attributes
> 
> Yeah I found that, but this was my first time using imply, so I was hoping
> someone who has used it could validate I interpreted it correctly.
> 
> Following the example CRYPTO_DEV_CCP_DD would be FOO and
> I2C_DESIGNWARE_PLATFORM would be BAZ so I thought so.

'imply' == weak 'select', it means that the target option may or may not be
selected. I.o.w. "optional" dependency.

Does CRYPTO_DEV_CCP_DD use I2C DesignWare code?

If I understand correctly the "depends on !(I2C_DESIGNWARE_PLATFORM=y &&
CRYPTO_DEV_CCP_DD=m)" you want to have IS_REACHABLE() in your code and actually
"imply CRYPTO_DEV_CCP_DD" in the I2C_DESIGNWARE_AMDPSP.


-- 
With Best Regards,
Andy Shevchenko


