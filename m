Return-Path: <linux-i2c+bounces-6020-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C755F969A4F
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 12:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 843D7282BE0
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 10:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6161B984C;
	Tue,  3 Sep 2024 10:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lUnjK+lq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3851B985D;
	Tue,  3 Sep 2024 10:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725359834; cv=none; b=CIc7Mb3hxV639esYoVTCkzqq40RO7gL8xzaO5NfLup1mfjEn1k1uPWsYPhlWsuJ21ncHHGJNa3GZKU3Udb3vKmzII35YqxUMrmX9NMiXyHpnXVLQ7BAVGvpdHDTTIxcSfFzYYxN4ug2oY1XQ1Xw4nLZGdjzj/s+AdZVyGhjAYEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725359834; c=relaxed/simple;
	bh=dk/6bx9a/f96GB4dmYYL2v01H8GNc48rV0oX7YiW1zc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFram7gP/kCZoAfXUkjDnP+etNwThUQe8bMc0mLOtpQmfvlzKhdnml5MnFtUlIRSZ4vvw8GSbqJF/O95Y4gL6Fl0RD5ZErNgMGSKsbmyIYLq757ENjphqxCWOMd+H7a5RKLb7Pt6URQL02nDvW+dAoN+FQTj/aejcIIWHnkNfgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lUnjK+lq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85495C4CEC5;
	Tue,  3 Sep 2024 10:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725359833;
	bh=dk/6bx9a/f96GB4dmYYL2v01H8GNc48rV0oX7YiW1zc=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=lUnjK+lqfdDSJTmmcisqEXtm36lkEhtW53u9eE5zbdT5NubT51wVKWbYOso8er6mp
	 VFdag7F/C+3bafZO9BhIOUuOdyOOFGzDsmCWInkI8k3w2gi9AZI53vOAa0N1WAhR4B
	 fX+N+7QZnLWs/3MyB4bXoNR0JDMItGz7zEvg4xhc=
Date: Tue, 3 Sep 2024 12:06:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] driver core: class: warn if a compatibility class is
 registered
Message-ID: <2024090338-landfall-geek-58df@gregkh>
References: <4660a46b-9128-4407-8baa-f257245784a3@gmail.com>
 <7bc5fa50-59f6-4455-8f77-1c89f1e17d0b@gmail.com>
 <2024090242-smother-preview-a1d2@gregkh>
 <ZtbRLOUO48PzOKmC@shikoro>
 <ZtbRpMbX6g6vLUzO@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtbRpMbX6g6vLUzO@shikoro>

On Tue, Sep 03, 2024 at 11:06:44AM +0200, Wolfram Sang wrote:
> On Tue, Sep 03, 2024 at 11:04:44AM +0200, Wolfram Sang wrote:
> > 
> > > > +	pr_warn("Compatibility class %s will go away soon, please migrate userspace tools to use bus devices\n",
> > > > +		name);
> > > 
> > > That's not going to do anything except annoy users who have no control
> > > over this, sorry.  Please just fix up all of the kernel and then delete
> > > this function.
> > 
> > So, we deprecated this sysfs-class 15 years ago and hid it with a
> > Kconfig symbol. However, we never pursued this further, so e.g. Debian
> > has the Kconfig symbol still enabled. Can we really remove this from one
> > release to the next without another transition period? I am not afraid
> > of tools like lm-sensors which were converted long ago. But custom code
> > might rely on sysfs-paths created by this class. It was even advertised
> > in IPMI docs until last week (fixed now).
> 
> I missed that Heiner was changing the driver core, not I2C core. So, to
> give more details, I am talking about I2C_COMPAT and the "i2c-adapter"
> class. The main question from above still stands.

Delete the code and see if anyone notices?  :)

greg k-h

