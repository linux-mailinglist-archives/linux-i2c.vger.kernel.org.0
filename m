Return-Path: <linux-i2c+bounces-4521-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5F191DEA1
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 14:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98A2D285E1A
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 12:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D4315250D;
	Mon,  1 Jul 2024 12:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="i+eE3Tot"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5C314B943;
	Mon,  1 Jul 2024 12:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719835226; cv=none; b=bSKEfNhe6t4t7A9gt2LSJD/6VZ5WS4BfyyMsRwvzkzr6O9DJ4SXmMyqczrW+QFby3cKXGlgsuR6RK/+Q4J1WxUdsBdzfKVv8/0Ua4soqsS9rHKCwADupUdfvk5unxJA03N4tRD149/BNjiShf6P0osL59DTAacd1Iy8muCsbceo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719835226; c=relaxed/simple;
	bh=CiIv7Xj0hDAY54eJzG5mpM4iH06Y/H97qfByMIGFJcs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EpemLti4qcfeXr34UroRbD6BYvX0itjZV4O6rY21HQZRg25Fnp2lVAtAA+8Rs3/mbXpJF8J8qXV5PJTZyZUQ4Mu5iBaUKfYDfRQhcwUpr96nFNDCumGuGpNc7sfRVCe2diM5AwhVewIE8P41ipjiC6YVxq0qYnpx5c7Ghu5mKcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=i+eE3Tot; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BDE91BF203;
	Mon,  1 Jul 2024 12:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719835220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MHfqL50fDUx9zIlzHn0VY8tLg/2DFwYEENXwOfaE3OU=;
	b=i+eE3TotMR50bBfes4DsOLwnZGegNdfTcIvHQBmZ5Rq/F4dbq1iJM4I8N3+qZvav2ahVsH
	Ivkiy2JPqAepgZOJEOwoWvBMZa1jDTyKQPG4V5P7B6i23O09ZK+fbe9NSVnWi1+ikIlyI5
	oDDv9pqa/Db7BdZkQmTjpWudVhECQjy9LKF7FGvH67I8eeqv2rmM+ZKNn/2vr/kT+8don4
	qjXAo2Adz8qJLdOEhTcijmZM3pE3j5msYJFq5od6l7wCrCQIbhM+iCYnqXtb9qWBfuOAcm
	37q3q0E4zOctVZ1eWimxXHOzwfxcN4VknS52xMHooKk2wjYTtAUs5jR9k/q1sQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	Corentin Labbe <clabbe@baylibre.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [Patch v5 10/12] mtd: rawnand: lpx32xx: Request DMA channels using DT entries
Date: Mon,  1 Jul 2024 14:00:16 +0200
Message-Id: <20240701120016.525443-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240627150046.258795-11-piotr.wojtaszczyk@timesys.com>
References: 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7326d3fb1ee39f02ef1f49d1e14ac3896caf85e2'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Thu, 2024-06-27 at 15:00:28 UTC, Piotr Wojtaszczyk wrote:
> Move away from pl08x platform data towards device tree.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

