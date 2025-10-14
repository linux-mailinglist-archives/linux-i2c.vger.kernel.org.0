Return-Path: <linux-i2c+bounces-13470-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A35BD6E88
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 03:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C7A754E4FBD
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 01:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588091D7E5C;
	Tue, 14 Oct 2025 01:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSi7BBDk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA0D18C008;
	Tue, 14 Oct 2025 01:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760403916; cv=none; b=rk7C9LehJRJUXlen+o7q+N8LJXLzex0jhw5sF3HQJmH3wr/jguMRhEcKbPPnGmjOmlSHrz2ug8BVTsJGrFi9BG9nJn9UcIc2CWPb19NbyLpz7fca5nPd6FxGhw4jV8DnLjBVYYBQzIUVKXY+EFVSIrd4yEg+upJf8qISC+4fbV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760403916; c=relaxed/simple;
	bh=ndQm4UzYBuDHMgphNA4p9GD5ekR22NioOEjh7/srdSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HwUxP5bXFaa0v/yNlRvk7jTLK2fAY257e4nnZncllRt6Ebeca0Vv5C4Rj0ELh0+Z6w+j64Ib8P2c45U+YCM8Ga0lr0X5ztloi7qkV9+yHQF0EXRIiOuPTfhNuKAvJFNCq9eye2uybZmH5Q7EEcl3hT08yCDMFT0UkmY05r7gdMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSi7BBDk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8464C4CEE7;
	Tue, 14 Oct 2025 01:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760403915;
	bh=ndQm4UzYBuDHMgphNA4p9GD5ekR22NioOEjh7/srdSk=;
	h=From:Date:Subject:To:Cc:From;
	b=lSi7BBDkBR+JVDEwlbgALi5xW1zE3TZKT8E4jUYUbFJ4Ai5vlPp/D8p+yr6nhw6j2
	 lsGnLbbLhlArf8yYnfkBP+NTp0s6Va2VjdYFwEpa5qbwFc/p8CwPyW21CjDziZsUcn
	 QQAz5hHTrZVVrEvapsfd7g02XHTUNu61biccZgtL4kYHg6oNTHr7dLxsdHVycLwPr/
	 FJ4WYJyax/eymqSfTsPtZsiowR2AO5XZaS+bOyp0MsnEoJzJgW6uxel/nULwX/84j7
	 O0p7e2o8HsdU/hGUeStpNSM9Oqd3ym5/7dSMAe9ZWrqb/FYGZpEYJXk+TnNTAHBVMV
	 02+ZCSYDeYgfQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 13 Oct 2025 18:05:03 -0700
Subject: [PATCH] i2c: designware: Remove i2c_dw_remove_lock_support()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-dw_i2c_plat_remove-avoid-objtool-no-cfi-warning-v1-1-8cc4842967bf@kernel.org>
X-B4-Tracking: v=1; b=H4sIAL+h7WgC/x3NQQrDIBBA0auEWXdAbbPpVUqRiY7plNQJGkwh5
 O6VLt/m/wMqF+EK9+GAwk2qaO6wlwHCi/LMKLEbnHGjNfaKcffigl8X2nzhjzZGaioRdXpvqgt
 mxZAEdypZ8oxjcuZmmCgGB726Fk7y/R8fz/P8AQdONQmBAAAA
X-Change-ID: 20251013-dw_i2c_plat_remove-avoid-objtool-no-cfi-warning-5f2040eaadc2
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Kees Cook <kees@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3660; i=nathan@kernel.org;
 h=from:subject:message-id; bh=ndQm4UzYBuDHMgphNA4p9GD5ekR22NioOEjh7/srdSk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBlvF56ofnGjlX2zyJ676xvNL2a0l/NmBW3Mf7Hy+mntK
 T4vAhg2dpSyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJvMtjZGj2kbBI5FfZPOXx
 wvmeIiouf1/8Wr79nkRsakawf1/9faCKHTMz20w+PNwQsi40YmXgvZxa0dIF3xbnaaXMtHEvjJ7
 MBwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When building certain configurations with CONFIG_FINEIBT=y after
commit 894af4a1cde6 ("objtool: Validate kCFI calls"), there is a
warning due to an indirect call in dw_i2c_plat_remove():

  $ cat allno.config
  CONFIG_ACPI=y
  CONFIG_CFI=y
  CONFIG_COMMON_CLK=y
  CONFIG_CPU_MITIGATIONS=y
  CONFIG_I2C=y
  CONFIG_I2C_DESIGNWARE_BAYTRAIL=y
  CONFIG_I2C_DESIGNWARE_CORE=y
  CONFIG_I2C_DESIGNWARE_PLATFORM=y
  CONFIG_IOSF_MBI=y
  CONFIG_MITIGATION_RETPOLINE=y
  CONFIG_MODULES=y
  CONFIG_PCI=y
  CONFIG_X86_KERNEL_IBT=y

  $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 clean allnoconfig vmlinux
  vmlinux.o: warning: objtool: dw_i2c_plat_remove+0x3c: no-cfi indirect call!

With this configuration, i2c_dw_semaphore_cb_table has the BAYTRAIL
member and the sentinel (i.e., 2 members), both of which have an
implicit

  .remove = NULL,

so Clang effectively turns i2c_dw_remove_lock_support(), which is later
inlined into dw_i2c_plat_remove(), into:

  static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
  {
      if (dev->semaphore_idx > 2)
          (*NULL)(dev):
  }

which is not necessarily problematic from a logic perspective (as the
code was not bounds checking semaphore_idx so an out of bounds index
could already crash) but objtool's new __nocfi indirect call checking
trips over Clang dropping the kCFI setup from a known NULL indirect
call.

While it would be possible to fix this by transforming the initial check
into

  if (dev->semaphore_idx < 0 || dev->semaphore_idx >= ARRAY_SIZE(i2c_dw_semaphore_cb_table))

the remove member is unused after commit 440da737cf8d ("i2c: designware:
Use PCI PSP driver for communication"), so i2c_dw_remove_lock_support()
can be removed altogether, as it will never actually do anything.

Closes: https://github.com/ClangBuiltLinux/linux/issues/2133
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/i2c/busses/i2c-designware-core.h    |  1 -
 drivers/i2c/busses/i2c-designware-platdrv.c | 11 -----------
 2 files changed, 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 347843b4f5dd..d50664377c6b 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -330,7 +330,6 @@ struct dw_i2c_dev {
 
 struct i2c_dw_semaphore_callbacks {
 	int	(*probe)(struct dw_i2c_dev *dev);
-	void	(*remove)(struct dw_i2c_dev *dev);
 };
 
 int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 34d881572351..cff7e03dea7b 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -197,15 +197,6 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
 	return 0;
 }
 
-static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
-{
-	if (dev->semaphore_idx < 0)
-		return;
-
-	if (i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove)
-		i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove(dev);
-}
-
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
 	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
@@ -339,8 +330,6 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 
 	i2c_dw_prepare_clk(dev, false);
 
-	i2c_dw_remove_lock_support(dev);
-
 	reset_control_assert(dev->rst);
 }
 

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251013-dw_i2c_plat_remove-avoid-objtool-no-cfi-warning-5f2040eaadc2

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


