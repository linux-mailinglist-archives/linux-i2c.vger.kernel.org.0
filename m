Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38E175E5EF1
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 11:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbiIVJvY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 05:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbiIVJvV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 05:51:21 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4624D6921;
        Thu, 22 Sep 2022 02:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663840280; x=1695376280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tTaBK+DjBfucGFWPWzGuutlagPaerU/MshiXq/Ty9nM=;
  b=fUZ8jP7Iqqe483VQaKB0v0QLDqMCDq6Wo/pfuLKA9yEulp3JCMHsypYs
   dCP9Dr95qGIGYFxeGHd/bmgXMpMhXyWyxNuEXrcuFHvJ/JzTKl8+ZRMVd
   OEin7seiknpr6Y18jWLYYyf0fgixDh/7SMTEUVdZp0Tjqw/Gt38nFCYK6
   1ya0t0xrpJVobL/7PxQyHnmmMOn0uhxR3Fk6QEwFNEzapfUE+FTahv7co
   NaaYoCt25J2EHNORnC/u3Ci6uRMc14gATrYo2++d6PQ35Im9+1N2IpUBj
   dxzxwOtMVKBILG8O4nCiodbauY8sjCm0hinZAkrMUP8Y8TnQamlLg6c8/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="283306198"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="283306198"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 02:51:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="650456489"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 22 Sep 2022 02:51:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1obIrT-005wxh-0K;
        Thu, 22 Sep 2022 12:51:15 +0300
Date:   Thu, 22 Sep 2022 12:51:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Borislav Petkov <bp@suse.de>, Hans de Goede <hdegoede@redhat.com>
Cc:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, wsa@kernel.org,
        rrangel@chromium.org, upstream@semihalf.com,
        Muralidhara M K <muralimk@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
Message-ID: <YywwEvkZK1R9mJfE@smile.fi.intel.com>
References: <20220916131854.687371-1-jsd@semihalf.com>
 <20220916131854.687371-2-jsd@semihalf.com>
 <eafc7bb5-a406-132b-4b7d-167917cdab05@amd.com>
 <CAOtMz3Pgh+cERiXVetDZJrQa9C0kUUbZ9dRRhdghgm5Or8kwhg@mail.gmail.com>
 <YytwNvSyhq380YNT@zn.tnic>
 <60a52348-7d50-1056-a596-e154f87c99d2@amd.com>
 <Yyt5LSxSz+6QeWF1@zn.tnic>
 <YywvmueFj/ibyZdf@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YywvmueFj/ibyZdf@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+Cc: Hans (mentioned your name and was under impression that you are in Cc list already)

On Thu, Sep 22, 2022 at 12:49:15PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 21, 2022 at 10:50:53PM +0200, Borislav Petkov wrote:
> > On Wed, Sep 21, 2022 at 03:19:26PM -0500, Limonciello, Mario wrote:
> > > Jan mentioned this in the commit message:
> > > 
> > > > The function which registers i2c-designware-platdrv is a
> > > > subsys_initcall that is executed before fs_initcall (when enumeration > of
> > > NB descriptors occurs).
> > > 
> > > So if it's not exported again, then it means that we somehow
> > > need to get i2c-designware-platdrv to register earlier too.
> > 
> > So I have this there:
> > 
> > /* This has to go after the PCI subsystem */
> > fs_initcall(init_amd_nbs);
> > 
> > as I need PCI. It itself does
> > 
> > arch_initcall(pci_arch_init);
> > 
> > so I guess init_amd_nbs() could be a subsys_initcall...
> > 
> > Or why is
> > 
> > subsys_initcall(dw_i2c_init_driver);
> > 
> > a subsys initcall in the first place?
> > 
> > Looking at
> > 
> >   104522806a7d ("i2c: designware: dw_i2c_init_driver as subsys initcall")
> > 
> > I don't see a particular reason why it should be a subsys_initcall...
> > 
> > In any case, this should be fixed without an export which was crap in
> > the first place.
> > 
> > Hm.
> 
> I'm speculating here, but IIRC the I2C controllers may serve PMICs on some
> platform that are required to be present earlier due to some ACPI code
> accessing them. This Hans de Goede can confirm or correct me.
> 
> Another case comes to my mind is that I2C framework wants to initialize I2C
> peripherals which were supplied via struct i2c_board_info on earlier stages.
> And again comes to the specifics of the certain peripherals that needs for
> power / reset / etc control, i.o.w. critical hardware for the platforms.
> 
> But it's still what I remember and I can be mistaken.

-- 
With Best Regards,
Andy Shevchenko


