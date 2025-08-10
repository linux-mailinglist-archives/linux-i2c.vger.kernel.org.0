Return-Path: <linux-i2c+bounces-12212-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F635B1FAEA
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 17:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22F0917B527
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 15:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2B8274B56;
	Sun, 10 Aug 2025 15:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="D4O7k3pP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE07210F2;
	Sun, 10 Aug 2025 15:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754840815; cv=none; b=gfwUiQ9vjBNed3N8HGjBtgwe0TAW8H1iJ6apR3Oy9UrUkqlfGQ9wSWaPvnxixbtmS1/3L8uEjWO3kJw7IYNrnwexBcwNcYPh5teXHGCCEKJVH7SS6Iwj4DWoZJ55i80z4KHW0tIBxhzLflBmBxYGnLzYBlp8ybG5ecjHiFiP9Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754840815; c=relaxed/simple;
	bh=SztCsm1msowR5xsvSwwPc7wLorBM3lMk1jkr9nMFfMY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Spwmn9lYCXbzQupv/D9EJEyvw+nHAX25WMumEgiriw56ud5LlYPKjeOTLVs8l7Io+Q+HWnV5uCDWpnejfb942ZUh1+9+AjJuJ7LAt1g56KqovmSRjWQPt494iKkT74ZUun2U/Tf2gcQzoxVVQcY+6IGHi/whrq7YsjddrsOmF78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=D4O7k3pP; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1754840305; bh=SztCsm1msowR5xsvSwwPc7wLorBM3lMk1jkr9nMFfMY=;
	h=From:Subject:Date:To:Cc;
	b=D4O7k3pPM/+kxfbe0DDagjodDCUQ+nOwspe5SWg0HXcMAPOd0ofg5xC3w/gqZkO0j
	 4ngDrZzRwx8+sYlpSLGegSX9oGew0RRNKHgysHS196y/JkAeMy/DIlm/e4r+Yft7Gd
	 kgvV1DFE9QHW/4tPGqbVXGQx/UYdbkKLZLI8poMw=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH 0/7] Camera I2C (CCI) enablement on MSM8953 and Fairphone 3
Date: Sun, 10 Aug 2025 17:37:51 +0200
Message-Id: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM+8mGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwML3dziXAtLU2Pd5ORMXVMLc1NLs5Q0C+OURCWgjoKi1LTMCrBp0bG
 1tQBl2NT3XQAAAA==
X-Change-ID: 20250808-msm8953-cci-587596df83da
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1212; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=SztCsm1msowR5xsvSwwPc7wLorBM3lMk1jkr9nMFfMY=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBomLznu9T00T5IlS+RJ61zYbKq2yoDx5MZiu5DC
 9zHL86Fg9CJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaJi85wAKCRBy2EO4nU3X
 Vn9RD/4w73tConoUTyK9RKN0rLFpAeWwDDb634IGH1X9IoDKO8webKYnCGQWyuMasbLboFctcJu
 INHjeSMoJDvvG+tw97DZ/SESrTgIyoPM+q/4ARE7Q7QAeFuM1wo+JI9Qbhgg3mn1f2BuGTLwSAq
 k6wIhAdRBS14NblkJZiPwYKcnBoNrLMSSD+LXVVJ6lDiwi1VLzjaWn1yIHV8SRQQFgABV80lw6V
 JWaYJBpm5Ans0XrrCyjZOxZW6tbfItkOd2vz+3BlvLBK4fUMj40OR1TPvCqWNFk3+nhAhTr7HMD
 ga19GOVzam2n0HW5HjQxlyRa7RlkRFEAdFLOBt+RC0datEb7qtLLlMClGYGHwKE2hdyXFIkVWtO
 kgLukHdJKMSK9MqmlH3UUNC2OKWtFOeN1NX19nYQq0VJIXIBT4JyFWTpX8URc1g5O/l5TQ0SeMj
 mUHdzT2rkE+ve485Bz7K+6WPRs7u/TywKddY5poF+gD6pnkDC/FlTUtnHDILfNd3fgnROaN+8V6
 hOV9lrh57F86VRPJLnGotaHEyfb46knvpcIjTKakug/dw/HvjgjVYGALwqy4lw+eWzwk93d3y86
 TwZsJw1swhnT2KzfVoZc6L572hIed/Rm73468Ua1VVw2th3rEtf2VIb+GoLfj3AiN+HmtNJd0eg
 r5HRM/4XmKie9Ww==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the compatibles and config for CCI on MSM8953, then enable these I2C
busses on Fairphone 3 and configure the EEPROM found with one of the
camera modules.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
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
 arch/arm64/boot/dts/qcom/msm8953.dtsi              | 496 ++++++++++++---------
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |  57 +++
 drivers/i2c/busses/i2c-qcom-cci.c                  |  46 ++
 5 files changed, 382 insertions(+), 220 deletions(-)
---
base-commit: 1ad00588bc181aad8d76d86420d03042bc7e9acf
change-id: 20250808-msm8953-cci-587596df83da

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


