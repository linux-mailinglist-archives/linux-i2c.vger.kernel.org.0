Return-Path: <linux-i2c+bounces-12214-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CA7B1FB65
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 19:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E786D3ACA10
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 17:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D09267B02;
	Sun, 10 Aug 2025 17:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="ILd/QQV4";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="mSJwuAr+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BF31DDA15
	for <linux-i2c@vger.kernel.org>; Sun, 10 Aug 2025 17:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754847406; cv=pass; b=ZbP/G3B1nsgeLIDLHUHT0OgJfRxfvwKJK8ibJ5OWek2jvuNPodXRF0ak0OV3/NOL02b2YQd1yRTYmuCUh6jiEdN49mTrtKkZOSHPN1fYmy7PpUmKMJ3sHklGoNs2onB9mZAsMUSuvb5LXRGdh0xrFYfmxmwxwWvYpbtK3jp0KqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754847406; c=relaxed/simple;
	bh=0/MvlShb7xFSEINwiv2N0iCROqXiho7ysEU5Q4PFaoc=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=qv3pjrDCI9+IhFev2RB3YGhJNwBx7GFf9Ujh9qlVoCPb/ZPUe6PZQb50gGdcDBvb1TSU7RABVk1DlgzSuxK+iB4p8b402rRfjN9ET8tKYpR+NkXHeARbBovn21i5lJ5glm5msytnMyYLBP6bdfmPBCVHUmwFE1xAKRQF6DBX4+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; spf=none smtp.mailfrom=xenosoft.de; dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b=ILd/QQV4; dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b=mSJwuAr+; arc=pass smtp.client-ip=81.169.146.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
ARC-Seal: i=1; a=rsa-sha256; t=1754846674; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=oNQK5+PqY46CjrpH3e9xKbosYqvzGHDHJOCrtTdYZsylmeLu2LkzGff4ibmELE6kBV
    DKbaYrwGccaRjTRr+bzUc66XDFJt4QWAApm7rVcLw0OrTh02z55hFSTgzbebOzJC7IkD
    wIJYR6wH3YT9J3QZeimbyOpY846Q6/fgB44EPZ21RbLw5o5DA5LQadfzMMGJ0iUR5mqp
    btCvQ6IzyJCLHvnyy6K/hpgs2tX6Xnc68k9iu06pSTx1+8U53tjUUdK8RRWFkvxLir53
    wyS3OK/gVuOB9d1Y6zt1hZ/cX3xBT5mRLUaEAVb+r2zyOaBvbiYvvkTGMVEZJwLe85aH
    to3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754846674;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=AlLcLAB2Bc+btCm52X2KnQOXTAjmxdMUQsJMtGXkE9U=;
    b=W03oy9GZLTGl3vloF1ixrRHuvs79MRpe+86SZdnv1CkaW5Gu2E+zgvd1bh8CR1Ah/h
    T64uHMU8XDzogLajAiv0VmWhVEIvIPOwxmbVI0G+Ttl715mojO34Cvuh14ZWYe3LCijg
    0WtaRinvTuDywExALe6mDg9bkDkmTDSSm+jLYV6O02pqRAN0z7y9+7sjwSyAbJcaYTlQ
    fqmOEs/KxpXg0VEPaqdMU6YR2X3p4ea80zUGMekcYkDxysne5yM3cjViIGGQcpVEA1GY
    QgIUDujxPzlwBXkLWVHWI04I0eCxCHnBhO8t+pKBM0gQsrRReBGckilclLKDU4on+W6Y
    oOCw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754846674;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=AlLcLAB2Bc+btCm52X2KnQOXTAjmxdMUQsJMtGXkE9U=;
    b=ILd/QQV4cZDfLcSLjgDwN/c9wRrpygXoq3DUferRDJ3cZ28nNoWFOZ+oMqVQjVqEQO
    6lX4iPMjnKm7HSabDeR8IXJ+b1PrTEJzKgfIJzXJcXGN0sqWllo/0MH81LbO/LTqCOag
    vz6iC6URJ6m5L8YqZ/ujHR5ZjbyP86LbMPyuwEjr0Ye/ej9qe2iUODvMBSLpJAIjyP5K
    v89TftvJfuWAVjdRhKpnsYRXaNgXk0D2GRFcnoSgCQv4zH9SBOpcMmtFc0SSzE0P8sMi
    6icugAnJIpBXgbO66OG5307vq+aVpP0xWjDz9mXkj1ugPymhqpkNCw5R3v36t5dWnUn/
    AAiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754846674;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=AlLcLAB2Bc+btCm52X2KnQOXTAjmxdMUQsJMtGXkE9U=;
    b=mSJwuAr+tiGFIs9kC1GnW58AtUWjTNPfVNgYAmSCCw+AEMbZF5x8AYFSFlMXUaknHa
    zDH96AqJTm9A8HrQeyCA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5i0sy3CAXlxHvOrG7LvSTpFZn+iXGWfH4wQ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id e6066c17AHOXAl4
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 10 Aug 2025 19:24:33 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: i2c-pasemi messages since kernel 6.16
Date: Sun, 10 Aug 2025 19:24:23 +0200
Message-Id: <EB646532-DE5B-46A9-80CC-42B5F6E0C5DB@xenosoft.de>
References: <2810E95B-8DB4-48CB-80F6-DF01EB7BEEFC@xenosoft.de>
Cc: linux-i2c@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 hypexed@yahoo.com.au, Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <2810E95B-8DB4-48CB-80F6-DF01EB7BEEFC@xenosoft.de>
To: Sven Peter <sven@svenpeter.dev>
X-Mailer: iPhone Mail (22G86)


> On 10 August 2025 at 06:48 pm, Christian Zigotzky <chzigotzky@xenosoft.de>=
 wrote:
>=20
> =EF=BB=BFHello Sven,
>=20
> Since the kernel 6.16 we have the following messages during the boot.
>=20
> [    9.459706] i2c-pasemi 0000:00:1c.0: NACK, status 0x08210100
> [    9.649736] i2c-pasemi 0000:00:1c.0: Issuing reset due to status 0x0821=
0100 (xfstatus 0x00000001)
> [    9.690696] i2c-pasemi 0000:00:1c.1: NACK, status 0x08210100
> [    9.708651] i2c-pasemi 0000:00:1c.1: Issuing reset due to status 0x0821=
0100 (xfstatus 0x00000001)
> [    9.892693] i2c-pasemi 0000:00:1c.2: NACK, status 0x08210100
> [    9.911535] i2c-pasemi 0000:00:1c.2: Issuing reset due to status 0x0821=
0100 (xfstatus 0x00000001)
>=20
> What exactly do these messages mean?
>=20
> Thanks,
> Christian

Sven,

These are PCI devices.

[    0.166709] pci 0000:00:1c.0: [1959:a003] type 00 class 0x0c0500 conventi=
onal PCI endpoint
[    0.166750] pci 0000:00:1c.0: BAR 0 [io  0x870200-0x87023f]
[    0.166866] pci 0000:00:1c.1: [1959:a003] type 00 class 0x0c0500 conventi=
onal PCI endpoint
[    0.166901] pci 0000:00:1c.1: BAR 0 [io  0x870240-0x87027f]
[    0.167017] pci 0000:00:1c.2: [1959:a003] type 00 class 0x0c0500 conventi=
onal PCI endpoint
[    0.167053] pci 0000:00:1c.2: BAR 0 [io  0x870280-0x8702bf]

Cheers,
Christian=


