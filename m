Return-Path: <linux-i2c+bounces-1442-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA156839A49
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 21:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7765F286E15
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 20:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807D91FD7;
	Tue, 23 Jan 2024 20:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+xOOFM4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5101FB2;
	Tue, 23 Jan 2024 20:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706041938; cv=none; b=FOK1mLE0TkRVWbzfzgb6G/tweUW2ht3igMosSBmUYYlKJiZuc7HEax01QYMH5KFICnLBM3a9+vv4dtxXmv4uHor+dyc1selvW75Zr8fj+ZroHSR5aO1swet1pyoe26rKi6PUSM3SYxeKbs+DfVD8p6IEPS/AxLSUW/dioyBgXsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706041938; c=relaxed/simple;
	bh=EA9JSZWPH7wO0kUEvAKQ8/ihcCizhpLhN82A91mzWII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJ0FvMBPe+RYJp1MzlflEGOMyQ/C9v788sMNXvlQ76XRbpQnkNM9W09x4Vy6CzEifrbcCc7uRoJckn3XWU8ufdU3F7Hrzgx7iXb4yCAiAi4XknF6h9jjyr9RfgbGZyQDa7ss9i7JzIOMnyGslQn7TTpsQ0RPHLzn/z/m1DDFYzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+xOOFM4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C84C433C7;
	Tue, 23 Jan 2024 20:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706041937;
	bh=EA9JSZWPH7wO0kUEvAKQ8/ihcCizhpLhN82A91mzWII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f+xOOFM4GM0/TOupdsS6qril11p5BRY9kgvwLdDA1lvd9skwc+QaehID0rg1hgxaV
	 6u7MvcQhf9PSdMVdu/TV9h9i31Bh37YNhSnQCX1lQZA+EIg8zFft+fCBgGmwnzbzV3
	 mK72ss2uJ33cvPiTxzKUzuzzGW2q3EFEl7YzGM4vPfJjmXN/hVx3pYdmDFJUMDtxne
	 C9+zuQzQ2Vve8erh9GFKeghsnRnKM6fk5Jkb3/yDDiDgBwNEZNPmHMm3auY4JcyHGh
	 /Q97+JIbPJgQ/m9VJHCp166lWdQkRkS3swB/Jxyd81QajUaFqo19S61f0aSePsvELj
	 ZvACpwCicfzIA==
Date: Tue, 23 Jan 2024 21:32:10 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: JiSheng Teoh <jisheng.teoh@starfivetech.com>
Cc: Michal Simek <michal.simek@amd.com>, 
	Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 RESEND] i2c: cadence: Add system suspend and resume PM
 support
Message-ID: <3w4vaxoderuhwkqec6rwem2wrjlvql2ohyh77zqpwege7ercpl@5ac4p5mw7nhp>
References: <20240119013326.3405484-1-jisheng.teoh@starfivetech.com>
 <ko44i4n5synf3uugp4wmjoe6eikyw3bzjtmarduwvskmk4d3dr@uewx27aa6ake>
 <ZQ0PR01MB1160390D00404D24A31A1522EB75A@ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQ0PR01MB1160390D00404D24A31A1522EB75A@ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn>

Hi Ji Sheng,

...

> > > +static int __maybe_unused cdns_i2c_resume(struct device *dev) {
> > > +	struct cdns_i2c *xi2c = dev_get_drvdata(dev);
> > > +	int err;
> > > +
> > > +	err = cdns_i2c_runtime_resume(dev);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	if (pm_runtime_status_suspended(dev)) {
> > > +		err = cdns_i2c_runtime_suspend(dev);
> > > +		if (err)
> > > +			return err;
> > 
> > We call the cdns_i2c_resume() functions to come up from a suspended state. But, if we fail to resume, we call the suspend and return
> > '0' (because this always returns '0').
> > 
> > In other words, if we take this path, we call resume, but we still end up suspended and return success.
> > 
> > Andi
> > 
> 
> My understanding is that during system level resume 'cdns_i2c_resume()', the i2c device itself can still be held in runtime suspend regardless of the change in system level PM.
> Looking back at this, we invoke cdns_i2c_runtime_resume() to enable clock and init the i2c device, the runtime PM state is still unchanged and kept suspended.
> pm_runtime_status_suspended() will be evaluated as true, and runtime suspend 'cdns_i2c_runtime_suspend()' is invoked to disable the clock. This balances the clock count enabled earlier.

If this is your issue, what if we do not enable the clock during
resume? and we just mark the device as resumed?

> The runtime PM state is only resumed during cdns_i2c_master_xfer() through pm_runtime_resume_and_get(), and subsequently kept suspended through pm_runtime_put_autosuspend().
> Since the cdns_i2c_runtime_suspend() always return '0', I will simplify them as follow:
> +if (pm_runtime_status_suspended(dev))
> +	cdns_i2c_runtime_suspend(dev);

I'd prefer checking the error value, even though we are sure on
the expected return. It's more future proof.

Andi

> > > +	}
> > > +
> > > +	i2c_mark_adapter_resumed(&xi2c->adap);
> > > +
> > > +	return 0;
> > > +}

