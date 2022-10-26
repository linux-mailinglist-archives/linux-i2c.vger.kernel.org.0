Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D84560E22A
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Oct 2022 15:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233040AbiJZN3Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Oct 2022 09:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233810AbiJZN3G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Oct 2022 09:29:06 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C87C1011A9
        for <linux-i2c@vger.kernel.org>; Wed, 26 Oct 2022 06:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666790944; x=1698326944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=afQlBJK1A7StgB+cXIhXdVoxkjfKZpJynWrKwkAWWj4=;
  b=KbtxREPF0+w/2l1htHAl0xYROvrMROuc+THKdsNz4hHNDTQStaR4wzQ2
   drO5K//Y9uvGyUtsHju6Lou1Z4lJ8fF0K6zBWCu0oeOd2Z7933UwzE9LU
   /3CoX6e/SyL4X7d4LC2fwptsiDSg+NRc6vSSa7zPQQpRtBB05vE0FTxBd
   SYx5IHravPi4xbqIhjZADCLEET2RdeoWx+0AkeXIpq0n+XMtgSwFTfTcx
   YQ9zdXBMM7QTUGeWmT2hLRrJ0O/SVB7R+KEBPB49nxlSMDBU6FsGAmrqF
   xGNabKgh6ggyN+wFHpShDM9Hb5wwvUcEY/eZ+Ug5Tvfxue6bOPWpWxgTX
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="309036776"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="309036776"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 06:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="757299748"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="757299748"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 26 Oct 2022 06:29:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ongSp-002fOk-2R;
        Wed, 26 Oct 2022 16:28:59 +0300
Date:   Wed, 26 Oct 2022 16:28:59 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Luis Oliveira <luis.oliveira@synopsys.com>
Subject: Re: [PATCH 07/11] i2c: designware: Do not process interrupt when
 device is suspended
Message-ID: <Y1k2GyW8Hgkz9xpF@smile.fi.intel.com>
References: <20221026123912.2833271-1-jarkko.nikula@linux.intel.com>
 <20221026123912.2833271-8-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026123912.2833271-8-jarkko.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 26, 2022 at 03:39:08PM +0300, Jarkko Nikula wrote:
> Do not return with interrupt handled if host controller is off and thus
> interrupt is originating from other device or is spurious.
> 
> Add a check to detect when controller is runtime suspended or
> transitioning/reset. In latter case all raw interrupt status register
> bits may read one. In both cases return IRQ_NONE to indicate interrupt
> was not from this device.

...

>  	dev_dbg(dev->dev, "enabled=%#x stat=%#x\n", enabled, stat);
>  	if (!enabled || !(stat & ~DW_IC_INTR_ACTIVITY))
>  		return IRQ_NONE;
> +	if (pm_runtime_suspended(dev->dev) || stat == ~0)
> +		return IRQ_NONE;

I haven't checked the type of 'stat', but usually be careful with ~0.
Due to integer promotion it may give the unexpected results.

-- 
With Best Regards,
Andy Shevchenko


