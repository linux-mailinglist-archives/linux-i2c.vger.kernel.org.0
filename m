Return-Path: <linux-i2c+bounces-1539-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1C2842DE9
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 21:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1EE31F23556
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 20:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C16079DD7;
	Tue, 30 Jan 2024 20:32:27 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 7.mo576.mail-out.ovh.net (7.mo576.mail-out.ovh.net [46.105.50.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3C779DD6
	for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 20:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.50.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706646747; cv=none; b=sXM5qClAyL77rrdgj/OcmysAXCW8cAV6rAk3ksTw1YpMo5d+qE9CTPEfXexGQFCnh35sY1kAzVixjFoKQ3wAxU1hLJpVBGG1JbuJJcMi9Sg7uY5S6q5z31HklcnWGqaAtP8sWRxm5mdBIOB7CoO7ij9bHqJdahUrAkRidISwj/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706646747; c=relaxed/simple;
	bh=B2ppdC8u/QDeG8tThRyRJOXtZ0rOnmI2LRCGp0bMwmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cD8n/sJm6X+FB0AEvUBVzx6GSM+e+nyzx5nMqxpyJwfe3Fu8p6T1+2nGe8VtRhCPptJm/mhgemKqrgqYrwuKdJCmzAe5z1H3DpOJaDlMcMHVvgbssU3+0mx+ra1FY6d9TdyV52voIOYdv9OEfC2Kyt9wxBQSj1gv8hhDqM+k7Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.50.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.148.7])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 75E6431C32
	for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 20:25:52 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-ctjrb (unknown [10.110.113.129])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4D6741FDB8;
	Tue, 30 Jan 2024 20:25:50 +0000 (UTC)
Received: from etezian.org ([37.59.142.99])
	by ghost-submission-6684bf9d7b-ctjrb with ESMTPSA
	id +DAYJE5buWXh3AsAF6xv8A
	(envelope-from <andi@etezian.org>); Tue, 30 Jan 2024 20:25:50 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-99G0030724d115-007f-4b95-b9ff-1a0b342b8d03,
                    A55004731C2A18159FC94DBA16C28717FFA6C146) smtp.auth=andi@etezian.org
X-OVh-ClientIp:194.230.145.85
From: Andi Shyti <andi.shyti@kernel.org>
To: Peter Rosin <peda@axentia.se>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Naresh Solanki <naresh.solanki@9elements.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	mazziesaccount@gmail.com,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Rob Herring <robh@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v5 1/2] dt-bindings: i2c: pca954x: Add custom properties for MAX7357
Date: Tue, 30 Jan 2024 21:24:55 +0100
Message-ID: <170664590836.3575391.9594221857532318871.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130121902.462619-1-naresh.solanki@9elements.com>
References: <20240130121902.462619-1-naresh.solanki@9elements.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6579759056189590235
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtjedgieelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeevveeiffeifefgfeduvdetleffuefhleffjeetjeduvdevkeevhedvjeegfeetveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdduleegrddvfedtrddugeehrdekhedpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth


Hi Naresh,

On Tue, 30 Jan 2024 17:49:00 +0530, Naresh Solanki wrote:
> Maxim Max7357 has a configuration register to enable additional
> features. These features aren't enabled by default & its up to
> board designer to enable the same as it may have unexpected side effects.
> 
> These should be validated for proper functioning & detection of devices
> in secondary bus as sometimes it can cause secondary bus being disabled.
> 
> [...]

Applied to i2c/i2c-host on 

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/2] dt-bindings: i2c: pca954x: Add custom properties for MAX7357
      commit: 8e7d967f04df0fa2c2db00f47ac4cd5ea16ade91
[2/2] i2c: muxes: pca954x: Enable features on MAX7357
      commit: 6b572ea231236bb3be4b819d92119470ac121a9e

