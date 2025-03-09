Return-Path: <linux-i2c+bounces-9757-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD48A58150
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Mar 2025 08:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 026B73ADC03
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Mar 2025 07:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408AB188938;
	Sun,  9 Mar 2025 07:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="IzLru5C0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F97183CC3;
	Sun,  9 Mar 2025 07:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741504003; cv=none; b=IWkt+KIvYe5sN3Zvbm2erGR79oKMLrBrpBeNo0fTZJDjVEcmdHBOMOkTcwlwhgpGO+G/Js6bHmforBSU2JdiN1m/QUZ2EuEwbqO2jmX6Dd+NVwfKyQ2BFU3B39xljCXAuJdnD94CaCMX2p805+BShwl0Y/+1LgX3WEEgKWGMIxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741504003; c=relaxed/simple;
	bh=y/wMl0WzuNkOtQ0dqQBPbWzJw0X9RJ3jK0zL4sYnIVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=neiEI6RaHLVD09paoYxgZt55TdUm1ZogQDjle9HmWk+fiEPXTTBuBS1OwpzEPv6NnLgNg3COyPFUrbPDh9gl1wsb5U9OMRo6g6PO0INKaDnFQ5Wpjh5FLw+BY3doOumvjL4VAY3xmc/Sg9pDgjOdnxdzphJ7fQkV3DaAjuMsve0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=IzLru5C0; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9B9B325EC7;
	Sun,  9 Mar 2025 08:06:39 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kU1ZBSc3RQnr; Sun,  9 Mar 2025 08:06:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741503998; bh=y/wMl0WzuNkOtQ0dqQBPbWzJw0X9RJ3jK0zL4sYnIVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IzLru5C0JtKymWuyEqvYcOy9MKh+ksZql7LksPIJshi0L0IGFipV7gRSfzdDebipO
	 QYldtE86L2Lrqe7CTqmbn2tcMGHYaFCEzhIfkA+VzdTHhma+62a+VQAbUMiP7QgZTb
	 XCPYgGar2LihDcMcJePCBsjWUQ3Dlf98bktCP70MZqrowlxb6r9tgy45rZoB0jo975
	 9Ry0xpvBB6OA8p4I6AN7vv6s2003PF1h7AwxOpkj/bMKXXKHJeSSmSfcW46KUIFZPj
	 +Dajljv+fGI4+eAC6CdJd2ZuF8jxN03QUr05mViLJTRFTlnLSivRv1bVXc3/7Jesf9
	 Dqwho9dX5xA7Q==
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: i2c: i2c-rk3x: Add compatible string for RK3528
Date: Sun,  9 Mar 2025 07:06:01 +0000
Message-ID: <20250309070603.35254-2-ziyao@disroot.org>
In-Reply-To: <20250309070603.35254-1-ziyao@disroot.org>
References: <20250309070603.35254-1-ziyao@disroot.org>
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
---
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index a9dae5b52f28..259770b1aa08 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -37,6 +37,7 @@ properties:
               - rockchip,px30-i2c
               - rockchip,rk3308-i2c
               - rockchip,rk3328-i2c
+              - rockchip,rk3528-i2c
               - rockchip,rk3568-i2c
               - rockchip,rk3576-i2c
               - rockchip,rk3588-i2c
-- 
2.48.1


