Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 468FB66DB4F
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 11:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236536AbjAQKkb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 05:40:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236680AbjAQKji (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 05:39:38 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693481CAE0
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 02:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673951907; x=1705487907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8ASpjenPwnDgr7DV6VfyP8KtVoEVIrmdS+fPVo3KOKw=;
  b=K7R/H4iHi8Gql2no/CBZOAhS+ue6KKoSbLp+mUN6iukJd2ZrZI3gXzZx
   VS1QUy+6uyWGPAilgwX3g2R4xOfiKWB7b26ezt2M6dwROnHWGwZ2w2FB7
   CbMgt0pYEgmUMpQ292WOS9hMwuo+jWWc/pDRwsThQrDBUMBjlNBic9Tgm
   reSHwioQO7rwSxpI4+FOnGizZaQsE5IvsjKAKnDn9Wc6i4y0qQ7HZIeRz
   GTvCqGJiy5fJ+bkflC/DK+5oxopQV+edioEJF16TXAuWeqO2Rqlr5ZgwL
   YnVaLLdfpe7iiqqHvBpll/kkYH8WSdDxVmb5IQW/bXxQ3RDlzcFh4rkVr
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="324717302"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="324717302"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 02:38:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="783197729"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="783197729"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 17 Jan 2023 02:38:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pHjMF-00AVin-2F;
        Tue, 17 Jan 2023 12:38:23 +0200
Date:   Tue, 17 Jan 2023 12:38:23 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: add a new bit check for IC_CON control
Message-ID: <Y8Z6n7HEXBQx6Nxg@smile.fi.intel.com>
References: <20230116043500.413499-1-Shyam-sundar.S-k@amd.com>
 <59fbf54d-9bbc-efaa-bb2a-74880156e310@linux.intel.com>
 <fda9b261-0b42-1c13-b40c-8ad93088cbf2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fda9b261-0b42-1c13-b40c-8ad93088cbf2@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 17, 2023 at 04:01:21PM +0530, Shyam Sundar S K wrote:
> On 1/16/2023 3:08 PM, Jarkko Nikula wrote:
> > On 1/16/23 06:35, Shyam Sundar S K wrote:
> >> On some AMD platforms, based on the new designware datasheet,
> >> BIOS sets the BIT(11) within the IC_CON register to advertise
> >> the "bus clear feature capability".
> >>
> >> Since the current driver implementation completely ignores what
> >> is advertised by BIOS, we just build the master_cfg and
> >> overwrite the entire thing into IC_CON during
> >> i2c_dw_configure_master().
> >>
> >> Since, the bus clear feature is not enabled, sometimes there is
> >> no way to reset if the BIT(11) is not set.
> >>
> >> AMD/Designware datasheet says:
> >>
> >> Bit(11) BUS_CLEAR_FEATURE_CTRL. Read-write,Volatile. Reset: 0.
> >> Description: In Master mode:
> >> - 1'b1: Bus Clear Feature is enabled.
> >> - 1'b0: Bus Clear Feature is Disabled.
> >> In Slave mode, this register bit is not applicable.
> >>
> >> Hence add a check in i2c_dw_configure_master() that if the BIOS
> >> advertises the bus clear feature, let driver not ignore it and
> >> adapt accordingly.

...

> > Is this change alone enough? I understood from the specification that
> > the SCL/SDA stuck low timeout registers should be set and a bus recovery
> > procedure (additional code) is required.
> 
> Double checked with our HW and FW teams, and understand that (atleast in
> AMD platform designs):
> 
> 1. BIOS actually programs the BUS_CLEAR_FEATURE_CTRL and also enables
> the detection of SCL/SDA stuck low.
> 2. Whenever the stuck low is detected, the SMU FW shall do the bus
> recovery procedure.
> 
> Currently, the way in which the "master_cfg" is built in the driver it
> overrides the BUS_CLEAR_FEATURE_CTRL advertised by BIOS and the SMU FW
> cannot initiate the bus recovery if the stuck low is detected.
> 
> Hence this proposed check should be sufficient enough.

Maybe you should elaborate this in the commit message and/or the code.

-- 
With Best Regards,
Andy Shevchenko


