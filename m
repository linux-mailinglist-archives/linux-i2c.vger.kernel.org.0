Return-Path: <linux-i2c+bounces-10724-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BA2AA64C6
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 22:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EF3C4C317B
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 20:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D32521C19C;
	Thu,  1 May 2025 20:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvDLjiT5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58097B674;
	Thu,  1 May 2025 20:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746131606; cv=none; b=rditBOViW3CXIopBRsgZ99uXP08+EFMRqU9iRkdB6ofFzudXlU1mfzKHW8BYBEFUy+krHpoYyNVYi5eqH5JCTCJMemOjVsX2o4ifm9xiwhsZoBk91DgIHP40L+7A0MjpZwZDjU8cHmiXX0GnDttiEUZUhW3O+KtO80sDhaKrs2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746131606; c=relaxed/simple;
	bh=/2t7LuQIYbD3dpPBTrSOGwU7/eeSHO10yiPCPagvWTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kluSOdaonqK/ngMLlSs/sVg/h30TU1UZoLEpTTVfhQqAimkzQxttzDIIFQzQieHTvlVinZ/g1WQPfqCDoTKX+XfwUD/qygYgJbs2rffTzdpxcqsNxLUhUnQ2s6h/u+a4mtyvqR8dPiABOivgmS1GLSktIPbXHv7owMsIMxT0rgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvDLjiT5; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so1202252f8f.1;
        Thu, 01 May 2025 13:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746131602; x=1746736402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JXedPWzR0RWF5bLPFtldD29i8ddEmiaxTMB0XkP+rbc=;
        b=DvDLjiT51YEgd/of7xGQUCqAJBJNKmtfy0s8M8WzGtaZUSSQ/ABVXyzaN6GQbdScbf
         h3oNdZvzUiJoc3DfF4CW3zE/ME/EdSxpqu6pc/LRLsPuGc6Xb8TP84w9JiXqSuDH4ojY
         DYFB8/x4zeSDJEWno+WuiZrGQ8wKDN3e9npKewkyAp7TwXfgM7HeaeLgLnAhsI7OqcuH
         rM7J9RCXz+rLaLWhBTUEsKB1RLIYSRrmDI1YaOIckc2h6l7QO4jMyU93mIGuCUs3e38P
         RH5N1/wWZxL+e+BQ5gWs2Cprn6/Y3gjo5JUGr2zyHoEe9SxkAlfxHC/jXzLy557sTmI/
         C5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746131602; x=1746736402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXedPWzR0RWF5bLPFtldD29i8ddEmiaxTMB0XkP+rbc=;
        b=ufSDdcTE9iosl2C4rp+MwFoECQSz5sZY/r+opcqQfHbJDVYGTsGuYVXindY81yRzor
         3VZHVYChWw2TOnpjlx+bkSNCIuFeeGrNUnbZUl82f8XIMMhS4PU6X2WFg/QBRbVtAMUs
         mR/NRjJPvjaUP9miIxhtBZs3FZx+XqzQbvXRlEXW2LdVAeD8T6+5jlKRx3v5eQJbHcJi
         0rSN3w1cHT1PrHEyR9FBIPpabU0XyFJ1ru0tHrRUlGWgtQxfguBXcAQf7Q88qbZXVLOi
         5C0M3nkrudd9203DRdcU9lXAnfWOQ3NfSL6utx4GRI4xmpGQILExr7Rv1me9KsYL4cI2
         nNMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV25PbbpuEcbvOR/VatmXgnU2q9cZKtaSy6zXfWcYPm0AJWbGt2AxOnsxz1nsDQvNjxILCUzMxMNJentTue@vger.kernel.org, AJvYcCX14ICLktqxxtimguAt5eYRJH1pilHaD6uVpHgylyB399+vSZPoyVEeyYBDrLrdWkFKf+1xceM+fy4D@vger.kernel.org, AJvYcCXcZkByzx5FTd26gDm7RWRqy2moi5O0uajBy9a51ps1oPa5j66rxCuUMsClZ3CjKUvwtODMSKX+YMCH@vger.kernel.org
X-Gm-Message-State: AOJu0YyS2xkmfnOTSLC3qGI3DJOboi2xg8NNMmDF+uBEPeu6epSKDj2v
	juRxZl59b3NU0EwCRPQxX2Dte00TZ91+OqCVLzTSmfoD3SIhsdmb
X-Gm-Gg: ASbGncs3Kv/jTPvWp68KPDqJNAsj8n4IbCVRo5NensnePnSYnZgEooZvQa/K8RZvstW
	USCebZd1p6wj2TKG5o7YguinI7k4tlMkIdzkn4waUrTdVLKswQ533unB4MHKheUO0YPdAgp9tBt
	TJWlFgM3OiEiOrfyvOEpNH8D8rTilEbZOhP8w3XJjXXQnb1keBLT8JDlggV+lJamn9V/6zsk2I/
	sWPFZhBXqeDxpyRu0e3GJe1uuUvJ/4KiJREw1FdHrJLaZZjJtD/FbNDdpETk8NKfmwEvzqnRTqI
	Ys5EQIQwNCEEpRB0ITrpiwu2ABRKs5N2rHg27N2XtLxseJ9i+hKT/AWgGz7/HQxw
X-Google-Smtp-Source: AGHT+IFGyG/qv4mmy5rvpksMU2PDIUwjBXsC8/JIlTgclujNcpO4cvR6tKZfQKoPAqehvg+huI4Alw==
X-Received: by 2002:a05:6000:1867:b0:39c:e0e:bb46 with SMTP id ffacd0b85a97d-3a099ad3478mr160848f8f.4.1746131602298;
        Thu, 01 May 2025 13:33:22 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:f0e:4490:d947:2c92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7b09sm165768f8f.48.2025.05.01.13.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 13:33:21 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: i2c: renesas,riic: Document RZ/V2N (R9A09G056) support
Date: Thu,  1 May 2025 21:33:10 +0100
Message-ID: <20250501203310.140137-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the I2C Bus Interface (RIIC) found on the Renesas
RZ/V2N (R9A09G056) SoC. The RIIC IP is identical to that on RZ/V2H(P),
so `renesas,riic-r9a09g057` will be used as a fallback compatible,
enabling reuse of the existing driver without changes.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 1b7fed232642..cc39511a49d6 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -29,6 +29,7 @@ properties:
           - enum:
               - renesas,riic-r9a08g045   # RZ/G3S
               - renesas,riic-r9a09g047   # RZ/G3E
+              - renesas,riic-r9a09g056   # RZ/V2N
           - const: renesas,riic-r9a09g057   # RZ/V2H(P)
 
       - const: renesas,riic-r9a09g057   # RZ/V2H(P)
-- 
2.49.0


