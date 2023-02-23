Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE3186A0B32
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Feb 2023 14:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234272AbjBWNvG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Feb 2023 08:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233982AbjBWNvG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Feb 2023 08:51:06 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 092227EC0;
        Thu, 23 Feb 2023 05:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677160262; x=1708696262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2w/ft2HJvRrUdnaYI1aiuLNFv2Yrx5GoyFaH1kPWhsI=;
  b=jbjRfuOdrxHl6YULYnmUMOLcy2U8zdj1yHvxDVvSO2G/rcqsE2lp+HgB
   8E0tTXYkr8N5kD/t+U8+gvAvF6vZAugR8+67XupFnpWkEPHLBQdf4Ykw1
   xakd1S+lCv3sW5sxVB0zGyByUs7MgnbfsuWCFhO/Mm8KpevhBKY5MGeCL
   iI9Af7eGEs1MfeefNAN9JNOvBZQUj4z+OnB9wS+WMXdKjlSHlkTPm3cAm
   WVLWvJ23hGbOoh5GFzm38Ddjo5o5XE3nOM/1k6SuOwp8LSoDku9Ov6osv
   OzFVwZNvRRUdsbl/b+du35yL1D0RQiI4TpZZQDKqQwjoJh3przSPeYLIx
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="312842994"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="312842994"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 05:51:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="672480967"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="672480967"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 23 Feb 2023 05:50:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pVBzs-00AyeI-2n;
        Thu, 23 Feb 2023 15:50:56 +0200
Date:   Thu, 23 Feb 2023 15:50:56 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Raul E Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 0/3] i2c: stop using i2c_of_match_device()
Message-ID: <Y/dvQGz5SSxAjUZ2@smile.fi.intel.com>
References: <20230221133307.20287-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221133307.20287-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 21, 2023 at 03:33:04PM +0200, Andy Shevchenko wrote:
> i2c_of_match_device() is used by core and a couple of drivers.
> Instead, convert those drivers to use device_get_match_data()
> and unexport i2c_of_match_device().

After a good discussion and reading a bit deeper some code,
self-NAK for this series. We seems need to be more smart.

-- 
With Best Regards,
Andy Shevchenko


