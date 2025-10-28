Return-Path: <linux-i2c+bounces-13866-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C28C15F46
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 17:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AE051A62048
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 16:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C22E346E6C;
	Tue, 28 Oct 2025 16:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="4wHTYlyk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D696283C9D;
	Tue, 28 Oct 2025 16:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670075; cv=none; b=CrL6FwRLhkc30BdfkpnO/gSI8drDdQDEUZVoDi/7GkGOuvYoZakhXjBRjJyIaJ6uoN9zu5V8zqEOVccpTrzto1w8Z19165kZegJhf3IP9BEGF8TIzCLre8Dbb15bYTxJfgheIkdlvB7uDxbUNyUviJJ6CIge4wdmVHJWRQGf3TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670075; c=relaxed/simple;
	bh=HnbUuYbJUTqAHZTrrDO/uWTlecqDBisfi+I6pu+bMuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lvDCL27q+hKebDoAiBYsGs8KFfWhcjVFSv2JA+xJ9pAo9GErZWRQZjRsWSsrJa3HK3g9LfuwJo4pyLvigLGQBXVgdbPB+UAM4Y9T1/OFKISRCSd+5XUbkrjBsorJbQ/n6wdXonaAXivnymvW9BiX3EmUwBhYcUcPrsCTbxdCoyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=4wHTYlyk; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1761669687; bh=HnbUuYbJUTqAHZTrrDO/uWTlecqDBisfi+I6pu+bMuE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=4wHTYlyk0Z/J3lS6O+MorUVMHdvXmHPOES0Nkr9ygP057u5C73tPVD0Pp1ppJ8p6+
	 coqU5wjvaDDOx9WSwrSHaNvG2XxAzp4jTyZS1wZCeWIAe7ecyWa1I8rWTgL/XKmBCu
	 dBaU4E6sQVHTSSoIzKQryVNMrcrKwCx1j/NRoDfs=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 28 Oct 2025 17:40:46 +0100
Subject: [PATCH v2 1/7] dt-bindings: i2c: qcom-cci: Document msm8953
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-msm8953-cci-v2-1-b5f9f7135326@lucaweiss.eu>
References: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
In-Reply-To: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=910; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=HnbUuYbJUTqAHZTrrDO/uWTlecqDBisfi+I6pu+bMuE=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBpAPIv4THAMamxS+KKrjbKMM9qprCrK3otd4Eoa
 zWbIsIB6AKJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaQDyLwAKCRBy2EO4nU3X
 VuHuD/9y9BkUleCzzohbV8PKin3K/OvkqiK0EVO/p8XeS++TBEfoUbpICMdOqWWDj6oRFPpto33
 XGdZk69FNNB4K9+0AB/P9FttjFZi+XFgs/i8H7rNsABCdibkeUiuLdwsk1Pt/3vgsCA15qmEYGA
 JolRXhatbhgwh0LEP3vihftmyXnaQhNEwh4oLses3tuca4SHdARrCa3WVBfOuhsazQ+VDg2b2mG
 ThfHmbnTHM/gBSi3cSh2rpWl2wbTeidEn4TD0sgjhvOIw/bn80EURo8++HoNcraU1vjsve0auAf
 tdpIA/JE/yCSQKBFEmsOGX7S6faDYDDBPXcuJ/bKbvAIhAENMlSCU677YxyRZfXGztptOgloVaR
 ezrQHiKabPqzRPNVXbRxdCg7pHRO3RiPwgh/JbKGcFDZo+NGYrY7Sqtj/wPL1TBTj4HKccP+UBd
 MCKzpv29RDcKZqvYdidRkXbGqdXe9ksE9Jira2QFbUhVABPXafLRDgFiIjdcBn4MmeVZ7furmp7
 uPhvBbNoIqe8FVtHvcfpJ1e9ga2DYffpnREjLuCH2ZAktEhcwfQIQXT1wtg0VzhvcD+KbLUFTG4
 kiisC4uMIY7RxwIL3cGup1/W9r9jqbSI3vUl0FFUTIRJbjCg0Vg2xAfi+5RLGNFHndbZCB93Zov
 WabE/N8yMyByBSg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the msm8953 CCI device string compatible.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 9bc99d736343..ef8f5fe3a8e1 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -15,6 +15,7 @@ properties:
     oneOf:
       - enum:
           - qcom,msm8226-cci
+          - qcom,msm8953-cci
           - qcom,msm8974-cci
           - qcom,msm8996-cci
 
@@ -146,6 +147,7 @@ allOf:
             - contains:
                 enum:
                   - qcom,msm8916-cci
+                  - qcom,msm8953-cci
 
             - const: qcom,msm8996-cci
     then:

-- 
2.51.2


