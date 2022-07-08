Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 393E756B636
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jul 2022 12:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237264AbiGHKCa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jul 2022 06:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237206AbiGHKC3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jul 2022 06:02:29 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F50183F21;
        Fri,  8 Jul 2022 03:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657274548; x=1688810548;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=EjsGyq7lBhFJhuDcCb83ax8lTh/YEIc9jr/nHR/gFQw=;
  b=Pz8YNt24LuuFv8d/ojIRLG3IVZaZxqvUnP0aUoNGLpGLtA7n4Pul7yVU
   vokHt/Q+xjA19LcDdNa/LFjfKGLizRVe64USX9AMiclNsF4YtMA/3v8pV
   K6ahPxE16jtB63CKuq0dEx0lrEVt2OBejihZVVurfHQuHFTYf658FpvAk
   HhjOUguZGIU4HX1OcNGMcx9dAnfzwk7nf9lmhBhi6I8xBAEY9rYRfQ/Ki
   U2AIv1CS15rpTevNS+2a9R1vWYHim+PsMScCoUQQmPlGRSZx6QyA0XaxZ
   /h3JkfntC9mPsoG9H+LgHjnpfbB/ypIB7lP4/6qGDFh/JDZ8ma6t/Xc6O
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="281796207"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="281796207"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 03:02:28 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="651510381"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 03:02:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o9koa-0017xl-2z;
        Fri, 08 Jul 2022 13:02:24 +0300
Date:   Fri, 8 Jul 2022 13:02:24 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: scmi: Replace open coded acpi_match_device()
Message-ID: <YsgAsJzerWxWW65n@smile.fi.intel.com>
References: <20220630195541.4368-1-andriy.shevchenko@linux.intel.com>
 <Yr7fuWADLhJSeYdZ@smile.fi.intel.com>
 <YsXjNd4qnopeo2rV@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsXjNd4qnopeo2rV@shikoro>
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

On Wed, Jul 06, 2022 at 09:32:05PM +0200, Wolfram Sang wrote:
> 
> > Discard this, a last minute change that makes it not buildable.
> 
> Do you plan to send an update?

Just did it.

-- 
With Best Regards,
Andy Shevchenko


