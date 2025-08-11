Return-Path: <linux-i2c+bounces-12227-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B62AB20047
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 09:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB95C3AD551
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 07:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D572D979A;
	Mon, 11 Aug 2025 07:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l28fMAiV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB8229B799;
	Mon, 11 Aug 2025 07:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754897386; cv=none; b=VD7Bg1uhHsv1gZSCqHBceR/DbSjf2B5LkFQ5BnRnGlMfgWWg+D+wDw4alSiPbWQbmNIPZbUXcpkpUFeQOE5nVMYMEnzQZozUH0ScMETut45HoM1LjjjNTsa+F0DGjwODDffWY+x0v1jKAV0Uzj8MikyhoRNtq4+WczjD0xIIdA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754897386; c=relaxed/simple;
	bh=mvZVgn1ezSTDsKoINS4IPpM1eeEbobkZt08QOd33ze0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLW0uRWbCLnEpPHunBcX9FzfWKkihQlUlyKoL6E15ZTm+kdudvThZ7waDwOnDdn60/yJs6uiK68hPs2ImRaQynGnLlZhpBlRxVVMH/VkSPbRGVDIX7x6Lj0Y9fkAhfdZt76hXnNtAIligsjSi2W9rwzRAS6XQM6xLNfmzua/G0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l28fMAiV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754897385; x=1786433385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mvZVgn1ezSTDsKoINS4IPpM1eeEbobkZt08QOd33ze0=;
  b=l28fMAiVGTtwCR9msSvudMZvRqmw0UXnyAktOpTa5k/OxwVYqLKfYrSx
   UBiadKLGEHcP6dupEdLUWRxjaUFv8kIiDPSvKgUg+Ncn38sRpFbb14hYw
   O5AuvnqO+X92qO22R265KIaar0dy4Mh70sY1fSc3t+zx3yDSychl0B0KL
   Q9BX1/tGL4vZOt36B0TVS2GfSP1mVu5nDKb3b30BLvWbidIs7lKucmfl2
   fUsm5jqMsS1KWzQrKGsgqlPU0wMEa5US3JS/zGyHojUq+i+w1gW7iAeIV
   QSj/qBf/VLpHKMdNjRqW/l9X6Z8t39f6zraBQDlnV3z1TpK5CSpnqYqcp
   w==;
X-CSE-ConnectionGUID: 15D++QuqTw6dvBbpDdKTsQ==
X-CSE-MsgGUID: PaZwfK8wRc632Q+XDi502A==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57063754"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57063754"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 00:29:44 -0700
X-CSE-ConnectionGUID: dVfZ2ht+ToygKpcLfR4wyg==
X-CSE-MsgGUID: 1BqylLUtQAeOh4G+RNMicg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165083344"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.87])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 00:29:41 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E501011FC22;
	Mon, 11 Aug 2025 10:29:37 +0300 (EEST)
Date: Mon, 11 Aug 2025 07:29:37 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: misc: Add Intel USBIO bridge driver
Message-ID: <aJmb4ZoUrnNTpM2W@kekkonen.localdomain>
References: <20250809102326.6032-1-hansg@kernel.org>
 <20250809102326.6032-2-hansg@kernel.org>
 <aJmS15MlcHz__S0p@kekkonen.localdomain>
 <2025081106-could-hazily-3e58@gregkh>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025081106-could-hazily-3e58@gregkh>

Hi Greg,

On Mon, Aug 11, 2025 at 09:12:36AM +0200, Greg Kroah-Hartman wrote:
> On Mon, Aug 11, 2025 at 06:51:03AM +0000, Sakari Ailus wrote:
> > > +/**
> > > + * struct usbio_client - represents a usbio client
> > > + *
> > > + * @adev: auxiliary device object
> > > + * @bridge: usbio bridge who service the client
> > > + * @link: usbio bridge clients list member
> > > + */
> > > +struct usbio_client {
> > > +	struct auxiliary_device adev;
> > > +	struct usbio_device *bridge;
> > > +	struct list_head link;
> > > +};
> > > +
> > > +#define adev_to_client(adev) container_of(adev, struct usbio_client, adev)
> > 
> > Please use a different name than "adev" for the argument, which is also the
> > struct field of interest.
> 
> Why?  That's a very common way of doing this.  My only complaint is that
> it really should be "container_of_const()" instead of just
> "container_of()"

Because the struct field has the same name. The macro isn't intended for
obtaining the container struct based on any field in the struct, only the
field called "adev".

I'll post a patch to add the container_of() check to checkpatch.pl.

