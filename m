Return-Path: <linux-i2c+bounces-4188-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 359C1912366
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 13:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2FDC1F2582A
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 11:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C36176ACA;
	Fri, 21 Jun 2024 11:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CDQYhouu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFA5178374
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 11:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718969015; cv=none; b=ifGMBV5v/UDzD6P+LTq/U7lzYFvXjEvNzEOTRQYcPZj281on1qeq1pU3WFzdNziKEIwhsEi8EbQdmfhfxCPBkxR5U0+gncNtdRTPLbccMvGp9V2Pjd8Bxn9DxHRaoWNEuPQF7NJRE6RxfOhmFv/RVWMSPxJ75ZwS8qQ26G+QVAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718969015; c=relaxed/simple;
	bh=tWEdZsb5TVhDZdgUGXwEPUKi4yqwoX12X8EvMXZzLoI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KhQp3s3qbrn8oSRq+09p83NzsEpNbuPSnC2HXZjX4NiTxUIFvAA2Yldt1/yXgZ+UJhsPpquM4Mc/MhvclI5/Lpox4ZrrtjvFyuCvGjrLG5/0LLNGe858qnaE+jsv/v5Ypu2W41dzLFKhw+aMSZEi1a4+O3fMIDDRTcqelgezKts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CDQYhouu; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a63359aaacaso276596766b.1
        for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 04:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718969012; x=1719573812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3dWmB2UOK8ijvT1OLodQzKsVR6IgXqmnkZzW+KAtZo=;
        b=CDQYhouunZ54JveSvZnQEGWD625OzCAAaToiryCu1Zmxx3mhgBZ5ESxmjrdZgqx3ph
         XLlkrqWw2iJXGVkfP8NpDOSmACspwfH8qfwJOxdHsBxczlUpdiWUAu/POnJdeygx4HF7
         /TpQ0zNkWgaN6odUGJoLTLTAnGg/mI70BkJ/JXOItBXlvXIR8jC9A/odFMXpJ8DpVZQc
         Ko7lDaMqvimTCQH5ri12jNj1//0WGSWlI+S/FqhACyTB41jNA0LCutFlaXLy9wFtgmKN
         FlJRvNfSToVoODvdB4oAk6htm+lwLyJGOdwBbKoSTN95OwZkxNoSSK1dl8heDV3/SJFl
         w+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969012; x=1719573812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3dWmB2UOK8ijvT1OLodQzKsVR6IgXqmnkZzW+KAtZo=;
        b=dB84clfQSAI2DjbZsxxX2bkCQeUZ3F+7MeIODdXSNyHOC9dIAbwZmQUKOer13aMCfj
         r1oFNYNIOFETL0Oki4rCsTi6Uz+ZHqGeH/fMXB0zaADsQrXqMz/8oUkTdUpqRqIznFDP
         Hf7L4Ky+kLdVYtQSvt2ZmvEgqdL9m2gRZmDpn/rSlBL6oE2BpwDo7fe7xlIAZkX2HfvL
         1E+P9XyFBwcZADu7U869EPjvSaK5qTgurAgz5fB8hmazZHsXS48BNq/GHJR3QA8yE0XI
         37v1WSobJq+QPn8vk9TFc21Gugy2A1DilV2Lws+gM59x6eFWf88F5dwgxPCgdF4H68E+
         dZ1g==
X-Forwarded-Encrypted: i=1; AJvYcCVJlZckRIwT1iI0a4Zu5MDleyCGz9GRh72e8WPAf5P5aWhR66XsGUDhGBYJ2WRxk/VI+WpXVMPI5G2VrjrLXAEbzmj++FbAkheX
X-Gm-Message-State: AOJu0Yz+R+V3BzkLFJWOcIknr3i/Lrp3pro9coZd/wuzTUwdbj2AIMV0
	JGefeNe/oxpVoX/4goVKmIHyuB7mCt/b5RWGHD1GXOfsd71vA+pegDxWa7NSZ1A=
X-Google-Smtp-Source: AGHT+IHzl5TLckn1vyR1Ut/8oOHXJ6FR5MxQOdfCgKOUT/SduD1uH9D1tCQh3ggUMHfkFwoHlgDbuQ==
X-Received: by 2002:a17:907:2e01:b0:a6f:2a43:e956 with SMTP id a640c23a62f3a-a6fab7d0901mr486512566b.74.1718969012377;
        Fri, 21 Jun 2024 04:23:32 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fd0838345sm64498466b.99.2024.06.21.04.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:23:31 -0700 (PDT)
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
Subject: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
Date: Fri, 21 Jun 2024 14:22:59 +0300
Message-Id: <20240621112303.1607621-9-claudiu.beznea.uj@bp.renesas.com>
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

Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible with
the version available on Renesas RZ/V2H (R9A09G075). Most of the IP
variants that the RIIC driver is working with supports fast mode plus.
However, it happens that on the same SoC to have IP instatiations that
support fast mode plus as well as IP instantiation that doesn't support
it. For this, introduced the renesas,riic-no-fast-mode-plus property.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 91ecf17b7a81..c0964edbca69 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -25,6 +25,10 @@ properties:
               - renesas,riic-r9a07g054  # RZ/V2L
           - const: renesas,riic-rz      # RZ/A or RZ/G2L
 
+      - items:
+          - const: renesas,riic-r9a08g045   # RZ/G3S
+          - const: renesas,riic-r9a09g057
+
       - const: renesas,riic-r9a09g057   # RZ/V2H(P)
 
   reg:
@@ -66,6 +70,10 @@ properties:
   resets:
     maxItems: 1
 
+  renesas,riic-no-fast-mode-plus:
+    description: specifies if fast mode plus is not supported
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.39.2


