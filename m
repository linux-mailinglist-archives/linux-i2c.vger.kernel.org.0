Return-Path: <linux-i2c+bounces-12225-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5231BB2001E
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 09:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C24A16CCF1
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 07:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D932D94A0;
	Mon, 11 Aug 2025 07:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="r/FMXfei"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053EA2D9496;
	Mon, 11 Aug 2025 07:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754896361; cv=none; b=L80kB6LadkZabzwnLExkBg9HvL6OlYoq2MvNIYgBMwcRcLHrqTcvKp/rsYJbwOhZShW1286UeXB8fWa603BAQGDORMtEA9tiJMK5Ln0EDve4uYlDPEwEe3vezul5Ckwi0fCLXV3tj4uAWB1M6ZkQAzLN25OfoFcbkQk3pxJkyp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754896361; c=relaxed/simple;
	bh=aSi6hSTKboG2tqW/8PJ/XG2VXQ2ohJWh6/2eRJEi33w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oi8JIWawkqN4MM4Py2+J+0oCK3TgibRxHgLSBZV7S6DbhXtX5TnXPrd/jTGj5RlRVrzVAwqF/SjNop43BdIr0ODtVQlK8+6lZcEo58MRmHThF1JAzZvXOE9XvHCrLY183lbpa2ImgpvZ/cqKKFY9JqJhbSedvO4xndqmOzlFJnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=r/FMXfei; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54BEC4CEED;
	Mon, 11 Aug 2025 07:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1754896360;
	bh=aSi6hSTKboG2tqW/8PJ/XG2VXQ2ohJWh6/2eRJEi33w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r/FMXfeiFo+xFZLHNOnLDzSZ7PRgnZGAcIplltnD0f0ltg3xMwxPhjqVuYVEm30Wm
	 JMfwIZUIHG6djjJlL+GCLvpBkHKQlW2odkQ3vePqFDfxXHRpA6FkeRoQNSsh6t6XSW
	 rFcVeaGNNbw+sR6+OENiyNbzSqI77U4VPL53RvkM=
Date: Mon, 11 Aug 2025 09:12:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: misc: Add Intel USBIO bridge driver
Message-ID: <2025081106-could-hazily-3e58@gregkh>
References: <20250809102326.6032-1-hansg@kernel.org>
 <20250809102326.6032-2-hansg@kernel.org>
 <aJmS15MlcHz__S0p@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJmS15MlcHz__S0p@kekkonen.localdomain>

On Mon, Aug 11, 2025 at 06:51:03AM +0000, Sakari Ailus wrote:
> > +/**
> > + * struct usbio_client - represents a usbio client
> > + *
> > + * @adev: auxiliary device object
> > + * @bridge: usbio bridge who service the client
> > + * @link: usbio bridge clients list member
> > + */
> > +struct usbio_client {
> > +	struct auxiliary_device adev;
> > +	struct usbio_device *bridge;
> > +	struct list_head link;
> > +};
> > +
> > +#define adev_to_client(adev) container_of(adev, struct usbio_client, adev)
> 
> Please use a different name than "adev" for the argument, which is also the
> struct field of interest.

Why?  That's a very common way of doing this.  My only complaint is that
it really should be "container_of_const()" instead of just
"container_of()"


