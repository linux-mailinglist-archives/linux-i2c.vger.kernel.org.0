Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 961993685C
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 01:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfFEXx2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 19:53:28 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33584 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfFEXx2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 19:53:28 -0400
Received: by mail-oi1-f196.google.com with SMTP id q186so348196oia.0;
        Wed, 05 Jun 2019 16:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9hVvfdiSZCWiZTIROgFSRkq8MejG6CCpXLXz6ksLkiY=;
        b=gwq2/plKQ7kst0DyEyQy4++7KYS9VLTPlTbHDr5jbxVUd2hRQv7bgi431AN9lK4iOx
         1jwzWA1oLRNsou42vMF6puLsQWSx4LeHpWGjpeMSMsBSB7jbJOHkIflWGQ9BaZdgnXSA
         2/TlXCctDpP0nak8krFXiMaFTs75oS4MGDc7IbYGD+0emAIkwMSuZCQie9FOjEvIhNaU
         OCjS6nOqnCp52IGzHpfvSYufeVGL4q5z0TNrhqOdKdXUG0JyfG+CRcR0NE3cCPpr6Uw8
         Ahqd+ya00ip2QHak4KaL5QZ7zQmq2dBYgmSs2ltsAQtPN3U0+zZXHg5eBoxzPU3jBsqT
         cj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to
         :user-agent;
        bh=9hVvfdiSZCWiZTIROgFSRkq8MejG6CCpXLXz6ksLkiY=;
        b=uL9HQEJS/hLmyyqkbIqvKQXMdoVKqtBo2AQp6mO04JXjnzmT98eu0gJ3zSO2UCrvXF
         kNL2W/wOK6PyYVuGO9gSwMcYJIv1zxV8GIjGOnML1VtFuyGNGj/1xsoSuq1EqY8Q7ncL
         pYnbTP8eqrDfBDmpz0a0gpngdDY1rb8RRP5pQs4xHkRBZln9ufnXT9ET69ACK8l6t/E7
         K3vkPGyGD1l+afz8tnsqq4GfUMuZ5Y4QoxNswq1JejZTN6JLDCnG9iWg+Gs+FGEtsnOH
         eGfOvQiDp/Zy2w5u7SvFqLeBuh7A5V3/Jv0WImLoFmboIratgyGLbk89u67VIbqCEx8D
         tAgA==
X-Gm-Message-State: APjAAAUzT+lWgyn0MvZuJU4DpoRv0zip1N5zyAMi68aW2C9C9Y26qnMB
        T2sOdPHhyGOYNe7wBHYr4yQNCSZAnQ==
X-Google-Smtp-Source: APXvYqwO8oEIrXrrwx3zWIx5ZMiyG0Bc/Cv4c7tYhW/3v06bRRDWtRkowr7m6L6uUm6lEiDd9zDehw==
X-Received: by 2002:aca:eb57:: with SMTP id j84mr10536692oih.17.1559778806897;
        Wed, 05 Jun 2019 16:53:26 -0700 (PDT)
Received: from serve.minyard.net ([47.184.134.43])
        by smtp.gmail.com with ESMTPSA id o32sm81735ota.37.2019.06.05.16.53.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2019 16:53:26 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:39fa:d791:f67e:f145])
        by serve.minyard.net (Postfix) with ESMTPSA id 4B16B1800CE;
        Wed,  5 Jun 2019 23:53:25 +0000 (UTC)
Date:   Wed, 5 Jun 2019 18:53:24 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Asmaa Mnebhi <Asmaa@mellanox.com>
Cc:     wsa@the-dreams.de, vadimp@mellanox.com, michaelsh@mellanox.com,
        rdunlap@infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v10 1/1] Add support for IPMB driver
Message-ID: <20190605235324.GD6849@minyard.net>
Reply-To: minyard@acm.org
References: <cover.1559761562.git.Asmaa@mellanox.com>
 <db9dfb91e9d28b07944a8ce7c92ced3c3c65dea4.1559761562.git.Asmaa@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db9dfb91e9d28b07944a8ce7c92ced3c3c65dea4.1559761562.git.Asmaa@mellanox.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 05, 2019 at 03:09:30PM -0400, Asmaa Mnebhi wrote:
> Support receiving IPMB requests on a Satellite MC from the BMC.
> Once a response is ready, this driver will send back a response
> to the BMC via the IPMB channel.

A lot of comments inline.

-corey

