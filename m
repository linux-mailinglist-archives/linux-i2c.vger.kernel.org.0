Return-Path: <linux-i2c+bounces-9619-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4215A47BFA
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 12:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C59511894EEE
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 11:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0DF22CBFA;
	Thu, 27 Feb 2025 11:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Jshtcg4q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-m49221.qiye.163.com (mail-m49221.qiye.163.com [45.254.49.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FBD22B8D7;
	Thu, 27 Feb 2025 11:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740655178; cv=none; b=tK1haVjT+CEhphmWYS3shUxzKHtYa+f+rIGUfBDvbNfL+HXRP1EzQKN97CTA+c78ffQ7yKSt01QHqOZteelferQ91vNCQvyGTvn2TmKEPDB3Mem9J/L6c5ZzT3j8raRIx0yi11oBBSQmt+LgLa1nzwC7HsKTfpNPeXARNlmJpTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740655178; c=relaxed/simple;
	bh=m7yY1/txrUcHs72ZukJI4IrUGmpvJw2uHQI6ZS5QHuY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H1TJ/KmOnxvgjD8zj/uP1smdq5pIYqGsH6Pmt1ZEN5koLr0n2b43q6gcF7tI/Q5fLkQct0hZqRMmy8GcOWHAivgMW7p5EYxTm9cHF2eVXZN22rT5AViYsrUKR3ikM+Cq44qUr/9GyOpgOpv+vjkql/zZDKzjChWrEwZ4V7x3RF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Jshtcg4q; arc=none smtp.client-ip=45.254.49.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c65f97d8;
	Thu, 27 Feb 2025 19:19:26 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v3 04/15] dt-bindings: i2c: i2c-rk3x: Add rk3562 support
Date: Thu, 27 Feb 2025 19:19:02 +0800
Message-Id: <20250227111913.2344207-5-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227111913.2344207-1-kever.yang@rock-chips.com>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR1LH1ZJHRhJQkwfGB5LGUlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a95472202fd03afkunmc65f97d8
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PjY6MBw6SzIWEQ0oAkI9Hk0p
	LgkwCzxVSlVKTE9LTU5OSk1MTklJVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFCSkg3Bg++
DKIM-Signature:a=rsa-sha256;
	b=Jshtcg4qo4tv3yp57f8BeQ4JVpSLtF/rSPS/xDxZHaH7hdmqHDMcwL58orV/jhG+nFDHJMy4HMP1t5dQ2yJmoK4PHR23qTWvWRzA2jdXaaibcq6F3Rej4qz/PsIOg2Lgx/1dJRX+W4naeD84FzCvNz+5S7XQ9SMu7eM5m5BVB7s=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=I3iQQEtRmNRV5igybnDSqzo+ihaIIQT1QRYBRaPEXgI=;
	h=date:mime-version:subject:message-id:from;

rk3562 i2c compatible to the existing rk3399 binding.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

Changes in v3:
- Collect review tag

Changes in v2: None

 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index a9dae5b52f28..8101afa6f146 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -37,6 +37,7 @@ properties:
               - rockchip,px30-i2c
               - rockchip,rk3308-i2c
               - rockchip,rk3328-i2c
+              - rockchip,rk3562-i2c
               - rockchip,rk3568-i2c
               - rockchip,rk3576-i2c
               - rockchip,rk3588-i2c
-- 
2.25.1


