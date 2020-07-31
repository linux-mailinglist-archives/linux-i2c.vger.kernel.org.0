Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 203E123430F
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jul 2020 11:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732411AbgGaJ16 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jul 2020 05:27:58 -0400
Received: from mga18.intel.com ([134.134.136.126]:29986 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732894AbgGaJ15 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 31 Jul 2020 05:27:57 -0400
IronPort-SDR: Kq1THVboy2ZTq3BzuGWffR7QnSC9BBpTVxZWlitxDxmLkH91EPbPi2v4SFVj3nA9SxT+GQY8Th
 TpO7MNs7TN3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="139313870"
X-IronPort-AV: E=Sophos;i="5.75,417,1589266800"; 
   d="scan'208";a="139313870"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 02:27:56 -0700
IronPort-SDR: HiRETURUYAFFCi4ERosfDa9BkOJ6cbb0yEB4vjxGi37lUxFz5NW70sBex5Io8ipFIFsn4mYvix
 GgSnCZX17l7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,417,1589266800"; 
   d="scan'208";a="274466351"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 31 Jul 2020 02:27:53 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k1RKT-005HPB-He; Fri, 31 Jul 2020 12:27:53 +0300
Date:   Fri, 31 Jul 2020 12:27:53 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Pu Wen <puwen@hygon.cn>
Cc:     rjw@rjwysocki.net, lenb@kernel.org, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Add device HID for Hygon I2C controller
Message-ID: <20200731092753.GL3703480@smile.fi.intel.com>
References: <20200731084845.24459-1-puwen@hygon.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200731084845.24459-1-puwen@hygon.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 31, 2020 at 04:48:45PM +0800, Pu Wen wrote:
> Add device HID HYGO0010 to match the Hygon ACPI Vendor ID (HYGO) that
> was registered in http://www.uefi.org/acpi_id_list, and the I2C
> controller on Hygon paltform will use the HID.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Pu Wen <puwen@hygon.cn>
> ---
>  drivers/acpi/acpi_apd.c                     | 1 +
>  drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
> index ba2612e9a0eb..f24f6d3f1fa5 100644
> --- a/drivers/acpi/acpi_apd.c
> +++ b/drivers/acpi/acpi_apd.c
> @@ -240,6 +240,7 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
>  	{ "AMDI0020", APD_ADDR(cz_uart_desc) },
>  	{ "AMD0030", },
>  	{ "AMD0040", APD_ADDR(st_misc_desc)},
> +	{ "HYGO0010", APD_ADDR(wt_i2c_desc) },
>  #endif
>  #ifdef CONFIG_ARM64
>  	{ "APMC0D0F", APD_ADDR(xgene_i2c_desc) },
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index a71bc58fc03c..0dfeb2d11603 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -55,6 +55,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
>  	{ "HISI02A1", 0 },
>  	{ "HISI02A2", 0 },
>  	{ "HISI02A3", 0 },
> +	{ "HYGO0010", ACCESS_INTR_MASK },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
> -- 
> 2.23.0
> 

-- 
With Best Regards,
Andy Shevchenko


