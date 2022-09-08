Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 980BA5B1989
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Sep 2022 12:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbiIHKCh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Sep 2022 06:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbiIHKCf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Sep 2022 06:02:35 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DED5DE4DF3;
        Thu,  8 Sep 2022 03:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662631354; x=1694167354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RPZysXr4Y2V2xG7v9fsc8pk681BFZx9MpdstXcZ4B0w=;
  b=DrnhusVlJelPnD6HR2gvGeSl5y/kltXFfhI6qAk+zPXvCYjvEs9iY3nq
   rhjRMNChIs6SGKodgTQvs6xg21TwZWuQKuI7YxRKAjgSBnPLtz35aI/T0
   KGcNMV1LuVGABcYDiCVC0+Dbf9HiN88q6DSL+BntohV0cZRnyQr2CqoUx
   aSftM5feX2ckhKXCCBZWcGf+yRcUKPkHrSmkz9lyjTiYGJEonZbQerNYM
   h3vkjim8WbvqnGqnF4Iish78IwBSiYRUhrMZSvMM+8V97BkpOnjQ+Kw3n
   ujSBcYXSeulT+Ytm5Ey6CTEA7Jt+WoOaMENy0/nZ5+w5blRaFbZfclj/D
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="358858013"
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="358858013"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 03:02:34 -0700
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="617417161"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 03:02:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oWEMg-00A4M4-1q;
        Thu, 08 Sep 2022 13:02:30 +0300
Date:   Thu, 8 Sep 2022 13:02:30 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Josef Johansson <josef@oderland.se>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: scmi: Convert to be a platform driver
Message-ID: <Yxm9tlb4H7fspRMZ@smile.fi.intel.com>
References: <20220906155507.39483-1-andriy.shevchenko@linux.intel.com>
 <Yxj1ZQjBfdG1u93d@shikoro>
 <23c8fafe-af56-afb0-1257-222705bc36f3@oderland.se>
 <b8eff79f-0be0-e6a5-64ba-e085b0ea52b2@oderland.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8eff79f-0be0-e6a5-64ba-e085b0ea52b2@oderland.se>
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

On Thu, Sep 08, 2022 at 09:48:29AM +0200, Josef Johansson wrote:
> On 9/8/22 08:07, Josef Johansson wrote:
> > On 9/7/22 21:47, Wolfram Sang wrote:
> > > On Tue, Sep 06, 2022 at 06:55:07PM +0300, Andy Shevchenko wrote:
> > > > ACPI core in conjunction with platform driver core provides
> > > > an infrastructure to enumerate ACPI devices. Use it in order
> > > > to remove a lot of boilerplate code.
> > > > 
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Josef, do you have resources to test this patch before I apply it?
> > > 
> > Yes, I'll make that happen today.
> Hi,
> 
> I compiled with linux-6.0.0-rc4 with your patch on top.
> 
> Have been running flawless so far. Boot showed no problems.
> 
> Thanks!

Thank you!

-- 
With Best Regards,
Andy Shevchenko


