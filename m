Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD66643E14B
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Oct 2021 14:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbhJ1Mzb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Oct 2021 08:55:31 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:5763 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbhJ1Mza (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Oct 2021 08:55:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635425583; x=1666961583;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V0H6agmGCtTkcfi0Y+EUenLb9dv3H+UJUFjQMGH5fPI=;
  b=hMhRD80M5o7a2tKaUf4/7SCYqQiv4KECeITgmVGbmDUZMQmGcHvKwQGh
   ESpNLASWWgcFcgw38fpckIWTs6q5V1z1DgqSzai0QGYXgKqcfnZrsql2E
   mVwNsi56t03As5JHRYLM65S/oedEyogO3G9zdC/TOmNhZzw5KA1DTUmum
   R2Ci3cLVQwLwNhTzZg82v69Zp/9cwDZc1nc06wFIRjWM+Lvt1h8rP2jLC
   BgofzdUhR8n+gFlejsWWqVo+TPtdCVfySs9AlcbVO8wZSJyVH/jE8mMFC
   90gpZ+35RWEMsuzM+avQygydwVqFLXlwccjhOYF7ui6ufpRXKgq9O3iD5
   Q==;
IronPort-SDR: vRfOACLuRmnHakmvdsclY2ZbLLdvVk9Xo+r8FPMCwkQyalSk7pPrHzJh8TJ7cK5Og4MqaHe8Wg
 Abr3NaOmcPhEwswxYIyTnlInBk9VScH8xZfdOKlq5q+oooEe6BD4RB7zjaCMk+jl/EE5LPpYSs
 ZFadxQnNL1RX+efCmMtKT6ceL8j8+RYTW2wM3OB2oyYw+jeW6GSjDbbpYM9SB3lCiNvthDAIP8
 NY3h/9yBI5Tex8D3rfkiCsBPxDRDGNwVE8r9nmqn1Cr7A2i42Gnt0hmEqORDJp5Kk1/mHr4ond
 HYoOfs99cL20ikL7GgGEgw11
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; 
   d="scan'208";a="134652461"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Oct 2021 05:53:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 28 Oct 2021 05:53:03 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 28 Oct 2021 05:53:01 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <peda@axentia.se>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v2 0/2] i2c-mux-gpmux: Support settle-time-us property
Date:   Thu, 28 Oct 2021 14:53:39 +0200
Message-ID: <20211028125341.2457171-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for settle-time-us property. If this is defined in device
tree then add this delay to mux APIs.

v1->v2:
 - add the changes to i2c-mux-gpmux instead of i2c-mux-gpio to be able
   to use mux_control_select_delay

Horatiu Vultur (2):
  dt-bindings: i2c-mux-gpmux: Add property for settle time
  i2c-mux-gpmux: Support settle-time-us property

 Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml | 5 +++++
 drivers/i2c/muxes/i2c-mux-gpmux.c                        | 6 +++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.33.0

