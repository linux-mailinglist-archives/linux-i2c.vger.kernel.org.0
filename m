Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F34043BD1D
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 21:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389093AbfFJTv1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 15:51:27 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45791 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388901AbfFJTv0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 15:51:26 -0400
Received: by mail-oi1-f195.google.com with SMTP id m206so7140711oib.12;
        Mon, 10 Jun 2019 12:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J6LBFNOrIEUyYCRNeb84q1AMy5Zhkdd32zvz/HCLO34=;
        b=QA04IW4ycziv/OnFtnzjMUf3ds5wPMaLziJ/tP3F6tvkqD2PPUTSwQq0XevY0rVkdq
         2CAXhrS3iyLoeciyBMudDZ6/37j9ylpyqmN78Pxi5GYUisDUb/p0vWIz30SMKCqyAzK7
         jgcj+mrvd9S7Fq7Mt/Qly9qxoLeVdHr/qxmhr2cADw7aLbs7uk8xGVIJJ4HQ1Ze5YWKy
         QUsHHJjUpix70MbTU0kX9FX7CLGKY+vxiL77PNchPZdDz5SEhw/wjekQcyT5DDCSwS9j
         fGMt/RAZvRherQZVJyz7MFFgZbFTWLFFjCtO0xtSs40/AOKj+iBJZu7cHB9bhU+jZ6He
         SlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to
         :user-agent;
        bh=J6LBFNOrIEUyYCRNeb84q1AMy5Zhkdd32zvz/HCLO34=;
        b=S+cKMPDuPFtvejHpf4PzjioSiD06rpHVrwOXAVxYRBFNPYzbSVLmXjDMLyh0COt5zH
         KSV01PrXKq4sI5ao2oGPl9GyAg6H+SHZcdjCQ8XoqlRpF2MLrJwcJa6Z32p5975ZNL29
         uMaIfpqWRm9UHGUhmaDcegnMIn0c6Cm/aeaHG9SA0OwIQP1d+fdXSn8CFK61LZrYOB1U
         ccQkQlY1PFZsJUQ5NdHPUQQJdToFemtEN9q7SXQtZEETktqgi9lPqX9P/e9ozX4lyqMt
         VC8XKXyQJbPgVi8AA3qIX+XZYjSfjsPS37LmEPBsI+M37d1sGKEVAt2J56Rkv1mJLhKc
         178w==
X-Gm-Message-State: APjAAAWi2TPyUkaF0n4sJaDgph++bshZqLpysKg1TVrD645KTtlFniUQ
        Hfpel70s5rr7f2/5/vJJrw==
X-Google-Smtp-Source: APXvYqw2mya9wwmMDt+70EkZ0wiZpajXQTGQFbdkXhHLbpPgr6YJLmP8WvucUH9N/LGuNgnM8M4TQA==
X-Received: by 2002:aca:3c86:: with SMTP id j128mr13335051oia.1.1560196285386;
        Mon, 10 Jun 2019 12:51:25 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id j204sm4245516oif.37.2019.06.10.12.51.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jun 2019 12:51:25 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:38f9:6c72:91f7:4c73])
        by serve.minyard.net (Postfix) with ESMTPSA id 670F31800CE;
        Mon, 10 Jun 2019 19:51:24 +0000 (UTC)
Date:   Mon, 10 Jun 2019 14:51:23 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Asmaa Mnebhi <Asmaa@mellanox.com>
Cc:     wsa@the-dreams.de, vadimp@mellanox.com, michaelsh@mellanox.com,
        rdunlap@infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v12 1/1] Add support for IPMB driver
Message-ID: <20190610195123.GB5545@minyard.net>
Reply-To: minyard@acm.org
References: <cover.1560192707.git.Asmaa@mellanox.com>
 <319690553a0da2a1e80b400941341081b383e5f1.1560192707.git.Asmaa@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <319690553a0da2a1e80b400941341081b383e5f1.1560192707.git.Asmaa@mellanox.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 10, 2019 at 02:57:02PM -0400, Asmaa Mnebhi wrote:
