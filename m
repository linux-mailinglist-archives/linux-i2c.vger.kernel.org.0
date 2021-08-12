Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFE633EA28D
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Aug 2021 11:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236562AbhHLJ6E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Aug 2021 05:58:04 -0400
Received: from mga05.intel.com ([192.55.52.43]:13684 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236556AbhHLJ6E (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 12 Aug 2021 05:58:04 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="300903463"
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="300903463"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2021 02:57:39 -0700
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="485318501"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2021 02:57:38 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mE7Su-008XlM-Bq; Thu, 12 Aug 2021 12:57:32 +0300
Date:   Thu, 12 Aug 2021 12:57:32 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 8/9] i2c: i801: Improve
 register_dell_lis3lv02d_i2c_device
Message-ID: <YRTwjDn26fabfZDA@smile.fi.intel.com>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <3ce2ea87-809e-5999-e920-07ddd5fcc035@gmail.com>
 <YRPyUM/nGD3dQv9C@smile.fi.intel.com>
 <8ba091fd-b6ff-e800-1c46-aaf9992f1e03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ba091fd-b6ff-e800-1c46-aaf9992f1e03@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 11, 2021 at 11:05:06PM +0200, Heiner Kallweit wrote:
> On 11.08.2021 17:52, Andy Shevchenko wrote:
> > On Fri, Aug 06, 2021 at 11:18:05PM +0200, Heiner Kallweit wrote:
> >> - Use an initializer for struct i2c_board_info info
> >> - Use dmi_match()
> >> - Simplify loop logic
> > 
> > I'm wondering if changing this to a DMI match table will give better result.
> > 
> > Something like
> > (Sorry I forgot APIs, but plenty of examples are under PDx86: drivers/platform/x86):
> > 
> > struct dmi_..._id *id;
> > 
> > id = dmi_..._match();
> > if (!id) {
> > 	pci_warn();
> > 	return;
> > }
> > 
> > i2c_new_client_device(...);
> > 
> We could do something like the following. Whether it's better may be a
> question of personal taste. I have no strong opinion here and would leave
> it to Jean.
> 
> const struct dmi_system_id lis3_id_table[] = {
>         {
>                 .driver_data = (void *)0x29,
>                 .matches = {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5550"),
>                 },
>         },
> 	...
> 
> dmi_system_id *id = dmi_first_match(lis3_id_table);
> if (id)
> 	i2c_new_client_device(..., (unsigned int)id->driver_data;
> else
> 	lament()

Yep, my point here that this has less indentation of the code, no unneeded
for-loop (which will be inside DMI APIs, etc).

But yes, I agree that this is rather matter of taste.

-- 
With Best Regards,
Andy Shevchenko


