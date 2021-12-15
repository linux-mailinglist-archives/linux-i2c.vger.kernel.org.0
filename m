Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5C944753E3
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 08:51:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234083AbhLOHvN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 02:51:13 -0500
Received: from mga18.intel.com ([134.134.136.126]:27224 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230260AbhLOHvM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Dec 2021 02:51:12 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="226029945"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="226029945"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 23:51:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="545492292"
Received: from mylly.fi.intel.com (HELO [10.237.72.88]) ([10.237.72.88])
  by orsmga001.jf.intel.com with ESMTP; 14 Dec 2021 23:51:11 -0800
Message-ID: <3d67442c-87a7-e05b-7f69-de501fc0ad29@linux.intel.com>
Date:   Wed, 15 Dec 2021 09:51:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/6] i2c: designware-pci: Use temporary variable for
 struct device
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20211213180034.30929-1-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20211213180034.30929-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/13/21 20:00, Andy Shevchenko wrote:
> Use temporary variable for struct device to make code neater.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: dropped dev --> i_dev renaming (Jarkko)
>   drivers/i2c/busses/i2c-designware-pcidrv.c | 52 +++++++++++-----------
>   1 file changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index 0f409a4c2da0..5f76010f7dfd 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -207,23 +207,23 @@ static struct dw_pci_controller dw_pci_controllers[] = {
>   };
>   
>   #ifdef CONFIG_PM
> -static int i2c_dw_pci_suspend(struct device *dev)
> +static int i2c_dw_pci_suspend(struct device *d)
>   {
> -	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +	struct dw_i2c_dev *dev = dev_get_drvdata(d);
>   >   
> -	dev = devm_kzalloc(&pdev->dev, sizeof(struct dw_i2c_dev), GFP_KERNEL);
> +	dev = devm_kzalloc(d, sizeof(*dev), GFP_KERNEL);
Ditto.

> -	i_dev->suspended = true;
> -	i_dev->disable(i_dev);
> +	dev->suspended = true;
> +	dev->disable(dev);
>   
In my opinion this brings more mess than removes. If I see 
dev->something I'll immediatelly think "struct device" and get confused. 
x_dev->something or dev_y->something not so much. And this change adds 
in my opinion more confusion than removes.

>   	if (id->driver_data >= ARRAY_SIZE(dw_pci_controllers)) {
> -		dev_err(&pdev->dev, "%s: invalid driver data %ld\n", __func__,
> -			id->driver_data);
> +		dev_err(d, "%s: invalid driver data %ld\n", __func__, id->driver_data);
>   		return -EINVAL;

Honestly, what's is the value of this change? Yet another differently 
named "device" pointer more to the mess (Inconsistent naming use of 
struct dw_i2c_dev *dev, struct dw_i2c_dev *i_dev and struct device *dev 
in the i2c-designware-*).

Jarkko
