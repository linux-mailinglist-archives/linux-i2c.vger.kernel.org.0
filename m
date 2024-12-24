Return-Path: <linux-i2c+bounces-8703-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 226309FBBC2
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Dec 2024 11:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09EA81886A57
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Dec 2024 09:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CA01DDC2C;
	Tue, 24 Dec 2024 09:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="IwzHhIi8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-m11879.qiye.163.com (mail-m11879.qiye.163.com [115.236.118.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C940F1DDA2D;
	Tue, 24 Dec 2024 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.118.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735033782; cv=none; b=lg7E1yHR3sEfAwBbvakIcuCqrmKq4DPj8aj1IehNNSM2UJoRIb25tTwkrZu+ujKgsBvXXj4RFGQDHuIELxAmiHpEnBoxe2J/xOexKdJeGJnVeUtK+G6J2suG4DEieCZzNCu2+VpEh91FFNsWC+R1OEGj9io98FLGPgxx9kGHaaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735033782; c=relaxed/simple;
	bh=fo4O3DUbdR1GLX4YrHy6RH/QYtH7FZoVdSoQT0b+94s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MvaV0FptxcdxvkVMgOLzzvxhkVFmXthTAArxbacHH+J3JjbvUfMnVvp0vcZ8hjXCuR7f36AAGQwIwrPjnwQ1BGJfoCAmt35JZ2o0EUbBRGzrKfPLuSMMPCa7hk51wRNGGEOx7mAHLS0NXjivb4/1bOZyOvi9eAMwj2g9sNSpaI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=IwzHhIi8; arc=none smtp.client-ip=115.236.118.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6aad4f01;
	Tue, 24 Dec 2024 17:49:30 +0800 (GMT+08:00)
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
Subject: [PATCH v2 05/17] dt-bindings: i2c: i2c-rk3x: Add rk3562 compatible
Date: Tue, 24 Dec 2024 17:49:08 +0800
Message-Id: <20241224094920.3821861-6-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241224094920.3821861-1-kever.yang@rock-chips.com>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUtOTFYYQ01ITBkdHk9OGRlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93f812534c03afkunm6aad4f01
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6K1E6LBw4SDIWEEowPFEfLClR
	ME4KCUxVSlVKTEhOS0hITExJSkpOVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFDSU03Bg++
DKIM-Signature:a=rsa-sha256;
	b=IwzHhIi81TA9HnKZ+z7VyIPgp/5sMLOZaP6B7rfbkbSej+P2D/Yt/iOj3hTrqwyFX/KMLp2ViGZkJz1jTAWaxA42Q8jLF1EiW2aUsn8FWuogVfXkUWGVW0Zcg87u4y963UFeRdMCOi1RNapygG/x9E96rN8SKnOzKDEswz085uQ=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Fa7XEoZ+RPcBuWk9L6Qw7dSHYC3bDV3g23RfgBMjFWQ=;
	h=date:mime-version:subject:message-id:from;

rk3562 i2c compatible to the existing rk3399 binding.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

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


