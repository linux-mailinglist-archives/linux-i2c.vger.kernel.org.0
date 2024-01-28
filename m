Return-Path: <linux-i2c+bounces-1501-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 023B283F7A3
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jan 2024 17:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 353D21C22949
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jan 2024 16:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF7F12A14E;
	Sun, 28 Jan 2024 16:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6SQ8S2h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2E912A144;
	Sun, 28 Jan 2024 16:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706458516; cv=none; b=cm0FO36SZPVJ8ZOSzW03vbVq+b/7nn62TYHIu+l+Nhiku1vrkvPVQ6s5K+/QcBB/rilpPxivkriNZpX29MeEQpH9xOWzm+t9OtIL5fTjsyTRwdYwPJDi/mxjsLAB2tj+Th8Dlt+tkpd76vEcPI9MbqF453MA4bdams52/dGIKYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706458516; c=relaxed/simple;
	bh=G+N+8BBIfAm8TLoRk47DdnlMegqEadH0LZkeQEpo5w4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EaJBoZBzeY4nGVPnBTqbMylpQ6oIznzVx9Z/hKrM8JHLAcmD7H/xddDx6222DiR5Gq4PJ0t0jgXVsLRV51eK8b3J3x8X1kfRR4L6/bi3ak2JoK9l3vsK489bnfyv/TmVaSO4xHf42AoOR5kVD7IjJcXov1u6an6j6ekPwMawfi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6SQ8S2h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD7CC433F1;
	Sun, 28 Jan 2024 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706458515;
	bh=G+N+8BBIfAm8TLoRk47DdnlMegqEadH0LZkeQEpo5w4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f6SQ8S2hOMVO7w/RmJJr9TPOEsrxLYVk16BUb+y2Zd4g+XWurlxBj2t5GMa/0lV47
	 8/GtGBCaVHIsAFZOeml3AiN4sY5xI9aYH2ZMV2XQzNkUza7rAmJea7/OnHIHvFnR/p
	 qRohB1ukSqhNAonxtIgnlkFTRWe4BNTucKvINLv7x5RMg84K7LUbK0YXBVlKcAx3Cq
	 aPolGreXFfFOYx0E0KT8BmLZ/N3l/LmQPdoH9rqO4LtmQcQ0AoferZxmxpykZVXsfh
	 h1cexw8PKlfUqAdKX9CdjG4ORtjHF7oMdWCUaMpqgCMT43rZnkmCgGNRzIpGKg2+bo
	 Kb+YI6bsN6+1Q==
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
Subject: [PATCH AUTOSEL 6.1 27/27] i2c: rk3x: Adjust mask/value offset for i2c2 on rv1126
Date: Sun, 28 Jan 2024 11:14:12 -0500
Message-ID: <20240128161424.203600-27-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240128161424.203600-1-sashal@kernel.org>
References: <20240128161424.203600-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.75
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
index 6aa4f1f06240..c8cd5cadcf56 100644
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


