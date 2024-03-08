Return-Path: <linux-i2c+bounces-2293-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D618769DD
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 18:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A320F1C21101
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 17:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3047457885;
	Fri,  8 Mar 2024 17:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oyny9bHm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AAB54792;
	Fri,  8 Mar 2024 17:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709918896; cv=none; b=BpTRD0alF1ahCnREbdMW7crJhbJtF1+Je6KmMG5x6wDrzdq8a4xCT2gJjFHyxDOPiVN+ITnF9afMO8vpqmN2jo+/eUx9HLMu5OPiCDDU2Rv234LiNzgnWzMTLqRT3G0L3deKRNViL5R04cNh2A9CVpKXuHaI3iGP/ZUQDFXvpiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709918896; c=relaxed/simple;
	bh=xSi4yRdhzZG+j4Jyhvt+RdbV1T6CUerO+DzKvX05jAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gQpoqKwPe1P3GVpB0zBX2YldGpT+d6OaZDbH50r+yyKr/+OaYcUN3J4UsZyPLD/rN3afNo8f1VJouhYJCBNvbrdHRfO15c8nfk3HCsatn4VY9JZq1zxosy4mvcKFQxlPkwK3N+rluZsZ4LhXaG23cWeVvznbB+q/435uZaDDJRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oyny9bHm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-412ee276dc9so7883985e9.1;
        Fri, 08 Mar 2024 09:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709918893; x=1710523693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWwOmRTSg2gxti2ppNCLdSJCkn4Agg5qb+fjrt7Ni0c=;
        b=Oyny9bHmSfcL8QXmUQJotHX65QwP1VBMMfBprVAt6PJBSTCqwRXreIsVPDp5drrEqY
         jIh6FJeAWbYAVSGYdRQ+8wlYiv1gS+7IngFS9K1pyhQotmBidlAJ5Gdcu0RNV4jHm821
         Y2jdtT3GgTf3J5DLStS8vP5ythVtp1L6nHut6Du8mi/+5vhUmyV2tbsM3PL3RKyISXzZ
         WcmQ3q/QG15Utfhu6rs7K0PxWxyA7oNOE64WxGP6xdC3sRZbQZRNmA1tirLhaZDvTDHU
         nE3rMdqX4A8to7qTX+XrUG2ghadYeyqGSaE2Hl90jHhhA1JXnsScjV/voviD8q4Gt2N5
         HPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709918893; x=1710523693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWwOmRTSg2gxti2ppNCLdSJCkn4Agg5qb+fjrt7Ni0c=;
        b=RMH7eYoYXBm3wm820HjgfkOWhZ+ZPw+YanfzORhFRm/LeNx22UOEt8v/zWzVZOwBzp
         rtOpkBVBMLX8YOTftmXhfUGSMHdWC3s7A0RPWJz1Ioijf+D7uc/tafRhMwxDPOqHc8md
         RxqNiNSnOlAiAfqD9axLKTp6COJnvxFElybuOZF4EONer3kIyzFtboHbeqq9nzRqFDp7
         5G/iUGNUz0K2Vwfq/5f38lmV54MLzT9sTkRY56bnq0Q/FPzLKdYXXYgaBQ70m7f+sZfY
         nwVHBCf8NONwEWAXPQFvvDw8Tdg/Ne0oN5yxiEtTwQfxa4/zEGAdEc4MEcrb/7+2sRUD
         E6Ag==
X-Forwarded-Encrypted: i=1; AJvYcCU5aWU52JxYNRcfSR4nipOI7DFiKAdCwwBZAeEk39QvvGp9NzD+xEuxOrCWtop3w/tKFlHDomOLwFPs4mAxUt798s2mB8PTobL4MWTUWJ8wfXLSDJNIMmo0ALFd26zSohj3JQPYimi6VDgiFsRCIO3i2uswiU8vLEnpcSA0bs8pNvhbag==
X-Gm-Message-State: AOJu0Yzen40dK07Wkmur9km8qIX4Pe619AMS3edf68+4o5A8uDNWyQ6o
	oq6uZuNYeF4SKJHRBeHlEUdBgyY5bO+HYwM82m/g3suwIpPHTrbX
X-Google-Smtp-Source: AGHT+IHI8/qbHKCqz66RwWR9MqlbbVAzHtjtfiFY+x4cnGUA114FUitp2k639eLrpKnRZdgh9o8znQ==
X-Received: by 2002:a05:600c:3c86:b0:412:8d98:78a with SMTP id bg6-20020a05600c3c8600b004128d98078amr17449379wmb.13.1709918892467;
        Fri, 08 Mar 2024 09:28:12 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:3c2e:cd45:f50f:f083])
        by smtp.gmail.com with ESMTPSA id jh3-20020a05600ca08300b0041304100fa9sm6445317wmb.45.2024.03.08.09.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 09:28:11 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/5] dt-bindings: i2c: renesas,riic: Document R9A09G057 support
Date: Fri,  8 Mar 2024 17:27:23 +0000
Message-Id: <20240308172726.225357-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the I2C Bus Interface (RIIC) available in the
Renesas RZ/V2H (R9A09G057) SoC.

The RIIC interface in the Renesas RZ/V2H differs from RZ/A in a
couple of ways:
- Register offsets for the RZ/V2H SoC differ from those of the RZ/A SoC.
- RZ/V2H register access is 8-bit, whereas RZ/A supports 8/16/32-bit.
- RZ/V2H has some bit differences in the slave address register.

To accommodate these differences in the existing driver, a new compatible
string "renesas,riic-r9a09g057" is added.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 .../devicetree/bindings/i2c/renesas,riic.yaml | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 63ac5fe3208d..2a7125688647 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -15,14 +15,19 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,riic-r7s72100   # RZ/A1H
-          - renesas,riic-r7s9210    # RZ/A2M
-          - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
-          - renesas,riic-r9a07g044  # RZ/G2{L,LC}
-          - renesas,riic-r9a07g054  # RZ/V2L
-      - const: renesas,riic-rz      # generic RIIC compatible
+    oneOf:
+      - items:
+          - enum:
+              - renesas,riic-r7s72100   # RZ/A1H
+              - renesas,riic-r7s9210    # RZ/A2M
+              - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
+              - renesas,riic-r9a07g044  # RZ/G2{L,LC}
+              - renesas,riic-r9a07g054  # RZ/V2L
+          - const: renesas,riic-rz      # generic RIIC compatible
+
+      - items:
+          - enum:
+              - renesas,riic-r9a09g057  # RZ/V2H(P)
 
   reg:
     maxItems: 1
-- 
2.34.1


