Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3F3C41BF11
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 08:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244230AbhI2GY5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 02:24:57 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:55855 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243585AbhI2GY5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Sep 2021 02:24:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1632896597; x=1664432597;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uyaDTv6ElFMlkrhItkY3XL14vYWTFsPCPC0gFEVREyA=;
  b=xCo+bR2gVcyoZjYmNsYukNBjv2jatJUqXXsg925JeESiHDdH+7tM7GXt
   2NOelijQHKMcioPaFNznDUroPA99p0jLR9Yihnnm5I7D4LAgrqqEraeLJ
   0k7ZHQYbwvT+DLT0np53LW/8ePE8UHgWvmbwFyJcy/i+LlqCS6q7ZNm/n
   EvtZpS4CsVCA5JRyNER30Da94v5n73ATVwqiDVHN6bCeRJTVyfMLxq4pT
   fltKEsv7LzE7ypxFz88kwJgWSL+X7EePRz8mbg81+wx9K8JH6Bckjy4qU
   ZB2NwxNtoNCNzGklsjbWdD092/xGMNx8dbg2N49VXC1K3ucrvKv/QN9Xp
   Q==;
IronPort-SDR: 2CZZePhGEw/C8rBNCeH1t1th2CgZdwkStZBge9pHs2q44RHvc0UBx6kPmrfoy5WHEDo0s5FNf2
 gvaVANCUS4wS5lfjU+TvMFK5HUxgRD1ee4zlu/sDDoJh+EPb+QPzcHwHfqbyfEIa6jW8RhbJto
 FRLv0yDm53ebdVJtsR7xJGUvTPL3aOcwXtfkhCXMpfSC8BEhwF9PrJ+6UKEcnfyFWzhl7GRjns
 QKASDRGKa0ts3pgUAiLrhlzER3y0h1ZpYpCAAzubL2Q2Y7WOaSTME7W206xxPVC0ccVpdX79PM
 yt7No66ZS7OCwAVBCok0+Uzb
X-IronPort-AV: E=Sophos;i="5.85,331,1624345200"; 
   d="scan'208";a="133574716"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Sep 2021 23:23:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 28 Sep 2021 23:23:15 -0700
Received: from CHE-LT-I17972LX.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 28 Sep 2021 23:23:08 -0700
From:   LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>
To:     <wsa@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <digetx@gmail.com>, <treding@nvidia.com>,
        <mirq-linux@rere.qmqm.pl>, <s.shtylyov@omp.ru>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <UNGLinuxDriver@microchip.com>
Subject: [PATCH v1 0/2] i2c:busses:Microchip PCI1XXXX I2C adapter
Date:   Wed, 29 Sep 2021 11:52:13 +0530
Message-ID: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Microchip PCI1XXXX is an unmanaged PCIe3.1a Switch for Consumer,
Industrial and Automotive applications. This switch has multiple
downstream ports. In one of the Switch's Downstream port,
there is a peripheral endpoint which supports I2C functionality.
This series of patches provides the I2C controller driver for the
I2C endpoint of the switch.

LakshmiPraveen Kopparthi (2):
  i2c:busses:Register PCI1XXXX adapter to I2C subsystem
  i2c:busses:Read and Write routines for PCI1XXXX I2C module

 MAINTAINERS                            |    7 +
 drivers/i2c/busses/Kconfig             |   10 +
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 1101 ++++++++++++++++++++++++
 3 files changed, 1118 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-mchp-pci1xxxx.c

-- 
2.25.1

