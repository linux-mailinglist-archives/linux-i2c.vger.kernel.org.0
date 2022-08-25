Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8568F5A1811
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Aug 2022 19:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236250AbiHYRmL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Aug 2022 13:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234681AbiHYRmL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Aug 2022 13:42:11 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A16B2D9E
        for <linux-i2c@vger.kernel.org>; Thu, 25 Aug 2022 10:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661449330; x=1692985330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=whLzew7c+UJd3Xaz2sbK6EbA5wL9tEyfergTTlg/2JE=;
  b=b3QcQ1ZEPWYS9/0QsqUfMxSgUsWtxd8TWfH3bk4BbfPTTi0OrvuEOrlf
   +2l3f8j1lYRXn9VpgnB4Bk3PHAMtxBQC6BuP/D9lb25XynXdMTt6zBKCE
   FDyM89KgTrdFbxmqgrmF0bGI41Hd0nPC7bMiHJtD3HAAkTCLC3rzgG0Ku
   ZbsnT37Y7Ub+4nYCn8XsO4YeA7TDEOOI/KqKA/BxJ8KKunGHucLY8M6A5
   3wtJ90CzB+8b7IEPJ7CT/6dFA0zeLIFQY3o/Kt2G+4mrkkH11qGbKwhwM
   BYrjVpc+fR8kYGi2nVhG2J0MvxcZqVYNz+V0ZLXFLnqU97lE95HphI1ww
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="277329475"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="277329475"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 10:41:24 -0700
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="643345906"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 10:41:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oRGr2-003V1H-1r;
        Thu, 25 Aug 2022 20:41:20 +0300
Date:   Thu, 25 Aug 2022 20:41:20 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Josef Johansson <josef@oderland.se>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v3 1/1] i2c: scmi: Replace open coded
 device_get_match_data()
Message-ID: <Ywe0QPP9jE/uSgPa@smile.fi.intel.com>
References: <20220708120958.74034-1-andriy.shevchenkolinux!intel!com>
 <4d2d5b04-0b6c-1cb1-a63f-dc06dfe1b5da@oderland.se>
 <YweRxiJl5zzufXUl@smile.fi.intel.com>
 <aa5f706a-6759-0fce-054e-daccb544d2fd@oderland.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa5f706a-6759-0fce-054e-daccb544d2fd@oderland.se>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 25, 2022 at 06:54:29PM +0200, Josef Johansson wrote:
> On 8/25/22 17:14, Andy Shevchenko wrote:
> > On Tue, Aug 16, 2022 at 08:03:33AM +0200, Josef Johansson wrote:
> > > On 7/8/22 14:09, Andy Shevchenko wrote:
> > > I tried build Linux 6.0 and run under Xen 4.14.5. I got a kernel null pointer dereferenced while booting. Reverting this commit allowed the system to boot.
> > > 
> > > Since I do not have any way of capturing the error except camera (it's a long message), here's my best try.
> > > 
> > > BUG: kernel NULL pointer dereference, address: 0000000000000000
> > I think I know what happens there. Can you test a hackpatch (below)
> > with my patch _not being reverted_?
> > 
> > diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
> > index 79798fc7462a..3ed1758706b0 100644
> > --- a/drivers/i2c/busses/i2c-scmi.c
> > +++ b/drivers/i2c/busses/i2c-scmi.c
> > @@ -426,6 +426,9 @@ static struct acpi_driver acpi_smbus_cmi_driver = {
> >   		.add = acpi_smbus_cmi_add,
> >   		.remove = acpi_smbus_cmi_remove,
> >   	},
> > +	.drv = {
> > +		.acpi_match_table = acpi_smbus_cmi_ids,
> > +	},
> >   };
> >   module_acpi_driver(acpi_smbus_cmi_driver);
> > 
> Hi,
> 
> I applied your patch and the system boots now. Good job :)

Yeah, but the initial conversion will be transformed to much bigger since
maintainer doesn't want the fix in the ACPI glue code for the (deprecated)
ACPI drivers.

So there will be no patches soon, but I will Cc you to anything
I will come up with in the future. Thanks for testing and reporting!

-- 
With Best Regards,
Andy Shevchenko


