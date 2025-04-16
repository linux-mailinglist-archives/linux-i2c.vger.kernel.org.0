Return-Path: <linux-i2c+bounces-10406-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E876DA8B382
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 10:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82304444EDB
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E43236A7A;
	Wed, 16 Apr 2025 08:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kgpq9zmM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A3A236A7C;
	Wed, 16 Apr 2025 08:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791741; cv=none; b=CTYWXVQ30JIvWReYBUobRM+O3S6OB6A43a1NZ6+gda36MHmkD0TkhH4np2MbrJAw66w1jhFO83mNVlLJpP208a706b/MJaSHmboj855cDw4P1u4qF5vIJRstTHvXQeNzm2PQ6RVGs6CJwmt/Y1/LknDZD6tSvuTztu1jWHGoLdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791741; c=relaxed/simple;
	bh=rQgBMOj5Ew34+i8Xh45VB7HVlc0vQ+Js8dV6FOcVoJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e6+Kfu8aRPn/zfWl7U7zhiObYUyOmC29wnqCGA4bZw2qsX4c4MZYBEztaadqJW4DrickH9zXHR/fSNLFrG5z3Dx6zTczYhZbmrHzE3/MUqHgQWByQXWeFDhNvaVr0BuBy8mGAhu0Rdk1uhUHSux8Hpfr2+jrdEsE2+ZGHMQ5ajQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kgpq9zmM; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30eef9ce7feso65317631fa.0;
        Wed, 16 Apr 2025 01:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791737; x=1745396537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTk8dSc3+rRa4E8pHZeAjgILOJTnN61ZfwytEWQJJy0=;
        b=Kgpq9zmMvRLUexpOU6NUGe8qgqmBojJjvd5Qj/pzQaiLIGyecppt4JTVV3rShmeEpT
         QCw8NaIUWdC7XCLaUo901LaRyOQvgXwFqDfWGX9GshZndzNR5omELlNMYc+r7MsVy8N/
         3ZFY3CtM2aUut6yKQ2unL/CyT3iEoGmTrfkS5gxuDleOhu3GxUld/wxgyeKlg0I0G9Ag
         1oHfymMQLcLgGGEdZasgPEJLxcNtT4PQD2fON9CBwHfJLOTFxiV8jusV69sB/GB0AgRB
         84d8qt+x9kfEg1MudiJK4GfiFZEbnpNrkzQYXG8heLqiVCxZZSL7joatoXpM/mBx9lxs
         hfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791737; x=1745396537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTk8dSc3+rRa4E8pHZeAjgILOJTnN61ZfwytEWQJJy0=;
        b=R0N7dk8+LUJl80ia+6C1VdxZHIFniPwTKUn8uxlH5/IlFjQKN2rEOTEYgadbeR9C4+
         wc5lZEq08xyK0PaEMK4ZfSQifNRjfEgsMaXX8m0tt2d5vEF1uXADbA4/D93wCAfZEx4h
         11QRC2smCjdjRG4zu2EsmZ0c+SxJaCzC5882PuFR+MdkagAIgQemOk8SjBLqyS/zirwD
         7vtTm4lpoFcoQxSThhKtTfFLUgJWIwb8pQL0n/cwpFFuPc68Sa9D/azCFR5Vxh9GPRF1
         qbwXvpizp+1/lNhy368ocr1cArCXwFccxiHglPDjCG/Lt/x6rnX7Xjwr3fCgbkj67Z3l
         Wcqw==
X-Forwarded-Encrypted: i=1; AJvYcCU/rm8L40elyhOMoLvJaw0w9zAHQUbJj64YC/1+Ey4uJF8zrvvzOrIjXReO2EPt9KC7ToJaBy0u1WmT@vger.kernel.org, AJvYcCU7uyufFO4DRtoHYB84IE9jjY1ducXUxbEnWohVHGWAyHbm1vZaZnsm/Vy55QaMtcO4QNTmGJRfDmj+@vger.kernel.org, AJvYcCUetu16T/lQqLKe5ZGZsKRk5Fx9pN6QvzVyfIu0sUWUxmKwOBBPGNSbE+I/lAyPg8yJSFNZTLyTsXQ17ZPf@vger.kernel.org, AJvYcCViMHKTeCBlZ39KUlMAUmzthsPYGQ1l1BrIQu5LqSpnWxtGYF8ioznIVRw8cWGYjnTv+KhV7Fh0@vger.kernel.org, AJvYcCVmJsCDzzJ6PR3/YG9NDGb5qnzcfnuKmrkBpXlQGqhketGZ9ReZXDeqy0ZjIB75gN9sfjE51SbpOizy@vger.kernel.org, AJvYcCXOXDbOFXkqmdYsHVBqVsQVwTXC9SP04IkJX6wONlWulMK0y4RAIPXe5NrZRfZ3/hC0mj15HLDHGCLY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbss7A4EbVzSYfTopxfaSzfyfobVdgi8gpZxNtSAA4nDyBAmCF
	SdK8me7hIDNNd1XwYruXpvFDyvvcW9pR7EeHyIPWpBbk73Yj7Dqd
