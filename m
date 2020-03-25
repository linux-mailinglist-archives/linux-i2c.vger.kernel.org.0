Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1871921E3
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Mar 2020 08:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgCYHru (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Mar 2020 03:47:50 -0400
Received: from mga06.intel.com ([134.134.136.31]:26435 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbgCYHru (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 25 Mar 2020 03:47:50 -0400
IronPort-SDR: upuYQNI6HogEp+0+muM9yx7ibuwXFnLhSQS1JEVDlYdy4v7jWekMCAEnBWvRsOzzDUNElniuZN
 Wna/tectSZrA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2020 00:47:49 -0700
IronPort-SDR: CWKDasrNs9k2+ejwz0Gb0z2d6E3sPq7aCoal4qYRYOiKyZVTLFTJ2Lo64hUG8B8bq75bOq+VfP
 MRqXrYNnScog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,303,1580803200"; 
   d="scan'208";a="247069010"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by orsmga003.jf.intel.com with ESMTP; 25 Mar 2020 00:47:48 -0700
Subject: Re: [PATCH v1 1/2] i2c: designware: Make master module optional
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20200323100451.28808-1-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <c3d2d5ff-605a-bdb7-275b-872fdfd10ccd@linux.intel.com>
Date:   Wed, 25 Mar 2020 09:47:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200323100451.28808-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/23/20 12:04 PM, Andy Shevchenko wrote:
> In some cases we know that the controller will be always used in slave mode and
> master is just a bulk. In order to drop that, introduce a separate configuration
> parameter for master mode. Default it to core to avoid regressions.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/Kconfig                  | 10 ++++++++++
>   drivers/i2c/busses/Makefile                 |  5 ++++-
>   drivers/i2c/busses/i2c-designware-core.h    | 19 ++++++++++++++++++-
>   drivers/i2c/busses/i2c-designware-master.c  |  4 ++--
>   drivers/i2c/busses/i2c-designware-pcidrv.c  |  2 +-
>   drivers/i2c/busses/i2c-designware-platdrv.c |  6 +-----
>   6 files changed, 36 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 2ddca08f8a76..1df238ff8dd0 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -527,6 +527,16 @@ config I2C_DAVINCI
>   config I2C_DESIGNWARE_CORE
>   	tristate
>   
> +config I2C_DESIGNWARE_MASTER
> +	bool "Synopsys DesignWare Master"
> +	default I2C_DESIGNWARE_CORE
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  Synopsys DesignWare I2C master adapter.
> +
> +	  This is not a standalone module, this module compiles together with
> +	  i2c-designware-core.
> +

I think we should go to a opposite direction - reduce the number of 
I2C_DESIGNWARE_ config options rather than add new ones. We already have 
5 config options for it.

Size of i2c-designware-core.ko is around 12 kB with all master, slave 
and Baytrail semaphore code built in so I don't think it justifies the 
added config complexity. I think distributions will have anyway all of 
those options set.

Having those code in separate modules and load only when needed might 
make sense as that would save a few kB of RAM.

-- 
Jarkko
