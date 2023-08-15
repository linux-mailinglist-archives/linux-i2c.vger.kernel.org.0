Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 336F777CF95
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Aug 2023 17:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236014AbjHOPvO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Aug 2023 11:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238333AbjHOPuw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Aug 2023 11:50:52 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6772819AD;
        Tue, 15 Aug 2023 08:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692114620; x=1723650620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K0JZTVhvNPhS+KagU0AwU1+jE52diqOAFD8zzX9VIOo=;
  b=Td7WtI0DDdKEkPSWV3rTbmcVxNS+FkUIF5f5MDQ8hYMfJkgQOxgmvAlB
   ZSmGXuEChXzY5rxBfLaw762dn/Brpj0/tcsSyD+CArbED+sQxsntDInlw
   JJV21Mc2fn8Z7n2GDlgGS4a0vF1wrwuQsEOTMUZ4XWTOf0Q4xvaEqIyAq
   7cL7NXPNdQoRR9JqB0vUzQbqiewEW23sd0S/FUif8QIpBBiTxtdAxlKSe
   aMLpe4OhzFnqtJz4SLzNfg7/b8BuRtX+2HTFvDaeb15rcVmOgFFrZrwtT
   oCA1I81u1mPqvUHn5M8uhXdZmd0iTp9glo5TRvyzn9YW3v/uidSXYrVOL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="369787791"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="369787791"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 08:50:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848115459"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="848115459"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2023 08:50:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qVwJD-00833p-2g;
        Tue, 15 Aug 2023 18:50:15 +0300
Date:   Tue, 15 Aug 2023 18:50:15 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/4] i2c: mux: ltc4306: convert to using a pointer in
 i2c_device_id
Message-ID: <ZNuetxBBXX2bsoJ+@smile.fi.intel.com>
References: <20230814-i2c-id-rework-v1-0-3e5bc71c49ee@gmail.com>
 <20230814-i2c-id-rework-v1-2-3e5bc71c49ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814-i2c-id-rework-v1-2-3e5bc71c49ee@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 14, 2023 at 02:52:50PM -0700, Dmitry Torokhov wrote:
> Switch the driver to use newly added "data" pointer in i2c_device_id to
> streamline DT and legacy flows.

...

>  	chip = of_device_get_match_data(&client->dev);
> -
>  	if (!chip)
> -		chip = &chips[i2c_match_id(ltc4306_id, client)->driver_data];
> +		chip = i2c_match_id(ltc4306_id, client)->data;

The whole thing can be converted to i2c_device_get_match_data() with the new
helper from another thread. That said, I don't see value in this half-baked
change.

-- 
With Best Regards,
Andy Shevchenko


