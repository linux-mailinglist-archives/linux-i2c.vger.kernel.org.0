Return-Path: <linux-i2c+bounces-1544-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FBA8431D9
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 01:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A8DC1C252D2
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 00:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305AE363;
	Wed, 31 Jan 2024 00:24:24 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 16.mo550.mail-out.ovh.net (16.mo550.mail-out.ovh.net [178.33.104.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E63366
	for <linux-i2c@vger.kernel.org>; Wed, 31 Jan 2024 00:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.104.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706660664; cv=none; b=qQ7Kz0lWvfld3HQ64svDwyUvJTSTSvH30zeZwFiQAcTXGwDJ1q3n+1INhYBEjlBzRlfYcrHW9xD85FcJDqUT2RjLnswS0MS1xMDC7vBwQlMb7rCBoljdrU/HDkyht9/0lZ1t9nzyVkgfmi7n9LBDjhTicnX2EyY8EIct8gqoDkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706660664; c=relaxed/simple;
	bh=i8BIsOT8W4WGisGfZie/bbA4EqATNtceo5TqR/xHMJY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NXihtrrTCDYru5Gev2Y6i8NlAVYjDGcF4FkxUEt2IRSyZnAg9m7uufCOKdFGtUMMYeFq8OB/7veaN4h80Xv1YAyu865+5lbxmRRRp31PkPtLfbDYWc0SiJ9T4/mnaMYnnlIW5SWgA3IpKkRSscHQp14sobfJgOZLvoOx++D0eLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.33.104.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.148.7])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 7EA4B28199
	for <linux-i2c@vger.kernel.org>; Wed, 31 Jan 2024 00:18:48 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-xxf4f (unknown [10.110.96.146])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3CB261FE08;
	Wed, 31 Jan 2024 00:18:46 +0000 (UTC)
Received: from etezian.org ([37.59.142.110])
	by ghost-submission-6684bf9d7b-xxf4f with ESMTPSA
	id oo4kCeaRuWUyKAUAXj/8UA
	(envelope-from <andi@etezian.org>); Wed, 31 Jan 2024 00:18:46 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S00402f30d86-61d5-4f29-8f2e-26c26e74ee30,
                    F33A5955C440BB32736DBBB85AFDD5E0974CF895) smtp.auth=andi@etezian.org
X-OVh-ClientIp:194.230.145.85
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@ew.tq-group.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Esben Haabendal <esben@geanix.com>
Cc: linux-kernel@vger.kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <01abf8ccc0af74b4fb0124977ed6bdfb9d7107b6.1706190706.git.esben@geanix.com>
References: <01abf8ccc0af74b4fb0124977ed6bdfb9d7107b6.1706190706.git.esben@geanix.com>
Subject: Re: [PATCH] i2c: imx: move to generic GPIO recovery
Message-Id: <170666032453.3913934.17156311653699191147.b4-ty@kernel.org>
Date: Wed, 31 Jan 2024 01:18:44 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
X-Ovh-Tracer-Id: 10513653330233395856
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtkedgvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdduleegrddvfedtrddugeehrdekhedpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht

Hi

On Thu, 25 Jan 2024 14:56:36 +0100, Esben Haabendal wrote:
> Starting with
> commit 75820314de26 ("i2c: core: add generic I2C GPIO recovery")
> GPIO bus recovery is supported by the I2C core, so we can remove the
> driver implementation and use that one instead.
> 
> As a nice side-effect, pinctrl becomes optional, allowing bus recovery on
> LS1021A, which does not have such luxury, but can be wired up to use extra
> fixed GPIO pins.
> 
> [...]

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: imx: move to generic GPIO recovery
      commit: 11f1357336cde9924da0b455e528f11fbd5011f4


