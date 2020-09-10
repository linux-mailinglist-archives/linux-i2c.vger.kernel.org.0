Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61A4E2647A6
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 16:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731002AbgIJNwt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 09:52:49 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:10011 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730890AbgIJNv7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Sep 2020 09:51:59 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f5a2d540000>; Thu, 10 Sep 2020 06:42:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 10 Sep 2020 06:42:58 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 10 Sep 2020 06:42:58 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep
 2020 13:42:57 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 10 Sep 2020 13:42:57 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.73.219]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f5a2d5f0004>; Thu, 10 Sep 2020 06:42:57 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 0/5] Add support for custom names for AT24 EEPROMs
Date:   Thu, 10 Sep 2020 14:42:34 +0100
Message-ID: <20200910134239.192030-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599745364; bh=p+eYdcmA2/YhlGQL68eNg7qv5O42WRTdkqFEOkVxhh4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
         Content-Type;
        b=chn7Qdj+vGw8KwVNpGbRcKeQAJ8oa+V2YNtbKpgP8ZhgULS3olMy81JTxYnikpi2S
         7ETE1sSyuLV2dzO1bXIRSolnNg72nn9ZxkP0PtnhLhFB0uivxWyI+EGBFxsPUz7Xog
         R1LRw4MTEXzazen+08lVWx9C08ZOii7UtK852BUmNxaRGzajjeiSTutDGX64RlUTuy
         Qmb66rEG8AgZQ7ZutIzpdo6wMMGm40MqlcXJsI9PQVhJU0WRzeV06ao3NxuYkMByGg
         yVbnjMBwRI0JD8Bx5q0sghwdOPW0vsniidJ+ABEkAuRrsHsPhzYAmp2BRKk9+sO4UB
         QFYI0AzAQ15gg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

For platforms that have multiple boards and hence have multiple EEPROMs
for identifying the different boards, it is useful to label the EEPROMs
in device-tree so that they can be easily identified. For example, MAC
address information is stored in the EEPROM on the processor module for
some Jetson platforms which is not only required by the kernel but the
bootloader as well. So having a simple way to identify the EEPROM is
needed.

Jon Hunter (5):
  misc: eeprom: at24: Initialise AT24 NVMEM ID field
  dt-bindings: eeprom: at24: Add label property for AT24
  misc: eeprom: at24: Support custom device names for AT24 EEPROMs
  arm64: tegra: Add label properties for EEPROMs
  arm64: tegra: Populate EEPROMs for Jetson Xavier NX

 .../devicetree/bindings/eeprom/at24.yaml         |  4 ++++
 .../boot/dts/nvidia/tegra186-p2771-0000.dts      |  1 +
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi   |  1 +
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi   |  1 +
 .../boot/dts/nvidia/tegra194-p2972-0000.dts      |  1 +
 .../nvidia/tegra194-p3509-0000+p3668-0000.dts    | 14 ++++++++++++++
 .../boot/dts/nvidia/tegra194-p3668-0000.dtsi     | 16 ++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi   |  1 +
 .../boot/dts/nvidia/tegra210-p2371-2180.dts      |  1 +
 .../boot/dts/nvidia/tegra210-p3450-0000.dts      |  2 ++
 drivers/misc/eeprom/at24.c                       | 11 ++++++++++-
 11 files changed, 52 insertions(+), 1 deletion(-)

--=20
2.25.1

