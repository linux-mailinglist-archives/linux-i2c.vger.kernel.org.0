Return-Path: <linux-i2c+bounces-12233-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B3FB203C9
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 11:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B1E2424182
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 09:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467652DCF56;
	Mon, 11 Aug 2025 09:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AyVHoSlf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F4B21D3E6;
	Mon, 11 Aug 2025 09:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904766; cv=none; b=k+FdHxQhWC58KlIg6MPUGTBZS7rzyZir73SzkGuiGLcLsyxONlJjVp8gV6tmc8L1bgUBzIHAjfR09bIwatiaBGElR9QELSwjbYr5/vYtbU6pKaUG59Vhp4Z1LB/nc2DOhBMZNn669QsuhKEzUajHPRgYbCjEnrQR2dgvfsLXSCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904766; c=relaxed/simple;
	bh=V2ygC/ToSgTXvh+isu/wZFsml1Yg8W+Q6EYkQUDxfsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKwKs6VFcC69iX8SyGoJxHY/nJ4uPhlnRJa+CaLw3XkWDNIEz0S6qKjfYuF3yCe4nsLsyu/qkRBFG8UJ2dpcw5YQgFOfHdJ+7fOtso0m1b2YVVva/NjTUT83i2SIxj8tgsCoyPyuASmupQHjIdy+Uk+lJS+VEQOmYnXziZPLPIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AyVHoSlf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754904764; x=1786440764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V2ygC/ToSgTXvh+isu/wZFsml1Yg8W+Q6EYkQUDxfsw=;
  b=AyVHoSlfcyyjstCRSn23HT8OuEMrDZ0Q28i8C65UAZ8LMXbDlUsDKN8h
   C/fqgHC2QLmYeQNpMPnOoVXzpEg2iZdPrzWeqwiFRnNSiVz/A8xkiuFEk
   aaqV1EVx/hB9a1Vf23tqI4G8ZmTtoDX016x9eazzR9mMxxO+xv0qqsIuQ
   1RZ7RDXnLjw20etyobYdygGA+ZyjDqoKy5bo/KOs/q892V62E5pGQ0X+e
   tWDz56Nt7exQ4XMXRkYjRhiCGlK9xWA+Ailk9Wim1g1HrjY1BSCLrrRrb
   MStXlBL6SmOj2E4z5vcEZYW/8cMCH/0Kz3v9OqtsTF0G2MMPkDmzQ7IHu
   g==;
X-CSE-ConnectionGUID: tJCFhR5GTMyoC3920EE18Q==
X-CSE-MsgGUID: ClPS9BrGTl+hDsiBEqwiHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68522224"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68522224"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 02:32:43 -0700
X-CSE-ConnectionGUID: KoZDua2/SpGlG5ng80kZ3g==
X-CSE-MsgGUID: TcrSXKKKQxK7zyj0yyz62g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="170307728"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.87])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 02:32:40 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 676E611FC49;
	Mon, 11 Aug 2025 12:32:37 +0300 (EEST)
Date: Mon, 11 Aug 2025 09:32:37 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: misc: Add Intel USBIO bridge driver
Message-ID: <aJm4tavYZFtvr_Qq@kekkonen.localdomain>
References: <20250809102326.6032-1-hansg@kernel.org>
 <20250809102326.6032-2-hansg@kernel.org>
 <aJmS15MlcHz__S0p@kekkonen.localdomain>
 <1e70aa9c-2bce-4c64-ba62-48006022efd4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e70aa9c-2bce-4c64-ba62-48006022efd4@kernel.org>

Hi Hans,

On Mon, Aug 11, 2025 at 11:13:16AM +0200, Hans de Goede wrote:
> >> +#define adev_to_client(adev) container_of(adev, struct usbio_client, adev)
> > 
> > Please use a different name than "adev" for the argument, which is also the
> > struct field of interest.
> 
> As gkh mentioned doing things this way is quite normal.

