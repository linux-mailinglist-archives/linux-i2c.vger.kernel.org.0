Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4E6969980D
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 15:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbjBPO44 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 09:56:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbjBPO4x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 09:56:53 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39275521E9;
        Thu, 16 Feb 2023 06:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676559400; x=1708095400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Jnag3RTmvPqBfzuViYzSn81cgXd3OsGGPoaxMk4z/kA=;
  b=OkLArTbgpuaCB1kL3Xh3m/ABtQgMsi92eNWXt26gH1CWF5PLrUl7w2dx
   moZ14klivmV3ElyhWeLWljPUS5WTVJ7v6psLYpRUC2qgZXPVxdNSaGGvL
   kVUwOGGBxbfSNQUrFNKemQNHzZD3p2mrp0hW2cY8YlSuhfK+w3p3+aMl/
   a+cCRkxk4+2ovnK5ClrCclaQK1GnDj4fY/sHFCdzabgWiXR/5OYWxyEkC
   vwZ37S4cjrWhA/IzIRtrtGVhFzVsof/ogBo5Bhl6TcRdMNBfFKJytdPzx
   lTT7JVSYQJOESDQqB+jdUxJbA7dQj3BuKop300cUpjFFZgVz7sBR2V1ts
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="359164718"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="359164718"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 06:56:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="844169379"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="844169379"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 16 Feb 2023 06:56:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pSfgZ-007pOc-1d;
        Thu, 16 Feb 2023 16:56:35 +0200
Date:   Thu, 16 Feb 2023 16:56:35 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mario Limonciello <mario.limonciello@amd.com>
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
Message-ID: <Y+5EI3XGBzuwwVBV@smile.fi.intel.com>
References: <20230209223811.4993-1-mario.limonciello@amd.com>
 <20230209223811.4993-7-mario.limonciello@amd.com>
 <703033aa-1293-307d-42a2-9734a51c7190@linux.intel.com>
 <ca9c0f77-c191-d88a-22a1-315ca97f17e8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca9c0f77-c191-d88a-22a1-315ca97f17e8@amd.com>
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

On Thu, Feb 16, 2023 at 07:29:53AM -0600, Mario Limonciello wrote:
> On 2/16/23 07:27, Jarkko Nikula wrote:
> > On 2/10/23 00:38, Mario Limonciello wrote:

...

> > >     config I2C_DESIGNWARE_AMDPSP
> > >       bool "AMD PSP I2C semaphore support"
> > > -    depends on X86_MSR
> > >       depends on ACPI
> > >       depends on I2C_DESIGNWARE_PLATFORM
> > > +    depends on CRYPTO_DEV_SP_PSP && !(I2C_DESIGNWARE_PLATFORM=y &&
> > > CRYPTO_DEV_CCP_DD=m)
> > >       help
> > 
> > Would this look better if split? I.e.
> > 
> >     depends on CRYPTO_DEV_SP_PSP
> >     depends on !(I2C_DESIGNWARE_PLATFORM=y && CRYPTO_DEV_CCP_DD=m)
> Yes, thanks I'll change that for next version.

I'm wondering if this is homegrown implementation of 'imply' keyword?

-- 
With Best Regards,
Andy Shevchenko


