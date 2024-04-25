Return-Path: <linux-i2c+bounces-3117-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3A68B17F7
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 02:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC857285F58
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 00:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F7B1103;
	Thu, 25 Apr 2024 00:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="OyS2bB6v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E9C80C;
	Thu, 25 Apr 2024 00:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714004812; cv=none; b=dNoGujq+BM+tdgMFlLUARWVI+HxL8hLFRz2iClIyj3pGe5eWrs5UgsRt2yO1RVh25PuISkxQ2tPggALCq4a2cqA+oWOE10c85+5c+GsD7MWqS2/yDgm0WCku+HobnL8SoKNCBdACTpUgsmDJ9S9E1L55o7n9AYjEdoMdnL6PHyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714004812; c=relaxed/simple;
	bh=HaoBt4MFIs7rbpfYTrZqabeZi67RiKEBJZpjORx5boU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JoLOJomGEA+TSdrMk9o+x8WLMo2tHb7emA/HAdiq91o9QaSOhciaP5j0gzKFKZz9mWyIwRGxa6q0BB+edj8izBYi0u1IHhqDJeBOebnl4t/nbAYLXyaIH6rJUBKUWDjlFsN3azXy3r7+KBJ1A4BLMSXglhL1fCjd9meoqiaGOvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=OyS2bB6v; arc=none smtp.client-ip=192.19.144.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 73625C000C69;
	Wed, 24 Apr 2024 17:26:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 73625C000C69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1714004804;
	bh=HaoBt4MFIs7rbpfYTrZqabeZi67RiKEBJZpjORx5boU=;
	h=From:To:Cc:Subject:Date:From;
	b=OyS2bB6vg2HUhY6PRyT79pN/UZlr0BgM1GlLS13HMVzc464bjkWvQCKkN1FQZkZpD
	 mZV11MHPOVHTuVBtNtIpjgTWSKz3JFHJjHChAas8yJYj6mJJkVH9JmemPJ9b4pZMU8
	 L5tuzz5C9sk9BEAqaQRaIV/PMSX1kyBZuj553cLM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 7AD5118041CAC4;
	Wed, 24 Apr 2024 17:26:42 -0700 (PDT)
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
Subject: [PATCH v2 0/4] Define i2c_designware in a header file
Date: Wed, 24 Apr 2024 17:26:38 -0700
Message-Id: <20240425002642.2053657-1-florian.fainelli@broadcom.com>
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

Changes in v2:

- avoid changing i2c-designware-pcidrv.c more than necessary
- move constant to include/linux/platform_data/i2c-designware.h
- add comments as to how this constant is used and why

Florian Fainelli (4):
  i2c: designware: Create shared header hosting driver name
  mfd: intel-lpss: Utilize i2c-designware.h
  mfd: intel_quark_i2c_gpio: Utilize i2c-designware.h
  net: txgbe: Utilize i2c-designware.h

 MAINTAINERS                                    |  1 +
 drivers/i2c/busses/i2c-designware-pcidrv.c     |  3 ++-
 drivers/i2c/busses/i2c-designware-platdrv.c    |  5 +++--
 drivers/mfd/intel-lpss.c                       |  3 ++-
 drivers/mfd/intel_quark_i2c_gpio.c             |  5 +++--
 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c |  7 ++++---
 include/linux/platform_data/i2c-designware.h   | 11 +++++++++++
 7 files changed, 26 insertions(+), 9 deletions(-)
 create mode 100644 include/linux/platform_data/i2c-designware.h

-- 
2.34.1


