Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97C6573D95C
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jun 2023 10:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbjFZIP2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jun 2023 04:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjFZIP1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jun 2023 04:15:27 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8485C83;
        Mon, 26 Jun 2023 01:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687767326; x=1719303326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=idVIrM6nyAePhdkzWQmk/OgLjJRW7dN8sqMUgjM5mCI=;
  b=mYS2/aengGAQM6vtddsM89ph6r2zI1AHmaJE5rXG0t7ObD3p9PxH5GrL
   t5ODnTr4rJyZ7D9/Tqqou4anZ+wdBhJBjwSDi5ICInxhjoklEYiB7wKQp
   oz4g7dLETgwWx1J3gBlRvf91hm/hqytJL6w3fqKPA8IkhYMhGsyosSK2x
   99z0hzD0TIB+412WIWGBfchT4pBov4+R9Gg074+ejd34SjIqnl60PTS7i
   eK7rcqrZCr62OkCJhsjkQHXNCMCAXzqIIhfbjDWWuXZ7GdKK4c/zZE7qs
   5HvB6wIfQpa/G9effpxxOOsINXn+A1uky/9QzW0d1RbBXQ7pCThsAIt9D
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="360073798"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="360073798"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 01:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="786058375"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="786058375"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jun 2023 01:15:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qDhNX-006eMM-0H;
        Mon, 26 Jun 2023 11:15:19 +0300
Date:   Mon, 26 Jun 2023 11:15:18 +0300
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
Message-ID: <ZJlJFtsXoC6JyLxY@smile.fi.intel.com>
References: <20230621151652.79579-1-andriy.shevchenko@linux.intel.com>
 <CAJZ5v0jt8XCzUxQaBXLz0zXezih1Urq=dt-K9PWVY1JpN=Go6Q@mail.gmail.com>
 <ZJSQf07cO6qmNyCn@smile.fi.intel.com>
 <CAJZ5v0iKLtQpUnhMqB6zgwbURXGFZkje5rNORS9MLqYN=13nWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0iKLtQpUnhMqB6zgwbURXGFZkje5rNORS9MLqYN=13nWg@mail.gmail.com>
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

On Fri, Jun 23, 2023 at 04:43:55PM +0200, Rafael J. Wysocki wrote:
> On Thu, Jun 22, 2023 at 8:19 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Jun 22, 2023 at 05:53:13PM +0200, Rafael J. Wysocki wrote:
> > > On Wed, Jun 21, 2023 at 5:16 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:

...

> > /* Check if the device has resources provided by _CRS method */
> > #define ACPI_PLATFORM_CHECK_RES         BIT(0)
> >
> > ?
> 
> Could be, but this is specific to forbidden_ids_list[].  Maybe
> ACPI_ALLOW_WO_RESOURCES or similar.

Got it, will do this way.

...

> BTW, this doesn't need to increment the count even.  It could just
> terminate the walk on the first valid resource found and tell the
> caller to return true in that case.

Indeed, thank you for the hint!

-- 
With Best Regards,
Andy Shevchenko


