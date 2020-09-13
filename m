Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4568268082
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Sep 2020 19:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbgIMRRu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 13 Sep 2020 13:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbgIMRRs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 13 Sep 2020 13:17:48 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1B7C06174A;
        Sun, 13 Sep 2020 10:17:47 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id jw11so4172155pjb.0;
        Sun, 13 Sep 2020 10:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CD+rj96ISkGxvzLNQ3PLcvQIi9uSSq1sV+SXI9K2/i0=;
        b=XUFjsHL6RgupQxtg+XEdjUCw5yy/Oaxg/AQp0lcNUsbuV93ri08NECvYrR6w8hTYrq
         Oq9eJIK4YhHJ22jMYOVdb5cq30eTjHZGl2svHc02cIToNNVUpQzoxms5XfhwYM5Eh0rk
         0x+i1Q9Mkg56RC7cPECWj7TamD6GKYicFhDCTClukVLLT/TWFz5apF97OeJK4ECTf8D9
         EFsYYneEx1AdXvgTWs90Gsf4T9ldK9BspF7A2Y4CLjIkwxVGarmfIM+D+lTZfVi30a10
         ER0BlM+tXmEZ+qJE43WCo+NNnCN9w1eARwlZ5deKASCvw1rK22Ua9u9Sb/Pd3v00TlQ2
         JTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CD+rj96ISkGxvzLNQ3PLcvQIi9uSSq1sV+SXI9K2/i0=;
        b=LJHrSJUqJtzUr2zevfa+ZXTP0RGiVuer0qqWGkYJKdWxq93Que3gKYWRSyXViBI84s
         +bdUWLHaP7cLbmWs7FWbZuo4/ic1MRc26Thfm28u0gg1g3mpcUEEKnN10lug8NK2kyS2
         ww71h+r5rIbnItDHGNh2P42n2P3UbjshSHV20UXgQY0fAGB+wUMNzqD0+VRYUHXAoj5Y
         I4QgpKVUfTrTGMLHg7vgzb1EhKpI+gGlSNGAE1lgD9w3QyE1V1LTuezJRjv6DPjAciKh
         N7M4cirR32/hlJxsFoivOaaUL+Vl57Oh7t9ymX1wZK8k08kkX2BwDXKJ1tOwF/KVij7+
         cJoQ==
X-Gm-Message-State: AOAM530U2K2V9piKG0f5Fm6VPr9x5CayEC4FizFcMLcoXtJc/YHvCoa2
        xKtQIZyftVsW9NLrzhdHPpo=
X-Google-Smtp-Source: ABdhPJzX4PaPpmtgFjp1c1G8m5ToMIdgqlwR39sBQrZLcqeieNRaK5AlKXXJvZBtgXma2RahjB2ZcQ==
X-Received: by 2002:a17:90a:de81:: with SMTP id n1mr10698917pjv.92.1600017466236;
        Sun, 13 Sep 2020 10:17:46 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id q23sm7927913pfg.143.2020.09.13.10.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 10:17:45 -0700 (PDT)
Date:   Sun, 13 Sep 2020 10:17:43 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au,
        andrew@aj.id.au, benh@kernel.crashing.org,
        brendanhiggins@google.com, wsa@kernel.org, rentao.bupt@gmail.com,
        ryan_chen@aspeedtech.com
Subject: Re: [PATCH v3 2/5] input: misc: Add IBM Operation Panel driver
Message-ID: <20200913171743.GH1665100@dtor-ws>
References: <20200909203059.23427-1-eajames@linux.ibm.com>
 <20200909203059.23427-3-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909203059.23427-3-eajames@linux.ibm.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Eddie,

