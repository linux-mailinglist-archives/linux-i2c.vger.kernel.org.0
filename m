Return-Path: <linux-i2c+bounces-4342-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE55291675A
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 14:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 741571F25FF2
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 12:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A263016DC19;
	Tue, 25 Jun 2024 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="j8arj/u/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C1916D303
	for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 12:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719317689; cv=none; b=ELQs+m2pKPtHKvjNbs6Tfl9SGihdQRcAHQUEpIZmm3gkQEurwSVXveWE4fMDmidxSqeGwyHJ5CaW9gqKToRP1UpbgMbOmckFX2VymsM7WdHcEWI3wcT7rEdceZueb6AHOxQEXNB/7K6x/LtmDbmVGcHcrTo5lGVX/SbT7Cevb70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719317689; c=relaxed/simple;
	bh=d+cxdUc/kawXknja28l908DWiM43QePkYourTSwGSCU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WF4qBvk8Hiim1Py2mKmTNktEwaFazIXGQimbh4p+AhiWlLzpY2ENeC4gUny+o6TCJiqzeyKw/0f15Qu2MCkmFVI7uz7Hkz0GUof2RP5DIfIyW0JvjABkb64Eb9YAxobAhDz1kCJg1zBaWD1H9VFWJa3eeKFiXgk8pgqqU5pJh1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=j8arj/u/; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-361785bfa71so4169018f8f.2
        for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 05:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719317686; x=1719922486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSaReodlEhPLrYROJulVi8oEC9WlvggFVpDF15BFghc=;
        b=j8arj/u/PgfR3VVw60l7In0l1XMmp5o3JLdEnP+w0Mvx01+zcQsS3r2NgqaBbCoRsr
         RCKbSynZAIlzfX3TS2Vp5C0bcQOVRYj2X9RnochMvFjel1xWS+q+w8C57jwvQoRDRYbu
         +v5K2pttdStEVOkgAborIYvd/P3Zbvjo7FjFctSxhFUS/hgRLO4U5QLFuFzVk1nU+pYw
         zNUXmJFiw5rqkNURJzE+McjmU5xFObWPS4wS8/cWOu5yrzN+jkZu2LUkhV1ED7Rd3BSV
         IOF6WoiJnev0u0rIGRG5ZULpO4O6qp7JiyF7jRV8qUgoSV4lNHHKGw5ooO0ZiSTTZUzf
         YxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719317686; x=1719922486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MSaReodlEhPLrYROJulVi8oEC9WlvggFVpDF15BFghc=;
        b=gdn2CTOYGHfu3gxU6qR00PU+BOK0DKh7EcaaMWF0XawJIGoW++sSMvXID3Z/HjhKcZ
         0+3oR+7PfU7L83DWGfGObXSM1dttMNLxXFFSdoMu9QhsHDh7FNPR8XPMAVmbTIXpeVDN
         QlJyMHB3PpA/aDlF30Nq5nouRCnArVR9qawnqq90y5UrRi9Epc+dc4ErJngFJnYI8zZv
         /co87pCE1bNgllS77dE/kUHfzRI8y/6qQSEOtsxBEGAN19sYPtTpIaQvMJZLlw2TVYno
         yI3361mS0dj0Eac/NEbyZjfesBcohom1cq9ErgVJfibdgvBxGxPzRYLWW2g0r0MJipTx
         1+zw==
X-Forwarded-Encrypted: i=1; AJvYcCWq5QtY+KJpITQd504pYmjeAwWF4gXKktyPIG8KXa3ak+5UQKWsH+o4a9+EVVDDoJIFmslq2aTjOUHaq1tOQ9NXIsmtnR+rrpZo
X-Gm-Message-State: AOJu0YzvxisuXKqJQ1+V8Pn6l/AfiePCPthjBqdTN0HL+5yqXYsHg6cE
	J677LR5FCSkW5WnGEskhQ55AVQh9MubM/oS7pW8FtvUIh5bg5ESDl1XXRGVkgOQ=
X-Google-Smtp-Source: AGHT+IEYBeG/knw9uoE5gl1YMNW1sVyFEHk5gBsye8670o9+6zQy6z/xZPkF9T+W23ZQtZ/7hVx1gQ==
X-Received: by 2002:a5d:4112:0:b0:362:41a4:974a with SMTP id ffacd0b85a97d-366e7a52149mr4911034f8f.66.1719317686218;
        Tue, 25 Jun 2024 05:14:46 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8b32sm12798437f8f.92.2024.06.25.05.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:14:41 -0700 (PDT)
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
Subject: [PATCH v2 11/12] arm64: dts: renesas: rzg3s-smarc: Enable i2c0 node
Date: Tue, 25 Jun 2024 15:13:57 +0300
Message-Id: <20240625121358.590547-12-claudiu.beznea.uj@bp.renesas.com>
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

Enable i2c0 node.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index deb2ad37bb2e..7945d44e6ee1 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -11,6 +11,7 @@
 
 / {
 	aliases {
+		i2c0 = &i2c0;
 		serial0 = &scif0;
 		mmc1 = &sdhi1;
 	};
@@ -66,6 +67,12 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
 	};
 };
 
+&i2c0 {
+	status = "okay";
+
+	clock-frequency = <1000000>;
+};
+
 &pinctrl {
 	key-1-gpio-hog {
 		gpio-hog;
-- 
2.39.2


