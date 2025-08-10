Return-Path: <linux-i2c+bounces-12208-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27573B1FADD
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 17:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B1E73A1A8E
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 15:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9484D267733;
	Sun, 10 Aug 2025 15:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="Eup4v0Qk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E474C42AB4;
	Sun, 10 Aug 2025 15:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754840814; cv=none; b=JcwkAd7Pxl563gLOO6sTlZG32Wt8ViWe6EUFrqzIxSjveHtq7Tncn6BlXNdLsvZUBvhh/dCJfCSgxtSLlzT0qPI+vwFF4PvAezID4K6IRucLJ3vHJwOuYb7GroAfh/s/WXVCnmwlQSt7fMD4TnI0XpfJzhWevBtr27jzwNHsKO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754840814; c=relaxed/simple;
	bh=qdL5CRKsH9squ8pOWeuEMvApRO40sMATa9uok8/jfK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uSBq6hvH9KtVeo/fpjiGAhUNYSOSfRQfGfNgPQg9Mw55+sDmGHk+nwN/fDh/0rFxF9uxwqyTv331Mv2W2w3z1wu/W8UUzNdxL1uz4wNlH4ouPFY2CngfPxsCtNV99/BryxrTvinaa20ZzGOEYJK53hdIai6+HrkRpqEtqQgP4yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=Eup4v0Qk; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1754840306; bh=qdL5CRKsH9squ8pOWeuEMvApRO40sMATa9uok8/jfK8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Eup4v0Qk+g0LF7bxLDN5fhIlhBimTBTPQhhOc8YaWYL0sWHXoNt1EB77iVk5P9xkl
	 lH7D+WK7LtXToUtUUaHaLcf0SKfVQoJqBfXGfdpDqtCqNf7NtoqN7HFXqqw4j9CEtr
	 9YTGqPUy0MXt0yYVym1RctOWQOERy6jDbpiPScq4=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 10 Aug 2025 17:37:52 +0200
Subject: [PATCH 1/7] dt-bindings: i2c: qcom-cci: Document msm8953
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-msm8953-cci-v1-1-e83f104cabfc@lucaweiss.eu>
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
In-Reply-To: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=qdL5CRKsH9squ8pOWeuEMvApRO40sMATa9uok8/jfK8=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBomLzq5/Ew5W+h10TIZO5anH5iVwfGEPrxTfxPG
 FiHbBlnUpuJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaJi86gAKCRBy2EO4nU3X
 VkJnD/9zs0a0bOV99VQLncrKMV6tK6jO/l2SD9SZwYS1IVfRJ6e1u3cFyIylYztgnogYcWxzYsE
 UzGdP5r8a3KrIIJGYEkMfA1+TMXJhFDTAZTqjZJ+4h03Fn7gPL9pIH5FOBDWUhai0I23sp8bLjH
 IDQ+g+3tp5DP2oXLVvIZUiVla/G/WWEjquDY4OOeDAadSUgt3gLrc9XrkIoWQSdWRv7mMPsSh0i
 7MdwUAyIQ9V9gQWYHbgv5kLKPh1eg8+1FyXWtW4aQPOeWZYlS2OsupmA+s7aSGYD0J6MUk4XrLO
 G/W+QqwgNQ4aneIVvRX3ewH7iU5CbAW31yRBr7cfTn+Vd9Kqtv/33AD/C9W2HdubXYF9c0UyOIg
 AVRp8jOog38LU8go2OK0PUrp+7UJqSojw438l5LRGHOzYubRnE4tv6Cr1Yl6g3ZX/puUetpgE4t
 DUGLb8MGN/wiclJs7GrIuczgwBliFq5EgtUqzNugnEHoT0veWZv05qnaQ2TPxp+egAQI3Dv4B2Z
 eCG7sQd0SEO59yaCq0hfo+4HYIlrtIe85YzgL0dNtpE8X4RyCRcmEh8NHiCPfmACZXlyhLNTNDy
 ONmv9PyinSYq6uFYVi0up0wuT4d6XAapmfgCUR2E/NMGqhL34nf8cHt8ATHIYplRICM/yA7YfIa
 9iW2QM8W1oxwn2Q==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the msm8953 CCI device string compatible.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 73144473b9b24e574bfc6bd7d8908f2f3895e087..be6cebc4ee054d3100e5c4c676f1a0c4fd8d2e1e 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -15,6 +15,7 @@ properties:
     oneOf:
       - enum:
           - qcom,msm8226-cci
+          - qcom,msm8953-cci
           - qcom,msm8974-cci
           - qcom,msm8996-cci
 
@@ -128,6 +129,7 @@ allOf:
                 enum:
                   - qcom,msm8916-cci
 
+            - const: qcom,msm8953-cci
             - const: qcom,msm8996-cci
     then:
       properties:

-- 
2.50.1


