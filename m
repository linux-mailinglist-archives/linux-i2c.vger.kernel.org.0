Return-Path: <linux-i2c+bounces-2885-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8178A0BA4
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 10:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B37B9B24827
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 08:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE2D142620;
	Thu, 11 Apr 2024 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I3xjWIDs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890141411C8
	for <linux-i2c@vger.kernel.org>; Thu, 11 Apr 2024 08:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712825546; cv=none; b=VskHytok5AX9bjLPjXuxNeYcRuarzy5Y5MO12fo/QxJJcwu4nCIxzl9IBdnrCBUr1b1gEk0uA1O4qybLa1GyjcT6miZjVF8uiIP79aAqWL5IqJ3JZZP9q9TzyprvSayq/G9IgF9tFLZvYP+DuwAL8ntIypASHKvEQyz8vG3/Fao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712825546; c=relaxed/simple;
	bh=oz1vppDKVcLy3ajc0dto/OD6QDdiRhJGUXxPZ8/cYfY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TOifijOZ3Q1YDOwviVkTXGuhAFlSSlmJtgG7T1uotblGdQWl1EDK26CNgm7P0PiGJRJvKs3uTTcfcfSU3JWYS8I8RmDu/qNdeuQUB2r+mB/CHdUczEYoGp3dL2dlFw9v6RRxHHszIx7PWpJd/TtmFfIWSmTYrekg8QBE96c2vb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I3xjWIDs; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516ced2f94cso2516563e87.1
        for <linux-i2c@vger.kernel.org>; Thu, 11 Apr 2024 01:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712825543; x=1713430343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PnP8Lqn3WKmBuN4LCmH6PJtaBigbDoHwQF5Dz835wx0=;
        b=I3xjWIDsRT0fw0gUMq9lb5Nf2aDz4j4wxxFmu3qz4xWUYno2lC2PDW2pthUt8XyyBf
         w6yyTHi8pQGCQuF7auYdkuI9ElmRIFwxEvs0nH4FbQCeYiUlQzUXxCkiuCbmIS4BC5R5
         /a0mapzH/XRCgWCQvGK+ckq36wFrKMtUzqMJEV4oFR84q/JmIm/EW+cMKBkeAP0jl+Kb
         6jktWCKgZcLY26iJzDv59UX4e2pFFR9IyZaVrQF9JaL3JaokXA1rSBxdjkBmF+7RzJ0p
         rN0jSMV1Tw6qSOn9J6HjDL5FQ5a0DTjnfDqrq3FU+gQAvtWlpbVJCLIsgN84mGbYv/+R
         tuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712825543; x=1713430343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnP8Lqn3WKmBuN4LCmH6PJtaBigbDoHwQF5Dz835wx0=;
        b=Nd0w8Gd4P+Odk2ZroMYoV1AUbXnxCfhk6jw4tdAgJkBfuPotripmK1F9Bret06RpKZ
         VoHBXg2gL8xDAMsm0oiVpr1dBs1IgX8ZFkd1+soXOW8yDOxb5nyT7sqLoM9KvNTZ/47W
         ogfO/b3xd0Y/Hrhc8VrNBQgvnPSF4ykUb/hk7jjJfyTJS3J0ku8JCZ8zSIr+xCAiXSxG
         FzZE4Ix0o8bv1TuYv9AEkgDoF/FIyzBltivhgl3hNFFTrBknf+FslQ9RwS8feuhLlJEi
         0LS+LG6L0hG4Q31g+p68IFVsCunt9qB2BIp9mz4+sCOGfcYpMHNQtQyJY/yckHb06DE/
         LiKg==
X-Forwarded-Encrypted: i=1; AJvYcCWUP1fWFZ3e6i0IS0Rov97acgLfO7H5E4WV4zaq3JCn3xb27opC1bC+tHGaI1t+nLV/1r3maS4jmyV6KxUg7FKEyfUiDUQ/angU
X-Gm-Message-State: AOJu0Yx+2Xhw5zk6Wpr+DPIt/C1W3pKWithTlYqCJROQZfvJBbJc+jO2
	YG4R9lInJTaUwj1rNCkyzfT7w0xUQ+vlD8Z9yYY98CmckTXbt4cY2gtnycUqeHM=
X-Google-Smtp-Source: AGHT+IFsgyT59h7uLUMSIJtnMqqqFxMUp0Iiz6ouQd+KPyTANx2sGA/tMfTB7jcSdes20PhfQqYjyg==
X-Received: by 2002:a19:9153:0:b0:513:cfb8:8cb3 with SMTP id y19-20020a199153000000b00513cfb88cb3mr3295631lfj.1.1712825542648;
        Thu, 11 Apr 2024 01:52:22 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id o1-20020a056512052100b00513d1e9ce7esm149934lfc.90.2024.04.11.01.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 01:52:22 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Wolfram Sang <wsa@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] Revert "Revert "dt-bindings: i2c: qcom-cci: Document sc8280xp compatible""
Date: Thu, 11 Apr 2024 11:52:18 +0300
Message-Id: <20240411085218.450237-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 3e383dce513f426b7d79c0e6f8afe5d22a581f58.

The commit ae2a1f0f2cb5 ("dt-bindings: i2c: qcom-cci: Document sc8280xp compatible")
was correct apparently, it is required to describe the sc8280xp-cci
controller properly, as well it eliminates dtbs_check warnings.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index f0eabff86310..43af1c23ebe4 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - qcom,sc7280-cci
+              - qcom,sc8280xp-cci
               - qcom,sdm845-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
@@ -161,6 +162,7 @@ allOf:
           contains:
             enum:
               - qcom,sc7280-cci
+              - qcom,sc8280xp-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
     then:
-- 
2.33.0


