Return-Path: <linux-i2c+bounces-3081-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 851658AFCBD
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 01:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 243CD1F2440B
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 23:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E25548F1;
	Tue, 23 Apr 2024 23:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="i7ghu4dq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936DC502B3;
	Tue, 23 Apr 2024 23:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713915397; cv=none; b=hnVmMQG/mflTBZxFF9e68b27O7txPi8Srgn5ulpR/6I7nZUUfnU7HwCRZm5XouAi3RqXhKBeMb+nIRo4UTYQ6fv9khq7yO1j3aTS3u9zKcpoRZr+jLu/r4u3sU3tMO8OYkzkisf6+aidiafp3btHbpM/OxzsKyUW1l4sCspuWaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713915397; c=relaxed/simple;
	bh=hznnnD58QA4JaaOj/qkrk9nSWrFuvXnrqyI2HHl4VyU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tkYATi8a0RcmvipH3q7dpToEolJcSskHLdCB0yMpF7lFklRV4pJSfOkpVF5ZzDxo0Stt8OQjIt29SzC3J6Sf/sJc8+wHyzq1c1vu+Mz7cvVUAQCsM2WZAnSHa8X7VufLz4SaSKcHbARvDRMVtvm+2RETWiyk2y2uT0oNuKXYABI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=i7ghu4dq; arc=none smtp.client-ip=192.19.144.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id C1DACC001522;
	Tue, 23 Apr 2024 16:36:28 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com C1DACC001522
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1713915388;
	bh=hznnnD58QA4JaaOj/qkrk9nSWrFuvXnrqyI2HHl4VyU=;
	h=From:To:Cc:Subject:Date:From;
	b=i7ghu4dqP/uBircYXR9RrIasZUOawqRvhPZcqLlerah6kWynkZpFiQzFxrJ1XF8kb
	 bXK6Pro3FOSiwtELXrIiAHzPY0QYaDFrQwIF5Bvag54cs8iGHryuEX043TeVSPkM0t
	 ZJtKvXJeJuoReurjab7hbScHyTub7xE72+DwE3K8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id CB29A18041CAC4;
	Tue, 23 Apr 2024 16:36:26 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Duanqiang Wen <duanqiangwen@net-swift.com>,
	linux-i2c@vger.kernel.org (open list:SYNOPSYS DESIGNWARE I2C DRIVER),
	netdev@vger.kernel.org (open list:WANGXUN ETHERNET DRIVER)
Subject: [PATCH 0/4] Define i2c_designware in a header file
Date: Tue, 23 Apr 2024 16:36:18 -0700
Message-Id: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series depends upon the following two patches being applied:

https://lore.kernel.org/all/20240422084109.3201-1-duanqiangwen@net-swift.com/
https://lore.kernel.org/all/20240422084109.3201-2-duanqiangwen@net-swift.com/

There is no reason why each driver should have to repeat the
"i2c_designware" string all over the place, because when that happens we
see the reverts like the above being necessary.

Florian Fainelli (4):
  i2c: designware: Create shared header hosting driver name
  mfd: intel-lpss: Utilize i2c-designware.h
  mfd: intel_quark_i2c_gpio: Utilize i2c-designware.h
  net: txgbe: Utilize i2c-designware.h

 MAINTAINERS                                    | 1 +
 drivers/i2c/busses/i2c-designware-pcidrv.c     | 5 +++--
 drivers/i2c/busses/i2c-designware-platdrv.c    | 5 +++--
 drivers/mfd/intel-lpss.c                       | 3 ++-
 drivers/mfd/intel_quark_i2c_gpio.c             | 5 +++--
 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c | 7 ++++---
 include/linux/i2c-designware.h                 | 7 +++++++
 7 files changed, 23 insertions(+), 10 deletions(-)
 create mode 100644 include/linux/i2c-designware.h

-- 
2.34.1


