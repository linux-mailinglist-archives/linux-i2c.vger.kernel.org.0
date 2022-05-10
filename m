Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 389725211F1
	for <lists+linux-i2c@lfdr.de>; Tue, 10 May 2022 12:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239433AbiEJKTH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 06:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239649AbiEJKTG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 06:19:06 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3AB2AC0D0;
        Tue, 10 May 2022 03:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652177710; x=1683713710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mm3Wzebclb3e6JX7+dRypp1DwInebPhxa0hyqQTCYhk=;
  b=kDGssBIhxnWy2DXf8j0c2X8wVfKkSXxXqZ7yYTzBcqD2P0Tg9txmiNMz
   VqNxgErH5B2HXSK0zFOgoq4539PYN6R8UM2OTLM2W3NjUHYlTVn1qm0Ud
   jE9zG/DMPLpppZHy/oOiknyZFUUy956EyEQ4fKaeYkL+XlJ0fTpGuRNxG
   oF1d2/2WNkkY5j7xuwzArZbWKV54G333bWTMD9ubt9B+5M1oywgvnAhd0
   8VVPN3aSykZssT5DvLiOaB2W5MT1KWRjBSC78M7bo9pBN83K8QBnshfo8
   qsxre1K6aUbtZ3QqC9QQ61kzxi07fze+IFYBvB9Hd2if5WsGLTnFV6c0f
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="256865436"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="256865436"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 03:15:09 -0700
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="635878530"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 03:15:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1noMtO-00EIEX-Bb;
        Tue, 10 May 2022 13:14:58 +0300
Date:   Tue, 10 May 2022 13:14:57 +0300
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
Subject: Re: [PATCH v4 7/9] i2c: npcm: Handle spurious interrupts
Message-ID: <Yno7IaBNnR5U2GuF@smile.fi.intel.com>
References: <20220510091654.8498-1-warp5tw@gmail.com>
 <20220510091654.8498-8-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510091654.8498-8-warp5tw@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 10, 2022 at 05:16:52PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
> 
> On some platforms in rare cases (1 to 100,000 transactions),
> the i2c gets a spurious interrupt which means that we enter an interrupt
> but in the interrupt handler we don't find any status bit that points to
> the reason we got this interrupt.
> 
> This may be a case of a rare HW issue or signal integrity issue that is
> still under investigation.
> 
> In order to overcome this we are doing the following:
> 1. Disable incoming interrupts in master mode only when slave mode is not
>    enabled.
> 2. Clear end of busy (EOB) after every interrupt.
> 3. Clear other status bits (just in case since we found them cleared)
> 4. Return correct status during the interrupt that will finish the
>    transaction.
> 
> On next xmit transaction if the bus is still busy the master will issue a
> recovery process before issuing the new transaction.

...

> +	/* clear status bits for spurious interrupts */

Clear

...

> +	/*
> +	 * if irq is not one of the above, make sure EOB is disabled and all

If

> +	 * status bits are cleared.
> +	 */

...

> +		/* verify no status bits are still set after bus is released */

Verify

...

> +	/* check HW is OK: SDA and SCL should be high at this point. */

Check

...

> +	if ((npcm_i2c_get_SDA(&bus->adap) == 0) ||
> +	    (npcm_i2c_get_SCL(&bus->adap) == 0)) {

This fits one line

> +		dev_err(bus->dev, "I2C%d init fail: lines are low", bus->num);
> +		dev_err(bus->dev, "SDA=%d SCL=%d", npcm_i2c_get_SDA(&bus->adap),
> +			npcm_i2c_get_SCL(&bus->adap));

No '\n' at the end of each?!

> +		return -ENXIO;
> +	}

...

> +	/* clear status bits for spurious interrupts */

Clear

...

> +	/* after any xfer, successful or not, stall and EOB must be disabled */

After

...

Maybe you chose the small letter for one-liner comments, but I see even in the
original code the inconsistent style. Please, add an explanation to the cover
letter and follow it, assuming you add the patch at the end of the series that
makes comment style consistent (for the one-liners, for the multi-line comments
we have a clear understanding about the style).

-- 
With Best Regards,
Andy Shevchenko


