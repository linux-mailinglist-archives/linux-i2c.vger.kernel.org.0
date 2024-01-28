Return-Path: <linux-i2c+bounces-1499-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C9E83F6F9
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jan 2024 17:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1421F288C33
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jan 2024 16:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E0F58ABA;
	Sun, 28 Jan 2024 16:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0bcu7Nn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1056A5915B;
	Sun, 28 Jan 2024 16:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706458381; cv=none; b=q0uHO+mxPWku6JKwSdTlBHChgoXRSaXB+6CeegBUCTDbPB2injl+prApEhwCVHHk/7y0qvwna6PrQVbRJyGu6IrnI0luyeun9v5V0WC+SlaM7sn6ayYvnQatStk5QOgTluxoAFeIWanh22XWbwSOM8y6l/sBL7MI5xAI9WOO7zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706458381; c=relaxed/simple;
	bh=4Gqb/Kft+ydmG62lfpNUxY10aIVDjYIQjA1SGPOZj7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T/rRbqWtGl1T7lEioRt80khLd1b4U7gex5uVQZXYmeKSaM4wB0nD2ES1/tWms4PSDnoP9aorhMRit3t2YmfG8RRA/AzhpBz1oH/mjkQioYHB4Pl5FvwA0D+cgOSpo1CLgUzV0EXJdL2US9Zn/JzzUQtLmY9v09kLwU2R7FP1Nm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0bcu7Nn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836A7C43394;
	Sun, 28 Jan 2024 16:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706458380;
	bh=4Gqb/Kft+ydmG62lfpNUxY10aIVDjYIQjA1SGPOZj7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S0bcu7NnBXaetr1p08xjP/tzQj2ecLM6y4CDB9HWju+1doAMzgP/fuSODPbL+IqVP
	 wbLwAR+2p/Uc/XaJPOyBojJQPtGZWOnWEkylZxXgHHxCTrpQmpCxNsGPDuH1zL8v5G
	 leG1LMXi7IYkAR/nTDdZ/ZUgAqj7gljYMHBF8uTFki9+o07PJoM6Rb0Q2ep/fXlbQM
	 dg25n6hcTdc7Xq4jaxJQeD6AmX0EigBZU1Cf6WwZiswtHzAN9WIGBjBSzu40lhL3Fa
	 pBo/u8dT8tuDTFObvoZP7uaxev/OAXXHjcRrLlM4V1n8QqsEBdIuZv+1wOdVzJ1wJf
	 IxVxZV2VzQy/w==
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
Subject: [PATCH AUTOSEL 6.7 39/39] i2c: rk3x: Adjust mask/value offset for i2c2 on rv1126
Date: Sun, 28 Jan 2024 11:10:59 -0500
Message-ID: <20240128161130.200783-39-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240128161130.200783-1-sashal@kernel.org>
References: <20240128161130.200783-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.2
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


