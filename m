Return-Path: <linux-i2c+bounces-14488-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CAACB275F
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 09:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CE65303A0A2
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 08:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B2527FD4F;
	Wed, 10 Dec 2025 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ID0HvRN8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay22-hz2.antispameurope.com (mx-relay22-hz2.antispameurope.com [83.246.65.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D07242D60
	for <linux-i2c@vger.kernel.org>; Wed, 10 Dec 2025 08:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.196
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765356728; cv=pass; b=Qxek/tOxklOlAUjUo2raonHE9IL7X4t1Y4Oez1Y5TwsRrFuKgxpjIj/NiUaHCSpDatnc1a8VZ069Ai1cIIU+aGNHTFkc8weMFn7CiyG00z/HjSlBGGOzpAqHqKir37W/vnRz/ZIjukokbj+5FhxW6pGoXZA8ww4NsIbqRo/lm6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765356728; c=relaxed/simple;
	bh=cffl2y/St3Qh9VumdcAZU6SHmJFRyOOCgpbollTMnb8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nSdnIw4Wyv/af+TB4z4vlW845cEYrsQxr0mBPRKDLmP7IKjDNI3UIBuwJIBPzDBlgLDQzCzmRquEEBya083MnK+F05XcAMo5D0XtXbQbaMD+zBcXxsFvcZ73BinzmrBzRJTkYKz6aus2RmZ2e09b593Ne9TOB5QV6ccCx1a2Wbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ID0HvRN8; arc=pass smtp.client-ip=83.246.65.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate22-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=AfV50FzUIvqB65zrJkDowrhbGMRTncM9g9m9kFiy1uU=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765356675;
 b=R0RrBiCeTjraNytlO63ED7wb/n9gbhhUUsMxR1EzcQ+Wn566CqqK3b4tfWNoI1JhpE7MgPGs
 jA+DhRMGK0nhSs3RVi1KF+QFdLaqYB1m6tJx4a7MVOKTEZTerKE8tgLS0L/xRYBlsXFJS5UkucX
 NLmS21BEqaf238rD0n3oGk733nDR2g+lJNFyKoJUIbEsN2e74NJKkE3w7/LS7Jp4Rq2fJDaY9C4
 XGjYJS32xduix5/lSkfVfGMFlk48Xb5QBv5P5EZTHpavkvFw5fWkP+VI1giW+fa62z2TMyB7YJm
 YG3xk4P4PWrg0RryJ7CVWAZ9YLXCJj2iYYyquT4rzuEoQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765356675;
 b=hekU2+74M6/rxAQqOZCVo3lRnZ0vRapE2b87fuy/Xc1y2GHb2PAlFJdMaeb8sMLqCGAufCpZ
 38MocXriNcHiqG2dzBfVGIR4lYKxEBu2GejCXdoMK3H6iHMnlAlQmmEiP/v5woKGyVcipVuNr9s
 VFF5zui6mH5EGmmw+To5PRZtkg9Le8VE7KriP0LkyppJeAdh8qL47r1pj1AKRQFNzoDtW7ocJKE
 H8XIGWCf5C9lKzPj1be7aAXXhzSNUmGVtz2F/NwBuUh5r+P/xsjzvTbQUMRocc1qdMQAygsrwT9
 yMty5xFl56XogjpX60nk7m900JFRjV9oxqfrGuXpEbm9g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay22-hz2.antispameurope.com;
 Wed, 10 Dec 2025 09:51:15 +0100
Received: from [192.168.153.128] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id AC7D4CC0CC3;
	Wed, 10 Dec 2025 09:51:07 +0100 (CET)
Message-ID: <8c596aa4718fa66a949286f0686286a4024a4637.camel@ew.tq-group.com>
Subject: Re: [PATCH v2 1/2] i2c: ocores: increase poll timeout to total
 transfer timeout
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Peter Korsgaard <peter@korsgaard.com>, Andi Shyti
 <andi.shyti@kernel.org>,  linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Date: Wed, 10 Dec 2025 09:51:07 +0100
In-Reply-To: <a528cdb9c861b8fb97ab1a99901378908f2e0e89.camel@ew.tq-group.com>
References: 
	<51a72ceca0154d7be85c3cc67722e7dd0b364a2e.1760000254.git.matthias.schiffer@ew.tq-group.com>
	 <60744be2-1a22-4056-bf05-22f64fb8b484@lunn.ch>
	 <a528cdb9c861b8fb97ab1a99901378908f2e0e89.camel@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-cloud-security-sender:matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient:linux-i2c@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay22-hz2.antispameurope.com with 4dR8Zh13j8z3BMpn
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:2a1785e38c4bc209a523cfc05277b86e
X-cloud-security:scantime:2.121
DKIM-Signature: a=rsa-sha256;
 bh=AfV50FzUIvqB65zrJkDowrhbGMRTncM9g9m9kFiy1uU=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765356675; v=1;
 b=ID0HvRN8qvs5oxc4oTxsATuKJyvYD2HLYU3cqtdgZpWTE02hjg2eZ60mO1mwEDf4tL7FY6KH
 WsLSE3OLBkUS3wXsPuza+SzjjPunhjQyYVU8aTcIz+pK/V4ZzEgPhoKD8ib/0yILeOR6/aCgMpC
 N+fZi8ZLCGFzJyWudBGMVwy3jMPjIppxYh4aHOi4jy7vsTW3JiTePlFzTgwrxuBS7j7XpRkTYN7
 6Isz5nmDOY96MpznLmV/3zVDUGcOXrdAdycqCuKRMwPXcjWevamxsDPTVAKiFD0rwn1ysnhXldG
 eKiwr9hMdTRey4PAdsNvaYTOQwToRpV1fPrRZC0Z+SuDQ==

On Thu, 2025-10-09 at 15:26 +0200, Matthias Schiffer wrote:
> On Thu, 2025-10-09 at 15:20 +0200, Andrew Lunn wrote:
> > On Thu, Oct 09, 2025 at 11:19:49AM +0200, Matthias Schiffer wrote:
> > > When a target makes use of clock stretching, a timeout of 1ms may not=
 be
> > > enough. One extreme example is the NXP PTN3460 eDP to LVDS bridge, wh=
ich
> > > takes ~320ms to send its ACK after a flash command has been
> > > submitted.
> > >=20
> > > The behavior in the regular case is unchanged, spinning for up to 1ms=
,
> > > but the open-coded poll loop is replaced with read_poll_timeout_atomi=
c()
> > > as suggested by Andrew Lunn. In cases where 1ms is not sufficient,
> > > read_poll_timeout() is used, allowing a total transfer time up to the
> > > timeout set in struct i2c_adapter (defaulting to 1s, configurable thr=
ough
> > > the I2C_TIMEOUT ioctl).
> >=20
> > Thanks
> >=20
> > Did you test with CONFIG_DEBUG_ATOMIC_SLEEP enabled? I don't think it
> > is an issue, but the old code could be used in atomic context because
> > it never slept.
>=20
> I did not, but there is only one call chain ocores_xfer_core ->
> ocores_process_polling -> ocores_poll_wait -> ocores_wait, which is defin=
itely
> not used in atomic context (in IRQ mode, ocores_xfer_core calls
> wait_event_timeout, which might_sleep()).
>=20
> Best,
> Matthias
>=20
>=20
>=20
> >=20
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> >=20
> >     Andrew
>=20

Hi everyone,

are these patches still missing anything?

Best,
Matthias




--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

