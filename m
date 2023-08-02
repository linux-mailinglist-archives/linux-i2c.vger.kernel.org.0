Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28C5376D04F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 16:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234200AbjHBOl0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 10:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234193AbjHBOlY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 10:41:24 -0400
Received: from mgamail.intel.com (unknown [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B542FE0;
        Wed,  2 Aug 2023 07:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690987283; x=1722523283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gnP5vh1psQ24orU8jzD2snZMeqVr81e7Bxjuv+AOy5w=;
  b=miSnjPmZ/YkYUMX+KrQnfqK4hgnwf0PpIYmiab4/4/mTAMVmT4XRjiU8
   yYRL2zP7Pm9Tw0/lSHSUns+LIcZh1OZubZMtYPo9P/HLDYzzS///HbIEm
   7rcUfxgC57K+YgfmvFZxTemkhAYG7n/Uwja8wSdiVj0mYmyyV8/4F5Vdu
   Eorul8MNxmAavs3nSuAKNNt48K9q3IVHMN1eVX/nOEZG/ZN8Z/rgXA1qM
   GcqzR0EP3H+77Hm5T1t38c2XN0PfLWTcbbHsKXcVcfmWn15GERMocu0sJ
   xR2SPCJfEH8rhJKwRHKpXoBtKVlARzDz90ykhXEUvRJ8Yi6ehf4ncLwiS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="349200498"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="349200498"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 07:41:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="758770310"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="758770310"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 02 Aug 2023 07:41:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qRD2N-002xFZ-1B;
        Wed, 02 Aug 2023 17:41:19 +0300
Date:   Wed, 2 Aug 2023 17:41:18 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Message-ID: <ZMprDsFk+cUgq2hk@smile.fi.intel.com>
References: <20230801170318.82682-1-biju.das.jz@bp.renesas.com>
 <20230801170318.82682-3-biju.das.jz@bp.renesas.com>
 <ZMlc5jHfSf/bOCe3@smile.fi.intel.com>
 <OS0PR01MB5922AA1F68BC091BB997D941860BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922AA1F68BC091BB997D941860BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 02, 2023 at 07:59:21AM +0000, Biju Das wrote:
> > On Tue, Aug 01, 2023 at 06:03:18PM +0100, Biju Das wrote:

...

> > > -	struct i2c_driver *driver = to_i2c_driver(client->dev.driver);
> > 
> > Does it make sense to remove and add an additional parameter? In one
> > case it's a copy, in another it probably the same, just hidden in the
> > code.
> 
> Ok, you mean add the below check in i2c_device_get_match_data() and
> drop *driver parameter from i2c_get_match_data_helper().

Right.

> if (!client || !dev->driver)                                             
>  return NULL;

Not sure if you need this here in this static helper.

-- 
With Best Regards,
Andy Shevchenko


