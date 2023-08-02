Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2B9176D00E
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 16:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233640AbjHBO22 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 10:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233358AbjHBO2Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 10:28:24 -0400
Received: from mgamail.intel.com (unknown [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E222D19B0;
        Wed,  2 Aug 2023 07:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690986502; x=1722522502;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jv1LlLRDkmzZ4By4FfdX0a3JMgtdls/qOB8VuQiwTMs=;
  b=PMIaiXn1h2v/gd+ett0r1EM8EzkYYRixWHW5dCS204kcb0uY5PlsbulA
   uu27nUKUWfY2NE39CHYNnPlyAuN9Z8LezwWfBVstSTGu+B1ypaVNDsluI
   5yEnx+tUAV6XLTYTfFgMp8Zl4uSTR3DjKBq7TmyA/kgBv4TqMD3tvhOAP
   K85EVddZl7V7X3nhWkF/xtAcnvcinXCtFHkHfhSZzKH8MSH2Y1DyrvFes
   OZsGAaSU/qoaXhHT86HjmJL/YagLMfEs9D01HIQWlapU6l49YmNAJT3Sg
   UhtHCJ+v4TfsDvT58NnmOKS0PfYUNhairP7es/w37YYZeeF/hC/1cjguD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="373240682"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="373240682"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 07:23:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="819243812"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="819243812"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Aug 2023 07:23:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qRCl1-002LFZ-0s;
        Wed, 02 Aug 2023 17:23:23 +0300
Date:   Wed, 2 Aug 2023 17:23:23 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Message-ID: <ZMpm2xDOe/Fcg9j8@smile.fi.intel.com>
References: <20230801170318.82682-1-biju.das.jz@bp.renesas.com>
 <20230801170318.82682-3-biju.das.jz@bp.renesas.com>
 <ZMlc5jHfSf/bOCe3@smile.fi.intel.com>
 <ZMlt5SpEgawlWHoB@google.com>
 <OS0PR01MB592298554E93EB64465DD302860BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592298554E93EB64465DD302860BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 02, 2023 at 09:34:18AM +0000, Biju Das wrote:

...

> > Can we make i2c_of_match_device_sysfs() take a const pointer to a
> > client? Casting away constness is something that we should avoid.
> 
> I agree, we are not supposed to modify client pointer inside
> i2c_of_match_device_sysfs(), so const makes sense here.
> Wolfram, I guess you are ok with it.


Don't forget to do that in a separate patch as well!

-- 
With Best Regards,
Andy Shevchenko


