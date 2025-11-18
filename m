Return-Path: <linux-i2c+bounces-14131-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 313B2C67AB2
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 07:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 527C82ABC0
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 06:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BFF2DAFDD;
	Tue, 18 Nov 2025 06:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="H2Fg1GtM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00402DC346
	for <linux-i2c@vger.kernel.org>; Tue, 18 Nov 2025 06:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763446204; cv=none; b=VicHf/brurkLr4GjoW0OHSI6nV3i9YUyBqjGe2Ibqi6AAFJVVCwM7Tn6OSm5d95YZDoWZqM13ufoGYWDL0C0NB4DmZLsVrjxcf4tCNFCBMY14DGpMC5iroNPYeT8alEqtNn+dliYJYhEf5vpzvwRhMGyCHR6RvQAPtgDdxBUWVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763446204; c=relaxed/simple;
	bh=pRelXNcNN37ZM7O2BV0S35r975DWh+ueu5XV8SMlrBs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BOSmyqoEQGbYdAakPhrSpy0A293wRRTLsrCCNuFztLxhSymlSUvurZ5aC5gTYuacKU4PEzBHYJtxa/tQct4DwlY12Y82PnslpqdCD2E1fvzpGZmr+vsMEfBXUiFiyYaYPYc9EXCLVkwpg+x7ebJJRcZaxGCxDYGkl9tgvg3g3Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=H2Fg1GtM; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763446098;
	bh=hzOfPR919VrIHi152EWvE2Bp6APdazRwuR4ex5e3Hbw=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=H2Fg1GtMTxFLEaF4B0mfohNowKmQClOAYZVoFvQUxb+1c1qkZ1dTqefDsEj9aatel
	 KxeSVtbfGYZbHK2mOpn/sbiN0YX9fYVH4SvLiRmnDyfPdTmVjmJOYnPnrYVJRCkLPf
	 0LQ/dmQAFy/qo7keyCQ6w7zIhN/xWChhvEHy5JAA=
X-QQ-mid: zesmtpsz8t1763446089t05f7671e
X-QQ-Originating-IP: gfIiIDlmEa/nlrPhq5QOGcUUZldrQI1NIAYC/9iO1aU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Nov 2025 14:08:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12746656525817130818
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v3 0/4] fix the SpacemiT P1 Kconfig and resend the K1 I2C
 ILCR patch.
Date: Tue, 18 Nov 2025 14:08:04 +0800
Message-Id: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEQNHGkC/23MSw6CMBSF4a2Qjr2ktzwsjtyHcUBLCzfKIy0SD
 GHvFhITow7/k5xvYd44Mp6dooU5M5GnvguRHCKmm7KrDVAVmgkuMuQCYUC46b6zVIOlGfJKqKy
 oeKKkZeE0OBPmHbxcQzfkx949d3/CbX1T4puaEBA0pqLK0KDi8nyn7jHHfii1aWmMdd+yzZzEp
 3P8cQRwSItcSptwVZr/zrquL7HQGtj9AAAA
