Return-Path: <linux-i2c+bounces-14651-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C270BCCED03
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Dec 2025 08:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BF3730399BF
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Dec 2025 07:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB552D838C;
	Fri, 19 Dec 2025 07:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFXA/nIJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037CB2C0265
	for <linux-i2c@vger.kernel.org>; Fri, 19 Dec 2025 07:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766130161; cv=none; b=CelJyYj4U/2hBOzKmu2xotI7ON22YURxzCGp0V+7zOUN66E/DUfQYrAsO4Dq/cGKBukySMjoKFa1K4g08VpiQEzckyr7kDb+2LDPMtH4gga4w6VMcLM0KCTsSOWrwKeKj2cDhILl/DVlPZIFaZ8NIErihs72m18I35V/lg1lLq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766130161; c=relaxed/simple;
	bh=/r6f9IRpVGju3Ryu7UDsRNF+0ADreBgeJr9SFE2YWMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GjtMddzeXctwGklWTowvCFzAcprjpVRMsptxEUpT/G2gklKJRabXPLIXW9Wr6GCGXHAPsMcTttPD0doZc6aI1USRhYgQJ77BX7OZ6Vli+IhZn8dBSqkMas0y3UcVstnYrc9EK5CI/uaXHRC4FDhtFg8rqAXF+1V0xiXK76pE1eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFXA/nIJ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so1177573b3a.1
        for <linux-i2c@vger.kernel.org>; Thu, 18 Dec 2025 23:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766130159; x=1766734959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A16mIOMQmuaHn2+TKOnGQUAwRDMDtpdj4WXcnB4hmwo=;
        b=fFXA/nIJNMyDxLN6y76x45iqbwiPnUPtpbX9K5TX4lQb79luW+UrzuEvMCbSC7c9mj
         /O17ojgRW8Pbmd2nQTR2GFnKoJn2L/aQKZmt+Ob/XqarKATXsfmMxxwypXVzC94riMLE
         hCVjVAK7Jccqtxctt7HGpKpWNpxEmIg9DHFB8Onb7DqjVlPGzAWbm8lrBJBauuXZUGId
         LL+q/IYRYFve9Hp18pHM6zm3X0XoWbBYrwC1U0k52kRhFb0AHvLvVXGPrbeVg3WzTzG3
         zBEopyiBLS+Q1lbp8TD1NhljCqjCZZbjDOpRlGUGrXXzB4ilmg79R8anj5UpToyFkUPg
         J9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130159; x=1766734959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A16mIOMQmuaHn2+TKOnGQUAwRDMDtpdj4WXcnB4hmwo=;
        b=LmIQm4C0q8D2Opq/+DcH2Yuj7Bfvg8/zy9ROfiswmouBi/xKx0JxZ1WTsHFFMmgMBR
         rtvNgGQIxS5T8bzSuLRniUaOVRloaTPhwgNnosucxMofnnOIyWEfLD65FvCMDDTonD+D
         +yzPZBbkmKjAfgbIHuzxoPEG96zI1tQNDmVVlPA/PiEOwIAbOlrZaPnzAieNcuWhQ9Iz
         tmRCG68VCYikqH4Crqee4ZcQ6RHSg8T7qPQFzbia0A7jixMgLwEtx56wZuy905xqGxBV
         0z/xl5+JfpqCmqlU9Px9bEQwK2eGvrCMDyxCUZRGvkJoMhTmdHc4q2/2uXtSn9FqGauZ
         FPBA==
X-Forwarded-Encrypted: i=1; AJvYcCUeYsLv1pB9kg52g04J9Fg+dVtJWSzLQhhDSH9RAqTl0TzItk8g0aRKi+7ugDnbxw9gQw0f4+q8c2I=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm6ts3/7yHh/sKMDZ7BXHfs/yfm10ZejXGs8bFQ94IbzQuExc/
	hmRcgzz4HxmHyoxT3yTCtEhudJEWwGgqxD421gnF8BeevgHpR/Apf4WT
X-Gm-Gg: AY/fxX6S36kB3V37mlbCBFnJKo3YMCjaXw6DwkxDbTdgGuQEmy7AZabA1TJ9NW9qhBv
	oqsJ+hoCJWYn6zfc1TPyUX89JDTHG6ofJz9C5gMxAvHVW3DWC1zjBXdlpJ1hrgTmK7hXzCoxdys
	5uM5GiIx6wx24gKR92fqT8GkbZ45DiCJkmHZzXA8KC2DoEKfCbEYpX1hPTcEAl8hwvwfE3eicmS
	2FJFP40e2t7PYgo7WwJuB7Mf/1hY7f+Kn7IFfGjHVA5zHc3LuOvCyFcPjXxiC7mLhnRGiF6agLK
	gbgSyzKcw4pbBkiROXiBlGAFl+S4MAHstaHn3zX38F0GXlKTSGMg7hMasUI3/hdpWuSAOnuatJ7
	quARoTJayPEh9VaNT++YsbR6RRlZ3GoL8RJFIVccVFjGoPCnJhnbI
X-Google-Smtp-Source: AGHT+IHMDEZLLOxw+3dAFpieF2QA1Yfe4kaK1QG7vQqgmnkvKYHURHQzbX3y21w9Lj3QQl7AzO8tFw==
X-Received: by 2002:a05:6a20:914c:b0:366:14b2:30b with SMTP id adf61e73a8af0-376a9cddf9fmr2091296637.62.1766130159109;
        Thu, 18 Dec 2025 23:42:39 -0800 (PST)
Received: from localhost ([221.192.179.86])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bd602desm1335791a12.21.2025.12.18.23.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:42:38 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Fri, 19 Dec 2025 15:42:20 +0800
Subject: [PATCH v2 1/3] dt-bindings: i2c: spacemit: add optional resets
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-i2c-reset-v2-1-ad201a602e74@gmail.com>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
In-Reply-To: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, 
 Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766130147; l=857;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=/r6f9IRpVGju3Ryu7UDsRNF+0ADreBgeJr9SFE2YWMw=;
 b=wvV25q8btJ4G30xXAzQfVKnpzsZrDgyjSlGnmi9bOhuNQ9Aeuh6j0rLJZZ2UdmpI8Wk3BNmIX
 Bd8J5IqmhlsD4ZMfSltfVzsoWEpZ9saVGE6AaJqKlfN0k6035M6lSH8
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

The I2C controller requires a reset to ensure it starts from a clean state.

Add the 'resets' property to support this hardware requirement.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
index b7220fff2235..1290106e28e6 100644
--- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -32,6 +32,9 @@ properties:
       - const: func
       - const: bus
 
+  resets:
+    maxItems: 1
+
   clock-frequency:
     description: |
       K1 support three different modes which running different frequencies

-- 
2.25.1


