Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBDC6B6FBB
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 07:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjCMG5I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Mar 2023 02:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbjCMG5G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Mar 2023 02:57:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7383A4DE16;
        Sun, 12 Mar 2023 23:56:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E249761092;
        Mon, 13 Mar 2023 06:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC061C433D2;
        Mon, 13 Mar 2023 06:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678690613;
        bh=sUNbC2N5a1VJCUaka4niLvSZTcQfTVeVCuBrEpSgNsg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qKlCKAwkDumbVYaUoeNWYPDRbpPyDlLd+ulFA/F+3ZVxFbO3aqjp5Cj+JP44FbvCs
         9vn78muigttGikWY6y6R1H5uRZ6Mj/mRy37zg1wb7/iUSXJYceppQ6hVl7TI5LjjCA
         +pJKKueveNiNwsQT5/MW68PtA4g5huJdlJPPIqPo=
Date:   Mon, 13 Mar 2023 07:56:50 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ye Xiang <xiang.ye@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v5 1/5] usb: Add support for Intel LJCA device
Message-ID: <ZA7JMimTCkp3qc8U@kroah.com>
References: <20230312190435.3568212-1-xiang.ye@intel.com>
 <20230312190435.3568212-2-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230312190435.3568212-2-xiang.ye@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 13, 2023 at 03:04:31AM +0800, Ye Xiang wrote:
> This patch implements the USB part of Intel USB-I2C/GPIO/SPI adapter
> device named "La Jolla Cove Adapter" (LJCA).
> 
> The communication between the various LJCA module drivers and the
> hardware will be muxed/demuxed by this driver. The sub-module of
> LJCA can use ljca_transfer() to issue a transfer between host
> and hardware.

So you have 2 different things happening in this driver.  One is the USB
interaction and control and stuff, and one is the creation of an api
that is to be used by other parts of the kernel.

Can you split this up into 2 different commits, one for the api, and one
for the USB stuff?  I think you will find that the API is going to need
a bunch of work, as it's not "normal" for what the kernel is expecting
to have.

Some other review comments below:

