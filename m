Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDBE4A333A
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 03:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353752AbiA3CLR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jan 2022 21:11:17 -0500
Received: from vps.xff.cz ([195.181.215.36]:38668 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236098AbiA3CLQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Jan 2022 21:11:16 -0500
X-Greylist: delayed 349 seconds by postgrey-1.27 at vger.kernel.org; Sat, 29 Jan 2022 21:11:13 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
        t=1643508324; bh=QCaFEAKl4lmDsxn776W1aL4aatdwnt4C9rqE/9W3L7g=;
        h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
        b=hCDHJ3TkEQjc9TVUu0m3zz4GdWvfM/Ce2fsBKF6f94d1v1Bn754t+14N8La/sjHiU
         Pky5DLlro8yIsxe6Yp6LiqS57g5nJAYdW1eQd520rikAZvyxDAVDMmdVqA7989araM
         3qmKXzlBNWkzB6eeGzHoEx2GFHvUMI9xorgKundw=
Date:   Sun, 30 Jan 2022 03:05:23 +0100
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <x@xff.cz>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH 4/5] Input: pinephone-keyboard - Support the proxied I2C
 bus
Message-ID: <20220130020523.f7mx36yj6nlqthoe@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <x@xff.cz>,
        Samuel Holland <samuel@sholland.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20220129230043.12422-1-samuel@sholland.org>
 <20220129230043.12422-5-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129230043.12422-5-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Samuel,

