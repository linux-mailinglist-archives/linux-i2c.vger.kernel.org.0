Return-Path: <linux-i2c+bounces-3761-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 879628FA752
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 03:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0EF11C233AE
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 01:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F46D8C09;
	Tue,  4 Jun 2024 01:12:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 7.mo576.mail-out.ovh.net (7.mo576.mail-out.ovh.net [46.105.50.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D818494
	for <linux-i2c@vger.kernel.org>; Tue,  4 Jun 2024 01:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.50.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717463522; cv=none; b=bP2WCCFJCKqrofqDB5a/ceORSphwRpLylJupPLipbncrJuV1EJ2DlsxrBx0IS3BY5zKqTyInQpuOASN2KxL2z8VFJU4+wxl7pGliDFBI+rn5WvYDipe+bEhmnNfvIFiGPNOwGYRZScuRj2ogtZTsbPB/GC9JCwQzut94CwZBf+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717463522; c=relaxed/simple;
	bh=j6dPX7j1idFxsGtKfeRBweCYBFZzkzux+n6GkuqgzeU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FBh8DUBHoKHOkvPCTFVwkB5x6W+nTxO6AWjZ6g9VoUb1dXnnN/ROk1CSRxnn/f3/BcYIIav6VNxfGwfRQLDtn06G93OWryY2lKsqrjYA3ubfs3DKSl1/RoymJ+xS1AfHuFoPByNhSMyR0AhveVV40k33V8Qku1wjvJLpj9Cj3hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.50.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.9.3])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4VtXFD1J0fz1kC7
	for <linux-i2c@vger.kernel.org>; Tue,  4 Jun 2024 00:55:12 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-bnzgl (unknown [10.111.174.3])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8581A1FDB5;
	Tue,  4 Jun 2024 00:55:10 +0000 (UTC)
Received: from etezian.org ([37.59.142.102])
	by ghost-submission-6684bf9d7b-bnzgl with ESMTPSA
	id EHD4CO5lXmYkqQYAgcOseQ
	(envelope-from <andi@etezian.org>); Tue, 04 Jun 2024 00:55:10 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-102R004e0dc1618-2ab7-4320-99ab-0cc35ca291ee,
                    0128271CB94951378F9AAB743D4D9DD493E1C1D0) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Linux I2C <linux-i2c@vger.kernel.org>, Jean Delvare <jdelvare@suse.de>
Cc: Juergen Fitschen <me@jue.yt>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240531111914.619ade4b@endymion.delvare>
References: <20240531111914.619ade4b@endymion.delvare>
Subject: Re: [PATCH] i2c: at91: Fix the functionality flags of the
 slave-only interface
Message-Id: <171746250940.235339.8441353240044275106.b4-ty@kernel.org>
Date: Tue, 04 Jun 2024 01:55:09 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 7345370993325902480
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrvdelfedgfeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht

Hi

On Fri, 31 May 2024 11:19:14 +0200, Jean Delvare wrote:
> When an I2C adapter acts only as a slave, it should not claim to
> support I2C master capabilities.
> 
> 

Applied to i2c/i2c-host-fixes on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: at91: Fix the functionality flags of the slave-only interface
      commit: 66b9a4ab75e8ce82faf9ec5344a870c768aeed78


