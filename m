Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19758798804
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Sep 2023 15:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235936AbjIHNim (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Sep 2023 09:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbjIHNil (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Sep 2023 09:38:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F2A1BC1;
        Fri,  8 Sep 2023 06:38:35 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93061C433C9;
        Fri,  8 Sep 2023 13:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1694180315;
        bh=NG4rqQ6PfFJGjVqvVxbbwLmhlW1GjZSPIPxS8rHc7u4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0OxEf4Rw4yiibpMgZXDIq48csVzV+4kxc9HrJcibFpQdoW1eYT991oNfVeqD8FO6f
         F2ZHEGt2Y9KksFBk6IdzcFScUPP3iHCA+vo/kZN58Y4t+UPhuLaPqG04D2wPiMohoY
         T+Tnu7OXt2pIQK2t6DcOAiDFNvyB3F2ghhFG0ZFs=
Date:   Fri, 8 Sep 2023 14:38:31 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
        wsa@kernel.org, kfting@nuvoton.com, broonie@kernel.org,
        linus.walleij@linaro.org, hdegoede@redhat.com, maz@kernel.org,
        brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
        srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
Subject: Re: [PATCH v15 1/4] usb: Add support for Intel LJCA device
Message-ID: <2023090854-verse-crabmeat-bf14@gregkh>
References: <1693970580-18967-1-git-send-email-wentong.wu@intel.com>
 <1693970580-18967-2-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1693970580-18967-2-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 06, 2023 at 11:22:57AM +0800, Wentong Wu wrote:
> +struct ljca_bank_descriptor {
> +	u8 bank_id;
> +	u8 pin_num;
> +
> +	/* 1 bit for each gpio, 1 means valid */
> +	u32 valid_pins;
> +} __packed;

This is an unaligned access, do you mean to have that?

> +struct ljca_adapter {
> +	struct usb_interface *intf;
> +	struct usb_device *usb_dev;
> +	struct device *dev;
> +
> +	unsigned int rx_pipe;
> +	unsigned int tx_pipe;
> +
> +	/* urb for recv */
> +	struct urb *rx_urb;
> +	/* buffer for recv */
> +	void *rx_buf;
> +	unsigned int rx_len;
> +
> +	/* external buffer for recv */
> +	void *ex_buf;

Shouldn't buffers be u8*?

> +static void ljca_handle_event(struct ljca_adapter *adap,
> +			      struct ljca_msg *header)
> +{
> +	struct ljca_client *client;
> +
> +	list_for_each_entry(client, &adap->client_list, link) {
> +		/*
> +		 * FIXME: currently only GPIO register event callback.

When is this fixme going to be addressed?

> +		 * firmware message structure should include id when
> +		 * multiple same type clients register event callback.
> +		 */
> +		if (client->type == header->type) {
> +			unsigned long flags;
> +
> +			spin_lock_irqsave(&client->event_cb_lock, flags);
> +			client->event_cb(client->context, header->cmd,
> +					 header->data, header->len);
> +			spin_unlock_irqrestore(&client->event_cb_lock, flags);
> +
> +			break;
> +		}
> +	}
> +}
> +
> +/* process command ack */
> +static void ljca_handle_cmd_ack(struct ljca_adapter *adap,
> +				struct ljca_msg *header)
> +{
> +	struct ljca_msg *tx_header = adap->tx_buf;
> +	unsigned int actual_len = 0;
> +	unsigned int ibuf_len;
> +	unsigned long flags;
> +	void *ibuf;
> +
> +	spin_lock_irqsave(&adap->lock, flags);

Why not use the functionality in cleanup.h for this lock?  Makes this
function much simpler.

> +
> +	if (tx_header->type != header->type || tx_header->cmd != header->cmd) {
> +		spin_unlock_irqrestore(&adap->lock, flags);
> +

No need for a blank line.

And how can these things happen?  No need to return an error if this is
the case?

> +static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
> +		     const void *obuf, unsigned int obuf_len, void *ibuf,
> +		     unsigned int ibuf_len, bool ack, unsigned long timeout)

That's a lot of function parameters, whyh so many?

And why void *?  That should never be used in an internal function where
you know the real type.

> +{
> +	unsigned int msg_len = sizeof(struct ljca_msg) + obuf_len;
> +	struct ljca_msg *header = adap->tx_buf;
> +	unsigned long flags;
> +	unsigned int actual;
> +	int ret = 0;
> +
> +	if (adap->disconnect)
> +		return -ENODEV;
> +
> +	if (msg_len > adap->tx_buf_len)
> +		return -EINVAL;
> +
> +	mutex_lock(&adap->mutex);
> +
> +	spin_lock_irqsave(&adap->lock, flags);

2 locks?  Why 2 locks for the same structure?

> +
> +	header->type = type;
> +	header->cmd = cmd;
> +	header->len = obuf_len;
> +	if (obuf)
> +		memcpy(header->data, obuf, obuf_len);
> +
> +	header->flags = LJCA_CMPL_FLAG | (ack ? LJCA_ACK_FLAG : 0);
> +
> +	adap->ex_buf = ibuf;
> +	adap->ex_buf_len = ibuf_len;
> +	adap->actual_length = 0;
> +
> +	spin_unlock_irqrestore(&adap->lock, flags);
> +
> +	reinit_completion(&adap->cmd_completion);
> +
> +	usb_autopm_get_interface(adap->intf);
> +
> +	ret = usb_bulk_msg(adap->usb_dev, adap->tx_pipe, header,
> +			   msg_len, &actual, LJCA_WRITE_TIMEOUT_MS);

This function is slow.  Really slow.  You drop the spinlock which is
good, but the mutex is still held.  Does this call have to be
synchronous?

> +
> +	usb_autopm_put_interface(adap->intf);
> +
> +	if (!ret && ack) {
> +		ret = wait_for_completion_timeout(&adap->cmd_completion,
> +						  timeout);
> +		if (ret < 0) {
> +			goto out;
> +		} if (!ret) {
> +			ret = -ETIMEDOUT;
> +			goto out;
> +		}
> +	}
> +	ret = adap->actual_length;
> +
> +out:
> +	spin_lock_irqsave(&adap->lock, flags);
> +	adap->ex_buf = NULL;
> +	adap->ex_buf_len = 0;
> +
> +	memset(header, 0, sizeof(*header));

Why?

> +	spin_unlock_irqrestore(&adap->lock, flags);
> +
> +	mutex_unlock(&adap->mutex);
> +
> +	return ret;
> +}
> +
> +int ljca_transfer(struct ljca_client *client, u8 cmd, const void *obuf,

Again, drop all void * please, use real types in your apis.

> +#else
> +static void ljca_auxdev_acpi_bind(struct ljca_adapter *adap,
> +				  struct auxiliary_device *auxdev,
> +				  u64 adr, u8 id)
> +{
> +}
> +#endif

Can't this go in a .h file?  #ifdef in .c files are frowned apon.

> +static int ljca_enumerate_clients(struct ljca_adapter *adap)
> +{
> +	int ret;
> +
> +	ret = ljca_reset_handshake(adap);
> +	if (ret)
> +		return ret;
> +
> +	ret = ljca_enumerate_gpio(adap);
> +	if (ret)
> +		dev_warn(adap->dev, "enumerate GPIO error\n");
> +
> +	ret = ljca_enumerate_i2c(adap);
> +	if (ret)
> +		dev_warn(adap->dev, "enumerate I2C error\n");
> +
> +	ret = ljca_enumerate_spi(adap);
> +	if (ret)
> +		dev_warn(adap->dev, "enumerate SPI error\n");

You warn about these things, but keep on saying the code is working
properly with a return of:

> +	return 0;

That's not good.  Why not unwind properly and handle the error?

> --- /dev/null
> +++ b/include/linux/usb/ljca.h
> @@ -0,0 +1,113 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2023, Intel Corporation. All rights reserved.
> + */
> +#ifndef _LINUX_USB_LJCA_H_
> +#define _LINUX_USB_LJCA_H_
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/list.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +
> +#define LJCA_MAX_GPIO_NUM 64
> +
> +#define auxiliary_dev_to_ljca_client(auxiliary_dev)			\
> +		container_of(auxiliary_dev, struct ljca_client, auxdev)
> +
> +struct ljca_adapter;
> +
> +/**
> + * typedef ljca_event_cb_t - event callback function signature
> + *
> + * @context: the execution context of who registered this callback
> + * @cmd: the command from device for this event
> + * @evt_data: the event data payload
> + * @len: the event data payload length
> + *
> + * The callback function is called in interrupt context and the data payload is
> + * only valid during the call. If the user needs later access of the data, it
> + * must copy it.
> + */
> +typedef void (*ljca_event_cb_t)(void *context, u8 cmd, const void *evt_data, int len);
> +
> +struct ljca_client {
> +	u8 type;
> +	u8 id;
> +	struct list_head link;
> +	struct auxiliary_device auxdev;
> +	struct ljca_adapter *adapter;
> +
> +	void *context;
> +	ljca_event_cb_t event_cb;
> +	/* lock to protect event_cb */
> +	spinlock_t event_cb_lock;
> +};
> +
> +struct ljca_gpio_info {
> +	unsigned int num;
> +	DECLARE_BITMAP(valid_pin_map, LJCA_MAX_GPIO_NUM);
> +};
> +
> +struct ljca_i2c_info {
> +	u8 id;
> +	u8 capacity;
> +	u8 intr_pin;
> +};
> +
> +struct ljca_spi_info {
> +	u8 id;
> +	u8 capacity;
> +};

No documentation for these other public structures?

thanks,

greg k-h
