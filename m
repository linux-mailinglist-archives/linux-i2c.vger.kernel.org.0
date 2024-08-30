Return-Path: <linux-i2c+bounces-5956-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD50965C50
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 11:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89676281D7D
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 09:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48AE170836;
	Fri, 30 Aug 2024 09:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="SN2/oSaD";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="GhjbWqWL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EA116F0E6;
	Fri, 30 Aug 2024 09:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725008842; cv=none; b=oalx0RvJihF7IlsQiAdQ1BlIBwaVAVHkC9woCGZxSkt7OFCi11VRcgjg3YrqsagqXEbTlSeKnHEwcE9ZnWTl4xvvjUrTe+RLH4cb6z2E/FOShLGLau0hsaJQXDkMvO+6jwtNSobSre5FSghAwm2M0qwBalWYDF5SB4x0ziUcf18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725008842; c=relaxed/simple;
	bh=axg+WoXprUIi60W8u8lts9DfH6O5NAncZwMUJK4oO58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oVilp8kHAtK5QbhCwO596JJZ6okllx+VD5lfBzYrcpMICfMvH1HvSS9KXL+Dx3LYFt+k3mNnVdQQZIHMoNk/iOHeTS7jFZRN0T6yiZqKzve/dhd/hMTLGiH2WeGdajwjvFS0oU8yuTdDMeuabA1BxqN+Xihz7A2RLYSFPz335zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=SN2/oSaD; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=GhjbWqWL reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1725008840; x=1756544840;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=axg+WoXprUIi60W8u8lts9DfH6O5NAncZwMUJK4oO58=;
  b=SN2/oSaD/YvBrU0xPeup3C5klyMejLghzsKFeyVJp9zHEA+NHKZwi1Qt
   FrYbcsEEGFKV7CDwfTrS6v0eWjMbKejXz8yNS3qzrxgoH1qgooIDnfuuJ
   VhTAKUhmtvNYqAfK3uJ4e9eK1OUZR/MwNtjnMzghBYClPRv0FEtf2yjC9
   oYaPSuzY+IjNMaIuFEWRseh6H0WGIAW/mKPaeG7rElXXvVdZXEmGxjQCO
   OeqEM85M8rd6Z79IQLqXrDd4QUDqh7hlb+l4ynyUXQ147wpqYkKHSftuc
   YdEs0teDzBfYbWKvss3fAIgsf1vODUZwM38svsKj7OYZ/Hntqx/0hoQkX
   Q==;
X-CSE-ConnectionGUID: NF7mQx7gRoeP0LQbitk/rQ==
X-CSE-MsgGUID: FZ2UxEd8Tzq75rd5vMItXQ==
X-IronPort-AV: E=Sophos;i="6.10,188,1719871200"; 
   d="scan'208";a="38677653"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Aug 2024 11:07:16 +0200
X-CheckPoint: {66D18BC4-1E-5FF8EC80-F6CEE9F8}
X-MAIL-CPID: C4AF2A606FCF8B04840683A0211A1F71_0
X-Control-Analysis: str=0001.0A782F20.66D18BC4.0132,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67146165E1C;
	Fri, 30 Aug 2024 11:07:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1725008832;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=axg+WoXprUIi60W8u8lts9DfH6O5NAncZwMUJK4oO58=;
	b=GhjbWqWL2Anvq1LkFOHCXvD3RaRweQdf5tpTlVxUYwbxRSIlLvbZxZ7ZB5RZe3+snOR+5N
	FFvg/Rti+3v2wb7zuRCiisgw8aoJX+U5+LxtQDGugj07slX8Kajtcqnwux1bfPsoaormrj
	vOGbCYrky2fHvAQF2K7iJzlNn+JS8ZdGDrnK1byVAv9uw4jA+MsYaVkIBrS8us5BHi0UNV
	HBh2Bk0foxHpRy6okVs28Pi21tk6eh5kylPeh3FyFrYdwQ5vKzYLs9wta8OqJyZfcBaFYa
	tWVgDQZgiH4Aej7E7N8bJcNyWHHGio+A5ZxpOfvYJffZBbeTqy0epjPqNY547w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Aisheng Dong <aisheng.dong@nxp.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Carlos Song <carlos.song@nxp.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/5] i2c: imx-lpi2c: increase PM timeout to avoid operate clk frequently
Date: Fri, 30 Aug 2024 11:07:10 +0200
Message-ID: <3775392.MHq7AAxBmi@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <DB7PR04MB500383BFE3957B1E422270AEE8972@DB7PR04MB5003.eurprd04.prod.outlook.com>
References: <20240829093722.2714921-1-carlos.song@nxp.com> <4375906.ejJDZkT8p0@steina-w> <DB7PR04MB500383BFE3957B1E422270AEE8972@DB7PR04MB5003.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Freitag, 30. August 2024, 10:53:16 CEST schrieb Carlos Song:
> > -----Original Message-----
> > From: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Sent: Thursday, August 29, 2024 6:55 PM
> > To: Aisheng Dong <aisheng.dong@nxp.com>; andi.shyti@kernel.org;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > festevam@gmail.com; linux-arm-kernel@lists.infradead.org
> > Cc: linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Car=
los Song
> > <carlos.song@nxp.com>
> > Subject: [EXT] Re: [PATCH 5/5] i2c: imx-lpi2c: increase PM timeout to a=
void
> > operate clk frequently
> >
> > Caution: This is an external email. Please take care when clicking link=
s or
> > opening attachments. When in doubt, report the message using the 'Repor=
t this
> > email' button
> >
> >
> > Hi,
> >
> > Am Donnerstag, 29. August 2024, 11:37:22 CEST schrieb carlos.song@nxp.c=
om:
> > > From: Clark Wang <xiaoning.wang@nxp.com>
> > >
> > > Switching the clock frequently will affect the data transmission
> > > efficiency, and prolong the timeout to reduce autosuspend times for
> > > lpi2c.
> >
> > Efficiency as in throughput or total time per transfer? Do you have any=
 numbers?
> >
>=20
> Hi, Thank your for your quick ack!
>=20
> Apologies for the unclear explanation. The efficiency I'm referring to is=
n't just for I2C. For platforms with SC firmware
> like the 8X series, every i2c transfer to enable or disable the clock not=
ifies the SC firmware to perform a clock operation.
> So if the autosuspend time is short, i2c may enable and disable clock fre=
quently, it will occupy resources of the SC firmware.
>=20
> Therefore, we add this patch to minimize the excessive sc firmware resour=
ce waste caused by frequent I2C clock enable/disable operations.

Thanks for the explanation. So this delay only occurs on systems using an S=
C (imx8qm/qxp) or SM (imx95), right?
Is there a chance to detect this kind of clock provider and make this timeo=
ut configurable?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



