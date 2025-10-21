Return-Path: <linux-i2c+bounces-13712-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D3EBF90C7
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 00:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38FFF582559
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 22:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD1F2BDC1D;
	Tue, 21 Oct 2025 22:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="eZw6EgdN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F19529BDAA;
	Tue, 21 Oct 2025 22:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761085749; cv=none; b=DdkcDZlcs64SdxRTm5ziTrJ9OK8j1Tbhz0hjM2Eg8Yt9+oP9j3ou/VAf9ow+UsaLaIE/oDSJ62yP4vyjMdRI8zvzk5UySINvHsdCeD8Q8ZH32zIyRs5jIttf+atDCNGoXHsVCAowLZvH4HdteJUcEaeu9vkcPN0kHtwl0Pctbzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761085749; c=relaxed/simple;
	bh=wSGWsOO9ggsQ+coV5hXWFlBlZAHpKC+Skx77bvEr2EY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HRs2yaix5Mv0Oe5WAvF63IuSdaEjVEG7SH9S7pl79NRZrmnQ1WK9AZ8CEgo/Fc5rW+6n3j87t9Sb6pVLPTiz/csCppVH6zQdNJHlbXYDG8sXhKteGInzIqeYijqvcrtwJT2JHsmX2mahaSurxfKFvI7HcTQQsRVvQ8/JUxFMU7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=eZw6EgdN; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=YdGTN73HXBg8W33BsNyg4SyUFHDBd3hNuDk5+fJC1G8=; b=eZw6EgdNfTYTKcWZ9YWJCPUurN
	WTX2zniT1zGBHYkaOqPa75uh/+SxFulTqwQ15IBM+JBTwgLl8PckPZK/DlkL0rVLHY2ZHvH2u8rBd
	RDuP/tJjwwJ9TMBzdU6OolTkUlROv9eNm9OU7JOQ8HVGOBXpxYNAydftKoL3SWOgUln8DyBbb096i
	Nw2hwspMPPi1igjKLRkBlXaeVZRgYldduuC4OfGV9A3hObW/aBaRb1OwizN9XUGFkiQx0jekomQXB
	+KCP+1LxgFDSZXrHJZb0MPdi06zmnps3SnTqhO/VRfchy6yH0wWS2pAuQ2lSMg9MhJToe3+HZecN/
	zBGO5vpA==;
Received: from i53875b19.versanet.de ([83.135.91.25] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vBKqg-0006gf-SS; Wed, 22 Oct 2025 00:28:58 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: andi.shyti@kernel.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: i2c-rk3x: Add compatible string for RK3506
Date: Wed, 22 Oct 2025 00:28:53 +0200
Message-ID: <20251021222853.193224-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i2c controller in the RK3506 is compatible to the variant first found
in the RK3399 SoC, so add the RK3506 to that variant list.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index 4ac5a40a3886..91805fe8f393 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -37,6 +37,7 @@ properties:
               - rockchip,px30-i2c
               - rockchip,rk3308-i2c
               - rockchip,rk3328-i2c
+              - rockchip,rk3506-i2c
               - rockchip,rk3528-i2c
               - rockchip,rk3562-i2c
               - rockchip,rk3568-i2c
-- 
2.47.2