On Sat, Jan 29, 2022 at 05:00:41PM -0600, Samuel Holland wrote:
> The PinePhone keyboard case contains a battery managed by an integrated
> power bank IC. The power bank IC communicates over I2C, and the keyboard
> MCU firmware provides an interface to read and write its registers.
> Let's use this interface to implement a SMBus adapter, so we can reuse
> the driver for the power bank IC.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  drivers/input/keyboard/pinephone-keyboard.c | 73 +++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/drivers/input/keyboard/pinephone-keyboard.c b/drivers/input/keyboard/pinephone-keyboard.c
> index 8065bc3e101a..7d2e16e588a0 100644
> --- a/drivers/input/keyboard/pinephone-keyboard.c
> +++ b/drivers/input/keyboard/pinephone-keyboard.c
> @@ -3,6 +3,7 @@
>  // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
>  
>  #include <linux/crc8.h>
> +#include <linux/delay.h>
>  #include <linux/i2c.h>
>  #include <linux/input/matrix_keypad.h>
>  #include <linux/interrupt.h>
> @@ -23,6 +24,11 @@
>  #define PPKB_SCAN_DATA			0x08
>  #define PPKB_SYS_CONFIG			0x20
>  #define PPKB_SYS_CONFIG_DISABLE_SCAN		BIT(0)
> +#define PPKB_SYS_SMBUS_COMMAND		0x21
> +#define PPKB_SYS_SMBUS_DATA		0x22
> +#define PPKB_SYS_COMMAND		0x23
> +#define PPKB_SYS_COMMAND_SMBUS_READ		0x91
> +#define PPKB_SYS_COMMAND_SMBUS_WRITE		0xa1
>  
>  #define PPKB_DEFAULT_KEYMAP_ROWS	6
>  #define PPKB_DEFAULT_KEYMAP_COLS	12
> @@ -132,6 +138,7 @@ static const struct matrix_keymap_data ppkb_default_keymap_data = {
>  };
>  
>  struct pinephone_keyboard {
> +	struct i2c_adapter adapter;
>  	struct input_dev *input;
>  	unsigned short *fn_keymap;
>  	u8 crc_table[CRC8_TABLE_SIZE];
> @@ -143,6 +150,57 @@ struct pinephone_keyboard {
>  	u8 buf[];
>  };
>  
> +static int ppkb_adap_smbus_xfer(struct i2c_adapter *adap, u16 addr,
> +				unsigned short flags, char read_write,
> +				u8 command, int size,
> +				union i2c_smbus_data *data)
> +{
> +	struct i2c_client *client = adap->algo_data;
> +	u8 buf[3];
> +	int ret;
> +
> +	buf[0] = command;
> +	buf[1] = data->byte;
> +	buf[2] = read_write == I2C_SMBUS_READ ? PPKB_SYS_COMMAND_SMBUS_READ
> +					      : PPKB_SYS_COMMAND_SMBUS_WRITE;
> +
> +	ret = i2c_smbus_write_i2c_block_data(client, PPKB_SYS_SMBUS_COMMAND,
> +					     sizeof(buf), buf);
> +	if (ret)
> +		return ret;
  
  [1]

> +	/* Read back the command status until it passes or fails. */
> +	do {
> +		usleep_range(300, 500);
> +		ret = i2c_smbus_read_byte_data(client, PPKB_SYS_COMMAND);
> +	} while (ret == buf[2]);
> +	if (ret < 0)
> +		return ret;
> +	/* Commands return 0x00 on success and 0xff on failure. */
> +	if (ret)
> +		return -EIO;
> +
> +	if (read_write == I2C_SMBUS_READ) {
> +		ret = i2c_smbus_read_byte_data(client, PPKB_SYS_SMBUS_DATA);
> +		if (ret < 0)
> +			return ret;

Please use a single read transfer to get both command result and data.
There will be less risk that some userspace app will issue another command
in between command status being read as 0 and data byte being read.

Otherwise if you use this in some read/modify/write operation, you
may write unexpected value to PMIC. I2C register layout is designed
to make this as optimal as possible in a single I2C transaction, so
you only need 3 bytes to start command and 2 bytes to read the result
and data, both in a single xfer. There's very high likelihood the command
will complete in those 300 - 500 us anyway, because the timing is
predictable. If this delay is set right, it's almost guaranteed,
only two xfers will be necessary to run the command and get the result+
status.

And if possible, it would be best if the bus was somehow made busy for
other users, until the whole comand/result sequence completes, to eliminate
the possibility of another command being issued by other bus users
around [1].

Thank you and kind regards,
	o.

> +		data->byte = ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static u32 ppkg_adap_functionality(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_SMBUS_BYTE_DATA;
> +}
> +
> +static const struct i2c_algorithm ppkb_adap_algo = {
> +	.smbus_xfer		= ppkb_adap_smbus_xfer,
> +	.functionality		= ppkg_adap_functionality,
> +};
> +
>  static int ppkb_set_scan(struct i2c_client *client, bool enable)
>  {
>  	struct device *dev = &client->dev;
> @@ -265,6 +323,7 @@ static int ppkb_probe(struct i2c_client *client)
>  	unsigned int map_rows, map_cols;
>  	struct pinephone_keyboard *ppkb;
>  	u8 info[PPKB_MATRIX_SIZE + 1];
> +	struct device_node *i2c_bus;
>  	int ret;
>  
>  	ret = i2c_smbus_read_i2c_block_data(client, 0, sizeof(info), info);
> @@ -312,6 +371,20 @@ static int ppkb_probe(struct i2c_client *client)
>  
>  	i2c_set_clientdata(client, ppkb);
>  
> +	i2c_bus = of_get_child_by_name(dev->of_node, "i2c-bus");
> +	if (i2c_bus) {
> +		ppkb->adapter.owner = THIS_MODULE;
> +		ppkb->adapter.algo = &ppkb_adap_algo;
> +		ppkb->adapter.algo_data = client;
> +		ppkb->adapter.dev.parent = dev;
> +		ppkb->adapter.dev.of_node = i2c_bus;
> +		strscpy(ppkb->adapter.name, DRV_NAME, sizeof(ppkb->adapter.name));
> +
> +		ret = devm_i2c_add_adapter(dev, &ppkb->adapter);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to add I2C adapter\n");
> +	}
> +
>  	crc8_populate_msb(ppkb->crc_table, PPKB_CRC8_POLYNOMIAL);
>  	ppkb->row_shift = get_count_order(map_cols);
>  	ppkb->rows = map_rows;
> -- 
> 2.33.1
> 
