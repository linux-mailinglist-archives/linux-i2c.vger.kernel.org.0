Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8E164832A
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Dec 2022 15:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiLIOEV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Dec 2022 09:04:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiLIOET (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Dec 2022 09:04:19 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 364146C731;
        Fri,  9 Dec 2022 06:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670594658; x=1702130658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xRDLAgO0B0bki/4vlcUzPPWeDY+4XUKMNAA2OHnB5WI=;
  b=hgww7odzgNhDbqQfsW4qopKa2e69Upb9NZXuOz7yh9HHJ/UC3vmQ29TC
   N2U9I/XGq9rzo7AAuB5XKpXIo+sjDcOxWmvDk7/Abuk3nqdgRCg8vXRw9
   tHRtw2DjenpvKf17CiaNKljLPEt3wGHK4vj6rLTvK6EX5f5hzoti85QeL
   EpR7GBnuRbJIli7LZ1w0MaRAbSp+6sru4T7ICPI/m9OnZCSrxiD2qJB7H
   Hh/6T+hLbK1/yKaSr5M49eygbNCyfp/Jufq+DYFov6qGbhu5o9nWkFLYK
   kxm4VxDSIDVcRRcE8vjga0GVyqTbsRBkX+FtXss6AcSr/j9WukWA48gBt
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="305105839"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="305105839"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 06:04:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="678159905"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="678159905"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 09 Dec 2022 06:04:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p3dz3-006yRX-0f;
        Fri, 09 Dec 2022 16:04:13 +0200
Date:   Fri, 9 Dec 2022 16:04:12 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Richard Fitzgerald <rf@opensource.cirrus.com>, wsa@kernel.org,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] i2c: designware: Fix unbalanced suspended flag
Message-ID: <Y5NAXP718ZS2CZUb@smile.fi.intel.com>
References: <20221209114034.18025-1-rf@opensource.cirrus.com>
 <e9d113fb-5cd1-d93d-3d8f-fa9c1e55a8e2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9d113fb-5cd1-d93d-3d8f-fa9c1e55a8e2@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 09, 2022 at 01:15:21PM +0100, Hans de Goede wrote:
> On 12/9/22 12:40, Richard Fitzgerald wrote:

...

> Did you add printk messages to the suspend/resume callbacks of
> i2c-designware-platdrv.c which show the system suspend callback
> being called but not the system resume one ?

Side note: It's better to use ftrace for that, less invasive time-wise.

...

> Did you add a printk to both the if + else paths
> and have you ever seen the controller not get
> resumed with this test added ?

-- 
With Best Regards,
Andy Shevchenko


