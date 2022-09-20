Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCF285BE5E4
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Sep 2022 14:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbiITMcV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Sep 2022 08:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbiITMcU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Sep 2022 08:32:20 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C0C1564CE;
        Tue, 20 Sep 2022 05:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663677139; x=1695213139;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CbnaupBI0IcuRH5CP6ofyWOkuYX0WeuPr4HLdbRSrus=;
  b=NJJwDY+Mo+1fkpP6yLyCp4CWHJTb4rnWK9KZ748fo4KbjhHlm/Mx0sXP
   iPAehYgqCWhpUJ1Bjt5IcFwykBTQHLNvxJ3HfMl2QWN04+lxDMjBsEWXN
   O45KawAnIjCliha6tPsGME+P/qaovX2f/sYr2iWg0TXQsSQZnOahYEMt5
   NmaJLNQDaIAzCouMXsUxGAJZPaoeQ/oLBBRShKHp8ee7C2pqEA5JDgkeW
   v6FajkVGc9ZBqlxZVuTBcGhdUaX/mmrhDPMg7vzoBcf40BtMK60KR+6jd
   dBiPUSxkx3GIjNXMzfn7TDpH9jO1st0MUf9c4BTZbjPjmskurbORlJv31
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="325982203"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="325982203"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 05:32:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="621245024"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 20 Sep 2022 05:32:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oacQ9-004zO7-2u;
        Tue, 20 Sep 2022 15:32:13 +0300
Date:   Tue, 20 Sep 2022 15:32:13 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
        timvp@google.com, hdegoede@redhat.com, rafael@kernel.org,
        mario.limonciello@amd.com, jingle.wu@emc.com.tw,
        mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
        linus.walleij@linaro.org, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/13] i2c: acpi: Use ACPI wake capability bit to set
 wake_irq
Message-ID: <Yymyzcfp7gqdTYam@smile.fi.intel.com>
References: <20220919155916.1044219-1-rrangel@chromium.org>
 <20220919095504.v4.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919095504.v4.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
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

On Mon, Sep 19, 2022 at 09:59:09AM -0600, Raul E Rangel wrote:
> Device tree already has a mechanism to pass the wake_irq. It does this
> by looking for the wakeup-source property and setting the
> I2C_CLIENT_WAKE flag. This CL adds the ACPI equivalent. It uses the
> ACPI interrupt wake flag to determine if the interrupt can be used to
> wake the system. Previously the i2c drivers had to make assumptions and
> blindly enable the wake IRQ. This can cause spurious wake events. e.g.,
> If there is a device with an Active Low interrupt and the device gets
> powered off while suspending, the interrupt line will go low since it's
> no longer powered and wakes the system. For this reason we should
> respect the board designers wishes and honor the wake bit defined on the
> interrupt.

...

> +	if (irq_ctx.irq == -ENOENT)
> +		irq_ctx.irq = acpi_dev_gpio_irq_wake_get(adev, 0, &irq_ctx.wake_capable);

I just realized, that there is an inconsistency on how we fill the wake_capable
parameter. In some cases we check for IRQ for an error condition (IRQ not found)
and in some the wake_capable still be filled.

Here the best approach I believe is to add

	if (irq_ctx.irq < 0)
		return irq_ctx.irq;

I.o.w. we apply the rule "do not fill the output parameters when it's known
to be an error condition".

> +	if (wake_capable)
> +		*wake_capable = irq_ctx.wake_capable;

> +	return irq_ctx.irq;

-- 
With Best Regards,
Andy Shevchenko


