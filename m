Return-Path: <linux-i2c+bounces-13862-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 370D6C15F75
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 17:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D5893B123C
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 16:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37673346783;
	Tue, 28 Oct 2025 16:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="QvajOrTl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D701293C42;
	Tue, 28 Oct 2025 16:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670075; cv=none; b=PIjPvGcemoydVnVxn/rvyQ7ezsgR17RGTPIi9yq3zU8hUO2ltslEc0dZ8Yl3XqFAl1KbznkeoClUB6cfxtNTrnYqLVNJZ9h+gv/QOWsO2PsSCl09fEg5yBdTzylYaMmlNs3GzSQ7x4SYuFGEP47tRTSGc6a4DhGMlAzochuLfWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670075; c=relaxed/simple;
	bh=nS7gTTRWepKP0GOGqBnqwKJ8cql464B2EpaOiSj6rEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uk+g1ez2TNBzl6VP/NrDStRoKQcPXP5UK5CuwVjX0LaimQOpPREx801WoYklCzPCtxS7HVjE0v2YESwG8x+CS3f/PEkawM+pFJK5Rph5CauFDcsIjg1FdljxTvRXM97Su4Ib4LGPW4jSrDIHnThiyA+FdFTijyJ71LczNSPNnh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=QvajOrTl; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1761669688; bh=nS7gTTRWepKP0GOGqBnqwKJ8cql464B2EpaOiSj6rEo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QvajOrTlzOwJwJy3x01o6A4OE1Z2R2Qnj+om1VUKn0Rn1KXfzcDsuMqle4TtTPA0p
	 2OHHGfaLJWF4CQLPOKNN8CMVXkDm9myKp1f5te+qkqAkEwViXDeA27WgkfXIyOdUl7
	 Axteql62adWMIjuc7//4+1B5qnk5j0RxlQAgsS8A=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 28 Oct 2025 17:40:48 +0100
Subject: [PATCH v2 3/7] dt-bindings: eeprom: at24: Add compatible for
 Belling BL24S64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-msm8953-cci-v2-3-b5f9f7135326@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=723; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=nS7gTTRWepKP0GOGqBnqwKJ8cql464B2EpaOiSj6rEo=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBpAPIwENCgHbVmKTO1/riAVG7GJwCvKiB/GbnOG
 FfFt8BhQpGJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaQDyMAAKCRBy2EO4nU3X
 Vky/D/90lMqhZKF+bbh4ILqxUXHHA70s1gqGve6Yk9ilgGEGztueq1CNpltEmQT9Tkp7BBIUK3o
 ZI4DB3z9nrHmNc4TsiP9DCvh0V9/lUuaAKEXBXK2RuLMfOwvC2fJBjAHF5bCS8GOc9Ba5Teauou
 ZdpWtKvsWHJgICPGPPL6DT6Wvca/fY7rAzX3VxMBmuxTJUFXQb7xyRyDxPzm4yIvjgGvVe6+0cP
 CeKQ5GjWehYvPeZzHCzp4z62NpPMwBJhGJsX+FwZ+8DPyWvsMrHN4jPsVNSqY355XbVyzpYNMBq
 NxQ2/Wam4IWacblFCMaLBQmXYUU/+dbtT6eDSDaxs6443CLArnteT8stQZPvbdnGbi5s1tVCQNa
 RqKtXgXu75XJ9X4rI2APo5Bh9oAlim7SfgeJbKHNesyOI1ETSm85inwGtv/qVnJ2nbiGgzpuiwM
 Pn6FdLDBMCw7JgwapduVKhjFFN7PaVyoMdr768WyHxVuLzToNIj6UhBXxHVDNrd8iWc6w4lG7HW
 hhxxoIT0WXvGvpT66e3PjUTLUAiigYPI9pkP2tsfSt5I8qg0PGu2QLV403cVGnGrdzATZnhGZHV
 QOqp+8VKFe9QY2ad303/56ZvxnTTzj7/OA+H3N+tw3CgTt3dRzL5YJhhz2wFmMafK16n03BQ69Q
 43A8MCIlSXqYolQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the compatible for an 64Kb EEPROM from Belling.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 50af7ccf6e21..c21282634780 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -131,6 +131,7 @@ properties:
           - const: atmel,24c32
       - items:
           - enum:
+              - belling,bl24s64
               - onnn,n24s64b
               - puya,p24c64f
           - const: atmel,24c64

-- 
2.51.2


