Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 166CE66CE39
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jan 2023 19:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbjAPSDV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Jan 2023 13:03:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232168AbjAPSCq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Jan 2023 13:02:46 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E284279B4;
        Mon, 16 Jan 2023 09:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673891296; x=1705427296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=TNgX0mCKMCl8fMMol+o+7jJ7FmDZK6TmzIACPGFpF3U=;
  b=KDR7LYGf4oSJFO5wBYvtH5i1U9WcypcD43JTqC5R9YGc59wOuWv8BhN4
   nxcAyQpvuxQtjqr8vLQalrCScPvoPLpu4MYDNbY6W0zZI5RNIwgQMlljR
   KqsrOLC1vLoDZfrSe1fQmYUglyK3nU6r57rcBlEpqAcEYs0JOHvmBbjvM
   upNE/aAEq99TKdfD9YVnEEl/pw4N10EdjCQ6wEgqndksSMZpHheAVdX1h
   6UeGRA2rH0hryso3Q2Rt5u8k+sTC3iJbf0CLRB8tuoLVD5qb6gYQaq5mw
   zwEFhA/1JdnI+tvGM9p50k9iNGpRROcA8KoIG9mfLGnfTQ7eQZ2uGNeoG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="312366869"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="312366869"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 09:48:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="659114269"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="659114269"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 16 Jan 2023 09:48:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pHTac-00ACas-0G;
        Mon, 16 Jan 2023 19:48:10 +0200
Date:   Mon, 16 Jan 2023 19:48:09 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc:     Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        Borislav Petkov <bp@alien8.de>, Borislav Petkov <bp@suse.de>,
        Hans de Goede <hdegoede@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "rrangel@chromium.org" <rrangel@chromium.org>,
        "upstream@semihalf.com" <upstream@semihalf.com>,
        "M K, Muralidhara" <Muralidhara.MK@amd.com>,
        "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>,
        "Ghannam, Yazen" <Yazen.Ghannam@amd.com>
Subject: Re: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
Message-ID: <Y8WN2ZTnnVDgVlZB@smile.fi.intel.com>
References: <c0c8bdce-26a0-ad3f-749b-7585d947608b@redhat.com>
 <YyxrdpUyc+kp48kX@zn.tnic>
 <33d5cc27-474b-fdec-a6b0-84ac16f7d386@redhat.com>
 <CAOtMz3M=BTZUTRMHWGULwMDWmGdOzHKo=UcZeg3sP8_ndVYk2g@mail.gmail.com>
 <YzG657ZFeEvLd6hm@zn.tnic>
 <CAOtMz3MWnmdMbw_CKxBKVt=TJpLNJuZUzpxvnDi+QnigaLozLA@mail.gmail.com>
 <Y7v2j92Ol6dL3FLE@zn.tnic>
 <CAOtMz3PG4nku-O7dh+1U_DA05HAmQboTqwUQkCkrXQLV9bFjPw@mail.gmail.com>
 <Y8VFVmhqP8dpqZcQ@smile.fi.intel.com>
 <MN0PR12MB6101E79DA61CB0154C4819B2E2C19@MN0PR12MB6101.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MN0PR12MB6101E79DA61CB0154C4819B2E2C19@MN0PR12MB6101.namprd12.prod.outlook.com>
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

On Mon, Jan 16, 2023 at 04:22:09PM +0000, Limonciello, Mario wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Monday, January 16, 2023 06:39
> > To: Jan Dąbroś <jsd@semihalf.com>
> > On Mon, Jan 16, 2023 at 11:19:00AM +0100, Jan Dąbroś wrote:

> > > > Make init_amd_nbs() arch_initcall_sync() so that it executes after PCI
> > init.
> > >
> > > I described earlier in this thread why such option is not working -
> > > let me quote myself:
> > >
> > > It's not enough for running init_amd_nbs() to have only
> > > pci_arch_init() done. We need the pci bus to be created and registered
> > > with all devices found on the bus. We are traversing through them and
> > > trying to find northbridge VID/DID. Due to the above, we need to run
> > > init_amd_nbs() only after acpi_scan_init() that is invoked from
> > > acpi_init() which is registered as subsys_initcall. That's why the
> > > trick with switching init_amd_nbs() to arch_initcall_sync will not
> > > work.
> > >
> > > We have a kind of chicken-and-egg problem here. Or is there something I
> > missed?
> > >
> > > I wonder if there is upstreamable option to control order of the
> > > drivers' init by forcing link order?
> > 
> > But what exactly do you need from North Bridge? Is it only its existence or
> > do you need to have fully instantiated PCI device (if so, why?)?
> 
> There is a need to be able to write and read PCI config space.

So, it's available even on early stages, are there some specifics why it can't
be done using the respective APIs?

-- 
With Best Regards,
Andy Shevchenko


