Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9781A69A9B8
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 12:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjBQLGa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 06:06:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbjBQLGM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 06:06:12 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC1F642D5;
        Fri, 17 Feb 2023 03:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676631947; x=1708167947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=t6C9/3TTTKLWhwakiGoEV3uiiR8P4MX6Z1YTItlHCww=;
  b=m+MMHy90tTKE5Afzxo4kT3W+BWLuBfDQnCOCEbBWfRQFh/7AMBPDTj3Q
   hbawdXPk50Rm+bhsBZQxjWldOhKQu+YZzvluNhDzsAJG94DDIJSKPVH58
   BxZaJHw6Ty9y4CrA4S+3j/eIJAXtlYdPQbb4scObX71L8Wwg1UQ2CYNm7
   cRpd6uJ0B4YsRe/9+ad1y281uBHPMr4iOu6/p3hSfcUlIBSla2pwuSKaq
   K8XAxj8zjKmxV1jCmzJPMFhxe9XgE6R/RiIVdMR368Dvf+NPRNQWQcxVn
   /jvjxY7Ls9vs7CT2XN+caE3bpAPoBhYrsdj7vNb3Wxe+uLYARB8dSNiOr
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="320069406"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="320069406"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 03:05:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="663842858"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="663842858"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 17 Feb 2023 03:05:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pSyYf-008An2-2Y;
        Fri, 17 Feb 2023 13:05:41 +0200
Date:   Fri, 17 Feb 2023 13:05:41 +0200
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
Message-ID: <Y+9fhf1onXc+fST3@smile.fi.intel.com>
References: <20230209223811.4993-7-mario.limonciello@amd.com>
 <703033aa-1293-307d-42a2-9734a51c7190@linux.intel.com>
 <ca9c0f77-c191-d88a-22a1-315ca97f17e8@amd.com>
 <Y+5EI3XGBzuwwVBV@smile.fi.intel.com>
 <9523a6ce-0220-e939-392d-2b48b2a4dc48@amd.com>
 <Y+6ZMEoQ2UoH7SxD@smile.fi.intel.com>
 <d8a11223-36d1-a3bd-bfa2-a1c67b9ef250@amd.com>
 <Y+6dFYd/0tSKriaj@smile.fi.intel.com>
 <ba2ce999-5cc2-be73-6212-a5db903b294f@amd.com>
 <Y+9fXzby07f6mY59@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+9fXzby07f6mY59@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 17, 2023 at 01:05:03PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 16, 2023 at 03:27:35PM -0600, Limonciello, Mario wrote:
> > On 2/16/2023 15:16, Andy Shevchenko wrote:
> > > On Thu, Feb 16, 2023 at 03:01:35PM -0600, Limonciello, Mario wrote:
> > > > On 2/16/2023 14:59, Andy Shevchenko wrote:
> > > > > On Thu, Feb 16, 2023 at 02:55:07PM -0600, Limonciello, Mario wrote:
> > > > > > On 2/16/2023 08:56, Andy Shevchenko wrote:
> > > > > > > On Thu, Feb 16, 2023 at 07:29:53AM -0600, Mario Limonciello wrote:
> > > > > > > > On 2/16/23 07:27, Jarkko Nikula wrote:
> > > > > > > > > On 2/10/23 00:38, Mario Limonciello wrote:

...

> > > > > > > > > Would this look better if split? I.e.
> > > > > > > > > 
> > > > > > > > >        depends on CRYPTO_DEV_SP_PSP
> > > > > > > > >        depends on !(I2C_DESIGNWARE_PLATFORM=y && CRYPTO_DEV_CCP_DD=m)
> > > > > > > > Yes, thanks I'll change that for next version.
> > > > > > > 
> > > > > > > I'm wondering if this is homegrown implementation of 'imply' keyword?
> > > > > > 
> > > > > > Like this?
> > > > > > 
> > > > > > config I2C_DESIGNWARE_AMDPSP
> > > > > >      depends on CRYPTO_DEV_SP_PSP
> > > > > >      depends on CRYPTO_DEV_CCP_DD
> > > > > > 
> > > > > > config CRYPTO_DEV_CCP_DD
> > > > > >      imply I2C_DESIGNWARE_PLATFORM
> > > > > 
> > > > > Looks okay, but I'm not familiar with this code. The documentation about
> > > > > 'imply' can be found here:
> > > > > 
> > > > > https://www.kernel.org/doc/html/latest/kbuild/kconfig-language.html#menu-attributes
> > > > 
> > > > Yeah I found that, but this was my first time using imply, so I was hoping
> > > > someone who has used it could validate I interpreted it correctly.
> > > > 
> > > > Following the example CRYPTO_DEV_CCP_DD would be FOO and
> > > > I2C_DESIGNWARE_PLATFORM would be BAZ so I thought so.
> > > 
> > > 'imply' == weak 'select', it means that the target option may or may not be
> > > selected. I.o.w. "optional" dependency.
> > > 
> > > Does CRYPTO_DEV_CCP_DD use I2C DesignWare code?
> > > 
> > > If I understand correctly the "depends on !(I2C_DESIGNWARE_PLATFORM=y &&
> > > CRYPTO_DEV_CCP_DD=m)" you want to have IS_REACHABLE() in your code and actually
> > > "imply CRYPTO_DEV_CCP_DD" in the I2C_DESIGNWARE_AMDPSP.
> > 
> > Allowing that combination and using IS_REACHABLE means that it's going to
> > actually load earlier that expected, so I suppose it needs to be something
> > like this then in the probe code for i2c-designware-amdpsp.c:
> > 
> > if (!IS_REACHABLE()
> > 	return -EPROBE_DEFER;
> > 
> > Right?
> 
> Hmm... I'm not sure. IS_REACHABLE() should be done with a compilation

s/with/without/

> dependencies. What you put here is functional dependency, moreover since
> you mentioned the boot / load ordering doesn't it mean that the architecture
> of all of this is not good enough and requires some redesign?
> 
> Perhaps you need to use component framework actually?

-- 
With Best Regards,
Andy Shevchenko


