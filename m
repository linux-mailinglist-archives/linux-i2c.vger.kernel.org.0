Return-Path: <linux-i2c+bounces-13094-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF9EB924C6
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 18:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57A0B440A12
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 16:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313F4311596;
	Mon, 22 Sep 2025 16:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cc8Moi82"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F572E718D;
	Mon, 22 Sep 2025 16:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758559699; cv=none; b=F38cfIKvOFWhJkTx/BtrQM29+uKphmXNwizcn8iHQAwmM+T+dydI0sMA6F2nzivXt1vMPcijWo7wqhHFoGXsrmYIQXeshqKVgEJIG6Ep3wKdV7xOThAi1WrlJJQlMyLGsfSIWx4IsF+VYCPB/ZjlzisfjW0vC31gV2fRw+u9C5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758559699; c=relaxed/simple;
	bh=LjjVu8vVdsGyiCxlAHhnHuT+3Eb9hEY4tncpM5UxKek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxuLGbkbCI9p2edXJAqRITmBv15PVcH7d1Idp5oYCdtUi1sWFz4CtvUPZkJ4KyCPrqFL0b3OwAdVNbTJ2m0935oGyg/1AH3Xs6jtIFFP1Vx9apx0urRAj8lO88tR8SJyZuCnIf5Xhdff0i+uA3edck7sLl55uVmTyRTkggHFsIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cc8Moi82; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2C7C4CEF0;
	Mon, 22 Sep 2025 16:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758559698;
	bh=LjjVu8vVdsGyiCxlAHhnHuT+3Eb9hEY4tncpM5UxKek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cc8Moi823Q8mdsX2aVDiIBv84Q+K8ck0uGKZ4Q1d5IFd86cL3AWHk1z9uXjs1vNFC
	 SiR5DegGBbhHGuVWHeWy0mDaHw+0jSlvrOdefJ76v8IQzhj4tvatMGfNQo5tH3ZHZ+
	 l5GzhzJ8mR9tv8Q8ICkfNVBLAHFbK6LAmXUKcggQ=
Date: Mon, 22 Sep 2025 18:48:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/5] usb: misc: ljca: Remove Wentong's e-mail address
Message-ID: <2025092246-swiftly-foothold-0c48@gregkh>
References: <20250922120632.10460-1-sakari.ailus@linux.intel.com>
 <2025092234-magenta-scouting-c3c4@gregkh>
 <aNF5ahYzteTjq8Iu@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNF5ahYzteTjq8Iu@kekkonen.localdomain>

On Mon, Sep 22, 2025 at 07:29:30PM +0300, Sakari Ailus wrote:
> Hi Greg,
> 
> On Mon, Sep 22, 2025 at 02:18:00PM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Sep 22, 2025 at 03:06:28PM +0300, Sakari Ailus wrote:
> > > Wentong's e-mail address no longer works, remove it.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/usb/misc/usb-ljca.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> > > index c562630d862c..1846156c0800 100644
> > > --- a/drivers/usb/misc/usb-ljca.c
> > > +++ b/drivers/usb/misc/usb-ljca.c
> > > @@ -891,7 +891,7 @@ static struct usb_driver ljca_driver = {
> > >  };
> > >  module_usb_driver(ljca_driver);
> > >  
> > > -MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
> > > +MODULE_AUTHOR("Wentong Wu");
> > 
> > Is there a new address where they can be reached?  SHouldn't that be
> > used instead of just deleting the intel one?
> 
> I believe Wentong has had plenty of time to update his address. If he still
> prefers to do so, he can do that after merging these patches.

I would prefer to get Wentong to send the patches themselves for all of
this if at all possible, thanks!

greg k-h

