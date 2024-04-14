Return-Path: <linux-i2c+bounces-2935-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD398A4471
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Apr 2024 19:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D801282570
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Apr 2024 17:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20E1135A59;
	Sun, 14 Apr 2024 17:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzS6E60Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DC317551;
	Sun, 14 Apr 2024 17:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713116884; cv=none; b=erpnBXZdKUs5ekNh16Cq/FFaOFXrup0b8qFJjbiCd7tBvZ5MdPC8EMvp4TcNMubDawrEXuw9KbpVEEikVE5Z02NIjX/HMkU6in9QMSfGX7m+Z/Alv7GxPXJmUXx+hYApBk/1Bmj3B5SZl6t4LBzYtyyuLE4y/ATGRYtrpvoVVSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713116884; c=relaxed/simple;
	bh=qNFTB58BB/3tcqDqqOf5notEGqrOnOZOZkP6bfgMgAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AXhk2J3W5DbLFsQa0Rsrpcr9wkYNzogEMzsvmiOtK1+upRvJ6SNmWDwzEgWAlqQ2d2teEQE/yQ4FhQe69x9bIbJqad8bHqCxlpx4L1k7s6mypJ8nnfRAMJe/gXS2+Sw2f/xeJMZUKnkDfl+e+eTnJ/xbeT9oQYIbx3gHAK7eM2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzS6E60Z; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5ac5376c4b2so1562062eaf.2;
        Sun, 14 Apr 2024 10:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713116882; x=1713721682; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4sC8EDioQFXn8NicLfeAlG5gQhPw/Yd6MO4qGojEFBk=;
        b=MzS6E60ZzOj9fN9DvFGlaDWC9r/emMQE7QDsNrZMV7NP+r6X+ZesUR4O/7udlWMW79
         su7qUalVhxokkXWn3++R0WY2A+3ok24p5VSpNqGhMQLzE3I20zF6BxNx0gACml8vuK6V
         lPHWZBnH38AVyKNckXYIPXvu3buuyeZooq+W+d5sLaSiD/hfD5pXztAEi4Wbo8l7h91q
         W/7FJV9NXcB8fsHoL3kZc9D65qMC0p7wwdNeo1rRjDURRV3f17wDAmFb0iBVR6olAyqk
         AJ+lFIpVhVZF2U9S3f9nJJHchdy45S3Elh2HAI3zHNlIBNxFQ+8EBK7E9DUpzBPT1J2K
         +5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713116882; x=1713721682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4sC8EDioQFXn8NicLfeAlG5gQhPw/Yd6MO4qGojEFBk=;
        b=Y5BqPbbWa5mr5zmwgBYW9j9r8Vk816iE2Q+ZdpAy3iz4PEkoT+IzQ7AzS3D5+CRzLs
         HEAjrVtEQgd6U1AXrzvCroSJ+stCfSwZGEHAJwl+UNOzxwxEcrlklYGDjQlrU10CwQFB
         bc740ob8Ut0bCYtNXknlvR7pO+SqeyibTnY23Bk++PF9NjFdTvcGC3J7FsGVLs5r9mX7
         aQlAa5bDZk/78uiKLSqdOfD9ABZAPACudeRgZEJBdgEeGdZ5W4uhdzjun4HGijkcUsq1
         2mGAYdm1txs8LvpdsGCl/FCG9QclHiUFlp1SKdg/taonkAR8neVwSxrNvFbaM3GtUFkI
         G1nw==
X-Forwarded-Encrypted: i=1; AJvYcCVpIPC3pocYvxxWF9U6iH7TtUBBmq4BdFq/zv/HDWIP+YmuaK+y3rN2KMAuZ+N8gtAMtd5jCLnjKzaoNWRX0+8uxlTYLS/5gFlwRhdwwNetBRwqyoYgMw76CATclr77xGomok6OKeXAXjNBl+0zKR61CfGD7jVRtmHNbP9lHuJba6MkDA==
X-Gm-Message-State: AOJu0Yx962uW4aIxk2JbgFvLMdgoA1FrOEjbd/IDrT+g/BVP4bnDp3jp
	+7Qnv8o4PRmZzBCSQT3LTiLY4t+rnhikNLNLXSL4ocoA28BtvuziMeRkEnS88pae7xEYNMRvPGf
	qJIpGi1vxYJQpd+nmIo9xMPpRrSM=
