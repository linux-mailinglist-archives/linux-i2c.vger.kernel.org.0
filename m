Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9AE59E7E2
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 18:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245328AbiHWQrE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Aug 2022 12:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343682AbiHWQqG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Aug 2022 12:46:06 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5778FDFD9
        for <linux-i2c@vger.kernel.org>; Tue, 23 Aug 2022 07:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661264984; x=1692800984;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=VV+b3XLzau1FNiNSfQnFHXaCpd6SJslWZ6s18OEZ9hY=;
  b=DiIPlEzntHKCTnS0I+gooIAixSt/sJkgq3YgtQeTC9mgfVvz30omyKV0
   47ZCA1jIZTJdXgWQC0TOWwS43WQpq8W3qASwjczaLEt4E+lmgNxe0XTbL
   0aKAC+9hta3f8Pb6fBZI5jDq9qEbJtrXKJgfO8tzdFn1EgiEtohX4C1ad
   7LdlFicw+hmCqRqk0Uk47RVDvKnkYdNLGbKwdDj1JCiNw0O7D/lkbajx6
   fD6EubXnkutY8we2a1782/l10ondNxElaull0vvOfxnr0sHrTMCSUhy+G
   GnwfgaRSJOvD26MxVVqNcJHeQYh0S8wj8HyAaxHq1xTNKBssBoHzJi51M
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="319747450"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="319747450"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 07:29:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="586011068"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 07:29:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oQUuR-002TYQ-3A;
        Tue, 23 Aug 2022 17:29:39 +0300
Date:   Tue, 23 Aug 2022 17:29:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, Josef Johansson <josef@oderland.se>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 1/1] i2c: scmi: Replace open coded
 device_get_match_data()
Message-ID: <YwTkU6m+gPSKxFm1@smile.fi.intel.com>
References: <20220708120958.74034-1-andriy.shevchenkolinux!intel!com>
 <4d2d5b04-0b6c-1cb1-a63f-dc06dfe1b5da@oderland.se>
 <Yvtu29D/LkoMzubP@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yvtu29D/LkoMzubP@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 16, 2022 at 12:18:03PM +0200, Wolfram Sang wrote:
> Hi,
> 
> > I tried build Linux 6.0 and run under Xen 4.14.5. I got a kernel null pointer dereferenced while booting. Reverting this commit allowed the system to boot.
> 
> Thank you for the report and the provided information. I will give Andy
> a bit of time to come up with a fix. If a fix is not easily possible,
> this will get reverted for rc2.

Haven't seen in the thread information about revert done, hence if nobody
respond in this way, I will look into this starting from tomorrow (sorry,
was on a sick leave).

-- 
With Best Regards,
Andy Shevchenko


