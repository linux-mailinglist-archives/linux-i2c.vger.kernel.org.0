Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E10C7521207
	for <lists+linux-i2c@lfdr.de>; Tue, 10 May 2022 12:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239706AbiEJKX2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 06:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239707AbiEJKX1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 06:23:27 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690892555AF;
        Tue, 10 May 2022 03:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652177971; x=1683713971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nXHxCMDwnYM34gDLMPSIohgzS3+HPWiv+a82UDu22gc=;
  b=NB+TWyT8hUv8OjSVcsNu88eHevAIngdhF6GGj1yOeVyB+Cz/JlFmx9Kr
   VxPD5iH121RkMYSZ0OgL9RI7jSxaJd4jGubhaib+OFCYe+BJTMIZTeCdd
   CFQRpOJl5w9Eeqa+tzTkgFdAPYaiz1PxxMn3WVFg7BxENzyRti6duFhQJ
   8Q0K+Xs1Lmm3JUuUdjTfxNVmZIYh9GE6R0GyrU3tXBkKxVVA9nQun1MK9
   q2WnYReMOFtF/i5tRZtEY5OXGR+TtlVY/jCJ2At1IF0x6Gaz/0IUM/lZc
   Lx1ZdWfwCzWO331A8BnhjxJWuWhCqJnzVs6aIdWI6AgionDKrZf29yGS9
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="266916311"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="266916311"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 03:19:31 -0700
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="669819774"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 03:19:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1noMxc-00EIJZ-VW;
        Tue, 10 May 2022 13:19:20 +0300
Date:   Tue, 10 May 2022 13:19:20 +0300
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
Subject: Re: [PATCH v4 8/9] i2c: npcm: Remove own slave addresses 2:10
Message-ID: <Yno8KMycNbJ+VGtc@smile.fi.intel.com>
References: <20220510091654.8498-1-warp5tw@gmail.com>
 <20220510091654.8498-9-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510091654.8498-9-warp5tw@gmail.com>
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

On Tue, May 10, 2022 at 05:16:53PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
> 
> NPCM can support up to 10 own slave addresses.
> In practice, only one address is actually being used.
> In order to access addresses 2 and above, need to switch
> register banks. The switch needs spinlock.
> To avoid using spinlock for this useless feature
> removed support of SA >= 2.

> Also fix returned slave event enum.
> 
> Remove some comment since the bank selection is not
> required. The bank selection is not required since
> the supported slave addresses are reduced.

Fancy indentation. Please fix it in all your commit messages where it applies.

...

> +	if (addr_type > I2C_SLAVE_ADDR2 && addr_type <= I2C_SLAVE_ADDR10) {
> +		dev_err(bus->dev,
> +			"try to enable more then 2 SA not supported\n");

Make it one line and drop {}.

> +	}

...

> +	if (addr_type > I2C_SLAVE_ADDR2 && addr_type <= I2C_SLAVE_ADDR10) {
> +		dev_err(bus->dev,
> +			"get slave: try to use more then 2 slave addresses not supported\n");

As per above be consistent with abbreviations ("SA" here, which makes line
shorter) and follow the above recommendation.

> +	}

-- 
With Best Regards,
Andy Shevchenko


