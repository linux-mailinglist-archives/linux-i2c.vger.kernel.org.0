Return-Path: <linux-i2c+bounces-3174-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5A88B2B25
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 23:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 074DEB22152
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 21:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27C515575B;
	Thu, 25 Apr 2024 21:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ubFMABjg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBED155723;
	Thu, 25 Apr 2024 21:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081484; cv=none; b=oh6pAN6w/UhjV5RNzvfIl4eBo6Mf0ouby+u1kVOkjOhMAYy8eIzSOScJFctgNBtVdNqAjnG4lwVc3bgW//CIqksNGcfdJerxVNhkKOATthg2r2VmCmaiqxU6G30UTpsrN1QjADX4Kui2RClbW5AnzrG/Fwr/DxIgsrenS4kqPPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081484; c=relaxed/simple;
	bh=evR01h6uW8bcnt8GR3szNRBfqTX5f8ZPUqLm/Whgqjw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QSmJqr7dcewpQzX96aGvQvytoa+1SGZNbYFqYWsvQBBGUdGZqqndgnFJ3z7DpxFrHkXBNtXvMdsLTRx1ZOo2+2YPUuCs8Res9ITzkWnmG/GYcaSIOWaTNDpINGjgsTZOZwtU7lLgvS0EfNmzDTOZQoVUsviq9VWsB4D0tqxw0bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ubFMABjg; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E5C42C00281F;
	Thu, 25 Apr 2024 14:44:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E5C42C00281F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1714081482;
	bh=evR01h6uW8bcnt8GR3szNRBfqTX5f8ZPUqLm/Whgqjw=;
	h=From:To:Cc:Subject:Date:From;
	b=ubFMABjg5RcCJeR1RAi3GfQvCa2u9TwzWhMUTyY2GXNpQEjrc1mXyr17DaUPbyB2r
	 e4fYm+IWbU6Tnm6Vyptniql9Z9d/koH346bmfW1nJAmdsi2M1ATHiERVThFrdG/Yw/
	 /PbWCZW1TH4knO4U9f3Z2PPnSaCc3WkB9LjEySys=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id D1DA218041CAC4;
	Thu, 25 Apr 2024 14:44:39 -0700 (PDT)
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
Subject: [PATCH v3 0/5] Define i2c_designware in a header file
Date: Thu, 25 Apr 2024 14:44:33 -0700
Message-Id: <20240425214438.2100534-1-florian.fainelli@broadcom.com>
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

Given the dependency on the two other patches above, it would make sense
to route this via the networking tree, or wait until a v6.9-rc
containing the above two changes gets merged into one of the i2c/mfd
trees.

Changes in v3:

- incorporate Andy's change removing the MODULE_ALIAS
- created a separate inclusion group as requested by Andy
- changed the string format in txgbe_phy.c

Changes in v2:

- avoid changing i2c-designware-pcidrv.c more than necessary
- move constant to include/linux/platform_data/i2c-designware.h
- add comments as to how this constant is used and why

Andy Shevchenko (1):
  i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()

Florian Fainelli (4):
  i2c: designware: Create shared header hosting driver name
  mfd: intel-lpss: Utilize i2c-designware.h
  mfd: intel_quark_i2c_gpio: Utilize i2c-designware.h
  net: txgbe: Utilize i2c-designware.h

 MAINTAINERS                                    |  1 +
 drivers/i2c/busses/i2c-designware-pcidrv.c     |  2 --
 drivers/i2c/busses/i2c-designware-platdrv.c    | 12 +++++++++---
 drivers/mfd/intel-lpss.c                       |  3 ++-
 drivers/mfd/intel_quark_i2c_gpio.c             |  6 ++++--
 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c |  6 ++++--
 include/linux/platform_data/i2c-designware.h   | 12 ++++++++++++
 7 files changed, 32 insertions(+), 10 deletions(-)
 create mode 100644 include/linux/platform_data/i2c-designware.h

-- 
2.34.1


