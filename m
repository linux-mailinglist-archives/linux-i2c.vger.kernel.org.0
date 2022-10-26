Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B912560E24C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Oct 2022 15:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231164AbiJZNig (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Oct 2022 09:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233318AbiJZNiY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Oct 2022 09:38:24 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0B287B7B1
        for <linux-i2c@vger.kernel.org>; Wed, 26 Oct 2022 06:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666791503; x=1698327503;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GnkcUC1VIXLNSTNroYsvDGY4FBrRQInllBYbABWEL54=;
  b=my/vEl30pTzzx3AbTfQKaZmRhFYEpN5WbwK+EnOZh+u49McjWa/SHfC2
   BQZbHbE3mTt1vayltiq7Zh3jOg9Szlk/NiuO/nUR9Q1vlwC3Zm/5BczRU
   BXwR5iBre0tORr2llBmmRdPSsTL4E/blQhs1ViSSzZQiPfS5BudZsvaLg
   WjSaWp+tvAKEtflOTQR0EIT+oNR231CODrsma9kY74rljEHmpVk+6PsPu
   MO38EYh3nR6oUmWdVyQcwCbtFmVLcl9gMgBh5pLOHUUpNQt/mU+sO6+WG
   Jve+1+WpcTa3p4Lv3wK8yaOGYXs9wMg4z1CONZ6yAwvQA8VRTk2GYHvsI
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="394258496"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="394258496"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 06:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="807039907"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="807039907"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 26 Oct 2022 06:38:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ongbq-002fdl-1v;
        Wed, 26 Oct 2022 16:38:18 +0300
Date:   Wed, 26 Oct 2022 16:38:18 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Luis Oliveira <luis.oliveira@synopsys.com>
Subject: Re: [PATCH 11/11] i2c: designware: Align defines in
 i2c-designware-core.h
Message-ID: <Y1k4SoqEopMaf5q1@smile.fi.intel.com>
References: <20221026123912.2833271-1-jarkko.nikula@linux.intel.com>
 <20221026123912.2833271-12-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026123912.2833271-12-jarkko.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 26, 2022 at 03:39:12PM +0300, Jarkko Nikula wrote:
> Align all defines to the same column.

...

> +#define DW_IC_SDA_HOLD_MIN_VERS			0x3131312A

> +#define DW_IC_COMP_TYPE_VALUE			0x44570140

While at it, I would add comments that show ASCII values of these definitions.

...

> +#define DW_IC_INTR_DEFAULT_MASK			(DW_IC_INTR_RX_FULL | \
> +						 DW_IC_INTR_TX_ABRT | \
> +						 DW_IC_INTR_STOP_DET)
> +#define DW_IC_INTR_MASTER_MASK			(DW_IC_INTR_DEFAULT_MASK | \
> +						 DW_IC_INTR_TX_EMPTY)
> +#define DW_IC_INTR_SLAVE_MASK			(DW_IC_INTR_DEFAULT_MASK | \
> +						 DW_IC_INTR_RX_UNDER | \
> +						 DW_IC_INTR_RD_REQ)

While at it, I would reformat these (and similar below) as

#define DW_IC_INTR_DEFAULT_MASK						\
	(DW_IC_INTR_RX_FULL | DW_IC_INTR_TX_ABRT | DW_IC_INTR_STOP_DET)

...

>  	int			(*init)(struct dw_i2c_dev *dev);
>  	int			(*set_sda_hold_time)(struct dw_i2c_dev *dev);

These...

>  	int			mode;

> -	struct i2c_bus_recovery_info rinfo;
> +	struct			i2c_bus_recovery_info rinfo;

...and now this are consistent, but these all are inconsistent with, e.g.

	int			mode;

where we have

	$type			$name;

-- 
With Best Regards,
Andy Shevchenko


