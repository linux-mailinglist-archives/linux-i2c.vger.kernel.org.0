Return-Path: <linux-i2c+bounces-4157-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE279118DC
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 04:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57FC4B21333
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 02:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C47839F3;
	Fri, 21 Jun 2024 02:56:42 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 11.mo582.mail-out.ovh.net (11.mo582.mail-out.ovh.net [188.165.38.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810984411
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 02:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.38.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718938602; cv=none; b=TqKLOHYLgrgYuySTAU5AFIjz0BZcncCwWuvXOWI4Pa41Ba6O3tXuJ9fW8XkKDhOA8n29DBO9wFcHp9XfjYcOxDC0609AW6y0uoYE/h5caMnMrx/VTLFt9ZzyQQN6bdPfH/e8wAz2oCqiHAiWJxgiY7gHSKITlKnWQcJ7x81JrcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718938602; c=relaxed/simple;
	bh=20Bno1n30DsBD2LYX6UR5S9jh4So2fbTQRi6hmhPU14=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S9cI63SMT5LskG68k5QKcRH7X38/Sp//47VZmpj/79CGNoTx23KHg/eo1J6pSSOY+I426owgnfKLaxthsmYQQDzRdhW5XXhh8wghclhe05S8uN+qRfnaJi3YCUitJAr1E9PkLTz60JGYgf2XvSnXR5Yn1k/RE2dhZtobQ+UR+20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=188.165.38.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.148.7])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4W4xKJ12Q7z1Lws
	for <linux-i2c@vger.kernel.org>; Thu, 20 Jun 2024 23:19:48 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-bvkjt (unknown [10.110.96.185])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 541F31FD4C;
	Thu, 20 Jun 2024 23:19:47 +0000 (UTC)
Received: from etezian.org ([37.59.142.110])
	by ghost-submission-6684bf9d7b-bvkjt with ESMTPSA
	id O1+2EhO5dGb3AgAA/KbBAQ
	(envelope-from <andi@etezian.org>); Thu, 20 Jun 2024 23:19:47 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S0040f310b2f-be15-42b6-bcff-984cf221b99d,
                    C57D3D2E0A03F635C8A27B63C027BBD507C09C29) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>, 
 Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>, 
 Thomas Gleixner <tglx@linutronix.de>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Grygorii Tertychnyi <grembeter@gmail.com>
Cc: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>, 
 bsp-development.geo@leica-geosystems.com, stable@vger.kernel.org
In-Reply-To: <20240520153932.116731-1-grygorii.tertychnyi@leica-geosystems.com>
References: <20240520153932.116731-1-grygorii.tertychnyi@leica-geosystems.com>
Subject: Re: [PATCH v2] i2c: ocores: set IACK bit after core is enabled
Message-Id: <171892558671.2178094.6404949110171049934.b4-ty@kernel.org>
Date: Fri, 21 Jun 2024 01:19:46 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 13336284400655993449
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrfeeffedgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekvddpmhhouggvpehsmhhtphhouhht

Hi

On Mon, 20 May 2024 17:39:32 +0200, Grygorii Tertychnyi wrote:
> Setting IACK bit when core is disabled does not clear the "Interrupt Flag"
> bit in the status register, and the interrupt remains pending.
> 
> Sometimes it causes failure for the very first message transfer, that is
> usually a device probe.
> 
> Hence, set IACK bit after core is enabled to clear pending interrupt.
> 
> [...]

Applied to i2c/i2c-host-next on

git://git.kernel.org/pub/scm/linux/kernel/git/local tree

Thank you,
Andi

Patches applied
===============
[1/1] i2c: ocores: set IACK bit after core is enabled
      commit: 5a72477273066b5b357801ab2d315ef14949d402


