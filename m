Return-Path: <linux-i2c+bounces-10455-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BE9A91B76
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 14:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CF5F3B0886
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 12:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8FD24729B;
	Thu, 17 Apr 2025 12:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="YN6/i7fl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EE0245039;
	Thu, 17 Apr 2025 12:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891325; cv=none; b=gdMaizGM8iM4iEd79wTzMbsKz8mdYdcifVfbNco0V2A8LG6x++OhNjCQkr31aGXtwY6ofoMwyfvYVMd+n/Je+Is3EM7Ds9v39+jAdEPBlTTEF6gyvDUIOxAfvqLOhRdhNAOHaaMa9DhQr1RC7sNZhploPbt4w2IsaVFE4qeh+dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891325; c=relaxed/simple;
	bh=JrgG1E6WF4FOY3BbNVxmDrHICSeGOa0nq70lXCt28ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R3N+Gd1KKFS1rAjLryKP3VRCKXrflnA5gQGjgfOa6T+jTLBmIPiraSHhcbQs0IsLkH/7UYCfK2AxHIX+SjRKmS8n+n4oShUQK8BuhljgvDf/SXxsI7yY2tMM8UPTEn7mMXwYLg4y+RNTo2lAGowz1VGABczE7ypdKg3MxSvvNUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=YN6/i7fl; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0DE3525BBE;
	Thu, 17 Apr 2025 14:02:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MS4_IJQQwXiT; Thu, 17 Apr 2025 14:02:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744891321; bh=JrgG1E6WF4FOY3BbNVxmDrHICSeGOa0nq70lXCt28ac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YN6/i7flNPMgHAVVUnttrb7MppoY87tMLYhjGfx5F9+fdb0qvzTMuWsl0e2iD9yPa
	 f12KLX475jI68cnDree0Cr8ZQR+mgPiRR/lAwSnNiXKYvp/5ySXfHF/1Nc5eKOnRJ8
	 PuyhHxqeVyGCUilcppp4UEUfleR8C3C7Knyf5hXA+cXD/JuSCoasEHoW2e75WCdyTF
	 953iNc+mQYT9w+SKZZ2Ntg3kYse2G+x0afHV2xTX9/NFccK4mjPymh6MgRNQoIjWOA
	 TVmcUkEwwZMHPg01Rz7N9m0ltEgwYTwJTwyRodQcav1j08McAjv2hsuaUXfxSuTKuW
	 2fEKzWDvt61Ig==
From: Yao Zi <ziyao@disroot.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: i2c: i2c-rk3x: Add compatible string for RK3528
Date: Thu, 17 Apr 2025 12:01:17 +0000
Message-ID: <20250417120118.17610-4-ziyao@disroot.org>
In-Reply-To: <20250417120118.17610-3-ziyao@disroot.org>
References: <20250417120118.17610-3-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document I2C controllers integrated in RK3528, which are compatible with
the RK3399 variant.

Signed-off-by: Yao Zi <ziyao@disroot.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index 8101afa6f146..2f1e97969c3f 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -37,6 +37,7 @@ properties:
               - rockchip,px30-i2c
               - rockchip,rk3308-i2c
               - rockchip,rk3328-i2c
+              - rockchip,rk3528-i2c
               - rockchip,rk3562-i2c
               - rockchip,rk3568-i2c
               - rockchip,rk3576-i2c
-- 
2.49.0


