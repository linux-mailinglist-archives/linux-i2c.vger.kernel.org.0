Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84226784046
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Aug 2023 14:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235378AbjHVMEq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Aug 2023 08:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235161AbjHVMEq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Aug 2023 08:04:46 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B406D1;
        Tue, 22 Aug 2023 05:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692705885; x=1724241885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eztHma/mzu8sG2UYtgl/yLjwZ9Wr42jHwVgx08YQoeY=;
  b=CEVWpBSm88VDB8g6tLKP8NitiX+L3pe++9oGKl1YhF/1fOa7wNZhzfzy
   W5ZYkZ47WaPW2iqsnZApLkpLywXJ+avUcNCwvThXyIueK+fpzTiaK1fTm
   BMoHh+w9nDPgtnwBUf5V4mBF8TtGVFGq28X+2I7IfH8ZbZ1CGu+0gEHZd
   W/XyjkufOQsPWc2EmgpTRjbMH1Gj6rmAPfwlHvt2t4jpEi7Zdqo7AbjlS
   wG+67MAUeVmbHVxqfs+IzQUDmd4A/2cMnjBDeaP2nsukUVeyyaGZY+SE0
   H7vv8otdTfPBgtnC8h3zVLg4j7jEQAjZgj8ewpmqoPt77uBVwK0tEN8Ee
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="353425370"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="353425370"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 05:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="771333640"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="771333640"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 22 Aug 2023 05:04:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qYQ7f-009Ken-1x;
        Tue, 22 Aug 2023 15:04:35 +0300
Date:   Tue, 22 Aug 2023 15:04:35 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yann Sionneau <ysionneau@kalray.eu>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Currently if the SoC needs pinctrl to switch the SCL
 and SDA from the I2C function to GPIO function, the recovery won't work.
Message-ID: <ZOSkU4SbErYI8Rb4@smile.fi.intel.com>
References: <20230822091555.18015-1-ysionneau@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822091555.18015-1-ysionneau@kalray.eu>
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

On Tue, Aug 22, 2023 at 11:15:55AM +0200, Yann Sionneau wrote:
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

With or without my suggestion, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


