Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686A5344CBC
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Mar 2021 18:06:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232066AbhCVRFb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Mar 2021 13:05:31 -0400
Received: from mga09.intel.com ([134.134.136.24]:54181 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232101AbhCVRE5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Mar 2021 13:04:57 -0400
IronPort-SDR: usCfqGJJrOFsSQSh7pfPMeNaUup0kTeVg3E0DK6nkmaNUED+sTVQRLmINfvFsjzsn5uW//+ZO8
 U/+S5YYiffeQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="190406487"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; 
   d="scan'208";a="190406487"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2021 10:04:51 -0700
IronPort-SDR: 3wyrHrEBR8pDHoSz1nd+UpuhGVnthKYsulNucJ0UkkGB9XtMpnM9EpUz/Vr3APeH8mVo5qH8nX
 SjtgiDb6xNbg==
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; 
   d="scan'208";a="592688500"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2021 10:04:48 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lONyv-00EmyA-3u; Mon, 22 Mar 2021 19:04:45 +0200
Date:   Mon, 22 Mar 2021 19:04:45 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org, digetx@gmail.com,
        treding@nvidia.com, jarkko.nikula@linux.intel.com,
        rmk+kernel@armlinux.org.uk, song.bao.hua@hisilicon.com,
        john.garry@huawei.com, prime.zeng@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH v3 2/3] i2c: add support for HiSilicon I2C controller
Message-ID: <YFjOLTpe7fYvE9C1@smile.fi.intel.com>
References: <1616411413-7177-1-git-send-email-yangyicong@hisilicon.com>
 <1616411413-7177-3-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1616411413-7177-3-git-send-email-yangyicong@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 22, 2021 at 07:10:12PM +0800, Yicong Yang wrote:
> Add HiSilicon I2C controller driver for the Kunpeng SoC. It provides
> the access to the i2c busses, which connects to the eeprom, rtc, etc.
> 
> The driver works with IRQ mode, and supports basic I2C features and 10bit
> address. The DMA is not supported.

...

> +static const char *hisi_i2c_speed_string(u32 bus_freq_hz)
> +{
> +	switch (bus_freq_hz) {
> +	case I2C_MAX_STANDARD_MODE_FREQ:
> +		return "100K";
> +	case I2C_MAX_FAST_MODE_FREQ:
> +		return "400K";
> +	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
> +		return "3.4M";
> +	default:
> +		return "unknown";
> +	}
> +}

Just realized that if you print the name of the mode (and maybe frequency
value) then it can be moved to generic I²C code and other will benefit out of
this (DesignWare is the first in my mind).


-- 
With Best Regards,
Andy Shevchenko


