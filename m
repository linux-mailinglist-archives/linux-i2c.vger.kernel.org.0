Return-Path: <linux-i2c+bounces-704-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E68A480B483
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 14:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1811F1C20A72
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 13:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D205914A94;
	Sat,  9 Dec 2023 13:07:34 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F50B7;
	Sat,  9 Dec 2023 05:07:26 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 0373024DB84;
	Sat,  9 Dec 2023 21:07:24 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 9 Dec
 2023 21:07:23 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 9 Dec
 2023 21:07:20 +0800
From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
To: <andi.shyti@kernel.org>
CC: <jisheng.teoh@starfivetech.com>, <leyfoon.tan@starfivetech.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <michal.simek@amd.com>
Subject: Re: [PATCH v1] i2c: cadence: Add system suspend and resume PM support
Date: Sat, 9 Dec 2023 21:07:06 +0800
Message-ID: <20231209130706.1906176-1-jisheng.teoh@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231209130140.m2ym5yy5rv3pwtzn@zenone.zhora.eu>
References: <20231209130140.m2ym5yy5rv3pwtzn@zenone.zhora.eu>
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

On Sat, 9 Dec 2023 14:01:40 +0100
Andi Shyti <andi.shyti@kernel.org> wrote:

> Hi Ji Sheng,
>=20
> [...]
>=20
> > +static int __maybe_unused cdns_i2c_resume(struct device *dev)
> > +{
> > +	struct cdns_i2c *xi2c =3D dev_get_drvdata(dev);
> > +	int err;
> > +
> > +	err =3D cdns_i2c_runtime_resume(dev);
> > +	if (err)
> > +		return err;
> > +
> > +	if (pm_runtime_status_suspended(dev)) {
> > +		cdns_i2c_runtime_suspend(dev);
> > +		if (err)
> > +			return err; =20
>=20
> have you forgotten to assign 'err'?
>=20
> Andi
>=20
> > +	} =20

My bad, I will fix it in v2. Thanks Andi.

