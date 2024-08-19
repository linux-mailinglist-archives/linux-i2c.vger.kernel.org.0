Return-Path: <linux-i2c+bounces-5505-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE89956877
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 12:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 633471F22D01
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 10:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D69816C69B;
	Mon, 19 Aug 2024 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="N5xi36Gp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9E916BE19
	for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 10:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724063068; cv=none; b=Wk6h+fAdVSdrWxIutN5ZG9kVTUAxqTecL4Bgc7fnSONRFdhE8vdiKNrSPglQYEbaerSMutJfco+hKJhlaPVFnz4gMp6TLraiG69zf56pfxBbaAZjPYCQInyX0n2JYt3q/EDAMY67d2qgCKNxy3HwNnWmJijCnRxOtqMeWX6psVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724063068; c=relaxed/simple;
	bh=Kjip3a4fXX4ygWPQCnfrVGqq6qqVjaDC5YYo0HwiCNM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=adL5UWN7BIufv7RDjTxxjgg96cUmnYnBkrwsFdGOifNNG7XqGQDeZczb7gDaGioyqor+uAzDzJHUQa+wQ9+bG/9/nYPH1okr9dJdzKl4fY9/TybU2rxCnWzk/vU6D//SmKbUlTz7VglYF7V1GAP3Me6+ymIMmW7hgg98yRAOR0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=N5xi36Gp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso45465335e9.3
        for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 03:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724063064; x=1724667864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPBriNUBNJl9HUPvS8Bn4pFDMfpKhH8zPFLFTIx9O/M=;
        b=N5xi36GpuuevYfZkOzwX2/7yB0arLgNmuquEqb3JMIuUX4Mm1m9p/rzlaMRIz1LO34
         NFeQund0NKf+q1N8F1YputHylYXPS0sn57oA7FkfLxa89LWXIS8b61L7R6JhkvDp+jSF
         RF5bD+udX/hR7q9vdcclxHl2WPSoJ28TxbvLgx/UUndx7UHd7zwAq9usbRbR5sgy/TK4
         g9demUYHu1GQ4HjeDKTktLVAU/qWXeYtvlaKW4FqKmGuyVh4Ypi83VaYPT08jOIPAFIP
         Nyqm0gFGs9zBa1emALqZe2g9NW8tINeN38T4WoiROaWhTaaTQKP2QVfoUXpuQ5IS4squ
         jVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724063064; x=1724667864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPBriNUBNJl9HUPvS8Bn4pFDMfpKhH8zPFLFTIx9O/M=;
        b=YgJoI5rqfwRMd96ZE/+mpDBvalNpiSYIeO/yOuIx0FcO1UpetSPQBCUIHXmJlvAqcq
         4XhUyVyw1dluPipP96FOZAI9KeTBS0339meHgoG1fIrTrQxgror8VY5nCDnQA1YVKBPC
         i90kdXHCAjicgHYa6/2SvXZxQfoE6W3BNh0PVGoLNMeV5Pf689B/8ZJsbdsBW2YrFtg+
         0PxZPiQwzXFOEqM5VGMgqhdmjHyqrLWUtAbiOcZJF6JONOImm6x6C0fFcw0Lu6SE9MDY
         559ZXDFy2Y4AxaW0F6sJK9tPGbb2CNs9fZGPhBOGOtCHF+Z/E0NPeaqVvArgSYQo4iNH
         rJyg==
X-Forwarded-Encrypted: i=1; AJvYcCUot5cRQsWnf27JHcllrTr7DqGInvSHeBwKP3XswOBcD8gKUDIZ3PCG09fVewNpHoOaKuVpD+EZslxcxMOw/4gYNwbpT57LFKlS
X-Gm-Message-State: AOJu0Yw+3xB9B7Tb04A06Z5py2mz5UsTCyLlXW9s9Azn+TWxj2BRXJF5
	qJAjzn6d2ZZHeakCkNGILB9GvPUr6HiCuNAPvLfV6ti8rWGj6GdHKsV3HTj3vag=
X-Google-Smtp-Source: AGHT+IFc8feIJaq9GEMPvnpOSeeTFs+RovyO0dzj1O35X/s9IVtD5xqGjyseghvhXebWY3W2QXSRSQ==
X-Received: by 2002:a05:600c:45cd:b0:426:6e9a:7a1e with SMTP id 5b1f17b1804b1-429ed7ed5c0mr76532165e9.35.1724063063752;
        Mon, 19 Aug 2024 03:24:23 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed650402sm106690275e9.11.2024.08.19.03.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 03:24:23 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 11/11] arm64: dts: renesas: rzg3s-smarc-som: Enable i2c1 node
Date: Mon, 19 Aug 2024 13:23:48 +0300
Message-Id: <20240819102348.1592171-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v4:
- none

Changes in v3:
- none

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


