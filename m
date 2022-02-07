Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD7244ABE76
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 13:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383446AbiBGMJ4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 07:09:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383435AbiBGLW3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 06:22:29 -0500
X-Greylist: delayed 63 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 03:22:29 PST
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A53C043181
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 03:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644232949; x=1675768949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tR1hNw1mTA0fikhf9oODDgaBc6sgUTEIP2iw28TLVvU=;
  b=iVB6tbXnK+7c3uHKWhfZwZsEQpuXEplp4RCf5LWrzEsMvpwXyBLrg8et
   /rTuZxtlHA7OolMYcsml9RY/IQhSyaXkPV5xYqcOaipGbY6GQrDuTv+xV
   TM4DIRDsO3nhlR8xApU1iTVJ6gtqMda92YbiZSeotJn1SV5giv0WY4Yz7
   JK2GipizIQvKoFBNnVMivqODhpyO7UVMwFLgmISoUxyBIliRPMJzsqnSX
   OjLCHxsX08ZT+Pt3mTkQ7r4fd/3kz860OzUJ3IoJttV0G5+KgIm97I0m4
   qPisVIDPFkGWQukH6pSTXxB+eG1/3bf2v8S/rSBtL49q6lgf2usI8CDcV
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="248644607"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="248644607"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 03:21:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="481554308"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 03:21:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nH24H-001sW2-7O;
        Mon, 07 Feb 2022 13:20:25 +0200
Date:   Mon, 7 Feb 2022 13:20:24 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, prime.zeng@hisilicon.com,
        linuxarm@huawei.com
Subject: Re: [PATCH 1/2] i2c: hisi: Add generic GPIO bus recovery support
Message-ID: <YgEAeOmobDhqRMGx@smile.fi.intel.com>
References: <20220125124930.50369-1-yangyicong@hisilicon.com>
 <20220125124930.50369-2-yangyicong@hisilicon.com>
 <YgD/3Xi0yLPHCu+L@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgD/3Xi0yLPHCu+L@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 07, 2022 at 01:17:49PM +0200, Andy Shevchenko wrote:
> On Tue, Jan 25, 2022 at 08:49:29PM +0800, Yicong Yang wrote:
> > Add generic GPIO bus recovery support for i2c-hisi driver
> > by registering the recovery information with core provided
> > i2c_generic_scl_recovery() method.
> > 
> > As the SCL/SDA pins are multiplexed with GPIO, we need to
> > switch the pins mux to GPIO before recovery and switch back
> > after recovery. It's implemented by the ACPI method in
> > the i2c_bus_recovery_info->{prepare,unprepare}_recovery()
> > method.
> 
> NAK.
> 
> ACPI has its own resources for that. What is missed is the layer between ACPI
> and pin control.

To be more precise,

https://uefi.org/specs/ACPI/6.4/19_ASL_Reference/ACPI_Source_Language_Reference.html?highlight=pinfunction#pinconfig-pin-configuration-descriptor-macro

https://uefi.org/specs/ACPI/6.4/19_ASL_Reference/ACPI_Source_Language_Reference.html?highlight=pinfunction#pinfunction-pin-function-descriptor-macro

https://uefi.org/specs/ACPI/6.4/19_ASL_Reference/ACPI_Source_Language_Reference.html?highlight=pinfunction#pingroup-pin-group-descriptor-macro

https://uefi.org/specs/ACPI/6.4/19_ASL_Reference/ACPI_Source_Language_Reference.html?highlight=pinfunction#pingroupconfig-pin-group-configuration-descriptor-macro

-- 
With Best Regards,
Andy Shevchenko


