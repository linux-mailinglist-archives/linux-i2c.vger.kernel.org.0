Return-Path: <linux-i2c+bounces-12229-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ECBB202F5
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 11:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3135165952
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 09:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC442DE6F7;
	Mon, 11 Aug 2025 09:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0qTZYBe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7616F2DCF7E;
	Mon, 11 Aug 2025 09:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754903602; cv=none; b=F29ck4GASBHImCdGJQe4IVPzexNVii4+Jut/Z20CLZp1GYBJ3Cpiv0L+yF6aEIPAk0G32Jo+Uby9TBuQ1wdYxGePPpuDYv16agOu9730bn7Tbl5DmJx6vTS4Jj62aflbOdrmvupinTY18zg0Qbxs4zD9BE5c/8NyjptxXPzSXPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754903602; c=relaxed/simple;
	bh=+ue2utxDvB8ir6rhiQTHNoQOLB8cyQluaLyC3Ir3NUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q4tWRj5V4d7ipYFpbqjjiQUGDnXCD+CouKrjwlod1GzjvzSQzvIr7vsBdP4osWmpGIYDDDyV6jBiKSVXXLeBclEP1BWzF9rKXG1KyoOQHQmDHU/LT6g4osDnB5O/X5GrY6ilpW9YD12JoBnzLHxaFRZ98vRJZu522uf3/q8xNp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0qTZYBe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663F3C4CEED;
	Mon, 11 Aug 2025 09:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754903601;
	bh=+ue2utxDvB8ir6rhiQTHNoQOLB8cyQluaLyC3Ir3NUU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i0qTZYBeqV/TkU14mwMkWh9Cncf+V14oqT64r6kNXig43U10M+KWBrqmSckG9bVMy
	 Kjv44iiT0olF4ELDnVcodeWhPvR+/yes8ls7mJglLvrp7ZhITl23Xv4Nf34LJe6Q4z
	 XxINToC/zOr9/G/t9T19xS19Q/2KLKtyswnkca1zqw41Zu7XMD3AbTtkMmHdlthKXa
	 NuQZk43EibUAsJKgnOcCgg9fs80im47RrDXXp9epXn6/OiQoFAo4IillRlSZfSFL+h
	 hsqCWNkh+Dua4DgPhNyp4mNtmn2zd+XQZR7Y5PgC5sXPArRAc7MxcaiAW5puHKxjq4
	 uqOV6bhLReBdA==
Message-ID: <1e70aa9c-2bce-4c64-ba62-48006022efd4@kernel.org>
Date: Mon, 11 Aug 2025 11:13:16 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] usb: misc: Add Intel USBIO bridge driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250809102326.6032-1-hansg@kernel.org>
 <20250809102326.6032-2-hansg@kernel.org>
 <aJmS15MlcHz__S0p@kekkonen.localdomain>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aJmS15MlcHz__S0p@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 11-Aug-25 8:51 AM, Sakari Ailus wrote:
> Hi Hans,
> 
> Thanks for posting this. Some comments below...
> 
> On Sat, Aug 09, 2025 at 12:23:24PM +0200, Hans de Goede wrote:
>> From: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>>
>> Add a driver for the Intel USBIO USB IO-expander used by the MIPI cameras
>> on various new (Meteor Lake and later) Intel laptops.
>>
>> This is an USB bridge driver which adds auxbus child devices for the GPIO,
>> I2C and SPI functions of the USBIO chip and which exports IO-functions for
>> the drivers for the auxbus child devices to communicate with the USBIO
>> device's firmware.
>>
>> Co-developed-by: Hans de Goede <hansg@kernel.org>
>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>> Signed-off-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>> ---
>>  MAINTAINERS               |   7 +
>>  drivers/usb/misc/Kconfig  |  14 +
>>  drivers/usb/misc/Makefile |   1 +
>>  drivers/usb/misc/usbio.c  | 693 ++++++++++++++++++++++++++++++++++++++
>>  include/linux/usb/usbio.h | 168 +++++++++
>>  5 files changed, 883 insertions(+)
>>  create mode 100644 drivers/usb/misc/usbio.c
>>  create mode 100644 include/linux/usb/usbio.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 0618351510ad..1208efe41f9f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -12518,6 +12518,13 @@ S:	Maintained
>>  F:	Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
>>  F:	drivers/platform/x86/intel/uncore-frequency/
>>  
>> +INTEL USBIO USB I/O EXPANDER DRIVERS
>> +M:	Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>> +M:	Hans de Goede <hansg@kernel.org>
> 
> Could you add:
> 
> R:	Sakari Ailus <sakari.ailus@linux.intel.com>

