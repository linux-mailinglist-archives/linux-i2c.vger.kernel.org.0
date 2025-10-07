Return-Path: <linux-i2c+bounces-13404-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C16B0BC1C70
	for <lists+linux-i2c@lfdr.de>; Tue, 07 Oct 2025 16:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 622254E8BB3
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Oct 2025 14:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7FF2E0920;
	Tue,  7 Oct 2025 14:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="VMBH7pAO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay189-hz1.antispameurope.com (mx-relay189-hz1.antispameurope.com [94.100.133.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6166A34BA35
	for <linux-i2c@vger.kernel.org>; Tue,  7 Oct 2025 14:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759848127; cv=pass; b=QF4uh0Vxl+pjp9DtG3fqWqrbK7v2bT8lB8cA7niqRIL//rpt1TbOWzawb5oM5+0sqMgt4i2RDtcBgUqyyGuIyDNIJeJocGF9lWhccHz7oqVQKb7CJXD9Sg71oMDAHocEeeNRPkLu8VnZhhmsyznexT83Preat7Q1JyJh3GhItdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759848127; c=relaxed/simple;
	bh=yDQQOQqjnQwEhncWQQ4K452iNL8DnnYaIXU4NIP3450=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QvzLSw3LnSNV3gjQGDaWeHjAPR+FID5D9iaNmwHD0cCKw2H6T2ovSPBx54B9o/a5YpJfK0P/P3v/cuqtmK0s7lIkk0EDxK5/9iuLwmSSJqhUkDcv+zx7+LGhpSoxVzFctHS1iTDu9aOPKZ/3k7DCvCcpZiJiAQsVWphW+yjsemI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=VMBH7pAO; arc=pass smtp.client-ip=94.100.133.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate189-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=80WbERQURXGFSJ2g95JfoLgUOBrfN3fEfhi353jq0sM=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1759848070;
 b=fwUaHwdFYtlBkcxyvWudBWavhsIeCvJWLahGGMSVLxKojwzWVGrXBybFvcAgHUssUP4Z+RAL
 GynZMz2D9NV4hmBJsRkjT7zXx1dMfHGuu+9+gsqQykwObTP6/ikM/NQ8ZTnL1V1wdPUbHNtRXKj
 OTAH0xIX0QbwbzFUMisYv6j4fm27ftDay3CA0FhsSKe/fcBLao2LkqbIeKKtpCWJKzSKu1oUfMx
 FzwOojQ3TgVCl/MH+3XCGzCrm48OWvYn/jzZuajLTZKkcvsntjBVOeUWiql02cwwXnOafL0abkO
 L4nB7zY56pFZdcPBZf/woET80E/fKbMr0sq2yBvcS/qlg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1759848070;
 b=mvjWI6YBbVdDZCHsGD8lIharkPnDRdEy2Py9nnRLv5IP+kOScvjBiG077paleBVuiFPkMcGS
 44qOZNQtTR529GEFbKVgjK5C739yiwclo/QucUqWUhNu9pQyC653H2ZLXZhEulxfiEXerKD7213
 tAHSvh8WLG5CsCcnJKMQUaAtYxI3s75LRUuCLpaWD/tc13Wx7jq/2YEn721xm4ZikKdG2r418ZP
 esI07U6+zlvD3B/yFsfGWeojC1cHc1t/Ry09NX6lEgQLEffDne5c/h3qh4nDqqA57UFefHMickY
 Ae+Ya4vRJPgIFcPQhTIpDy0THRIck5ryxUuu7Zl6+DtUw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay189-hz1.antispameurope.com;
 Tue, 07 Oct 2025 16:41:10 +0200
Received: from [192.168.153.128] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C36B25A0D7B;
	Tue,  7 Oct 2025 16:41:00 +0200 (CEST)
Message-ID: <0007bc39777fc1e09f953be943fd8ce474b054da.camel@ew.tq-group.com>
Subject: Re: [PATCH 1/2] i2c: ocores: replace 1ms poll iteration timeout
 with total transfer timeout
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Peter Korsgaard <peter@korsgaard.com>, Andi Shyti
 <andi.shyti@kernel.org>,  linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Date: Tue, 07 Oct 2025 16:41:00 +0200
