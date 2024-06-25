Return-Path: <linux-i2c+bounces-4343-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A959A91675D
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 14:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB2B81C24B4A
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 12:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08521553AF;
	Tue, 25 Jun 2024 12:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XK9Eqwz3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E00016D9B4
	for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719317690; cv=none; b=RFs2MVG04/MPoq6nUF9DCVYW+pQfrpD7lix/surqmBa3zYrRatQuv0NQTlTnhxRiVqu8HPwNyM7vBN4jfc64BLLFII1rOX6u9Ye9aqHhjEU8S3lJEWpDIZkW9AcUFTPTQwM3Z4sUkWKyOxLKqYgFfe41XLkntOlac3Oyunq++/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719317690; c=relaxed/simple;
	bh=up+CKCw3ZtFCZT/R1IA59eXhUiHBrn4jrvl8EMaiQVI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=luRn3zZiMJZQYs5AKlx80v5V7oindnjV2T9npxF+bSqZoYGerBh+ZXTKf/ztSz2pB49eV3shdfYDCwL+R7YMd0bo9kqtq+HizzZoxs6U9awUXxGuCjvzzhDStpYVlUmhUoTaoS5tDsvc3eOt7G7ZNn5gLOTlov0E5VSdVEqFsNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XK9Eqwz3; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-363826fbcdeso4006179f8f.0
        for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 05:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719317687; x=1719922487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GKJ24v9TVtuWhV14muRJU3eBIqlecW/qbwYzBi7wQ4=;
        b=XK9Eqwz36RcCgONU1DSVXSLa5fkTGq0t3D6igMER+Rd8d0nQyGfrfnWpaIVJMV6Qwf
         2Z5t7ERPwN7J8/hnm+di/9zwSPzWXk/4NIkIrJ5NVfdYgkTktAqp+NSL3Wb62x20DEyR
         3Ot0328/oQc4GzufJAGpvn5UPMy2jYa9L+sgCn5ahWR88vQNzLvsACh6YjcAJ/dqTHhs
         CSvP9frn0mfDmbmPK8g+Xl+KPZ5UN6YBoEBSaU2jF3+ID2/qhH68d4h+g2cQJPZ/l6AI
         5EWg4LSup/Q+yUDnj5KaG4O5L59ZCcJSgxTgzJpIu7FH0jiiasJ1T3U1Ocqc+HgghsXd
         o27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719317687; x=1719922487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GKJ24v9TVtuWhV14muRJU3eBIqlecW/qbwYzBi7wQ4=;
        b=VTNWNuX3oIjjfke8a8wR8zO9rOIr8H7+QtZPcqihqGWA1AxhEd0lb4Q09dbJ5W0M17
         NYJLS6V9RP7XV2I6wz5yCBpEv0jMrtWHupn3P1tNao2FGzWf5u3dNTy8rFk9WDqG1trk
         +c+F1zEdUJjqUgO7quRZmtd+LSArTWTXuZoQ/qlnfEoQJoToqcYTicQHJQjpBzls8Sk7
         Uuyfnm8WxKHj8WGsWLgIUs70cIm5h3FExn77wWorqjAXMC//dfNIjSpdmV2zQoWQRR9h
         MtzO6QRRnMHeJZ94Gr8DFrYBovt4QWoa6k9Tf/VpjTAtD3p41ijZxXAnDfaOfw0zAlRd
         TSXw==
X-Forwarded-Encrypted: i=1; AJvYcCVygu15ue5cg6EEHs79Jqo/8snBK1NGKiAkb0G2b51mGNfyQuTyqvEi+bFm7giR0Heg7gI6p2rQwdogTA6kwaPhu/cG08WxJf1w
X-Gm-Message-State: AOJu0YwVhJPtVS+BTZkxy1pDURdCIQO79tSsBi8BrxXIVxUOe/Q5FbIJ
	qUDV8nzKdzAQqROX4Ix5Uti6pPOdZYJFVHmX2Zm9vwtwfygEal18uxgcMSjzaUQ=
X-Google-Smtp-Source: AGHT+IE0bik9VVIosKI1k5PcnDWp8XNvIEpEQaNWzDyB3Cpn8xenkx4I1ZQz7IJ1AZgs6x8KmksV/g==
X-Received: by 2002:a5d:4ac9:0:b0:35f:1bb2:4354 with SMTP id ffacd0b85a97d-366e7a1065bmr4390465f8f.35.1719317687632;
        Tue, 25 Jun 2024 05:14:47 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8b32sm12798437f8f.92.2024.06.25.05.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:14:47 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 12/12] arm64: dts: renesas: rzg3s-smarc-som: Enable i2c1 node
Date: Tue, 25 Jun 2024 15:13:58 +0300
Message-Id: <20240625121358.590547-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable i2c1 node.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 8a3d302f1535..21bfa4e03972 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -32,6 +32,7 @@ / {
 	compatible = "renesas,rzg3s-smarcm", "renesas,r9a08g045s33", "renesas,r9a08g045";
 
 	aliases {
+		i2c1 = &i2c1;
 		mmc0 = &sdhi0;
 #if SW_CONFIG3 == SW_OFF
 		mmc2 = &sdhi2;
@@ -150,6 +151,10 @@ &extal_clk {
 	clock-frequency = <24000000>;
 };
 
+&i2c1 {
+	status = "okay";
+};
+
 #if SW_CONFIG2 == SW_ON
 /* SD0 slot */
 &sdhi0 {
-- 
2.39.2