On Wed, Sep 09, 2020 at 03:30:56PM -0500, Eddie James wrote:
> Add a driver to get the button events from the panel and provide
> them to userspace with the input subsystem. The panel is
> connected with I2C and controls the bus, so the driver registers
> as an I2C slave device.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  MAINTAINERS                    |   1 +
>  drivers/input/misc/Kconfig     |  18 ++++
>  drivers/input/misc/Makefile    |   1 +
>  drivers/input/misc/ibm-panel.c | 189 +++++++++++++++++++++++++++++++++
>  4 files changed, 209 insertions(+)
>  create mode 100644 drivers/input/misc/ibm-panel.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 28408d29d873..5429da957a1a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8351,6 +8351,7 @@ M:	Eddie James <eajames@linux.ibm.com>
>  L:	linux-input@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/input/ibm,op-panel.yaml
> +F:	drivers/input/misc/ibm-panel.c
>  
>  IBM Power 842 compression accelerator
>  M:	Haren Myneni <haren@us.ibm.com>
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index 362e8a01980c..65ab1ce7b259 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -708,6 +708,24 @@ config INPUT_ADXL34X_SPI
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called adxl34x-spi.
>  
> +config INPUT_IBM_PANEL
> +	tristate "IBM Operation Panel driver"
> +	depends on I2C_SLAVE || COMPILE_TEST
> +	help
> +	  Say Y here if you have an IBM Operation Panel connected to your system
> +	  over I2C. The panel is typically connected only to a system's service
> +	  processor (BMC).
> +
> +	  If unsure, say N.
> +
> +	  The Operation Panel is a controller with some buttons and an LCD
> +	  display that allows someone with physical access to the system to
> +	  perform various administrative tasks. This driver only supports the part
> +	  of the controller that sends commands to the system.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called ibm-panel.
> +
>  config INPUT_IMS_PCU
>  	tristate "IMS Passenger Control Unit driver"
>  	depends on USB
> diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
> index a48e5f2d859d..7e9edf0a142b 100644
> --- a/drivers/input/misc/Makefile
> +++ b/drivers/input/misc/Makefile
> @@ -38,6 +38,7 @@ obj-$(CONFIG_INPUT_GPIO_DECODER)	+= gpio_decoder.o
>  obj-$(CONFIG_INPUT_GPIO_VIBRA)		+= gpio-vibra.o
>  obj-$(CONFIG_INPUT_HISI_POWERKEY)	+= hisi_powerkey.o
>  obj-$(CONFIG_HP_SDC_RTC)		+= hp_sdc_rtc.o
> +obj-$(CONFIG_INPUT_IBM_PANEL)		+= ibm-panel.o
>  obj-$(CONFIG_INPUT_IMS_PCU)		+= ims-pcu.o
>  obj-$(CONFIG_INPUT_IQS269A)		+= iqs269a.o
>  obj-$(CONFIG_INPUT_IXP4XX_BEEPER)	+= ixp4xx-beeper.o
> diff --git a/drivers/input/misc/ibm-panel.c b/drivers/input/misc/ibm-panel.c
> new file mode 100644
> index 000000000000..7329f4641636
> --- /dev/null
> +++ b/drivers/input/misc/ibm-panel.c
> @@ -0,0 +1,189 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) IBM Corporation 2020
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/input.h>
> +#include <linux/kernel.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/spinlock.h>
> +
> +#define DEVICE_NAME	"ibm-panel"
> +
> +struct ibm_panel {
> +	u8 idx;
> +	u8 command[11];
> +	spinlock_t lock;	/* protects writes to idx and command */
> +	struct input_dev *input;
> +};
> +
> +static void ibm_panel_process_command(struct ibm_panel *panel)
> +{
> +	u8 i;
> +	u8 chksum;
> +	u16 sum = 0;
> +	int pressed;
> +	int released;
> +
> +	if (panel->command[0] != 0xff && panel->command[1] != 0xf0) {
> +		dev_dbg(&panel->input->dev, "command invalid\n");
> +		return;
> +	}
> +
> +	for (i = 0; i < sizeof(panel->command) - 1; ++i) {
> +		sum += panel->command[i];
> +		if (sum & 0xff00) {
> +			sum &= 0xff;
> +			sum++;
> +		}
> +	}
> +
> +	chksum = sum & 0xff;
> +	chksum = ~chksum;
> +	chksum++;

Maybe move checksum calculation into a separate function?

> +
> +	if (chksum != panel->command[sizeof(panel->command) - 1]) {
> +		dev_dbg(&panel->input->dev, "command failed checksum\n");
> +		return;
> +	}
> +
> +	released = panel->command[2] & 0x80;
> +	pressed = released ? 0 : 1;

	pressed = !(panel->command[2] & BIT(7));

or "pressed = !released;" if you want to keep both.

> +
> +	switch (panel->command[2] & 0xf) {
> +	case 0:
> +		input_report_key(panel->input, BTN_NORTH, pressed);
> +		break;
> +	case 1:
> +		input_report_key(panel->input, BTN_SOUTH, pressed);
> +		break;
> +	case 2:
> +		input_report_key(panel->input, BTN_SELECT, pressed);
> +		break;
> +	default:
> +		dev_dbg(&panel->input->dev, "unknown command %u\n",
> +			panel->command[2] & 0xf);
> +		return;
> +	}
> +
> +	input_sync(panel->input);
> +}
> +
> +static int ibm_panel_i2c_slave_cb(struct i2c_client *client,
> +				  enum i2c_slave_event event, u8 *val)
> +{
> +	unsigned long flags;
> +	struct ibm_panel *panel = i2c_get_clientdata(client);
> +
> +	dev_dbg(&panel->input->dev, "event: %u data: %02x\n", event, *val);
> +
> +	spin_lock_irqsave(&panel->lock, flags);
> +
> +	switch (event) {
> +	case I2C_SLAVE_STOP:
> +		if (panel->idx == sizeof(panel->command))
> +			ibm_panel_process_command(panel);
> +		else
> +			dev_dbg(&panel->input->dev,
> +				"command incorrect size %u\n", panel->idx);
> +		fallthrough;
> +	case I2C_SLAVE_WRITE_REQUESTED:
> +		panel->idx = 0;
> +		break;
> +	case I2C_SLAVE_WRITE_RECEIVED:
> +		if (panel->idx < sizeof(panel->command))
> +			panel->command[panel->idx++] = *val;
> +		else
> +			/*
> +			 * The command is too long and therefore invalid, so set the index
> +			 * to it's largest possible value. When a STOP is finally received,
> +			 * the command will be rejected upon processing.
> +			 */
> +			panel->idx = U8_MAX;
> +		break;
> +	case I2C_SLAVE_READ_REQUESTED:
> +	case I2C_SLAVE_READ_PROCESSED:
> +		*val = 0xff;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	spin_unlock_irqrestore(&panel->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int ibm_panel_probe(struct i2c_client *client,
> +			   const struct i2c_device_id *id)
> +{
> +	int rc;
> +	struct ibm_panel *panel = devm_kzalloc(&client->dev, sizeof(*panel),
> +					       GFP_KERNEL);
> +
> +	if (!panel)
> +		return -ENOMEM;
> +
> +	panel->input = devm_input_allocate_device(&client->dev);
> +	if (!panel->input)
> +		return -ENOMEM;
> +
> +	panel->input->name = client->name;
> +	panel->input->id.bustype = BUS_I2C;
> +	input_set_capability(panel->input, EV_KEY, BTN_NORTH);
> +	input_set_capability(panel->input, EV_KEY, BTN_SOUTH);
> +	input_set_capability(panel->input, EV_KEY, BTN_SELECT);

North/South/Select are gamepad buttons, not general purpose ones. I
think you should not hard-code keymap in the driver, but rather use
device property to specify keymap that makes sense for the particular
board's application.

> +
> +	rc = input_register_device(panel->input);
> +	if (rc) {
> +		dev_err(&client->dev, "Failed to register input device: %d\n",
> +			rc);
> +		return rc;
> +	}
> +
> +	spin_lock_init(&panel->lock);
> +
> +	i2c_set_clientdata(client, panel);
> +	rc = i2c_slave_register(client, ibm_panel_i2c_slave_cb);
> +	if (rc) {
> +		input_unregister_device(panel->input);

You are using devm, there is no need to manually unregister input
device.

> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ibm_panel_remove(struct i2c_client *client)
> +{
> +	int rc;
> +	struct ibm_panel *panel = i2c_get_clientdata(client);
> +
> +	rc = i2c_slave_unregister(client);
> +
> +	input_unregister_device(panel->input);

This is not needed.

> +
> +	return rc;

The remove operation is not reversible, so there is no need to return
error here. Just log en error if i2c_slave_unregister() fails if you
want, and return 0.

> +}
> +
> +static const struct of_device_id ibm_panel_match[] = {
> +	{ .compatible = "ibm,op-panel" },
> +	{ }
> +};
> +
> +static struct i2c_driver ibm_panel_driver = {
> +	.driver = {
> +		.name = DEVICE_NAME,
> +		.of_match_table = ibm_panel_match,
> +	},
> +	.probe = ibm_panel_probe,
> +	.remove = ibm_panel_remove,
> +};
> +module_i2c_driver(ibm_panel_driver);
> +
> +MODULE_AUTHOR("Eddie James <eajames@linux.ibm.com>");
> +MODULE_DESCRIPTION("IBM Operation Panel Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.26.2
> 

Thanks.

-- 
Dmitry