Isn't this exactly what people have been warning against because it'll lead
to hard-to-find bugs and requesting static inline functions being used
instead? Why not now?

...

> >> +static void usbio_disconnect(struct usb_interface *intf)
> >> +{
> >> +	struct usbio_device *usbio = usb_get_intfdata(intf);
> >> +	struct usbio_client *client, *prev;
> >> +
> >> +	list_for_each_entry_safe_reverse(client, prev, &usbio->cli_list, link) {
> >> +		auxiliary_device_delete(&client->adev);
> >> +		list_del_init(&client->link);
> >> +		auxiliary_device_uninit(&client->adev);
> >> +	}
> >> +
> >> +	usb_kill_urb(usbio->urb);
> >> +	usb_free_urb(usbio->urb);
> > 
> > What will happen on client drivers if they're working with the bridge while
> > disconnect happens?
> 
> All clients will have their remove() function called. If clients
> somehow need to have some userspace-api related bits stick around
> longer they will need to handle that themselves. Clients are no longer
> allowed to call an usbio_*() functions after having their remove()
> function called.
> 
> > One easy solution to this could be to use an rw_semaphore where client
> > acquire it for readingin conjunction (in a helper that also checks the
> > interface status) and disconnect callback for writing.
> 
> That is not necessary.
> 
> One thing which should be done here is set a disconnected flag to make new
> usbio_*() calls fail immediately and signal the "done" completion to wakeup
> any waiters, something like this:
> 
> static void usbio_disconnect(struct usb_interface *intf)
> {
> 	struct usbio_device *usbio = usb_get_intfdata(intf);
> 	struct usbio_client *client, *prev;
> 
> 	list_for_each_entry(client, &usbio->cli_list, link)
> 		client->disconnected = true;
> 
> 	complete(&usbio->done);
> 
> 	/* Ensure all clients see the disconnect flag */
> 	mutex_lock(&usbio->mutex);
> 	mutex_unlock(&usbio->mutex);
> 
> 	/* From here on clients will no longer touch struct usbio_device */
> 	usb_kill_urb(usbio->urb);
> 	usb_free_urb(usbio->urb);
> 
> 	list_for_each_entry_safe_reverse(client, prev, &usbio->cli_list, link) {
> 		auxiliary_device_delete(&client->adev);
> 		list_del_init(&client->link);
> 		auxiliary_device_uninit(&client->adev);
> 	}
> }
> 
> Combined with checking client->disconnected in entry points
> and after waiting for the completion.
> 
> This will even allow the client to keep the struct auxdev
> around by keeping a reference and it will even be safe for
> the client to make usbio_*() calls on the auxdev since as
> long as the reference is there the memory of the usbio_client
> which embeds the auxdev will stick around and the disconnected
> flag will ensure this is safe. Note client drivers really should
> not do that though!

Ack, sounds good. I'll wait for v2 then.

> 
> 
> 
> 
> 
> 	
> 
> > 
> >> +}
> >> +
> >> +static int usbio_probe(struct usb_interface *intf, const struct usb_device_id *id)
> >> +{
> >> +	struct usb_device *udev = interface_to_usbdev(intf);
> >> +	struct usb_endpoint_descriptor *ep_in, *ep_out;
> >> +	struct device *dev = &intf->dev;
> >> +	struct usbio_device *usbio;
> >> +	int ret;
> >> +
> >> +	usbio = devm_kzalloc(dev, sizeof(*usbio), GFP_KERNEL);
> > 
> > usbio will be released at the exit from usbio_disconnect(). I think you'll
> > need to use a release callback in struct device to release usbio once all
> > clients are gone.
> 
> This is fine, see above it is up to the client drivers to no longer
> call any usbio_*() also for v2 I'll make all the public usbio_*()
> functions test client->disconnected and then they will never deref
> client->bridge.

Yes, keeping this information on the client side should be equally good.

-- 
Regards,

Sakari Ailus

