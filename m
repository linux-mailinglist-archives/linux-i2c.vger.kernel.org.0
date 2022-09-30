Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADCE15F0958
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Sep 2022 12:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbiI3KxE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Sep 2022 06:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232648AbiI3KwO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Sep 2022 06:52:14 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C29BC1F898C;
        Fri, 30 Sep 2022 03:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664534000; x=1696070000;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=lWlu70SrI67xJZv1fj23PuGmD/3esok27qujOUmUzx0=;
  b=iy0BY5rhw7uca2xB9RhyM440aCsMix26fcwCVAOpNaNtKgztVIuNUQ+B
   NELokXL3p5eOEvQjI+PfhfKawJbZgHS0mRv1XSntucvXt2pQ8PWPS/vCD
   rfyLnhXPnwchdFO5oSRniZJ43fwho+afeXyhwRd2s5oTJepbQwF8itmBv
   Pk9fBhK5a5pEGTn/FeWaJbV34LWsXAjze+bWZw8bcPaR40A96uBBMB8jF
   853eAh7KB00Ojqhgm4sJodqyXkvvw6C5sRdTu6pDiu0fExZEG/3TkfjEW
   dGDSbmPFZt/MDMWq3+AadfQRFN9NDhktnl5vk/gAtXe6MPzKNCTgTTb7G
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="281871772"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; 
   d="scan'208";a="281871772"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2022 03:30:36 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="622729880"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; 
   d="scan'208";a="622729880"
Received: from hbetts-mobl1.ger.corp.intel.com ([10.249.34.100])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2022 03:30:33 -0700
Date:   Fri, 30 Sep 2022 13:30:28 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Christina Quast <contact@christina-quast.de>
cc:     michael.zaidman@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-i2c@vger.kernel.org,
        linux-serial <linux-serial@vger.kernel.org>
Subject: Re: [PATCH] hid-ft260: Add serial driver
In-Reply-To: <20220928192421.11908-1-contact@christina-quast.de>
Message-ID: <c1751b88-7049-d52c-2abc-8d605e531621@linux.intel.com>
References: <20220928192421.11908-1-contact@christina-quast.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 28 Sep 2022, Christina Quast wrote:

> This commit adds a serial interface /dev/FTx which implements the tty
> serial driver ops, so that it is possible to set the baudrate, send
> and receive data, etc.
> 
> Signed-off-by: Christina Quast <contact@christina-quast.de>
> ---
>  drivers/hid/hid-ft260.c | 731 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 686 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> index 79505c64dbfe..ffce55dbcb45 100644
> --- a/drivers/hid/hid-ft260.c
> +++ b/drivers/hid/hid-ft260.c
> @@ -13,6 +13,16 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/usb.h>
> +#include <linux/serial.h>
> +#include <linux/serial_core.h>
> +#include <linux/kfifo.h>
> +#include <linux/tty_flip.h>
> +#include <linux/minmax.h>
> +#include <asm-generic/unaligned.h>
> +
> +#define UART_COUNT_MAX		4	/* Number of UARTs this driver can handle */
> +#define FIFO_SIZE	256
> +#define TTY_WAKEUP_WATERMARK	(FIFO_SIZE / 2)
>  
>  #ifdef DEBUG
>  static int ft260_debug = 1;
> @@ -29,7 +39,9 @@ MODULE_PARM_DESC(debug, "Toggle FT260 debugging messages");
>  	} while (0)
>  
>  #define FT260_REPORT_MAX_LENGTH (64)
> -#define FT260_I2C_DATA_REPORT_ID(len) (FT260_I2C_REPORT_MIN + (len - 1) / 4)
> +#define FT260_I2C_DATA_REPORT_ID(len) (FT260_I2C_REPORT_MIN + ((len) - 1) / 4)

This is good change, but should be made in a separate patch.

> +#define FT260_UART_DATA_REPORT_ID(len) (FT260_UART_REPORT_MIN + ((len) - 1) / 4)
> +
>  /*
>   * The input report format assigns 62 bytes for the data payload, but ft260
>   * returns 60 and 2 in two separate transactions. To minimize transfer time
> @@ -72,7 +84,8 @@ enum {
>  	FT260_UART_INTERRUPT_STATUS	= 0xB1,
>  	FT260_UART_STATUS		= 0xE0,
>  	FT260_UART_RI_DCD_STATUS	= 0xE1,
> -	FT260_UART_REPORT		= 0xF0,
> +	FT260_UART_REPORT_MIN		= 0xF0,
> +	FT260_UART_REPORT_MAX		= 0xFE,
>  };
>  
>  /* Feature Out */
> @@ -123,7 +136,7 @@ enum {
>  	FT260_FLAG_START_STOP_REPEATED	= 0x07,
>  };
>  
> -#define FT260_SET_REQUEST_VALUE(report_id) ((FT260_FEATURE << 8) | report_id)
> +#define FT260_SET_REQUEST_VALUE(report_id) ((FT260_FEATURE << 8) | (report_id))

