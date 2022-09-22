Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA7F5E5EE3
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 11:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbiIVJtW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 05:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbiIVJtV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 05:49:21 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B478D4A83;
        Thu, 22 Sep 2022 02:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663840160; x=1695376160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PtTn3jAAofls4r1A5/hrcN2Oo4KvnVnzpDIgzM2G1js=;
  b=CLOBKyjFAsVfgLrrN1lUIW5GJ/AoPX7AtPy5ZgTj4+xvkp7XIUgiUqoj
   H+1Czc7gHz6LJVLA7FCL0HfKkdKg/IOdyErQo4ucLAIaf7njfusi5c7wt
   8T78g4Y4mn0u8AMmC8iTvUZ3aKEkhWU6XluX7nwPv+HtVmqxIxZ/86Np0
   M2yhna39JfIasFLpk7w+1oqhbGpi3P+CZpJsTb2UwAauQx0aMLWEWagDG
   yjnr8kX8BdUCn5fjgzMV2AzEQqQq8VIIrULM19wbfhisJsfvYiOfqMVEG
   ZxO3t0durCsafLm31dlzRm09jttbjH+/izxD6DCe2AAkvvgeNCd2vaPmR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="362020733"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="362020733"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 02:49:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="650455823"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 22 Sep 2022 02:49:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1obIpX-005ww7-04;
        Thu, 22 Sep 2022 12:49:15 +0300
Date:   Thu, 22 Sep 2022 12:49:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Borislav Petkov <bp@suse.de>
Cc:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, wsa@kernel.org,
        rrangel@chromium.org, upstream@semihalf.com,
        Muralidhara M K <muralimk@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
Message-ID: <YywvmueFj/ibyZdf@smile.fi.intel.com>
References: <20220916131854.687371-1-jsd@semihalf.com>
 <20220916131854.687371-2-jsd@semihalf.com>
 <eafc7bb5-a406-132b-4b7d-167917cdab05@amd.com>
 <CAOtMz3Pgh+cERiXVetDZJrQa9C0kUUbZ9dRRhdghgm5Or8kwhg@mail.gmail.com>
 <YytwNvSyhq380YNT@zn.tnic>
 <60a52348-7d50-1056-a596-e154f87c99d2@amd.com>
 <Yyt5LSxSz+6QeWF1@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yyt5LSxSz+6QeWF1@zn.tnic>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 21, 2022 at 10:50:53PM +0200, Borislav Petkov wrote:
> On Wed, Sep 21, 2022 at 03:19:26PM -0500, Limonciello, Mario wrote:
> > Jan mentioned this in the commit message:
> > 
> > > The function which registers i2c-designware-platdrv is a
> > > subsys_initcall that is executed before fs_initcall (when enumeration > of
> > NB descriptors occurs).
> > 
> > So if it's not exported again, then it means that we somehow
> > need to get i2c-designware-platdrv to register earlier too.
> 
> So I have this there:
> 
> /* This has to go after the PCI subsystem */
> fs_initcall(init_amd_nbs);
> 
> as I need PCI. It itself does
> 
> arch_initcall(pci_arch_init);
> 
> so I guess init_amd_nbs() could be a subsys_initcall...
> 
> Or why is
> 
> subsys_initcall(dw_i2c_init_driver);
> 
> a subsys initcall in the first place?
> 
> Looking at
> 
>   104522806a7d ("i2c: designware: dw_i2c_init_driver as subsys initcall")
> 
> I don't see a particular reason why it should be a subsys_initcall...
> 
> In any case, this should be fixed without an export which was crap in
> the first place.
> 
> Hm.

I'm speculating here, but IIRC the I2C controllers may serve PMICs on some
platform that are required to be present earlier due to some ACPI code
accessing them. This Hans de Goede can confirm or correct me.

Another case comes to my mind is that I2C framework wants to initialize I2C
peripherals which were supplied via struct i2c_board_info on earlier stages.
And again comes to the specifics of the certain peripherals that needs for
power / reset / etc control, i.o.w. critical hardware for the platforms.

But it's still what I remember and I can be mistaken.

-- 
With Best Regards,
Andy Shevchenko


