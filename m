Return-Path: <linux-i2c+bounces-13822-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1BFC0BDD1
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 06:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B0723B90A5
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 05:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4BF9279DB3;
	Mon, 27 Oct 2025 05:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="V4v9q4xT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9FA23815D
	for <linux-i2c@vger.kernel.org>; Mon, 27 Oct 2025 05:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761544184; cv=none; b=LSMcTqAtrrl2BZZbZLkNvj5zOdKrjjB6Hp31xrtwzyk+KocMwSDepJNYdJQzYx9gYzbAYjUqRMVBHAsW+fY06F4AwLjj4ja8hzIm+E60EBJoZ0dURx3G1yPWfHfIZY907jc4ssZugFCTdT5gfRirYY2cEFUYP90mBAloeJKta3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761544184; c=relaxed/simple;
	bh=qrtsu10R5LaOPyR2BzaYp1CqzUTsNYF/L5ew05NJJUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bBJDrekqcXk3fRMMaWFA+nSzoZ4jlKMn7mt2ilLdGoy833mDjCFdhE22BOTrHrgnFkRZyvnyt/barwubVEeDLpw/g8lfi1VfuRx5qOCnyIYlffxG5s7Ctc95+5IlXFbGp0yWKIAOi1WxbQvK7DxAz0gV4eHBi4f7emBCOswCUYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=V4v9q4xT; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761544114;
	bh=8I4+vxckyTpw0x/pY85yqvUPHwDZ9K/bKl+VrKCYDIo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=V4v9q4xThK+scTtHESrpK4FWZfEHNYUF3dGP/9nf9srNE0YWmWYE47EXzV/23JTT3
	 y+OHrVOPLxnn+T4lulZaJIl5eFA6yMAAwb01wUz8E8+VT/Qk7+VSTXaT3ygrHlUZgd
	 kWWhP9u/noGnrBjfOlp3VXsk9XXJ7Qd6LUUhaEBM=
X-QQ-mid: zesmtpsz3t1761544106t35d805fe
X-QQ-Originating-IP: YdVZp3ZiWrpL2fgu8XYgSa+iDrxlJLKacoE9GHE4FKE=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 13:48:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7992623468167245455
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 27 Oct 2025 13:48:08 +0800
Subject: [PATCH v2 4/4] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-p1-kconfig-fix-v2-4-49688f30bae8@linux.spacemit.com>
References: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
In-Reply-To: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761544088; l=1089;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=qrtsu10R5LaOPyR2BzaYp1CqzUTsNYF/L5ew05NJJUo=;
 b=fllL427rT0KQnek2I4ijNMRL2nD1KYzgbDwqbJPFw7byVGjmzkjK+CbYAhRjGLBzBqGMg/HgP
 zDN2oRRgWXyCpl7YahtbGGmMAbR/PWEpuDyjWxNAvt5IxWAUtxeBZeC
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NQvWsrZNIxX/rFLN6e8wKHD9ld6iPAWsBCpNoSgmg41dgbrfE1M7fFFl
	E5t0ReQj/LCljHX0hCuEhk9EZkh3stAoS8HF/4Aoveny/USjkmfI7Uwpgqq3sYXb8k0wq0H
	wFNtp5gjUaGAQ+XBMMv74yZwIKPNVjvmL+6qsj/DsI0YVqdLditIFOQUlh0Rpm0FdCnM3ud
	4jCLa/ANNBLBX8Y9BY4qSzcFAuSrkTsaB4YrTEtQ94YGtODRtqMFOjyyX6GvTkZDAQ8R6Xu
	uN47U+aQ+k8kkk/CKta17U+pbBGLIKSy7gXHaH2IjLAVMe1U3Fr9+cRlgeyE8mrtpYZF2RN
	1Um0TL/NVBwgCZHIaxb8x5o5B8/ZZeJblr5R5XlnQvMPW85jD6VYvr0tJ6UwlY2D/t8kXPe
	EKf5Zw3ipTtV4eqbO75YwKHrktZwfh+YY7KEaSQFFuamNncyhOS5nt5+95VTumTB8W6wHZu
	roLAeXfJo41dXYfTqsk7DZg/TzrT8XJnRkU+CFZxD3euI8sVPFPsgvSHDDij6orIoDZF+A4
	1b3gb73uC0TVu1I5sc6Pzjab1RQmTBfqjnlVamAOCtwO2980QXeye+KvXA0bf2OloNWW791
	FiRMXjJm6JL0sRewtVf+dJmwQyjwAmOAnWeq0rZgaYta26udBi5vd2juY+lPtna9XKOn4Hf
	IZS4MJrXTmguukXEyfTs128B3lGO7LRnfDiNTCi51B7MoKB0PW6zV5l5YpDCVfol58Kqf/B
	7bsxZLHMgKY1HN5wv4Iua3CLfIIWuZmlj7HDeAqdxaD1QxKI3vvcxcQqo/71NyDrN6gbovq
	jeYk1H0/3KnDtraPyB119bO+0QLUTMPsGai91M371rsxsB5x+IMUoT5X74RbZlLMGEVkRSD
	ko6+vkjfGB1Ylh/T4fRsHB7wEPTYHQDQR4DGw6pAF84EOuB6T/TcBm13YOHnDSOhZrgzaGZ
	A1LxAmdJSYbdh7HAkh14JG7GuXVoVX27d4fJwEAdlLryvRRfC999FJVKJL5MDQUgzIypnx1
	9TNBVb3kJvoHJVrCGyrKdqjGAUAXDrd86Chqj8Z5ecHS9isu7sdzL98PNlV54ffDUXdikeh
	dua6aOeSDNuX2I0Jbfv4BHWUu8XqXOUPBxrGCVaGJOIU98e40DgytIS9Hsf+u7ytg==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

REGULATOR_SPACEMIT_P1 is a subdevice of P1 and should depend on
MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
does not always respect the parent's dependencies, so 'depends on'
is the safer and more correct choice.

Since MFD_SPACEMIT_P1 already depends on I2C_K1, the dependency
in REGULATOR_SPACEMIT_P1 is now redundant.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/regulator/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d84f3d054c59d86d91d859808aa73a3b609d16d0..f5ee804077cfcb300ca5cf5d865b6684943cd749 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1455,8 +1455,7 @@ config REGULATOR_SLG51000
 config REGULATOR_SPACEMIT_P1
 	tristate "SpacemiT P1 regulators"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on I2C
-	select MFD_SPACEMIT_P1
+	depends on MFD_SPACEMIT_P1
 	default ARCH_SPACEMIT
 	help
 	  Enable support for regulators implemented by the SpacemiT P1

-- 
2.51.1


