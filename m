Return-Path: <linux-i2c+bounces-1444-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C964583AA58
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jan 2024 13:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59959B27920
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jan 2024 12:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A052F7764E;
	Wed, 24 Jan 2024 12:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pv5ubDch"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEEB134CA;
	Wed, 24 Jan 2024 12:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706100792; cv=none; b=f4oyi3Tbpi90ohyOEgHxC/wDFzAPuyXQ5ldE2/nAXgha3YY2+XID/sGKYCNoo+QGrRBSJiLIR7TAU6ShWaG6cl0R8e4aZZf1X/kuXtJrVAHiOp8Xwa3rBxszJlqaZgEjPYbqYO/aUYOi7Wbz/8aWk+JsAXE3hp5cp4Bh3uZbweY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706100792; c=relaxed/simple;
	bh=n6rll6s7gTiLTrIT6eIcRRrA5/96I1nCBmqQ+A92tjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ic+ZAAz6z1dvFuDn2uXJy7r1PkvHu8sSuaf/dB9T9lAdndSG32ez7cARNRIKk8NjEx3f1307n3OWufcUSL+Sm0fb8G/meQeP1WzWo9J1Ac/dVDqoRHpehAgRND9xs4sIZZjhun8qi+A7cHSz8YM8pHA6pKZ5Z+MfbMBQ0Qwl5zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pv5ubDch; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6FEC433C7;
	Wed, 24 Jan 2024 12:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706100791;
	bh=n6rll6s7gTiLTrIT6eIcRRrA5/96I1nCBmqQ+A92tjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pv5ubDchPLmyMxslb3G/fj5ng/UziQOhc0yp3+tmoYBZhOGgFRgdb+OaUHDBoz2LV
	 TjoaXjq4UmTakQDZABTQTimHC1Mxcik0tXG5mAU390CgQ1MK5832SpYJw4AxM8P/V/
	 WGnyZHcbs6/5RWkcwNq+nfgEPa+NddQbr8aCa1V009KGcMl1y3C5XU9vCP8SK9xWiR
	 zS43/dhUWKrZei6BrqPv5J7z4JqXufCBCXyMXSf6gPJfGyiSBCsTVLA4EiocfgjBYC
	 PWPoJFlxspizRDo5iuTBMYCEfKqRiBFtecTkhYOYI+MG9V2AvXUHhCziwD9jd+FEPc
	 QevqdHFJt9hvw==
Date: Wed, 24 Jan 2024 13:53:07 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: JiSheng Teoh <jisheng.teoh@starfivetech.com>
Cc: Michal Simek <michal.simek@amd.com>, 
	Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 RESEND] i2c: cadence: Add system suspend and resume PM
 support
Message-ID: <y2sxh2jkvujnaxeknbunogkumywjlohp3hi6dkf5dkc3qko27s@vg2qggq7lzrz>
References: <20240119013326.3405484-1-jisheng.teoh@starfivetech.com>
 <ko44i4n5synf3uugp4wmjoe6eikyw3bzjtmarduwvskmk4d3dr@uewx27aa6ake>
 <ZQ0PR01MB1160390D00404D24A31A1522EB75A@ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn>
 <3w4vaxoderuhwkqec6rwem2wrjlvql2ohyh77zqpwege7ercpl@5ac4p5mw7nhp>
 <ZQ0PR01MB1160DC63A1CC70F79036057EEB7BA@ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQ0PR01MB1160DC63A1CC70F79036057EEB7BA@ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn>

Hi Jisheng,

On Wed, Jan 24, 2024 at 04:46:43AM +0000, JiSheng Teoh wrote:
> Hi Andi,
> > 
> > ...
> > 
> > > > > +static int __maybe_unused cdns_i2c_resume(struct device *dev) {
> > > > > +	struct cdns_i2c *xi2c = dev_get_drvdata(dev);
> > > > > +	int err;
> > > > > +
> > > > > +	err = cdns_i2c_runtime_resume(dev);
> > > > > +	if (err)
> > > > > +		return err;
> > > > > +
> > > > > +	if (pm_runtime_status_suspended(dev)) {
> > > > > +		err = cdns_i2c_runtime_suspend(dev);
> > > > > +		if (err)
> > > > > +			return err;
> > > >
> > > > We call the cdns_i2c_resume() functions to come up from a suspended
> > > > state. But, if we fail to resume, we call the suspend and return '0' (because this always returns '0').
> > > >
> > > > In other words, if we take this path, we call resume, but we still end up suspended and return success.
> > > >
> > > > Andi
> > > >
> > >
> > > My understanding is that during system level resume 'cdns_i2c_resume()', the i2c device itself can still be held in runtime suspend
> > regardless of the change in system level PM.
> > > Looking back at this, we invoke cdns_i2c_runtime_resume() to enable clock and init the i2c device, the runtime PM state is still
> > unchanged and kept suspended.
> > > pm_runtime_status_suspended() will be evaluated as true, and runtime suspend 'cdns_i2c_runtime_suspend()' is invoked to
> > disable the clock. This balances the clock count enabled earlier.
> > 
> > If this is your issue, what if we do not enable the clock during resume? and we just mark the device as resumed?
> > 
> That will work as well. The i2c device will be runtime resumed again during cdns_i2c_master_xfer() anyway, but thought that it
> would be a good idea to check if the i2c device is able runtime resume during a system level resume.

That's fine, I think it might work this way, as well, so let's
keept it at your original implementation.

If we save here, we add complication somewhere else.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Before applying the patch I will read it again to make sure all
is balanced.

Thanks,
Andi

> > > The runtime PM state is only resumed during cdns_i2c_master_xfer() through pm_runtime_resume_and_get(), and subsequently
> > kept suspended through pm_runtime_put_autosuspend().
> > > Since the cdns_i2c_runtime_suspend() always return '0', I will simplify them as follow:
> > > +if (pm_runtime_status_suspended(dev))
> > > +	cdns_i2c_runtime_suspend(dev);
> > 
> > I'd prefer checking the error value, even though we are sure on the expected return. It's more future proof.
> > 
> > Andi
> > 
> Ok, I will keep the original changes.
> 
> > > > > +	}
> > > > > +
> > > > > +	i2c_mark_adapter_resumed(&xi2c->adap);
> > > > > +
> > > > > +	return 0;
> > > > > +}

