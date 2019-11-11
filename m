Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25CC6F72BF
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2019 12:06:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbfKKLG5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Nov 2019 06:06:57 -0500
Received: from mga12.intel.com ([192.55.52.136]:5255 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726768AbfKKLG5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Nov 2019 06:06:57 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Nov 2019 03:06:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,292,1569308400"; 
   d="scan'208";a="213745848"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 11 Nov 2019 03:06:54 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 11 Nov 2019 13:06:53 +0200
Date:   Mon, 11 Nov 2019 13:06:53 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, youling 257 <youling257@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH] i2c: acpi: Force bus speed to 400KHz if a Silead
 touchscreen is present
Message-ID: <20191111110653.GG2552@lahna.fi.intel.com>
References: <20191111104827.3713-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191111104827.3713-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+Jarkko

On Mon, Nov 11, 2019 at 11:48:27AM +0100, Hans de Goede wrote:
> Many cheap devices use Silead touchscreen controllers. Testing has shown
> repeatedly that these touchscreen controllers work fine at 400KHz, but for
> unknown reasons do not work properly at 100KHz. This has been seen on
> both ARM and x86 devices using totally different i2c controllers.
> 
> On some devices the ACPI tables list another device at the same I2C-bus
> as only being capable of 100KHz, testing has shown that these other
> devices work fine at 400KHz (as can be expected of any recent I2C hw).
> 
> This commit makes i2c_acpi_find_bus_speed() always return 400KHz if a
> Silead touchscreen controller is present, fixing the touchscreen not
> working on devices which ACPI tables' wrongly list another device on the
> same bus as only being capable of 100KHz.
> 
> Specifically this fixes the touchscreen on the Jumper EZpad 6 m4 not
> working.
> 
> Reported-and-tested-by: youling 257 <youling257@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/i2c/i2c-core-acpi.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index 9cb2aa1e20ef..420c356eba06 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -39,6 +39,7 @@ struct i2c_acpi_lookup {
>  	int index;
>  	u32 speed;
>  	u32 min_speed;
> +	u32 force_speed;
>  };
>  
>  /**
> @@ -285,6 +286,19 @@ i2c_acpi_match_device(const struct acpi_device_id *matches,
>  	return acpi_match_device(matches, &client->dev);
>  }
>  
> +static const struct acpi_device_id i2c_acpi_force_400khz_device_ids[] = {
> +	/*
> +	 * These Silead touchscreen controllers only work at 400KHz, for
> +	 * some reason they do not work at 100KHz. On some devices the ACPI
> +	 * tables list another device at their bus as only being capable
> +	 * of 100KHz, testing has shown that these other devices work fine
> +	 * at 400KHz (as can be expected of any recent i2c hw) so we force
> +	 * the speed of the bus to 400 KHz if a Silead device is present.
> +	 */
> +	{ "MSSL1680", 0 },
> +	{}
> +};
> +
>  static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,
>  					   void *data, void **return_value)
>  {
> @@ -303,6 +317,9 @@ static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,
>  	if (lookup->speed <= lookup->min_speed)
>  		lookup->min_speed = lookup->speed;
>  
> +	if (acpi_match_device_ids(adev, i2c_acpi_force_400khz_device_ids) == 0)
> +		lookup->force_speed = 400000;

I wonder if it makes sense to log a warning about this? So when
debugging it can be clearly seen from the logs that the device is
quirked.

> +
>  	return AE_OK;
>  }
>  
> @@ -340,7 +357,12 @@ u32 i2c_acpi_find_bus_speed(struct device *dev)
>  		return 0;
>  	}
>  
> -	return lookup.min_speed != UINT_MAX ? lookup.min_speed : 0;
> +	if (lookup.force_speed)
> +		return lookup.force_speed;
> +	else if (lookup.min_speed != UINT_MAX)
> +		return lookup.min_speed;
> +	else
> +		return 0;
>  }
>  EXPORT_SYMBOL_GPL(i2c_acpi_find_bus_speed);
>  
> -- 
> 2.23.0
