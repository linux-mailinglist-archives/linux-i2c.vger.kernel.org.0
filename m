Return-Path: <linux-i2c+bounces-15148-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10511D1D1D0
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 09:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19812300ACD7
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 08:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE4637E2F0;
	Wed, 14 Jan 2026 08:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rOcR4hXE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay48-hz3.antispameurope.com (mx-relay48-hz3.antispameurope.com [94.100.134.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BE137E301
	for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 08:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.237
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768379356; cv=pass; b=pVymlzSCwY4IZytR/vBuDdi8aEDHT5LHatknY/1FhTGnJo5dIjP4eV3fVGOagO9ICaTyeUMxfIeUVTbD1/E1dVRb3Xj4RXpqN3ACrWfA7iI6YGVyftNdCmNl0ABnEnBW+d4r7N1XsVghllZ5hmkBPzNyrZGZ4skF+PJS3j3EH98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768379356; c=relaxed/simple;
	bh=Iab4ndsrAF7+D8T7DsGLaQLWPukilR+SNny04f/NueA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kNkGVsNVNUq3/7dFCxlN7FaA0jwISuuRtAJ65fgYv5xbp2mxNaVSfoevTVnayJDKYMXi8Nvnq0QpumegGDLFDMInW8heZxMWUmX81lZEjXLuhswfwffZpLz8egscSv9oiotiwzs5jDK/KT/PgaBRdAX1WlnX1UbLqNXsYgnOmaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=rOcR4hXE; arc=pass smtp.client-ip=94.100.134.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=bwSNtwuxzn6iZJ9JU/ff8xk/XC7ukkHtkWY1re96guo=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1768379337;
 b=G0VyEFPRHPS6ZRUvYLVISZtRPCGZvs92nleAbILa/A3Y5kjRzZYDYIS88Gwn75tZIw5MaRe0
 nrSJ2F6ngtDLZXPo+uSOPHQk7Rajc+MncrH3Ykw/NBue8WD5VhE/wIBHPehn3GrxtLTwWFdS3vZ
 LwqbNcZ3IeklKbDe0LI1wVat56dGIg92LZ6JYTEOr9mInA/cpQXAY3DbIBP6GKJTpbng21Gj4QO
 LL/qAboG5TWlMGnm2dMj0MtDgMghCoRAq1QzUhflc9YF/ZmKs7+5DbvAO5460qxljA5t1QSRAe/
 TyQLCH6cvYGhqJre5N059UMmn6MEPdbWVFNxV+5frF+hg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1768379337;
 b=NdNJDVtYWw5xZjFTyILJ2mbJ9KMpJfyxIYfC85qHpt9E5OOZGl+cA6zDggQw9cdz6s+PCLbf
 kt/qPVpM8on92CK6QiwrVdzRM4CpC+Yvy/Bbaprm9idMWQIhAYLdgLrKFh5/fo7KyG+BeD/zCzY
 LSn9AkbiiPuUSIB24Lx64wlNjMlS455M1S19mcOCGoGlZ1AOGtwd7S3KhKzaAk/ZEFHqBj1xub0
 JuH7pDHl8o91qB4HOYrgFfJUUc0Sl3JqIofAwBl4AWCxQu+tmgLBtS3dmJ6PJBPK08yMCblhm+C
 FTc5iOL6EW7uIUSue0/JsB6awXrrRG9NmJLR3JTu8As4A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Wed, 14 Jan 2026 09:28:57 +0100
Received: from [192.168.153.128] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 1068B5A0A13;
	Wed, 14 Jan 2026 09:28:49 +0100 (CET)
Message-ID: <5c535725c5e4761e6f16ff4016affe8ddcc79d88.camel@ew.tq-group.com>
Subject: Re: [PATCH v2 1/2] i2c: ocores: increase poll timeout to total
 transfer timeout
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Peter Korsgaard <peter@korsgaard.com>, Andi Shyti
 <andi.shyti@kernel.org>,  linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>
Date: Wed, 14 Jan 2026 09:28:48 +0100
In-Reply-To: <f428f437-80ec-4587-9f6a-7508a8153e79@lunn.ch>
References: 
	<51a72ceca0154d7be85c3cc67722e7dd0b364a2e.1760000254.git.matthias.schiffer@ew.tq-group.com>
	 <aWZCT0JQfvX1LAMC@ninjato> <f428f437-80ec-4587-9f6a-7508a8153e79@lunn.ch>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4drfQn42Ttz1kNkWB
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:97731e2c4315403f6ab53d234caf3ca6
X-cloud-security:scantime:2.082
DKIM-Signature: a=rsa-sha256;
 bh=bwSNtwuxzn6iZJ9JU/ff8xk/XC7ukkHtkWY1re96guo=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1768379336; v=1;
 b=rOcR4hXEYiKn7zLHaH0iBnSttAJkmylkjttJO3IZHLAkjNqYCoM7eiTzlW+B1AfnArx1gwxj
 MoRplI4GK5jwDRdYZ2bU5BDEAT0n+1z1uxwUaccENH+mGml1EhGZTf7VeLdB6a0NtoqwUiZU46F
 tqu2Y+FI3bxGf3Q7HyXBr/1hziExXYfQTnKqMW73ArkMS3ozghBaN8uR6jhNXfaMs+Z5clP+ub9
 JmPEHQGokMCsTpBqCBHoLMK2fBaO3b2t7/lDyf71pTVqFKAHDWynamzXkPxaLchpqkAdYMoNiWd
 SaX/ZE8DBgIwYEaTb426T8f2wtifP6ZT59+2T5yG6JAXw==

On Tue, 2026-01-13 at 15:21 +0100, Andrew Lunn wrote:
> On Tue, Jan 13, 2026 at 02:02:07PM +0100, Wolfram Sang wrote:
> >=20
> > > The behavior in the regular case is unchanged, spinning for up to 1ms=
,
> > > but the open-coded poll loop is replaced with read_poll_timeout_atomi=
c()
> > > as suggested by Andrew Lunn.
> >=20
> > Hmm, spinning 1ms is still a lot. Can't we just use read_poll_timeout()
> > for the whole timeout? I can't see that it will cause a regression. But
> > please correct me if I am wrong.
>=20
> I've forgotten the context, but
>=20
> /**
>  * ocores_poll_wait() - Wait until is possible to process some data
>  * @i2c: ocores I2C device instance
>  *
>  * Used when the device is in polling mode (interrupts disabled).
>=20
> If interrupts are disabled, you cannot use read_poll_timeout().  You
> have to use read_poll_timeout_atomic(). And that spins anyway.
>=20
>      Andrew


This code does not have interrupts disabled, we could not fall back from
read_poll_timeout_atomic() to read_poll_timeout() otherwise. My understandi=
ng is
that a sleeping wait would make it more likely for a switch to a different =
task
to happen after every byte, negatively impacting I2C performance; this is n=
ot
something I have verified however.

It is spinning for 1ms because that's what the old code did (which only spu=
n
without fallback to sleeping). Reducing this to the time needed to transfer=
 1
byte in the absence of clock stretching should not cause issues (200us for
50kHz; could also be made to depend on the clock rate, so it would be even =
less
spinning at higher frequencies).

Best,
Matthias

