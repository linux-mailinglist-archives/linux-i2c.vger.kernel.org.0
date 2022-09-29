Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E42505EF259
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Sep 2022 11:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235002AbiI2Jmd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Sep 2022 05:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235315AbiI2JmY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Sep 2022 05:42:24 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F971147CD5;
        Thu, 29 Sep 2022 02:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664444537; x=1695980537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AFDpiHfv11k1IoGhkBSL8RM2unjlVJEPCATh7Ukjlpk=;
  b=WgGs4R4G/MzGeIKNLqOwq3fHvp6mKq0kBjdgvmH2Z7xYUroKej7Pabiq
   TkpzVw+P0xKMTt/WwNhbIv/02mAEWzMmfbJ2JDH1iE8QR0IkfkRCFhYrK
   JX6ZckBLQ9xHiE6BRYsARVLAS9ao4LEb+AQ7Ri8evPfzB1imMxvuZ8q/0
   EG0c9NAWXsJ4LsiTpAUTXl1GbJEcaq6U0G11+mMf2UeakLTnUgJvXlyel
   o4bIpswulfc4BXrXOo6NHUJlbDcQ7EssnWN4X9HV990WbcN5G3KGxo1M9
   czs5Ocz1oGtpmrikfNOd2JpptXc2pBPmUj6FSiQvZYXYNPUerFdsdv5M1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="281560951"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="281560951"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2022 02:42:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="797490562"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="797490562"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 29 Sep 2022 02:42:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1odq3Z-009Kgx-1w;
        Thu, 29 Sep 2022 12:42:13 +0300
Date:   Thu, 29 Sep 2022 12:42:13 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 1/2] i2c: designware-pci: Group AMD NAVI quirk parts
 together
Message-ID: <YzVodbYWFiWLFaqw@smile.fi.intel.com>
References: <20220928162116.66724-1-andriy.shevchenko@linux.intel.com>
 <bc058878-4df4-cdcb-db6b-7c88e8814aa4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc058878-4df4-cdcb-db6b-7c88e8814aa4@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 29, 2022 at 08:52:15AM +0300, Jarkko Nikula wrote:
> On 9/28/22 19:21, Andy Shevchenko wrote:
> > The code is ogranazed in a way that all related parts to
> > the certain platform quirk go toghether. This is not the
> > case for AMD NAVI. Shuffle code to make it happen.
> > 
> Perhaps you want to change ogranazed and toghether?

Done in v2, thanks!

-- 
With Best Regards,
Andy Shevchenko


