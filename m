Return-Path: <linux-i2c+bounces-5711-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4720F95C38C
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 05:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA082B22324
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 03:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145C22B9C7;
	Fri, 23 Aug 2024 03:04:45 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADC326AEA;
	Fri, 23 Aug 2024 03:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724382284; cv=none; b=cVP2QnCRXYWOvmFcqa+fcAIBtif8oLMuQ9ICRLjjh/5Jp1e9Gxtdv5jkXy1/FgvUvY3lW77L5bsx/1FD/WfScmJDcZELAYEvY2yPDXqt0QMAhtj8iT8n07dGcLJt1eI1UP5GPhoqsZdtDKAhnju0cQgzELTzFnn/bwsiFXL+mD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724382284; c=relaxed/simple;
	bh=OHgdvl9d7GYZtIebuebfSTr291afQmBqnRZ4LhhcUeg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oVnhLRhaKcQvlk9pgwx9UsJsbKU3TP+jiX4Kn8KWDUHBoyuW+WUmzTG4M5jy7BBevvBY/NR6mQCfoTolJNaL+lauzJpoAOhaT6hK6sZ4OjqR5E3c2ArIEQvDsWSzBfH3wnTm3w6IU6xAahNc0Th0M99pSLHFXPy+X2nIItvIN4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com; spf=pass smtp.mailfrom=trustnetic.com; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trustnetic.com
X-QQ-mid: bizesmtpsz10t1724382249tbz91a
X-QQ-Originating-IP: ZbFEqJHAoW11EI4I2ApvNMHIbRcdAjDbQ2piM8VQsTw=
Received: from wxdbg.localdomain.com ( [125.118.254.234])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Aug 2024 11:03:57 +0800 (CST)
X-QQ-SSF: 0001000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7870320542284665189
From: Jiawen Wu <jiawenwu@trustnetic.com>
To: andi.shyti@kernel.org,
	jarkko.nikula@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com,
	jsd@semihalf.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	rmk+kernel@armlinux.org.uk,
	piotr.raczynski@intel.com,
	andrew@lunn.ch,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org
Cc: mengyuanlou@net-swift.com,
	duanqiangwen@net-swift.com,
	Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH net 0/3] Add I2C bus lock for Wangxun
Date: Fri, 23 Aug 2024 11:02:39 +0800
Message-Id: <20240823030242.3083528-1-jiawenwu@trustnetic.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz8a-1

Sometimes the driver can not get the SFP information because the I2C bus
is accessed by the firmware at the same time. So we need to add the lock
on the I2C bus access. The hardware semaphores perform this lock.

Jiawen Wu (3):
  net: txgbe: add IO address in I2C platform device data
  i2c: designware: add device private data passing to lock functions
  i2c: designware: support hardware lock for Wangxun 10Gb NIC

 drivers/i2c/busses/Makefile                   |  1 +
 drivers/i2c/busses/i2c-designware-amdpsp.c    |  4 +-
 drivers/i2c/busses/i2c-designware-baytrail.c  | 14 +++-
 drivers/i2c/busses/i2c-designware-common.c    |  4 +-
 drivers/i2c/busses/i2c-designware-core.h      |  6 +-
 drivers/i2c/busses/i2c-designware-platdrv.c   |  3 +
 drivers/i2c/busses/i2c-designware-wx.c        | 65 +++++++++++++++++++
 .../net/ethernet/wangxun/txgbe/txgbe_phy.c    |  5 ++
 include/linux/platform_data/i2c-wx.h          | 11 ++++
 9 files changed, 105 insertions(+), 8 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-designware-wx.c
 create mode 100644 include/linux/platform_data/i2c-wx.h

-- 
2.27.0


