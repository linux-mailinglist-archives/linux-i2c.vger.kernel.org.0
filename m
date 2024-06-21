Return-Path: <linux-i2c+bounces-4192-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7FF91237B
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 13:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F273B24E38
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 11:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C9317B43C;
	Fri, 21 Jun 2024 11:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="e8GGMkk+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4196B17B43D
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 11:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718969024; cv=none; b=T1NRJGGaMqmb9hx4jxTZrEnH+hla/yd6iMztUKNCpOYgPEi9ZeYZd1XFoMhbMTpGOhKTDuuFQFN/Ar0bnpWKYdJ3T2MTj2OWe7WpQYLCWAr7Twz235kGaMP2Becsa7u0/QN59GNyS72OlnkexA3zeWYAxRCVikgkt6gh+oqJdWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718969024; c=relaxed/simple;
	bh=n02VnI1z3Lo/vCVvdYX3gNJ/na1w3LKQu6cqOd+GMII=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cxMqy4NeIH81GQZUu5Vz6YgiaibWDztA5S4tUgkuoZD4BDdaGvL9cOg4P9nwKYspe+3UtEqkE4ikpwdqUUurke31V4cNbHXJ+Cyp745VV8mRrmOO4JLKWgRQh0M+PWbg/cuOORjB87f658YA0uUJ4q6orzzBbP0My02nRHWGUE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=e8GGMkk+; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6f1da33826so239062166b.0
        for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 04:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718969021; x=1719573821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veIrjSKIW0msyP1BPKwCOv7rRYyO3ebgm2ScapHwacw=;
        b=e8GGMkk+MEXMMx8ecWdrmUcnfitLVwhwuDlqjvGYpUyGhaWvRXyN5hdsYkLxR7tuV1
         IuxOuTN7n8C/W6q8+nERUdyT7V/jcGADm4gRzAneS+IkzEAxyJSSciw2rwOxAi3LmpzY
         ajVubbLI+apSF3iG7ocIzwYsbcVXO9EB1er0xxTY/3JmfhNZQYeGC5yEUZGQJffmVGI4
         3Ymvez3WGcJ1juZQ0TVoJI/ywBLAmc508wv2kQE0naQuF1ni/bTnnCRYx+NcpnGHaHj6
         AlqSrHwEmsKSxrXxk+caxlBNtZAO8qJPJgJL5mKPq9kypOiiK7xqbY2H5MVCSy43L9NN
         cOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969021; x=1719573821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=veIrjSKIW0msyP1BPKwCOv7rRYyO3ebgm2ScapHwacw=;
        b=Fwrli7b/UtaOHHpnFvqCUpnoQfM9qEtIvFuVrrJvApmvcatlmNqZoDmKMvy7hb7BrM
         8G4Pfhlj370niLuwl75l+YQc7rN2kcHaDsiVlfZIp8SrqSiu8kHbCLh9cVuZoskbKp1f
         iRjIAoVpTHizstus6kt22RK8VZKS6vdxglcP7E6ZLhR5Kaca2kAl+6Nb/quCyL3ppy0f
         0d0oOdgSiJQHqAR6SMffUx8ZoGDAbl6sVnZadKuyPNBrYs50YHYG5VOnsgQ6yRFgR9s7
         wHWoEO/NbFEEI3619lOMevUVI/Bq1g9p4nRWHWF6CT6WHuXFpEY4K9MxUjmEdeq8uqTP
         Sl7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVATWq4Zowraea/XDoqTJLMHDDYTkBJkyjwCrZKOgnQc5EBY0dHLKqHmwMuUWPoeGjx4Aqoc7oqtD9bZ4tpqGPUb4U2mupzxkUZ
X-Gm-Message-State: AOJu0YzQgECQTp1rMWj31Bx4/Ou9ua74p0RgyTaktUo+QTXz1wJd7C5L
	d9TRns4XPprT4iwwOIbZabN2Nk68aYMYtv8opK98ZR6afpL0cIOecef+efhmLqa7XnO2SNCifzG
	Y
X-Google-Smtp-Source: AGHT+IEEH1uXQ9SWBQpZ3LT5PHwfn4wvDC947Dj2o3fom2F9AP5MXqF9KQPaa6c5ngH5rqOd6vpGow==
X-Received: by 2002:a17:907:ca1b:b0:a63:49d3:e1c5 with SMTP id a640c23a62f3a-a6fab7d6a8emr476914666b.64.1718969021696;
        Fri, 21 Jun 2024 04:23:41 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fd0838345sm64498466b.99.2024.06.21.04.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:23:41 -0700 (PDT)
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
Subject: [PATCH 12/12] arm64: dts: renesas: rzg3s-smarc-som: Enable i2c1 node
Date: Fri, 21 Jun 2024 14:23:03 +0300
Message-Id: <20240621112303.1607621-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
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


