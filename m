Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 236E63772F
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 16:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728970AbfFFOxO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 6 Jun 2019 10:53:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:54386 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727559AbfFFOxO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 6 Jun 2019 10:53:14 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A5498AFE3;
        Thu,  6 Jun 2019 14:53:11 +0000 (UTC)
Date:   Thu, 6 Jun 2019 16:53:09 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
        Steven Honeyman <stevenhoneyman@gmail.com>,
        Valdis.Kletnieks@vt.edu,
        Jochen Eisinger <jochen@penguin-breeder.org>,
        Gabriele Mazzotta <gabriele.mzt@gmail.com>,
        Andy Lutomirski <luto@kernel.org>, Mario_Limonciello@dell.com,
        Alex Hung <alex.hung@canonical.com>,
        Takashi Iwai <tiwai@suse.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4] i2c: i801: Register optional lis3lv02d I2C device on
 Dell machines
Message-ID: <20190606165309.4a3c81c0@endymion>
In-Reply-To: <20190604223303.31945-1-pali.rohar@gmail.com>
References: <20190604223303.31945-1-pali.rohar@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Pali,

On Wed,  5 Jun 2019 00:33:03 +0200, Pali Rohár wrote:
> Dell platform team told us that some (DMI whitelisted) Dell Latitude
> machines have ST microelectronics accelerometer at I2C address 0x29.
> 
> Presence of that ST microelectronics accelerometer is verified by existence
> of SMO88xx ACPI device which represent that accelerometer. Unfortunately
> ACPI device does not specify I2C address.
> 
> This patch registers lis3lv02d device for selected Dell Latitude machines
> at I2C address 0x29 after detection. And for Dell Vostro V131 machine at
> I2C address 0x1d which was manually detected.
> 
> Finally commit a7ae81952cda ("i2c: i801: Allow ACPI SystemIO OpRegion to
> conflict with PCI BAR") allowed to use i2c-i801 driver on Dell machines so
> lis3lv02d correctly initialize accelerometer.
> 
> Tested on Dell Latitude E6440.
> 
> Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
> 
> ---
> Changes since v3:
>  * Use char * [] type for list of acpi ids
>  * Check that SMO88xx acpi device is present, enabled and functioning
>  * Simplify usage of acpi_get_devices()
>  * Change i2c to I2C
>  * Make dell_lis3lv02d_devices const
> 
> Changes since v2:
>  * Use explicit list of SMOxx ACPI devices
> 
> Changes since v1:
>  * Added Dell Vostro V131 based on Michał Kępień testing
>  * Changed DMI product structure to include also i2c address
> ---
>  drivers/i2c/busses/i2c-i801.c       | 123 ++++++++++++++++++++++++++++++++++++
>  drivers/platform/x86/dell-smo8800.c |   1 +
>  2 files changed, 124 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index ac7f7817dc89..9060d4b16f4f 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1134,6 +1134,126 @@ static void dmi_check_onboard_devices(const struct dmi_header *dm, void *adap)
>  	}
>  }
>  
> +/* NOTE: Keep this list in sync with drivers/platform/x86/dell-smo8800.c */
> +static const char *const acpi_smo8800_ids[] = {
> +	"SMO8800",
> +	"SMO8801",
> +	"SMO8810",
> +	"SMO8811",
> +	"SMO8820",
> +	"SMO8821",
> +	"SMO8830",
> +	"SMO8831",
> +};
> +
> +static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
> +					     u32 nesting_level,
> +					     void *context,
> +					     void **return_value)
> +{
> +	struct acpi_device_info *info;
> +	unsigned long long sta;
> +	acpi_status status;
> +	char *hid;
> +	int i;
> +
> +	status = acpi_bus_get_status_handle(obj_handle, &sta);
> +	if (!ACPI_SUCCESS(status))
> +		return AE_OK;
> +	if (!(sta & (ACPI_STA_DEVICE_PRESENT |
> +		     ACPI_STA_DEVICE_ENABLED |
> +		     ACPI_STA_DEVICE_FUNCTIONING)))
> +		return AE_OK;

This is testing that *either* bit is set. Is it what you intend to
achieve, or would you rather want to ensure that *all* these bits are
set?

> +
> +	status = acpi_get_object_info(obj_handle, &info);
> +	if (!ACPI_SUCCESS(status) || !(info->valid & ACPI_VALID_HID))
> +		return AE_OK;
> +
> +	hid = info->hardware_id.string;
> +	if (!hid)
> +		return AE_OK;
> +
> +	for (i = 0; i < ARRAY_SIZE(acpi_smo8800_ids); ++i) {
> +		if (strcmp(hid, acpi_smo8800_ids[i]) == 0) {
> +			*((bool *)return_value) = true;
> +			return AE_CTRL_TERMINATE;
> +		}
> +	}
> +
> +	return AE_OK;
> +}
> +
> +static bool is_dell_system_with_lis3lv02d(void)
> +{
> +	bool found;
> +	const char *vendor;
> +
> +	vendor = dmi_get_system_info(DMI_SYS_VENDOR);
> +	if (strcmp(vendor, "Dell Inc.") != 0)
> +		return false;
> +
> +	/*
> +	 * Check that ACPI device SMO88xx exists and is enabled. That ACPI
> +	 * device represent our ST microelectronics lis3lv02d accelerometer but
> +	 * unfortunately without any other information (like I2C address).
> +	 */
> +	found = false;
> +	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL,
> +				  (void **)&found);

Alignment is incorrect now - but don't resend just for this.

> +
> +	return found;
> +}
> (...)

Everything else looks good to me now. Has the latest version of your
patch been tested on real hardware?

-- 
Jean Delvare
SUSE L3 Support
