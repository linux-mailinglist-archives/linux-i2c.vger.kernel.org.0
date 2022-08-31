Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68AFA5A7C84
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Aug 2022 13:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiHaLwf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Aug 2022 07:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiHaLwe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 Aug 2022 07:52:34 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EED1C7F9B;
        Wed, 31 Aug 2022 04:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661946753; x=1693482753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oYuQNupbwHPTjXRmzQFBh8aoIsFuQZttcSqIKJea66Q=;
  b=QRV3Jv+j7MLrNcNHqkaby2wDLNxDt7p6S9PHNFUMl63LncRJq1piAQ1P
   2nd+hCnGrdyHwsARqtRFIOzufec7XekLWJRn4UVPzKx3yG4D9KwKIejNX
   2owyaLHENW3zZOkBJygFvvMhtboXbVYQ6nhjSbf+IGwJxOzXGHiEfzVPV
   PrHaXi/omd2eqVRNyN/1W2yIUHrlshBv4JPTIw+frbX/J7jIKYb4ndQub
   sgwZjwE5ZIyMBYZoDAVZz1LbopItG/6AcWtcZkjK08kTwHl/g96tawRC1
   oINxwd8gF0Nxfgyg1b5gHNoeeq8QqsNcXD62c+dIQvmZwf59wbUj5aENb
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="275831600"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; 
   d="scan'208";a="275831600"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 04:52:33 -0700
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; 
   d="scan'208";a="680398895"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 04:52:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oTMGe-006MMJ-07;
        Wed, 31 Aug 2022 14:52:24 +0300
Date:   Wed, 31 Aug 2022 14:52:23 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
        hdegoede@redhat.com, mario.limonciello@amd.com, timvp@google.com,
        rafael@kernel.org, Alistair Francis <alistair@alistair23.me>,
        Angela Czubak <acz@semihalf.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartosz Szczepanek <bsz@semihalf.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>, Len Brown <lenb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Yang Li <yang.lee@linux.alibaba.com>,
        "jingle.wu" <jingle.wu@emc.com.tw>, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] acpi: i2c: Use SharedAndWake and ExclusiveAndWake to
 enable wake irq
Message-ID: <Yw9LdxWQMpnzgFe/@smile.fi.intel.com>
References: <20220830231541.1135813-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220830231541.1135813-1-rrangel@chromium.org>
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

On Tue, Aug 30, 2022 at 05:15:33PM -0600, Raul E Rangel wrote:
> Today, i2c drivers are making the assumption that their IRQs can also
> be used as wake IRQs. This isn't always the case and it can lead to
> spurious wakes. This has recently started to affect AMD Chromebooks.
> With the introduction of
> d62bd5ce12d7 ("pinctrl: amd: Implement irq_set_wake"), the AMD GPIO
> controller gained the capability to set the wake bit on each GPIO. The
> ACPI specification defines two ways to inform the system if a device is
> wake capable:
> 1) The _PRW object defines the GPE that can be used to wake the system.
> 2) Setting ExclusiveAndWake or SharedAndWake in the _CRS GpioInt.
> 
> Currently only the first method is supported. The i2c drivers don't have
> any indication that the IRQ is wake capable, so they guess. This causes
> spurious interrupts, for example:
> * We have an ACPI HID device that has `_PR0` and `_PR3`. It doesn't have
>   `_PRW` or `ExclusiveAndWake` so that means the device can't wake the
>   system.
> * The IRQ line is active level low for this device and is pulled up by
>   the power resource defined in `_PR0`/`_PR3`.
> * The i2c driver will (incorrectly) arm the GPIO for wake by calling
>   `enable_irq_wake` as part of its suspend hook.
> * ACPI will power down the device since it doesn't have a wake GPE
>   associated with it.
> * When the device is powered down, the IRQ line will drop, and it will
>   trigger a wake event.
> 
> See the following debug log:
> [   42.335804] PM: Suspending system (s2idle)
> [   42.340186] amd_gpio AMD0030:00: RX: Setting wake for pin 89 to enable
> [   42.467736]     power-0416 __acpi_power_off      : Power resource [PR00] turned off
> [   42.467739] device_pm-0280 device_set_power      : Device [H05D] transitioned to D3cold
> [   42.475210] PM: pm_system_irq_wakeup: 11 triggered pinctrl_amd
> [   42.535293] PM: Wakeup unrelated to ACPI SCI
> [   42.535294] PM: resume from suspend-to-idle
> 
> In order to fix this, we need to take into account the wake capable bit
> defined on the GpioInt. This is accomplished by:
> * Migrating some of the i2c drivers over to using the PM subsystem to
>   manage the wake IRQ. max8925-i2c, elants_i2c, and raydium_i2c_ts still
>   need to be migrated, I can do that depending on the feedback to this
>   patch series.
> * Expose the wake_capable bit from the ACPI GpioInt resource to the
>   i2c core.
> * Use the wake_capable bit in the i2c core to call
>   `dev_pm_set_wake_irq`. This reuses the existing device tree flow.
> * Make the i2c drivers stop calling `dev_pm_set_wake_irq` since it's now
>   handled by the i2c core.
> * Make the ACPI device PM system aware of the wake_irq. This is
>   necessary so the device doesn't incorrectly get powered down when a
>   wake_irq is enabled.
> 
> I've tested this code with various combinations of having _PRW,
> ExclusiveAndWake and power resources all defined or not defined, but it
> would be great if others could test this out on their hardware.

I have got only cover letter and a single patch (#3). What's going on?

Note: I'm also reviewer of I²C DesignWare driver, you really have to
fix your tools / submission process and try again. No review for this
series.

-- 
With Best Regards,
Andy Shevchenko


