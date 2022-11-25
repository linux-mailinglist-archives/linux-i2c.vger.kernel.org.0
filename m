Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C880C63876D
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Nov 2022 11:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbiKYKXs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Nov 2022 05:23:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbiKYKXr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Nov 2022 05:23:47 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB3D419A0;
        Fri, 25 Nov 2022 02:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669371826; x=1700907826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qaiiZneNmh9uPlFJaZlbiTDiqB5tAEB90ztrbXmYIrQ=;
  b=O1XLGpBZa44pwJJ3TF7t/Ur/KNOTC4HMw+4H4r2Gq6CuTgZTtYEnnWNg
   Ao63KAJm6D63zU9btfQtpJtL+7G8r+XzCo3yHN/8r888+R/hDB5Ot2nrU
   MizUCZfpw1T7DTZMtSIyEgLv4N98mgVfu5i3uG53n3y/fReM8OGZLlOve
   YsgYoDEhqkZ3GdJSrINQP0sl3B8dyHXC5oOyMDKDqOY57STYt4t4y1DBc
   GVwNWUK6aQ1Xa6OjH6QtixERfvIMaPilUws0DNLisLgjx+uUbAvIVtRKJ
   Akse5zXf47lgHpB5NC+7kGCQkvGm8z7AprGzkazxr7KwRnvIz8o6bPtqa
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="315613302"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="315613302"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2022 02:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="636535062"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="636535062"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 25 Nov 2022 02:23:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oyVrw-00HBbq-2Q;
        Fri, 25 Nov 2022 12:23:40 +0200
Date:   Fri, 25 Nov 2022 12:23:40 +0200
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
Subject: Re: [PATCH V3 2/5] i2c: gpio: Add support on ACPI-based system
Message-ID: <Y4CXrDh61D/f8V2A@smile.fi.intel.com>
References: <cover.1669359515.git.zhoubinbin@loongson.cn>
 <e0ed6dfa3dbf60b58ef4eaeb40ea46d2577a2834.1669359515.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0ed6dfa3dbf60b58ef4eaeb40ea46d2577a2834.1669359515.git.zhoubinbin@loongson.cn>
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

On Fri, Nov 25, 2022 at 04:54:12PM +0800, Binbin Zhou wrote:
> Add support for the ACPI-based device registration, so that the driver
> can be also enabled through ACPI table.

...

> +/* get i2c-gpio props from DT or ACPI table */

Get

...

> -	if (np) {
> -		of_i2c_gpio_get_props(np, pdata);
> +	if (np || has_acpi_companion(dev)) {
> +		i2c_gpio_get_props(dev, pdata);

	if (dev_fwnode() {
		i2c_gpio_get_props(dev, pdata);

...

> +	{"LOON0005", 0}, /*LoongArch*/

", 0" part is redundant. Also missing spaces in the comment.

-- 
With Best Regards,
Andy Shevchenko


