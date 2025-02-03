Return-Path: <linux-i2c+bounces-9276-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A57BA26482
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 21:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D66D1641C8
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 20:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA2B20E6FF;
	Mon,  3 Feb 2025 20:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="kp4wPSX/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F95420CCEB;
	Mon,  3 Feb 2025 20:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614847; cv=none; b=CVEnd3xcIxS53iyR6y7RGBOppMxvZvpZHJPnDIgGZR76J38Y4JDTJ4goC9rVYB+Z1+s3T3jN5FcUKzijVZqDO5mbo/0xxjL7/FmxUOXmfE26GUl/iitzxR01NCQTMOKafOG7sADjH7iCmfRfKe9c2NKoyH2I6GOb0oSavdUrDUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614847; c=relaxed/simple;
	bh=1I9Wdu1ijHTqdP+YNCWicSgLuWPmphWfGZGAkOEBPuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KIYAbRxlc//gVnGRXsbmrafEZpjjiJEFaYnn+4cijiXPbt9GPuRbvMMCSTS/MRqBF6NJIZATMeGZ5dB2Gmg0Uud15BtDCKAREwgJ6TaLK+BcCX5Aztk+mvxjSQ6nV1xJHeJuYqjufI0pFo7GZGNVLO/Es+20ny0PzoHKgq832bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=kp4wPSX/; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8A9DD25C13;
	Mon,  3 Feb 2025 21:34:04 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hMYPy9vqYCm0; Mon,  3 Feb 2025 21:34:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614833; bh=1I9Wdu1ijHTqdP+YNCWicSgLuWPmphWfGZGAkOEBPuQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kp4wPSX/JOfTPnSJIfDtZhkouaVLxgLESLPKibsGkUjB1ksCS4EIzAEvILwCbZ7Ou
	 tNOIG+72y4wckgfB8k41Uk2NVqNGZ3FVBGBJ7W4iNhGScTOyIoLeXgDCMHcW+Wwhrv
	 /KBeD2s6V/3qOsL72VKJA/bGnLFV+EmqFGvhTWGOyIkT9IKRp4Uwyxl8P3U4cxjKZR
	 SpdtMb8fDeD6K9ANEJiaU+aqK4aLGPuKSYn7d8UWvhqXxXn90hWMVPtyFwmBuuo+NZ
	 ebwdbpahM191kvPV4Lg25nWOWQ7nE+pB+MMi21giTBdtOYfHRD4CsV8be7qdaz9JIG
	 TI3OSZmTOtAxQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:03:32 +0530
Subject: [PATCH 1/2] dt-bindings: i2c: samsung,s3c2410: add exynos7870-i2c
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-i2c-v1-1-63d67871ab7e@disroot.org>
References: <20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org>
In-Reply-To: <20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614819; l=989;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=1I9Wdu1ijHTqdP+YNCWicSgLuWPmphWfGZGAkOEBPuQ=;
 b=X96D5MsTJBeUFySAa/G1bSu5VuELN8KjWD+sQ8UIgvan4jxn51Qo6bBOTpTsnAklvvrWboGgi
 BbPtOLJTpy/CC7fMCmEaHFtX12s38j5bvEUDIsrRb5kyVVk7VJ4SNs1
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Exynos7870's (non-HS) I2C controllers are entirely compatible with
samsung,s3c2440-i2c. Document Exynos7870's compatible string
appropriately.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
index bbc56848562721d206fe4d72c7c103487d11f7bd..6ba7d793504c8cc3322c65ef4aae5ee720e8baba 100644
--- a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
@@ -22,6 +22,7 @@ properties:
           - samsung,exynos5-sata-phy-i2c
       - items:
           - enum:
+              - samsung,exynos7870-i2c
               - samsung,exynos7885-i2c
               - samsung,exynos850-i2c
           - const: samsung,s3c2440-i2c

-- 
2.48.1


