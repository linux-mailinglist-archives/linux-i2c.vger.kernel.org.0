Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBBFB614DBB
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 16:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231420AbiKAPDE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 11:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231508AbiKAPCo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 11:02:44 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE36D1D0D0;
        Tue,  1 Nov 2022 07:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667314698; x=1698850698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KU7qwcjHRqpB+MNcE9GH1nnu3087nnxDD92xVTY/h1M=;
  b=RXvW+CTpoeB/xoXzQIS6cguFCoDNFnSgbdMhaek2CtyJ9qsCn6Nhx+yn
   AsxRA7hMpqJ+P+hPhjPAI8kKpqSQx3o2IJ15iLGg0Mgb5FRQpb2PWY0He
   JJslmbUHRW9YjCq6cD1ZOnRwr5FP9m9Mb1HkV7kpuAwjPxKOFF99APc82
   azMLll+QMHjmOyaP1HriG9foFjpDWE6UV55Fq62VxOC55U8zo3IHlSWUD
   QnFoBPbzx2CIHsQ2102bPhs4qIE64odCKrFBi1xqXoEB2jlgoB/ucxhyu
   iFGRZEK1t1d/yUdK93aOaKf4Hrr5fFLIGQDWOkzFsG8WOvt5cG6v5kIJ0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="292458210"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; 
   d="scan'208";a="292458210"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 07:58:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="636423741"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; 
   d="scan'208";a="636423741"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 01 Nov 2022 07:58:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1opsiT-005dbt-2a;
        Tue, 01 Nov 2022 16:58:13 +0200
Date:   Tue, 1 Nov 2022 16:58:13 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>
Cc:     linux-iio@vger.kernel.org,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] i2c: core: Introduce i2c_client_get_device_id
 helper
Message-ID: <Y2E0BWyvHjPko2TB@smile.fi.intel.com>
References: <cover.1667151588.git.ang.iglesiasg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1667151588.git.ang.iglesiasg@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Oct 30, 2022 at 06:51:06PM +0100, Angel Iglesias wrote:
> Hello,
> 
> I don't want to step anyone's work here, so I'm sending this RFC to the
> devs involved in the original discussion. I read on Uwe Kleine-König's
> patchset submission thread the necessity for an i2c helper to aid with the
> migration to the new i2c_driver .probe_new callback. Following the
> suggestions made there, I wrote this small patchset implementing the
> suggested helper function and ported the bmp280 IIO i2c probe to the new
> probe using that helper.

For the entire series (please drop RFC in the next version)
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Thanks for your time!
> Angel
> 
> Original discussion thread for additional context:
> https://lore.kernel.org/all/20221023132302.911644-11-u.kleine-koenig@pengutronix.de/
> 
> Angel Iglesias (2):
>   i2c: core: Introduce i2c_client_get_device_id helper function
>   iio: pressure: bmp280: convert to i2c's .probe_new()
> 
>  drivers/i2c/i2c-core-base.c       | 15 +++++++++++++++
>  drivers/iio/pressure/bmp280-i2c.c |  8 ++++----
>  include/linux/i2c.h               |  1 +
>  3 files changed, 20 insertions(+), 4 deletions(-)
> 
> 
> base-commit: c32793afc6976e170f6ab11ca3750fe94fb3454d
> -- 
> 2.38.1
> 

-- 
With Best Regards,
Andy Shevchenko


