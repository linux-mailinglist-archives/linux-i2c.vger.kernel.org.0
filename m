Return-Path: <linux-i2c+bounces-13401-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E7BBC1A56
	for <lists+linux-i2c@lfdr.de>; Tue, 07 Oct 2025 16:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7F2E034F97A
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Oct 2025 14:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6F52DFA27;
	Tue,  7 Oct 2025 14:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="GP8drtwM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay09-hz2.antispameurope.com (mx-relay09-hz2.antispameurope.com [83.246.65.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0841CF96
	for <linux-i2c@vger.kernel.org>; Tue,  7 Oct 2025 14:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759846027; cv=pass; b=jIGW5+TtOJZw29AOqwyHI/YxDlo7xK0P88GRfYn63LiSTz43C7ukfH6z0522MqBF4AiIceFwDjMmChUq0/cLM2c+jH2HeLBTpiRMzL9uURHTS1MPGK/aqGrwZST5VWi3E+OuwRDPdvAoS3K36POvvsGp3B2d8FE/Bwf9FrdpH4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759846027; c=relaxed/simple;
	bh=WmSuK2KgeZZKjS3RAHylOHbDs/ZtMx32hEmXNAnI9LY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NI55FDGjgeL3vJPfBsS9sCE1195Q2pO0MmgBB0D8yaemLcTn4SY2a5ol6aiutpm6Iqp7wl1DWSst/EtQz/bsDCX31wxTGrkuZ2Hwtos0xMdnyWiImiFIyGokWNDoEBbXxh6r8NLgQv7knY+MtFUZ3FbIqXSjf0pepTjzWbyL+HU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=GP8drtwM; arc=pass smtp.client-ip=83.246.65.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate09-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=DFvOQZa24W/AnKkgvYTUsj2VAl9wPNaKiNLZsjze+Cs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1759846006;
 b=TvgGsH+AIlbdbrPeC2IxGYY9St+z6Gp/G3KQ40NiAX+OF6gZD7T/KeBcM+9pvnp+UIV+1l6U
 38EnGenTlw/rM91JEohYz3At8dMSoq8LwbK2m/viGn5x8rda3srS57MJFzFvW8gODtaPyrLt2eh
 Es1Fc8WJLaofFclMBgrOo+L/UVXIocFnzU6CTv74Q1jZ2PFPp+Mf5wml/m4cFl7qFJJ+fIOwFqo
 c0PqhgeI/Y72551KiOtLTSL1NWxMDbBbl+hGFc8gcD6NF/3mNVvTQBDRm8X3TrFSgyYASdKwKgh
 UGWMhwt8450Q82FPjbRdyeuSM+uThR5FgJwufN/6RGiJw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1759846006;
 b=rdoy7ImK62X/tCdF8GazI+pogL/BOAQ9+KLPFOmvFo2yLcfwKnff3f/N2IQD7ZV2OZaTPXUp
 QR1ibpkyxodrnsdobcZfqNtqbeQ5pAUB62/Nbi8E0RmeRlzN+kbv3J8929RlEPp6oSTWfeY47IA
 3fUb69bN8wn9igxESPG5wXA1d9BvMhkEYoXu73NlFfn/VkgF/YOjJC2txSNxdN7JDAvFJfbexsC
 7Q7C6yjWY7dnPvvuUWStoQ6hKnBf9xJqfn4HRfcS5vthfS9P9go+6VZcF9MPu3GvZ/AVW4xNVBY
 f2C9h/wO2Qi29jQ6uJynvQ/ohCWPcDR1ocvs9awyYs9MQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay09-hz2.antispameurope.com;
 Tue, 07 Oct 2025 16:06:46 +0200
Received: from [192.168.153.128] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 55104A40A92;
	Tue,  7 Oct 2025 16:06:37 +0200 (CEST)
Message-ID: <09aa8945c41cdc0c518bddedf8d3489c1e521661.camel@ew.tq-group.com>
Subject: Re: [PATCH 1/2] i2c: ocores: replace 1ms poll iteration timeout
 with total transfer timeout
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Peter Korsgaard <peter@korsgaard.com>, Andi Shyti
 <andi.shyti@kernel.org>,  linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Date: Tue, 07 Oct 2025 16:06:36 +0200
In-Reply-To: <7dbefacc-3ce0-47ea-b521-102320f49420@lunn.ch>
References: 
	<1eb320b6b7d3a12e62785893ea68c4d16aa2560d.1759838476.git.matthias.schiffer@ew.tq-group.com>
	 <7dbefacc-3ce0-47ea-b521-102320f49420@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay09-hz2.antispameurope.com with 4cgycF6Td5z2102K
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:a4c114696472c606f0b88d2546581029
X-cloud-security:scantime:2.016
DKIM-Signature: a=rsa-sha256;
 bh=DFvOQZa24W/AnKkgvYTUsj2VAl9wPNaKiNLZsjze+Cs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1759846006; v=1;
 b=GP8drtwMc8ijB10ZKH4VVQeo/NudFlfA/6M5pb7Ru4T5TQNSOBlTWSpasatN483zUyczAL+3
 3OjyDPrBDx1d62IYPlKOTV5KP3NbWiFqY8rzEgcytdfboDKTq4egdKwfOEF4VNAcdWz6V+qsvg1
 0+2t7uABFoYtaAhvZnGuz61ybEXYPzhC6Q6VaQsdmYt+SF3x2vQWZPE04omQq992Rfyu1VrVv0t
 +yS7xJoLoetRpXCGpFBQpHLkX8FoJOYO7U9HJjJgWYxaMegtMRf965cXcOIgjar+X6x7IQQVR8X
 chj00wPnwLpJDIOVPOl3iPbh5smQSwKvLgfkW7T6BGhYg==

On Tue, 2025-10-07 at 14:34 +0200, Andrew Lunn wrote:
> On Tue, Oct 07, 2025 at 02:09:24PM +0200, Matthias Schiffer wrote:
> > When a target makes use of clock stretching, a timeout of 1ms may not b=
e
> > enough. One extreme example is the NXP PTN3460 eDP to LVDS bridge, whic=
h
> > takes ~320ms to send its ACK after a flash command has been
> > submitted.
> >=20
> > Replace the per-iteration timeout of 1ms with limiting the total
> > transfer time to the timeout set in struct i2c_adapter (defaulting to
> > 1s, configurable through the I2C_TIMEOUT ioctl). While we're at it, als=
o
> > add a cpu_relax() to the busy poll loop.
>=20
> 1s is a long time to spin. Maybe it would be better to keep with the
> current spin for 1ms, and then use one of the helpers from iopoll.h to
> do a sleeping wait? Say with 10ms sleeps, up to the 1s maximum?
>=20
> 	Andrew

Makes sense. I don't think I can use something from iopoll.h directly, as i=
2c-
ocores has its own ioreadX abstraction to deal with different register widt=
hs
and endianesses, but a combination of spin + sleep is probably the way to g=
o.

Best,
Matthias



--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

