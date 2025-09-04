Return-Path: <linux-i2c+bounces-12635-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F172B43EE3
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F1B24E5C05
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF994314B97;
	Thu,  4 Sep 2025 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXbp4Xix"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857EA31352F;
	Thu,  4 Sep 2025 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996296; cv=none; b=s6H397hupkicHUD+xYHQIfPAAY7ESXcym1YNTnyLv7TuLIYSd5+dWQg5hX0r3EfBX8vl0UBn1mVAVAa9D5iRrJ0ZNHPW4ig5JA/LcLiHgQZyieKE/sNZP17BU0LONqQp6YcMmTZjaXtY+68T6QKvs5jsGbjeyIg8yH4D28m8VIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996296; c=relaxed/simple;
	bh=ISIb2YxiCXzHSDHlaC2Prm4WI22Bzfj830rd9uxgk5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OstAgQUdGhvAQNT089kbZa/R8zM1jkxGn6KXLwlpf16wBxlvXdV4WI4CscgwoMxKMGWb3x1g7AxNZbLTxXeJ7itxa6fffJ/FkTi9VbxHwtcVToeSpxkc+TfUTTe7TGvb/T90kwJXAk3zVgtIPkc+3MaMkx8/HFyGiyISoCZLDEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXbp4Xix; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD378C4CEF0;
	Thu,  4 Sep 2025 14:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756996296;
	bh=ISIb2YxiCXzHSDHlaC2Prm4WI22Bzfj830rd9uxgk5M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jXbp4XixaqUdEcHeYRV6P/gLicEScPkDcNtLmQrPJBZ72LsGha8hs3PSIsRibdgSJ
	 5SaczWW7C9ctOvAg25N7VCy7VeOyeJj478C8R43C1zJm9ur0P4MZZ2mN0+TTELfzAj
	 PWYTnKVKYbtU9+bq8dZqiAO1VWzpp19h9Fz2XVi2fkr2no10ZqKgqwroF+lIZpkiH1
	 zJr0LOodB7MJmDXxzoikw0162gNV0yTBh6JbKQdMQb3X6/3U+x890T5IDwS8j53RMI
	 Nzu7bKVkRm9xyr2aY3tUIVXToNNOGCUSjQFhXQpbkmFTYHetpJ18zrfSL+0AKg0T5A
	 QYHzUNNvgESOg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 04 Sep 2025 16:31:21 +0200
Subject: [PATCH 2/5] dt-bindings: i2c: qcom-cci: Allow operating-points-v2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-topic-cci_updates-v1-2-d38559692703@oss.qualcomm.com>
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
In-Reply-To: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756996284; l=837;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=H2KC20VDboBzuOfuUjQ10i65xbtF9likBztKG+8DrYs=;
 b=RgdO/lnfLGoZ2UruWKA/spa9WBpxdoK0cYZzJGFkaDL8M9rDRD91rqXI/X4LLvYOBSKAuxmHG
 3ShuY0rcZR5Ds/BW5igoGilsqIeQOutIzXBG5cHvdzlU9EdyaxmT6xI
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

An OPP table is necessary to express combined voltage and frequency
requirements for the CCI hw block.

Allow passing one, without requiring its presence.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 73144473b9b24e574bfc6bd7d8908f2f3895e087..1bb9a70661a944c1bdc01d336475952221450dba 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -54,6 +54,8 @@ properties:
   interrupts:
     maxItems: 1
 
+  operating-points-v2: true
+
   power-domains:
     maxItems: 1
 

-- 
2.51.0


