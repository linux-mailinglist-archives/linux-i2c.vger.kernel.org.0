Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 824F95B793E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 20:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbiIMSRT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 14:17:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231314AbiIMSRA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 14:17:00 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A893C74E32;
        Tue, 13 Sep 2022 10:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663089984; x=1694625984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8l8sVqCYPFAIMdJg6jBdWIjl1HdQJtMIy8edAcpgqMI=;
  b=CigPpHe6zP6FuumooGWkQEl40ZSyrbsY6r+etxskCXtL0BYIFYDMNYzo
   6FpV/pZAWuz7p8MNJpubOgkH1BepHzjG5EXc+P8MJaKv4zzKNeCN/kG6u
   iyEgZUSi3ygogBnTfgaobgCa4PscLib0DlmtP2MQIY6JfPTTiF1nKAkIo
   8L1W0E+K7BzjqHo3kvoCJH+kLI+8E0vZ3TgD4JP3LgCQD50TGx6cIGjYD
   cyhQmwaeS9M/agEtq3XeBauDYW2x1RnVtuK1gvbFoJvD/JZmG3ASGG76N
   m6thJIhHOMXboWAPuRxQV06I9b39EIUb3kUPKDz4v8wa2nvAZoqYs4K2Z
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="296935676"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="296935676"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 10:26:22 -0700
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="649745153"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 10:26:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oY9fr-001rBg-2X;
        Tue, 13 Sep 2022 20:26:15 +0300
Date:   Tue, 13 Sep 2022 20:26:15 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
        jingle.wu@emc.com.tw, mario.limonciello@amd.com, timvp@google.com,
        linus.walleij@linaro.org, hdegoede@redhat.com, rafael@kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/13] i2c: acpi: Use ACPI wake capability bit to set
 wake_irq
Message-ID: <YyC9N62JaMGaeanf@smile.fi.intel.com>
References: <20220912221317.2775651-1-rrangel@chromium.org>
 <20220912160931.v2.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912160931.v2.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 12, 2022 at 04:13:11PM -0600, Raul E Rangel wrote:
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

> +			if (irq > 0 && acpi_wake_capable)
> +				client->flags |= I2C_CLIENT_WAKE;

Why do we need a parameter and can't simply set this flag inside the callee?

-- 
With Best Regards,
Andy Shevchenko