Ack.

> 
> ?
> 
>> +S:	Maintained
>> +F:	drivers/usb/misc/usbio.c
>> +F:	include/linux/usb/usbio.h
>> +
>>  INTEL VENDOR SPECIFIC EXTENDED CAPABILITIES DRIVER
>>  M:	David E. Box <david.e.box@linux.intel.com>
>>  S:	Supported

...

>> diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
>> new file mode 100644
>> index 000000000000..88197092f39a
>> --- /dev/null
>> +++ b/drivers/usb/misc/usbio.c

...

>> +/**
>> + * struct usbio_client - represents a usbio client
>> + *
>> + * @adev: auxiliary device object
>> + * @bridge: usbio bridge who service the client
>> + * @link: usbio bridge clients list member
>> + */
>> +struct usbio_client {
>> +	struct auxiliary_device adev;
>> +	struct usbio_device *bridge;
>> +	struct list_head link;
>> +};
>> +
>> +#define adev_to_client(adev) container_of(adev, struct usbio_client, adev)
> 
> Please use a different name than "adev" for the argument, which is also the
> struct field of interest.

As gkh mentioned doing things this way is quite normal.

>> +
>> +static int usbio_ctrl_msg(struct usbio_device *usbio, u8 type, u8 cmd,
>> +			  const void *obuf, u16 obuf_len, void *ibuf, u16 ibuf_len)
>> +{
>> +	u8 request = USB_TYPE_VENDOR | USB_RECIP_DEVICE;
>> +	struct usbio_ctrl_packet *cpkt;
>> +	unsigned int pipe;
>> +	u16 cpkt_len;
>> +	int ret;
>> +
>> +	lockdep_assert_held(&usbio->mutex);
>> +
>> +	if ((obuf_len > (usbio->ctrlbuf_len - sizeof(*cpkt))) ||
>> +	    (ibuf_len > (usbio->ctrlbuf_len - sizeof(*cpkt))))
> 
> You can (and should) remove all parentheses except the outer ones here.

I disagree, even not very experienced C-programmer can read the above,
wile it takes a really experienced programmer to read it without
parentheses. Even I after C-programming for 30 years still need to
look up the operator order sometimes...

> 
>> +		return -EMSGSIZE;
>> +
>> +	/* Prepare Control Packet Header */
>> +	cpkt = usbio->ctrlbuf;
>> +	cpkt->header.type = type;
>> +	cpkt->header.cmd = cmd;
>> +	if (type == USBIO_PKTTYPE_CTRL || ibuf_len)
>> +		cpkt->header.flags = USBIO_PKTFLAGS_REQRESP;
>> +	else
>> +		cpkt->header.flags = USBIO_PKTFLAG_CMP;
>> +	cpkt->len = obuf_len;
>> +
>> +	/* Copy the data */
>> +	memcpy(cpkt->data, obuf, obuf_len);
>> +
>> +	pipe = usb_sndctrlpipe(usbio->udev, usbio->ctrl_pipe);
>> +	cpkt_len = sizeof(*cpkt) + obuf_len;
>> +	ret = usb_control_msg(usbio->udev, pipe, 0, request | USB_DIR_OUT, 0, 0,
>> +			      cpkt, cpkt_len, USBIO_CTRLXFER_TIMEOUT);
>> +	dev_dbg(usbio->dev, "control out %d hdr %*phN data %*phN\n", ret,
>> +		(int)sizeof(*cpkt), cpkt, (int)cpkt->len, cpkt->data);
> 
> Instead of casting, how about using %zu for printing a size_t?

Ack.

>> +
>> +	if (ret != cpkt_len) {
>> +		dev_err(usbio->dev, "USB control out failed: %d\n", ret);
>> +		return (ret < 0) ? ret : -EPROTO;
> 
> Redundant parentheses.

Disagree, see above.

> 
>> +	}
>> +
>> +	if (!(cpkt->header.flags & USBIO_PKTFLAG_ACK))
>> +		return 0;
>> +
>> +	pipe = usb_rcvctrlpipe(usbio->udev, usbio->ctrl_pipe);
>> +	cpkt_len = sizeof(*cpkt) + ibuf_len;
>> +	ret = usb_control_msg(usbio->udev, pipe, 0, request | USB_DIR_IN, 0, 0,
>> +			      cpkt, cpkt_len, USBIO_CTRLXFER_TIMEOUT);
>> +	dev_dbg(usbio->dev, "control in %d hdr %*phN data %*phN\n", ret,
>> +		(int)sizeof(*cpkt), cpkt, (int)cpkt->len, cpkt->data);
>> +
>> +	if (ret < sizeof(*cpkt)) {
>> +		dev_err(usbio->dev, "USB control in failed: %d\n", ret);
>> +		return (ret < 0) ? ret : -EPROTO;
> 
> Remove parentheses? There's no need to try to comply with MISRA C, is
> there? :-) I'm not commenting anymore on further instances of this.
> 
>> +	}
>> +
>> +	if (cpkt->header.type != type || cpkt->header.cmd != cmd ||
>> +	    !(cpkt->header.flags & USBIO_PKTFLAG_RSP)) {
>> +		dev_err(usbio->dev, "Unexpected reply type: %u, cmd: %u, flags: %u\n",
>> +			cpkt->header.type, cpkt->header.cmd, cpkt->header.flags);
>> +		return -EPROTO;
>> +	}
>> +
>> +	if (cpkt->header.flags & USBIO_PKTFLAG_ERR)
>> +		return -EREMOTEIO;
>> +
>> +	if (ibuf_len < cpkt->len)
>> +		return -ENOSPC;
>> +
>> +	memcpy(ibuf, cpkt->data, cpkt->len);
> 
> It'd be nice to have one more newline here.