> > +static int usbio_ctrl_msg(struct usbio_device *usbio, u8 type, u8 cmd,
> > +			  const void *obuf, u16 obuf_len, void *ibuf, u16 ibuf_len)
> > +{
> > +	u8 request = USB_TYPE_VENDOR | USB_RECIP_DEVICE;
> > +	struct usbio_ctrl_packet *cpkt;
> > +	unsigned int pipe;
> > +	u16 cpkt_len;
> > +	int ret;
> > +
> > +	lockdep_assert_held(&usbio->mutex);
> > +
> > +	if ((obuf_len > (usbio->ctrlbuf_len - sizeof(*cpkt))) ||
> > +	    (ibuf_len > (usbio->ctrlbuf_len - sizeof(*cpkt))))
> 
> You can (and should) remove all parentheses except the outer ones here.

No, don't do that.  If you do that you will have to manually go and try
to remember the order of operations every time you read this code.

Remember, we write code for people first, compilers second.  Make it
totally obvious what is going on here as you want PEOPLE to catch your
issues.

The statement is fine as-is.

> > +		return -EMSGSIZE;
> > +
> > +	/* Prepare Control Packet Header */
> > +	cpkt = usbio->ctrlbuf;
> > +	cpkt->header.type = type;
> > +	cpkt->header.cmd = cmd;
> > +	if (type == USBIO_PKTTYPE_CTRL || ibuf_len)
> > +		cpkt->header.flags = USBIO_PKTFLAGS_REQRESP;
> > +	else
> > +		cpkt->header.flags = USBIO_PKTFLAG_CMP;
> > +	cpkt->len = obuf_len;
> > +
> > +	/* Copy the data */
> > +	memcpy(cpkt->data, obuf, obuf_len);
> > +
> > +	pipe = usb_sndctrlpipe(usbio->udev, usbio->ctrl_pipe);
> > +	cpkt_len = sizeof(*cpkt) + obuf_len;
> > +	ret = usb_control_msg(usbio->udev, pipe, 0, request | USB_DIR_OUT, 0, 0,
> > +			      cpkt, cpkt_len, USBIO_CTRLXFER_TIMEOUT);
> > +	dev_dbg(usbio->dev, "control out %d hdr %*phN data %*phN\n", ret,
> > +		(int)sizeof(*cpkt), cpkt, (int)cpkt->len, cpkt->data);
> 
> Instead of casting, how about using %zu for printing a size_t?
> 
> > +
> > +	if (ret != cpkt_len) {
> > +		dev_err(usbio->dev, "USB control out failed: %d\n", ret);
> > +		return (ret < 0) ? ret : -EPROTO;
> 
> Redundant parentheses.

Nope!  Again, please mat it obvioue.

Actually, I hate ? : lines, this should be:
	if (ret < 0)
		return ret
	else
		return -EPROTO

by spelling it all out.

> > +static int usbio_ctrl_enumgpios(struct usbio_device *usbio)
> > +{
> > +	struct usbio_gpio_bank_desc *gpio = usbio->gpios;
> > +	int ret, i;
> 
> unsigned int i, please.

Nope, 'int' is just fine.  Please see Dan's many rants about why this is
acceptable for loops.

> > +static int usbio_ctrl_enumi2cs(struct usbio_device *usbio)
> > +{
> > +	struct usbio_i2c_bus_desc *i2c = usbio->i2cs;
> > +	int ret, i;
> 
> unsigned int i, please.

Nope, 'int' is fine.

> > +static int usbio_ctrl_enumspis(struct usbio_device *usbio)
> > +{
> > +	struct usbio_spi_bus_desc *spi = usbio->spis;
> > +	int ret, i;
> 
> Ditto.

Nope :)

> > +static void usbio_disconnect(struct usb_interface *intf)
> > +{
> > +	struct usbio_device *usbio = usb_get_intfdata(intf);
> > +	struct usbio_client *client, *prev;
> > +
> > +	list_for_each_entry_safe_reverse(client, prev, &usbio->cli_list, link) {
> > +		auxiliary_device_delete(&client->adev);
> > +		list_del_init(&client->link);
> > +		auxiliary_device_uninit(&client->adev);
> > +	}
> > +
> > +	usb_kill_urb(usbio->urb);
> > +	usb_free_urb(usbio->urb);
> 
> What will happen on client drivers if they're working with the bridge while
> disconnect happens?
> 
> One easy solution to this could be to use an rw_semaphore where client
> acquire it for readingin conjunction (in a helper that also checks the
> interface status) and disconnect callback for writing.

How is that going to change anything?  And how can a disconnect happen?
Isn't this an onboard device?

> > +}
> > +
> > +static int usbio_probe(struct usb_interface *intf, const struct usb_device_id *id)
> > +{
> > +	struct usb_device *udev = interface_to_usbdev(intf);
> > +	struct usb_endpoint_descriptor *ep_in, *ep_out;
> > +	struct device *dev = &intf->dev;
> > +	struct usbio_device *usbio;
> > +	int ret;
> > +
> > +	usbio = devm_kzalloc(dev, sizeof(*usbio), GFP_KERNEL);
> 
> usbio will be released at the exit from usbio_disconnect(). I think you'll
> need to use a release callback in struct device to release usbio once all
> clients are gone.

Which clients?  The disconnect will cause that to happen, it can not
happen at the same time probe is called.

> > +		uid = acpi_device_uid(adev);
> > +		if (uid)
> > +			for (int i = 0; i < strlen(uid); i++)
> 
> size_t i?

Ick, no, "int" is fine.

thanks,

greg k-h

