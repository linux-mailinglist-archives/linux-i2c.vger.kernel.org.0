Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2963D73A818
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Jun 2023 20:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbjFVST2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Jun 2023 14:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbjFVSTG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Jun 2023 14:19:06 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A39211D;
        Thu, 22 Jun 2023 11:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687457943; x=1718993943;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=lUTHnqqp11Qcu3wRI49BegX8QJeUiSLIGXhWdpB4hXE=;
  b=DWYwvrMtpbcmC5l70OBkmiWwqWMWjP+1gavgTBxoBLRe8BzZjXaoq29v
   Q7LV0IRXCtNo8GBsGm2pn9tuq1AaG6kiTzLGCvFm9mJ5zW5XwZN1dgyyG
   WRETHY5c8HsE0R/eg2jywmrTAVwMj8Q5TmPQPiw+ITMRUkm/ip4hOuXNh
   Xoi4Qz58mQjh5hKxpp0XukRJdTBfhSxdx3WZ+tSszbNLmM4UgcdwLLkUu
   Rj79X8ULs7XF1Eg2/x/6vjIw6E+n8fwNECE+J0cc5kV1FYPmI3AUWxUUH
   06UkOE1cQt9MuVaTv1/WSKwk4lBQgtmhHdp5YHOZQVf47Pw8WSVJxS/BB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="363127561"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="363127561"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 11:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="1045323418"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="1045323418"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 22 Jun 2023 11:18:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qCOtE-005pV9-0y;
        Thu, 22 Jun 2023 21:18:40 +0300
Date:   Thu, 22 Jun 2023 21:18:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, acpica-devel@lists.linuxfoundation.org,
        Len Brown <lenb@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Brunner <michael.brunner@kontron.com>
Subject: Re: [PATCH v2 1/2] ACPI: platform: Ignore SMB0001 only when it has
 resources
Message-ID: <ZJSQf07cO6qmNyCn@smile.fi.intel.com>
References: <20230621151652.79579-1-andriy.shevchenko@linux.intel.com>
 <CAJZ5v0jt8XCzUxQaBXLz0zXezih1Urq=dt-K9PWVY1JpN=Go6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0jt8XCzUxQaBXLz0zXezih1Urq=dt-K9PWVY1JpN=Go6Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 22, 2023 at 05:53:13PM +0200, Rafael J. Wysocki wrote:
> On Wed, Jun 21, 2023 at 5:16 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > After switching i2c-scmi driver to be a plaform one, it stopped
> 
> "platform"
> 
> > being enumerated on number of Kontron platforms, because it's
> > listed in the forbidden_id_list.
> >
> > To resolve the situation, split the list to generic one and
> > another that holds devices that has to be skipped if and only
> 
> "have"
> 
> > if they have bogus resources attached (_CRS method returns some).

Thanks for the typo fixes!

...

> > +static const struct acpi_device_id forbidden_id_with_resourses[] = {
> 
> I don't quite like this name and the driver_data field could be used
> to indicate the need to check the resources.

Okay, something like

/* Check if the device has resources provided by _CRS method */
#define ACPI_PLATFORM_CHECK_RES		BIT(0)

?

> > +       {"SMB0001",  0},        /* ACPI SMBUS virtual device */
> > +       { }
> > +};

...

> > +static int acpi_platform_resource_count(struct acpi_resource *ares, void *data)
> > +{
> > +       int *count = data;
> > +
> > +       *count = *count + 1;
> 
> Why not (*count)++?

Can be that way, I just copied'n'pasted from the existing code.

> > +       return 1;
> > +}

...

> >         INIT_LIST_HEAD(&resource_list);
> > +       ret = acpi_dev_get_resources(adev, &resource_list, acpi_platform_resource_count, &count);
> > +       if (ret < 0)
> > +               return ERR_PTR(ret);
> 
> Why not use acpi_walk_resources() directly here?

Can be done that way. Again, I just used a template (existing code in kernel)
for similar functionality.

> Also, this extra resources walk is only needed if the resources check
> is needed to decide whether or not to skip the device, so what's the
> benefit of doing it for every device that's not skipped?

Ah, indeed. Makes sense to have done it conditionally.

> > +       acpi_dev_free_resource_list(&resource_list);

...

Thank you for the review!

-- 
With Best Regards,
Andy Shevchenko


