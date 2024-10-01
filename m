Return-Path: <linux-i2c+bounces-7112-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BFB98B253
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 04:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CDF4282E33
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 02:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B263A267;
	Tue,  1 Oct 2024 02:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qXvIEiUl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272B2FC08;
	Tue,  1 Oct 2024 02:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727750381; cv=none; b=PRsYDLpr4UU0pdvsRgZOv6T5L+Kh2Az3gx8Mk+eRr9ZqJYVcN0MPnpCJ4T1XlFFpKNy3+yY+q2sqXBhaHtKUJxCDRXGjvYaPivgA6p4DJ466GvftVaxgqSe1CVji/4HvzUzhdMzQDZkOjNmxmsutQo7eZiPN20hFQgAl9FeaEE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727750381; c=relaxed/simple;
	bh=cbiZIGp8Fe7TqrapbtTHE1aVZkZFl1EXlstBACj0Xgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECM/twuaNRILJOi2Bp18NVzu5vj1tb0VdgJOgnQMzg494etSrwh0yhBHrnxFiaGoZNPW8XQ2CvrLaIYe5O3BB/ji6Z+UnW/NmM31rMnKKYMQ2/fxCr8zRQZKKteEySeFF19S+FbIen2GhQF80+7NqNvgGIg60CsN0TWiz83RHqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qXvIEiUl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E8BC4CEC7;
	Tue,  1 Oct 2024 02:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727750380;
	bh=cbiZIGp8Fe7TqrapbtTHE1aVZkZFl1EXlstBACj0Xgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qXvIEiUl0Mz5VdMuPNvZxf3nlQ4iFEDprNhDtjpwrtm49TFnopemsvm4xv34CbMKA
	 vvY+ky/Tu9Ob21Xx8NrbuyXJ5yxi4cqzYEwOKBFQ0sOgM8qPN70qbh31/eHcxNsUbP
	 S9CeTYYHw9nawZXcqHeXV9ziQhEh6U/n5eeFXEZaKQMclqdZAjdq+EyItBmVn9z6LP
	 /7qzINduC+YSArKb8mfWMUul1Uu0pVZNJx7qislRyITGIHHyHZZBie6nLpV4xsdKkC
	 FTEcG0C/8p0OU2TMy49rCOavji+iP895AsYPnX5G/eoIGTKYuXWmCXlzzeZvq4a0d1
	 awm85rl2gN16g==
Date: Mon, 30 Sep 2024 21:39:36 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, 
	konrad.dybcio@linaro.org, andi.shyti@kernel.org, linux-arm-msm@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, 
	linux@treblig.org, Frank.Li@nxp.com, konradybcio@kernel.org, 
	bryan.odonoghue@linaro.org, krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
Message-ID: <7eg2g2ykqccc74l6chkwlq54wcobzevqlzngkr3lnegv36pcsb@t3asip2mbmew>
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
 <20240927063108.2773304-5-quic_msavaliy@quicinc.com>
 <lmo4jylfwt3wingdqb6zc6ew2537kqksuckfyd7vwuu4ufg5cr@ic2j7bv2r6e4>
 <42e0622d-0bb6-4850-bf5a-629996c702db@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42e0622d-0bb6-4850-bf5a-629996c702db@stanley.mountain>

On Mon, Sep 30, 2024 at 11:21:23AM GMT, Dan Carpenter wrote:
> On Sun, Sep 29, 2024 at 10:46:37PM -0500, Bjorn Andersson wrote:
> > > @@ -602,6 +603,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
> > >  	peripheral.clk_div = itr->clk_div;
> > >  	peripheral.set_config = 1;
> > >  	peripheral.multi_msg = false;
> > > +	peripheral.shared_se = gi2c->se.shared_geni_se;
> > >  
> > >  	for (i = 0; i < num; i++) {
> > >  		gi2c->cur = &msgs[i];
> > > @@ -612,6 +614,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
> > >  		if (i < num - 1)
> > >  			peripheral.stretch = 1;
> > >  
> > > +		peripheral.first_msg = (i == 0);
> > > +		peripheral.last_msg = (i == num - 1);
> > 
> > There are multiple error paths in this loop, which would result in us
> > never issuing the unlock TRE - effectively blocking other subsystems
> > from accessing the serial engine until we perform our next access
> > (assuming that APSS issuing a lock TRE when APSS already has the channel
> > locked isn't a problem?)
> > 
> 
> Hi Bjorn,
> 
> I saw the words "error paths" and "unlock" and I thought there was maybe
> something we could do here with static analysis.

Appreciate you picking up on those topics :)

> But I don't know what TRE or APSS mean.
> 

The "APSS" is "the application processor sub system", which is where
we typically find Linux running. TRE is, if I understand correctly, a
request on the DMA engine queue.

> The one thing I do see is that this uses "one err" style error handling where
> there is one err label and it calls dmaengine_terminate_sync(gi2c->rx_c)
> regardless of whether or not geni_i2c_gpi() was called or failed/succeeded.
> 

The scheme presented in this series injects a "LOCK" request before the
DMA request marked first_msg, and an "UNLOCK" after the ones marked
last_msg. This is needed because the controller is also concurrently by
some DSP (or similar), so the LOCK/UNLOCK scheme forms mutual exclusion
of the operations between the Linux and DSP systems.

I'm not sure if it's possible to tie the unlock operation to
dmaengine_terminate_sync() in some way.

Giving this some more thought, it feels like the current scheme serves
the purpose of providing mutual exclusion both for the controller and
to some degree for the device. But I'd like to understand why we can't
inject the lock/unlock implicitly for each transfer...

Regards,
Bjorn

> regards,
> dan carpenter
> 

