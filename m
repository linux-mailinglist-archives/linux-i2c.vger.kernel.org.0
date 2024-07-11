Return-Path: <linux-i2c+bounces-4926-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2446A92E7A5
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 13:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1EB81F21B38
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 11:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7072716C6AC;
	Thu, 11 Jul 2024 11:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QqOPNyvX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D3716B722
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 11:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698764; cv=none; b=AeYu40i+ci+L4LiIAJzDDhUAGDMojJwMHJFGL9gpGXpZjShqusF27yEizwAHCXLwFzNXe9hgun8cVpSpXFijMOQG8Az/zvP/uaGsBxwRp/Apwtxf9vKZRkiH8AfzagLk43g5RHdRaQ5e2yT258Jbt2LW0F+ci7SBEjjrhtmFhn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698764; c=relaxed/simple;
	bh=A0olck8xmt91kpHf3Gqks+7X7VhqbfLSRQr3kvyb9/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PBuyNyvHoCmhRijnPvqDeNAB72zcLo0BH8o3IAzv+bigfvp8DmSWDTrBauo+icHROrb0De3yW7eMfT4q2pU/leG5y0NCUfPonhLYSr+BA67Yyf+TVe6R0qVsZKTJ+T3Qia6PJG6AVqhNh+troCC0XM5beYx9DgfBkchcnOk6Jr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QqOPNyvX; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-36796a9b636so373660f8f.2
        for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 04:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720698761; x=1721303561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23JHMztdqyVYYAjIp7U+2QZVKMehlsQx0vaIwQy1Uh0=;
        b=QqOPNyvXIOORGpBVnySxyd0qCN6SRdb0veGgKY5jbF3eqk+0srNMnEMubPMqIIEMGN
         s58ym7IshD1WweTdwXseHQcIZIMDGttuAa9fNkNi9wR+z+5ZirufN5FlAhCkBLm22prM
         oZl7Cv95gPeiXlevuWlFdCuDgH4KnV/h4lAw8zC+Gi6RglCMx4mAjWuGlF9Hpk4GwY5f
         mvmEnpAnOyhkcRQ16SW5l00RpcRbBqshLnd/EWZTdnSaKF83c0KWoteheZKrhQn2U/hN
         OE+birFt8t37gRElAHIbDWdbluASlSXPUfV5/dpENfRif4HklpX5w6T2/XpAYnmlWDe3
         w7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720698761; x=1721303561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23JHMztdqyVYYAjIp7U+2QZVKMehlsQx0vaIwQy1Uh0=;
        b=lq8oR4txF3HR1xYFq91TX//xVK/5R2ylUu1thGB1poM9nbXfl5kBLNSfHy6QMt24VP
         Eu/mNasCGqfVTHsxo1xRVYaxYxvlbAFt6dtStunZPSAqTMHYx8uMELFGRsHN56t+MCn8
         0PX8YGv5VgQ5pXjvDFgosxhqraL2ZbDnIMquk3p9WwB9ZGcb1ckd7vzB3His/7tmHYSd
         N5gtAfdmcYsxKyUBNqKrZPGupzoWdcgievK04YZV3zzm9Ai80rTFMb/VfZmJmBLbx2Ib
         lG8QPzMCuaS9dCn5V3qTeaC+7osC2+dxKzkup0scUCP74sYQ6mBn10mWi6IecFaUF90k
         mnTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl3CqDBmkvbiV4g1v9WoHYWMwp5tBetMbK0bMgcuYnZiJuiJHiCIzwy6M4MRMPIwU3ArigEGCHMGQRj1NQFtf3TrSv0P129YOk
X-Gm-Message-State: AOJu0Ywhd7LCwI/W1s4hEBxl830fGpybY2Kr4qpAccG5BFkuhIv9CfaN
	sOGdpUCoVN/xwI6FVzqqUznRO4tVFsSZSEL2iBXy2CQBHiIk6WutKV00fMS8eBs=
X-Google-Smtp-Source: AGHT+IEGSAph+omnuZzg+uESoOH9Ojh+B4Qxya+Yp/LFOJWoFwzZN9bd/zH+TlfWF72r7coXWyfImA==
X-Received: by 2002:adf:f004:0:b0:367:96b9:760a with SMTP id ffacd0b85a97d-367cea96903mr5200725f8f.41.1720698760771;
        Thu, 11 Jul 2024 04:52:40 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde891cesm7615728f8f.62.2024.07.11.04.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:52:40 -0700 (PDT)
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
Subject: [PATCH v3 11/11] arm64: dts: renesas: rzg3s-smarc-som: Enable i2c1 node
Date: Thu, 11 Jul 2024 14:52:07 +0300
Message-Id: <20240711115207.2843133-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
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