X-Change-ID: 20251021-p1-kconfig-fix-6d2b59d03b8f
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763446086; l=1635;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=pRelXNcNN37ZM7O2BV0S35r975DWh+ueu5XV8SMlrBs=;
 b=jSJ9sJxE6RX5av6jM6BMhL0iGQaZppaNPJMQJNNU9u9qR01cb/m3k5HQIqRhqBGGXg1KdD1y6
 xz4wUtB+mffAgOu9cOkDzl1KmjRdAqngIzXfCp7HEC7e5lwlCuEVn7z
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MmCmH9jyqHC2wcJjL4RwvH1l3Wa5bs4XKd+PVMud4HPY/PNAmETLJziZ
	ptHKTSn7NPDAlZn9ZMKA5rtCbY5LpEVAlXjLbsVrXgpOZFgyjfo87ywP1nuIe6vItEmse/6
	/GrOCbE4wR6d72x+Aak4/lAGl4wf8JkW2PoWY2i//hPqW7KYSb89TISPsTJrTCWwSNDh0jD
	Fa/fFfaDzCuG8WNtER3Q75PhWCtuASiIYqTxk5tw7Of1NiKqL1AE0brIlENVdTJubMEten7
	941CWwWqSGzEbUYvoZOplLGkRSglJ/OZ3x5/2EKjs3nBOa3i5rRC7ao+WSUZymOEbmYdSAJ
	ieSwO5kbIwUojaJh/AzRJOJNvj2semMX374+GCRVtUblYhgr1jnuWNhk5AFXadUGqR+QEUT
	66sd7eQHv4ACr9NINuyRun+jpRXBWT+286rA8m9KQMa/h9SzTo+wAHldUFKT0v9HJyYPNLm
	TLUHsJy/PMv3OHDKzQ+MCopOfQOoCifgWY37NyFUAWhET9qlJJc08K/790AIUzrnYuYiKvx
	N8ZYDbrV3pMel+oMuVJTQN29OjSsV85T/+ZUf1j25qFNRD91bin87GeiJRdU2Ro+IpEs36G
	eY9ap4zvUNlmvk9bY1DT9M6cBQzLm9xWJT0hTKWODOTNxnKp/hdI0FFpjTBGt7vMVgDIHOk
	bFU67EkDQZn5pc2gN0/461lfePxqqbx9PMfnEXEwVH+aIeEOvsJ3+lrYuAx/FOl/78YSNX7
	tm6ERKDBrZTO6ZlWB2xFVhdU1xhc83gpS15OFzoWDtQqR+lRn2nuz/MD+Mph6dgkBe9n4sW
	FtUy7T/1lyLz5/wJ4ATnHjrRmQKHoBwO2i9RGCXrnthNgo5E7fSxoUIhvA3PyAoG4ENaYsR
	CGnCqDY0RZZYzlSx/sEntX+qpGAkct1nj9hLV+IgF91ZkoZ26rUKmfH5bn+97EouEi92B6k
	mkrZocpm5XWgtjrz+FgXWsqMOFTas4vLLkpTgN5p7WwHPmxKqBsIDTBci8R+orKTVcxaaed
	A3sYNrBUWmOrVVgnvUd0Wp4aGZQYkQwHSv0M/JZyuRbrn6wYhZax0h/Gi22rK6HExsNWMaE
	+uL3b0UB9ebtSiuY+3eZ72UBlji+iQV3Q5dPsQ/tcxkcuETlz4SgHwoHeyewbHQzud0xozs
	ednI
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

Since P1 Kconfig directly selects K1_I2C, after the I2C ILCR patch was
merged, the driver would fail [1] when COMMON_CLK was not selected.

This series fixes the P1 Kconfig and resends the I2C ILCR patch(This
patch has reverted by maintainer [2]).

Now, P1 Kconfig patch has been merged[3], so I2C ILCR patch can be
merged as well.

In addition, the Kconfig for P1's two subdevices, regulator and RTC,
has been updated to use 'depends on MFD_SPACEMIT_P1' instead of 'select' and
change default value from `ARCH_SPACEMIT` to `MFD_SPACEMIT_P1`.

Link: https://lore.kernel.org/oe-kbuild-all/202510202150.2qXd8e7Y-lkp@intel.com/ [1]
Link: https://lore.kernel.org/all/sdhkjmi5l2m4ua4zqkwkecbihul5bc2dbmitudwfd57y66mdht@6ipjfyz7dtmx/ [2]
Link: https://lore.kernel.org/all/176244506110.1925720.10807118665958896958.b4-ty@kernel.org/ [3]

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (4):
      i2c: spacemit: configure ILCR for accurate SCL frequency
      rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
      regulator: spacemit: MFD_SPACEMIT_P1 as dependencies
      mfd: simple-mfd-i2c: add default value

 drivers/i2c/busses/Kconfig  |   2 +-
 drivers/i2c/busses/i2c-k1.c | 159 ++++++++++++++++++++++++++++++++++++++++----
 drivers/mfd/Kconfig         |   1 +
 drivers/regulator/Kconfig   |   5 +-
 drivers/rtc/Kconfig         |   4 +-
 5 files changed, 151 insertions(+), 20 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251021-p1-kconfig-fix-6d2b59d03b8f

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


