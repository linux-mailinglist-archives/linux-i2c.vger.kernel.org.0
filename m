Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 714846447D0
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Dec 2022 16:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235176AbiLFPSJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Dec 2022 10:18:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235314AbiLFPRn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Dec 2022 10:17:43 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D045331232;
        Tue,  6 Dec 2022 07:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670339637; x=1701875637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DNj8hNQqMNrJvI5YGYEy2ZSeuHQ46t1dJQ7/RTJsqiM=;
  b=AhrkNTCrtGZhtZ+qlGMfqnWQyWXDyWGMlChU5u8JqemFJ4x/ZYQT957f
   ZJq7q1HbT9pD+jodvtZRxIng1tc3/tqamXmnt8NxAOy7yf/1vQFlqZZZU
   GBP4vldvTWqFpjlrRDNfhU+LeAE51fwayBSQwmeEhxEyDpvemMuuZmbc8
   xYq1mwP87wCpQMWFbOgRAM/fuuPdVk0Qhlf5d6C5We2Zf1ppXCR0Xu6LY
   W6GIKNlWvGzw3qndbxslwXKXhTwaSf7piLbhHXU27m+JKhnSS0oEQm5ON
   dFXrjm4/+0S1FlLKk+vDsRKqd+ykxFMAyclVaZ9mtyo3XYEgVRFnK13S9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="304268033"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="304268033"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2022 07:13:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="709703100"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="709703100"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 06 Dec 2022 07:13:54 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p2Zdo-005MEX-0R;
        Tue, 06 Dec 2022 17:13:52 +0200
Date:   Tue, 6 Dec 2022 17:13:51 +0200
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
Message-ID: <Y49cL9JQ6kFblLeX@smile.fi.intel.com>
References: <cover.1670293176.git.zhoubinbin@loongson.cn>
 <0a8a1dec27beea61935adb2a9c2d74e41c86e9b1.1670293176.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a8a1dec27beea61935adb2a9c2d74e41c86e9b1.1670293176.git.zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 06, 2022 at 11:16:54AM +0800, Binbin Zhou wrote:
> Add support for the ACPI-based device registration, so that the driver
> can be also enabled through ACPI table.

...

> -#include <linux/of.h>

Cool, but don't you need to add property.h?

Otherwise looks good to me.

-- 
With Best Regards,
Andy Shevchenko