Ack.

>> +	return cpkt->len;
>> +}
>> +
>> +int usbio_control_msg(struct auxiliary_device *adev, u8 type, u8 cmd,
>> +		      const void *obuf, u16 obuf_len, void *ibuf, u16 ibuf_len)
>> +{
>> +	struct usbio_client *client = adev_to_client(adev);
>> +	int ret;
>> +
>> +	ret = usbio_acquire(adev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = usbio_ctrl_msg(client->bridge, type, cmd, obuf, obuf_len, ibuf, ibuf_len);
>> +
>> +	usbio_release(adev);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(usbio_control_msg, "USBIO");
>> +
>> +static void usbio_bulk_recv(struct urb *urb)
>> +{
>> +	struct usbio_bulk_packet *bpkt = urb->transfer_buffer;
>> +	struct usbio_device *usbio = urb->context;
>> +
>> +	if (!urb->status) {
>> +		if (bpkt->header.flags & USBIO_PKTFLAG_RSP) {
>> +			usbio->rxdat_len = urb->actual_length;
>> +			complete(&usbio->done);
>> +		}
>> +	} else if (urb->status != -ENOENT) {
>> +		dev_err(usbio->dev, "Bulk in error %d\n", urb->status);
>> +	}
>> +
>> +	usb_submit_urb(usbio->urb, GFP_ATOMIC);
>> +}
>> +
>> +int usbio_bulk_msg(struct auxiliary_device *adev, u8 type, u8 cmd, bool last,
>> +		   const void *obuf, u16 obuf_len, void *ibuf, u16 ibuf_len)
>> +{
>> +	struct usbio_device *usbio = adev_to_client(adev)->bridge;
>> +	struct usbio_bulk_packet *bpkt;
>> +	int ret, act;
>> +	u16 bpkt_len;
>> +
>> +	lockdep_assert_held(&usbio->mutex);
>> +
>> +	if ((obuf_len > (usbio->txbuf_len - sizeof(*bpkt))) ||
>> +	    (ibuf_len > (usbio->txbuf_len - sizeof(*bpkt))))
>> +		return -EMSGSIZE;
>> +
>> +	if (ibuf_len)
>> +		reinit_completion(&usbio->done);
>> +
>> +	/* If no data to send, skip to read */
>> +	if (!obuf_len)
>> +		goto read;
>> +
>> +	/* Prepare Bulk Packet Header */
>> +	bpkt = usbio->txbuf;
>> +	bpkt->header.type = type;
>> +	bpkt->header.cmd = cmd;
>> +	if (!last)
>> +		bpkt->header.flags = 0;
>> +	else if (ibuf_len)
>> +		bpkt->header.flags = USBIO_PKTFLAGS_REQRESP;
>> +	else
>> +		bpkt->header.flags = USBIO_PKTFLAG_CMP;
>> +	bpkt->len = obuf_len;
>> +
>> +	/* Copy the data */
>> +	memcpy(bpkt->data, obuf, obuf_len);
>> +
>> +	bpkt_len = sizeof(*bpkt) + obuf_len;
>> +	ret = usb_bulk_msg(usbio->udev, usbio->tx_pipe, bpkt, bpkt_len, &act,
>> +			   USBIO_BULKXFER_TIMEOUT);
>> +	dev_dbg(usbio->dev, "bulk out %d hdr %*phN data %*phN\n", act,
>> +		(int)sizeof(*bpkt), bpkt, (int)bpkt->len, bpkt->data);
>> +
>> +	if (ret || act != bpkt_len) {
>> +		dev_err(usbio->dev, "Bulk out failed: %d\n", ret);
>> +		return ret ?: -EPROTO;
>> +	}
>> +
>> +	if (!(bpkt->header.flags & USBIO_PKTFLAG_ACK))
>> +		return obuf_len;
>> +
>> +read:
>> +	ret = wait_for_completion_timeout(&usbio->done, USBIO_BULKXFER_TIMEOUT);
>> +	if (ret <= 0) {
>> +		dev_err(usbio->dev, "Bulk in wait failed: %d\n", ret);
>> +		return ret ?: -ETIMEDOUT;
>> +	}
>> +
>> +	act = usbio->rxdat_len;
>> +	bpkt = usbio->rxbuf;
>> +	dev_dbg(usbio->dev, "bulk in %d hdr %*phN data %*phN\n", act,
>> +		(int)sizeof(*bpkt), bpkt, (int)bpkt->len, bpkt->data);
> 
> %zu, please.

Ack.

>> +
>> +	/*
>> +	 * Unsupported bulk commands get only an usbio_packet_header with
>> +	 * the error flag set as reply. Return -EPIPE for this case.
>> +	 */
>> +	if (act == sizeof(struct usbio_packet_header) &&
>> +	    (bpkt->header.flags & USBIO_PKTFLAG_ERR))
>> +		return -EPIPE;
>> +
>> +	if (act < sizeof(*bpkt)) {
>> +		dev_err(usbio->dev, "Bulk in short read: %d\n", act);
>> +		return -EPROTO;
>> +	}
>> +
>> +	if (bpkt->header.type != type || bpkt->header.cmd != cmd ||
>> +	    !(bpkt->header.flags & USBIO_PKTFLAG_RSP)) {
>> +		dev_err(usbio->dev,
>> +			"Unexpected bulk in type 0x%02x cmd 0x%02x flags 0x%02x\n",
>> +			bpkt->header.type, bpkt->header.cmd, bpkt->header.flags);
>> +		return -EPROTO;
>> +	}
>> +
>> +	if (bpkt->header.flags & USBIO_PKTFLAG_ERR)
>> +		return -EREMOTEIO;
>> +
>> +	if (ibuf_len < bpkt->len)
>> +		return -ENOSPC;
>> +
>> +	memcpy(ibuf, bpkt->data, bpkt->len);
> 
> One more newline, perhaps?

Ack.

>> +	return bpkt->len;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(usbio_bulk_msg, "USBIO");
>> +
>> +static int usbio_get_and_lock(struct usbio_device *usbio)
>> +{
>> +	int ret;
>> +
>> +	ret = usb_autopm_get_interface(usbio->intf);
>> +	if (ret)
>> +		return ret;
>> +
>> +	mutex_lock(&usbio->mutex);
>> +	return 0;
>> +}
>> +
>> +static void usbio_unlock_and_put(struct usbio_device *usbio)
>> +{
>> +	mutex_unlock(&usbio->mutex);
>> +	usb_autopm_put_interface(usbio->intf);
>> +}
>> +
>> +int usbio_acquire(struct auxiliary_device *adev)
>> +{
>> +	return usbio_get_and_lock(adev_to_client(adev)->bridge);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(usbio_acquire, "USBIO");
>> +
>> +void usbio_release(struct auxiliary_device *adev)
>> +{
>> +	usbio_unlock_and_put(adev_to_client(adev)->bridge);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(usbio_release, "USBIO");
>> +
>> +void usbio_get_txrxbuf_len(struct auxiliary_device *adev, u16 *txbuf_len, u16 *rxbuf_len)
>> +{
>> +	struct usbio_device *usbio = adev_to_client(adev)->bridge;
>> +
>> +	*txbuf_len = usbio->txbuf_len;
>> +	*rxbuf_len = usbio->rxbuf_len;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(usbio_get_txrxbuf_len, "USBIO");
>> +
>> +static void usbio_auxdev_release(struct device *dev)
>> +{
>> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
>> +	struct usbio_client *client = adev_to_client(adev);
>> +
>> +	kfree(client);
>> +}
>> +
>> +static int usbio_add_client(struct usbio_device *usbio, char *name, u8 id, void *data)
>> +{
>> +	struct usbio_client *client;
>> +	struct auxiliary_device *adev;
>> +	int ret;
>> +
>> +	client = kzalloc(sizeof(*client), GFP_KERNEL);
>> +	if (!client)
>> +		return -ENOMEM;
>> +
>> +	client->bridge = usbio;
>> +	adev = &client->adev;
>> +	adev->name = name;
>> +	adev->id = id;
>> +
>> +	adev->dev.parent = usbio->dev;
>> +	adev->dev.platform_data = data;
>> +	adev->dev.release = usbio_auxdev_release;
>> +
>> +	ret = auxiliary_device_init(adev);
>> +	if (!ret) {
>> +		if (auxiliary_device_add(adev))
>> +			auxiliary_device_uninit(adev);
> 
> This isn't enough for error handling if auxiliary_device_add() fails.

Ack, I spotted this myself already but I somehow forgot to
make a note to fix this, so this slipped through.

> 
>> +	}
>> +
>> +	if (ret) {
>> +		dev_err(usbio->dev, "Client %s.%d add failed: %d\n", name, id, ret);
>> +		kfree(client);
>> +		return ret;
>> +	}
>> +
>> +	list_add_tail(&client->link, &usbio->cli_list);
> 
> A newline, please?

Ack.

>> +	return 0;
>> +}
>> +
>> +static int usbio_ctrl_enumgpios(struct usbio_device *usbio)
>> +{
>> +	struct usbio_gpio_bank_desc *gpio = usbio->gpios;
>> +	int ret, i;
> 
> unsigned int i, please.

Since there are conflicting opinions on this I'm going to
keep this as is.

>> +
>> +	ret = usbio_ctrl_msg(usbio, USBIO_PKTTYPE_CTRL, USBIO_CTRLCMD_ENUMGPIO, NULL, 0,
>> +			     gpio, sizeof(usbio->gpios));
>> +	if (ret < 0 || ret % sizeof(*gpio)) {
>> +		dev_err(usbio->dev, "CTRL ENUMGPIO failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	usbio->nr_gpio_banks = ret / sizeof(*gpio);
>> +	dev_dbg(usbio->dev, "GPIO Banks: %d\n", usbio->nr_gpio_banks);
>> +	for (i = 0; i < usbio->nr_gpio_banks; i++)
>> +		dev_dbg(usbio->dev, "\tBank%d[%d] map: %#08x\n",
>> +			gpio[i].id, gpio[i].pins, gpio[i].bmap);
>> +
>> +	usbio_add_client(usbio, USBIO_GPIO_CLIENT, 0, gpio);
> 
> One more newline?

Sure.

>> +	return 0;
>> +}
>> +
>> +static int usbio_ctrl_enumi2cs(struct usbio_device *usbio)
>> +{
>> +	struct usbio_i2c_bus_desc *i2c = usbio->i2cs;
>> +	int ret, i;
> 
> unsigned int i, please.
> 
>> +
>> +	ret = usbio_ctrl_msg(usbio, USBIO_PKTTYPE_CTRL, USBIO_CTRLCMD_ENUMI2C, NULL, 0,
>> +			     i2c, sizeof(usbio->i2cs));
>> +	if (ret < 0 || ret % sizeof(*i2c)) {
>> +		dev_err(usbio->dev, "CTRL ENUMI2C failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	usbio->nr_i2c_buses = ret / sizeof(*i2c);
>> +	dev_dbg(usbio->dev, "I2C Busses: %d\n", usbio->nr_i2c_buses);
>> +	for (i = 0; i < usbio->nr_i2c_buses; i++) {
>> +		dev_dbg(usbio->dev, "\tBus%d caps: %#02x\n", i2c[i].id, i2c[i].caps);
>> +		usbio_add_client(usbio, USBIO_I2C_CLIENT, i, &i2c[i]);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int usbio_ctrl_enumspis(struct usbio_device *usbio)
>> +{
>> +	struct usbio_spi_bus_desc *spi = usbio->spis;
>> +	int ret, i;
> 
> Ditto.
> 
>> +
>> +	ret = usbio_ctrl_msg(usbio, USBIO_PKTTYPE_CTRL, USBIO_CTRLCMD_ENUMSPI, NULL, 0,
>> +			     spi, sizeof(usbio->spis));
>> +	if (ret < 0 || ret % sizeof(*spi)) {
>> +		dev_err(usbio->dev, "CTRL ENUMSPI failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	usbio->nr_spi_buses = ret / sizeof(*spi);
>> +	dev_dbg(usbio->dev, "SPI Busses: %d\n", usbio->nr_spi_buses);
>> +	for (i = 0; i < usbio->nr_spi_buses; i++)
>> +		dev_dbg(usbio->dev, "\tBus%d caps: %#02x\n", spi[i].id, spi[i].caps);
>> +
>> +	return 0;
>> +}
>> +
>> +static int usbio_suspend(struct usb_interface *intf, pm_message_t msg)
>> +{
>> +	struct usbio_device *usbio = usb_get_intfdata(intf);
>> +
>> +	usb_kill_urb(usbio->urb);
>> +
>> +	return 0;
>> +}
>> +
>> +static int usbio_resume(struct usb_interface *intf)
>> +{
>> +	struct usbio_device *usbio = usb_get_intfdata(intf);
>> +
>> +	return usb_submit_urb(usbio->urb, GFP_KERNEL);
>> +}
>> +
>> +static void usbio_disconnect(struct usb_interface *intf)
>> +{
>> +	struct usbio_device *usbio = usb_get_intfdata(intf);
>> +	struct usbio_client *client, *prev;
>> +
>> +	list_for_each_entry_safe_reverse(client, prev, &usbio->cli_list, link) {
>> +		auxiliary_device_delete(&client->adev);
>> +		list_del_init(&client->link);
>> +		auxiliary_device_uninit(&client->adev);
>> +	}
>> +
>> +	usb_kill_urb(usbio->urb);
>> +	usb_free_urb(usbio->urb);
> 
> What will happen on client drivers if they're working with the bridge while
> disconnect happens?

All clients will have their remove() function called. If clients
somehow need to have some userspace-api related bits stick around
longer they will need to handle that themselves. Clients are no longer
allowed to call an usbio_*() functions after having their remove()
function called.

> One easy solution to this could be to use an rw_semaphore where client
> acquire it for readingin conjunction (in a helper that also checks the
> interface status) and disconnect callback for writing.

That is not necessary.

One thing which should be done here is set a disconnected flag to make new
usbio_*() calls fail immediately and signal the "done" completion to wakeup
any waiters, something like this:

static void usbio_disconnect(struct usb_interface *intf)
{
	struct usbio_device *usbio = usb_get_intfdata(intf);
	struct usbio_client *client, *prev;

	list_for_each_entry(client, &usbio->cli_list, link)
		client->disconnected = true;

	complete(&usbio->done);

	/* Ensure all clients see the disconnect flag */
	mutex_lock(&usbio->mutex);
	mutex_unlock(&usbio->mutex);

	/* From here on clients will no longer touch struct usbio_device */
	usb_kill_urb(usbio->urb);
	usb_free_urb(usbio->urb);

	list_for_each_entry_safe_reverse(client, prev, &usbio->cli_list, link) {
		auxiliary_device_delete(&client->adev);
		list_del_init(&client->link);
		auxiliary_device_uninit(&client->adev);
	}
}

Combined with checking client->disconnected in entry points
and after waiting for the completion.

This will even allow the client to keep the struct auxdev
around by keeping a reference and it will even be safe for
the client to make usbio_*() calls on the auxdev since as
long as the reference is there the memory of the usbio_client
which embeds the auxdev will stick around and the disconnected
flag will ensure this is safe. Note client drivers really should
not do that though!





	

> 
>> +}
>> +
>> +static int usbio_probe(struct usb_interface *intf, const struct usb_device_id *id)
>> +{
>> +	struct usb_device *udev = interface_to_usbdev(intf);
>> +	struct usb_endpoint_descriptor *ep_in, *ep_out;
>> +	struct device *dev = &intf->dev;
>> +	struct usbio_device *usbio;
>> +	int ret;
>> +
>> +	usbio = devm_kzalloc(dev, sizeof(*usbio), GFP_KERNEL);
> 
> usbio will be released at the exit from usbio_disconnect(). I think you'll
> need to use a release callback in struct device to release usbio once all
> clients are gone.

This is fine, see above it is up to the client drivers to no longer
call any usbio_*() also for v2 I'll make all the public usbio_*()
functions test client->disconnected and then they will never deref
client->bridge.

> 
>> +	if (!usbio)
>> +		return -ENOMEM;
>> +
>> +	ret = devm_mutex_init(dev, &usbio->mutex);
>> +	if (ret)
>> +		return ret;
>> +
>> +	usbio->dev = dev;
>> +	usbio->udev = udev;
>> +	usbio->intf = intf;
>> +	init_completion(&usbio->done);
>> +	INIT_LIST_HEAD(&usbio->cli_list);
>> +	usb_set_intfdata(intf, usbio);
>> +
>> +	usbio->ctrl_pipe = usb_endpoint_num(&udev->ep0.desc);
>> +	usbio->ctrlbuf_len = usb_maxpacket(udev, usbio->ctrl_pipe);
>> +	usbio->ctrlbuf = devm_kzalloc(dev, usbio->ctrlbuf_len, GFP_KERNEL);
>> +	if (!usbio->ctrlbuf)
>> +		return -ENOMEM;
>> +
>> +	/* Find the first bulk-in and bulk-out endpoints */
>> +	ret = usb_find_common_endpoints(intf->cur_altsetting, &ep_in, &ep_out,
>> +					NULL, NULL);
>> +	if (ret) {
>> +		dev_err(dev, "Cannot find bulk endpoints: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	usbio->tx_pipe = usb_sndbulkpipe(udev, usb_endpoint_num(ep_out));
>> +	usbio->txbuf_len = usb_endpoint_maxp(ep_out);
>> +	usbio->txbuf = devm_kzalloc(dev, usbio->txbuf_len, GFP_KERNEL);
>> +	if (!usbio->txbuf)
>> +		return -ENOMEM;
>> +
>> +	usbio->rx_pipe = usb_rcvbulkpipe(udev, usb_endpoint_num(ep_in));
>> +	usbio->rxbuf_len = usb_endpoint_maxp(ep_in);
>> +	usbio->rxbuf = devm_kzalloc(dev, usbio->rxbuf_len, GFP_KERNEL);
>> +	if (!usbio->rxbuf)
>> +		return -ENOMEM;
>> +
>> +	usbio->urb = usb_alloc_urb(0, GFP_KERNEL);
>> +	if (!usbio->urb)
>> +		return -ENOMEM;
>> +
>> +	usb_fill_bulk_urb(usbio->urb, udev, usbio->rx_pipe, usbio->rxbuf,
>> +			  usbio->rxbuf_len, usbio_bulk_recv, usbio);
>> +	ret = usb_submit_urb(usbio->urb, GFP_KERNEL);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Submitting usb urb\n");
>> +
>> +	ret = usbio_get_and_lock(usbio);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = usbio_ctrl_msg(usbio, USBIO_PKTTYPE_CTRL, USBIO_CTRLCMD_HS, NULL, 0, NULL, 0);
>> +	if (ret < 0)
>> +		goto error;
>> +
>> +	ret = usbio_ctrl_msg(usbio, USBIO_PKTTYPE_CTRL, USBIO_CTRLCMD_PROTVER, NULL, 0,
>> +			     &usbio->info.protver, sizeof(struct usbio_protver));
>> +	if (ret < 0)
>> +		goto error;
>> +
>> +	ret = usbio_ctrl_msg(usbio, USBIO_PKTTYPE_CTRL, USBIO_CTRLCMD_FWVER, NULL, 0,
>> +			     &usbio->info.fwver, sizeof(struct usbio_fwver));
>> +	if (ret < 0)
>> +		goto error;
>> +
>> +	dev_dbg(dev, "ProtVer(BCD): %02x FwVer: %d.%d.%d.%d\n",
>> +		usbio->info.protver.ver, usbio->info.fwver.major,
>> +		usbio->info.fwver.minor, usbio->info.fwver.patch,
>> +		usbio->info.fwver.build);
>> +
>> +	usbio_ctrl_enumgpios(usbio);
>> +	usbio_ctrl_enumi2cs(usbio);
>> +	usbio_ctrl_enumspis(usbio);
>> +	usbio_unlock_and_put(usbio);
> 
> A newline here?

Sure.

> 
>> +	return 0;
>> +
>> +error:
>> +	usbio_unlock_and_put(usbio);
>> +	usbio_disconnect(intf);
> 
> Ditto.

Sure.

> 
>> +	return ret;
>> +}
>> +
>> +static const struct usb_device_id usbio_table[] = {
>> +	{ USB_DEVICE(0x2AC1, 0x20C1) }, /* Lattice NX40 */
>> +	{ USB_DEVICE(0x2AC1, 0x20C9) }, /* Lattice NX33 */
>> +	{ USB_DEVICE(0x2AC1, 0x20CB) }, /* Lattice NX33U */
>> +	{ USB_DEVICE(0x06CB, 0x0701) }, /* Synaptics Sabre */
> 
> Lower case hexadecimals would be nice.

Ack.

> 
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(usb, usbio_table);
>> +
>> +static struct usb_driver usbio_driver = {
>> +	.name = "usbio-bridge",
>> +	.probe = usbio_probe,
>> +	.disconnect = usbio_disconnect,
>> +	.suspend = usbio_suspend,
>> +	.resume = usbio_resume,
>> +	.id_table = usbio_table,
>> +	.supports_autosuspend = 1
> 
> Add the leading comma perhaps?

Ack.

> 
>> +};
>> +module_usb_driver(usbio_driver);
>> +
>> +struct usbio_match_ids_walk_data {
>> +	struct acpi_device *adev;
>> +	const struct acpi_device_id *hids;
>> +	const u8 id;
>> +};
>> +
>> +static int usbio_match_device_ids(struct acpi_device *adev, void *data)
>> +{
>> +	struct usbio_match_ids_walk_data *wd = data;
>> +	unsigned int id = 0;
>> +	char *uid;
>> +
>> +	if (!acpi_match_device_ids(adev, wd->hids)) {
> 
> You could return here if acpi_match_device_ids() returns non-zero and
> unindent the rest.

Ack.

> 
>> +		uid = acpi_device_uid(adev);
>> +		if (uid)
>> +			for (int i = 0; i < strlen(uid); i++)
> 
> size_t i?

No, see other discussion about this.

>> +				if (!kstrtouint(&uid[i], 10, &id))
>> +					break;
>> +
>> +		if (!uid || (uid && wd->id == (u8)id)) {
>> +			wd->adev = adev;
>> +			return 1;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +

...

Regards,

Hans





