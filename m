Return-Path: <linux-i2c+bounces-12397-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF40EB32F81
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 13:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A363E2A0BCB
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 11:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03B02D9798;
	Sun, 24 Aug 2025 11:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfO4u1nW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A802D7DED;
	Sun, 24 Aug 2025 11:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756035278; cv=none; b=SIrX9Kho0VMvVd+y1o+4YefSqiRriXZCYjBRTzmNMtA6e5V8F72d7dO+WCUyUuIY2KEtEL45CvwbKJoT5RfrlevAwn1YRimKMMjg1Yfn9ywF1qRrVh4208Qdj13HRattcwEqBu+izKjhKxlEBfiJS86qc+i4j3zv/Zwd0sp/oKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756035278; c=relaxed/simple;
	bh=6iSaw1vxtbsqPx4P+khU61Cqtxm9jhLHfZYWON2oBlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WpLB+Ki2a5r6qgAT+Qjfp8HDw/SZb/eUXsE0n7n8PJQvlHFK8StlrfN1Q5A61rHLgnav5HW+rk7BN+S2QPMOQLJtYJxzgfQtgdQ5vyqPot8T/Ta0pTk8DGUTa41Fz8M6cgSjQfZ7c7UntA0Wgsp3R2NmoOsdxrlSYuY9HGoFZFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfO4u1nW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b577eb4dbso9082445e9.2;
        Sun, 24 Aug 2025 04:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756035274; x=1756640074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGRpPfiF+QCSSlKfaNedQV7hPKGK7aNfXLZMjnYO71Q=;
        b=FfO4u1nWdZ1VLiMe/+Dmbo2iqDn5tMpgbENnyU72LQnjr3vgE4hAsJXd2CMHZ5UdC3
         UNObHR8KzOQFT/HhelMAxgCtKcaPV71+gMRsAqe2EnTgK37YQ7FcN5kdtaKYyPkhqWBG
         tFGQ5iOYwxpMtHS/jd+dUgStoDHQg2K2aAd2j62bV4Md750bqccZLjEubwNl3VlqhMOS
         vDnGarn144L/M9zBE//Ayw0S7LBGfcD9c/RXNrCNs7gqtUIARtlkc1p1Lltp/M1JKFyn
         ov0XDe0Ermh+ZprZoxs413H3LpvGOY/VmLfJaYagkFpjud2uZnjclI7oxQhGk/cA5f3R
         wC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756035274; x=1756640074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGRpPfiF+QCSSlKfaNedQV7hPKGK7aNfXLZMjnYO71Q=;
        b=AsroRmSPB1nK8bGEw+iW05i0qjqGch0o6W8dm1BQkOvyIc+YGkzd/WaJt10AvaYk6A
         hhgH47+7pywULBikWf0Z7lbTReTcbyCVXaWQ9ZwWoRcRBzeBbX9UwG+hfT0/ZMYlcRpS
         O6AWNHc/SaNkBrdglRgq0nwNrUeA9lWEc22fFZpMiITqH9HwuANMkkpPaOoIm0SD1D6z
         iQ7mh2h6DstkpYuCzWDSlHrG1eaML61laYIfmVfg/oS+FHJpy1FmTrmrWN0ZLWblNgnq
         DD9f0BGVyw0257M5bZMgTSjQsSHRosix7BTYV32VXG9UQ++oyTq9U0nFW1nP+VfceE/p
         Xlbg==
X-Forwarded-Encrypted: i=1; AJvYcCVPbdG34aKSr1xJOBtZ7SAX/a18czdQ63d5knsA8FJGrrZZ9ffmRTLgj1Onyj8PdVpTILyDfO55+K7zGIVl@vger.kernel.org, AJvYcCXYYo+2h4kxAsq/10kphpYc0ihOkqiJtRJ+jG9F/4ENsL+H2ncmJHdewdz8++7BqmAR2aNxnWpTvEmF@vger.kernel.org
X-Gm-Message-State: AOJu0YyIk4T+6RYRFwyN68oUrx7/6QIyB3RWN5IMYo3cpy5S+22/QoFM
	nqrgrjN7r9NcciMSv6CeGM1KUnf00ldjK82U6qg8VqvV8vTT2CSpggtw
X-Gm-Gg: ASbGnct1T0xObeWcidyYPxrbcx6zVO38jDk5678pKDvJnbmrXqZ1LJLPZO9sm5vX1Ys
	RuoPaxc93ID72xqeUaFx/yXaG/GqEeMsZLgfsm/jGrL6oqsuBkhvo9UoLgu36ONWeJtzW4nqkOa
	UavmuaUEVqUOoPhJwS7xa/aTw9AS3eLWrL1Tu+aGmNfQcVTxSyvi+J7EvLmjN+EnGbzmMi7T3Rh
	BLA+k+ga7Zd6+dbtRITrWDyI24dNKRMh/OkBT/QWA9ajpGTXGDpiF0EyLMO2486SN1WlbknjHrZ
	ZBEJazaFloGifLa9O3jXFfNV7OVgDEJErbpAPjFYS7AzBmWgCgrQlfx213LGCrXAbSOxW+CRFXK
	WVD4kfS/ZJtTxRYaoJDOWMpbqw2yTkti0YzpgkBhyv3sqZO6Ylddk2ck=
X-Google-Smtp-Source: AGHT+IHz8R5/qXaWr52x6eKVSUtfT+nYVdlDxRNLQUuUUK14n/OlU1Y2kEalBBPtgAQS2Yp+L4Dm9Q==
X-Received: by 2002:a05:600c:19cb:b0:458:6733:fb5c with SMTP id 5b1f17b1804b1-45b517d2751mr71413665e9.28.1756035273881;
        Sun, 24 Aug 2025 04:34:33 -0700 (PDT)
Received: from builder.. (197-10-142-46.pool.kielnet.net. [46.142.10.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5757453fsm66470895e9.14.2025.08.24.04.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 04:34:33 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v6 05/12] dt-bindings: i2c: realtek,rtl9301-i2c: fix wording and typos
Date: Sun, 24 Aug 2025 11:33:41 +0000
Message-ID: <20250824113348.263475-6-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250824113348.263475-1-jelonek.jonas@gmail.com>
References: <20250824113348.263475-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix wording of binding description to use plural because there is not
only a single RTL9300 SoC. RTL9300 describes a whole family of Realtek
SoCs.

Add missing word 'of' in description of reg property.

Change 'SDA pin' to 'SDA line number' because the property must contain
the SDA (channel) number ranging from 0-7 instead of a real pin number.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
index 69ac5db8b914..274e2ab8b612 100644
--- a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Chris Packham <chris.packham@alliedtelesis.co.nz>
 
 description:
-  The RTL9300 SoC has two I2C controllers. Each of these has an SCL line (which
+  RTL9300 SoCs have two I2C controllers. Each of these has an SCL line (which
   if not-used for SCL can be a GPIO). There are 8 common SDA lines that can be
   assigned to either I2C controller.
 
@@ -27,7 +27,7 @@ properties:
 
   reg:
     items:
-      - description: Register offset and size this I2C controller.
+      - description: Register offset and size of this I2C controller.
 
   "#address-cells":
     const: 1
@@ -42,7 +42,7 @@ patternProperties:
 
     properties:
       reg:
-        description: The SDA pin associated with the I2C bus.
+        description: The SDA line number associated with the I2C bus.
         maxItems: 1
 
     required:
-- 
2.48.1


