Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 650CF6ABE57
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Mar 2023 12:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbjCFLhm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Mar 2023 06:37:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbjCFLhl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Mar 2023 06:37:41 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B23C028D24;
        Mon,  6 Mar 2023 03:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678102659; x=1709638659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=QC/BDLv62Qyo3q2kdtORu01ceJMJmAMax/5M3imOBgA=;
  b=Qvcm6taPz6m/SUo2hfFOL6NWJH5qwIzZAWTPY9VeQW0bJb9a0J/uyPGi
   Jjs31icBfewEXBy6eDbF4NFoZLoT3fuiGzyWYER+qjj+1S09fczK6uC6g
   lM2Br7TYH9cc8iaDUBehjsv0KOi7ON072MvOkGaXpIRBKNZs95FRjyGTx
   Bwa5YGwCynk4xM5698qhtckMpWnz75eEi/8645x4ghatRTtqNE7aIjyq0
   MNwezRaZ2MHMKU6HqVHuTWrEdrPVhG4Xh8Y01cZ4+i5J6XHdbrQrL+2Ic
   U5UdTrRFz7WyIGiDPDgV5oyY+YIM5usVHaVxjko+0RRduAG+k+Xos0zag
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="333006416"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="333006416"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 03:37:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="626129905"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="626129905"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 06 Mar 2023 03:37:36 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pZ99q-00GKLB-0y;
        Mon, 06 Mar 2023 13:37:34 +0200
Date:   Mon, 6 Mar 2023 13:37:33 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc:     Grzegorz Bernacki <gjb@semihalf.com>,
        Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>,
        "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
        "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 8/9] i2c: designware: Add doorbell support for Skyrim
Message-ID: <ZAXQffqGWJLm8vFQ@smile.fi.intel.com>
References: <20230302194235.1724-1-mario.limonciello@amd.com>
 <20230302194235.1724-9-mario.limonciello@amd.com>
 <CAA2Cew5YyufrBZqAA4A5R=1vf_dn=c3ftwziTjzFSm8S5LJZGg@mail.gmail.com>
 <MN0PR12MB61010A9EEBEC94330A7E9702E2B39@MN0PR12MB6101.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MN0PR12MB61010A9EEBEC94330A7E9702E2B39@MN0PR12MB6101.namprd12.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 03, 2023 at 03:00:55PM +0000, Limonciello, Mario wrote:
> > -----Original Message-----
> > From: Grzegorz Bernacki <gjb@semihalf.com>
> > Sent: Friday, March 3, 2023 06:00

> > I am not sure if adding a new ACPI ID is a good idea. Actually we are
> > talking about the same devices. The only difference is in the
> > communication protocol between PSP and CPU. This could be easily
> > detected at runtime by checking cpu id. There is no need to introduce
> > a new id and create dependency on the FW version.
> 
> An ACPI ID seems more scalable to me to represent the difference in protocol.
> Otherwise what happens when the follow on to Skyrim comes?  Do you add
> a new ID/case to the code?  If it was an ACPI ID then it's a one line change
> in the firmware to represent this.
> 
> What I'll do for v3 is do with a CPU ID in this patch, and then introduce an ACPI
> ID in a new patch.  You can test it without the ACPI ID, and when it's working
> patch the BIOS with the new ID and see if that continues to work.

I don't think we need this complexity.

Please, use just an ACPI ID and that's it. For testing one may apply additional
(HACK) patch(es).

As telling from my experience, to distinguish such things via CPU ID is a bad
idea. Yes, we (used?) to have a PITA (find yourself what this stands for :)
times with the (mixed) approach. So, no, please don't add CPU ID into the I²C
platform driver (keyword: platform).

-- 
With Best Regards,
Andy Shevchenko