X-Gm-Gg: ASbGncsxFeHIuRNC8a4DpsGrdn2clprRquGQGYY4LAwlgfMn8s5+R0/uh3rcDFOs2ET
	zsVLcmAcoYHwWTDQSj0B8+jhtzWy/Huai3rpP7MwO1dvl8Xh0YDGlN6SClhU1YvcBPkH5IFAm8O
	W2lMw7VQRHfhFsAdjb8OCvODZzkX8HEdwpUaPjZzSQr79FtwnzCoMYrBZMu6LZhGJPgSJqF4df/
	1PZmiFqlM8M6NvmM6u0Bqav315Qwk6oivrH5JMZGDFD6IIGrgJoxFccsqEkFrvmnsOjyL2Vt6B6
	cjqwxysd4dNO9Ert77g5a9Mnj1gy8369v9TBmO0WtQAC+OgG5Qo2
X-Google-Smtp-Source: AGHT+IENb6XUcPxgjKLkbP0qmMhjj4SlaApewj8OHzgfqDb3t6JpoTvdMHoBjymD6/Dx/su/LKlmPQ==
X-Received: by 2002:a05:651c:158d:b0:30b:f924:3554 with SMTP id 38308e7fff4ca-3107f6ceb59mr3523531fa.21.1744791736738;
        Wed, 16 Apr 2025 01:22:16 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:16 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:31 +0400
Subject: [PATCH 06/13] dt-bindings: timer: via,vt8500-timer: Convert to
 YAML
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-6-f9af689cdfc2@gmail.com>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
In-Reply-To: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=2962;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=rQgBMOj5Ew34+i8Xh45VB7HVlc0vQ+Js8dV6FOcVoJc=;
 b=cyrY8bMMM4FzShamz8Jror+JqU2ISzf6zzaPROlnVffmoBLzeE/nIs/54j2YnWjYCMyICGaYB
 JTE1vN/oiyZBT4fRur+pa8iTMnrcMs6Mp6t4Y9oNmKFM2Z3LQb5CkuF
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Rewrite the textual description for the VIA/WonderMedia timer
as YAML schema.

The IP can generate up to four interrupts from four respective match
registers, so reflect that in the schema.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 ---------
 .../bindings/timer/via,vt8500-timer.yaml           | 36 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt b/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt
deleted file mode 100644
index 901c73f0d8ef05fb54d517b807d04f80eef2e736..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-VIA/Wondermedia VT8500 Timer
------------------------------------------------------
-
-Required properties:
-- compatible : "via,vt8500-timer"
-- reg : Should contain 1 register ranges(address and length)
-- interrupts : interrupt for the timer
-
-Example:
-
-	timer@d8130100 {
-		compatible = "via,vt8500-timer";
-		reg = <0xd8130100 0x28>;
-		interrupts = <36>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml b/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7d9dc93b708823de9594d20ef6b7e0367c5a36f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/via,vt8500-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/Wondermedia VT8500 Timer
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+properties:
+  compatible:
+    const: via,vt8500-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@d8130100 {
+        compatible = "via,vt8500-timer";
+        reg = <0xd8130100 0x28>;
+        interrupts = <36>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d131004add981446b08b1b3d572a3daa8377fd61..46339ed45ad18ab2b9470c749f604d9aaf72015b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3432,6 +3432,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 F:	Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
 F:	Documentation/devicetree/bindings/net/via,vt8500-rhine.yaml
 F:	Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
+F:	Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

-- 
2.49.0


