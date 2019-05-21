Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B50D24DF9
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 13:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbfEULhG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 07:37:06 -0400
Received: from mga07.intel.com ([134.134.136.100]:32829 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726296AbfEULhG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 07:37:06 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 May 2019 04:37:05 -0700
X-ExtLoop1: 1
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 21 May 2019 04:37:02 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 21 May 2019 14:37:01 +0300
Date:   Tue, 21 May 2019 14:37:01 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     wsa@the-dreams.de, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com, jbroadus@gmail.com,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 4/5] i2c: core: Move ACPI gpio IRQ handling into
 i2c_acpi_get_irq
Message-ID: <20190521113701.GY2781@lahna.fi.intel.com>
References: <20190520084936.10590-1-ckeepax@opensource.cirrus.com>
 <20190520084936.10590-5-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520084936.10590-5-ckeepax@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 20, 2019 at 09:49:35AM +0100, Charles Keepax wrote:
> It makes sense to contain all the ACPI IRQ handling in a single helper
> function.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> Note that this one is somewhat interesting, it seems the search
> through the resource list is done against the companion device
> of the adapter but the GPIO search is done against the companion
> device of the client. It feels to me like these really should
> be done on the same device, and certainly this is what SPI
> does (both against the equivalent of the adapter). Perhaps
> someone with more ACPI knowledge than myself could comment?

What GPIO search you mean? I did not find any ACPI specific GPIO lookup
in the i2c-core-acpi/base files.

> Thanks,
> Charles
> 
>  drivers/i2c/i2c-core-acpi.c | 3 +++
>  drivers/i2c/i2c-core-base.c | 4 ----
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index e332760bf9ebc..0c882d956e9a4 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -164,6 +164,9 @@ int i2c_acpi_get_irq(struct i2c_client *client, int *irq)

Maybe worth adding kernel-doc explaining what the function does if it
does not have already.

>  
>  	acpi_dev_free_resource_list(&resource_list);
>  
> +	if (*irq < 0)
> +		*irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(&client->dev), 0);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index c1afa17a76bfc..f958b50c78c04 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -336,10 +336,6 @@ static int i2c_device_probe(struct device *dev)
>  				irq = of_irq_get(dev->of_node, 0);
>  		} else if (ACPI_COMPANION(dev)) {
>  			i2c_acpi_get_irq(client, &irq);

I think we should check and handle possible error here.

> -
> -			if (irq == -ENOENT)
> -				irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev),
> -							    0);
>  		}
>  		if (irq == -EPROBE_DEFER)
>  			return irq;
> -- 
> 2.11.0
