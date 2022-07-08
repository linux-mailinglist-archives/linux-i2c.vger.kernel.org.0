Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6B956C399
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jul 2022 01:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238387AbiGHVb0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jul 2022 17:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238368AbiGHVbY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jul 2022 17:31:24 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05EE39FE30;
        Fri,  8 Jul 2022 14:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657315884; x=1688851884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8glBkFV6dO5pltOl2NLTXJxSpJypr9SAuPCGEx1OqtM=;
  b=NSu9sE30DEDPm4VOiJY5WTUl4waQWrmmu9JdPJsmQMNnyokEDvg1/P9h
   UfDoB8aETpoQeSPrbWZEDG8KJ79p9lAjG9kphOOV4XpRFnFm4J7DsKpUT
   GeFp/1ZuD6xBXRTkp1oHsLzVYRsWzbbtm6J0ToG3GvftT0VWQEATaNxBD
   5R9xT6XQ5u1JrIenWZ+/a81LKS2JgO7xaYRZyd2OaEvpi+TG97HYGLiHI
   2wQ9DJQ93w8nvHv3ANHwh9Yv0ztlN3oX4/nV+pv99MY2NAioNL1bujTrD
   +rCDQ4bAjfNa3Woyvcp26uYCYV5/EQdpU+W9EjBatBsLQxnXrM02xDbAv
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="284392675"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="284392675"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 14:31:23 -0700
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="621372477"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 14:31:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o9vZE-0018qY-1T;
        Sat, 09 Jul 2022 00:31:16 +0300
Date:   Sat, 9 Jul 2022 00:31:16 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Len Brown <lenb@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v1 1/5] ACPI: utils: Introduce
 acpi_match_video_device_handle() helper
Message-ID: <YsiiJFdbFVLyRL6i@smile.fi.intel.com>
References: <20220630212819.42958-1-andriy.shevchenko@linux.intel.com>
 <Yr6KcPlC/3rYAtKE@lahna>
 <CAJZ5v0ht6hfaBsifhr=M_htHh6uHohwgcab2dFR5hqq4rO+xFQ@mail.gmail.com>
 <YsihLEX3At421cAK@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsihLEX3At421cAK@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jul 09, 2022 at 12:27:09AM +0300, Andy Shevchenko wrote:
> On Tue, Jul 05, 2022 at 08:40:30PM +0200, Rafael J. Wysocki wrote:
> > On Fri, Jul 1, 2022 at 7:47 AM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > > On Fri, Jul 01, 2022 at 12:28:15AM +0300, Andy Shevchenko wrote:

...

> > > >  extern long acpi_is_video_device(acpi_handle handle);
> > > > +extern bool acpi_match_video_device_handle(acpi_handle handle);

> > > I think we can do slightly better here. The only caller of
> > > acpi_is_video_device() is in drivers/acpi/video_detect.c so we can move
> > > it there and make it static (is_video_device()).
> 
> AFAICS, the scan.c is user of it as well.
> 
> > > Then we can name this one acpi_is_video_device() instead and in addition
> > > make it take struct acpi_device as parameter instead of acpi_handle (I
> > > think we should not use acpi_handles in drivers if possible).
> > 
> > Agreed.
> 
> Not sure it will help to have acpi device since most of the callers asks for
> handle to be checked.

Actually it's 2:2 now. I'm fine with ACPI device and name like

	acpi_dev_is_video_device()

> Taking into account above, what we can do is to rename it to
> 
> 	acpi_handle_is_video_device()
> 
> which should be clearer than initial proposal.
> 
> Thoughts?

-- 
With Best Regards,
Andy Shevchenko


