Return-Path: <linux-i2c+bounces-12213-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09801B1FB54
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 19:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15966178345
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 17:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF61A5B21A;
	Sun, 10 Aug 2025 17:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="i07nSyft";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="ZdyWeubP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BBC1BDCF
	for <linux-i2c@vger.kernel.org>; Sun, 10 Aug 2025 17:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.160
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754846253; cv=pass; b=Uj8pc4fxDXQMXWuIKTuTe6jV+vGSy1KOprF8G8Y8cPruwpueC/94xBSJDfkENYBa4G4eGKPHXxkcsG6wT1Io9cnjOA6SLmR7VuvoBsUAsLEB/tUWhtOyks6bKnij3kkW3SF6vQOSrqvqmuWEM7cCtErc695CLN8bZA+2IdkJDyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754846253; c=relaxed/simple;
	bh=ZSbsbYiZBEJ0Ekg6BZS+86klpCRuOXqXmhTCqj1HrhQ=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:Cc:To; b=DQJ7G+P/MOXA/MkvsMJHnW1ODeodzjhe9egwmgl4bRwzFNdGb1G/DVm6MSqy8uiCM+kBPe6/MhyrV7Ez14kNL7DnNBJ2NzALPnhAmUvlaEYFmpkCxg2EXOQYFkxUEEao+d3ufN0rk+69tu8xvDlhE5Ny72oonmz9uOp9lgMNIps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; spf=none smtp.mailfrom=xenosoft.de; dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b=i07nSyft; dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b=ZdyWeubP; arc=pass smtp.client-ip=81.169.146.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
ARC-Seal: i=1; a=rsa-sha256; t=1754844446; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VXz0zV/10okRV7NZRFQ3L4TxH1I4T+qVPDVojbrQwnzr6r+upDmrcl3f2ODdv71ryc
    ICw2UBJ+pBeP40ld+62fatwwLcs64Sj2BbpsMDOvr65NOz3dJIlhyQ70LOPLuBcJMA8M
    zCypae7pnuQYfI4G8x/EN2US6JI7lMSHlVRgXjxZjop5AaXsE9EA8hUoyraAj423AZzo
    0z9WhhYyCZ/BJnWbSfBCuXwbgbec74UF/x1cElKGK70Aqlt0ut69dYehWBCDoJ4+y0A5
    JXBmjJ7zVmLnv+R2Ku9YfsEP9wcyQkEoEdZ69jQlWmOKNjWtTvBG9qyVntfrLwW5yzse
    wSsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754844446;
    s=strato-dkim-0002; d=strato.com;
    h=To:Cc:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=K8pt8WbN3XbRW6chuXyhwg2rF9l+Wdgb+Ie3sXEsGx4=;
    b=n1PUK/YvBdWNBq1OAHS/wOavNvEjhe9IvqXEBml7GnqnNEjGHHcsFnjhY4V1OgAfGm
    LE+KW8Kl0LVIMsEY+lQNNGxj4zgKg/oxJeHLREwRz8GdtkjG5Z56xLMmUCg+HEssHnq+
    T4wTDGSTYMSR0UKZA5KXwuyRyuYABThBByHGi3BK/AlN1uwJZCRgqAbkGoo2QInNbbF6
    TqwM8xugXOEADbJ2U8mhJhUCh6Ra2UPROmgp6DSvQjb2ST8nhUi4G8XC+SPElSo+urqd
    E8cB6Ygfs9hi9M9co8uHBryX/U8N4EXOp5NEpaw7AwfFCondJA1dDghsiqC0CzIwDPgx
    6aug==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754844446;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:Cc:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=K8pt8WbN3XbRW6chuXyhwg2rF9l+Wdgb+Ie3sXEsGx4=;
    b=i07nSyftgzRQ1n6gCY5Gumj2m/bT4oRp42V6WSgq12Y9n6yGxHlRwJrZM+sihHkmDS
    xg5KwOaFv8O9xfsa6iJ2zB2xIJAbz1zXqm1zlrFyMB2pQKQGwjhEzSQZseX1YV89sR+K
    2A8HKGtqDiDhPpvYUJqLWfRPFHNr2fXgGf+YoT5OMmfMOVCyT7FUY5HiDp/BMWk9gM+1
    93Dpw6LaZH16xvnUZowKi+nos7V75f9zX/hMhv8G7ntjCBUjL2UB+gy1zZW+KDN+Oo3O
    ef945ocJRCz5SkgQMG6Ifc2GBGT39cCjMVQqNAMdToRTlEk+VaQakn95p1w8ntLudYHr
    F6uQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754844446;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:Cc:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=K8pt8WbN3XbRW6chuXyhwg2rF9l+Wdgb+Ie3sXEsGx4=;
    b=ZdyWeubP9kqqk+4WLh2X+4LmDERZFexOO1gR6oF1N5gDBMezkWAsVPBPHg35tHWir9
    3zHv2oKhXbwES5tTTQAA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5i0sy3CAXlxGfGpTL+7TUpaIT1L8AmWoezzKas="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id e6066c17AGlQAhZ
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 10 Aug 2025 18:47:26 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Sun, 10 Aug 2025 18:47:15 +0200
Subject: i2c-pasemi messages since kernel 6.16
Message-Id: <2810E95B-8DB4-48CB-80F6-DF01EB7BEEFC@xenosoft.de>
Cc: linux-i2c@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 hypexed@yahoo.com.au, Christian Zigotzky <info@xenosoft.de>
To: Sven Peter <sven@svenpeter.dev>
X-Mailer: iPhone Mail (22G86)

Hello Sven,

Since the kernel 6.16 we have the following messages during the boot.

[    9.459706] i2c-pasemi 0000:00:1c.0: NACK, status 0x08210100
[    9.649736] i2c-pasemi 0000:00:1c.0: Issuing reset due to status 0x082101=
00 (xfstatus 0x00000001)
[    9.690696] i2c-pasemi 0000:00:1c.1: NACK, status 0x08210100
[    9.708651] i2c-pasemi 0000:00:1c.1: Issuing reset due to status 0x082101=
00 (xfstatus 0x00000001)
[    9.892693] i2c-pasemi 0000:00:1c.2: NACK, status 0x08210100
[    9.911535] i2c-pasemi 0000:00:1c.2: Issuing reset due to status 0x082101=
00 (xfstatus 0x00000001)

What exactly do these messages mean?

Thanks,
Christian=