> 
> 
> > > +static int usbio_ctrl_msg(struct usbio_device *usbio, u8 type, u8 cmd,
> > > +			  const void *obuf, u16 obuf_len, void *ibuf, u16 ibuf_len)
> > > +{
> > > +	u8 request = USB_TYPE_VENDOR | USB_RECIP_DEVICE;
> > > +	struct usbio_ctrl_packet *cpkt;
> > > +	unsigned int pipe;
> > > +	u16 cpkt_len;
> > > +	int ret;
> > > +
> > > +	lockdep_assert_held(&usbio->mutex);
> > > +
> > > +	if ((obuf_len > (usbio->ctrlbuf_len - sizeof(*cpkt))) ||
> > > +	    (ibuf_len > (usbio->ctrlbuf_len - sizeof(*cpkt))))
> > 
> > You can (and should) remove all parentheses except the outer ones here.
> 
> No, don't do that.  If you do that you will have to manually go and try
> to remember the order of operations every time you read this code.

I presume kernel developers in general do.

But if in doubt: <URL:https://users.ece.utexas.edu/~adnan/c-refcard.pdf>.

> 
> Remember, we write code for people first, compilers second.  Make it
> totally obvious what is going on here as you want PEOPLE to catch your
> issues.

I guess people can have differing opinions on this; I find the above much
easier to read without the extra parentheses.

GCC actually nowadays generates warnings for code for which the evaluation
order is perfectly well defined (namely mixing bitwise and logical
operations AFAIR, for relying on the evaluation order between && and || I
can somehow understand that).

> 
> The statement is fine as-is.
> 
> > > +		return -EMSGSIZE;
> > > +
> > > +	/* Prepare Control Packet Header */
> > > +	cpkt = usbio->ctrlbuf;
> > > +	cpkt->header.type = type;
> > > +	cpkt->header.cmd = cmd;
> > > +	if (type == USBIO_PKTTYPE_CTRL || ibuf_len)
> > > +		cpkt->header.flags = USBIO_PKTFLAGS_REQRESP;
> > > +	else
> > > +		cpkt->header.flags = USBIO_PKTFLAG_CMP;
> > > +	cpkt->len = obuf_len;
> > > +
> > > +	/* Copy the data */
> > > +	memcpy(cpkt->data, obuf, obuf_len);
> > > +
> > > +	pipe = usb_sndctrlpipe(usbio->udev, usbio->ctrl_pipe);
> > > +	cpkt_len = sizeof(*cpkt) + obuf_len;
> > > +	ret = usb_control_msg(usbio->udev, pipe, 0, request | USB_DIR_OUT, 0, 0,
> > > +			      cpkt, cpkt_len, USBIO_CTRLXFER_TIMEOUT);
> > > +	dev_dbg(usbio->dev, "control out %d hdr %*phN data %*phN\n", ret,
> > > +		(int)sizeof(*cpkt), cpkt, (int)cpkt->len, cpkt->data);
> > 
> > Instead of casting, how about using %zu for printing a size_t?
> > 
> > > +
> > > +	if (ret != cpkt_len) {
> > > +		dev_err(usbio->dev, "USB control out failed: %d\n", ret);
> > > +		return (ret < 0) ? ret : -EPROTO;
> > 
> > Redundant parentheses.
> 
> Nope!  Again, please mat it obvioue.
> 
> Actually, I hate ? : lines, this should be:
> 	if (ret < 0)
> 		return ret
> 	else
> 		return -EPROTO
> 
> by spelling it all out.
> 
> > > +static int usbio_ctrl_enumgpios(struct usbio_device *usbio)
> > > +{
> > > +	struct usbio_gpio_bank_desc *gpio = usbio->gpios;
> > > +	int ret, i;
> > 
> > unsigned int i, please.
> 
> Nope, 'int' is just fine.  Please see Dan's many rants about why this is
> acceptable for loops.
> 
> > > +static int usbio_ctrl_enumi2cs(struct usbio_device *usbio)
> > > +{
> > > +	struct usbio_i2c_bus_desc *i2c = usbio->i2cs;
> > > +	int ret, i;
> > 
> > unsigned int i, please.
> 
> Nope, 'int' is fine.
> 
> > > +static int usbio_ctrl_enumspis(struct usbio_device *usbio)
> > > +{
> > > +	struct usbio_spi_bus_desc *spi = usbio->spis;
> > > +	int ret, i;
> > 
> > Ditto.
> 
> Nope :)
> 
> > > +static void usbio_disconnect(struct usb_interface *intf)
> > > +{
> > > +	struct usbio_device *usbio = usb_get_intfdata(intf);
> > > +	struct usbio_client *client, *prev;
> > > +
> > > +	list_for_each_entry_safe_reverse(client, prev, &usbio->cli_list, link) {
> > > +		auxiliary_device_delete(&client->adev);
> > > +		list_del_init(&client->link);
> > > +		auxiliary_device_uninit(&client->adev);
> > > +	}
> > > +
> > > +	usb_kill_urb(usbio->urb);
> > > +	usb_free_urb(usbio->urb);
> > 
> > What will happen on client drivers if they're working with the bridge while
> > disconnect happens?
> > 
> > One easy solution to this could be to use an rw_semaphore where client
> > acquire it for readingin conjunction (in a helper that also checks the
> > interface status) and disconnect callback for writing.
> 
> How is that going to change anything?  And how can a disconnect happen?
> Isn't this an onboard device?

It is, but the device firmware is known to crash occasionally.

The documantation says you can't access USB interfaces once disconnect has
returned. I'm not sure if there are checks to safeguard against ongoing or
additional accesses in the USB stack but on many other buses this may
simply lead to a system crash.

> 
> > > +}
> > > +
> > > +static int usbio_probe(struct usb_interface *intf, const struct usb_device_id *id)
> > > +{
> > > +	struct usb_device *udev = interface_to_usbdev(intf);
> > > +	struct usb_endpoint_descriptor *ep_in, *ep_out;
> > > +	struct device *dev = &intf->dev;
> > > +	struct usbio_device *usbio;
> > > +	int ret;
> > > +
> > > +	usbio = devm_kzalloc(dev, sizeof(*usbio), GFP_KERNEL);
> > 
> > usbio will be released at the exit from usbio_disconnect(). I think you'll
> > need to use a release callback in struct device to release usbio once all
> > clients are gone.
> 
> Which clients?  The disconnect will cause that to happen, it can not
> happen at the same time probe is called.

Not probe but disconnect. See the two other patches in the set for client
drivers.

> 
> > > +		uid = acpi_device_uid(adev);
> > > +		if (uid)
> > > +			for (int i = 0; i < strlen(uid); i++)
> > 
> > size_t i?
> 
> Ick, no, "int" is fine.

-- 
Regards,

Sakari Ailus

