Return-Path: <linux-i2c+bounces-4783-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E6B92AD29
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 02:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCFA7B20A43
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 00:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8C54A05;
	Tue,  9 Jul 2024 00:38:12 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 5.mo575.mail-out.ovh.net (5.mo575.mail-out.ovh.net [46.105.62.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF358197
	for <linux-i2c@vger.kernel.org>; Tue,  9 Jul 2024 00:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.62.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720485492; cv=none; b=m2Z7gfzOANZn8hiuyfOmU49ltWUDN4pU7907UqmjQfVfqSGXyPDZ6CnmIVFmjOOSfTNDrUG9XXrHkJMHg6qX2sDVlgGSFfKsZ4QSnLYqCOAf5M/YkarnGWzfL0QR0Ehu0Ar63q/KpkL2mVQRop+gpb4lRkAn2XXvOl0MTAQhDcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720485492; c=relaxed/simple;
	bh=hrYyrpN3X0lMN66nEm7UKdmP/DknK95WZD1/mgN9D6Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bIumjVFwi1IDDMq3lgBa4LVmXIim0GfWrcFmV/kyo0mmcJzvpMLNb4uLTi/Km3TPZjNeM9yqlumKAzbrbyYUCAJTmG9PB+73TvdlXNQchUDIIMKSuMjEyW+JV/y6K7NsZuOKuVwV6xTx4SkrQUkfJhf9DHyp5S2MjOdM9LebH0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.62.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.176.96])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4WJ0VY0fJVz1S14
	for <linux-i2c@vger.kernel.org>; Mon,  8 Jul 2024 23:21:09 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-fbwl6 (unknown [10.110.178.25])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 2C4031FE5F;
	Mon,  8 Jul 2024 23:21:08 +0000 (UTC)
Received: from etezian.org ([37.59.142.109])
	by ghost-submission-6684bf9d7b-fbwl6 with ESMTPSA
	id v0iVB2R0jGYVsisAHYCkqg
	(envelope-from <andi@etezian.org>); Mon, 08 Jul 2024 23:21:08 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S0035fe8f6db-bea6-4c7c-a49e-c89911f6a490,
                    40F6E8AA96701D23211BDC6B6B1471709A091AEC) smtp.auth=andi@etezian.org
X-OVh-ClientIp:194.230.248.195
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: sr@denx.de, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 lorenzo.bianconi83@gmail.com, upstream@airoha.com, 
 benjamin.larsson@genexis.eu
In-Reply-To: <b5a0ec6530b76f1e89b699355b946437a2fca5b2.1720478370.git.lorenzo@kernel.org>
References: <b5a0ec6530b76f1e89b699355b946437a2fca5b2.1720478370.git.lorenzo@kernel.org>
Subject: Re: [PATCH v2] i2c: mt7621: Add Airoha EN7581 i2c support
Message-Id: <172048086546.1716602.14236090278283785693.b4-ty@kernel.org>
Date: Tue, 09 Jul 2024 01:21:05 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 8387109884405615248
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekgddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepffetheduffdvhfdugfffudfgjeejudehheegfeeguefhieeugffhgfeuffdvgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudelgedrvdeftddrvdegkedrudelhedpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht

Hi

On Tue, 09 Jul 2024 00:42:38 +0200, Lorenzo Bianconi wrote:
> Introduce i2c support to Airoha EN7581 SoC through the i2c-mt7621
> driver.
> 
> 

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/local tree

Thank you,
Andi

Patches applied
===============
[1/1] i2c: mt7621: Add Airoha EN7581 i2c support
      commit: fd6acb0d21b8683fd8804129beeb4fe629488aff


