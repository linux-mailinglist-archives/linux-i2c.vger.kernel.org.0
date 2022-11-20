Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2EA5631471
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Nov 2022 14:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbiKTNtQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Nov 2022 08:49:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiKTNtP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Nov 2022 08:49:15 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F34C27904;
        Sun, 20 Nov 2022 05:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668952154; x=1700488154;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Di/TnBaFSAUmHsGAOFp3N0NOK4kayU8OnzvjgIwzZKU=;
  b=G5b2XWwnohZlRnkF/7TzuHjeASxRrY1TVnT/C04xbWoya/rpnIu+gWF2
   6KhASGYYwemP6L/ZQcpikvkd1hJsb1U7wusSProOxHTjgLQw3C98ZgO00
   t1CGidM4CRXeHll5wTrs7tuegwmP378w8xFWUXAv+QzqWmijSJ7n/4wzN
   Lr8G8BGqGbN+/jVZhUBh+bMbBBiXfLwcb49Ta4bysOujSHBR82MoeihIF
   UH/nJI2bPlf7uW7ivUphAwXm54usHzIMDM9WfBYk89SMhymHy4W9ZksIt
   IlcJ+B1Ue1WNBxLLkOIFfFHYXeA6N1BhPOBcTahKxhKMepSZ/mq9Mafki
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10536"; a="293788197"
X-IronPort-AV: E=Sophos;i="5.96,179,1665471600"; 
   d="scan'208";a="293788197"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2022 05:49:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10536"; a="704280719"
X-IronPort-AV: E=Sophos;i="5.96,179,1665471600"; 
   d="scan'208";a="704280719"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 20 Nov 2022 05:49:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1owkh2-00Eqjn-0U;
        Sun, 20 Nov 2022 15:49:08 +0200
Date:   Sun, 20 Nov 2022 15:49:07 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        Miaoqian Lin <linmq006@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        wangjianli <wangjianli@cdjrlc.com>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>, kernel@pengutronix.de,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Grant Likely <grant.likely@linaro.org>,
        Dmitry Rokosov <DDRokosov@sberdevices.ru>,
        Lee Jones <lee.jones@linaro.org>,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 054/606] iio: accel: kxcjk-1013: Convert to i2c's
 .probe_new()
Message-ID: <Y3owU0ucK2qc6GAF@smile.fi.intel.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-55-uwe@kleine-koenig.org>
 <Y3jGHufAJVxZp1f0@smile.fi.intel.com>
 <20221119160818.zft3xhuwz3gm6oeg@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221119160818.zft3xhuwz3gm6oeg@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Nov 19, 2022 at 05:08:18PM +0100, Uwe Kleine-König wrote:
> On Sat, Nov 19, 2022 at 02:03:42PM +0200, Andy Shevchenko wrote:
> > On Fri, Nov 18, 2022 at 11:36:28PM +0100, Uwe Kleine-König wrote:
> > > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > 
> > > .probe_new() doesn't get the i2c_device_id * parameter, so determine
> > > that explicitly in the probe function.
> > 
> > Since there is no split on per subsystem basis (I mean, as a series targeting
> > only, let's say, IIO subsystem with cover letter), I'm answering here that all
> > IIO patches are good to me, thanks, Uwe!
> > 
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thanks!
> 
> Does this include the three patches:
> 
> 	staging: iio: adt7316: Convert to i2c's .probe_new()
> 	staging: iio: ad5933: Convert to i2c's .probe_new()
> 	staging: iio: ade7854: Convert to i2c's .probe_new()
> 
> ?

It includes IIO patches, for staging I didn't looked at.


-- 
With Best Regards,
Andy Shevchenko


