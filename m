Return-Path: <linux-i2c+bounces-710-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A8880BA89
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Dec 2023 12:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C32BB1F20F93
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Dec 2023 11:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5214CBE69;
	Sun, 10 Dec 2023 11:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAUlHc1u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF838C15
	for <linux-i2c@vger.kernel.org>; Sun, 10 Dec 2023 11:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B7CC433C7;
	Sun, 10 Dec 2023 11:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702209258;
	bh=VcO895aojfnwILlplXsvhD/oc+9HK3LQQDHWerPGqLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GAUlHc1uSvYUyDeIsd3y5qj6MWZwM6fbj9FGyK+HvJTSFrEbZCgdq+uVwyuEP/412
	 wtXPehU1VmhFvzKOJYCr0Zeh2X0TOcjzb8aFB5H4Ba0C1qsVFdpGoeEhg3dUbOxGAM
	 E6mWJfU2x6Prt2EEseU2ZKMCsOyNAFa6WcVwZoHdoQMXNOVmc5DOurN1oVDvwyNh5V
	 4LkiPwSnum1kbC8Fw2edcyHQ24o1WNqhvrwaL3TQEDCZaDoTcfsUbwcSI0YF9KFP2M
	 HrfIPstbSH2DMy83MxrH1Z4zR3acACR45eXCzx2xUv2deeMeCXArEeJt3/DBjoPq0E
	 K5CTmExcA5tpw==
Date: Sun, 10 Dec 2023 12:54:12 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
Cc: leyfoon.tan@starfivetech.com, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	michal.simek@amd.com
Subject: Re: [PATCH v2] i2c: cadence: Add system suspend and resume PM support
Message-ID: <20231210115412.hztjrubacnmenbvz@zenone.zhora.eu>
References: <20231209205744.ehmthjvn7nuslvhd@zenone.zhora.eu>
 <20231210052018.2063-1-jisheng.teoh@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231210052018.2063-1-jisheng.teoh@starfivetech.com>

Hi Ji Sheng,

[...]

> > > +static int __maybe_unused cdns_i2c_resume(struct device *dev)
> > > +{
> >
> > I am not really understanding what you are trying to do here:
> >
> > > +	struct cdns_i2c *xi2c =3D dev_get_drvdata(dev);
> > > +	int err;
> > > +
> > > +	err =3D cdns_i2c_runtime_resume(dev);
> >
> > First you try to resume...
> >
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	if (pm_runtime_status_suspended(dev)) {
> >
> > ... then you check if you are suspended ...
>=20
> This serves as a check and balance to ensure that when the system
> resumes with device in runtime suspend state, we disable the clock
> enabled in earlier cdns_i2c_runtime_resume() to ensure a balanced clock
> reference count for subsequent runtime resume transition.
> Similar implementation can be found in this commit:
> https://github.com/torvalds/linux/commit/44c99904cf61f945d02ac9976ab10dd5=
ccaea393

OK, this is done purely for clock balancing, but then, I still
don't understand the case. I expect the clock counter to be
unbalanced when you suspend (because is moving towards '0').

While, if you check if the clock is unbalanced when resuming, it
means that the clock had a negative counter (which is impossible
because the clock counter is unsigned).

If there is any unbalancing at this stage, then I recommend you
to check what has happened previously.

=2E.. Or is there anything I am missing?

Thanks,
Andi

> > > +		err =3D cdns_i2c_runtime_suspend(dev);
> >
> > ... and suspend again? Shouldn't this be _resume()?
> >
> > Thanks,
> =1B[O> Andi
> >
> > > +		if (err)
> > > +			return err;
> > > +	}
> > > +
> > > +	i2c_mark_adapter_resumed(&xi2c->adap);
> > > +
> > > +	return 0;
> > > +}

