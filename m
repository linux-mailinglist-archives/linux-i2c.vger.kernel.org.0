Return-Path: <linux-i2c+bounces-4782-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D45A92AC8D
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 01:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01020282884
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 23:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D8D1527A9;
	Mon,  8 Jul 2024 23:28:10 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 9.mo575.mail-out.ovh.net (9.mo575.mail-out.ovh.net [46.105.78.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE9214534C
	for <linux-i2c@vger.kernel.org>; Mon,  8 Jul 2024 23:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.78.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720481289; cv=none; b=pRLBAqKlrYiOj+9mVnMVfwSnf1a+zI41KWfxzUEAJ/yw80ZsC0pPEYK9qLmSME/sM/Xsj1smBfZsxwOdPIMpJe80Eks1jXCtZ3dvmZqmxutM87xAdi2b90AfxqpdufIJ6ESxKqizdvKj1U9hXvDUZlUaVTE28+s2r/bYWRJi3ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720481289; c=relaxed/simple;
	bh=H1/H6znjHIIJwaKIzd5pOuR8I11qxp2wIIKcXkeSLcY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FYbQg6H4g58MDzUuGJmYhRWOnONZek8QAzgW8M2WwF4YmOm132ylhZ2Jp7vpdfRSJOqIIum+V5el7/4RZQHGpzsFk0U779lccrpfr0lKlhMFOh8odBICtnif7KoIbOMiJrFcIvNmKpnEAwCvPNQ0EHPxhYrYWS0lSD9CZeRtSbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.78.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.9.73])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4WJ0VT2ZXDz1Ryp
	for <linux-i2c@vger.kernel.org>; Mon,  8 Jul 2024 23:21:05 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-xxfjm (unknown [10.110.168.127])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A83E81FE69;
	Mon,  8 Jul 2024 23:21:03 +0000 (UTC)
Received: from etezian.org ([37.59.142.101])
	by ghost-submission-6684bf9d7b-xxfjm with ESMTPSA
	id bQX/HF90jGaKfwYAc2ucDw
	(envelope-from <andi@etezian.org>); Mon, 08 Jul 2024 23:21:03 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-101G004bda9b4d3-3eef-4dc9-8629-3c2383afc8b0,
                    40F6E8AA96701D23211BDC6B6B1471709A091AEC) smtp.auth=andi@etezian.org
X-OVh-ClientIp:194.230.248.195
From: Andi Shyti <andi.shyti@kernel.org>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Jan Dabros <jsd@semihalf.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240705-i2c-designware-platdrv-const-regmap_config-v1-1-8c82cc63df15@gmail.com>
References: <20240705-i2c-designware-platdrv-const-regmap_config-v1-1-8c82cc63df15@gmail.com>
Subject: Re: [PATCH] i2c: designware: Constify read-only struct
 regmap_config
Message-Id: <172048085801.1716602.7286785392940529446.b4-ty@kernel.org>
Date: Tue, 09 Jul 2024 01:20:58 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 8385983984317696656
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekgddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepffetheduffdvhfdugfffudfgjeejudehheegfeeguefhieeugffhgfeuffdvgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudelgedrvdeftddrvdegkedrudelhedpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht

Hi

On Fri, 05 Jul 2024 20:06:25 +0200, Javier Carrasco wrote:
> `bt1_i2c_cfg` is not modified and can be declared as const to
> move its data to a read-only section.
> 
> 

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/local tree

Thank you,
Andi

Patches applied
===============
[1/1] i2c: designware: Constify read-only struct regmap_config
      commit: 21ac0359f72a90b16bb0e2f9e6b40dbac54c4e31