> Support receiving IPMB requests on a Satellite MC from the BMC.
> Once a response is ready, this driver will send back a response
> to the BMC via the IPMB channel.

Ok, you have been patient enough on this, and I think it's good
now :).  I've added it to the IPMI for-next tree.

I did move the config section to outside the CONFIG_IPMI_MSGHANLDER
section, as it's not dependent on that option.

-corey

> 
> Signed-off-by: Asmaa Mnebhi <Asmaa@mellanox.com>
> Acked-by: vadimp@mellanox.com
> ---
>  Documentation/IPMB.txt           | 103 +++++++++++
>  drivers/char/ipmi/Kconfig        |   8 +
>  drivers/char/ipmi/Makefile       |   1 +
>  drivers/char/ipmi/ipmb_dev_int.c | 364 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 476 insertions(+)
>  create mode 100644 Documentation/IPMB.txt
>  create mode 100644 drivers/char/ipmi/ipmb_dev_int.c
> 
> diff --git a/Documentation/IPMB.txt b/Documentation/IPMB.txt
> new file mode 100644
> index 0000000..7160d53
> --- /dev/null
> +++ b/Documentation/IPMB.txt
> @@ -0,0 +1,103 @@
> +==============================
> +IPMB Driver for a Satellite MC
> +==============================
> +
> +The Intelligent Platform Management Bus or IPMB, is an
> +I2C bus that provides a standardized interconnection between
> +different boards within a chassis. This interconnection is
> +between the baseboard management (BMC) and chassis electronics.
> +IPMB is also associated with the messaging protocol through the
> +IPMB bus.
> +
> +The devices using the IPMB are usually management
> +controllers that perform management functions such as servicing
> +the front panel interface, monitoring the baseboard,
> +hot-swapping disk drivers in the system chassis, etc...
> +
> +When an IPMB is implemented in the system, the BMC serves as
> +a controller to give system software access to the IPMB. The BMC
> +sends IPMI requests to a device (usually a Satellite Management
> +Controller or Satellite MC) via IPMB and the device
> +sends a response back to the BMC.
> +
> +For more information on IPMB and the format of an IPMB message,
> +refer to the IPMB and IPMI specifications.
> +
> +IPMB driver for Satellite MC
> +----------------------------
> +
> +ipmb-dev-int - This is the driver needed on a Satellite MC to
> +receive IPMB messages from a BMC and send a response back.
> +This driver works with the I2C driver and a userspace
> +program such as OpenIPMI:
> +
> +1) It is an I2C slave backend driver. So, it defines a callback
> +function to set the Satellite MC as an I2C slave.
> +This callback function handles the received IPMI requests.
> +
> +2) It defines the read and write functions to enable a user
> +space program (such as OpenIPMI) to communicate with the kernel.
> +
> +
> +Load the IPMB driver
> +--------------------
> +
> +The driver needs to be loaded at boot time or manually first.
> +First, make sure you have the following in your config file:
> +CONFIG_IPMB_DEVICE_INTERFACE=y
> +
> +1) If you want the driver to be loaded at boot time:
> +
> +a) Add this entry to your ACPI table, under the appropriate SMBus:
> +
> +Device (SMB0) // Example SMBus host controller
> +{
> +  Name (_HID, "<Vendor-Specific HID>") // Vendor-Specific HID
> +  Name (_UID, 0) // Unique ID of particular host controller
> +  :
> +  :
> +    Device (IPMB)
> +    {
> +      Name (_HID, "IPMB0001") // IPMB device interface
> +      Name (_UID, 0) // Unique device identifier
> +    }
> +}
> +
> +b) Example for device tree:
> +
> +&i2c2 {
> +         status = "okay";
> + 
> +         ipmb@10 {
> +                 compatible = "ipmb-dev";
> +                 reg = <0x10>;
> +         };
> +};
> +
> +2) Manually from Linux:
> +modprobe ipmb-dev-int
> +
> +
> +Instantiate the device
> +----------------------
> +
> +After loading the driver, you can instantiate the device as
> +described in 'Documentation/i2c/instantiating-devices'.
> +If you have multiple BMCs, each connected to your Satellite MC via
> +a different I2C bus, you can instantiate a device for each of
> +those BMCs.
> +The name of the instantiated device contains the I2C bus number
> +associated with it as follows:
> +
> +BMC1 ------ IPMB/I2C bus 1 ---------|   /dev/ipmb-1
> +				Satellite MC
> +BMC1 ------ IPMB/I2C bus 2 ---------|   /dev/ipmb-2
> +
> +For instance, you can instantiate the ipmb-dev-int device from
> +user space at the 7 bit address 0x10 on bus 2:
> +
> +  # echo ipmb-dev 0x1010 > /sys/bus/i2c/devices/i2c-2/new_device
> +
> +This will create the device file /dev/ipmb-2, which can be accessed
> +by the user space program. The device needs to be instantiated
> +before running the user space program.
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index caac5d2..811fccb 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -75,6 +75,14 @@ config IPMI_SSIF
>  	 have a driver that must be accessed over an I2C bus instead of a
>  	 standard interface.  This module requires I2C support.
>  
> +config IPMB_DEVICE_INTERFACE
> +       tristate 'IPMB Interface handler'
> +       depends on I2C_SLAVE
> +       help
> +         Provides a driver for a device (Satellite MC) to
> +         receive requests and send responses back to the BMC via
> +         the IPMB interface. This module requires I2C support.
> +
>  config IPMI_POWERNV
>         depends on PPC_POWERNV
>         tristate 'POWERNV (OPAL firmware) IPMI interface'
> diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
> index 3f06b20..0822adc 100644
> --- a/drivers/char/ipmi/Makefile
> +++ b/drivers/char/ipmi/Makefile
> @@ -26,3 +26,4 @@ obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o
>  obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
>  obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
>  obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
> +obj-$(CONFIG_IPMB_DEVICE_INTERFACE) += ipmb_dev_int.o
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
> new file mode 100644
> index 0000000..2895abf
> --- /dev/null
> +++ b/drivers/char/ipmi/ipmb_dev_int.c
> @@ -0,0 +1,364 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * IPMB driver to receive a request and send a response
> + *
> + * Copyright (C) 2019 Mellanox Techologies, Ltd.
> + *
> + * This was inspired by Brendan Higgins' ipmi-bmc-bt-i2c driver.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/errno.h>
> +#include <linux/i2c.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/poll.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/wait.h>
> +
> +#define MAX_MSG_LEN		128
> +#define IPMB_REQUEST_LEN_MIN	7
> +#define NETFN_RSP_BIT_MASK	0x4
> +#define REQUEST_QUEUE_MAX_LEN	256
> +
> +#define IPMB_MSG_LEN_IDX	0
> +#define RQ_SA_8BIT_IDX		1
> +#define NETFN_LUN_IDX		2
> +
> +#define GET_7BIT_ADDR(addr_8bit)	(addr_8bit >> 1)
> +#define GET_8BIT_ADDR(addr_7bit)	((addr_7bit << 1) & 0xff)
> +
> +#define IPMB_MSG_PAYLOAD_LEN_MAX (MAX_MSG_LEN - IPMB_REQUEST_LEN_MIN - 1)
> +
> +#define SMBUS_MSG_HEADER_LENGTH	2
> +#define SMBUS_MSG_IDX_OFFSET	(SMBUS_MSG_HEADER_LENGTH + 1)
> +
> +struct ipmb_msg {
> +	u8 len;
> +	u8 rs_sa;
> +	u8 netfn_rs_lun;
> +	u8 checksum1;
> +	u8 rq_sa;
> +	u8 rq_seq_rq_lun;
> +	u8 cmd;
> +	u8 payload[IPMB_MSG_PAYLOAD_LEN_MAX];
> +	/* checksum2 is included in payload */
> +} __packed;
> +
> +struct ipmb_request_elem {
> +	struct list_head list;
> +	struct ipmb_msg request;
> +};
> +
> +struct ipmb_dev {
> +	struct i2c_client *client;
> +	struct miscdevice miscdev;
> +	struct ipmb_msg request;
> +	struct list_head request_queue;
> +	atomic_t request_queue_len;
> +	size_t msg_idx;
> +	spinlock_t lock;
> +	wait_queue_head_t wait_queue;
> +	struct mutex file_mutex;
> +};
> +
> +static inline struct ipmb_dev *to_ipmb_dev(struct file *file)
> +{
> +	return container_of(file->private_data, struct ipmb_dev, miscdev);
> +}
> +
> +static ssize_t ipmb_read(struct file *file, char __user *buf, size_t count,
> +			loff_t *ppos)
> +{
> +	struct ipmb_dev *ipmb_dev = to_ipmb_dev(file);
> +	struct ipmb_request_elem *queue_elem;
> +	struct ipmb_msg msg;
> +	ssize_t ret;
> +
> +	memset(&msg, 0, sizeof(msg));
> +
> +	spin_lock_irq(&ipmb_dev->lock);
> +
> +	while (list_empty(&ipmb_dev->request_queue)) {
> +		spin_unlock_irq(&ipmb_dev->lock);
> +
> +		if (file->f_flags & O_NONBLOCK)
> +			return -EAGAIN;
> +
> +		ret = wait_event_interruptible(ipmb_dev->wait_queue,
> +				!list_empty(&ipmb_dev->request_queue));
> +		if (ret)
> +			return ret;
> +
> +		spin_lock_irq(&ipmb_dev->lock);
> +	}
> +
> +	queue_elem = list_first_entry(&ipmb_dev->request_queue,
> +					struct ipmb_request_elem, list);
> +	memcpy(&msg, &queue_elem->request, sizeof(msg));
> +	list_del(&queue_elem->list);
> +	kfree(queue_elem);
> +	atomic_dec(&ipmb_dev->request_queue_len);
> +
> +	spin_unlock_irq(&ipmb_dev->lock);
> +
> +	count = min_t(size_t, count, msg.len + 1);
> +	if (copy_to_user(buf, &msg, count))
> +		ret = -EFAULT;
> +
> +	return ret < 0 ? ret : count;
> +}
> +
> +static ssize_t ipmb_write(struct file *file, const char __user *buf,
> +			size_t count, loff_t *ppos)
> +{
> +	struct ipmb_dev *ipmb_dev = to_ipmb_dev(file);
> +	u8 rq_sa, netf_rq_lun, msg_len;
> +	struct i2c_client rq_client;
> +	u8 msg[MAX_MSG_LEN];
> +	ssize_t ret;
> +
> +	if (count > sizeof(msg))
> +		return -EINVAL;
> +
> +	if (copy_from_user(&msg, buf, count))
> +		return -EFAULT;
> +
> +	if (count < msg[0])
> +		return -EINVAL;
> +
> +	rq_sa = GET_7BIT_ADDR(msg[RQ_SA_8BIT_IDX]);
> +	netf_rq_lun = msg[NETFN_LUN_IDX];
> +
> +	if (!(netf_rq_lun & NETFN_RSP_BIT_MASK))
> +		return -EINVAL;
> +
> +	/*
> +	 * subtract rq_sa and netf_rq_lun from the length of the msg passed to
> +	 * i2c_smbus_write_block_data_local
> +	 */
> +	msg_len = msg[IPMB_MSG_LEN_IDX] - SMBUS_MSG_HEADER_LENGTH;
> +
> +	strcpy(rq_client.name, "ipmb_requester");
> +	rq_client.adapter = ipmb_dev->client->adapter;
> +	rq_client.flags = ipmb_dev->client->flags;
> +	rq_client.addr = rq_sa;
> +
> +	ret = i2c_smbus_write_block_data(&rq_client, netf_rq_lun, msg_len,
> +					msg + SMBUS_MSG_IDX_OFFSET);
> +
> +	return ret ? : count;
> +}
> +
> +static unsigned int ipmb_poll(struct file *file, poll_table *wait)
> +{
> +	struct ipmb_dev *ipmb_dev = to_ipmb_dev(file);
> +	unsigned int mask = POLLOUT;
> +
> +	mutex_lock(&ipmb_dev->file_mutex);
> +	poll_wait(file, &ipmb_dev->wait_queue, wait);
> +
> +	if (atomic_read(&ipmb_dev->request_queue_len))
> +		mask |= POLLIN;
> +	mutex_unlock(&ipmb_dev->file_mutex);
> +
> +	return mask;
> +}
> +
> +static const struct file_operations ipmb_fops = {
> +	.owner	= THIS_MODULE,
> +	.read	= ipmb_read,
> +	.write	= ipmb_write,
> +	.poll	= ipmb_poll,
> +};
> +
> +/* Called with ipmb_dev->lock held. */
> +static void ipmb_handle_request(struct ipmb_dev *ipmb_dev)
> +{
> +	struct ipmb_request_elem *queue_elem;
> +
> +	if (atomic_read(&ipmb_dev->request_queue_len) >=
> +			REQUEST_QUEUE_MAX_LEN)
> +		return;
> +
> +	queue_elem = kmalloc(sizeof(*queue_elem), GFP_ATOMIC);
> +	if (!queue_elem)
> +		return;
> +
> +	memcpy(&queue_elem->request, &ipmb_dev->request,
> +		sizeof(struct ipmb_msg));
> +	list_add(&queue_elem->list, &ipmb_dev->request_queue);
> +	atomic_inc(&ipmb_dev->request_queue_len);
> +	wake_up_all(&ipmb_dev->wait_queue);
> +}
> +
> +static u8 ipmb_verify_checksum1(struct ipmb_dev *ipmb_dev, u8 rs_sa)
> +{
> +	/* The 8 lsb of the sum is 0 when the checksum is valid */
> +	return (rs_sa + ipmb_dev->request.netfn_rs_lun +
> +		ipmb_dev->request.checksum1);
> +}
> +
> +static bool is_ipmb_request(struct ipmb_dev *ipmb_dev, u8 rs_sa)
> +{
> +	if (ipmb_dev->msg_idx >= IPMB_REQUEST_LEN_MIN) {
> +		if (ipmb_verify_checksum1(ipmb_dev, rs_sa))
> +			return false;
> +
> +		/*
> +		 * Check whether this is an IPMB request or
> +		 * response.
> +		 * The 6 MSB of netfn_rs_lun are dedicated to the netfn
> +		 * while the remaining bits are dedicated to the lun.
> +		 * If the LSB of the netfn is cleared, it is associated
> +		 * with an IPMB request.
> +		 * If the LSB of the netfn is set, it is associated with
> +		 * an IPMB response.
> +		 */
> +		if (!(ipmb_dev->request.netfn_rs_lun & NETFN_RSP_BIT_MASK))
> +			return true;
> +	}
> +	return false;
> +}
> +
> +/*
> + * The IPMB protocol only supports I2C Writes so there is no need
> + * to support I2C_SLAVE_READ* events.
> + * This i2c callback function only monitors IPMB request messages
> + * and adds them in a queue, so that they can be handled by
> + * receive_ipmb_request.
> + */
> +static int ipmb_slave_cb(struct i2c_client *client,
> +			enum i2c_slave_event event, u8 *val)
> +{
> +	struct ipmb_dev *ipmb_dev = i2c_get_clientdata(client);
> +	u8 *buf = (u8 *)&ipmb_dev->request;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ipmb_dev->lock, flags);
> +	switch (event) {
> +	case I2C_SLAVE_WRITE_REQUESTED:
> +		memset(&ipmb_dev->request, 0, sizeof(ipmb_dev->request));
> +		ipmb_dev->msg_idx = 0;
> +
> +		/*
> +		 * At index 0, ipmb_msg stores the length of msg,
> +		 * skip it for now.
> +		 * The len will be populated once the whole
> +		 * buf is populated.
> +		 *
> +		 * The I2C bus driver's responsibility is to pass the
> +		 * data bytes to the backend driver; it does not
> +		 * forward the i2c slave address.
> +		 * Since the first byte in the IPMB message is the
> +		 * address of the responder, it is the responsibility
> +		 * of the IPMB driver to format the message properly.
> +		 * So this driver prepends the address of the responder
> +		 * to the received i2c data before the request message
> +		 * is handled in userland.
> +		 */
> +		buf[++ipmb_dev->msg_idx] = GET_8BIT_ADDR(client->addr);
> +		break;
> +
> +	case I2C_SLAVE_WRITE_RECEIVED:
> +		if (ipmb_dev->msg_idx >= sizeof(struct ipmb_msg))
> +			break;
> +
> +		buf[++ipmb_dev->msg_idx] = *val;
> +		break;
> +
> +	case I2C_SLAVE_STOP:
> +		ipmb_dev->request.len = ipmb_dev->msg_idx;
> +
> +		if (is_ipmb_request(ipmb_dev, GET_8BIT_ADDR(client->addr)))
> +			ipmb_handle_request(ipmb_dev);
> +		break;
> +
> +	default:
> +		break;
> +	}
> +	spin_unlock_irqrestore(&ipmb_dev->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int ipmb_probe(struct i2c_client *client,
> +			const struct i2c_device_id *id)
> +{
> +	struct ipmb_dev *ipmb_dev;
> +	int ret;
> +
> +	ipmb_dev = devm_kzalloc(&client->dev, sizeof(*ipmb_dev),
> +					GFP_KERNEL);
> +	if (!ipmb_dev)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&ipmb_dev->lock);
> +	init_waitqueue_head(&ipmb_dev->wait_queue);
> +	atomic_set(&ipmb_dev->request_queue_len, 0);
> +	INIT_LIST_HEAD(&ipmb_dev->request_queue);
> +
> +	mutex_init(&ipmb_dev->file_mutex);
> +
> +	ipmb_dev->miscdev.minor = MISC_DYNAMIC_MINOR;
> +
> +	ipmb_dev->miscdev.name = devm_kasprintf(&client->dev, GFP_KERNEL,
> +						"%s%d", "ipmb-",
> +						client->adapter->nr);
> +	ipmb_dev->miscdev.fops = &ipmb_fops;
> +	ipmb_dev->miscdev.parent = &client->dev;
> +	ret = misc_register(&ipmb_dev->miscdev);
> +	if (ret)
> +		return ret;
> +
> +	ipmb_dev->client = client;
> +	i2c_set_clientdata(client, ipmb_dev);
> +	ret = i2c_slave_register(client, ipmb_slave_cb);
> +	if (ret) {
> +		misc_deregister(&ipmb_dev->miscdev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ipmb_remove(struct i2c_client *client)
> +{
> +	struct ipmb_dev *ipmb_dev = i2c_get_clientdata(client);
> +
> +	i2c_slave_unregister(client);
> +	misc_deregister(&ipmb_dev->miscdev);
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id ipmb_id[] = {
> +	{ "ipmb-dev", 0 },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i2c, ipmb_id);
> +
> +static const struct acpi_device_id acpi_ipmb_id[] = {
> +	{ "IPMB0001", 0 },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(acpi, acpi_ipmb_id);
> +
> +static struct i2c_driver ipmb_driver = {
> +	.driver = {
> +		.owner = THIS_MODULE,
> +		.name = "ipmb-dev",
> +		.acpi_match_table = ACPI_PTR(acpi_ipmb_id),
> +	},
> +	.probe = ipmb_probe,
> +	.remove = ipmb_remove,
> +	.id_table = ipmb_id,
> +};
> +module_i2c_driver(ipmb_driver);
> +
> +MODULE_AUTHOR("Mellanox Technologies");
> +MODULE_DESCRIPTION("IPMB driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.1.2
> 
