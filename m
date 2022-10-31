Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E89C0613A67
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Oct 2022 16:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbiJaPm3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Oct 2022 11:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231880AbiJaPm2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Oct 2022 11:42:28 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD86E6598;
        Mon, 31 Oct 2022 08:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667230946; x=1698766946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pccmZ2wu/F/RQoaJULqDUPUNbab1oATh54UEl4dbLlQ=;
  b=W18jj3gbd3M+8K76L8BcHKNPudiDCcnk7vCWHf6HwqxEVmb2YnIjcf2m
   BQNfFzKE4Dy1Ftz61TsPVYUDmvyR7Uw0Uf1J1GcLbw3EafaYt3ASY3Xic
   0gJQnxW4U6vRJLquqlUfWnMTCQIcvwZM6Vy+8mTd3pDD0eOc8XCi2dtBg
   QHy7H7h2KE9oGGc+2wY/Apeeh33GvlRWO9G2X3iORvdmLd11wj4WlYmrI
   VhvShBQUk0PtvkI1LTxCxBTBTnKd5U2l+HCbji2jL0gSK/bug0519tl0o
   WXaKqdmbzs/4YK3tIbBGtJeB4JZs3JNSIuQoLuxIDnL3bcNniJMy3LDsj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="306546564"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; 
   d="scan'208";a="306546564"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2022 08:42:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="628278350"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; 
   d="scan'208";a="628278350"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 31 Oct 2022 08:42:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1opWva-005B6a-18;
        Mon, 31 Oct 2022 17:42:18 +0200
Date:   Mon, 31 Oct 2022 17:42:18 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     chenweilong <chenweilong@huawei.com>
Cc:     yangyicong@hisilicon.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, wsa@kernel.org,
        f.fainelli@gmail.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, william.zhang@broadcom.com, jsd@semihalf.com,
        conor.dooley@microchip.com, phil.edworthy@renesas.com,
        tharunkumar.pasumarthi@microchip.com, semen.protsenko@linaro.org,
        kfting@nuvoton.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH next v9 1/4] i2c: hisi: Add initial device tree support
Message-ID: <Y1/s2iZFod/7qzU+@smile.fi.intel.com>
References: <20221029115937.179788-1-chenweilong@huawei.com>
 <Y170TZoIp1WBIwU4@smile.fi.intel.com>
 <dfc1c006-61c0-8f28-6164-060347c69d04@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dfc1c006-61c0-8f28-6164-060347c69d04@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-8.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 31, 2022 at 09:57:51AM +0800, chenweilong wrote:
> On 2022/10/31 6:01, Andy Shevchenko wrote:
> > On Sat, Oct 29, 2022 at 07:59:36PM +0800, Weilong Chen wrote:
> >> The HiSilicon I2C controller can be used on embedded platform, which
> >> boot from devicetree.
> > ...
> >
> >> +#include <linux/acpi.h>
> >> +#include <linux/of.h>
> > Why?
> >
> > ...
> >
> >> +#ifdef CONFIG_ACPI
> > Why?
> >
> > ...
> >
> >> +#ifdef CONFIG_OF
> > Why?
> >
> > ...
> >
> >> -		.acpi_match_table = hisi_i2c_acpi_ids,
> >> +		.acpi_match_table = ACPI_PTR(hisi_i2c_acpi_ids),
> > Why?
> >
> > ...
> >
> >> +		.of_match_table = of_match_ptr(hisi_i2c_dts_ids),
> > Why of_match_ptr()?
> 
> There's a lot of drivers use of_match_ptr/ACPI_PTR to protect the of_device_id and
> have explicit headers file references to linux/acpi.h or linux/of.h, such as
> drivers/media/platform/intel/pxa_camera.c,
> bluetooth/hci_intel.c, 
> platform/x86/intel/chtwc_int33fe.c,
> platform/x86/intel/pmc/core.c and so on.

We have a lot of the legacy or not-up-to-dated to all new kernel APIs code.
Does it justify not to use the new approach in the new contribution?

...

> The acpi.h and of.h have a nice function or macro definition if CONFIG_OF/ACPI is not satisfy,
> for example:
> 
> #define ACPI_PTR(_ptr)  (_ptr)  vs  #define ACPI_PTR(_ptr)  (NULL)
> 
> and also a lot of 'static inline' function there.

And why do you need it?

...

> Seems a good idea to remove all of them, the codes your noted may look a bit
> verbose there. But I think it is valuable for a driver and device ,telling
> users it support acpi boot or is it just embedded.

So, what do we gain here?

(Fill the "Advantages of your code" section below)

Disadvantages of your code:
- ugly ifdeffery which we usually do not appreciate
- in some cases it's good to have OF ID table on ACPI platforms (see what
  PRP0001 trick is)
- use old approach for the compiler on how to avoid warnings of the static
  variables being defined and not used (note, neither ACPI_PTR() nor
  of_match_ptr() provides a new approach on that, so you have to amend them
  first)
- as a side effect additional headers to be included that are used for 1% or
  less of their capacity and slow down the compilation

-- 
With Best Regards,
Andy Shevchenko


