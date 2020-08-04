Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B859023B84C
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Aug 2020 11:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728332AbgHDJ7w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Aug 2020 05:59:52 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:63530 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726844AbgHDJ7v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Aug 2020 05:59:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1596535191; x=1628071191;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GTtso34T+c/2IIFCa0TTcMqhENR3/ROdcVBd3KrCKhw=;
  b=IDpiCvxPD4GxdecstZD6Vq6K58oker1H/e8iWZ+MXrv/XuUCKaIMvdcW
   sClaW2DNF09VRCdNh3be1lxlnEiVeMtX9gAGI7l3g621uRWQVnuNnSyZc
   fOlBY1AU82Go86tF9k6AASSaZwP8WbcyBWgeqN0GO3dMeKK8Gb6x69aGw
   yNiBPxxhtrMd+eylhaPrnIT7LqqrXZkBPDt1nNiFBykrqe1IiQsu0Wo/4
   yeyIdDoXSFd05jfSeKkhZsu0HmLroRk0Lmxjncs7JUr8gMLp10c941hSQ
   CuT0Td03XIxlo5RUfJPW0VrRGT5g+nPlbg0bHbUfC3z0fn7O5mWGzwVc6
   w==;
IronPort-SDR: u84SfLNWqiorX/pxS0wI7QF1VuB+j1TEr37drBBn1mKkKB1G4JeaEW4wdni1nT1WWUZ5EcQ85j
 86tA8LXavAVAq58faDRYEEXGFLjaYT7Gjnlx5FsDmPJY1yoL9DtDEKjHYfrUjt17C4rNIpjA9C
 WaAcu167kSNUj7OVz7SOMrjm0gy1fXBviNHQUUVN/b9DN2veFI2jl8nLW5KB6lrORup7e/1IYW
 7ji/li+qKJ7MsRRf35zKals6FAfY3EaimyT6VKsi42QtIMv6aDNiq4rNwLSggb2n7Dz9banJW9
 fPc=
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; 
   d="scan'208";a="85757564"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Aug 2020 02:59:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 4 Aug 2020 02:59:45 -0700
Received: from rob-ult-m19940.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 4 Aug 2020 02:59:35 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <wsa@kernel.org>, <robh+dt@kernel.org>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [PATCH 0/4] i2c: core: add generic GPIO bus recovery
Date:   Tue, 4 Aug 2020 12:59:22 +0300
Message-ID: <20200804095926.205643-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

GPIO recovery has been added already for some I2C bus drivers, such as
imx, pxa and at91. These drivers use similar bindings and have more or
less the same code for recovery. For this reason, we aim to move the
GPIO bus recovery implementation to the I2C core so that other drivers
can benefit from it, with small modifications.
This implementation initializes the pinctrl states and the SDA/SCL
GPIOs based on common bindings. The I2C bus drivers can still use
different bindings or other particular recovery steps if needed.
The ugly part with this patch series is the handle of PROBE_DEFER
which could be returned by devm_gpiod_get(). This changes things a
little for i2c_register_adapter() and for this reason this step is
implemented in a sperate patch.
The at91 Microchip driver is the first to use this implementation,
with an AI to move the rest of the drivers in the following steps.

This patch series was previously sent as a RFC. Significant changes
since RFC:
- "recovery" pinctrl state marked as deprecared in bindings;
- move to "gpio" pinctrl state done after the call to prepare_recovery()
  callback;
- glitch protection when SDA gpio is taken at initialization;

Codrin Ciubotariu (4):
  dt-binding: i2c: add generic properties for GPIO bus recovery
  i2c: core: add generic I2C GPIO recovery
  i2c: core: treat EPROBE_DEFER when acquiring SCL/SDA GPIOs
  i2c: at91: Move to generic GPIO bus recovery

 Documentation/devicetree/bindings/i2c/i2c.txt |  10 ++
 drivers/i2c/busses/i2c-at91-master.c          |  69 +-------
 drivers/i2c/busses/i2c-at91.h                 |   3 -
 drivers/i2c/i2c-core-base.c                   | 150 ++++++++++++++++--
 include/linux/i2c.h                           |  11 ++
 5 files changed, 163 insertions(+), 80 deletions(-)

-- 
2.25.1

