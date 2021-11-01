Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 270BC441B1F
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 13:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbhKAM2u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 08:28:50 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:51132 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232270AbhKAM2u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 08:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635769577; x=1667305577;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Y/7N8bUiHr8CwPjEkQfDR5JN+7lyDO9D3cXQladVS/c=;
  b=G8/ys3c936FbQ7SboaKkBHt4W1ZaGiHF6tSpffCc3N8o4yqzyMU+jDzw
   O3ig2IpuGVhAUYeu2Xq/StjwvRpS0rgcvawY9g2SHmWqK6DJwfKjtq6RO
   KC5+O9NFTGFbECpyMQZqaw888DsXK+nhM1ico0kLeeETyemTyGRzBQ/Ur
   yHmHtmXAYuPoLbpdYfe/AcwIu8cD/SpwGDfbcqiP+HHr8rnKTcYxwc3z2
   LHd1S9VdFEn8j8Ej9X+XJ6y8kZ1FqvK8UDz/5syc3bB0t21c6F2aldzZG
   2dxnmwbDCjtpTlMmNfbHuGbHFicAND+HOpUqFjwEvK/5goCV1i8UqNHwe
   A==;
IronPort-SDR: /ioR/LEoMV+3YRDMijg1MIgQiboRugbRzEVEUmVhXpSaIv6rivAIUSBSTyKGPlMMWQH846jyen
 5qt4RpH/DBIM903AgOZ1ijsj9dupTSiYh1SYU6kZOAP/LRktOiWPbaf008gOrSSpm1Vwh18jON
 PvIAzRHZik5G7j/xnIbqtb5/xqoJekAvhGw4bHEIzRMgcHMZpc3RKWIOzBlpZ1YDdL3eu+3O8t
 hH+ewS3U69DVlSLigWqRs+/qk50J53xJn1UXl1kcNUMvV/TN8PEwcs90zH0bspUdkHtPlcLF7R
 ZQEC4MtKRnQiSsNqDdiiVOd4
X-IronPort-AV: E=Sophos;i="5.87,199,1631602800"; 
   d="scan'208";a="137580096"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Nov 2021 05:26:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 1 Nov 2021 05:26:05 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 1 Nov 2021 05:26:04 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <peda@axentia.se>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v3 0/2] i2c-mux-gpmux: Support settle-time-us property
Date:   Mon, 1 Nov 2021 13:25:43 +0100
Message-ID: <20211101122545.3417624-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for settle-time-us property. If this is defined in device
tree then add this delay to mux APIs.

v2->v3:
 - move the binding changes into i2c-mux.yaml
 - read at a later point the DT property 'settle-time-us'

v1->v2:
 - add the changes to i2c-mux-gpmux instead of i2c-mux-gpio to be able
   to use mux_control_select_delay

Horatiu Vultur (2):
  dt-bindings: i2c-mux: Add property for settle time
  i2c-mux-gpmux: Support settle-time-us property

 Documentation/devicetree/bindings/i2c/i2c-mux.yaml | 6 ++++++
 drivers/i2c/muxes/i2c-mux-gpmux.c                  | 4 +++-
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.33.0