X-Google-Smtp-Source: AGHT+IGN/DDxozC9ZHVAgNKxhRwR1qOOk6eSu4avVnHcGCfRjBShj2Gp/DbQjHewBbFSl6QuO+rsJwJals1KV8NXY0M=
X-Received: by 2002:a05:6359:4246:b0:183:ddb0:eb03 with SMTP id
 ko6-20020a056359424600b00183ddb0eb03mr13659348rwb.21.1713116882371; Sun, 14
 Apr 2024 10:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20221228164813.67964-1-hhhawa@amazon.com> <20221228164813.67964-3-hhhawa@amazon.com>
 <416340b6-33a9-4b9e-bdc5-c5a9cffb3055@gmail.com> <ac51854b-09a6-4b79-b409-b950929655cb@moroto.mountain>
In-Reply-To: <ac51854b-09a6-4b79-b409-b950929655cb@moroto.mountain>
From: Robert Marko <robimarko@gmail.com>
Date: Sun, 14 Apr 2024 19:47:50 +0200
Message-ID: <CAOX2RU6YOBBgEuwdp8P0GTJ5vB0M5Cbqf5SnVJ9Jbou9w5405g@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] i2c: Set i2c pinctrl recovery info from it's
 device pinctrl
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Hanna Hawa <hhhawa@amazon.com>, andriy.shevchenko@linux.intel.com, wsa@kernel.org, 
	linus.walleij@linaro.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, dwmw@amazon.co.uk, 
	benh@amazon.com, ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com, 
	hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 14 Apr 2024 at 12:34, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Thu, Apr 11, 2024 at 07:08:56PM +0200, Robert Marko wrote:
> >
> > On 28. 12. 2022. 17:48, Hanna Hawa wrote:
> > > Currently the i2c subsystem rely on the controller device tree to
> > > initialize the pinctrl recovery information, part of the drivers does
> > > not set this field (rinfo->pinctrl), for example i2c DesignWare driver.
> > >
> > > The pins information is saved part of the device structure before probe
> > > and it's done on pinctrl_bind_pins().
> > >
> > > Make the i2c init recovery to get the device pins if it's not
> > > initialized by the driver from the device pins.
> > >
> > > Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > ---
> > >   drivers/i2c/i2c-core-base.c | 5 ++++-
> > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > > index 7539b0740351..fb5644457452 100644
> > > --- a/drivers/i2c/i2c-core-base.c
> > > +++ b/drivers/i2c/i2c-core-base.c
> > > @@ -34,6 +34,7 @@
> > >   #include <linux/of.h>
> > >   #include <linux/of_irq.h>
> > >   #include <linux/pinctrl/consumer.h>
> > > +#include <linux/pinctrl/devinfo.h>
> > >   #include <linux/pm_domain.h>
> > >   #include <linux/pm_runtime.h>
> > >   #include <linux/pm_wakeirq.h>
> > > @@ -282,7 +283,9 @@ static void i2c_gpio_init_pinctrl_recovery(struct i2c_adapter *adap)
> > >   {
> > >     struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
> > >     struct device *dev = &adap->dev;
> > > -   struct pinctrl *p = bri->pinctrl;
> > > +   struct pinctrl *p = bri->pinctrl ?: dev_pinctrl(dev->parent);
> > > +
> > > +   bri->pinctrl = p;
> >
> > Hi Hanna,
> > I know this has already been merged, but setting bri->pinctrl breaks PXA
> > recovery.
>
> This is patch is a year and half old so it's a bit late to just revert
> it...

Hi there,
I know it's old but I just tried it on 6.6 in OpenWrt.

>
> What does "breaks" mean in this context?  Is there a NULL dereference?
> Do you have a stack trace?  It's really hard to get inspired to look at
> the code when the bug report is so vague...

I admit that I did not explain this properly, but if bri->pinctrl is set then
PXA I2C is completely broken as in it doesn't work at all, there are no errors
other than trying to probe for I2C devices will time out.
We had the same symptoms when PXA was converted to generic I2C recovery and that
had to be reverted.

I think its probably some pinctrl issue but nobody has been able to
track it down.

Regards,
Robert

>
> regards,
> dan carpenter

