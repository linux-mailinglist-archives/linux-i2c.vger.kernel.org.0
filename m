Return-Path: <linux-i2c+bounces-4339-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE582916749
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 14:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CF7D1C242B2
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 12:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E10F16B751;
	Tue, 25 Jun 2024 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="h/gHlTGI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7088516A955
	for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 12:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719317678; cv=none; b=IgLoed+dv5BJtuWJvTI60aT2LrL/9rE5e7n2qLqiHckmc1Vuxi5k0QqTckJwUncKj/b+4VPd0fsyqSLtouYPZDES2awPKPqX9meJiKyfXwhg/HcgdwYSRNnY5C6dSH2C5z40yhL3dZQ6kdXWX6AMDZnu4wNGu/q8f+keojBbr4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719317678; c=relaxed/simple;
	bh=G+BtkmivEpWKO42JZ/b2nYWC06K1BWJ8enlG6hWRiGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V9H0pX7PkxPCaI1PLvDtgdNXATVgAwLVXoFCKXK3H4MffXPwqq/V2i6YdZiwM6FfkKycGeyAxVOCAIvbKxdlcl5lCDhE0hlonH9JhUCfJqgaRbR4343umgePtsuPInAA3K8dcm/RvpJmKnFJTYzQE2VJLdt1ogJSoz0eKEA+oY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=h/gHlTGI; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-354b722fe81so3634368f8f.3
        for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 05:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719317675; x=1719922475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmpNHRRU2OSWCKd+hVEeWAEb1vupeZqAg8vsnXJHwhU=;
        b=h/gHlTGIDkFVEDFq1QHC6bePIxIIx2MqnlMCnhGfqXVYAJxJHaZY1ipDS4Xt/b5tAB
         tdA87XfdbEaUwquSKwsn6B9kKR/wuiNOLDJlcVue+jsJFYd01tKBev5ly+R6u9/5wLll
         aHH06pO5E6NIKeGN6V4YVStV8PObjoY+Hqgcc4EHGcg+Wmz91ec0069F/bxzcm4vzueN
         sc7v8FIgg7OZ0BTJw1Kxh11adZVuhM4nUUWXV7E6ZYi8E2DS7xcKFak8tH6K3ETDTAcv
         hbsPa8664U3Qz3kMy4WgfTv0MQsBFJJh7N0euKqrj+buN3N7aziFf4PjhlKkweYUYnfy
         u7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719317675; x=1719922475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmpNHRRU2OSWCKd+hVEeWAEb1vupeZqAg8vsnXJHwhU=;
        b=baJWB9fouaXHzzci15YZzhYqWtwHlZHgTCBvfPwxLrTpzaTHTK8HFstGEW+tCOD/ZW
         ABO2wDY9CmV7tuEU6g4znMUyall7i+wEiRgban8ZUUMymPKokd306gXeAKbCHI+lfTAo
         kMw6vJ+d7Q2pnJ/S0nO+i/hCKC2HWgWrILNCgUPz9GNr25ccC+qmCVmW+An8BcEmwdGg
         w+/lDehS4BmoMqHRtcEqSjvy0onGFzjUG7weapV3Vd43mU1tzoQtkXeWCblo/pL/TdDF
         plm0rOi8HOb9buCg1FUY1JK4JTmrufRD+mAoYTtqkjGF3wDaK27l/deS4AJ6DFWrpTNU
         gOzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL9oxHKMu9wHmWPC9WVo/YYxiTGVgo56ZRLqrIzz2CTSs5KOE7GoeiNpGoq/jBlsT5FAWOxyvtmEEgilUTyw65q5EIjfGxrlSm
X-Gm-Message-State: AOJu0YwTImV99yGCgNDEg5Ly9SCAhJbABRYd2u7XfV8nGcn/ag/3V5f4
	60RDKurp6UzQ8kpWlqUeNrw1HmwUEirW/v6bDrAulO7BWGZBAp9UPydwiOT67AI=
X-Google-Smtp-Source: AGHT+IGAVzLeqxpQgHotNBmPQhFcmvugsk6GvG5kW90f7EiAkNWBop3X/RiZQeIe6Ry3+t47rKzRVg==
X-Received: by 2002:a5d:6483:0:b0:366:ea17:94de with SMTP id ffacd0b85a97d-366ea17953amr6038644f8f.5.1719317674869;
        Tue, 25 Jun 2024 05:14:34 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8b32sm12798437f8f.92.2024.06.25.05.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:14:34 -0700 (PDT)
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
Subject: [PATCH v2 08/12] dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
Date: Tue, 25 Jun 2024 15:13:54 +0300
Message-Id: <20240625121358.590547-9-claudiu.beznea.uj@bp.renesas.com>
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

Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible with
the version available on Renesas RZ/V2H (R9A09G075).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- dropped the renesas,riic-no-fast-mode-plus
- updated commit description

 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 91ecf17b7a81..dde37a209b6e 100644
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
-- 
2.39.2


