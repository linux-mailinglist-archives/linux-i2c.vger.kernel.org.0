Return-Path: <linux-i2c+bounces-9277-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4C2A26487
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 21:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27DEE1885B04
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 20:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA33E20E71E;
	Mon,  3 Feb 2025 20:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="ZsqcxV2h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D4A20E31E;
	Mon,  3 Feb 2025 20:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614853; cv=none; b=K8fE2+pw0a+VEFQx1qaoRBzXv3Bovi8MYegubGDbjUg8E9NpMgz7SCKKcVLECGP7gIcn/vOJSEpc8mP7fq9XjcqyML+xJ/oTb9f+VIxc0PiCkjhZjTwIQqYb+o/mqjyk9HJ7q1Q6n0eCqpBzzSWff6yZdOOw8pxhVUb/3dbqrLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614853; c=relaxed/simple;
	bh=4OcKoBLVCswFj8+WyqdYMQe1By0BpxCAengr9aXEi/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NWntL79Y31AOl40IbTqdHcNU+2AxYaBlkg3ouNMl75LqLos3eBG0/DWumOB8vbi8oNymycXmRpozUCPN9iVL9Jocbk/ZIESyqozPWgw2f0PgOiBzOmi0jO4UJQWsshkHVHHJvbzXxWMVcsXLHwBXCjuytNb69klq4ll2AiGTD8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=ZsqcxV2h; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A044020529;
	Mon,  3 Feb 2025 21:34:10 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDCwkQ1rbqBO; Mon,  3 Feb 2025 21:34:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614839; bh=4OcKoBLVCswFj8+WyqdYMQe1By0BpxCAengr9aXEi/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZsqcxV2hQqYaMrsKyB6I3XefykRZUY9V1HiLmuy4DfzXSGh7yztuNxtTahML9dPba
	 k4qfPHjaYKJ9UXaOK0+qS27fRIjpDRVxsm2mj7iw2ICzAc4KD2trvGTmjF9TFRAqd5
	 /s2rjC3MstoI5z2Kg9eoCWu+bne+lBAa3V4WvWssktXneI8XTIrrF4mNESn166Ekg6
	 vtL8mFen9l7CA6LVSq6Edv+qaDoBCRTgUHWkmox0Wso71M1eVe3yxwFCrANt3fKfSo
	 JnKUfVGhLjBjs5B0lpmeeZM3qVqXkexLlErrH2Jsc4oE6LQBktwojK9FYlm0kb/Le6
	 xocBRD/wY0Gmg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:03:33 +0530
Subject: [PATCH 2/2] dt-bindings: i2c: exynos5: add exynos7870-hsi2c
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-i2c-v1-2-63d67871ab7e@disroot.org>
References: <20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org>
In-Reply-To: <20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614819; l=926;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=4OcKoBLVCswFj8+WyqdYMQe1By0BpxCAengr9aXEi/M=;
 b=7OWgJnwDpMWLJ0RIujPOn4v878zVH0ND7VYLxNRdtoephlHI1ZdX1kDSCWEh9jhZF26NU3/XP
 dSjdIXVTsT/DEgOJSYj58I5Bp3X9DTIG7rJ2QiYRFC8kFfG1XaoUwXS
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Exynos7870's HS-I2C controllers are entirely compatible with
samsung,exynos7-hsi2c. Document Exynos7870's HS-I2C compatible string
appropriately.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 70cc2ee9ee27dd128be10152a0a0c873802f08a2..8d47b290b4ed1c95b7237ce7881b40872cc7ada9 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -30,6 +30,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos5433-hsi2c
+              - samsung,exynos7870-hsi2c
               - tesla,fsd-hsi2c
           - const: samsung,exynos7-hsi2c
       - items:

-- 
2.48.1


