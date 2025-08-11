Return-Path: <linux-i2c+bounces-12228-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 136ECB201DC
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 10:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02AF1189EBAA
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 08:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070CD29E118;
	Mon, 11 Aug 2025 08:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LCC2Dtly"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43941684AC;
	Mon, 11 Aug 2025 08:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754901086; cv=none; b=HJ7mWulCC+pow7h+rD+eqqjFE8d44uL6CYAskwz3dXN0f0WRNj4W3VXPS5Q5WFKF8w9q+rpg4TLgAoOkRiL0b9DEO5fsYqIGF52GOdv0vzIc71j/YEfeDeU3xuLSrmDTjJmNnUWZcBrezE93HC6NAIajaeH94Ec9TjXtAOJ1YoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754901086; c=relaxed/simple;
	bh=PB4zZJ/YnS3AMxJMXuTo7WLuLuImZf5hC8F6sXCA0Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4Npb8AAY9X0yJx/2RpsKem5l3e2f0OMoWie6hREwSv6LPDAo7J4zNiZD4HhsUkMrhxEZKLAe10EBr6YkRPFe9cF04+uubJ3kXCjB+zO2iYxLgaCCFatbT8OAx0yygPrwAwg2H6BW3y9h+7+4kuSjN6q6rZqdxu38AMN7miuAhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LCC2Dtly; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45CFC4CEED;
	Mon, 11 Aug 2025 08:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1754901086;
	bh=PB4zZJ/YnS3AMxJMXuTo7WLuLuImZf5hC8F6sXCA0Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LCC2DtlyqjoIiouffiphm51uPRqqI1+SFn0yh+l4B2+um3AIwBLl7MNyYwanpfNs5
	 oTAXoIUsQS2rIVDAPbLvPEn7zKqAOnD0FUD6LFkSWT9im8jCCNU75g/dHNjtdlqeQ3
	 UBbBy0GuKfGNVM8Eew6attsTzWa0uHM8tutAO7YQ=
Date: Mon, 11 Aug 2025 10:31:22 +0200
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
Message-ID: <2025081128-ecard-ecosphere-8170@gregkh>
References: <20250809102326.6032-1-hansg@kernel.org>
 <20250809102326.6032-2-hansg@kernel.org>
 <aJmS15MlcHz__S0p@kekkonen.localdomain>
 <2025081106-could-hazily-3e58@gregkh>
 <aJmb4ZoUrnNTpM2W@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJmb4ZoUrnNTpM2W@kekkonen.localdomain>

On Mon, Aug 11, 2025 at 07:29:37AM +0000, Sakari Ailus wrote:
> Hi Greg,
> 
> On Mon, Aug 11, 2025 at 09:12:36AM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Aug 11, 2025 at 06:51:03AM +0000, Sakari Ailus wrote:
> > > > +/**
> > > > + * struct usbio_client - represents a usbio client
> > > > + *
> > > > + * @adev: auxiliary device object
> > > > + * @bridge: usbio bridge who service the client
> > > > + * @link: usbio bridge clients list member
> > > > + */
> > > > +struct usbio_client {
> > > > +	struct auxiliary_device adev;
> > > > +	struct usbio_device *bridge;
> > > > +	struct list_head link;
> > > > +};
> > > > +
> > > > +#define adev_to_client(adev) container_of(adev, struct usbio_client, adev)
> > > 
> > > Please use a different name than "adev" for the argument, which is also the
> > > struct field of interest.
> > 
> > Why?  That's a very common way of doing this.  My only complaint is that
> > it really should be "container_of_const()" instead of just
> > "container_of()"
> 
> Because the struct field has the same name. The macro isn't intended for
> obtaining the container struct based on any field in the struct, only the
> field called "adev".

And that's fine, the macro works like this, so all should be ok.

> I'll post a patch to add the container_of() check to checkpatch.pl.

Patch to add it to do what?

> > > > +static int usbio_ctrl_msg(struct usbio_device *usbio, u8 type, u8 cmd,
> > > > +			  const void *obuf, u16 obuf_len, void *ibuf, u16 ibuf_len)
> > > > +{
> > > > +	u8 request = USB_TYPE_VENDOR | USB_RECIP_DEVICE;
> > > > +	struct usbio_ctrl_packet *cpkt;
> > > > +	unsigned int pipe;
> > > > +	u16 cpkt_len;
> > > > +	int ret;
> > > > +
> > > > +	lockdep_assert_held(&usbio->mutex);
> > > > +
> > > > +	if ((obuf_len > (usbio->ctrlbuf_len - sizeof(*cpkt))) ||
> > > > +	    (ibuf_len > (usbio->ctrlbuf_len - sizeof(*cpkt))))
> > > 
> > > You can (and should) remove all parentheses except the outer ones here.
> > 
> > No, don't do that.  If you do that you will have to manually go and try
> > to remember the order of operations every time you read this code.
> 
> I presume kernel developers in general do.
> 
> But if in doubt: <URL:https://users.ece.utexas.edu/~adnan/c-refcard.pdf>.

Don't force me to look it up all the time, use () to make it obvious
please.  That's the biggest thing I hate about that checkpatch "rule",
please do not follow it for any code that I am a maintainer for.

> > > > +static void usbio_disconnect(struct usb_interface *intf)
> > > > +{
> > > > +	struct usbio_device *usbio = usb_get_intfdata(intf);
> > > > +	struct usbio_client *client, *prev;
> > > > +
> > > > +	list_for_each_entry_safe_reverse(client, prev, &usbio->cli_list, link) {
> > > > +		auxiliary_device_delete(&client->adev);
> > > > +		list_del_init(&client->link);
> > > > +		auxiliary_device_uninit(&client->adev);
> > > > +	}
> > > > +
> > > > +	usb_kill_urb(usbio->urb);
> > > > +	usb_free_urb(usbio->urb);
> > > 
> > > What will happen on client drivers if they're working with the bridge while
> > > disconnect happens?
> > > 
> > > One easy solution to this could be to use an rw_semaphore where client
> > > acquire it for readingin conjunction (in a helper that also checks the
> > > interface status) and disconnect callback for writing.
> > 
> > How is that going to change anything?  And how can a disconnect happen?
> > Isn't this an onboard device?
> 
> It is, but the device firmware is known to crash occasionally.

Then fix the firmware :)

> The documantation says you can't access USB interfaces once disconnect has
> returned. I'm not sure if there are checks to safeguard against ongoing or
> additional accesses in the USB stack but on many other buses this may
> simply lead to a system crash.

How can you access the USB interface after disconnect has returned on
these codepaths?  The child devices should all be cleaned up properly
after disconnect happens so there should not be a pointer to even use
anymore.

thanks,

greg k-h

