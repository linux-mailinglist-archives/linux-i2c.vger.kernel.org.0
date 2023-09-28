Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC0A17B1FCC
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 16:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbjI1Ogf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 10:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231534AbjI1Oge (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 10:36:34 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F09FB1AD;
        Thu, 28 Sep 2023 07:36:31 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00BEC433C9;
        Thu, 28 Sep 2023 14:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1695911791;
        bh=5195cqhbk3/ZxuRdmxFaPLY1ryYYDrfX3qlUOZHKKT0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v8LzPkmsdWIzgKnj4e3AtWNR9GIzghgzMwXihRwLOhpg3wTSBLglMQprBa7D7F9UT
         SNvXy+XMU+B4vExOhLhxLM5OW1SNjACzsHWOOkuXw3QgKeHMZWxAR9d2v9yuu3Ba3k
         9h4x1CecJJUjqffuFp6UoEvhRe4xRabZpwdg+nHA=
Date:   Thu, 28 Sep 2023 16:36:27 +0200
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
Subject: Re: [PATCH v19 1/4] usb: Add support for Intel LJCA device
Message-ID: <2023092857-atrium-scared-b624@gregkh>
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <1694890416-14409-2-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1694890416-14409-2-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Sep 17, 2023 at 02:53:33AM +0800, Wentong Wu wrote:
> +/* ljca cmd message structure */
> +struct ljca_msg {
> +	u8 type;
> +	u8 cmd;
> +	u8 flags;
> +	u8 len;
> +	u8 data[];

Shouldn't you be using the __counted_by attributes for all of these []
arrays so that the compiler knows what to do and how to check that you
don't overrun the buffer?

Adding that now will save you having to add it later, AND it might catch
bugs you already have so please add that.

> +
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
> +	u8 *ex_buf;
> +	unsigned int ex_buf_len;
> +	/* actual data length copied to external buffer */
> +	unsigned int actual_length;
> +
> +	/* buffer for send */
> +	void *tx_buf;
> +	unsigned int tx_buf_len;
> +
> +	/* lock to protect tx_buf and ex_buf */
> +	spinlock_t lock;
> +
> +	struct completion cmd_completion;
> +
> +	/* mutex to protect command download */
> +	struct mutex mutex;
> +
> +	/* client device list */
> +	struct list_head client_list;
> +
> +	/* disconnect ongoing or not */
> +	bool disconnect;
> +
> +	/* used to reset firmware */

Can you use proper kernel doc for this structure instead of inline
comments?

> +	u32 reset_id;
> +};
> +
> +struct ljca_match_ids_walk_data {
> +	const struct acpi_device_id *ids;
> +	const char *uid;
> +	struct acpi_device *adev;
> +};
> +
> +static const struct acpi_device_id ljca_gpio_hids[] = {
> +	{ "INTC1074" },
> +	{ "INTC1096" },
> +	{ "INTC100B" },
> +	{ "INTC10D1" },
> +	{},
> +};
> +
> +static const struct acpi_device_id ljca_i2c_hids[] = {
> +	{ "INTC1075" },
> +	{ "INTC1097" },
> +	{ "INTC100C" },
> +	{ "INTC10D2" },
> +	{},
> +};
> +
> +static const struct acpi_device_id ljca_spi_hids[] = {
> +	{ "INTC1091" },
> +	{ "INTC1098" },
> +	{ "INTC100D" },
> +	{ "INTC10D3" },
> +	{},
> +};
> +
> +static void ljca_handle_event(struct ljca_adapter *adap,
> +			      struct ljca_msg *header)
> +{
> +	struct ljca_client *client;
> +
> +	list_for_each_entry(client, &adap->client_list, link) {
> +		/*
> +		 * FIXME: currently only GPIO register event callback.
> +		 * firmware message structure should include id when
> +		 * multiple same type clients register event callback.
> +		 */

When will this be fixed?

If not now, why not?

> +		if (client->type == header->type) {
> +			scoped_guard(spinlock_irqsave, &client->event_cb_lock) {
> +				client->event_cb(client->context, header->cmd,
> +						 header->data, header->len);
> +			}
> +
> +			break;
> +		}
> +	}
> +}
> +
> +/* process command ack */
> +static void ljca_handle_cmd_ack(struct ljca_adapter *adap,
> +				struct ljca_msg *header)

We can use 100 columns...

> +{
> +	struct ljca_msg *tx_header = adap->tx_buf;
> +	unsigned int actual_len = 0;
> +	unsigned int ibuf_len;
> +	unsigned long flags;
> +	u8 *ibuf;
> +
> +	spin_lock_irqsave(&adap->lock, flags);
> +
> +	if (tx_header->type != header->type || tx_header->cmd != header->cmd) {
> +		dev_err(adap->dev, "cmd ack mismatch error\n");

When you print error messages like this, who can do something about it?
And why print with interrupts disabled?

> +		spin_unlock_irqrestore(&adap->lock, flags);
> +		return;
> +	}
> +
> +	ibuf_len = adap->ex_buf_len;
> +	ibuf = adap->ex_buf;
> +
> +	if (ibuf && ibuf_len) {
> +		actual_len = min_t(unsigned int, header->len, ibuf_len);

You control both of these types, why aren't they the same type to start
with?  Why the force cast?

> +
> +		/* copy received data to external buffer */
> +		memcpy(ibuf, header->data, actual_len);
> +	}
> +	/* update copied data length */
> +	adap->actual_length = actual_len;

Wait, what happens if you don't actually copy the data?  Why lie and say
you did?  Where is the error handling?

> +
> +	spin_unlock_irqrestore(&adap->lock, flags);
> +
> +	complete(&adap->cmd_completion);
> +}
> +
> +static void ljca_recv(struct urb *urb)

No error handling?

> +{
> +	struct ljca_msg *header = urb->transfer_buffer;
> +	struct ljca_adapter *adap = urb->context;
> +	int ret;
> +
> +	if (urb->status) {
> +		/* sync/async unlink faults aren't errors */
> +		if (urb->status == -ENOENT) {
> +			/*
> +			 * directly complete the possible ongoing transfer
> +			 * during disconnect
> +			 */
> +			if (adap->disconnect)
> +				complete(&adap->cmd_completion);
> +			return;
> +		}
> +
> +		if (urb->status == -ECONNRESET || urb->status == -ESHUTDOWN)
> +			return;
> +
> +		dev_err(adap->dev, "recv urb error: %d\n", urb->status);
> +		goto resubmit;

You have an error, yet you don't report it you just spam the kernel log?
Why?  Doesn't this happen when a device is removed?

> +	}
> +
> +	if (header->len + sizeof(*header) != urb->actual_length)
> +		goto resubmit;
> +
> +	if (header->flags & LJCA_ACK_FLAG)
> +		ljca_handle_cmd_ack(adap, header);
> +	else
> +		ljca_handle_event(adap, header);
> +
> +resubmit:
> +	ret = usb_submit_urb(urb, GFP_ATOMIC);

Why atomic, is this in a urb callback?

> +	if (ret && ret != -EPERM)
> +		dev_err(adap->dev, "resubmit recv urb error %d\n", ret);

What happens if ret is an error here?

> +}
> +
> +static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
> +		     const u8 *obuf, unsigned int obuf_len, u8 *ibuf,
> +		     unsigned int ibuf_len, bool ack, unsigned long timeout)
> +{
> +	unsigned int msg_len = sizeof(struct ljca_msg) + obuf_len;
> +	struct ljca_msg *header = adap->tx_buf;
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
> +	scoped_guard(spinlock_irqsave, &adap->lock) {
> +		header->type = type;
> +		header->cmd = cmd;
> +		header->len = obuf_len;
> +		if (obuf)
> +			memcpy(header->data, obuf, obuf_len);
> +		header->flags = LJCA_CMPL_FLAG | (ack ? LJCA_ACK_FLAG : 0);
> +
> +		adap->ex_buf = ibuf;
> +		adap->ex_buf_len = ibuf_len;
> +		adap->actual_length = 0;
> +	}

Do you really need a scoped guard when you can not fail out of the
block?

Why do you have both a mutex and spinlock grabed?

> +
> +	reinit_completion(&adap->cmd_completion);
> +
> +	usb_autopm_get_interface(adap->intf);

This can fail.  Why aren't you checking that?

> +
> +	ret = usb_bulk_msg(adap->usb_dev, adap->tx_pipe, header,
> +			   msg_len, &actual, LJCA_WRITE_TIMEOUT_MS);
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

Why are you not verifying that you sent what you wanted to send?

When you call this function, sometimes you check that the function sent
the proper amount of data, but in many places you do not, and you assume
that the full buffer was sent, which is not correct.  So please change
_this_ function to check that you sent the proper amount and then the
caller logic will be much simpler and actually work like you are using
it in many places (some places you got it right, some wrong, which is a
HUGE indication that the API is wrong because you wrote this code, and
if you can't get it right...)

> +out:
> +	scoped_guard(spinlock_irqsave, &adap->lock) {
> +		adap->ex_buf = NULL;
> +		adap->ex_buf_len = 0;
> +		memset(header, 0, sizeof(*header));
> +	}

Again, why a scoped guard for something like this that does not need it?

> +
> +	mutex_unlock(&adap->mutex);
> +
> +	return ret;
> +}
> +
> +int ljca_transfer(struct ljca_client *client, u8 cmd, const u8 *obuf,
> +		  unsigned int obuf_len, u8 *ibuf, unsigned int ibuf_len)
> +{
> +	return ljca_send(client->adapter, client->type, cmd,
> +			 obuf, obuf_len, ibuf, ibuf_len, true,
> +			 LJCA_WRITE_ACK_TIMEOUT_MS);
> +}
> +EXPORT_SYMBOL_NS_GPL(ljca_transfer, LJCA);
> +
> +int ljca_transfer_noack(struct ljca_client *client, u8 cmd, const u8 *obuf,
> +			unsigned int obuf_len)
> +{
> +	return ljca_send(client->adapter, client->type, cmd, obuf,
> +			 obuf_len, NULL, 0, false, LJCA_WRITE_ACK_TIMEOUT_MS);
> +}
> +EXPORT_SYMBOL_NS_GPL(ljca_transfer_noack, LJCA);
> +
> +int ljca_register_event_cb(struct ljca_client *client, ljca_event_cb_t event_cb,
> +			   void *context)
> +{
> +	unsigned long flags;
> +
> +	if (!event_cb)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&client->event_cb_lock, flags);
> +
> +	if (client->event_cb) {
> +		spin_unlock_irqrestore(&client->event_cb_lock, flags);
> +		return -EALREADY;
> +	}
> +
> +	client->event_cb = event_cb;
> +	client->context = context;
> +
> +	spin_unlock_irqrestore(&client->event_cb_lock, flags);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(ljca_register_event_cb, LJCA);
> +
> +void ljca_unregister_event_cb(struct ljca_client *client)
> +{
> +	scoped_guard(spinlock_irqsave, &client->event_cb_lock) {
> +		client->event_cb = NULL;
> +		client->context = NULL;
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(ljca_unregister_event_cb, LJCA);
> +
> +static int ljca_match_device_ids(struct acpi_device *adev, void *data)
> +{
> +	struct ljca_match_ids_walk_data *wd = data;
> +	const char *uid = acpi_device_uid(adev);
> +
> +	if (acpi_match_device_ids(adev, wd->ids))
> +		return 0;
> +
> +	if (!wd->uid)
> +		goto match;
> +
> +	if (!uid)
> +		uid = "0";

Are you sure this is a valid uid to use?  If so, why?  What happens if
this gets set to "0" for multiple ones?  Don't underestimate broken
firmware tables, but also don't paper over problems in ways that will be
impossible to notice and can cause problems.

Or am I mis-reading this function wrong, how can this ever be a valid
UID to compare against?

> +	else
> +		uid = strchr(uid, wd->uid[0]);
> +
> +	if (!uid || strcmp(uid, wd->uid))
> +		return 0;
> +
> +match:
> +	wd->adev = adev;
> +
> +	return 1;
> +}
> +
> +/* bind auxiliary device to acpi device */
> +static void ljca_auxdev_acpi_bind(struct ljca_adapter *adap,
> +				  struct auxiliary_device *auxdev,
> +				  u64 adr, u8 id)
> +{
> +	struct ljca_match_ids_walk_data wd = { 0 };
> +	struct acpi_device *parent, *adev;
> +	struct device *dev = adap->dev;
> +	char uid[4];
> +
> +	parent = ACPI_COMPANION(dev);
> +	if (!parent)
> +		return;
> +
> +	/*
> +	 * get auxdev ACPI handle from the ACPI device directly
> +	 * under the parent that matches _ADR.
> +	 */
> +	adev = acpi_find_child_device(parent, adr, false);
> +	if (adev) {
> +		ACPI_COMPANION_SET(&auxdev->dev, adev);
> +		return;
> +	}
> +
> +	/*
> +	 * _ADR is a grey area in the ACPI specification, some
> +	 * platforms use _HID to distinguish children devices.
> +	 */
> +	switch (adr) {
> +	case LJCA_GPIO_ACPI_ADR:
> +		wd.ids = ljca_gpio_hids;
> +		break;
> +	case LJCA_I2C1_ACPI_ADR:
> +	case LJCA_I2C2_ACPI_ADR:
> +		snprintf(uid, sizeof(uid), "%d", id);
> +		wd.uid = uid;
> +		wd.ids = ljca_i2c_hids;
> +		break;
> +	case LJCA_SPI1_ACPI_ADR:
> +	case LJCA_SPI2_ACPI_ADR:
> +		wd.ids = ljca_spi_hids;
> +		break;
> +	default:
> +		dev_warn(dev, "unsupported _ADR\n");
> +		return;
> +	}
> +
> +	acpi_dev_for_each_child(parent, ljca_match_device_ids, &wd);
> +	if (wd.adev) {
> +		ACPI_COMPANION_SET(&auxdev->dev, wd.adev);
> +		return;
> +	}
> +
> +	parent = ACPI_COMPANION(dev->parent->parent);
> +	if (!parent)
> +		return;
> +
> +	acpi_dev_for_each_child(parent, ljca_match_device_ids, &wd);
> +	if (wd.adev)
> +		ACPI_COMPANION_SET(&auxdev->dev, wd.adev);
> +}
> +
> +static void ljca_auxdev_release(struct device *dev)
> +{
> +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> +
> +	kfree(auxdev->dev.platform_data);
> +}
> +
> +static int ljca_new_client_device(struct ljca_adapter *adap, u8 type, u8 id,
> +				  char *name, void *data, u64 adr)
> +{
> +	struct auxiliary_device *auxdev;
> +	struct ljca_client *client;
> +	int ret;
> +
> +	client = kzalloc(sizeof *client, GFP_KERNEL);
> +	if (!client)
> +		return -ENOMEM;
> +
> +	client->type = type;
> +	client->id = id;
> +	client->adapter = adap;
> +	spin_lock_init(&client->event_cb_lock);
> +
> +	auxdev = &client->auxdev;
> +	auxdev->name = name;
> +	auxdev->id = id;
> +
> +	auxdev->dev.parent = adap->dev;
> +	auxdev->dev.platform_data = data;
> +	auxdev->dev.release = ljca_auxdev_release;
> +
> +	ret = auxiliary_device_init(auxdev);
> +	if (ret)
> +		goto err_free;
> +
> +	ljca_auxdev_acpi_bind(adap, auxdev, adr, id);
> +
> +	ret = auxiliary_device_add(auxdev);
> +	if (ret)
> +		goto err_uninit;
> +
> +	list_add_tail(&client->link, &adap->client_list);
> +
> +	return 0;
> +
> +err_uninit:
> +	auxiliary_device_uninit(auxdev);
> +
> +err_free:
> +	kfree(client);
> +
> +	return ret;
> +}
> +
> +static int ljca_enumerate_gpio(struct ljca_adapter *adap)
> +{
> +	u32 valid_pin[LJCA_MAX_GPIO_NUM / BITS_PER_TYPE(u32)];
> +	struct ljca_gpio_descriptor *desc;
> +	struct ljca_gpio_info *gpio_info;
> +	u8 buf[LJCA_MAX_PAYLOAD_SIZE];
> +	int ret, gpio_num;
> +	unsigned int i;
> +
> +	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_ENUM_GPIO, NULL, 0, buf,
> +			sizeof(buf), true, LJCA_ENUM_CLIENT_TIMEOUT_MS);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* check firmware response */
> +	desc = (struct ljca_gpio_descriptor *)buf;
> +	if (ret != struct_size(desc, bank_desc, desc->bank_num))
> +		return -EINVAL;
> +
> +	gpio_num = desc->pins_per_bank * desc->bank_num;
> +	if (gpio_num > LJCA_MAX_GPIO_NUM)
> +		return -EINVAL;
> +
> +	/* construct platform data */
> +	gpio_info = kzalloc(sizeof *gpio_info, GFP_KERNEL);
> +	if (!gpio_info)
> +		return -ENOMEM;
> +	gpio_info->num = gpio_num;
> +
> +	for (i = 0; i < desc->bank_num; i++)
> +		valid_pin[i] = get_unaligned_le32(&desc->bank_desc[i].valid_pins);
> +	bitmap_from_arr32(gpio_info->valid_pin_map, valid_pin, gpio_num);
> +
> +	ret = ljca_new_client_device(adap, LJCA_CLIENT_GPIO, 0, "ljca-gpio",
> +				     gpio_info, LJCA_GPIO_ACPI_ADR);
> +	if (ret)
> +		kfree(gpio_info);
> +
> +	return ret;
> +}
> +
> +static int ljca_enumerate_i2c(struct ljca_adapter *adap)
> +{
> +	struct ljca_i2c_descriptor *desc;
> +	struct ljca_i2c_info *i2c_info;
> +	u8 buf[LJCA_MAX_PAYLOAD_SIZE];
> +	unsigned int i;
> +	int ret;
> +
> +	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_ENUM_I2C, NULL, 0, buf,
> +			sizeof(buf), true, LJCA_ENUM_CLIENT_TIMEOUT_MS);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* check firmware response */
> +	desc = (struct ljca_i2c_descriptor *)buf;
> +	if (ret != struct_size(desc, info, desc->num))
> +		return -EINVAL;
> +
> +	for (i = 0; i < desc->num; i++) {
> +		/* construct platform data */
> +		i2c_info = kzalloc(sizeof *i2c_info, GFP_KERNEL);
> +		if (!i2c_info)
> +			return -ENOMEM;
> +
> +		i2c_info->id = desc->info[i].id;
> +		i2c_info->capacity = desc->info[i].capacity;
> +		i2c_info->intr_pin = desc->info[i].intr_pin;
> +
> +		ret = ljca_new_client_device(adap, LJCA_CLIENT_I2C, i,
> +					     "ljca-i2c", i2c_info,
> +					     LJCA_I2C1_ACPI_ADR + i);
> +		if (ret) {
> +			kfree(i2c_info);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int ljca_enumerate_spi(struct ljca_adapter *adap)
> +{
> +	struct ljca_spi_descriptor *desc;
> +	struct ljca_spi_info *spi_info;
> +	u8 buf[LJCA_MAX_PAYLOAD_SIZE];
> +	unsigned int i;
> +	int ret;
> +
> +	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_ENUM_SPI, NULL, 0, buf,
> +			sizeof(buf), true, LJCA_ENUM_CLIENT_TIMEOUT_MS);
> +	if (ret < 0)
> +		return ret;
> +
> +	desc = (struct ljca_spi_descriptor *)buf;
> +	for (i = 0; i < desc->num; i++) {
> +		/* construct platform data */
> +		spi_info = kzalloc(sizeof *spi_info, GFP_KERNEL);
> +		if (!spi_info)
> +			return -ENOMEM;
> +
> +		spi_info->id = desc->info[i].id;
> +		spi_info->capacity = desc->info[i].capacity;
> +
> +		ret = ljca_new_client_device(adap, LJCA_CLIENT_SPI, i,
> +					     "ljca-spi", spi_info,
> +					     LJCA_SPI1_ACPI_ADR + i);
> +		if (ret) {
> +			kfree(spi_info);
> +			return ret;

What about the other objects that you created here, don't you need to
unwind the new ones if one in the chain fails?  And if not, why stop at
the first failure?


> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int ljca_reset_handshake(struct ljca_adapter *adap)
> +{
> +	__le32 reset_id = cpu_to_le32(adap->reset_id);
> +	__le32 reset_id_ret = 0;
> +	int ret;
> +
> +	adap->reset_id++;
> +
> +	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_RESET, (u8 *)&reset_id,
> +			sizeof(__le32), (u8 *)&reset_id_ret, sizeof(__le32),
> +			true, LJCA_WRITE_ACK_TIMEOUT_MS);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (reset_id_ret != reset_id)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
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

So none of these "errors" are actually errors:

> +	return 0;

You return success?  Why?  Are they not actually problems?

thanks,

greg k-h
