Return-Path: <linux-i2c+bounces-10333-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A87A8906D
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 02:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9692D179EFE
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 00:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099F846426;
	Tue, 15 Apr 2025 00:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S6M1XjD2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A770722EE5;
	Tue, 15 Apr 2025 00:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744676829; cv=none; b=CJGSiAR4vbjqA/omrgE5YQ7WWiO9BWomS+sJh3Qt/Wz2akR4SAsYk7qVBrYGvlyFMWjKqQvJBDIej4eXkwEmMPPdKrDT+9hVBxpfJAzFGifWRxhWvZzHf4pIoreODhk1Fp6UBwho4anav1UWEHAGykCZiuctSC2dMKD9x/KS0RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744676829; c=relaxed/simple;
	bh=VDrgLWXQk8FiV60XkK5+r/FpnVo7AmyeJHgjunrOGqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PltIH5Cmbx08oWWRmYDXVhAz7PoGohRk++N6blBB8jNWfDHvQ3Qaq9zfallqObN63i8KXGQSUYR5MP3eEP78WgdYssqXwEcSHIcb0e7iuWw8rXU5nvPu+FCx6kux64vXO4RL+fMNNY1UgN8UCZUUxCd/q3f9riyKQ/xjCCl1Y1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6M1XjD2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E8DC4CEE2;
	Tue, 15 Apr 2025 00:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744676829;
	bh=VDrgLWXQk8FiV60XkK5+r/FpnVo7AmyeJHgjunrOGqI=;
	h=From:To:Cc:Subject:Date:From;
	b=S6M1XjD2/2UKgoB4q5rK2dKcAs4hmcZ/FWUuJ21hraF6Lcpsvi8luBmZFc9ZmA2Bv
	 iN6Sr5GPRtIlyyI+NJxjRs0FrkGzvk9qYc+Qn3gY1k+y4uZuuffLsPIHa3Z3l9n6YO
	 k2cCIuuYcZ+uQqiUcJcWerHTwWRcMEo4hxXO6UiHlYYh9gz4sNsaxSEdNnpPVdY94B
	 sawIjcZaNX+CuudHx4hZYrKCD7R0WlsGe9UFbMWkIn2YERWGWeNLo0wqTbZ4KmM/DN
	 nAm6dOx1RhCek29pdhlSwmPt2SgcevVTTEGziKiN67bww5wH9SU3VDAmA7cHTrWz8Y
	 alInemLFb0Kjw==
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
	platform-driver-x86@vger.kernel.org (open list:AMD PMC DRIVER)
Subject: [PATCH v4 0/5] AMD Zen debugging documentation
Date: Mon, 14 Apr 2025 19:26:53 -0500
Message-ID: <20250415002658.1320419-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

Introduce documentation for debugging some issues on AMD zen hardware.
As one of the debugging techniques read and add information for
S5_RESET_STATUS register.

v4:
 * Move documentation file
 * Feedback on documentation (see patch)
 * Move headers to fch.h
 * Use suggestion from Ingo about the loop for patch 5
 * Add patch for lkp failure

Mario Limonciello (4):
  Documentation: Add AMD Zen debugging document
  i2c: piix4: Depends on X86
  i2c: piix4: Move SB800_PIIX4_FCH_PM_ADDR definition to amd/fch.h
  platform/x86/amd: pmc: use FCH_PM_BASE definition

Yazen Ghannam (1):
  x86/CPU/AMD: Print the reason for the last reset

 Documentation/arch/x86/amd-debugging.rst  | 312 ++++++++++++++++++++++
 Documentation/arch/x86/index.rst          |   1 +
 Documentation/arch/x86/resume.svg         |   4 +
 Documentation/arch/x86/suspend.svg        |   4 +
 arch/x86/include/asm/amd/fch.h            |  14 +
 arch/x86/kernel/cpu/amd.c                 |  64 +++++
 drivers/i2c/busses/Kconfig                |   2 +-
 drivers/i2c/busses/i2c-piix4.c            |  18 +-
 drivers/platform/x86/amd/pmc/pmc-quirks.c |   3 +-
 9 files changed, 411 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/arch/x86/amd-debugging.rst
 create mode 100644 Documentation/arch/x86/resume.svg
 create mode 100644 Documentation/arch/x86/suspend.svg
 create mode 100644 arch/x86/include/asm/amd/fch.h

-- 
2.43.0


