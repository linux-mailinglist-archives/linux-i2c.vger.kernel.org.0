Return-Path: <linux-i2c+bounces-13436-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EE5BC94B0
	for <lists+linux-i2c@lfdr.de>; Thu, 09 Oct 2025 15:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC0193BF43B
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Oct 2025 13:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA79A2E7F04;
	Thu,  9 Oct 2025 13:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="qHyRtUsZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF81734BA39
	for <linux-i2c@vger.kernel.org>; Thu,  9 Oct 2025 13:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760016428; cv=pass; b=Ni+qlmMIVXFdCA18927Briip8d+XpCMzaXbfA8IR2f6bm4BLYA8AtGbFRQatGrzSBahbPZCcemqj9Efveq+S3HySQaMuPJ1DyetqaZohyz5mEpVB1gswJykGhXyziDJRp+XsLvpgSDas3I8sBKHGlso0PBLnmxhX2WTX2NDMdc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760016428; c=relaxed/simple;
	bh=EIeuNxi3tMWtVhd9APaLWB4XRSDsxAjUbTJq3XQbabw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ijO7gxaLWtv7GIZAK2nF8PyN2VP4oGMym/hdKr5YuJkTk/2mrvgHt+rVGUNWTpigUOuwKcGiQMC+J8avcK8gvqDBTjyW++Ss5qj1Qkuaeh3gwAB4YCd0r0TrtXiSvu+MEVRx7VDtYfcjaTed+sumhNIZ21BbVAeWVX/fQbxy3CY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=qHyRtUsZ; arc=pass smtp.client-ip=94.100.134.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=lyApDgL3svuRvTgcJBmdXkxs0NmIcK3pBr470hQHp5s=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760016384;
 b=OXZZq8q7mdnc3GRHwB3PyjU5rDiNh2efYhbyAwEg7FtxAG9IE0GJcHtTQ+90uHl9C5XeKkTe
 qW2VjUCZtwFfbckVlUxGw3BjSSNlSjsUFPtP89tGiJgXCZ90qmmau+rmS9Q8nNYAZY6GY1//V/0
 crVWatLkKlPcJy2pTCQfu8TrbaaBaqYLzd62AwrlUcnaJTt80E9amQByaOBtHHrEvdqoTIKgWKa
 q2owUl/D9D2DSzHXanlpRm0l2abTRq+90gFiQfE9aTNL9qELb2ojAd4MvQFBjOnadGyugBbcveq
 syBHf+9Zpc550a+TWGZ/rLj18AmmoW/mmWCQIlN71suKg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760016384;
 b=q+NH93tejai8SdlSGdsjdeqJOdZnHevqbr0M0ojMYxZme2pkbcNIhQyAM3GE6zWlXwnvwc8n
 +WvUKqHIyt4MEX5UDZGjjgjz05cWkYzEI13Ps/0eU9zS0xjSqGzK+8Z9thyPfpN0SJzZt0bSiG9
 y/I2s1dY1ul54oa/JhMEG2N1YyTByg49f9CQq0hUTZAClbn1kkwo8NPOtafAtXDv5vO8C5mC+ww
 cMVG3647ZZlGEXxyW2XYc2MSTPD/hMKNfoluqb9+GsA0nE6wukGOTBuDrVWOWJ1xMQCTRbve6c2
 K3DfsQoa31rQtzX5FhImmnJ3NZK4J8XPnMaTpnw5BxOvA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Thu, 09 Oct 2025 15:26:24 +0200
Received: from [192.168.153.128] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id DCA48A41242;
	Thu,  9 Oct 2025 15:26:12 +0200 (CEST)
Message-ID: <a528cdb9c861b8fb97ab1a99901378908f2e0e89.camel@ew.tq-group.com>
Subject: Re: [PATCH v2 1/2] i2c: ocores: increase poll timeout to total
 transfer timeout
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Peter Korsgaard <peter@korsgaard.com>, Andi Shyti
 <andi.shyti@kernel.org>,  linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Date: Thu, 09 Oct 2025 15:26:12 +0200
In-Reply-To: <60744be2-1a22-4056-bf05-22f64fb8b484@lunn.ch>
References: 
	<51a72ceca0154d7be85c3cc67722e7dd0b364a2e.1760000254.git.matthias.schiffer@ew.tq-group.com>
	 <60744be2-1a22-4056-bf05-22f64fb8b484@lunn.ch>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4cj9cj3JZ1z4MZvs
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:012c56644705e961c763b0351ba63189
X-cloud-security:scantime:2.683
DKIM-Signature: a=rsa-sha256;
 bh=lyApDgL3svuRvTgcJBmdXkxs0NmIcK3pBr470hQHp5s=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760016383; v=1;
 b=qHyRtUsZgcpcfFNFDf4BgazM/lHRQo/H0xDM9YUiCOCTMhGHq/MZ6XZx/FZZZNhExnvCqVsD
 mPRo2cwDt4JHpH0RAs0A+dNvzNyQYDpHS4Y+SbPE3s5Nu1Dn+sWr0u4RK72p3G6uGpIGLVoz3E/
 50nLYBzVK8Me7ecjC/qizsHrkcXA0INxfFqJPrIGniyA8wzO818Zl1BpUopgifw97uw+tVVI4T8
 BVOVcmiNoVJJKgG8dqTPTOs6Ecf11PBjYun4gxdQsYl8Ts7cRyBlkDE34cece4M6CrBEpk/Ecv3
 JPEWstack8+xb3bOCRhZE0iKUuf0rVqxR/viwk5ZYYuwQ==

On Thu, 2025-10-09 at 15:20 +0200, Andrew Lunn wrote:
> On Thu, Oct 09, 2025 at 11:19:49AM +0200, Matthias Schiffer wrote:
> > When a target makes use of clock stretching, a timeout of 1ms may not b=
e
> > enough. One extreme example is the NXP PTN3460 eDP to LVDS bridge, whic=
h
> > takes ~320ms to send its ACK after a flash command has been
> > submitted.
> >=20
> > The behavior in the regular case is unchanged, spinning for up to 1ms,
> > but the open-coded poll loop is replaced with read_poll_timeout_atomic(=
)
> > as suggested by Andrew Lunn. In cases where 1ms is not sufficient,
> > read_poll_timeout() is used, allowing a total transfer time up to the
> > timeout set in struct i2c_adapter (defaulting to 1s, configurable throu=
gh
> > the I2C_TIMEOUT ioctl).
>=20
> Thanks
>=20
> Did you test with CONFIG_DEBUG_ATOMIC_SLEEP enabled? I don't think it
> is an issue, but the old code could be used in atomic context because
> it never slept.

I did not, but there is only one call chain ocores_xfer_core ->
ocores_process_polling -> ocores_poll_wait -> ocores_wait, which is definit=
ely
not used in atomic context (in IRQ mode, ocores_xfer_core calls
wait_event_timeout, which might_sleep()).

Best,
Matthias



>=20
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>=20
>     Andrew

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

