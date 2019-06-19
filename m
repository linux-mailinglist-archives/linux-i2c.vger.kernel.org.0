Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0E144BA99
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2019 15:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbfFSN61 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jun 2019 09:58:27 -0400
Received: from mga07.intel.com ([134.134.136.100]:26263 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726047AbfFSN60 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jun 2019 09:58:26 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Jun 2019 06:58:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; 
   d="scan'208";a="311360629"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga004.jf.intel.com with ESMTP; 19 Jun 2019 06:58:06 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hdb6E-0005sw-06; Wed, 19 Jun 2019 16:58:06 +0300
Date:   Wed, 19 Jun 2019 16:58:05 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] i2c: base: Drop unneeded checks for of_node
Message-ID: <20190619135805.GO9224@smile.fi.intel.com>
References: <20190312153005.63715-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190312153005.63715-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 12, 2019 at 05:30:05PM +0200, Andy Shevchenko wrote:
> of_find_property() will return NULL if of_node is NULL,
> thus of_irq_get_by_name() returns -EINVAL which we ignore,
> so no need to double check.
> 
> of_node_put() is NULL-aware, no need to check there either.
> 

Wolfram, any comments on this?

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/i2c-core-base.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 28460f6a60cc..5118b59ca7ce 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -354,13 +354,11 @@ static int i2c_device_probe(struct device *dev)
>  		return -ENODEV;
>  
>  	if (client->flags & I2C_CLIENT_WAKE) {
> -		int wakeirq = -ENOENT;
> +		int wakeirq;
>  
> -		if (dev->of_node) {
> -			wakeirq = of_irq_get_byname(dev->of_node, "wakeup");
> -			if (wakeirq == -EPROBE_DEFER)
> -				return wakeirq;
> -		}
> +		wakeirq = of_irq_get_byname(dev->of_node, "wakeup");
> +		if (wakeirq == -EPROBE_DEFER)
> +			return wakeirq;
>  
>  		device_init_wakeup(&client->dev, true);
>  
> @@ -813,10 +811,9 @@ void i2c_unregister_device(struct i2c_client *client)
>  	if (!client)
>  		return;
>  
> -	if (client->dev.of_node) {
> +	if (client->dev.of_node)
>  		of_node_clear_flag(client->dev.of_node, OF_POPULATED);
> -		of_node_put(client->dev.of_node);
> -	}
> +	of_node_put(client->dev.of_node);
>  
>  	if (ACPI_COMPANION(&client->dev))
>  		acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev));
> -- 
> 2.20.1
> 

-- 
With Best Regards,
Andy Shevchenko


