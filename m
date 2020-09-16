Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8821226C102
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Sep 2020 11:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbgIPJuM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Sep 2020 05:50:12 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16325 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726243AbgIPJuL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Sep 2020 05:50:11 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f61dfa30000>; Wed, 16 Sep 2020 02:49:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 16 Sep 2020 02:50:11 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 16 Sep 2020 02:50:11 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 16 Sep
 2020 09:50:10 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 16 Sep 2020 09:50:10 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.74.242]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f61dfd00001>; Wed, 16 Sep 2020 02:50:10 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 0/5] Add support for custom names for AT24 EEPROMs
Date:   Wed, 16 Sep 2020 10:49:47 +0100
Message-ID: <20200916094952.458003-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600249763; bh=fpG3sd1DvT30i+2ybF/+tA2abwvT7GdPWvcHCi71tMo=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
         Content-Type;
        b=IdqtLpI/gjYGSjKBV9LLeGW6gtfn1YsGDj5D9v+1njmHP6GE7dDXSKT6Oe1nqj3M0
         TInE6NU0N6w+oVwjsS7yfMUAlyApGFENxiqUEXma2NGjrpw8AH3O+vclJJe0dNmxft
         g9NvTF/BXGx83/hP8nUScm4sxUCIHffconXDMLTjOSFbihoNYuRlPYZyYP7tKvZUVs
         uswMUUktjAd33fcbhiWE/HrsGo7TteElsOVbtzwguA+YEk84erIepzPq/8vNSeuwy0
         CMKs7VYWxIiU1Lg29A2/+izUVSnMlWIh3xdrD83NW/rK8S8mXsHDEvEthX/bb+Ef4e
         rXertc9+pSf5A==
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

Changes since V1:
- By default initialise the nvmem_config.id as NVMEM_DEVID_AUTO and not
  NVMEM_DEVID_NONE
- Dropped the 'maxItems' from the dt-binding doc.

Jon Hunter (5):
  misc: eeprom: at24: Initialise AT24 NVMEM ID field
  dt-bindings: eeprom: at24: Add label property for AT24
  misc: eeprom: at24: Support custom device names for AT24 EEPROMs
  arm64: tegra: Add label properties for EEPROMs
  arm64: tegra: Populate EEPROMs for Jetson Xavier NX

 .../devicetree/bindings/eeprom/at24.yaml      |  3 +++
 .../boot/dts/nvidia/tegra186-p2771-0000.dts   |  1 +
 .../arm64/boot/dts/nvidia/tegra186-p3310.dtsi |  1 +
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |  1 +
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  1 +
 .../nvidia/tegra194-p3509-0000+p3668-0000.dts | 14 ++++++++++++
 .../boot/dts/nvidia/tegra194-p3668-0000.dtsi  | 16 ++++++++++++++
 .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi |  1 +
 .../boot/dts/nvidia/tegra210-p2371-2180.dts   |  1 +
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   |  2 ++
 drivers/misc/eeprom/at24.c                    | 22 ++++++++++++++++++-
 11 files changed, 62 insertions(+), 1 deletion(-)

--=20
2.25.1

