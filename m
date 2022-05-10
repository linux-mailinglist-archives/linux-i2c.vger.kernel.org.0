Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 428645211C8
	for <lists+linux-i2c@lfdr.de>; Tue, 10 May 2022 12:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239582AbiEJKMt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 06:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbiEJKMl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 06:12:41 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF250185C85;
        Tue, 10 May 2022 03:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652177325; x=1683713325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FEwpRe0W3NxiPGNEO5T4Th0jnvzANcK4YMMXxjuh76U=;
  b=kdq2FPsxM+RaYtG5iEDFtNXz54S01iJiIlrCh1nBn0X12zn5Um5blB/K
   Ic1xOCJvVhPdUNf/cPTfplnHCQaD1mQtzURC44mAO6VTt9MI8en/GIwx0
   NxB/DQNMKTNvgL/ZAHy11T5AksMUI94w5hs0uDMrW/Dsb10EhVfH7LNSt
   TcNMuEmWtkfc7C6G3Bahh5PRVBIU5yugpJigRqbLYPO5dKi5+XTcTNjW+
   lHDz2gy34PV2cejasf5fNQxr4/499MllCGtrH7WngPOO3dogbPIJzhq+A
   sgzQy+Pjm/FQvyHZD9JGfttZ6cZhRfPD3gx20zrNCG9AsGadJjoBNbaY3
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="269464879"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="269464879"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 03:08:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="570605764"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 03:08:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1noMn3-00EI7L-0j;
        Tue, 10 May 2022 13:08:25 +0300
Date:   Tue, 10 May 2022 13:08:24 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        wsa@kernel.org, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, sven@svenpeter.dev, jie.deng@intel.com,
        jsd@semihalf.com, lukas.bulwahn@gmail.com, olof@lixom.net,
        arnd@arndb.de, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/9] i2c: npcm: Change the way of getting GCR regmap
Message-ID: <Yno5mJMi/3dZyjNz@smile.fi.intel.com>
References: <20220510091654.8498-1-warp5tw@gmail.com>
 <20220510091654.8498-3-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510091654.8498-3-warp5tw@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 10, 2022 at 05:16:47PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
> 
> Change the way of getting NPCM system manager reigster (GCR)
> and still maintain the old mechanism as a fallback if getting
> nuvoton,sys-mgr fails while working with the legacy devicetree
> file.

...

> @@ -2236,6 +2236,7 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
>  	static struct regmap *clk_regmap;
>  	int irq;
>  	int ret;
> +	struct device_node *np = pdev->dev.of_node;

Can we keep "longer line first" order?

-- 
With Best Regards,
Andy Shevchenko


