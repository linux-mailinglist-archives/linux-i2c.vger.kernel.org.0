Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7434B1502E2
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2020 10:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbgBCJBG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Feb 2020 04:01:06 -0500
Received: from mga12.intel.com ([192.55.52.136]:7556 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727339AbgBCJBG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Feb 2020 04:01:06 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Feb 2020 01:01:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,397,1574150400"; 
   d="scan'208";a="234560830"
Received: from unknown (HELO [10.237.72.55]) ([10.237.72.55])
  by orsmga006.jf.intel.com with ESMTP; 03 Feb 2020 01:01:03 -0800
Subject: Re: [PATCH v2 2/2] i2c: designware: Add ACPI HID for Hisilicon
 Hip08-Lite I2C controller
To:     Hanjun Guo <guohanjun@huawei.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linuxarm@huawei.com, Sheng Feng <fengsheng5@huawei.com>
References: <1580693767-5185-1-git-send-email-guohanjun@huawei.com>
 <1580693767-5185-2-git-send-email-guohanjun@huawei.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <4e1889bd-39e0-9b87-9f47-e460a782ee09@linux.intel.com>
Date:   Mon, 3 Feb 2020 11:01:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1580693767-5185-2-git-send-email-guohanjun@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/3/20 3:36 AM, Hanjun Guo wrote:
> Add ACPI HID HISI02A3 for Hisilicon Hip08 Lite, which has different
> clock frequency from Hip08 for I2C controller.
> 
> Tested-by: Sheng Feng <fengsheng5@huawei.com>
> Signed-off-by: Hanjun Guo <guohanjun@huawei.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 16dd338..3b7d58c 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -130,6 +130,7 @@ static int dw_i2c_acpi_configure(struct platform_device *pdev)
>   	{ "APMC0D0F", 0 },
>   	{ "HISI02A1", 0 },
>   	{ "HISI02A2", 0 },
> +	{ "HISI02A3", 0 },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
> -- 

Acked-by: Nikula <jarkko.nikula@linux.intel.com>
