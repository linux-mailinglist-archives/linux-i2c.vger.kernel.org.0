Return-Path: <linux-i2c+bounces-902-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6508C819DBF
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 12:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 214AB289598
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 11:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBB721104;
	Wed, 20 Dec 2023 11:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="ZSPIgHgn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAE121365;
	Wed, 20 Dec 2023 11:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id CAEE3604FD;
	Wed, 20 Dec 2023 11:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1703070875;
	bh=rHt+TIbvecVF3zhIa86RfsCbaCT+biJ90R6Ht68Cq7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZSPIgHgnvKOkJSzwfIt/utAArc87UGiI9JL+CSlwSFWax4aN50Cz2ALjdNsHTUXE+
	 doAE1NW0Je6DihKezY5aofGzT+Cx++jvHjLZBlgay3SnbZ4MJ/RCZCgHL74yqjgP0T
	 iXHVDcEMv0UE/H2NsxA8xaeE0CtSIFwG71trSUN3bOL45SGxT1aHdd/w0blLjGjaZc
	 25BtVMGopeFtHwHtsYOck3eIp2F0/tJFiBoPc50M9P0lpgMBIICJ/gWhMl9xHM0LhS
	 CJs4Qr4TJekRaw54V9xI0INJl6AfEiRBscp1fTb15TMrjDsOJ+4RXvq+W818ZVSTih
	 dv4yj8p3FDJSQ==
Date: Wed, 20 Dec 2023 13:14:15 +0200
From: Tony Lindgren <tony@atomide.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-omap@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Kevin Hilman <khilman@kernel.org>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Kumar Udit <u-kumar1@ti.com>
Subject: Re: omap-i2c: runtime pm issue during suspend to ram
Message-ID: <20231220111415.GZ5166@atomide.com>
References: <f68c9a54-0fde-4709-9d2f-0d23a049341b@bootlin.com>
 <4c31acd8-4edb-44f5-9a90-cb2f2dc530b6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c31acd8-4edb-44f5-9a90-cb2f2dc530b6@bootlin.com>

* Thomas Richard <thomas.richard@bootlin.com> [231220 10:50]:
> On 12/19/23 18:15, Thomas Richard wrote:
> > Hello,
> 
> I add some people in this thread.
> 
> > 
> > I have a gpio expander (pca953x driver) connected to an i2c controller
> > managed by the omap-i2c driver.
> > And I have some issues with pm_runtime_force_suspend/resume during
> > suspend to ram.
> > For some reasons, related to hardware design, I need to access to this
> > gpio expander during suspend_noirq and resume_noirq. So I had to move
> > the suspend/resume of the pca953x to suspend_noirq/resume_noirq.

Hmm at noirq level you need to do polling on the i2c controller?

> > diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> > index 42165ef57946..fe79b27b46fd 100644
> > --- a/drivers/i2c/busses/i2c-omap.c
> > +++ b/drivers/i2c/busses/i2c-omap.c
> > @@ -1575,9 +1575,24 @@ static int __maybe_unused
> > omap_i2c_runtime_resume(struct device *dev)
> >         return 0;
> >  }
> > 
> > +static int omap_i2c_suspend(struct device *dev)
> > +{
> > +       pm_runtime_get_sync(dev);
> > +       pm_runtime_disable(dev);
> > +       return 0;
> > +}

If you want the i2c controller enabled during suspend, you can leave it
enabled above, and as we already have SET_NOIRQ_SYSTEM_SLEEP_PM_OPS
doing force_suspend() and force_resume(), you can runtime PM put on
resume. So something like below might do the trick:

static int omap_i2c_suspend(struct device *dev)
{
	return pm_runtime_resume_and_get(dev);
}

static int omap_i2c_resume(struct device *dev)
{
	pm_runtime_mark_last_busy(dev);
	pm_runtime_put_autosuspend(dev);

	return 0;
}

> >  static const struct dev_pm_ops omap_i2c_pm_ops = {
> >         SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> >                                       pm_runtime_force_resume)
> > +       SET_SYSTEM_SLEEP_PM_OPS(omap_i2c_suspend, omap_i2c_resume)
> >         SET_RUNTIME_PM_OPS(omap_i2c_runtime_suspend,
> >                            omap_i2c_runtime_resume, NULL)
> >  };

And with the changes you did to omap_i2c_pm_ops naturally. This way
the controller should stay active until noirq ops.

Of course it's possible I did not quite understand what you're trying
to do, but if so please let me know :)

Regards,

Tony

