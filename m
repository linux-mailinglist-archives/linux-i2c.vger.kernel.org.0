Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB3844976A
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 16:06:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238619AbhKHPJM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 10:09:12 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:41805 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236457AbhKHPJM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 10:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636383987; x=1667919987;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8SrEU9XI/OEo5uTJNfmiDpAr5AwL1FBJ0ig/W9RdeJY=;
  b=uVT1wnJxxS7GgFyYEjB0ZVgGtyFscrseVnsFUZmcirIQOfYoCvUbPApg
   KMNCD6wdpcdlFnsFP3mS/aK6ibYOkTR2zcFi6VIeKndP+uuRfHZK79MZw
   +EOcxvgoZNcb6oeAOjuBHTSdud7HlDe90ddKHoE5CZLWJD3j++hlsZPTV
   ce5AbYUdtwUKmsgaq+qjqx5sjUKhucm/7/EdcL/yQiN1oA4/y75+uP6BT
   iDRJLIL4P+E5uGyjiopt6dyPJG1vW9JaCVyA0XT28aUh5DuWf2YquWqRm
   wi1eghMc78q7cMeFmCM6zNcFNECREpLi0BXXJjf8IDnaaZ2lnqW4YN4ri
   A==;
IronPort-SDR: rKaUUnhxQEuffL258X7HEch2+KTgcTsz45WpCwjQFqdvi8jf1EDK/efkqY6IZ8ZUpCzJsKfE4K
 fgxIdeqoyQBgLCKd+c5YqltwAtfrElduaVhZivZVIyZNykcinto/2oJdjfbZVi8qpomr8qiY+5
 xvIo0j6fITV7ox+ZkTGm3VHcDlg3p/F8tKywsi/ROTKcRlaZHem9FmP1RYErwPj0c0fq/yJExn
 Ge+EtfgudJp/+8PUoXcjGOeNR++YFCHA8AGfjsFN/WY8+sr7YVPwvi8LXrQVx/OEJV9KmkbI0f
 1vRBKjAwQ16j2JOLIbTgLjaZ
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="135847455"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2021 08:06:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:06:19 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 8 Nov 2021 08:06:15 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
        <atish.patra@wdc.com>, <ivan.griffin@microchip.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <bin.meng@windriver.com>
Subject: [PATCH 00/13]Update the icicle kit device tree
Date:   Mon, 8 Nov 2021 15:05:41 +0000
Message-ID: <20211108150554.4457-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

This series updates the microchip icicle kit device tree by adding a host
of peripherals, and some updates to the memory map. In addition, the device
tree has been split into a third part, which contains "soft" peripherals 
that are in the fpga fabric.

Several of the entries are for peripherals that have not get had their drivers
upstreamed, so in those cases the dt bindings are included where appropriate
in order to avoid as many "DT compatible string <x> appears un-documented" 
errors as possible.

Depends on mpfs clock driver series [1] to provide:
dt-bindings/clock/microchip,mpfs-clock.h
and on the other changes to the icicle/mpfs device tree
that are already in linux/riscv/for-next.

[1] https://lore.kernel.org/linux-clk/20210818141102.36655-2-daire.mcnamara@microchip.com/

Conor Dooley (11):
  dt-bindings: soc/microchip: update sys ctrlr compat string
  dt-bindings: riscv: update microchip polarfire binds
  dt-bindings: i2c: add bindings for microchip mpfs i2c
  dt-bindings: rng: add bindings for microchip mpfs rng
  dt-bindings: rtc: add bindings for microchip mpfs rtc
  dt-bindings: soc/microchip: add bindings for mpfs system services
  dt-bindings: gpio: add bindings for microchip mpfs gpio
  dt-bindings: spi: add bindings for microchip mpfs spi
  dt-bindings: usb: add bindings for microchip mpfs musb
  riscv: icicle-kit: update microchip icicle kit device tree
  MAINTAINERS: update riscv/microchip entry

Ivan Griffin (2):
  dt-bindings: interrupt-controller: add defines for riscv-hart
  dt-bindings: interrupt-controller: add defines for mpfs-plic

 .../bindings/gpio/microchip,mpfs-gpio.yaml    | 108 ++++++
 .../bindings/i2c/microchip,mpfs-i2c.yaml      |  74 ++++
 .../microchip,polarfire-soc-mailbox.yaml      |   4 +-
 .../devicetree/bindings/riscv/microchip.yaml  |   1 +
 .../bindings/rng/microchip,mpfs-rng.yaml      |  31 ++
 .../bindings/rtc/microchip,mfps-rtc.yaml      |  61 ++++
 .../microchip,mpfs-generic-service.yaml       |  31 ++
 ...icrochip,polarfire-soc-sys-controller.yaml |   4 +-
 .../bindings/spi/microchip,mpfs-spi.yaml      |  72 ++++
 .../bindings/usb/microchip,mpfs-usb-host.yaml |  70 ++++
 MAINTAINERS                                   |   2 +
 .../dts/microchip/microchip-mpfs-fabric.dtsi  |  21 ++
 .../microchip/microchip-mpfs-icicle-kit.dts   | 159 +++++++--
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 333 ++++++++++++++----
 drivers/mailbox/mailbox-mpfs.c                |   1 +
 .../microchip,mpfs-plic.h                     | 199 +++++++++++
 .../interrupt-controller/riscv-hart.h         |  19 +
 17 files changed, 1103 insertions(+), 87 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
 create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-generic-service.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml
 create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
 create mode 100644 include/dt-bindings/interrupt-controller/microchip,mpfs-plic.h
 create mode 100644 include/dt-bindings/interrupt-controller/riscv-hart.h

-- 
2.33.1

