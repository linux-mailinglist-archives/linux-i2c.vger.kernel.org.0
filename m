Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12D8C7841FE
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Aug 2023 15:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233823AbjHVN0T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Aug 2023 09:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233340AbjHVN0S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Aug 2023 09:26:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 881D718B;
        Tue, 22 Aug 2023 06:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692710777; x=1724246777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bly84erZzmjYi+lbUEvdtjBfkxGsUxZ1sh2zNjlAKhc=;
  b=MYi7kbWMYQeFxmCSs7JaLaGyDe9An6vvxM/40VzMDRNu4oV29NOFoaoz
   vplJGeIXojYwOtla3+yGD46W5WdrgWmWug+o+EOIh7s3Qtb6Y1xIzrP9n
   6hyodQszuO8wzESBw9nmH2E/MJwa3rQxQOj42P3k/tG4SM9cDgNZ6znMC
   39CdsnHgOY7FECyeyb3AvqUH65LAffFS153c54mTr4ONqN91FXcemV2JD
   MElQ9MwgN7ECaSDZtUQ8Gwwpn54VoOuJsG4/0Ag1XB0g3RoG8sydXe3mG
   0DU75naG1p805GE5iEyc9WaEvky7WXocVW5r0LRxTgzr0hOZUpmiEzhAi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="460245105"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="460245105"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 06:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765741971"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="765741971"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 22 Aug 2023 06:26:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qYROb-00C7Xg-04;
        Tue, 22 Aug 2023 16:26:09 +0300
Date:   Tue, 22 Aug 2023 16:26:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yann Sionneau <ysionneau@kalray.eu>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] Currently if the SoC needs pinctrl to switch the SCL
 and SDA from the I2C function to GPI
Message-ID: <ZOS3cI7RL443mizj@smile.fi.intel.com>
References: <20230822131123.5041-1-ysionneau@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822131123.5041-1-ysionneau@kalray.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 22, 2023 at 03:11:23PM +0200, Yann Sionneau wrote:
> scl-gpio = <>;
> sda-gpio = <>;
> 
> Are not enough for some SoCs to have a working recovery.
> Some need:
> 
> scl-gpio = <>;
> sda-gpio = <>;
> pinctrl-names = "default", "recovery";
> pinctrl-0 = <&i2c_pins_hw>;
> pinctrl-1 = <&i2c_pins_gpio>;
> 
> The driver was not filling rinfo->pinctrl with the device node
> pinctrl data which is needed by generic recovery code.
> 
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
> V3 -> V4:
> * Replace `else if` by simply `if`.

You forgot my tag. Why?
Also I think this will generate more code and more noise in debug case.
So, I admit I gave a bad suggestion in previous round.

Please, go for v3 with my tag (as v5).

-- 
With Best Regards,
Andy Shevchenko


