Return-Path: <linux-i2c+bounces-13863-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CE8C15EF7
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 17:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9131B4E8765
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 16:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4334B346797;
	Tue, 28 Oct 2025 16:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="nbjXTzSU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62165316188;
	Tue, 28 Oct 2025 16:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670075; cv=none; b=haJbhK61uFN/Ci0xz3OCh6oNlAgIFssMlKW0bCvu4Oo5YxAvgqMLkCFUfwKBZTzSkhSJd2VDrurzLxHI3PFRkR/Hpeep9Fpjuvn15sGAkZ8y/jVaWqjKYsiaGbTWiL325OGgxXZe/X7dp/xY06DfE8ck0B8pVvjyjoLfHYSEuaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670075; c=relaxed/simple;
	bh=fROb0VuDz//V7JMJcv2t/en6SL2W7KgGB/5yC8uMATc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Pi3/zTml3gWyqK6YT55EoOVvib4FqvTMi5A3zYgj781CBg0cBOiTG7PCGdtxlpxXUDUERyKUP90lqzN0LRWU6OZwPR5H7uedX75dE0YuZ1B94UVyw9RDhRD61agUQGQ9wrZC4E1jyjnJjib4jn6rxv78LDLCkVdHC+T3TNc3ZXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=nbjXTzSU; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1761669686; bh=fROb0VuDz//V7JMJcv2t/en6SL2W7KgGB/5yC8uMATc=;
	h=From:Subject:Date:To:Cc;
	b=nbjXTzSU0vivhlTdzCjXHoD5jJfOVcDV2SWPkt+Z/PBENIi/ofGVX7ymFzml1RynV
	 Q/pRVzUy0Tv40gV2rQNgLZSKxIGehaahqPumQG/qbqXFWQ3sTuNdwbGB0jtdt0cXhq
	 lpaaBtqPX3f1/Mrz+HO0t6GO0X80J8oGesKEBhEo=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH v2 0/7] Camera I2C (CCI) enablement on MSM8953 and
 Fairphone 3
Date: Tue, 28 Oct 2025 17:40:45 +0100
Message-Id: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA3yAGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDCwML3dziXAtLU2Pd5ORMXVMLc1NLs5Q0C+OURCWgjoKi1LTMCrBp0bG
 1tQCgWqpTXQAAAA==
X-Change-ID: 20250808-msm8953-cci-587596df83da
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=fROb0VuDz//V7JMJcv2t/en6SL2W7KgGB/5yC8uMATc=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBpAPIQffuhxUCcqDpXujZitSVFPY6SABxhkLtHH
 wf1DOSnr1iJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaQDyEAAKCRBy2EO4nU3X
 VkrzD/9hCA4yQ+ezTX+k61c1VHWSuoHi5vh1tN79xXznVP160iVB4CVoIB1AY4UTvRmEH3GBtQv
 3YltR6fAiH4bkR+CCR9foOEkaIT6En7Dzf/sJ1masaZNS9SroKnzdH8W1EcJ78qLQiYrS7rr21T
 h+a8Q1FV5jyOnJ4vzX8IrwS6/X/7mOIwjVBMSRwkmQVUAtXe2b0GTaOXspd9kT7jbmz6oO8Abud
 /B3gl6P7hBpOk9SVfZoqwOEwVfkc/5elhweZeCgChQWHBZSF6YqvHsWeXld5S5/HifsHbXEi8mQ
 zk9F+ZP3fwV+l9oHtNrjHjqZfVqqXVZ83yhxil7qkdbUdSOg/4a1+LPdKfSVxqsNq05QmXtKu6y
 SzE7gzwGS/nQVPeEaLOy7vRiDr1mSTXYKGZMtatJCJNluLOHxn5v9Sw8uJyx/aN9Nzx3NPY1rIQ
 XMxG9g9ptHPJrNuDBqPRvP8HgqT666cSJoEcOKS4+MoLQZsxsq89uaB6ujrCcOVPOiyTxdLdN9g
 Sbv150cSHfCwCZCXH6XcAw6PXq+7q304qrHB79x/JSEoRhkWn4YsvzGlRtoNid70Maw9Bs2vNWW
 iiyzd6cQig4/Em5Lim2CsM8popRONOIr9sIBk4sKYqMb36WW+GveWNdE6abfC0aiSJ7Y5hmKbqJ
 CUliumWtQ4klB+A==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the compatibles and config for CCI on MSM8953, then enable these I2C
busses on Fairphone 3 and configure the EEPROM found with one of the
camera modules.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Changes in v2:
- Fix wrong placement of msm8953-cci in if in cci binding
- Rebase on linux-next
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu

---
Luca Weiss (7):
      dt-bindings: i2c: qcom-cci: Document msm8953 compatible
      i2c: qcom-cci: Add msm8953 compatible
      dt-bindings: eeprom: at24: Add compatible for Belling BL24S64
      arm64: dts: qcom: msm8953: Re-sort tlmm pinctrl states
      arm64: dts: qcom: msm8953: Add CCI nodes
      arm64: dts: qcom: sdm632-fairphone-fp3: Add camera fixed regulators
      arm64: dts: qcom: sdm632-fairphone-fp3: Enable CCI and add EEPROM

 Documentation/devicetree/bindings/eeprom/at24.yaml |   1 +
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 arch/arm64/boot/dts/qcom/msm8953.dtsi              | 668 +++++++++++----------
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |  57 ++
 drivers/i2c/busses/i2c-qcom-cci.c                  |  46 ++
 5 files changed, 468 insertions(+), 306 deletions(-)
---
base-commit: 7c0022eca56891cbc3d94cee91733c28568342bb
change-id: 20250808-msm8953-cci-587596df83da

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


