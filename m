Return-Path: <linux-i2c+bounces-1718-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CC9855822
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 01:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFC4628107A
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 00:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FE5389;
	Thu, 15 Feb 2024 00:08:20 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 7.mo582.mail-out.ovh.net (7.mo582.mail-out.ovh.net [46.105.59.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180E917C8
	for <linux-i2c@vger.kernel.org>; Thu, 15 Feb 2024 00:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.59.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707955700; cv=none; b=POlechFHGJjWw3LfkrkXM5BlqsWdjQV+17nFrgAQJ+W214dG6KdFwfOLBJPs2mYaXuvduw4BB1cYDIUv2WPHGVRBJSv5J5r1gYVKGxIDqBzZnjWb98mtqRAOIsxHNfF4a5q6/3xzEvrfgmMGJO+Cm9J3HJFNdXV1eazhpk/f9qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707955700; c=relaxed/simple;
	bh=Zn2YmXTGnlmFWVJAWE0ZcsbcTLkjNnzhl3e0UcTBfKg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b/qABXV3CK+XZk0vR6As1CZqhbknF2i6M4ZfQX6kmuTqkU7bYFwcNOe54AOR6oCgIOI84yRVXrm88jInI/eREtr5HUz/hKj5lf4De5Z2QGwVOgvyL40rEaVHBHZL24km2b1MXLwJHduGduCmJT6cawRf4eTmkvMxejs1myxgkIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.59.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.139.43])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4TZs9H0CWSz1F8Q
	for <linux-i2c@vger.kernel.org>; Wed, 14 Feb 2024 21:42:11 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-62rx8 (unknown [10.108.54.171])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 58D4F1FD57;
	Wed, 14 Feb 2024 21:42:04 +0000 (UTC)
Received: from etezian.org ([37.59.142.103])
	by ghost-submission-6684bf9d7b-62rx8 with ESMTPSA
	id pzx8A6wzzWWJKwIAfHX53g
	(envelope-from <andi@etezian.org>); Wed, 14 Feb 2024 21:42:04 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-103G00581a402d0-df4d-43c0-80f3-f5461175c724,
                    C0FC2E5C6A7315DD97BDDE4B9606AB6EEADB6D9F) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Wolfram Sang <wsa@kernel.org>, 
 Olof Johansson <olof@lixom.net>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240212111933.963985-1-arnd@kernel.org>
References: <20240212111933.963985-1-arnd@kernel.org>
Subject: Re: [PATCH] i2c: pasemi: split driver into two separate modules
Message-Id: <170794692308.4040459.7350373390928340229.b4-ty@kernel.org>
Date: Wed, 14 Feb 2024 22:42:03 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
X-Ovh-Tracer-Id: 3725039842831960594
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudejgdduheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekvddpmhhouggvpehsmhhtphhouhht

Hi

On Mon, 12 Feb 2024 12:19:04 +0100, Arnd Bergmann wrote:
> On powerpc, it is possible to compile test both the new apple (arm) and
> old pasemi (powerpc) drivers for the i2c hardware at the same time,
> which leads to a warning about linking the same object file twice:
> 
> scripts/Makefile.build:244: drivers/i2c/busses/Makefile: i2c-pasemi-core.o is added to multiple modules: i2c-apple i2c-pasemi
> 
> Rework the driver to have an explicit helper module, letting Kbuild
> take care of whether this should be built-in or a loadable driver.
> 
> [...]

Applied to i2c/i2c-host-fixes on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: pasemi: split driver into two separate modules
      commit: 3fab8a74c71a4ba32b2fa1dca7340f9107ff8dfc


