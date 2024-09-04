Return-Path: <linux-i2c+bounces-6096-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B0E96AE3F
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 04:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EAB6286C3C
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 02:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019404086A;
	Wed,  4 Sep 2024 02:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VATbB0yD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E9E335B5;
	Wed,  4 Sep 2024 02:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725415498; cv=none; b=oohlfxvIidWzZ61ETh+9ma0y3xsbVUFW+Y2y8lHnPT+pyxyP0R9oWnLE9JWzFxXsPVsFwYqs6l2GlQq0DIdlWRCtmurcbrJt5eUyrTNvHFK8G20mc+mqP2YauRjajvU6QokbcuSzlJyr5gX/G4BXrOuGeqZbovD+Av3SQHRXRwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725415498; c=relaxed/simple;
	bh=NHYzKaITmdTJ6LDsa1MSFWey7gHnLUbYQtenL3wncDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lgsV0kxaeAXAdmJ3pUtFUw6RrmvVAB5EdoXvgENfMFImZ9ahqs8FyUWxBQX28QmTOdU7Z2SEPeMtA43c+qMokq+KhbaDejMCYxAEd5ZRokKJLlbISAzyiW/kBykzrI9/D+B+RxFjdImQ+o36qHrGTkqefNZC3V62Ol99Eznm+gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VATbB0yD; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7a803a4f6dfso15873485a.1;
        Tue, 03 Sep 2024 19:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725415496; x=1726020296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nyl9Q+BjD+2w5Z9jzpRf4cTBIglEMGm1/CmOMLsQEu8=;
        b=VATbB0yDeK2q50B8qqR8lAhgobF+qSMXbxdyJW92WnKRgrk8w3BmO854kg9VWonVRh
         XHdyw29BWQ9g6qExbYReVds16FNVOoDPCY9ei2A9/6r2UCkSIW0OVYWalGa7xojb3prf
         tVyAE4lrcYLKsOq8eIXDMono92Je42uBa+h3lmsKv9U7tESPGCoerTCFDOoG3HLziEC1
         44W5OyVZagQHBIfGe3MRy6mYOA2piFR5AnlAOwFJH/I/3xOV6mA/sG7M4XKMdpPnh+re
         tj2ToeNbzRVr0BZYvnfHGb/1YZNvDDO8+T4Z3Zy0FGXF3H4dut+bqVshluBCc2BuAzdZ
         WJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725415496; x=1726020296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nyl9Q+BjD+2w5Z9jzpRf4cTBIglEMGm1/CmOMLsQEu8=;
        b=cjBSxqzHIgDU/JUEhOdIbkNgtZqLHa9bVkdr9ey3n+UTKSaLPPP6/s8bdBpVwloVql
         II4oivzia1LxJz1UxJl6z96K/xSW3AM1le9cTAwdM9z8GRpixjpExuO3Jf0xUwgwLpou
         LpoiJb8z9sS/xslxp5kFa35myNS6TEA+MtuQNzSNV4Gyyktvq0yeUcYDjeb7ZEK5O+HT
         +YpN63STLVm1uGw6DdEqEd66hgFR8mfy9o8VoespeJ7COmXVv/XbRbfxJK/8x/soNsch
         EDNdExeYcB3+xupf+Q3zLioXhJ7ZnuFCDWFzUpJqeDlyojLadRxaXTDm3VNuhpmUnJCN
         y8CA==
X-Forwarded-Encrypted: i=1; AJvYcCV0P4iouX8RYk/nOAWsELoMWJlGcvo1xkJX9xJsZvNTjFUoDqFrltr1gxCM1H0M3X7jJ46Tfqmzx0udYrw=@vger.kernel.org, AJvYcCVDBcgabw6NUukTMwZ4HFIxkhcarnz1c6yZSgKnjwZwfuAZcYxy6XwXVxG5BrXYfpnaTcMPRw+XChdK@vger.kernel.org, AJvYcCW+hk+ZjXIs/O58vF4ZD5eCrI0ROhyMdYO6avCRKLHCDnjd6r4ZFxoK+DwQhstFEhJM48C9oro91ccW@vger.kernel.org, AJvYcCW06uSg+uUFZCxrlXUJY8nVeRJkVKgHo4vBKNokdkViyiG72J56/36WLB53tUEUlIUrdNb5Ekb5LEFe@vger.kernel.org, AJvYcCWUff0LW7BiHGuyTha4kut0CeeaYuINfeGgyg73SUnExLyeQETsnnc3+VIVzil1kUd4Tklg+OCvX2w74xXoTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEVGG6AkqjKDPiLJ6BRyuVp89UkQ1goQRuBK1wXrniFm+4wSw2
	VEmZPDECl7AaYajoCuYuonpcOTM5gsFXDIpqFy1dfV1lc56fc8QTpmbQBT5+
X-Google-Smtp-Source: AGHT+IHhwPgmK6+bzNq/nDJYLPkx7CJea9h5V2B7qgr4MM6oRNKCgFyT9AnxdCD+9l1H0o8rRpZrkQ==
X-Received: by 2002:a05:620a:448f:b0:7a3:5f3f:c084 with SMTP id af79cd13be357-7a8041c589fmr2270022585a.30.1725415496020;
        Tue, 03 Sep 2024 19:04:56 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::24da])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806c4c841sm583420985a.68.2024.09.03.19.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 19:04:55 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 1/7] dt-bindings: clock: qcom,sdm845-camcc: add sdm670 compatible
Date: Tue,  3 Sep 2024 22:04:50 -0400
Message-ID: <20240904020448.52035-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904020448.52035-9-mailingradian@gmail.com>
References: <20240904020448.52035-9-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera clocks on SDM670 and SDM845 have no significant differences
that would require a change in the clock controller driver. The only
difference is the clock frequency at each level of the power domains,
which is not specified in the clock driver. There should still be a
compatible specific to the SoC, so add the compatible for SDM670 with
the SDM845 compatible as fallback.

Link: https://android.googlesource.com/kernel/msm/+/d4dc50c0a9291bd99895d4844f973421c047d267/drivers/clk/qcom/camcc-sdm845.c#2048
Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Suggested-by: Konrad Dybcio <konradybcio@kernel.org>
Link: https://lore.kernel.org/linux-arm-msm/7d26a62b-b898-4737-bd53-f49821e3b471@linaro.org
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/clock/qcom,sdm845-camcc.yaml        | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
index 810b852ae371..fa95c3a1ba3a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
@@ -20,7 +20,11 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,sdm845-camcc
+    oneOf:
+      - items:
+          - const: qcom,sdm670-camcc
+          - const: qcom,sdm845-camcc
+      - const: qcom,sdm845-camcc
 
   clocks:
     items:
-- 
2.46.0


