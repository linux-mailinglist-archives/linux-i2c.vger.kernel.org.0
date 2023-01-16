Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDA9A66BDFA
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jan 2023 13:39:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbjAPMjQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Jan 2023 07:39:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbjAPMjP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Jan 2023 07:39:15 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D68F51BAC7;
        Mon, 16 Jan 2023 04:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673872754; x=1705408754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NsxSQXRA1+OPD1T485eedwEPZNoRWfbPHxonr1F3p8k=;
  b=Beu3qnju9uLthjzEgi0/9LCMeWckAWx64yieew4T3rV/mvTpORs51y5Y
   a+AkyVi1eMNmjSYTvCqeSbWpevRMpUvNY4ulx/vCc0+uBaljoXXEUygV1
   r3sp4PM7kX9+YZZq/1fYfwNnjYKXMWsXKxClWYxe0XYE4Ecy8kfx4y6OG
   JDdAzPMXDSab/X5GUgHwsd3fgAyDrOy7KDKzu7dxg/ZjMgLYeBQmbmdrv
   zMBUJNrU/IVwdw0KcanqRKV749rgbuWMchvszNzbVeCpypVwuiPzpWHBw
   0zb1Xia41B1s+MVG5AUHRyAMracGYNIlMD+oUCrYB/Rrp/eecba+jUefl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="325717846"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="325717846"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 04:38:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="766869030"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; 
   d="scan'208";a="766869030"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 16 Jan 2023 04:38:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pHOlD-00A4JX-0L;
        Mon, 16 Jan 2023 14:38:47 +0200
Date:   Mon, 16 Jan 2023 14:38:46 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>
Cc:     Borislav Petkov <bp@alien8.de>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Borislav Petkov <bp@suse.de>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, wsa@kernel.org,
        rrangel@chromium.org, upstream@semihalf.com,
        Muralidhara M K <muralimk@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Yazen Ghannam <yazen.ghannam@amd.com>
Subject: Re: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
Message-ID: <Y8VFVmhqP8dpqZcQ@smile.fi.intel.com>
References: <YywvmueFj/ibyZdf@smile.fi.intel.com>
 <YywwEvkZK1R9mJfE@smile.fi.intel.com>
 <c0c8bdce-26a0-ad3f-749b-7585d947608b@redhat.com>
 <YyxrdpUyc+kp48kX@zn.tnic>
 <33d5cc27-474b-fdec-a6b0-84ac16f7d386@redhat.com>
 <CAOtMz3M=BTZUTRMHWGULwMDWmGdOzHKo=UcZeg3sP8_ndVYk2g@mail.gmail.com>
 <YzG657ZFeEvLd6hm@zn.tnic>
 <CAOtMz3MWnmdMbw_CKxBKVt=TJpLNJuZUzpxvnDi+QnigaLozLA@mail.gmail.com>
 <Y7v2j92Ol6dL3FLE@zn.tnic>
 <CAOtMz3PG4nku-O7dh+1U_DA05HAmQboTqwUQkCkrXQLV9bFjPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOtMz3PG4nku-O7dh+1U_DA05HAmQboTqwUQkCkrXQLV9bFjPw@mail.gmail.com>
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

On Mon, Jan 16, 2023 at 11:19:00AM +0100, Jan Dąbroś wrote:
> Hi Borislav,
> 
> > Make init_amd_nbs() arch_initcall_sync() so that it executes after PCI init.
> 
> I described earlier in this thread why such option is not working -
> let me quote myself:
> 
> It's not enough for running init_amd_nbs() to have only
> pci_arch_init() done. We need the pci bus to be created and registered
> with all devices found on the bus. We are traversing through them and
> trying to find northbridge VID/DID. Due to the above, we need to run
> init_amd_nbs() only after acpi_scan_init() that is invoked from
> acpi_init() which is registered as subsys_initcall. That's why the
> trick with switching init_amd_nbs() to arch_initcall_sync will not
> work.
> 
> We have a kind of chicken-and-egg problem here. Or is there something I missed?
> 
> I wonder if there is upstreamable option to control order of the
> drivers' init by forcing link order?

But what exactly do you need from North Bridge? Is it only its existence or
do you need to have fully instantiated PCI device (if so, why?)?

-- 
With Best Regards,
Andy Shevchenko


