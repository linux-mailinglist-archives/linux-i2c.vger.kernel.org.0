Return-Path: <linux-i2c+bounces-12632-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 180DDB43EE8
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 233F2188BD16
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1339630AAD0;
	Thu,  4 Sep 2025 14:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hc+8bPvJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C161DBB2E;
	Thu,  4 Sep 2025 14:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996288; cv=none; b=tFHmjYCJXy2VPVQOLmubIz/flUxB258RMpLYty7pbYWM7A2ufkOuPG9BOAliGK8z4JBwLPjODn5y7HUBM6rZUmtCZwtttvSyKXNjU5OrlJMAFIhr0z+Ctw360cBxwjN/vNhEfW0liSE0peeRSQADKG9dSe4L5Nv7r4R6ZnUXGXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996288; c=relaxed/simple;
	bh=tSWUUB+hrE4+dSzwJcjhcs8ywDmf+PJIMEIsmDA5gmk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qGZDTR8rOZlWTb6n/5Cets2qirI3yjtoft2e0gKhiPn+cSj0PBphGjecxPhM/4pi6cF2HAE2mtwhJNyr12/wJsVMx7yVUFg/RC+CkSuNo1RZtqqH55FW+ZGPsb9/qphZHIgN2eRrxKJCX4oFyZgWWexIKNGp67SbMMhGgK35Cmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hc+8bPvJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8992C4CEF0;
	Thu,  4 Sep 2025 14:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756996288;
	bh=tSWUUB+hrE4+dSzwJcjhcs8ywDmf+PJIMEIsmDA5gmk=;
	h=From:Subject:Date:To:Cc:From;
	b=hc+8bPvJJJDFvNuIR6vQmK/xQDATgX0met1M7sgGa0VWgBmj3By6tldDTO7EntruZ
	 /AUQmDsXDB+JOe0XwifSH0qeVxHtnaZAignutUUGhzOHU2O+ZYnFIntzlOL+lagJ2Q
	 07SiVHVswPAYCpo/N/jcr1qRJN+bxMSKuE/Uhjmoi9+xKEzbrkijGQz20AGrncsH6M
	 QzhMCuOpbffLfHBOQXjncf6gUdbfwDD/hbi4/SkiAJmA8FEgFBRtPJPk3xcQhWIA+7
	 Ae2p5DmMRZo6u2RkmkZ7A93eorsTKY5AcN7egHnXAilzqbZmR4OvKHIuyD6iB68CsT
	 ftzTHCQQlotTg==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/5] Qualcomm CCI I2C clock requirements enforcement
Date: Thu, 04 Sep 2025 16:31:19 +0200
Message-Id: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALeiuWgC/x3MQQqAIBBA0avIrBMmMaiuEhE2TjWbEq0IpLsnL
 d/i/wyJo3CCXmWIfEuSYy+oKwW0uX1lLb4YDJoGO7T6PIKQJpLpCt6dnHSLuHjqZuedhdKFyIs
 8/3MY3/cDO2ESwmMAAAA=
X-Change-ID: 20250904-topic-cci_updates-800fdc9bada4
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756996284; l=1624;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=tSWUUB+hrE4+dSzwJcjhcs8ywDmf+PJIMEIsmDA5gmk=;
 b=JVSpCYcGaUW1sPo1zSg8DkJtunnAeGUy1aN+ZSgI4n7SI4SdBNR1UFhRyAbFR6+exxLxgxIMl
 XEvAVbjkSRyDY4ARF9RkHb4lDFw3QdXuUPIaqEQ4t2FluqjyLiBtubp
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The hardware requires the faster of the two (37.5 MHz as opposed to
19.2 MHz) clock rates to hit the required timings for I2C Fast+ Mode.

Additionally, the magic presets for electrical tuning registers on SoCs
supporting that faster mode ("cci_v2" in the driver) are calculated
based on that faster frequency.

Moreover, while its unlikely that it would ever exhibit as an issue
given CCI is a slow & tiny core, we do need to express a minimal voltage
level for any given clock rate, which is where the (optional -
backwards compat) OPP table addition comes in.

This series helps ensure all these requirements are met.

Patch 1 is a related but independent fix, can be picked right away
Patch 5 can be functionally merged as-is, but depends on patch 2 for
bindings

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (5):
      arm64: dts: qcom: sc8280xp: Fix CCI3 interrupt
      dt-bindings: i2c: qcom-cci: Allow operating-points-v2
      i2c: qcom-cci: Drop single-line wrappers
      i2c: qcom-cci: Add OPP table support and enforce FAST_PLUS requirements
      arm64: dts: qcom: sc8280xp: Add OPP table for CCI hosts

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |  2 +
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 16 +++++++-
 drivers/i2c/busses/i2c-qcom-cci.c                  | 45 +++++++++++++++++-----
 3 files changed, 52 insertions(+), 11 deletions(-)
---
base-commit: 4ac65880ebca1b68495bd8704263b26c050ac010
change-id: 20250904-topic-cci_updates-800fdc9bada4

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