Ditto.

>  
>  /* Feature In reports */
>  
> @@ -211,12 +224,127 @@ struct ft260_i2c_read_request_report {
>  	__le16 length;		/* data payload length */
>  } __packed;
>  
> -struct ft260_i2c_input_report {
> -	u8 report;		/* FT260_I2C_REPORT */
> +struct ft260_input_report {

This struct rename should be done in another patch.

> +	u8 report;		/* FT260_I2C_REPORT or FT260_UART_REPORT */
>  	u8 length;		/* data payload length */
> -	u8 data[2];		/* data payload */
> +	u8 data[0];		/* data payload */
>  } __packed;
>  
> +/* UART reports */
> +
> +struct ft260_get_uart_settings_report {
> +	u8 report;		/* FT260_UART_STATUS */
> +	u8 flow_ctrl;		/* 0: OFF, 1: RTS_CTS, 2: DTR_DSR */
> +				/* 3: XON_XOFF, 4: No flow ctrl */
> +	u32 baudrate;		/* little endian, 9600 = 0x2580, 19200 = 0x4B00 */

Use proper type for little-endian (__le32).

> +	u8 data_bit;		/* 7 or 8 */
> +	u8 parity;		/* 0: no parity, 1: odd, 2: even, 3: high, 4: low */
> +	u8 stop_bit;		/* 0: one stop bit, 1: 2 stop bits*/
> +	u8 breaking;		/* 0: no break */
> +} __packed;
> +
> +struct ft260_uart_write_request_report {
> +	u8 report;			/* FT260_UART_REPORT */
> +	u8 length;			/* data payload length */
> +	u8 data[FT260_WR_DATA_MAX];	/* data payload */
> +} __packed;
> +
> +struct ft260_uart_input_report {
> +	u8 report;		/* FT260_UART_REPORT */
> +	u8 length;		/* data payload length */
> +	u8 data[0];		/* data payload */
> +} __packed;
> +
> +struct ft260_uart_get_dcd_ri_status_report {
> +	u8 report;		/* FT260_UART_RI_DCD_STATUS */
> +	u8 status;		/* Bit0: status of UART DCD
> +				 * Bit1: status of UART RI */
> +} __packed;
> +
> +struct ft260_uart_reset_request {
> +	u8 report;		/* FT260_SYSTEM_SETTINGS */
> +	u8 request;		/* FT260_SET_UART_RESET */
> +} __packed;
> +
> +struct ft260_configure_uart_request {
> +	u8 report;		/* FT260_SYSTEM_SETTINGS */
> +	u8 request;		/* FT260_SET_UART_CONFIG */
> +	u8 flow_ctrl;		/* 0: OFF, 1: RTS_CTS, 2: DTR_DSR */
> +				/* 3: XON_XOFF, 4: No flow ctrl */
> +	u32 baudrate;		/* little endian, 9600 = 0x2580, 19200 = 0x4B00 */

__le32.

> +	u8 data_bit;		/* 7 or 8 */
> +	u8 parity;		/* 0: no parity, 1: odd, 2: even, 3: high, 4: low */
> +	u8 stop_bit;		/* 0: one stop bit, 1: 2 stop bits*/

Missing space.

> +	u8 breaking;		/* 0: no break */
> +} __packed;
> +
> +struct ft260_set_uart_baudrate_request {
> +	u8 report;		/* FT260_SYSTEM_SETTINGS */
> +	u8 request;		/* FT260_SET_UART_BAUD_RATE */
> +	u32 baudrate;		/* UART baud rate, which is unsigned int, little-endian.
> +				 * e.g.  9600 = 0x2580 => [0x80, 0x25, 0x00, 0x00]
> +				 *      19200 = 0x4B00 => [0x00, 0x4B, 0x00, 0x00]
> +				 * Supported baud rates range from 1200 to 12M.*/
> +} __packed;
> +
> +struct ft260_set_uart_data_bit_request {
> +	u8 report;		/* FT260_SYSTEM_SETTINGS */
> +	u8 request;		/* FT260_SET_UART_BAUD_RATE */
> +	u8 data_bit;		/* 7 or 8 */
> +} __packed;
> +
> +struct ft260_set_uart_parity_request {
> +	u8 report;		/* FT260_SYSTEM_SETTINGS */
> +	u8 request;		/* FT260_SET_UART_PARITY */
> +	u8 parity;		/* 0: no parity, 1: odd, 2: even, 3: high, 4: low */
> +} __packed;
> +
> +struct ft260_set_uart_stop_bit_request {
> +	u8 report;		/* FT260_SYSTEM_SETTINGS */
> +	u8 request;		/* FT260_SET_UART_STOP_BIT */
> +	u8 stop_bit;		/* 0: one stop bit, 1: 2 stop bits*/

Missing space

> +} __packed;
> +
> +struct ft260_set_uart_breaking_request {
> +	u8 report;		/* FT260_SYSTEM_SETTINGS */
> +	u8 request;		/* FT260_SET_UART_BREAKING */
> +	u8 breaking;		/* 0: no break */
> +} __packed;
> +
> +struct ft260_set_uart_xon_xoff_request {
> +	u8 report;		/* FT260_SYSTEM_SETTINGS */
> +	u8 request;		/* FT260_SET_UART_XON_XOFF */
> +	u8 xon;			/* Character to be used for XON flow control */
> +	u8 xoff;		/* Character to be used for XOFF flow control */
> +} __packed;

Almost all of these structs are never used by the driver.

> +/* UART interface configuration */
> +enum {
> +	FT260_CFG_FLOW_CTRL_OFF		= 0x00,
> +	FT260_CFG_FLOW_CTRL_RTS_CTS	= 0x01,
> +	FT260_CFG_FLOW_CTRL_DTR_DSR	= 0x02,
> +	FT260_CFG_FLOW_CTRL_XON_XOFF	= 0x03,
> +	FT260_CFG_FLOW_CTRL_NONE	= 0x04,
> +
> +	FT260_CFG_DATA_BITS_7 =  -0x07,
> +	FT260_CFG_DATA_BITS_8 =  -0x08,

?? These don't match your comments above.

> +	FT260_CFG_PAR_NO =  -0x00,
> +	FT260_CFG_PAR_ODD =  -0x01,
> +	FT260_CFG_PAR_EVEN =  -0x02,
> +	FT260_CFG_PAR_HIGH =  -0x03,
> +	FT260_CFG_PAR_LOW =  -0x04,

??

> +	FT260_CFG_STOP_ONE_BIT		= 0x00,
> +	FT260_CFG_STOP_TWO_BIT		= 0x02,

Your comments above say 0 and 1??

> +	FT260_CFG_BREAKING_NO		= 0x00,
> +	FT260_CFG_BEAKING_YES		= 0x01,
> +
> +	FT260_CFG_BAUD_MIN		= 1200,
> +	FT260_CFG_BAUD_MAX		= 12000000,
> +};
> +
>  static const struct hid_device_id ft260_devices[] = {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_FUTURE_TECHNOLOGY,
>  			 USB_DEVICE_ID_FT260) },
> @@ -227,6 +355,15 @@ MODULE_DEVICE_TABLE(hid, ft260_devices);
>  struct ft260_device {
>  	struct i2c_adapter adap;
>  	struct hid_device *hdev;

I'd add a newline here to separate what you call "serial part".

> +	int ft260_is_serial;

Why this isn't in the "serial part" but above it??

> +	/* Serial part */
> +	struct tty_port port;
> +	unsigned int index;
> +	struct kfifo xmit_fifo;
> +	spinlock_t write_lock;
> +	struct uart_icount icount;
> +	/* END Serial part */

Please remove this comment.

> +
>  	struct completion wait;
>  	struct mutex lock;
>  	u8 write_buf[FT260_REPORT_MAX_LENGTH];
> @@ -754,13 +891,16 @@ static int ft260_is_interface_enabled(struct hid_device *hdev)
>  	switch (cfg.chip_mode) {
>  	case FT260_MODE_ALL:
>  	case FT260_MODE_BOTH:
> -		if (interface == 1)
> -			hid_info(hdev, "uart interface is not supported\n");
> -		else
> +		if (interface == 1) {
> +			hid_info(hdev, "uart interface 1 now supported\n");

Is this useful enough info?

> +			ret = 2;

If you want to got this route, you should name these return values.

> +		} else {
>  			ret = 1;
> +		}
>  		break;
>  	case FT260_MODE_UART:
> -		hid_info(hdev, "uart interface is not supported\n");
> +		hid_info(hdev, "uart interface 1 now supported\n");

Useful enough?

> +		ret = 2;
>  		break;
>  	case FT260_MODE_I2C:
>  		ret = 1;
> @@ -909,6 +1049,460 @@ static const struct attribute_group ft260_attr_group = {
>  	}
>  };
>  
> +/***
> + * START Serial dev part
> + */
> +static struct ft260_device *ft260_uart_table[UART_COUNT_MAX];
> +static DEFINE_SPINLOCK(ft260_uart_table_lock);
> +
> +static int ft260_uart_add_port(struct ft260_device *port)
> +{
> +	int index, ret = -EBUSY;
> +
> +	spin_lock_init(&port->write_lock);
> +	if (kfifo_alloc(&port->xmit_fifo, FIFO_SIZE, GFP_KERNEL))
> +		return -ENOMEM;
> +
> +	spin_lock(&ft260_uart_table_lock);
> +	for (index = 0; index < UART_COUNT_MAX; index++) {
> +		if (!ft260_uart_table[index]) {
> +			port->index = index;
> +			ft260_uart_table[index] = port;
> +			ret = 0;
> +			break;
> +		}
> +	}
> +	spin_unlock(&ft260_uart_table_lock);
> +
> +	return ret;
> +}
> +
> +static void ft260_uart_port_remove(struct ft260_device *port)
> +{
> +	spin_lock(&ft260_uart_table_lock);
> +	ft260_uart_table[port->index] = NULL;
> +	spin_unlock(&ft260_uart_table_lock);
> +
> +	mutex_lock(&port->port.mutex);
> +	/* tty_hangup is async so is this safe as is ?? */
> +	tty_port_tty_hangup(&port->port, false);
> +	mutex_unlock(&port->port.mutex);
> +
> +	kfifo_free(&port->xmit_fifo);
> +}
> +
> +static struct ft260_device *ft260_uart_port_get(unsigned int index)
> +{
> +	struct ft260_device *port;
> +
> +	if (index >= UART_COUNT_MAX)
> +		return NULL;
> +
> +	spin_lock(&ft260_uart_table_lock);
> +	port = ft260_uart_table[index];
> +	if (port)
> +		tty_port_get(&port->port);
> +	spin_unlock(&ft260_uart_table_lock);
> +
> +	return port;
> +}
> +
> +static void ft260_uart_port_put(struct ft260_device *port)
> +{
> +	tty_port_put(&port->port);
> +}
> +
> +static int ft260_uart_open(struct tty_struct *tty, struct file *filp)
> +{
> +	int ret;
> +	struct ft260_device *port = tty->driver_data;
> +
> +	ft260_dbg("port: %px\n", port);
> +	ret = tty_port_open(&port->port, tty, filp);
> +	ft260_dbg("%s: ret %d\n", __func__, ret);

Remove this kind of debug prints that has added just in an attempt to 
track what what core does.

> +	return ret;
> +}
> +
> +static void ft260_uart_close(struct tty_struct *tty, struct file *filp)
> +{
> +	struct ft260_device *port = tty->driver_data;
> +
> +	tty_port_close(&port->port, tty, filp);
> +}
> +
> +static void ft260_uart_hangup(struct tty_struct *tty)
> +{
> +	struct ft260_device *port = tty->driver_data;
> +
> +	tty_port_hangup(&port->port);
> +}
> +
> +static int ft260_uart_transmit_chars(struct ft260_device *port)
> +{
> +	struct hid_device *hdev = port->hdev;
> +	struct kfifo *xmit = &port->xmit_fifo;
> +	struct tty_struct *tty;
> +	struct ft260_uart_write_request_report *rep;
> +	int len, data_len, ret = 0;
> +
> +	tty = tty_port_tty_get(&port->port);
> +
> +	data_len = kfifo_len(xmit);
> +	if (!tty || !data_len) {
> +		ret = -EINVAL;
> +		goto tty_out;
> +	}
> +
> +	rep = (struct ft260_uart_write_request_report *)port->write_buf;
> +
> +	do {
> +		len = min(data_len, FT260_WR_DATA_MAX);
> +
> +		rep->report = FT260_UART_DATA_REPORT_ID(len);
> +		rep->length = len;
> +
> +		ft260_dbg("kfifo len before: %d\n", kfifo_len(xmit));
> +		len = kfifo_out_locked(xmit, rep->data, len, &port->write_lock);
> +
> +		ft260_dbg("rep %#02x len %d d[0] %#02x\n",
> +			  rep->report, len, rep->data[0]);
> +		ft260_dbg("kfifo len: %d\n", kfifo_len(xmit));
> +
> +		ret = ft260_hid_output_report(hdev, (u8 *)rep, len + 2);

This is trying to do sizeof(rep) - FT260_WR_DATA_MAX with that literal 2?

> +		if (ret < 0) {
> +			hid_err(hdev, "%s: failed to start transfer, ret %d\n",
> +				__func__, ret);

Is __func__ really necessary? This is user visible error, no?

> +			goto tty_out;
> +		}
> +
> +		data_len -= len;
> +		port->icount.tx += len;
> +	} while (data_len > 0);
> +
> +	len = kfifo_len(xmit);
> +	if ((FIFO_SIZE - len) > TTY_WAKEUP_WATERMARK)
> +		tty_wakeup(tty);
> +
> +	ret = 0;
> +
> +tty_out:
> +	tty_kref_put(tty);
> +	return ret;
> +}
> +
> +static int ft260_uart_receive_chars(struct ft260_device *port,
> +				    u8 *data, u8 length)
> +{
> +	struct hid_device *hdev = port->hdev;
> +	u8 ch, flag;
> +	int i = 0;
> +
> +	if (length > FT260_RD_DATA_MAX) {
> +		hid_err(hdev, "Received too much data (%d)\n", length);
> +		return -EBADR;
> +	}

I'd move this check to ft260_raw_event() because it feels more to be 
part of the report protocol rejecting something invalid more than UART 
receiving characters.

> +
> +	do {
> +		ch = data[i];
> +		flag = TTY_NORMAL;
> +		port->icount.rx++;
> +
> +		tty_insert_flip_char(&port->port, ch, flag);
> +		i++;
> +		ft260_dbg("Received %x\n", ch);
> +	} while ((i < length));

tty_insert_flip_string() ?

> +
> +	tty_flip_buffer_push(&port->port);
> +	return 1;

It feels somewhat odd to return 1 here. I know you're doing it to cascade 
the value in ft260_raw_event() but still.

> +}
> +
> +static int ft260_uart_write(struct tty_struct *tty, const unsigned char *buf,
> +			    int count)
> +{
> +	struct ft260_device *port = tty->driver_data;
> +	struct hid_device *hdev = port->hdev;
> +	int ret;
> +
> +	ret = kfifo_in_locked(&port->xmit_fifo, buf, count, &port->write_lock);
> +	if (ft260_uart_transmit_chars(port) != kfifo_len(&port->xmit_fifo)) {
> +		hid_err(hdev, "Failed sending all kfifo data bytes\n");
> +	}

Unnecessary braces.

> +
> +	return ret;
> +}
> +
> +static unsigned int ft260_uart_write_room(struct tty_struct *tty)
> +{
> +	struct ft260_device *port = tty->driver_data;
> +
> +	return FIFO_SIZE - kfifo_len(&port->xmit_fifo);
> +}
> +
> +static unsigned int ft260_uart_chars_in_buffer(struct tty_struct *tty)
> +{
> +	struct ft260_device *port = tty->driver_data;
> +
> +	return kfifo_len(&port->xmit_fifo);
> +}
> +
> +static int ft260_uart_change_speed(struct ft260_device *port,
> +				   struct ktermios *termios,
> +				    struct ktermios *old)
> +{
> +	struct hid_device *hdev = port->hdev;
> +	unsigned int baud;
> +	struct ft260_configure_uart_request req = {0};

Are you perhaps trying to replace memset with that {0}?

> +	int ret;
> +
> +

Extra newline.

> +	req.report = FT260_SYSTEM_SETTINGS;
> +	req.request = FT260_SET_UART_CONFIG;
> +
> +	switch (termios->c_cflag & CSIZE) {
> +	case CS7:
> +		req.data_bit	= 0x07;

Didn't you have a name for these literals?

> +		break;
> +	case CS5:
> +	case CS6:
> +		hid_err(hdev, "Invalid data bit size %d, setting to default (8 bit)\n",
> +			(termios->c_cflag & CSIZE) ? 5 : 6);

This check depends on some magic (about CS5) and seems to get it wrong 
way around. In any case, it might not be that useful to tell what the 
wrong value was.

> +		req.data_bit	= 0x08;

You must fix termios too, otherwise it will contain inconsistent CSIZE.

Don't use literal.

> +		break;
> +	default:
> +	case CS8:
> +		req.data_bit	= 0x08;

Literal.

> +		break;
> +	}
> +
> +	req.stop_bit = (termios->c_cflag & CSTOPB) ?
> +		FT260_CFG_STOP_TWO_BIT : FT260_CFG_STOP_ONE_BIT;
> +
> +	if (termios->c_cflag & PARENB) {
> +		req.parity = (termios->c_cflag & PARODD) ?
> +			FT260_CFG_PAR_ODD : FT260_CFG_PAR_EVEN;
> +	} else {
> +		req.parity = FT260_CFG_PAR_NO;
> +	}
> +
> +	baud = tty_termios_baud_rate(termios);
> +	if (baud == 0 || baud < FT260_CFG_BAUD_MIN || baud > FT260_CFG_BAUD_MAX) {
> +		hid_err(hdev, "Invalid baud rate %d\n", baud);
> +		baud = 9600;
> +	}

You need to call tty_encode_baud_rate() to set the baud rate back to 
termios (if it's no longer the same).

> +	put_unaligned_le32(baud, &req.baudrate); // baudrate

Useless comment & would be wrong style for that comment too.

> +	if (termios->c_cflag & CRTSCTS)
> +		req.flow_ctrl = FT260_CFG_FLOW_CTRL_RTS_CTS;
> +	else
> +		req.flow_ctrl = FT260_CFG_FLOW_CTRL_OFF;
> +
> +	ft260_dbg("Configured termios: flow control: %d, baudrate: %d, ",
> +		  req.flow_ctrl, req.baudrate);

You're reading unaligned & don't deal endianess properly.

> +	ft260_dbg("data_bit: %d, parity: %d, stop_bit: %d, breaking: %d\n",
> +		  req.data_bit, req.parity,
> +			req.stop_bit, req.breaking);

Misaligned indent.

> +	/* Send Feature Report to Configure FT260 as UART 9600-8-N-1 */

Why is this comment here, it seems entirely unrelated to the code 
following it?

> +	req.flow_ctrl	= 0x04; // No flow control
> +	req.breaking	= 0x00; // Breaking char (none)

Literals. Drop useless comments.

> +	ret = ft260_hid_feature_report_set(hdev, (u8 *)&req, sizeof(req));
> +	if (ret < 0) {
> +		hid_err(hdev, "ft260_hid_feature_report_set failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static void ft260_uart_set_termios(struct tty_struct *tty,
> +				   struct ktermios *old_termios)
> +{
> +	struct ft260_device *port = tty->driver_data;
> +
> +

Extra newline.

> +	ft260_uart_change_speed(port, &tty->termios, NULL);
> +}
> +
> +static int ft260_uart_install(struct tty_driver *driver, struct tty_struct *tty)
> +{
> +	int idx = tty->index;
> +	struct ft260_device *port = ft260_uart_port_get(idx);
> +	int ret = tty_standard_install(driver, tty);
> +
> +	if (ret == 0)
> +		/* This is the ref ft260_uart_port get provided */
> +		tty->driver_data = port;
> +	else
> +		ft260_uart_port_put(port);
> +
> +	return ret;
> +}
> +
> +static void ft260_uart_cleanup(struct tty_struct *tty)
> +{
> +	struct ft260_device *port = tty->driver_data;
> +
> +	tty->driver_data = NULL;	/* Bug trap */
> +	ft260_uart_port_put(port);
> +}
> +
> +static int ft260_uart_proc_show(struct seq_file *m, void *v)
> +{
> +	return -EINVAL;
> +}
> +
> +static const struct tty_operations ft260_uart_ops = {
> +	.open			= ft260_uart_open,
> +	.close			= ft260_uart_close,
> +	.write			= ft260_uart_write,
> +	.write_room		= ft260_uart_write_room,
> +	.chars_in_buffer	= ft260_uart_chars_in_buffer,
> +	.set_termios		= ft260_uart_set_termios,
> +	.hangup			= ft260_uart_hangup,
> +	.install		= ft260_uart_install,
> +	.cleanup		= ft260_uart_cleanup,
> +	.proc_show		= ft260_uart_proc_show,
> +};
> +
> +static void uart_dtr_rts(struct tty_port *tport, int onoff)
> +{
> +}
> +
> +static int uart_carrier_raised(struct tty_port *tport)
> +{
> +	return -EINVAL;
> +}
> +
> +static void ft260_uart_shutdown(struct tty_port *tport)
> +{
> +}
> +
> +static int ft260_uart_activate(struct tty_port *tport, struct tty_struct *tty)
> +{
> +	struct ft260_device *port =
> +		container_of(tport, struct ft260_device, port);
> +
> +	/*
> +	 * Set the TTY IO error marker - we will only clear this
> +	 * once we have successfully opened the port.
> +	 */
> +	set_bit(TTY_IO_ERROR, &tty->flags);
> +
> +	kfifo_reset(&port->xmit_fifo);
> +
> +	ft260_uart_change_speed(port, &tty->termios, NULL);
> +
> +	clear_bit(TTY_IO_ERROR, &tty->flags);
> +
> +	return 0;
> +}
> +
> +static void ft260_uart_port_destroy(struct tty_port *tport)
> +{
> +}
> +
> +static const struct tty_port_operations ft260_uart_port_ops = {
> +	.dtr_rts = uart_dtr_rts,
> +	.carrier_raised = uart_carrier_raised,
> +	.shutdown = ft260_uart_shutdown,
> +	.activate = ft260_uart_activate,
> +	.destruct = ft260_uart_port_destroy,
> +};
> +
> +static struct tty_driver *ft260_tty_driver;
> +/***
> + * END Serial dev part
> + */
> +
> +static int ft260_i2c_probe(struct hid_device *hdev, struct ft260_device *dev)
> +{
> +	int ret;
> +
> +	ft260_dbg("%s i2c\n", __func__);
> +	dev->hdev = hdev;
> +	dev->adap.owner = THIS_MODULE;
> +	dev->adap.class = I2C_CLASS_HWMON;
> +	dev->adap.algo = &ft260_i2c_algo;
> +	dev->adap.quirks = &ft260_i2c_quirks;
> +	dev->adap.dev.parent = &hdev->dev;
> +	snprintf(dev->adap.name, sizeof(dev->adap.name),
> +		 "FT260 usb-i2c bridge on hidraw%d",
> +		 ((struct hidraw *)hdev->hidraw)->minor);
> +
> +	ret = ft260_xfer_status(dev);
> +	if (ret)
> +		ft260_i2c_reset(hdev);
> +
> +	i2c_set_adapdata(&dev->adap, dev);
> +	ret = i2c_add_adapter(&dev->adap);
> +	if (ret) {
> +		hid_err(hdev, "failed to add i2c adapter\n");
> +		return ret;
> +	}
> +
> +	ret = sysfs_create_group(&hdev->dev.kobj, &ft260_attr_group);
> +	if (ret < 0) {
> +		hid_err(hdev, "failed to create sysfs attrs\n");
> +		goto err_i2c_free;
> +	}
> +err_i2c_free:
> +	i2c_del_adapter(&dev->adap);
> +	return ret;
> +}
> +
> +static int ft260_uart_probe(struct hid_device *hdev, struct ft260_device *dev)
> +{
> +	struct ft260_configure_uart_request req;
> +	int ret;
> +
> +	ft260_dbg("%s uart\n", __func__);
> +	tty_port_init(&dev->port);
> +	dev->port.ops = &ft260_uart_port_ops;
> +
> +	ret = ft260_uart_add_port(dev);
> +	if (ret) {
> +		hid_err(hdev, "failed to add port\n");
> +		goto err_uart_add_port;
> +	} else {

Useless else.

> +		struct device *devt;
> +		hid_err(hdev, "tty driver: %px, ports: %px, hdev->dev: %px\n",
> +			ft260_tty_driver, ft260_tty_driver ?
> +					ft260_tty_driver->ports : NULL,
> +					&hdev->dev);

Is this an error???

> +		devt = tty_port_register_device_attr(&dev->port,
> +						     ft260_tty_driver,
> +						     dev->index, &hdev->dev,
> +						     dev, NULL);
> +		if (IS_ERR(devt)) {
> +			hid_err(hdev, "failed to register tty port\n");
> +			ft260_uart_port_remove(dev);

Move this to rollback path down below.

> +			ret = PTR_ERR(devt);
> +			goto err_register_tty;
> +		}
> +	}
> +
> +	/* Send Feature Report to Configure FT260 as UART 9600-8-N-1 */
> +	req.report		= FT260_SYSTEM_SETTINGS;
> +	req.flow_ctrl	= 0x04; // No flow control
> +	req.request	= FT260_SET_UART_CONFIG;

I'd put these to the same order as the fields in the struct.

> +	put_unaligned_le32(9600, &req.baudrate); // baudrate
> +	req.data_bit	= 0x08; // 8 data bits
> +	req.parity		= 0x00; // No parity bit
> +	req.stop_bit	= 0x00; // One stop bit
> +	req.breaking	= 0x00; // Breaking char (none)

Literal. The comments are just wasting after replacing the literals.

> +
> +	ret = ft260_hid_feature_report_set(hdev, (u8 *)&req, sizeof(req));
> +	if (ret < 0) {
> +		hid_err(hdev, "ft260_hid_feature_report_set failed: %d\n", ret);
> +		return ret;
> +	}
> +err_register_tty:
> +err_uart_add_port:
> +	kfree(dev);
> +	return ret;
> +}
> +
>  static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  {
>  	struct ft260_device *dev;
> @@ -952,44 +1546,30 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  		 version.chip_code[2], version.chip_code[3]);
>  
>  	ret = ft260_is_interface_enabled(hdev);
> -	if (ret <= 0)
> +	if (ret <= 0) {
>  		goto err_hid_close;
> +	} else if (ret == 2) {

Useless else.

> +		ft260_dbg("Attaching interface 1\n");
> +		dev->ft260_is_serial = 1;

Wouldn't these fit better into ft260_is_interface_enabled().

> +	}
>  
>  	hid_set_drvdata(hdev, dev);
>  	dev->hdev = hdev;
> -	dev->adap.owner = THIS_MODULE;
> -	dev->adap.class = I2C_CLASS_HWMON;
> -	dev->adap.algo = &ft260_i2c_algo;
> -	dev->adap.quirks = &ft260_i2c_quirks;
> -	dev->adap.dev.parent = &hdev->dev;
> -	snprintf(dev->adap.name, sizeof(dev->adap.name),
> -		 "FT260 usb-i2c bridge on hidraw%d",
> -		 ((struct hidraw *)hdev->hidraw)->minor);
> -
>  	mutex_init(&dev->lock);
>  	init_completion(&dev->wait);
>  
> -	ret = ft260_xfer_status(dev);
> -	if (ret)
> -		ft260_i2c_reset(hdev);
> -
> -	i2c_set_adapdata(&dev->adap, dev);
> -	ret = i2c_add_adapter(&dev->adap);
> -	if (ret) {
> -		hid_err(hdev, "failed to add i2c adapter\n");
> -		goto err_hid_close;
> -	}
> -
> -	ret = sysfs_create_group(&hdev->dev.kobj, &ft260_attr_group);
> -	if (ret < 0) {
> -		hid_err(hdev, "failed to create sysfs attrs\n");
> -		goto err_i2c_free;
> +	if (!dev->ft260_is_serial) {
> +		ret = ft260_i2c_probe(hdev, dev);
> +		if(ret)

Missing space.

> +			goto err_hid_close;
> +	} else {
> +		ret = ft260_uart_probe(hdev, dev);
> +		if(ret)

Ditto.

> +			goto err_hid_close;
>  	}
>  
>  	return 0;
>  
> -err_i2c_free:
> -	i2c_del_adapter(&dev->adap);
>  err_hid_close:
>  	hid_hw_close(hdev);
>  err_hid_stop:
> @@ -1004,8 +1584,13 @@ static void ft260_remove(struct hid_device *hdev)
>  	if (!dev)
>  		return;
>  
> -	sysfs_remove_group(&hdev->dev.kobj, &ft260_attr_group);
> -	i2c_del_adapter(&dev->adap);
> +	if (dev->ft260_is_serial) {
> +		tty_unregister_device(ft260_tty_driver, dev->index);
> +		ft260_uart_port_remove(dev);
> +	} else {
> +		sysfs_remove_group(&hdev->dev.kobj, &ft260_attr_group);
> +		i2c_del_adapter(&dev->adap);
> +	}
>  
>  	hid_hw_close(hdev);
>  	hid_hw_stop(hdev);
> @@ -1015,8 +1600,10 @@ static int ft260_raw_event(struct hid_device *hdev, struct hid_report *report,
>  			   u8 *data, int size)
>  {
>  	struct ft260_device *dev = hid_get_drvdata(hdev);
> -	struct ft260_i2c_input_report *xfer = (void *)data;
> +	struct ft260_input_report *xfer = (void *)data;
> +	int ret = 1;
>  
> +	ft260_dbg("%s %x\n", __func__, xfer->report);
>  	if (xfer->report >= FT260_I2C_REPORT_MIN &&
>  	    xfer->report <= FT260_I2C_REPORT_MAX) {
>  		ft260_dbg("i2c resp: rep %#02x len %d\n", xfer->report,
> @@ -1028,12 +1615,16 @@ static int ft260_raw_event(struct hid_device *hdev, struct hid_report *report,
>  
>  		if (dev->read_idx == dev->read_len)
>  			complete(&dev->wait);
> -
> +	} else if (xfer->report >= FT260_UART_REPORT_MIN &&
> +		   xfer->report <= FT260_UART_REPORT_MAX) {
> +		ft260_dbg("uart resp: rep %#02x len %d d[0] %x\n", xfer->report,
> +			  xfer->length, xfer->data[0]);
> +		ret = ft260_uart_receive_chars(dev, xfer->data, xfer->length);
>  	} else {
>  		hid_err(hdev, "unknown report: %#02x\n", xfer->report);
> -		return 0;
> +		ret = 0;
>  	}
> -	return 1;
> +	return ret;

I'd do the ret conversion in a preceeding patch (if it's needed at all).

>  }
>  
>  static struct hid_driver ft260_driver = {
> @@ -1044,7 +1635,57 @@ static struct hid_driver ft260_driver = {
>  	.raw_event	= ft260_raw_event,
>  };
>  
> -module_hid_driver(ft260_driver);
> -MODULE_DESCRIPTION("FTDI FT260 USB HID to I2C host bridge");
> +static int __init ft260_driver_init(void)
> +{
> +	int ret;
> +
> +	ft260_tty_driver = tty_alloc_driver(UART_COUNT_MAX,
> +					    TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV);
> +
> +	ft260_tty_driver->driver_name = "ft260_ser";
> +	ft260_tty_driver->name = "ttyFT";
> +	ft260_tty_driver->major = 0;
> +	ft260_tty_driver->minor_start = 0;
> +	ft260_tty_driver->type = TTY_DRIVER_TYPE_SERIAL;
> +	ft260_tty_driver->subtype = SERIAL_TYPE_NORMAL;
> +	ft260_tty_driver->init_termios = tty_std_termios;
> +	ft260_tty_driver->init_termios.c_cflag = B9600 | CS8 | CREAD | HUPCL | CLOCAL;
> +	ft260_tty_driver->init_termios.c_ispeed = 9600;
> +	ft260_tty_driver->init_termios.c_ospeed = 9600;
> +	tty_set_operations(ft260_tty_driver, &ft260_uart_ops);
> +
> +	ret = tty_register_driver(ft260_tty_driver);
> +	if (ret) {
> +		pr_err("tty_register_driver failed: %d\n", ret);
> +		goto err_reg_driver;
> +	}
> +
> +	ret = hid_register_driver(&(ft260_driver));
> +	if (ret) {
> +		pr_err("hid_register_driver failed: %d\n", ret);
> +		goto err_reg_hid;
> +	}
> +
> +	return 0;
> +
> +err_reg_hid:
> +	tty_unregister_driver(ft260_tty_driver);
> +err_reg_driver:
> +	tty_driver_kref_put(ft260_tty_driver);
> +
> +	return ret;
> +}
> +
> +static void __exit ft260_driver_exit(void)
> +{
> +	hid_unregister_driver(&(ft260_driver));
> +	tty_unregister_driver(ft260_tty_driver);
> +	tty_driver_kref_put(ft260_tty_driver);
> +}
> +
> +module_init(ft260_driver_init);
> +module_exit(ft260_driver_exit);
> +
> +MODULE_DESCRIPTION("FTDI FT260 USB HID to I2C host bridge and TTY driver");
>  MODULE_AUTHOR("Michael Zaidman <michael.zaidman@gmail.com>");
>  MODULE_LICENSE("GPL v2");

"GPL" is enough (process/license-rules.rst).

-- 
 i.

