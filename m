Return-Path: <linux-i2c+bounces-12525-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C711CB3D1E4
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 12:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 163C016850C
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 10:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328DD2586FE;
	Sun, 31 Aug 2025 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCsE25b4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3F12561C2;
	Sun, 31 Aug 2025 10:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756634726; cv=none; b=Cx88XyJjD+gpIo/q2XBYzOXRa9AlT2aLcrQgZZaB+KYRTpu3/zgVAeGfxQCKVugqLdXfFaNg2hjmTTs3MFC4sVHQtRE3tpS0PylvB7Atac0RCblTuhBdHjbKjCzIz6TvLNYyoM9fSQtfah5tMAak9tkVpwqNxNjH2bZjGPubKI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756634726; c=relaxed/simple;
	bh=Ll33ycNIWhblme6tiFpLduL39Kk1FOG/s0GEQJ/3Kkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YWM4TF2rOzufycoYZh26sexele0MqwOuo6g4ZWRInaJg1OPoHVlW71tDIsY+MzT/wfSZLjNWRzLNkXjg59vXo1xzkgdatxP5NvhV/0j7rPlWAHGMRE5yxsZg7WpIzLTM1Vy/b/s2OEEn76oy55DF+zGwYjrv4Bd81xDl787Cbhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCsE25b4; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso2706386f8f.3;
        Sun, 31 Aug 2025 03:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756634723; x=1757239523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MY8qwrmK4KpRQmuFNf2j7FLHohlWWrtwD6aQcm5+d3A=;
        b=WCsE25b44X07anbLSuIlRj+4yOUtX0Y/DUGBw0O3kml+4j2vwjxzadJE93nzVE6O9C
         JLrf3ksrA32E6P5pO+qZrxTBgYTRdFi0zpowG3c/nCwZfjBuU20BjiYwnxoV10Aulr3N
         tTJVAeZN0jHkaf60vlHo6MNLhg9iwBMpwSNtEB+vNTjt/XNjZXIIw0+O+k03OujdgqGJ
         V6Lh5XPCLEKygX39fcCH1QyFMbNlAYuGVES/mq6+UG2KfAKtIjsvCbigipx1qUh5AK2B
         cEIoW2Mb415aEcfb2HCzLvC2N00JnW97UI0BIcCkpZ9yvtdB4/90wTmfy+7Rl4RAx2Xx
         pVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756634723; x=1757239523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MY8qwrmK4KpRQmuFNf2j7FLHohlWWrtwD6aQcm5+d3A=;
        b=uN1ltnTp6G9Vfurs0QvTnzGIKf6eCHvn5/SJGZfWGWXuMDRp7BW4I6bygRjkEd6NBn
         56t0HVO4Ve8BJQ2BpbqNSErTJFHpmrnz7NDgBWLlJmHywM6AymN7qrWqsH5qil4T7LfK
         5fRhnuznmDO0kr169Dm9/OfyJeqnxns6S4d734umFhNCbeQcCpv+FN3V55UXjeBHmxST
         tw2Dn88NhwFkdrhVWs+NgKBuBjmacqSrrT1V0rLhq/yi5mbBXtWgJbDXDco6hQSaVqPq
         khk8I8nDYSuOzpBHgAFPA2dtZptZG+KFpbtUBS0LU0tY2o5CaTqDn+JZJbRNhVlVjFhv
         aZXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJDCLv6f0UpiKwIrZM8SnU4TLUJZ7AWw+IUcn1DoMYrdrxTTJaaVLn1WvQEb+0kwx0apDyB0FXTUgPKhCt@vger.kernel.org, AJvYcCW/FWlaVjHuplxSa1wFZG7sDoQKTceueV3GQPm9r87IAgFcmvtkGvfgWmRKEgWgXFinGxE1ydQIyLEP@vger.kernel.org
X-Gm-Message-State: AOJu0YwDS9EitwThx3SzeJtyuFwTvMShwWIgjA7GXQVPMsOg1QFGyRti
	iLpR63rhEq3EtDJwcBXpeLf+/l7qxgLd0k79NmD7D4eMTxu7wXZ6wqIf
X-Gm-Gg: ASbGncud3Ftp5O2V49q3qq7FwOk6ngoF8yN9rzgrGCSNPB5E+JUkehKrPF9Gf73Gt24
	VoSbXsGGyj2q1J/F65EBr+8X+c269RjX1aTwJXjwdheNW7N+bRjhOWC9rm1UmvxVv+lwlRnUuxC
	lf13Z8vRRylOpG3QJJ0RGzfXgKcq9gjGgyYl/yD0oUnz1clnCNgbmEEZ6VPlHK9Zqtyw9NOxkPv
	Oyakw/fEc31soyerBcmqNTzgBBQJsyQt3lj97524JuJ3ZgRCUwTH2UmuxowZC8J5L+qstvvIbM1
	lAQR5abuzOOZbRFeEFLnj5dcepKUkxh2izUIdwhZk/Zssabdjxko9kqRSnYGo0cQArYWTzg9f/8
	aVN6W4+MeI2m3eUFKjr1Ow6XZeTupMb3DYhT8jmykG086eWidVUjr
X-Google-Smtp-Source: AGHT+IGEWQq3T5l6eBDGheMEMEaj3FJPHu2nebRC/A1DyvDw8+kzBaqjsmDTU47+NiY5GXyLVg8XQg==
X-Received: by 2002:adf:a350:0:b0:3d2:52e3:920c with SMTP id ffacd0b85a97d-3d252e39ae7mr1893886f8f.44.1756634723405;
        Sun, 31 Aug 2025 03:05:23 -0700 (PDT)
Received: from builder.. (39-10-142-46.pool.kielnet.net. [46.142.10.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e68c83asm117505565e9.20.2025.08.31.03.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:05:22 -0700 (PDT)
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
Subject: [PATCH v7 05/12] dt-bindings: i2c: realtek,rtl9301-i2c: fix wording and typos
Date: Sun, 31 Aug 2025 10:04:50 +0000
Message-ID: <20250831100457.3114-6-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250831100457.3114-1-jelonek.jonas@gmail.com>
References: <20250831100457.3114-1-jelonek.jonas@gmail.com>
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
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz> # On RTL9302C based board
Tested-by: Markus Stockhausen <markus.stockhausen@gmx.de>
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


