Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC6063874A
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Nov 2022 11:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbiKYKVY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Nov 2022 05:21:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbiKYKVX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Nov 2022 05:21:23 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF6973E0B8;
        Fri, 25 Nov 2022 02:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669371682; x=1700907682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OlLtPQd1Ky/oYGu3/jZlcYF3OqQrWZc51EQgwDV6o8M=;
  b=mYsvzmefVwazcr6ilFlFzffhLNZZZ4teddubsYBNp3nf6vQgjIzlxKJx
   j8qIX7PAJwo9ZExPdN/1Z3tXqlPqcCsG6vML+zCMyOgOE4v9VRwroAWvf
   EqoBr9xoTtZaqwUuVIuILhW7eXbKPPK5OipKHABqqntO8ZyOT+cbDeYHK
   BhKOEifMkF5+G/y5CLJIVZLQeC0xyakvbw1rgjJ1/flvSO6LylxpNnQhs
   p4blnGgNaoDCws/kMhtnonporVT9psTnGgd3sj0feRTzYnLhPfEp3TA1t
   X8d1+qNTL+6kkh6MRbxWe7GkwVhaces7Vuu3Zd70JIWda2IOZLbuzlmDv
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="341359173"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="341359173"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2022 02:21:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="971527133"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="971527133"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2022 02:21:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oyVpd-00HBYs-1x;
        Fri, 25 Nov 2022 12:21:17 +0200
Date:   Fri, 25 Nov 2022 12:21:17 +0200
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
Subject: Re: [PATCH V3 1/5] i2c: gpio: Fix potential unused warning for
 'i2c_gpio_dt_ids'
Message-ID: <Y4CXHXqNcBJwmap7@smile.fi.intel.com>
References: <cover.1669359515.git.zhoubinbin@loongson.cn>
 <4ace98785f900bf1a818d006ae5906f6b51edf7e.1669359515.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ace98785f900bf1a818d006ae5906f6b51edf7e.1669359515.git.zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 25, 2022 at 04:54:11PM +0800, Binbin Zhou wrote:
> of_match_ptr() compiles into NULL if CONFIG_OF is disabled.
> Fix warning by dropping of_match_ptr().

> Suggested by Andy Shevchenko, thanks.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

We have a tag for that:

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


