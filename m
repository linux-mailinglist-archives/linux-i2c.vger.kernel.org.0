Return-Path: <linux-i2c+bounces-9275-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6C5A26484
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 21:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E94217A21DB
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 20:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1578720E32A;
	Mon,  3 Feb 2025 20:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="eVtMLqzG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FF920CCEB;
	Mon,  3 Feb 2025 20:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614838; cv=none; b=c8oHDRhzWRmKuZ4SuxJ46T9TZdw+yMqECr6fHzX3H3ICIARPK+zVGDc8fg446JKA+3IDx3jqXOBVnalQVBvrajOHrDNukavO1EgEO9GzMeYNsB0WDCJ9Hx1OBTcHq+g80fQaXKgWomC0nKFBIkttNkXn+0Jo8sJe9qc/Qs3yQW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614838; c=relaxed/simple;
	bh=FWJKGmTO1BhT1MiHL5e0kCiPS+hW5MQaZ8zl6hlJV+0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p41KimXUz6vZ7bN2rsDgLBGFRwOwahCvofiVOBaiXpPPklEv6UvAHGGXab5EjkUdd/3H8Hpx9op4LI4Z0x7YYwug2qzfS1RU2NiwRa4vQCbz2MG/0PqY3/jdS2JaCIx+HKbjjp4Ax6ol5zlZfIakqHtKNnqHKwCLk1nmJ/XDYVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=eVtMLqzG; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 07BB225C4E;
	Mon,  3 Feb 2025 21:33:56 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xW169ZtFBn4j; Mon,  3 Feb 2025 21:33:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614826; bh=FWJKGmTO1BhT1MiHL5e0kCiPS+hW5MQaZ8zl6hlJV+0=;
	h=From:Subject:Date:To:Cc;
	b=eVtMLqzGGzcnF7sS2heeAvCLDWDK/27lYIUlgyY//oHpZr/7yqE65MZmfxmkqMFTI
	 Gp0KNGO2cv1OLR2kap4pmH2JJPHpokPj+DhaOyrTdR+p0ZMXcE9yKw6wfzfi0MwsUB
	 2FOUuvOth/mui72Tdy/qVlg5/7qs1hSp/dRwxopp8L/jls+SOgNi0zlYcdUtQDMHFX
	 Ix4CbhV3365oq8e2hvHvNzHBRGl8AQ4bhsDcfOvTt0sG0n+aqui+n2xuD9LEGBsR6Q
	 ZqPz4qSjnylrCI4IJ84wSA913RkrAECpvPKQI0ZgLDHOZ8ck9Uo2i7VXjbhv4+QGPk
	 TYrILAIi8k7Vw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/2] Introduce support for Exynos7870 I2C and HSI2C
Date: Tue, 04 Feb 2025 02:03:31 +0530
Message-Id: <20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABsooWcC/x3MTQqAIBBA4avIrBMmM/u5SrSonGo2GgphSHdPW
 n6L9zJECkwRRpEh0M2RvSuoKwHbubiDJNtiUKhaVNhISo/zses7lKw22WhLA2pDZjVQoivQzuk
 fTvP7fo2EaV1gAAAA
X-Change-ID: 20250203-exynos7870-i2c-34de9046e6b6
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614819; l=721;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=FWJKGmTO1BhT1MiHL5e0kCiPS+hW5MQaZ8zl6hlJV+0=;
 b=YlZV3Esi4H2FeSHI01RMYDD+85RlpmvRYjnV4eWfYMgPMHfGfwJqV0ywsVEiQP7/sK2GfNVXW
 W4cBPPPQxzZDBKobE9JAg+8BNrOpNZSe3uGYytO8yTtwct7fckpYPE6
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Document devicetree bindings for I2C and HSI2C drivers for Exynos7870.

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (2):
      dt-bindings: i2c: samsung,s3c2410: add exynos7870-i2c compatible
      dt-bindings: i2c: exynos5: add exynos7870-hsi2c compatible

 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml         | 1 +
 Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250203-exynos7870-i2c-34de9046e6b6

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


