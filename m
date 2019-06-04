Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C85B34B17
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 16:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727663AbfFDO5e convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 4 Jun 2019 10:57:34 -0400
Received: from mx2.suse.de ([195.135.220.15]:34484 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727537AbfFDO5e (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 Jun 2019 10:57:34 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 78525AE79;
        Tue,  4 Jun 2019 14:57:31 +0000 (UTC)
Date:   Tue, 4 Jun 2019 16:57:29 +0200
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
Subject: Re: [PATCH v3] i2c: i801: Register optional lis3lv02d i2c device on
 Dell machines
Message-ID: <20190604165729.4b67222f@endymion>
In-Reply-To: <20190602132003.1911-1-pali.rohar@gmail.com>
References: <20180127133209.28995-1-pali.rohar@gmail.com>
        <20190602132003.1911-1-pali.rohar@gmail.com>
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

Next time, please start a new thread for a new version of a patch.

On Sun,  2 Jun 2019 15:20:03 +0200, Pali Rohár wrote:
> Dell platform team told us that some (DMI whitelisted) Dell Latitude
> machines have ST microelectronics accelerometer at i2c address 0x29.
> 
> Presence of that ST microelectronics accelerometer is verified by existence
> of SMO88xx ACPI device which represent that accelerometer. Unfortunately
> ACPI device does not specify i2c address.
> 
> This patch registers lis3lv02d device for selected Dell Latitude machines
> at i2c address 0x29 after detection. And for Dell Vostro V131 machine at
> i2c address 0x1d which was manually detected.
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
> Changes since v2:
>  * Use explicit list of SMOxx ACPI devices
> 
> Changes since v1:
>  * Added Dell Vostro V131 based on Michał Kępień testing
>  * Changed DMI product structure to include also i2c address
> ---
>  drivers/i2c/busses/i2c-i801.c       | 118 ++++++++++++++++++++++++++++++++++++
>  drivers/platform/x86/dell-smo8800.c |   1 +
>  2 files changed, 119 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index ac7f7817dc89..2ac8ff41cc24 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1134,6 +1134,121 @@ static void dmi_check_onboard_devices(const struct dmi_header *dm, void *adap)
>  	}
>  }
>  
> +/* NOTE: Keep this list in sync with drivers/platform/x86/dell-smo8800.c */
> +static const struct acpi_device_id acpi_smo8800_ids[] = {
> +	{ "SMO8800", 0 },
> +	{ "SMO8801", 0 },
> +	{ "SMO8810", 0 },
> +	{ "SMO8811", 0 },
> +	{ "SMO8820", 0 },
> +	{ "SMO8821", 0 },
> +	{ "SMO8830", 0 },
> +	{ "SMO8831", 0 },
> +};
> +
> +static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
> +					     u32 nesting_level,
> +					     void *context,
> +					     void **return_value)
> +{
> +	struct acpi_device_info *info;
> +	acpi_status status;
> +	char *hid;
> +	int i;
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
> +		if (strcmp(hid, acpi_smo8800_ids[i].id) == 0) {
> +			*((bool *)return_value) = true;
> +			return AE_CTRL_TERMINATE;
> +		}
> +	}
> +
> +	return AE_OK;
> +

Unneeded blank line.

> +}
> +
> +static bool is_dell_system_with_lis3lv02d(void)
> +{
> +	bool found;
> +	acpi_status status;
> +	const char *vendor;
> +
> +	vendor = dmi_get_system_info(DMI_SYS_VENDOR);
> +	if (strcmp(vendor, "Dell Inc.") != 0)
> +		return false;
> +
> +	/*
> +	 * Check that ACPI device SMO88xx exists and is enabled. That ACPI

I see how you check that the device exists, but not that it is enabled.

> +	 * device represent our ST microelectronics lis3lv02d accelerometer but
> +	 * unfortunately without any other information (like i2c address).

I2C

> +	 */
> +	found = false;
> +	status = acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL,
> +				  (void **)&found);
> +	if (!ACPI_SUCCESS(status) || !found)
> +		return false;
> +
> +	return true;

Looks more complex than it needs to be. You don't really care about the
status, as in the end you return the same on error as you do when no
device is found. So I think you can simply go with:

	found = false;
	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL,
				  (void **)&found);

	return found;


> +}
> +
> +/*
> + * Accelerometer's i2c address is not specified in DMI nor ACPI,

I2C

> + * so it is needed to define mapping table based on DMI product names.
> + */
> +static struct {

Any reason to not make it const?

> +	const char *dmi_product_name;
> +	unsigned short i2c_addr;
> +} dell_lis3lv02d_devices[] = {
> +	/*
> +	 * Dell platform team told us that these Latitude devices have
> +	 * ST microelectronics accelerometer at i2c address 0x29.

I2C

> +	 */
> +	{ "Latitude E5250",     0x29 },
> +	{ "Latitude E5450",     0x29 },
> +	{ "Latitude E5550",     0x29 },
> +	{ "Latitude E6440",     0x29 },
> +	{ "Latitude E6440 ATG", 0x29 },
> +	{ "Latitude E6540",     0x29 },
> +	/*
> +	 * Additional individual entries were added after verification.
> +	 */
> +	{ "Vostro V131",        0x1d },
> +};
> +
> +static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
> +{
> +	struct i2c_board_info info;
> +	const char *dmi_product_name;
> +	int i;
> +
> +	dmi_product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
> +	for (i = 0; i < ARRAY_SIZE(dell_lis3lv02d_devices); ++i) {
> +		if (strcmp(dmi_product_name,
> +			   dell_lis3lv02d_devices[i].dmi_product_name) == 0)
> +			break;
> +	}
> +
> +	if (i == ARRAY_SIZE(dell_lis3lv02d_devices)) {
> +		dev_warn(&priv->pci_dev->dev,
> +			 "Accelerometer lis3lv02d is present on i2c bus but its"

i2c bus -> SMBus

> +			 " i2c address is unknown, skipping registration...\n");

I2C (or just s/i2c //, as it's kind of redundant)

Suspension points not really needed IMHO.

> +		return;
> +	}
> + (...)

All the rest looks good to me.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
