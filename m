Return-Path: <linux-i2c+bounces-2212-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B96AA87368B
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 13:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA99F1C2288A
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 12:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1E185644;
	Wed,  6 Mar 2024 12:34:41 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 2.mo550.mail-out.ovh.net (2.mo550.mail-out.ovh.net [178.32.119.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62DC1DA4C
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 12:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.32.119.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709728481; cv=none; b=kM1WnB0jThHCx1mJluvzxQX0cbbr6AuFitFYvKK3k8wKWZsmd6wNmjBA4kk4zTrqOO9tr56dx1180WMoFQkmSfLFZyxdICVhdiJ9RaB3IwS9/xNVpL0z7ogHV2f5BS1hL/YhtY7y34MF3gGo1P0VWJJWk9iC5tyLtWhHHgSfC5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709728481; c=relaxed/simple;
	bh=2cvMi788dhWztuZl6J8HlSoTuPJ9dgNxEdJy0QYgPWA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JFlXgfahJqhSG38EaW1HvnQoCYGPEuDHTOMqNeZGc54pOM8Oj96lNjln/cIwSBfRbff8C+U41q7O8BNtMiCzwo2b4L6R2+1NSQQliS8sOqmB+H8ry5/X50IsCj3Vjd8AAQ9l81UQ8WP/sPPn93wrFaYPc3a2OsjE6KoQ8jv7aXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.32.119.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.17.3])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4TqW8h1WwSz1KSL
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 11:55:32 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-m5xpr (unknown [10.108.54.198])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 443BB1FF03;
	Wed,  6 Mar 2024 11:55:30 +0000 (UTC)
Received: from etezian.org ([37.59.142.98])
	by ghost-submission-6684bf9d7b-m5xpr with ESMTPSA
	id c6udDbJZ6GWhegUAx+AaaA
	(envelope-from <andi@etezian.org>); Wed, 06 Mar 2024 11:55:30 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-98R0025c287e7f-b057-4af8-96ee-5fa6d417479f,
                    62DEF991EB217AB86F953B10C2782167B22AFEEB) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-i2c@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <8d35529d-8ba9-4bdd-a3a3-00d67ab6f2d5@gmail.com>
References: <8d35529d-8ba9-4bdd-a3a3-00d67ab6f2d5@gmail.com>
Subject: Re: [PATCH v3] i2c: i801: Avoid potential double call to
 gpiod_remove_lookup_table
Message-Id: <170972612682.1712532.1072474863479883972.b4-ty@kernel.org>
Date: Wed, 06 Mar 2024 12:55:26 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 6463509893240261172
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledriedugdefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepffetheduffdvhfdugfffudfgjeejudehheegfeeguefhieeugffhgfeuffdvgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht

Hi

On Mon, 04 Mar 2024 21:31:06 +0100, Heiner Kallweit wrote:
> If registering the platform device fails, the lookup table is
> removed in the error path. On module removal we would try to
> remove the lookup table again. Fix this by setting priv->lookup
> only if registering the platform device was successful.
> In addition free the memory allocated for the lookup table in
> the error path.
> 
> [...]

Applied to i2c/i2c-host-fixes on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: i801: Avoid potential double call to gpiod_remove_lookup_table
      commit: 7c16cfd69d519ba14c9e9d474facd22d075ad14d


