Return-Path: <linux-i2c+bounces-1500-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A63783F759
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jan 2024 17:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2CB11F219FE
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jan 2024 16:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2867C67E66;
	Sun, 28 Jan 2024 16:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GM1TlSKZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AD167E60;
	Sun, 28 Jan 2024 16:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706458451; cv=none; b=oOUOLm22CKa+/vSSPeIS/ZvtANAQ1uxrEBmOGSywHm6ZRjLbDmRPhQJsPKXkXU5fTiP0Ay/UCYp93JGLdRZsi1XV53+kVQeppBqHonn+xo+3AWja3hyJwUzxLmPmxw7kCK/AJsNwiKTrD9uHJ3Fb0n7w/TrcbTorL0CSw587fx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706458451; c=relaxed/simple;
	bh=4Gqb/Kft+ydmG62lfpNUxY10aIVDjYIQjA1SGPOZj7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1gNy2FVcl0Hg/na7RcEjokeVYBaudxVH3Z83+FUpyRruz6uDkig28uaUVXPywCp26mjddh2w9yriBLKF95+/Bf09r6yzZ74IQG11uRYoFgaiPID4I3Elg3FJg+TWjm07MWqY3Jcdke93cKLN7JANSydaFRYc9OZeM0HD+DhXro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GM1TlSKZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D7CC433F1;
	Sun, 28 Jan 2024 16:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706458451;
	bh=4Gqb/Kft+ydmG62lfpNUxY10aIVDjYIQjA1SGPOZj7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GM1TlSKZ4fucQqpQWAGBbXOWz/4ME9lbto9ilQZewvMNTPcqOv5X2mc54ysTP/18h
	 ltTUlJFHkpZFD93DCcv9DVwDBG+dU8wjs5yTjd38OOjjnFkbf1kvEhTHyFSkwXaoOH
	 k4ubFM+v3OJGqcGUPXGTVv/imPMer/CLN9j3mnJaO1ncmZjuf78iGAWASVFVImDeGu
	 lja0dtRfhXje7hUlPrT8+XaJbCUsAm7SYcsv9VOA8AIvcfZSS/kBBlHAbyA5AhlzF3
	 J3JgxiAlPsCZYRul83JEr4HuRVgjUv7DIYpNamcmPptpvFA94PxG0yB/wUrZ2TEDGC
	 QLde+SwL3SE/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tim Lunn <tim@feathertop.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 31/31] i2c: rk3x: Adjust mask/value offset for i2c2 on rv1126
Date: Sun, 28 Jan 2024 11:13:01 -0500
Message-ID: <20240128161315.201999-31-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240128161315.201999-1-sashal@kernel.org>
References: <20240128161315.201999-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.14
Content-Transfer-Encoding: 8bit

From: Tim Lunn <tim@feathertop.org>

[ Upstream commit 92a85b7c6262f19c65a1c115cf15f411ba65a57c ]

Rockchip RV1126 is using old style i2c controller, the i2c2
bus uses a non-sequential offset in the grf register for the
mask/value bits for this bus.

This patch fixes i2c2 bus on rv1126 SoCs.

Signed-off-by: Tim Lunn <tim@feathertop.org>
Acked-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-rk3x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 4362db7c5789..086fdf262e7b 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1295,8 +1295,12 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 
-		/* 27+i: write mask, 11+i: value */
-		value = BIT(27 + bus_nr) | BIT(11 + bus_nr);
+		/* rv1126 i2c2 uses non-sequential write mask 20, value 4 */
+		if (i2c->soc_data == &rv1126_soc_data && bus_nr == 2)
+			value = BIT(20) | BIT(4);
+		else
+			/* 27+i: write mask, 11+i: value */
+			value = BIT(27 + bus_nr) | BIT(11 + bus_nr);
 
 		ret = regmap_write(grf, i2c->soc_data->grf_offset, value);
 		if (ret != 0) {
-- 
2.43.0


