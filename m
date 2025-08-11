Return-Path: <linux-i2c+bounces-12230-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D67F2B20337
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 11:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB75C1884AEB
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 09:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE42A2DD61E;
	Mon, 11 Aug 2025 09:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JK2eRQzK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50648F49;
	Mon, 11 Aug 2025 09:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904229; cv=none; b=gG6qaYzZzQfe0LMh39SyNOkou9v9z+pfUP0cfhk+IphhYAS0d6Za5s8McQCOHQWTxNoXYSeiVS+h+UXb17z2/yjKCRuiOLfObFUxnp05PjS7o1hSFfF+n3NynnPHGqJ9e/56+nHrFVAccxntwdDxoHtBZA/UzOkQbYOydcf2mP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904229; c=relaxed/simple;
	bh=U5JcW5uIfD1oDDbIt7gJa6eRbTfVOSRgRl1GVPrGKm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5YJndpnSc4LhHqJ42D/uBKWXJiC8uLKq+Jg0XKYMxW3h6GwtavJ44jgTD1qto5syCgrZhom4Hpud/5Ushh61DKWJFfvTrN0wsXs7CAjhaktw0Q35wSyyjGZ67y3CmjYDfa4lL1hrQR4NHrAng3zXsm/wMMlDdfDFekYHQAMtZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JK2eRQzK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754904228; x=1786440228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U5JcW5uIfD1oDDbIt7gJa6eRbTfVOSRgRl1GVPrGKm0=;
  b=JK2eRQzKwrxqQGAMXdS+bp52/7EANA4rqAE2sNIshM7HKTst+6rjBHL+
   k1JoyK2k+GJlPQ0f+coEeTNVi8rQoSU3sdXPOYgY3NJyzPlAkQKQ1gzPM
   i0oD98o5sAqeI/bmiV3Yb9nn8EYnyk1O2MjcRObfxfBxOUxS1uaDmpPyK
   SFGEiaCSsAH6QBrZp0XqYPB+YQcclX0BKvT3FqPz9tXnuCYLOv1Ck6MYs
   IoxxVYyME90JNnZmhIaufBKARGn1QgcDbf2hOv77yziqDzr9v58hwbxxL
   oW7DqdeYPoNE0DJD+H878YufGZsNePUo2XsmhwEIWTRTZSRjF9U7YtGb5
   g==;
X-CSE-ConnectionGUID: WEeWOkD8TxmybvMRbtPaog==
X-CSE-MsgGUID: L8iw7tK7Q1SJpYK/JD+Kaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68521298"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68521298"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 02:23:47 -0700
X-CSE-ConnectionGUID: LpN0/L4dQuSQoyLIOD0sYA==
X-CSE-MsgGUID: Grsm//mGR6Sad77Bt4bBdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165516184"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.87])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 02:23:44 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2939F11FC37;
	Mon, 11 Aug 2025 12:23:41 +0300 (EEST)
Date: Mon, 11 Aug 2025 09:23:41 +0000
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
Message-ID: <aJm2naLnWChQOChH@kekkonen.localdomain>
References: <20250809102326.6032-1-hansg@kernel.org>
 <20250809102326.6032-2-hansg@kernel.org>
 <aJmS15MlcHz__S0p@kekkonen.localdomain>
 <2025081106-could-hazily-3e58@gregkh>
 <aJmb4ZoUrnNTpM2W@kekkonen.localdomain>
 <2025081128-ecard-ecosphere-8170@gregkh>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025081128-ecard-ecosphere-8170@gregkh>

Hi Greg,