SNIP...
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * IPMB driver to receive a request and send a response
> + *
> + * Copyright (C) 2018 Mellanox Techologies, Ltd.
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
> +/* get 7-bit address from 8-bit address */
> +#define GET_7BIT_ADDR(addr)	(addr >> 1)
> +
> +#define IPMB_MSG_PAYLOAD_LEN_MAX (MAX_MSG_LEN - IPMB_REQUEST_LEN_MIN - 1)
> +
> +#define SMBUS_MSG_HEADER_LENGTH	2
> +#define SMBUS_MSG_IDX_OFFSET	(SMBUS_MSG_HEADER_LENGTH + 1)
> +
> +#define GET_8BIT_ADDR(addr_7bit) ((addr_7bit << 1) & 0xff)
> +
> +#define UNPOPULATED_RQ_SA	0xff
> +
> +/* Reference 7-bit rq_sa */
> +static u8 reference_rq_sa[128];
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
> +static int receive_ipmb_request(struct ipmb_dev *ipmb_dev,
> +				bool non_blocking,
> +				struct ipmb_msg *ipmb_request)
> +{
> +	struct ipmb_request_elem *queue_elem;
> +	unsigned long flags;
> +	int res;
> +
> +	while (!atomic_read(&ipmb_dev->request_queue_len)) {
> +		if (non_blocking)
> +			return -EAGAIN;
> +
> +		res = wait_event_interruptible(ipmb_dev->wait_queue,
> +				atomic_read(&ipmb_dev->request_queue_len));
> +		if (res)
> +			return res;
> +
> +	}
> +

This can only be called from user context with interrupts on,
spin_lock_irq() is ok here.

> +	spin_lock_irqsave(&ipmb_dev->lock, flags);
> +
> +	if (list_empty(&ipmb_dev->request_queue)) {
> +		spin_unlock_irqrestore(&ipmb_dev->lock, flags);
> +		dev_err(&ipmb_dev->client->dev, "request_queue is empty\n");
> +		return -EIO;
> +	}
> +
> +	queue_elem = list_first_entry(&ipmb_dev->request_queue,
> +					struct ipmb_request_elem, list);
> +	memcpy(ipmb_request, &queue_elem->request, sizeof(*ipmb_request));
> +	list_del(&queue_elem->list);
> +	kfree(queue_elem);
> +	atomic_dec(&ipmb_dev->request_queue_len);
> +
> +	spin_unlock_irqrestore(&ipmb_dev->lock, flags);
> +
> +	return 0;
> +}
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
> +	struct ipmb_msg msg;
> +	ssize_t ret;
> +	int bus;
> +
> +	memset(&msg, 0, sizeof(msg));
> +

The mutex below is not interruptable, so if the task is interrupted,
it could be blocked here.

This function and receive_ipmb_request() seem more complicated than required
I don't think you need file mutex or request_queue_len.

Something like:
	spin_lock_irq();
	while (list_empty(&ipmb_dev->request_queue)) {
		spin_unlock_irq();
		if (file->f_flags & O_NONBLOCK)
			return -EAGAIN;
		res = wait_event_interruptible(ipmb_dev->wait_queue,
				!list_empty(&ipmb_dev->request_queue));
		if (res)
			return res;
		spin_lock_irq();
	}
	queue_elem = list_first_entry(&ipmb_dev->request_queue,
				      struct ipmb_request_elem, list);
	spin_unlock_irq();
	...

> +	mutex_lock(&ipmb_dev->file_mutex);
> +	ret = receive_ipmb_request(ipmb_dev, file->f_flags & O_NONBLOCK,
> +				&msg);
> +	if (ret < 0)
> +		goto out;
> +
> +	bus = ipmb_dev->client->adapter->nr;

You are using bus here without checking the range.

I still don't understandy why you are checking this, anyway.  IMHO there
is no value in this check, just do what userland tells you to do.  It
seems restrictive, you have to receive a message from the remote end
to respond to it.  How do you send an unsolicited event?  There are
systems with multiple managment controllers that can send messages
to other management controllers (ATCA).

> +	if (reference_rq_sa[bus] == UNPOPULATED_RQ_SA)
> +		reference_rq_sa[bus] = GET_7BIT_ADDR(msg.rq_sa);
> +
> +	count = min_t(size_t, count, msg.len + 1);
> +	if (copy_to_user(buf, &msg, count)) {
> +		ret = -EFAULT;
> +		goto out;
> +	}
> +
> +out:
> +	mutex_unlock(&ipmb_dev->file_mutex);
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
> +	int bus;
> +
> +	if (count > sizeof(msg))
> +		return -EINVAL;
> +
> +	if (copy_from_user(&msg, buf, count) || count < msg[0])
> +		return -EFAULT;

Minor nit - you are returning EFAULT if count < msg[0].

> +
> +	bus = ipmb_dev->client->adapter->nr;
> +	rq_sa = GET_7BIT_ADDR(msg[RQ_SA_8BIT_IDX]);
> +	if (rq_sa != reference_rq_sa[bus])
> +		return -EINVAL;
> +
> +	netf_rq_lun = msg[NETFN_LUN_IDX];
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

Why do you need a mutex below?

> +	mutex_lock(&ipmb_dev->file_mutex);
> +	ret = i2c_smbus_write_block_data(&rq_client, netf_rq_lun, msg_len,
> +					msg + SMBUS_MSG_IDX_OFFSET);
> +	mutex_unlock(&ipmb_dev->file_mutex);
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

If this is really called from interrupt context or with preempt disabled,
you can't use GFP_KERNEL.

> +	queue_elem = kmalloc(sizeof(*queue_elem), GFP_KERNEL);
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
> +
> +	spin_lock(&ipmb_dev->lock);

Are you sure this is called with interrupts off?

If it's called from user context, then you can just use a mutex.  If not,
I think you need spin_lock_irqsave() here.

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
> +	spin_unlock(&ipmb_dev->lock);
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
> +	reference_rq_sa[client->adapter->nr] = UNPOPULATED_RQ_SA;
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
