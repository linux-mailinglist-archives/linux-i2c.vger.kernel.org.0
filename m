Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62E1D13BEFF
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 12:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730220AbgAOLyp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 06:54:45 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:22077 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730150AbgAOLyp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jan 2020 06:54:45 -0500
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
  Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="Codrin.Ciubotariu@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: pP7gQZMEpK7mEL9FDGYrQjSlY+YzgyrMlhYrl7RQfNvNfT4iKWfc4z4n2t2+dAeDU8jaQ0p4GJ
 8d7ak7P+j5G8v2D4cn5xBMnEyDMcW3Lu352VHlAVYaN/Dtqvysx3+qrriLfYkophv8G9WC25fm
 4YJ3zyN4545CJo5oxbbhb5Y+pdN83yE0+rpU4mke+Ka1r9a73GYKx17FFAa8UCS7xdVErSVrwk
 ir85t39bCC6h0J0nk4+clAq34x3V4xpxHvRDGhjV4a0BOCSwttqfkrQh4QQrdsjWNRY8/Pgy+6
 /FI=
X-IronPort-AV: E=Sophos;i="5.70,322,1574146800"; 
   d="scan'208";a="60862973"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jan 2020 04:54:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 15 Jan 2020 04:54:39 -0700
Received: from rob-ult-m19940.microchip.com (10.10.85.251) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 15 Jan 2020 04:54:36 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <kamel.bouhara@bootlin.com>, <wsa@the-dreams.de>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <robh@kernel.org>,
        <peda@axentia.se>, <linux@armlinux.org.uk>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [PATCH v3 0/6] i2c bus recovery for Microchip SoCs
Date:   Wed, 15 Jan 2020 13:54:16 +0200
Message-ID: <20200115115422.17097-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch series introduce the i2c bus recovery mechanism
for the Microchip SoCs. Some SoCs have hardware support for
recovery, while for those who don't the i2c-gpio bus recovery
mechanism is used. Updated the corresponding dts to add i2c
gpio pinctrl. The bus recovery is configured for the sama5d2/3/4
xplained and sama5d27 som1 EK boards in dts.

Changes in v3:
 - addressed list comments:
  - removed pull-ups from gpios;
  - removed unused headers from i2c-at91.h;
  - fixed commit message and subject on patch 3/6;
  - added received tags;
 - rebased on top of i2c/for-next;

Changes in v2:
 - integrated the HW CLEAR command patch;
 - call i2c_recover_bus() after an error occurs, if SDA is down;
 - added i2c gpio pinctrl in sama5d2 xplained and sama5d27 som1 EK
   boards;

Codrin Ciubotariu (1):
  i2c: at91: Send bus clear command if SDA is down

Kamel Bouhara (5):
  dt-bindings: i2c: at91: document optional bus recovery properties
  i2c: at91: implement i2c bus recovery
  ARM: at91/dt: sama5d3: add i2c gpio pinctrl
  ARM: at91/dt: sama5d4: add i2c gpio pinctrl
  ARM: at91/dt: sama5d2: add i2c gpio pinctrl

 .../devicetree/bindings/i2c/i2c-at91.txt      |  10 ++
 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts     |  33 +++++-
 arch/arm/boot/dts/at91-sama5d2_xplained.dts   |  33 +++++-
 arch/arm/boot/dts/sama5d3.dtsi                |  33 +++++-
 arch/arm/boot/dts/sama5d4.dtsi                |  33 +++++-
 drivers/i2c/busses/i2c-at91-core.c            |   2 +
 drivers/i2c/busses/i2c-at91-master.c          | 100 ++++++++++++++++++
 drivers/i2c/busses/i2c-at91.h                 |  11 +-
 8 files changed, 242 insertions(+), 13 deletions(-)

-- 
2.20.1

