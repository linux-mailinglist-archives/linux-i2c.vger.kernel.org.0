Return-Path: <linux-i2c+bounces-908-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF8281A01E
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 14:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A01781F25B91
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 13:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A427358A5;
	Wed, 20 Dec 2023 13:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="esTol5AA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46B42574F;
	Wed, 20 Dec 2023 13:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC90A20008;
	Wed, 20 Dec 2023 13:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703080001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2UdwF1Rjcv1TKOg33yHMjjbxn0Z7BKkWICiZ67r61hM=;
	b=esTol5AAWX5bDskH5pub/LxILQiWTedAKsAT9CGjYD0I7f54SKWg/H4R+0RW1Cg8FrbHzs
	SQJNtI5USdXeAZPMm1rt40n8FKGwhD4CueKisXGdFYky8YVptjTfeoo0xq0yOZDrSvpvQc
	YAtvmm2TBHhUx7y35rSddoTozFftOhr88ux+oKNn7LFjgOR8o5kcb3sYgHbZvmJ8RqDp1S
	HnkMnGr07e4Qm95aoUV4LXzngihtsJWIKHSG82+uWiVFMfUqIU4A08gulkfHAAQSRIGE0q
	iIG8Zd8v6+AkTQ2BkOVMCwZ9H06asPsLQyQrpmlRD1a3cbLvWfDTC9LvNa53Nw==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Dec 2023 14:46:39 +0100
Message-Id: <CXT7H2RTWJLL.11PFC2VV861BW@bootlin.com>
To: "Thomas Richard" <thomas.richard@bootlin.com>, "Tony Lindgren"
 <tony@atomide.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: omap-i2c: runtime pm issue during suspend to ram
Cc: <linux-pm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Kevin Hilman" <khilman@kernel.org>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, "Kumar Udit" <u-kumar1@ti.com>
X-Mailer: aerc 0.15.2
References: <f68c9a54-0fde-4709-9d2f-0d23a049341b@bootlin.com>
 <4c31acd8-4edb-44f5-9a90-cb2f2dc530b6@bootlin.com>
 <20231220111415.GZ5166@atomide.com>
 <7b743758-fbc1-4cad-bfbc-d3fd3e69ce17@bootlin.com>
In-Reply-To: <7b743758-fbc1-4cad-bfbc-d3fd3e69ce17@bootlin.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Wed Dec 20, 2023 at 12:36 PM CET, Thomas Richard wrote:
> On 12/20/23 12:14, Tony Lindgren wrote:
> > * Thomas Richard <thomas.richard@bootlin.com> [231220 10:50]:
> >> On 12/19/23 18:15, Thomas Richard wrote:
> >>> Hello,
> >>
> >> I add some people in this thread.
> >>
> >>>
> >>> I have a gpio expander (pca953x driver) connected to an i2c controlle=
r
> >>> managed by the omap-i2c driver.
> >>> And I have some issues with pm_runtime_force_suspend/resume during
> >>> suspend to ram.
> >>> For some reasons, related to hardware design, I need to access to thi=
s
> >>> gpio expander during suspend_noirq and resume_noirq. So I had to move
> >>> the suspend/resume of the pca953x to suspend_noirq/resume_noirq.
> >=20
> > Hmm at noirq level you need to do polling on the i2c controller?
>
> Hello Tony,
>
> Thanks for your reply.
>
> No, irq is still active in suspend_noirq for this i2c controller due to
> the flag IRQF_NO_SUSPEND [1].
> If this flag is set, the interrupt is still enabled in suspend_noirq [2].
>
> [1]
> https://elixir.bootlin.com/linux/v6.7-rc6/source/drivers/i2c/busses/i2c-o=
map.c#L1473
> [2]
> https://www.kernel.org/doc/html/latest/power/suspend-and-interrupts.html#=
the-irqf-no-suspend-flag
>
> >=20
> >>> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-o=
map.c
> >>> index 42165ef57946..fe79b27b46fd 100644
> >>> --- a/drivers/i2c/busses/i2c-omap.c
> >>> +++ b/drivers/i2c/busses/i2c-omap.c
> >>> @@ -1575,9 +1575,24 @@ static int __maybe_unused
> >>> omap_i2c_runtime_resume(struct device *dev)
> >>>         return 0;
> >>>  }
> >>>
> >>> +static int omap_i2c_suspend(struct device *dev)
> >>> +{
> >>> +       pm_runtime_get_sync(dev);
> >>> +       pm_runtime_disable(dev);
> >>> +       return 0;
> >>> +}
> >=20
> > If you want the i2c controller enabled during suspend, you can leave it
> > enabled above, and as we already have SET_NOIRQ_SYSTEM_SLEEP_PM_OPS
> > doing force_suspend() and force_resume(), you can runtime PM put on
> > resume. So something like below might do the trick:
>
> Ok I'll test it. Thanks

The issue with this approach is that it requires knowing at suspend-time
if the controller will be used at resume_noirq-time. Ideally the
controller's behavior would not be modified until a xfer is done at
resume_noirq time. There are many platforms that use this driver that
probably don't need the controller woken up.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