> +struct ljca_event_cb_entry {
> +	ljca_event_cb_t notify;
> +	void *context;

Why a void *?

> +};
> +
> +struct ljca_dev {
> +	struct usb_device *udev;
> +	struct usb_interface *intf;

If you have the interface, you can get the usb device.  Why store both?

> +	u8 in_ep; /* the address of the bulk in endpoint */
> +	u8 out_ep; /* the address of the bulk out endpoint */
> +
> +	/* the urb/buffer for read */
> +	struct urb *in_urb;
> +	unsigned char *ibuf;
> +	size_t ibuf_len;
> +
> +	bool started;

You can't just use a boolean as a "flag" without any locking, that is
not going to work, sorry.

> +	struct list_head stubs_list;
> +
> +	/* to wait for an ongoing write ack */
> +	wait_queue_head_t ack_wq;
> +
> +	struct mfd_cell *cells;
> +	int cell_count;
> +	/* mutex to protect package transfer with LJCA device */
> +	struct mutex mutex;

Why is this not protecting "started" as well as the other fields in this
structure?

> +};
> +
> +struct ljca {
> +	u8 type;
> +	struct ljca_dev *dev;
> +};
> +
> +struct ljca_stub_packet {
> +	unsigned int *ibuf_len;
> +	u8 *ibuf;
> +};
> +
> +struct ljca_stub {
> +	struct list_head list;
> +	struct usb_interface *intf;
> +	struct ljca_stub_packet ipacket;
> +	u8 type;
> +
> +	/* for identify ack */
> +	bool acked;
> +	int cur_cmd;
> +
> +	struct ljca_event_cb_entry event_entry;
> +	/* lock to protect event_entry */
> +	spinlock_t event_cb_lock;
> +
> +	struct ljca ljca;
> +	unsigned long priv[];

What is "priv" for?  Why is it unsigned long and not a real type?

> +};
> +
> +static inline void *ljca_priv(struct ljca_stub *stub)
> +{
> +	return stub->priv;

Why is this a void *?


> +}
> +
> +static bool ljca_validate(struct ljca_msg *header, u32 data_len)
> +{
> +	return header->len + sizeof(*header) == data_len;
> +}
> +
> +static struct ljca_stub *ljca_stub_alloc(struct ljca_dev *dev, u8 type, int priv_size)
> +{
> +	struct ljca_stub *stub;
> +
> +	stub = kzalloc(struct_size(stub, priv, priv_size), GFP_KERNEL);
> +	if (!stub)
> +		return ERR_PTR(-ENOMEM);
> +
> +	stub->type = type;
> +	stub->intf = dev->intf;
> +	stub->ljca.dev = dev;

You are saving a reference to a reference counted device, yet never
grabbing the reference?  That is ripe for disaster.

> +	stub->ljca.type = stub->type;
> +	spin_lock_init(&stub->event_cb_lock);
> +	list_add_tail(&stub->list, &dev->stubs_list);

Where is the reference counting on this new structure that you just
created?  Who controls the lifespan of it?

> +	return stub;
> +}
> +
> +static struct ljca_stub *ljca_stub_find(struct ljca_dev *dev, u8 type)
> +{
> +	struct ljca_stub *stub;
> +
> +	list_for_each_entry(stub, &dev->stubs_list, list) {
> +		if (stub->type == type)
> +			return stub;
> +	}
> +
> +	dev_err(&dev->intf->dev, "USB stub not found, type:%d\n", type);
> +
> +	return ERR_PTR(-ENODEV);
> +}
> +
> +static void ljca_stub_notify(struct ljca_stub *stub, u8 cmd, const void *evt_data, int len)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&stub->event_cb_lock, flags);
> +	if (stub->event_entry.notify && stub->event_entry.context)
> +		stub->event_entry.notify(stub->event_entry.context, cmd, evt_data, len);
> +	spin_unlock_irqrestore(&stub->event_cb_lock, flags);
> +}
> +
> +static int ljca_parse(struct ljca_dev *dev, struct ljca_msg *header)
> +{
> +	struct ljca_stub *stub;
> +
> +	stub = ljca_stub_find(dev, header->type);
> +	if (IS_ERR(stub))
> +		return PTR_ERR(stub);
> +
> +	if (!(header->flags & LJCA_ACK_FLAG)) {
> +		ljca_stub_notify(stub, header->cmd, header->data, header->len);
> +		return 0;
> +	}
> +
> +	if (stub->cur_cmd != header->cmd) {
> +		dev_err(&dev->intf->dev, "header and stub current command mismatch (%x vs %x)\n",
> +			header->cmd, stub->cur_cmd);
> +		return -EINVAL;
> +	}
> +
> +	if (stub->ipacket.ibuf && stub->ipacket.ibuf_len) {
> +		unsigned int newlen;
> +
> +		newlen = min_t(unsigned int, header->len, *stub->ipacket.ibuf_len);
> +
> +		*stub->ipacket.ibuf_len = newlen;
> +		memcpy(stub->ipacket.ibuf, header->data, newlen);
> +	}
> +
> +	stub->acked = true;
> +	wake_up(&dev->ack_wq);
> +
> +	return 0;
> +}
> +
> +static int ljca_stub_write(struct ljca_stub *stub, u8 cmd, const void *obuf, unsigned int obuf_len,

Why is obuf a void *?  It's a real structure (or u8 stream), make it so.

> +			   void *ibuf, unsigned int *ibuf_len, bool wait_ack, unsigned long timeout)

Same for ibuf.

