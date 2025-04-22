Return-Path: <linux-i2c+bounces-10568-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FC5A97B47
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 01:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B6A41B6024D
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 23:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A8622129F;
	Tue, 22 Apr 2025 23:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0bwBqXl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880BF21C176;
	Tue, 22 Apr 2025 23:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745365721; cv=none; b=cSPFkS1GYBzkCFnZguYq0OItGEuyRbW9eiZCI2kYUCoGtoJ9TjRXLmCiKJor9KMX0/n3t9zUc2YV2fds3GOcmgi8XA+qbImNIsWq/4s8UCoFc+eXnzq51jOumQP912B5MWO/n2+i0YMjo31tWfoaqx2+bQ0qSkkoI1MhbWEgRhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745365721; c=relaxed/simple;
	bh=wL6gDQfw388khyaqD8+VfVvWWoocwoI1GrR8u1BVqWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eIiIkFARIGg1LQ5/u7xQCu0x2knIy4ijXCbsAq1eCqzWwfMwRGCusDzPNGzxgmzNFbMBszlioxHr4BQ+W6D9eysjcmkgC7cW02Ls4mzBANgboEqN4fixuvF0rhdPwFrqChWncWijQFDbYXD7Hju7qqeT6zTTPUxjFW/ycIXgtSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0bwBqXl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5513C4CEEF;
	Tue, 22 Apr 2025 23:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745365721;
	bh=wL6gDQfw388khyaqD8+VfVvWWoocwoI1GrR8u1BVqWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O0bwBqXlheSNkear2jotn7mthe475T3tCn0WGGL1gKZue2FCIItEfTvV0ed0TJHsn
	 jjPuHcgk5m20iyKKfJPPfLzAQpOdKokkLlYSuVIrDAPOGydWD7H+jfa5nVxOpuk2mR
	 9LPHdxqO+c7lR8JlIPBFgYGp3IUBgUxq3evTTOJxBdfBXBX3cuCMrlqElt03a3FpnC
	 Uy42ui6KmzkznWZk+modXbEBexWHf5HH3o7kPTpl+vg/F37/mDIsAtEU3CMmi3S9M2
	 vcVrspV6Ya4z/DxHFSLkwsP3fT+T+hiHWnkypfhxfTqZIfVpEeIuwyG429TU1K1kP/
	 QQ8QJqihqywRA==
From: Mario Limonciello <superm1@kernel.org>
To: Borislav Petkov <bp@alien8.de>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H . Peter Anvin" <hpa@zytor.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-i2c@vger.kernel.org (open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC),
	platform-driver-x86@vger.kernel.org (open list:AMD PMC DRIVER),
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH v5 2/5] i2c: piix4: Depends on X86
Date: Tue, 22 Apr 2025 18:48:27 -0500
Message-ID: <20250422234830.2840784-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422234830.2840784-1-superm1@kernel.org>
References: <20250422234830.2840784-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

PIIX4 and compatible controllers are only for X86. As some headers are
being moved into x86 specific headers PIIX4 won't compile on non-x86.

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5:
 * Drop unnecessary tags
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 83c88c79afe20..bbbd6240fa6ed 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -200,7 +200,7 @@ config I2C_ISMT
 
 config I2C_PIIX4
 	tristate "Intel PIIX4 and compatible (ATI/AMD/Serverworks/Broadcom/SMSC)"
-	depends on PCI && HAS_IOPORT
+	depends on PCI && HAS_IOPORT && X86
 	select I2C_SMBUS
 	help
 	  If you say yes to this option, support will be included for the Intel
-- 
2.43.0


