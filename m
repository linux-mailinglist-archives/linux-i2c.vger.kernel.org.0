Return-Path: <linux-i2c+bounces-12184-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45534B1F6FF
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 00:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB93717E9F9
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 22:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6792BE7B2;
	Sat,  9 Aug 2025 22:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPczDFut"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FD227CB21;
	Sat,  9 Aug 2025 22:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754777248; cv=none; b=iD+M4AnV+bpa3goJ5jZfbW3b1D3HA6BgNs6JNX+MxPEbItQPdU/mmisSQxSRepa2i001p6EgAO0FAxeHahia7VU9BmUYK5hinWLsXQtqPuQH8XLO3Iq1L9N7kjzkwRkQS5J4+Qi6l3Hquce2v5CkCiatsNX9FYL/UxySwMX3LBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754777248; c=relaxed/simple;
	bh=uLUiJYGCViLoh6//R4f4TzVbMp2m+qbFrXAXPYgwb1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kQG8PAk6L7GBMqH0LkobsU8no2A/9EKVLJkAg9KVwKxP6EgAbKdBEwdTp7cRgQHBZRZmFVH41/56mA0cbcCsnp/cPwUnWKYxdNbrE9Eel05e6/njVzFz4kou+Bcd8ZYJBBHk7HH+HTyrzXSP8xhbmXP9jVb94wpB87xvU821sYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPczDFut; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-455b00339c8so20361055e9.3;
        Sat, 09 Aug 2025 15:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754777245; x=1755382045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kzn2VavwCg/R9fAXnI4sg3rxMYADhaGdUBsVN/E+9Y=;
        b=fPczDFutJ9eME/X9gpYRQbYuG5onOWMG6BLN2dpoDuLoUoxAay0UAiYZBPR13Cdh8w
         LVUePTB6Xb679sxxKyXX6zpROza/rALVYEWL7QsZqaTPNxukQTRgFK3Xs5IYGiDf9Nx3
         2/f7S4ayhgXz4DdqmIEE7rqn9MRgYmPp8Ct0fAr03JF8PXV1uaGjUk/1yS9dNfuekcnm
         cNgexm+5Lrp9POcgOzM1lSIW9Lp6Bb4K9Qh4MMFxcJ1j92AM2bBi9QMbSpf1v6JsuPRQ
         9DM6Hf7xb/AQPqhMJyr3gAtfqDYgWUtgrSJP3nBZUKJjUlDdDSZmJ0/+fmb8xJsbfle8
         BmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754777245; x=1755382045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kzn2VavwCg/R9fAXnI4sg3rxMYADhaGdUBsVN/E+9Y=;
        b=a3x843LPYP73hCmj1DdPVFh8gimqeGdyIabVA5xhcKWfA1EmstuOEaVj4WySlW4Zo4
         tGj7vAAwFJQI5ZheQ1vpdWMoLMrphNSQ9esW1ZtXD3epHUMydTCzBBPhfjvKTv/3as5t
         2Ojk9jSfA4Asqmbuxy6gAii+62Hl2HviIdy5nYjMc4wu3ZZHhy9uqK87GPFhUS+Cxn4f
         SLuIJTN8dadaBxB829ZTj227MH3ekmSmny8lvTHG4x8spl1uJ7JAWiUIBiH2u02NlL5D
         2ywaIApwHJd9f9onZMyQXUdhGLkzpjRraeCwW22tyzYogs15811vaK/JvNs5SYJJ/n2/
         k2Ag==
X-Forwarded-Encrypted: i=1; AJvYcCULcj1KlqKU2pwW3cm61xfqgyAeZ+e7VxuXB7JxrK4y8LHO7F+IRwcSK6qw45GJ9QHNecfhZTIn28RSkSJT@vger.kernel.org, AJvYcCVhsjwLkPNXFUdH3d7tU/VTdUDGByi0ICw+p74UPq2AJeQwTlpU8dz1wyrxv5nxHt8Otn/vzvyDB44N@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp/1DSiB8vOtijeWm4B3NCATEuQjMXvRwAmB52qd962bNlBttw
	b9qXBOnTzQL9K+iijCfupW0qJN+yODBHtWNehVpxlBcwaiVtvCrFW/Ys
X-Gm-Gg: ASbGncu68R9aGrU//V3P3S3oMfAP+vGMFNVdLeh79AQ/RFmT/k7e66eQuOch+1v7l38
	xTEEZGoc5s8kPEfaUrlT/+NoBVOrbDMtNAyYdx96ommrldtR41VzSvxvZ69Z8aIHSqKS2+s5s2C
	8x2TdmyJZe668kqs7l4ZZhYFagcsdHUqHDY1YXfKAtF0GmUaE6plO8upNP1N+Pz5UDtRQ2q5C/h
	irDnodfJRA1Sr5Y+EOhBTbCGKiXBVElhMtW8ERAbks+/p23DdJf9IM28DVXeyVcYoDddj+g8tWd
	OlLs6z9P2SFEabjgISwzZ7AJHFuD2vMxhc+GJyvGgTxC0my4Ziedt25bod4KZKp6yPx8GYMlKf+
	/dZT3TO3q7H24Ldja0w4c3JSJyezO6/cXsRGOLBdNEchzh8w/E06thFBax34Y0V8=
X-Google-Smtp-Source: AGHT+IHhcfI3iNDsGpX67LklxpeP/qm+WDA9k5f41fpIHbHgozCOE5PcOSmdq+6T6i5ilyP4QqtUjQ==
X-Received: by 2002:a05:600c:4f94:b0:459:d494:faf9 with SMTP id 5b1f17b1804b1-459f4f3e51dmr78193425e9.10.1754777244691;
        Sat, 09 Aug 2025 15:07:24 -0700 (PDT)
Received: from builder.. (188-9-142-46.pool.kielnet.net. [46.142.9.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459c58ed0ecsm145592185e9.4.2025.08.09.15.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 15:07:24 -0700 (PDT)
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
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v5 03/11] dt-bindings: i2c: realtek,rtl9301-i2c: fix wording and typos
Date: Sat,  9 Aug 2025 22:07:04 +0000
Message-ID: <20250809220713.1038947-4-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
References: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
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


