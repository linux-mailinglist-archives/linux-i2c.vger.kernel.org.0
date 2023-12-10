Return-Path: <linux-i2c+bounces-711-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B774B80BC27
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Dec 2023 17:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF9651C203B9
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Dec 2023 16:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE5F1799A;
	Sun, 10 Dec 2023 16:21:58 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84354FA;
	Sun, 10 Dec 2023 08:21:52 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A5F2C24DB84;
	Mon, 11 Dec 2023 00:21:49 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 11 Dec
 2023 00:21:49 +0800
Received: from localhost.localdomain (42.189.171.87) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 11 Dec
 2023 00:21:44 +0800
From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
To: <andi.shyti@kernel.org>
CC: <jisheng.teoh@starfivetech.com>, <leyfoon.tan@starfivetech.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <michal.simek@amd.com>
Subject: Re: [PATCH v2] i2c: cadence: Add system suspend and resume PM support
Date: Mon, 11 Dec 2023 00:21:19 +0800
Message-ID: <20231210162119.364-1-jisheng.teoh@starfivetech.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20231210115412.hztjrubacnmenbvz@zenone.zhora.eu>
References: <20231210115412.hztjrubacnmenbvz@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

On Sun, 10 Dec 2023 12:54:12 +0100
Andi Shyti <andi.shyti@kernel.org> wrote:

> Hi Ji Sheng,
>=20
> [...]
>=20
> > > > +static int __maybe_unused cdns_i2c_resume(struct device *dev)
> > > > +{ =20
> > >
> > > I am not really understanding what you are trying to do here:
> > > =20
> > > > +	struct cdns_i2c *xi2c =3D dev_get_drvdata(dev);
> > > > +	int err;
> > > > +
> > > > +	err =3D cdns_i2c_runtime_resume(dev); =20
> > >
> > > First you try to resume...
> > > =20
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > +	if (pm_runtime_status_suspended(dev)) { =20
> > >
> > > ... then you check if you are suspended ... =20
> >=20
> > This serves as a check and balance to ensure that when the system
> > resumes with device in runtime suspend state, we disable the clock
> > enabled in earlier cdns_i2c_runtime_resume() to ensure a balanced
> > clock reference count for subsequent runtime resume transition.
> > Similar implementation can be found in this commit:
> > https://github.com/torvalds/linux/commit/44c99904cf61f945d02ac9976ab1=
0dd5ccaea393
> > =20
>=20
> OK, this is done purely for clock balancing, but then, I still
> don't understand the case. I expect the clock counter to be
> unbalanced when you suspend (because is moving towards '0').
>=20
> While, if you check if the clock is unbalanced when resuming, it
> means that the clock had a negative counter (which is impossible
> because the clock counter is unsigned).
>=20
> If there is any unbalancing at this stage, then I recommend you
> to check what has happened previously.
>=20
> ... Or is there anything I am missing?
>=20
> Thanks,
> Andi

You are right, the clock counter will move towards 0 during system
suspend.
Conversely during system resume, the clock counter is incremented to 1
early on in cdns_i2c_runtime_resume(). So the clock counter is not
negative to start with.=20
At this point of time, clock counter is 1. If the device is in runtime
suspend, we decrement the clock counter back to 0, so the subsequent
runtime resume could increment it back to 1. In a sense, balancing the
clock counter.
Please help correct me if I've got it wrong.

>=20
> > > > +		err =3D cdns_i2c_runtime_suspend(dev); =20
> > >
> > > ... and suspend again? Shouldn't this be _resume()?
> > >
> > > Thanks,
> > > Andi
> > > =20
> > > > +		if (err)
> > > > +			return err;
> > > > +	}
> > > > +
> > > > +	i2c_mark_adapter_resumed(&xi2c->adap);
> > > > +
> > > > +	return 0;
> > > > +} =20