In-Reply-To: <7470fb97-1991-4347-a084-11f24006b67f@lunn.ch>
References: 
	<1eb320b6b7d3a12e62785893ea68c4d16aa2560d.1759838476.git.matthias.schiffer@ew.tq-group.com>
	 <7dbefacc-3ce0-47ea-b521-102320f49420@lunn.ch>
	 <09aa8945c41cdc0c518bddedf8d3489c1e521661.camel@ew.tq-group.com>
	 <7470fb97-1991-4347-a084-11f24006b67f@lunn.ch>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay189-hz1.antispameurope.com with 4cgzMx2cS1z3gkyQ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:b72eaf01ab3e237b213f268682a1d073
X-cloud-security:scantime:2.137
DKIM-Signature: a=rsa-sha256;
 bh=80WbERQURXGFSJ2g95JfoLgUOBrfN3fEfhi353jq0sM=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1759848070; v=1;
 b=VMBH7pAOKqAzdoLjstXL+Eu1nPQUxhy2cRnZWn7miy31qpiR94AASN4kzKciwqOQtzw2rHg8
 ZbHb1NzDTMoputuMfgdI3cM/+3FJC5Ziq+ntTJpIGtpPbIluS4omOKXaDtxhW/GeRPgC3jv+gog
 MKCtElRkIrX8Aaq2bkwaQyXl9oUlbpNnLt7xuCk9sp6+/eYajNnIUOqCkuln6T36xxD+/1BxWVE
 6ZaRqEh3iD3xpjeBiSjngkvvqDQiRH8tV+RuA6iStDwS8KANaftjxkfgMQvherBmuVXWFUXILql
 O9EXnq2h+nRh3bTs5GHSCZU3gTFrWIvYhZ5IkdqFT46iQ==

On Tue, 2025-10-07 at 16:20 +0200, Andrew Lunn wrote:
> On Tue, Oct 07, 2025 at 04:06:36PM +0200, Matthias Schiffer wrote:
> > On Tue, 2025-10-07 at 14:34 +0200, Andrew Lunn wrote:
> > > On Tue, Oct 07, 2025 at 02:09:24PM +0200, Matthias Schiffer wrote:
> > > > When a target makes use of clock stretching, a timeout of 1ms may n=
ot be
> > > > enough. One extreme example is the NXP PTN3460 eDP to LVDS bridge, =
which
> > > > takes ~320ms to send its ACK after a flash command has been
> > > > submitted.
> > > >=20
> > > > Replace the per-iteration timeout of 1ms with limiting the total
> > > > transfer time to the timeout set in struct i2c_adapter (defaulting =
to
> > > > 1s, configurable through the I2C_TIMEOUT ioctl). While we're at it,=
 also
> > > > add a cpu_relax() to the busy poll loop.
> > >=20
> > > 1s is a long time to spin. Maybe it would be better to keep with the
> > > current spin for 1ms, and then use one of the helpers from iopoll.h t=
o
> > > do a sleeping wait? Say with 10ms sleeps, up to the 1s maximum?
> > >=20
> > > 	Andrew
> >=20
> > Makes sense. I don't think I can use something from iopoll.h directly, =
as i2c-
> > ocores has its own ioreadX abstraction to deal with different register =
widths
> > and endianesses, but a combination of spin + sleep is probably the way =
to go.
>=20
> I think iopoll.h should work.
>=20
>=20
> 		u8 status =3D oc_getreg(i2c, reg);
>=20
> 		if ((status & mask) =3D=3D val)
> 			break;
>=20
> This maps to
>=20
> u8 status;
>     =20
> ret =3D read_poll_timeout(oc_getreg, status, (status & mask) =3D=3D val,
>                        10000, 1000000, false, i2c, reg);
>=20
> Andrew

Ah, you are right, that should work.

If we want to keep the spin case for short waits, not duplicating the read =
and
mask check seems preferable to me though - maybe something like the followi=
ng
(which could also be extended to exponentially increasing sleeps or similar=
 if
we want to start with something smaller than 10ms):

	unsigned long spin_timeout =3D jiffies + msecs_to_jiffies(1);
	...

		if (time_before(jiffies, spin_timeout))
			cpu_relax();
		else
			msleep(10);

Best,
Matthias


--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

