Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC32E56C38A
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jul 2022 01:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240135AbiGHV1S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jul 2022 17:27:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238520AbiGHV1R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jul 2022 17:27:17 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D33B24BC4;
        Fri,  8 Jul 2022 14:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657315636; x=1688851636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/g4mtROTOBVuUxZNYOgmva+gD7qdsf4Jg2P69fXsDec=;
  b=M1ZCE2/41095iMdCGB+qtTtwJmEvIE90JT0VBh7nTGb5ayHJoNZ+IobB
   /rhVt5IEEoloysOLJo2HEYmT+mBDGZf9sLVzr+RzOyV1JOVtn8SeVeTf4
   rQaoZpcE4j0TCb0asZuAxucRlIjS4DrIiag1nkuCYaE47twJSWM7kHUEb
   trRSMlUvvqtq+DiaiNcX84BFjGv1sjyU9xBCA7mTpV+W0SWAgaB+dA1Qe
   kqDxGu19QmqgT+WbkDRDI6qEdwxuLo6gEYhXhGhqaliUq8wa09n0eFj2R
   o73rKS5x+5znCXhonBfsNrDuxvn6i1ELVAixYFX/KekhQQbCks4VDvE2g
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="285109709"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="285109709"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 14:27:15 -0700
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="661902889"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 14:27:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o9vVF-0018q7-0K;
        Sat, 09 Jul 2022 00:27:09 +0300
Date:   Sat, 9 Jul 2022 00:27:08 +0300
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
Message-ID: <YsihLEX3At421cAK@smile.fi.intel.com>
References: <20220630212819.42958-1-andriy.shevchenko@linux.intel.com>
 <Yr6KcPlC/3rYAtKE@lahna>
 <CAJZ5v0ht6hfaBsifhr=M_htHh6uHohwgcab2dFR5hqq4rO+xFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0ht6hfaBsifhr=M_htHh6uHohwgcab2dFR5hqq4rO+xFQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jul 05, 2022 at 08:40:30PM +0200, Rafael J. Wysocki wrote:
> On Fri, Jul 1, 2022 at 7:47 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Fri, Jul 01, 2022 at 12:28:15AM +0300, Andy Shevchenko wrote:
> > >  extern long acpi_is_video_device(acpi_handle handle);
> > > +extern bool acpi_match_video_device_handle(acpi_handle handle);
> >
> > I think we can do slightly better here. The only caller of
> > acpi_is_video_device() is in drivers/acpi/video_detect.c so we can move
> > it there and make it static (is_video_device()).

AFAICS, the scan.c is user of it as well.

> > Then we can name this one acpi_is_video_device() instead and in addition
> > make it take struct acpi_device as parameter instead of acpi_handle (I
> > think we should not use acpi_handles in drivers if possible).
> 
> Agreed.

Not sure it will help to have acpi device since most of the callers asks for
handle to be checked.

Taking into account above, what we can do is to rename it to

	acpi_handle_is_video_device()

which should be clearer than initial proposal.

Thoughts?

-- 
With Best Regards,
Andy Shevchenko


