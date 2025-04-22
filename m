Return-Path: <linux-i2c+bounces-10566-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F72A97B40
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 01:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B2193ABF3A
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 23:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC7421D5B7;
	Tue, 22 Apr 2025 23:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ThSsRDHn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8972C21C9EF;
	Tue, 22 Apr 2025 23:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745365717; cv=none; b=PvP/PypnF1QkdVQ4YEhZB9pbldjfvWwDxyI7y58I6AEQYzFzlCfygCN3qGxpMSE7P7lMeepNqllM4vGkh+lVFRftKGKMki0zl1ghAi5aZ26HTrIHs72a+CtoC/jnzzVl2XC8GzwUSqiVTM0Ah1YDOMFvzhzZG2wzA/NbCNY215Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745365717; c=relaxed/simple;
	bh=yhJoZqKamDM9YbH2t7wFeFCnHoO5y9lfY+ztHV+833k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=joAQecw7M+pQ819lqnVCUt8pKdgsx7tNnt2rJSwgoc8ADFae9Jhfuycoeo/jOzRzsfmY8SWMLxwi3qqucrSsTbGsShlJxgiFWZDk4IoaEtKBCtz2+ud5ijkuJsEuePMS0REspw/iLPhWbDjAWcpI2v7g4kugral58m7vdMAbuJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ThSsRDHn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9C3C4CEEC;
	Tue, 22 Apr 2025 23:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745365717;
	bh=yhJoZqKamDM9YbH2t7wFeFCnHoO5y9lfY+ztHV+833k=;
	h=From:To:Cc:Subject:Date:From;
	b=ThSsRDHnXz49Mao1Xb444ViRY71NWAzHVsLHgSkMrh8YrjdXxJyaeE9lBZD22zvTB
	 LTFL8VNQL/sJveyglWi3dQemCzXcu4Ahfsz6eGukk4y7efNg1iJXDry2YBWCvJPbnN
	 c08aM29WW9F0zvFj+HQ2WEpGkQ3u1Wp7EPTyVhTGBZ4Q+2ekOe0pkcHvd//6GN++XX
	 LMKBW4PI7jb24QR6iYx4faM7KErRjnK/DuQEkBnZm906iNtMf+0y83ZqQ7rI6cqe6R
	 ymog9ZaiszM5t0sKqkuvQ7KH+nYRGDnAJE1i4xyAGIcKKnxmjqrwXg0EntUA/D7hBD
	 HaN/iyyiF2YEQ==
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
Subject: [PATCH v5 0/5] AMD Zen debugging documentation
Date: Tue, 22 Apr 2025 18:48:25 -0500
Message-ID: <20250422234830.2840784-1-superm1@kernel.org>
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

Mario Limonciello (4):
  Documentation: Add AMD Zen debugging document
  i2c: piix4: Depends on X86
  i2c: piix4: Move SB800_PIIX4_FCH_PM_ADDR definition to amd/fch.h
  platform/x86/amd: pmc: use FCH_PM_BASE definition

Yazen Ghannam (1):
  x86/CPU/AMD: Print the reason for the last reset

 Documentation/arch/x86/amd-debugging.rst  | 362 ++++++++++++++++++++++
 Documentation/arch/x86/index.rst          |   1 +
 Documentation/arch/x86/resume.svg         |   4 +
 Documentation/arch/x86/suspend.svg        |   4 +
 arch/x86/include/asm/amd/fch.h            |  14 +
 arch/x86/kernel/cpu/amd.c                 |  64 ++++
 drivers/i2c/busses/Kconfig                |   2 +-
 drivers/i2c/busses/i2c-piix4.c            |  18 +-
 drivers/platform/x86/amd/pmc/pmc-quirks.c |   3 +-
 9 files changed, 461 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/arch/x86/amd-debugging.rst
 create mode 100644 Documentation/arch/x86/resume.svg
 create mode 100644 Documentation/arch/x86/suspend.svg
 create mode 100644 arch/x86/include/asm/amd/fch.h

-- 
2.43.0