On Mon, Aug 11, 2025 at 10:31:22AM +0200, Greg Kroah-Hartman wrote:
> On Mon, Aug 11, 2025 at 07:29:37AM +0000, Sakari Ailus wrote:
> > Hi Greg,
> > 
> > On Mon, Aug 11, 2025 at 09:12:36AM +0200, Greg Kroah-Hartman wrote:
> > > On Mon, Aug 11, 2025 at 06:51:03AM +0000, Sakari Ailus wrote:
> > > > > +/**
> > > > > + * struct usbio_client - represents a usbio client
> > > > > + *
> > > > > + * @adev: auxiliary device object
> > > > > + * @bridge: usbio bridge who service the client
> > > > > + * @link: usbio bridge clients list member
> > > > > + */
> > > > > +struct usbio_client {
> > > > > +	struct auxiliary_device adev;
> > > > > +	struct usbio_device *bridge;
> > > > > +	struct list_head link;
> > > > > +};
> > > > > +
> > > > > +#define adev_to_client(adev) container_of(adev, struct usbio_client, adev)
> > > > 
> > > > Please use a different name than "adev" for the argument, which is also the
> > > > struct field of interest.
> > > 
> > > Why?  That's a very common way of doing this.  My only complaint is that
> > > it really should be "container_of_const()" instead of just
> > > "container_of()"
> > 
> > Because the struct field has the same name. The macro isn't intended for
> > obtaining the container struct based on any field in the struct, only the
> > field called "adev".
> 
> And that's fine, the macro works like this, so all should be ok.
> 
> > I'll post a patch to add the container_of() check to checkpatch.pl.
> 
> Patch to add it to do what?

You're cc'd. :-)

> 
> > > > > +static int usbio_ctrl_msg(struct usbio_device *usbio, u8 type, u8 cmd,
> > > > > +			  const void *obuf, u16 obuf_len, void *ibuf, u16 ibuf_len)
> > > > > +{
> > > > > +	u8 request = USB_TYPE_VENDOR | USB_RECIP_DEVICE;
> > > > > +	struct usbio_ctrl_packet *cpkt;
> > > > > +	unsigned int pipe;
> > > > > +	u16 cpkt_len;
> > > > > +	int ret;
> > > > > +
> > > > > +	lockdep_assert_held(&usbio->mutex);
> > > > > +
> > > > > +	if ((obuf_len > (usbio->ctrlbuf_len - sizeof(*cpkt))) ||
> > > > > +	    (ibuf_len > (usbio->ctrlbuf_len - sizeof(*cpkt))))
> > > > 
> > > > You can (and should) remove all parentheses except the outer ones here.
> > > 
> > > No, don't do that.  If you do that you will have to manually go and try
> > > to remember the order of operations every time you read this code.
> > 
> > I presume kernel developers in general do.
> > 
> > But if in doubt: <URL:https://users.ece.utexas.edu/~adnan/c-refcard.pdf>.
> 
> Don't force me to look it up all the time, use () to make it obvious
> please.  That's the biggest thing I hate about that checkpatch "rule",
> please do not follow it for any code that I am a maintainer for.
> 
> > > > > +static void usbio_disconnect(struct usb_interface *intf)
> > > > > +{
> > > > > +	struct usbio_device *usbio = usb_get_intfdata(intf);
> > > > > +	struct usbio_client *client, *prev;
> > > > > +
> > > > > +	list_for_each_entry_safe_reverse(client, prev, &usbio->cli_list, link) {
> > > > > +		auxiliary_device_delete(&client->adev);
> > > > > +		list_del_init(&client->link);
> > > > > +		auxiliary_device_uninit(&client->adev);
> > > > > +	}
> > > > > +
> > > > > +	usb_kill_urb(usbio->urb);
> > > > > +	usb_free_urb(usbio->urb);
> > > > 
> > > > What will happen on client drivers if they're working with the bridge while
> > > > disconnect happens?
> > > > 
> > > > One easy solution to this could be to use an rw_semaphore where client
> > > > acquire it for readingin conjunction (in a helper that also checks the
> > > > interface status) and disconnect callback for writing.
> > > 
> > > How is that going to change anything?  And how can a disconnect happen?
> > > Isn't this an onboard device?
> > 
> > It is, but the device firmware is known to crash occasionally.
> 
> Then fix the firmware :)

In practice this depends on device vendor and we all know the quality of
firmware from random sources. These are not Intel-implemented devices.

> 
> > The documantation says you can't access USB interfaces once disconnect has
> > returned. I'm not sure if there are checks to safeguard against ongoing or
> > additional accesses in the USB stack but on many other buses this may
> > simply lead to a system crash.
> 
> How can you access the USB interface after disconnect has returned on
> these codepaths?  The child devices should all be cleaned up properly
> after disconnect happens so there should not be a pointer to even use
> anymore.

See functions exported by the main USBIO driver.

-- 
Regards,

Sakari Ailus