> +{
> +	struct ljca_dev *dev = usb_get_intfdata(stub->intf);
> +	u8 flags = LJCA_CMPL_FLAG;
> +	struct ljca_msg *header;
> +	unsigned int msg_len = sizeof(*header) + obuf_len;
> +	int actual;
> +	int ret;
> +
> +	if (msg_len > LJCA_MAX_PACKET_SIZE)
> +		return -EINVAL;
> +
> +	if (wait_ack)
> +		flags |= LJCA_ACK_FLAG;
> +
> +	header = kmalloc(msg_len, GFP_KERNEL);
> +	if (!header)
> +		return -ENOMEM;
> +
> +	header->type = stub->type;
> +	header->cmd = cmd;
> +	header->flags = flags;
> +	header->len = obuf_len;
> +
> +	if (obuf)
> +		memcpy(header->data, obuf, obuf_len);
> +
> +	dev_dbg(&dev->intf->dev, "send: type:%d cmd:%d flags:%d len:%d\n", header->type,
> +		header->cmd, header->flags, header->len);
> +
> +	usb_autopm_get_interface(dev->intf);
> +	if (!dev->started) {
> +		kfree(header);
> +		ret = -ENODEV;
> +		goto error_put;
> +	}
> +
> +	mutex_lock(&dev->mutex);
> +	stub->cur_cmd = cmd;
> +	stub->ipacket.ibuf = ibuf;
> +	stub->ipacket.ibuf_len = ibuf_len;
> +	stub->acked = false;
> +	ret = usb_bulk_msg(dev->udev, usb_sndbulkpipe(dev->udev, dev->out_ep), header, msg_len,
> +			   &actual, LJCA_USB_WRITE_TIMEOUT_MS);
> +	kfree(header);
> +	if (ret) {
> +		dev_err(&dev->intf->dev, "bridge write failed ret:%d\n", ret);
> +		goto error_unlock;
> +	}
> +
> +	if (actual != msg_len) {
> +		dev_err(&dev->intf->dev, "bridge write length mismatch (%d vs %d)\n", msg_len,
> +			actual);
> +		ret = -EINVAL;
> +		goto error_unlock;
> +	}
> +
> +	if (wait_ack) {
> +		ret = wait_event_timeout(dev->ack_wq, stub->acked, msecs_to_jiffies(timeout));
> +		if (!ret) {
> +			dev_err(&dev->intf->dev, "acked wait timeout\n");
> +			ret = -ETIMEDOUT;
> +			goto error_unlock;
> +		}
> +	}
> +
> +	stub->ipacket.ibuf = NULL;
> +	stub->ipacket.ibuf_len = NULL;
> +	ret = 0;
> +error_unlock:
> +	mutex_unlock(&dev->mutex);
> +error_put:
> +	usb_autopm_put_interface(dev->intf);
> +
> +	return ret;
> +}
> +
> +static int ljca_transfer_internal(struct ljca *ljca, u8 cmd, const void *obuf,
> +				  unsigned int obuf_len, void *ibuf, unsigned int *ibuf_len,
> +				  bool wait_ack)
> +{
> +	struct ljca_stub *stub;
> +
> +	stub = ljca_stub_find(ljca->dev, ljca->type);
> +	if (IS_ERR(stub))
> +		return PTR_ERR(stub);
> +
> +	return ljca_stub_write(stub, cmd, obuf, obuf_len, ibuf, ibuf_len, wait_ack,
> +			       LJCA_USB_WRITE_ACK_TIMEOUT_MS);
> +}
> +
> +int ljca_transfer(struct ljca *ljca, u8 cmd, const void *obuf, unsigned int obuf_len, void *ibuf,
> +		  unsigned int *ibuf_len)
> +{
> +	return ljca_transfer_internal(ljca, cmd, obuf, obuf_len, ibuf, ibuf_len, true);
> +}
> +EXPORT_SYMBOL_NS_GPL(ljca_transfer, LJCA);
> +
> +int ljca_transfer_noack(struct ljca *ljca, u8 cmd, const void *obuf, unsigned int obuf_len)
> +{
> +	return ljca_transfer_internal(ljca, cmd, obuf, obuf_len, NULL, NULL, false);
> +}
> +EXPORT_SYMBOL_NS_GPL(ljca_transfer_noack, LJCA);
> +
> +int ljca_register_event_cb(struct ljca *ljca, ljca_event_cb_t event_cb, void *context)

What are these magic events you are registering?  What do they do and
why would anyone need them?

You have global functions here that other drivers are using, yet no
documentation about them at all for any way to review that the api
really is doing what you are wanting it to do.

So again, please split this up into at least 2 changes, and document
this new api you are creating, so that we have a chance to review it
properly.  Otherwise it's almost impossible to do so.

thanks,

greg k-h
