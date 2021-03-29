Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65AD34CE28
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 12:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232094AbhC2Kul (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 06:50:41 -0400
Received: from mga02.intel.com ([134.134.136.20]:49544 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231493AbhC2Kuf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 06:50:35 -0400
IronPort-SDR: BOoSU4yhFCy26IbUfA5AvnKxQN/heuyMWmNc9SuKHLnFPNJIwtUcU89Ue4Z6UeQEboJnZZvNjD
 UoMpTazhrZJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="178653625"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="178653625"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 03:50:34 -0700
IronPort-SDR: 0XlGLqXU8l2XV+/lpI4cmAl8Q5ACXLd3o3/HOfHOuzjfZUlrOx9eEoJ2aSkdJSDyIpCgodQmj0
 xfo3ZQwBMHIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="515955819"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2021 03:50:33 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 00/12] i2c: Adding support for software nodes
Date:   Mon, 29 Mar 2021 13:50:35 +0300
Message-Id: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

The old device property API (device_add_properties()) is going to be
removed. These prepare the i2c subsystem and drivers for the change.
The change is fairly trivial in case of i2c. All we need to do is add
complete software nodes to the devices instead of only the device
properties in those nodes.

thanks,

Heikki Krogerus (12):
  i2c: Add support for software nodes
  ARM: davinci: Constify the software nodes
  ARM: omap1: osk: Constify the software node
  ARM: pxa: stargate2: Constify the software node
  ARM: s3c: mini2440: Constify the software node
  platform/x86: intel_cht_int33fe_microb: Constify the software node
  i2c: cht-wc: Constify the software node
  i2c: nvidia-gpu: Constify the software node
  i2c: icy: Constify the software node
  platform/chrome: chromeos_laptop - Prepare complete software nodes
  Input: elantech - Prepare a complete software node for the device
  i2c: Remove support for dangling device properties

 arch/arm/mach-davinci/board-da830-evm.c       |   6 +-
 arch/arm/mach-davinci/board-dm365-evm.c       |   6 +-
 arch/arm/mach-davinci/board-dm644x-evm.c      |   6 +-
 arch/arm/mach-davinci/board-dm646x-evm.c      |   6 +-
 arch/arm/mach-davinci/board-mityomapl138.c    |   6 +-
 arch/arm/mach-davinci/board-sffsdr.c          |   6 +-
 arch/arm/mach-omap1/board-osk.c               |   6 +-
 arch/arm/mach-pxa/stargate2.c                 |   6 +-
 arch/arm/mach-s3c/mach-mini2440.c             |   6 +-
 drivers/i2c/busses/i2c-cht-wc.c               |   6 +-
 drivers/i2c/busses/i2c-icy.c                  |  32 ++----
 drivers/i2c/busses/i2c-nvidia-gpu.c           |   6 +-
 drivers/i2c/i2c-boardinfo.c                   |  11 --
 drivers/i2c/i2c-core-base.c                   |  14 +--
 drivers/input/mouse/elantech.c                |   6 +-
 drivers/platform/chrome/chromeos_laptop.c     | 100 +++++++++++-------
 .../platform/x86/intel_cht_int33fe_microb.c   |   6 +-
 include/linux/i2c.h                           |   4 +-
 18 files changed, 142 insertions(+), 97 deletions(-)

-- 
2.30.2

