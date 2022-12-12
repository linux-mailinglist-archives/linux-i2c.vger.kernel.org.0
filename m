Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81744649B60
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Dec 2022 10:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbiLLJlM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Dec 2022 04:41:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231963AbiLLJky (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Dec 2022 04:40:54 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFFD46275;
        Mon, 12 Dec 2022 01:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670838046; x=1702374046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qTWDV+Z/hhFb8cx57UqTTsPxzQP16q2k1qLosYDy8aM=;
  b=S4vYhUuyjHi9OsOohuO3XK0nvKD59Gh3eH6UEtOqS/q3GIH2po4ymyvB
   w/f6Eq0D6VbIlRw69NVokNso8qy7mTdUl3VvsMcAxpcT04m3313BpwNbP
   OhaSpvmDBdgnyT0bi5NxU5gfSg+w0EYbfD1E/56Hyz55K0QIh0WCgDC3U
   tz0MQ+/BlxyiAVjSz+qw8clHyg6OdD9XhfJjKWsyJ0PgGPlTHCmxjg+d5
   zzEI2rhpbZHO2XyHzQ+bsoQ5Ogazk6pXR6jqg/Ok7kOaChPhxEYYQ65SQ
   GHDjnA6yy28On+UMs2ddS5irghFqxIPh5eE8gTR0NSLWvIN1muljCvUJy
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="404069031"
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; 
   d="scan'208";a="404069031"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2022 01:40:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="711612985"
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; 
   d="scan'208";a="711612985"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 12 Dec 2022 01:40:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p4fIf-008PDA-0p;
        Mon, 12 Dec 2022 11:40:41 +0200
Date:   Mon, 12 Dec 2022 11:40:40 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
Subject: Re: [PATCH V5 1/4] i2c: gpio: Add support on ACPI-based system
Message-ID: <Y5b3GHiYxblLitvG@smile.fi.intel.com>
References: <cover.1670293176.git.zhoubinbin@loongson.cn>
 <0a8a1dec27beea61935adb2a9c2d74e41c86e9b1.1670293176.git.zhoubinbin@loongson.cn>
 <Y49cL9JQ6kFblLeX@smile.fi.intel.com>
 <14dcf7b0-2fb1-575f-7e41-f58ce55b920b@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14dcf7b0-2fb1-575f-7e41-f58ce55b920b@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 07, 2022 at 03:10:43PM +0800, Binbin Zhou wrote:
> 在 2022/12/6 23:13, Andy Shevchenko 写道:
> > On Tue, Dec 06, 2022 at 11:16:54AM +0800, Binbin Zhou wrote:

...

> > > -#include <linux/of.h>
> > Cool, but don't you need to add property.h?
> 
> Get it, I should have been more careful, maybe I'm still not very sensitive
> to header files.
> 
> Now I'm still basically judging based on whether I compile with errors or
> not.

You can generate the include tree by running `make includecheck`

The rule of thumb is to include what you are the direct user of.
With a few exceptions where we have the guarantees that one header
is always included by another (e.g. bits.h included by bitops.h).

> > Otherwise looks good to me.

-- 
With Best Regards,
Andy Shevchenko


