Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5B87422E9
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Jun 2023 11:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbjF2JIv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Jun 2023 05:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbjF2JIu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Jun 2023 05:08:50 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA7B210B;
        Thu, 29 Jun 2023 02:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688029729; x=1719565729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SX4TAKT5s6ztRMXiDOFeBmIy1i1UvOMhH2wnpOB8Uew=;
  b=Th84bKrwqJptrGuUJvK8yRo88Dv7V8ifMm0EaRHjiBnDqMlOHvSSoWJd
   0A0otr7xNRFbyNTH1FUMb7RhNMb72I82+s69JbjDVM6ipnNx1V72oOaBc
   eybKo6d4CVPziyU3vcYGuLzGz/RLxQ+IpoCz6nA5VCq6XccwNdzi59faX
   hS6w6/0JwXREnY9LlUp3oh4jR8BohChp1cEv06ESbfx0E2H/da9JImDmi
   8dg+xAnqPghDFA81UC5I00ewTT5nX+zd07l///ZPEgB8DEYXYt0I99wtO
   J/Ku/sWyN6FzczH9Lmy9F1+NXxapaIjjdWbBTrYJ9mJ3jv5QO9lbDgxwt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="362099291"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="362099291"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 02:08:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="841384189"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="841384189"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 29 Jun 2023 02:08:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qEnds-000oFZ-2P;
        Thu, 29 Jun 2023 12:08:44 +0300
Date:   Thu, 29 Jun 2023 12:08:44 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, acpica-devel@lists.linuxfoundation.org,
        Len Brown <lenb@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v3 1/4] ACPI: bus: Constify acpi_companion_match()
 returned value
Message-ID: <ZJ1KHJW6Jhma/rHc@smile.fi.intel.com>
References: <20230626110026.65825-1-andriy.shevchenko@linux.intel.com>
 <20230626110026.65825-2-andriy.shevchenko@linux.intel.com>
 <CAJZ5v0jqP0N3=TB3w+HMwGMzctpRCjKa3a5iHKePP113T3CK-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0jqP0N3=TB3w+HMwGMzctpRCjKa3a5iHKePP113T3CK-g@mail.gmail.com>
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

On Thu, Jun 29, 2023 at 10:49:17AM +0200, Rafael J. Wysocki wrote:
> On Mon, Jun 26, 2023 at 1:00 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > acpi_companion_match() doesn't alter the contents of the passed
> > parameter, so we don't expect that returned value can be altered
> > either. So constify it.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> This makes sense even without the rest of the series, so I can queue
> it up right away if you want me to do that.

Please, go ahead and thank you!

-- 
With Best Regards,
Andy Shevchenko


