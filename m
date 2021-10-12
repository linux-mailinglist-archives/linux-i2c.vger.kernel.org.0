Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8FAD42A6C1
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Oct 2021 16:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237153AbhJLOIn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Oct 2021 10:08:43 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:9194 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237098AbhJLOIm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Oct 2021 10:08:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634047600; x=1665583600;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qkYXIs5EMBD3c4RGdtzIghYRVVmFGigRG+iuqOoLpdM=;
  b=uRUg0RKsWjG7T2HtLOrlGikmHqF3AQTLCPi2NtDx/pke9ZhKudRBj7bv
   HDsiHXeiTaVMGQcA1i7i10XxJwFBHPUT66ErNk0eiBAR7zcMXtpQwuaRk
   nPnpKI+qM/ncsvjBC/AfkbvlUv8fkZKAtaQfw4QJdw9RqCn6XRhVtQsPI
   4WviNKqCWC2n+ehUqOGeGJp0Q7lpSb0/V6RTVm2HBqH1AtIMv5TTrYCyb
   AWmsLBq7W36lzgYrAglREPhuK4hy8suhOh6Q6dcU4EKaZ04pHw8hHPB6N
   O6Y2iNyI48TrJ6nLOr0OCFB2hHpy+uxWrnhA9jDTZw28yjbyiOO+p2zyP
   g==;
IronPort-SDR: 0lSaNcQS2mkgQM8wJqib3MGzTeGiPMvrtNfyMwG9kNro8iU6GyCExCrqB9p0PxymMx2arcahTx
 RiF1E2KGHkcKbrMM+STQhKiCASMsjLXqZ/JMpha9T39KsOpP7gB2N5arT12JaN2p5XIxTlA8zH
 67bAmm9BGQzmCssh5nNZu3p+p+2BI0lNzTOUNJV+CxSEh06w66y2SbAPGNdWDQB1xu3vF3nME1
 4gbBsuzCdK2Scpff4vfikC1zrKL085b+ESFsvweelnz1GuHodJDNO2ml/x8SBAbxTQ7d2muFsk
 XkYegdrEu81WL4gHAsZSqRGG
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; 
   d="scan'208";a="72665534"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Oct 2021 07:06:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 12 Oct 2021 07:06:20 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 12 Oct 2021 07:06:18 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <robh+dt@kernel.org>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
        <codrin.ciubotariu@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH 0/2] i2c: at91: Add support for programmable clock source
Date:   Tue, 12 Oct 2021 16:07:16 +0200
Message-ID: <20211012140718.2138278-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support to be able to set BRSRCCLK. This feature is support on lan966x

Horatiu Vultur (2):
  dt-bindings: i2c: at91: Extend compatible list for lan966x
  i2c: at91: add support for brsrcclk

 .../devicetree/bindings/i2c/i2c-at91.txt      |  6 +++--
 drivers/i2c/busses/i2c-at91-core.c            | 16 +++++++++++++
 drivers/i2c/busses/i2c-at91-master.c          | 23 +++++++++++++++++--
 drivers/i2c/busses/i2c-at91.h                 |  1 +
 4 files changed, 42 insertions(+), 4 deletions(-)

-- 
2.33.0

