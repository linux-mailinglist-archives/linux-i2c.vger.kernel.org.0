Return-Path: <linux-i2c+bounces-10254-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A25A84DAF
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 22:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 507D19A0ED7
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 20:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9335D28C5CE;
	Thu, 10 Apr 2025 20:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6qWwP2K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466AA19DF99;
	Thu, 10 Apr 2025 20:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315338; cv=none; b=qtjVguppqXXPfyB2GGZc9D7WYMKGHACIri+tkYWgn6GCxdBxaUh7S1p5ts0mFR2mNeTsUa1KO84LKwhNUv3+jlbny9vIFzBUS1LSrHV6BfpYAd4ggKTM6phVOxAz/7vxlXgWmmPFsbFlD6PL7udQSYa7cbEuSBz0xUjTmocT2YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315338; c=relaxed/simple;
	bh=sbiJCE73U885kOZ2/LQ9Zkp6JvO2nK74WGrxsvwKbs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CaZQTeqWgAXOt7xNNdkr6DcBrK+A96etISO3EhKYzg2e+bUWf1lH0l0d2pYO7lod88Era3tlHlBUq5N5UjQWjVTMZ+TClaOswAFORcjH/vHqDRMQoXi33bTOvezvaz17bp75KIlrcq6W7DswAfCMVWEjYk7sRl1WA8rT9civpwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6qWwP2K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E69C4CEDD;
	Thu, 10 Apr 2025 20:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744315337;
	bh=sbiJCE73U885kOZ2/LQ9Zkp6JvO2nK74WGrxsvwKbs0=;
	h=From:To:Cc:Subject:Date:From;
	b=Q6qWwP2Kr03GOIaLSne5ITkRqyvduv9B1zzDuoKBgwNZFJ8jcK8b+29yEkLofOubY
	 7Mf5DYp939Vfaf8fjqTZu32wUSMU5j3KhirfhtlVLJRI4VMB5027TV0j+IR4NoVRos
	 7gU6gRBS4nmTgeIUlznmd6ymdQ0O2/IEqFaxh97gC6A/b6FoqLNMA0gy8DPNkIeTmL
	 S29B3Owr/G7ipQb+zMio80yapmWK2j6JxQ7ljZOoAph2fdDdczUjGPuyPJbwxyYlu4
	 bWExaq+b+7zGIg+htKttKOsStGaPYfk1J3lYYflYBi0xfU+HJsDj47HYVGr0gw92sC
	 Q18ty0Y3umuxg==
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
Subject: [PATCH v3 0/4] AMD Zen debugging documentation
Date: Thu, 10 Apr 2025 15:01:58 -0500
Message-ID: <20250410200202.2974062-1-superm1@kernel.org>
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

v3:
 * Introduce patches to have a common define for a register base used
   in 3 different places.
 * Take into account feedback on how to show S5_RESET_STATUS info

Mario Limonciello (3):
  Documentation: Add AMD Zen debugging document
  i2c: piix4: Move SB800_PIIX4_FCH_PM_ADDR definition to amd_node.h
  platform/x86/amd: pmc: use FCH_PM_BASE definition

Yazen Ghannam (1):
  x86/CPU/AMD: Print the reason for the last reset

 Documentation/admin-guide/amd/index.rst   | 312 ++++++++++++++++++++++
 Documentation/admin-guide/amd/resume.svg  |   4 +
 Documentation/admin-guide/amd/suspend.svg |   4 +
 Documentation/admin-guide/index.rst       |   1 +
 arch/x86/include/asm/amd_node.h           |   3 +
 arch/x86/kernel/cpu/amd.c                 |  51 ++++
 drivers/i2c/busses/i2c-piix4.c            |  12 +-
 drivers/platform/x86/amd/pmc/pmc-quirks.c |   5 +-
 8 files changed, 385 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/admin-guide/amd/index.rst
 create mode 100644 Documentation/admin-guide/amd/resume.svg
 create mode 100644 Documentation/admin-guide/amd/suspend.svg

-- 
2.43.0


