Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1093612D20
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Oct 2022 23:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbiJ3WCB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Oct 2022 18:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbiJ3WB6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Oct 2022 18:01:58 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88473617D;
        Sun, 30 Oct 2022 15:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667167317; x=1698703317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sg5G1FwIeTvWisFkxxykHY8fZl7hdfoO90oAJycg4mU=;
  b=kvv+9rzG4Vwjy3QnP/u21UW+gTi1Cbb3MwXggJ+imBdoD4EKviQ4qH0F
   U/TfcWfc06/m3VPc0QQ/GiyhqgJA7jK3vqyLwpBa12WKjoHxcGUwxhhZP
   AoqtudpFJtu5na6TFqXlCh9W5AzFjZfqvEOe9hgaKcEO/ZbO8lVmRd8u/
   2d6UUv48I8eG0QI2R+n5CFwcqOhqN5q/rlNGArtxKkK87B/5rQYquRg8A
   /0B/3n0JljLEmI3CCDEPqbx16yaJ8xWiGYeuujRCdZgLE0M3/rBNCElAU
   ncVNVVjb9bNqHbr8cxFaIKUjrPfMYZy1RrWSXjMHZ+eVrVInvdc9Motj8
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="289172815"
X-IronPort-AV: E=Sophos;i="5.95,226,1661842800"; 
   d="scan'208";a="289172815"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2022 15:01:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="758643523"
X-IronPort-AV: E=Sophos;i="5.95,226,1661842800"; 
   d="scan'208";a="758643523"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 30 Oct 2022 15:01:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1opGNJ-004pcC-2F;
        Mon, 31 Oct 2022 00:01:49 +0200
Date:   Mon, 31 Oct 2022 00:01:49 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Weilong Chen <chenweilong@huawei.com>
Cc:     yangyicong@hisilicon.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, wsa@kernel.org,
        f.fainelli@gmail.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, william.zhang@broadcom.com, jsd@semihalf.com,
        conor.dooley@microchip.com, phil.edworthy@renesas.com,
        tharunkumar.pasumarthi@microchip.com, semen.protsenko@linaro.org,
        kfting@nuvoton.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH next v9 1/4] i2c: hisi: Add initial device tree support
Message-ID: <Y170TZoIp1WBIwU4@smile.fi.intel.com>
References: <20221029115937.179788-1-chenweilong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221029115937.179788-1-chenweilong@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Oct 29, 2022 at 07:59:36PM +0800, Weilong Chen wrote:
> The HiSilicon I2C controller can be used on embedded platform, which
> boot from devicetree.

...

> +#include <linux/acpi.h>
> +#include <linux/of.h>

Why?

...

> +#ifdef CONFIG_ACPI

Why?

...

> +#ifdef CONFIG_OF

Why?

...

> -		.acpi_match_table = hisi_i2c_acpi_ids,
> +		.acpi_match_table = ACPI_PTR(hisi_i2c_acpi_ids),

Why?

...

> +		.of_match_table = of_match_ptr(hisi_i2c_dts_ids),

Why of_match_ptr()?

-- 
With Best Regards,
Andy Shevchenko


