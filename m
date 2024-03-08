Return-Path: <linux-i2c+bounces-2274-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D69A2875E3C
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 08:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 137911C20FEE
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 07:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FDE4F1E0;
	Fri,  8 Mar 2024 07:05:43 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 7.mo560.mail-out.ovh.net (7.mo560.mail-out.ovh.net [188.165.48.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52D92E3E4
	for <linux-i2c@vger.kernel.org>; Fri,  8 Mar 2024 07:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.48.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709881543; cv=none; b=Rs9LrCv5fGyLkWn6Gd3kXnxxPO1zgepY/kS+ttY2cYOGuvgca8iAVE5ko8cGHflcxD81hYzaGS7seHkQ3/Xvi8Qf/uA09q2QpGDYBQgXUCB2l5Vum3RDQTL5RBAEXywBIMEHRskL4stLuqqzFPb7zigvoXp4Fpl1HaCWprykU8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709881543; c=relaxed/simple;
	bh=+WtNAUAUWq/BfAulUapucUzAISe2nXBsKcRWtXwicsk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W18T/qHebNX7UTb8Oq23LYo3LZzo0RUYBTUEYOlLmg79AYC7QHdnlkMTB9OOYnT102uqPUziNI0QnZOw8mwN2odcgr/eDswrPlzCvhKb5wtimHa8aAZhtYky+7GvteK0M/NthBoY7vhEC+fL7myI2InOcJS3hVlDU83oHfSbZ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=188.165.48.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.17.43])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4TrcQf37Fxz1L1X
	for <linux-i2c@vger.kernel.org>; Fri,  8 Mar 2024 06:56:26 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-67h7n (unknown [10.110.178.59])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id AB1081FE42;
	Fri,  8 Mar 2024 06:56:24 +0000 (UTC)
Received: from etezian.org ([37.59.142.109])
	by ghost-submission-6684bf9d7b-67h7n with ESMTPSA
	id MlWHKpi26mUsBgAAeUv1+w
	(envelope-from <andi@etezian.org>); Fri, 08 Mar 2024 06:56:24 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S00328a07135-36d5-4a1a-85ea-111edb4fd173,
                    2D11F706EFA52336831762ECFB2C8F5C1953C755) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-i2c@vger.kernel.org, 
 kernel@pengutronix.de
In-Reply-To: <20240306180241.83327-2-u.kleine-koenig@pengutronix.de>
References: <20240306180241.83327-2-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] i2c: sprd: Convert to platform remove callback
 returning void
Message-Id: <170988098388.2379036.4026488697020218182.b4-ty@kernel.org>
Date: Fri, 08 Mar 2024 07:56:23 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 13157829262787807769
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrieeggddutddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefhudekhefggeeuueelheevjeeugeeviedujefggeetffdvteejkedtledtieeukeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht

Hi

On Wed, 06 Mar 2024 19:02:41 +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> [...]

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: sprd: Convert to platform remove callback returning void
      commit: 3fe30b74207a4da40064f16a02655d170978547c


