Return-Path: <linux-i2c+bounces-10335-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 487CCA8907B
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 02:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E1AA7A59E8
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 00:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8071474CC;
	Tue, 15 Apr 2025 00:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwrOGu1l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F569140E5F;
	Tue, 15 Apr 2025 00:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744676834; cv=none; b=jmmQMing0erOOKNho+vpUG7aL0reHDftNpF4jxEwG47BdTRmdsfyZ8Y/jaKZ2BevkQ1EXJ0B0rqE7PzJTl9l4wn08OmTvHfPXpNBvUwg5gYJ57GvP9c09rkAW0cILG1Mh7+hqSk8eqN71zMoMKvBS9fBZm2UhgZxu1U2nSb7Z9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744676834; c=relaxed/simple;
	bh=EQbVFiXao7puD8FbTPpEU1eMmPNK8pXkKaFDejX7ioA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aqzqWQAgFKPtnDPl+l8fdc+HzMvitLeUSWg8zKkhFcunmnSWpgZIQuWtF0+4FY27wDlMGGwcmZcdgf+CjOkrUDBMYgcRAcAaN0C9i+bS3kBkkcIlG/8v2Z4RGEgam8Qc4W1hHi1IkcL8+oUIhDgkVkTLnpw+0mqVi456HcHXF1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwrOGu1l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3DEC4CEE2;
	Tue, 15 Apr 2025 00:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744676834;
	bh=EQbVFiXao7puD8FbTPpEU1eMmPNK8pXkKaFDejX7ioA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cwrOGu1lECI6l1OWhS0hTHi3FQWoStrJZ+Rhh6tSJIucoAw3nYduIFqPfjpaof+Qe
	 Eow4a6h9ZMO493i0K0k4L+zgtOrnSJ9tKEONLxOY+bqNqtTn3oSjf2SunqJb96yA3y
	 SEjyG3RNC1RNqpt7kZy1KCkRdDTNO/kDgYgsaVjUEuVqkvcoiEA/g2kCReuTWMybOy
	 e9kMgXUOqW3UwwyVFQ761bzxnOQfaP/6eovvNJxpSzARHzGZQb1GnIp1aHd59+W6NK
	 EMdfJO/Eh6ZSgyGTQasc6XQSX7u3VW26bfthiOLEZ55p8mxx7XMiNmd0IEp6A79uUQ
	 btu50S5KKIwdg==
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
	kernel test robot <lkp@intel.com>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH v4 2/5] i2c: piix4: Depends on X86
Date: Mon, 14 Apr 2025 19:26:55 -0500
Message-ID: <20250415002658.1320419-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415002658.1320419-1-superm1@kernel.org>
References: <20250415002658.1320419-1-superm1@kernel.org>
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

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504120558.sq3IpWdH-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202504120432.0F8lOF3k-lkp@intel.com/
Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
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


