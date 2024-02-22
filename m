Return-Path: <linux-i2c+bounces-1917-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1C185F805
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 13:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D54DB22C13
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 12:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D757F46B9A;
	Thu, 22 Feb 2024 12:22:59 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 19.mo561.mail-out.ovh.net (19.mo561.mail-out.ovh.net [178.32.98.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F0142068
	for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 12:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.32.98.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708604579; cv=none; b=Cs6exbchb5RwXOFQSCOqwMGS3GbxHWi8M1LyWhZnQ2R1FIyM6J3Oblnnas8vywDgaCSLL7z9/fgH/DUFFDgOxawWQMh8azONgyjKIdp80NFHjbjkNMbrBwrlmmmiFjmBb3XzzHUG04PZPBp9cchbMJ/ke8NLtsmmNDvDtiqqmpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708604579; c=relaxed/simple;
	bh=W+jnHVVB3ZRAg9EX2fNf/hRjYdScgr/CZdITpC+rZpA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ogXbXkrnSoDXdY+xCv0qzOJrqKesr91+qrUIceG2FC7OIAQsA5VOcCAuH9XGRXZqZVJaeeFGlqm4LB/GMoek16dmFW54F64/QbFdOnxgm222FdFBSrNYRhAUss1Ij/HxjVvvZYUMsKcgqJd/mlGosaHZ5ZXngRB7YKwuQHr5edg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.32.98.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.139.40])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4TgRbg6FKBz1GYk
	for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 08:47:27 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-dnswc (unknown [10.111.174.115])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 922F11FD6F;
	Thu, 22 Feb 2024 08:47:24 +0000 (UTC)
Received: from etezian.org ([37.59.142.107])
	by ghost-submission-6684bf9d7b-dnswc with ESMTPSA
	id LdgvFRwK12VVngkAllgtww
	(envelope-from <andi@etezian.org>); Thu, 22 Feb 2024 08:47:24 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-107S0017b51d39a-e42a-4bc8-afd5-71473328faab,
                    D266FE3A7B9817F169603FF0F8C90E47FA3D240B) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Corey Minyard <minyard@acm.org>, 
 Andrew Manley <andrew.manley@sealingtech.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240221193013.14233-2-wsa+renesas@sang-engineering.com>
References: <20240221193013.14233-2-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v3] i2c: imx: when being a target, mark the last read
 as processed
Message-Id: <170859164340.336357.16059990973960196120.b4-ty@kernel.org>
Date: Thu, 22 Feb 2024 09:47:23 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
X-Ovh-Tracer-Id: 729301668120365699
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrfeefgdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheeiuddpmhhouggvpehsmhhtphhouhht

Hi

On Wed, 21 Feb 2024 20:27:13 +0100, Wolfram Sang wrote:
> When being a target, NAK from the controller means that all bytes have
> been transferred. So, the last byte needs also to be marked as
> 'processed'. Otherwise index registers of backends may not increase.
> 
> 

Applied to i2c/i2c-host-fixes on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: imx: when being a target, mark the last read as processed
      commit: cf8281b1aeab93a03c87033a741075c39ace80d4


