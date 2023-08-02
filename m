Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54BD276D0D5
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 17:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234869AbjHBPBK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 11:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234696AbjHBPAu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 11:00:50 -0400
Received: from mgamail.intel.com (unknown [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36374210D;
        Wed,  2 Aug 2023 08:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690988449; x=1722524449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=00q+SD3eVn9/AkFXMjQM8Bx+Dv06CaW271T9mnjb94w=;
  b=jX0567/1N7mtbpYusgfU9zUK9QmB6AwnIImQ300NbeRtD10tpC0N8pNL
   UYSFa8Ab/Gra8SLOS1YCUG6DBUNJQxGLFBRYcHX+i1vkX0swB+33R1fMg
   n50/qNwwPCheqvRaFMVt90NF168va2sruHNaT+1JXQex6LteZ/J0uIyva
   ORHRd4k+XW8F3VRc86GnqG3r0rTlXPDkNio0ST3NONv7QzJ3nWNk2QLbX
   8fEDH+8C1K2103roc7n0McDT6Jr7fPVLjKeOj7l1hR5e3f+FHGpGFH5Cn
   f2NuA2v2BuXE4FUq9Fs3R8PGK91i1GscuLHw6NlmjV8NbOVFFbsBoU5Kh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="369601304"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="369601304"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 07:44:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="764236758"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="764236758"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 02 Aug 2023 07:44:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qRD5h-0034dz-22;
        Wed, 02 Aug 2023 17:44:45 +0300
Date:   Wed, 2 Aug 2023 17:44:45 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Message-ID: <ZMpr3ci6Eoxg0M3A@smile.fi.intel.com>
References: <20230801170318.82682-1-biju.das.jz@bp.renesas.com>
 <20230801170318.82682-3-biju.das.jz@bp.renesas.com>
 <ZMldGIYbjDa51587@smile.fi.intel.com>
 <OS0PR01MB592215F385BD7B389BDF3B2B860BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592215F385BD7B389BDF3B2B860BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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

On Wed, Aug 02, 2023 at 06:34:56AM +0000, Biju Das wrote:
> > On Tue, Aug 01, 2023 at 06:03:18PM +0100, Biju Das wrote:

...

> > >  * Changed i2c_of_match_device_sysfs() as non-static function as it is
> > >    needed for i2c_device_get_match_data().
> > 
> > Btw, this can be split to a separate change.
> 
> OK, first patch is callback with I2C table match and
> Second patch is for handling i2c_of_match_device().

One patch making API non-static, second, third, ... patches -- other things.

-- 
With Best Regards,
Andy Shevchenko


