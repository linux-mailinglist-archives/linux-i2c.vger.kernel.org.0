Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8EF66CE6A
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jan 2023 19:11:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234253AbjAPSLL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Jan 2023 13:11:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234620AbjAPSKZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Jan 2023 13:10:25 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBC6E40BDB;
        Mon, 16 Jan 2023 09:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673891709; x=1705427709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nPJ0Oql8v3SfaPq35P3fWDHJnWjk2fijB0EmpflPsqw=;
  b=T/7TnbW9cHEY4M5nwmUlxgrKhEbRx+wicjzdKw6V7f4X/KuAmu8imczQ
   MrKry9eYx/ag3Ek7stmLCUiGYv+ke1VfKe4KVeCdLf4ya2kctAIJl8vXj
   6PajTuB+BIxMK/9xnMe/CD/qzE1aWHlj7zrjxATa0h3QYAXkE7nsI5tl2
   LeawyRuQy7IJDim7nzjKpW+ySJ0XQtw+aseNJCLFyH3TUxlkKr3pVJsHb
   JEwLzKX0XGYtuKbhdFyhRFC23/nBtJlNuOrFlISZdxARez6mRKSD6d6Rq
   2QeR2lqmZFHNFQuiDIjtHNudWFgG2ZehovIIetlZJ0fR1x6lo9aP/EgqX
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="304896132"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="304896132"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 09:54:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="987873528"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="987873528"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 16 Jan 2023 09:54:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pHTgh-00ACjM-2z;
        Mon, 16 Jan 2023 19:54:27 +0200
Date:   Mon, 16 Jan 2023 19:54:27 +0200
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
Message-ID: <Y8WPUyOT1t5ALYth@smile.fi.intel.com>
References: <YyxrdpUyc+kp48kX@zn.tnic>
 <33d5cc27-474b-fdec-a6b0-84ac16f7d386@redhat.com>
 <CAOtMz3M=BTZUTRMHWGULwMDWmGdOzHKo=UcZeg3sP8_ndVYk2g@mail.gmail.com>
 <YzG657ZFeEvLd6hm@zn.tnic>
 <CAOtMz3MWnmdMbw_CKxBKVt=TJpLNJuZUzpxvnDi+QnigaLozLA@mail.gmail.com>
 <Y7v2j92Ol6dL3FLE@zn.tnic>
 <CAOtMz3PG4nku-O7dh+1U_DA05HAmQboTqwUQkCkrXQLV9bFjPw@mail.gmail.com>
 <Y8VFVmhqP8dpqZcQ@smile.fi.intel.com>
 <MN0PR12MB6101E79DA61CB0154C4819B2E2C19@MN0PR12MB6101.namprd12.prod.outlook.com>
 <Y8WN2ZTnnVDgVlZB@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y8WN2ZTnnVDgVlZB@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 16, 2023 at 07:48:10PM +0200, Andy Shevchenko wrote:
> On Mon, Jan 16, 2023 at 04:22:09PM +0000, Limonciello, Mario wrote:
> > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Sent: Monday, January 16, 2023 06:39
> > > To: Jan Dąbroś <jsd@semihalf.com>
> > > On Mon, Jan 16, 2023 at 11:19:00AM +0100, Jan Dąbroś wrote:
> 
> > > > > Make init_amd_nbs() arch_initcall_sync() so that it executes after PCI
> > > init.
> > > >
> > > > I described earlier in this thread why such option is not working -
> > > > let me quote myself:
> > > >
> > > > It's not enough for running init_amd_nbs() to have only
> > > > pci_arch_init() done. We need the pci bus to be created and registered
> > > > with all devices found on the bus. We are traversing through them and
> > > > trying to find northbridge VID/DID. Due to the above, we need to run
> > > > init_amd_nbs() only after acpi_scan_init() that is invoked from
> > > > acpi_init() which is registered as subsys_initcall. That's why the
> > > > trick with switching init_amd_nbs() to arch_initcall_sync will not
> > > > work.
> > > >
> > > > We have a kind of chicken-and-egg problem here. Or is there something I
> > > missed?
> > > >
> > > > I wonder if there is upstreamable option to control order of the
> > > > drivers' init by forcing link order?
> > > 
> > > But what exactly do you need from North Bridge? Is it only its existence or
> > > do you need to have fully instantiated PCI device (if so, why?)?
> > 
> > There is a need to be able to write and read PCI config space.
> 
> So, it's available even on early stages, are there some specifics why it can't
> be done using the respective APIs?

I think I understood the problem with the above. You probably don't know where
NB can be located in the topology and that's why you can't simply access a
_fixed_ BDF. So you want to have the topology being scanned beforehand.

-- 
With Best Regards,
Andy Shevchenko


