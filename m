Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B654144977A
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 16:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240748AbhKHPJl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 10:09:41 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:1626 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240713AbhKHPJ1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 10:09:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636384003; x=1667920003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BN4mDvCXCNqjJLbkYo2UnAm38U+/IvQVORj+MpQsb2s=;
  b=HkLPkoF3zsR6yzmhuyqOSo26nFDnd/qPa+5D3+6rTCq8/SSC74kCadCE
   4zr7HnJy5hhzWlEexHq/TN1KZoIdU1YJFMSmgJS67qlOuUUjXaVAbIvth
   rF5QEzlP4F1jcvaGnBWMXAEmGO8XZzOq3g9MuDmdeSfNi5das8eF7LRWM
   rW8hL7stRNQMUOceNlh8fBwvl+U5f/N/6XmxN8qasUTbcyQwXEqVmu2MQ
   y8u0yuAqx89uZ2MDlC2jZaBUWf/+iuNsqn+HBoCH91bcXAImuZ56ctfLj
   R1Q60GjNz7kAfyoKO5SlLp0oRXEEkxlU5DZMRnzO05EKvg7KU2jTIGyKc
   w==;
IronPort-SDR: hYEsGNvlMkycxQH+Bhj6UhhxbcFwNZqm2s9a0At7/+ZEvNQhqruJH8y/DR4exZETVNT2ve+v5O
 5gspF6U++90UPhJqREFzqkAA6Qbwl1dHPV+tH59gjUU88GIZ3WBGkYn8SwidMVjDSduMcbUscu
 y1obcgDYcXBeXx6odyCN9yr56BxAGwFpeez5rGFH8cKOFsOOWzqN6p65oI4kYr5VzOrcmVU1Tp
 iCfs1einVdgD3iRQ/nO1snNUMTHiy246qf0dt+lquZ0OFJg63m2yNrLXMvw/XzoRPmM8+irzEt
 wygNAGK7QCH8uFtdLGwBXOpt
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="142601826"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2021 08:06:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:06:40 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 8 Nov 2021 08:06:36 -0700
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
Subject: [PATCH 02/13] dt-bindings: interrupt-controller: add defines for mpfs-plic
Date:   Mon, 8 Nov 2021 15:05:43 +0000
Message-ID: <20211108150554.4457-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108150554.4457-1-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Ivan Griffin <ivan.griffin@microchip.com>

Add device tree bindings for the Microchip Polarfire Soc interrupt
controller

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Ivan Griffin <ivan.griffin@microchip.com>
---
 .../microchip,mpfs-plic.h                     | 199 ++++++++++++++++++
 1 file changed, 199 insertions(+)
 create mode 100644 include/dt-bindings/interrupt-controller/microchip,mpfs-plic.h

diff --git a/include/dt-bindings/interrupt-controller/microchip,mpfs-plic.h b/include/dt-bindings/interrupt-controller/microchip,mpfs-plic.h
new file mode 100644
index 000000000000..81c8cd02abd8
--- /dev/null
+++ b/include/dt-bindings/interrupt-controller/microchip,mpfs-plic.h
@@ -0,0 +1,199 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (C) 2021 Microchip Technology Inc.  All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_MICROCHIP_MPFS_PLIC_H
+#define _DT_BINDINGS_INTERRUPT_CONTROLLER_MICROCHIP_MPFS_PLIC_H
+
+#define PLIC_INT_INVALID					0
+#define PLIC_INT_L2_METADATA_CORR				1
+#define PLIC_INT_L2_METADAT_UNCORR				2
+#define PLIC_INT_L2_DATA_CORR					3
+#define PLIC_INT_L2_DATA_UNCORR					4
+#define PLIC_INT_DMA_CH0_DONE					5
+#define PLIC_INT_DMA_CH0_ERR					6
+#define PLIC_INT_DMA_CH1_DONE					7
+#define PLIC_INT_DMA_CH1_ERR					8
+#define PLIC_INT_DMA_CH2_DONE					9
+#define PLIC_INT_DMA_CH2_ERR					10
+#define PLIC_INT_DMA_CH3_DONE					11
+#define PLIC_INT_DMA_CH3_ERR					12
+
+#define PLIC_INT_GPIO0_BIT0_OR_GPIO2_BIT0			13
+#define PLIC_INT_GPIO0_BIT1_OR_GPIO2_BIT1			14
+#define PLIC_INT_GPIO0_BIT2_OR_GPIO2_BIT2			15
+#define PLIC_INT_GPIO0_BIT3_OR_GPIO2_BIT3			16
+#define PLIC_INT_GPIO0_BIT4_OR_GPIO2_BIT4			17
+#define PLIC_INT_GPIO0_BIT5_OR_GPIO2_BIT5			18
+#define PLIC_INT_GPIO0_BIT6_OR_GPIO2_BIT6			19
+#define PLIC_INT_GPIO0_BIT7_OR_GPIO2_BIT7			20
+#define PLIC_INT_GPIO0_BIT8_OR_GPIO2_BIT8			21
+#define PLIC_INT_GPIO0_BIT9_OR_GPIO2_BIT9			22
+#define PLIC_INT_GPIO0_BIT10_OR_GPIO2_BIT10			23
+#define PLIC_INT_GPIO0_BIT11_OR_GPIO2_BIT11			24
+#define PLIC_INT_GPIO0_BIT12_OR_GPIO2_BIT12			25
+#define PLIC_INT_GPIO0_BIT13_OR_GPIO2_BIT13			26
+#define PLIC_INT_GPIO1_BIT0_OR_GPIO2_BIT14			27
+#define PLIC_INT_GPIO1_BIT1_OR_GPIO2_BIT15			28
+#define PLIC_INT_GPIO1_BIT2_OR_GPIO2_BIT16			29
+#define PLIC_INT_GPIO1_BIT3_OR_GPIO2_BIT17			30
+#define PLIC_INT_GPIO1_BIT4_OR_GPIO2_BIT18			31
+#define PLIC_INT_GPIO1_BIT5_OR_GPIO2_BIT19			32
+#define PLIC_INT_GPIO1_BIT6_OR_GPIO2_BIT20			33
+#define PLIC_INT_GPIO1_BIT7_OR_GPIO2_BIT21			34
+#define PLIC_INT_GPIO1_BIT8_OR_GPIO2_BIT22			35
+#define PLIC_INT_GPIO1_BIT9_OR_GPIO2_BIT23			36
+#define PLIC_INT_GPIO1_BIT10_OR_GPIO2_BIT24			37
+#define PLIC_INT_GPIO1_BIT11_OR_GPIO2_BIT25			38
+#define PLIC_INT_GPIO1_BIT12_OR_GPIO2_BIT26			39
+#define PLIC_INT_GPIO1_BIT13_OR_GPIO2_BIT27			40
+#define PLIC_INT_GPIO1_BIT14_OR_GPIO2_BIT28			41
+#define PLIC_INT_GPIO1_BIT15_OR_GPIO2_BIT29			42
+#define PLIC_INT_GPIO1_BIT16_OR_GPIO2_BIT30			43
+#define PLIC_INT_GPIO1_BIT17_OR_GPIO2_BIT31			44
+#define PLIC_INT_GPIO1_BIT18					45
+#define PLIC_INT_GPIO1_BIT19					46
+#define PLIC_INT_GPIO1_BIT20					47
+#define PLIC_INT_GPIO1_BIT21					48
+#define PLIC_INT_GPIO1_BIT22					49
+#define PLIC_INT_GPIO1_BIT23					50
+#define PLIC_INT_GPIO0_NON_DIRECT				51
+#define PLIC_INT_GPIO1_NON_DIRECT				52
+#define PLIC_INT_GPIO2_NON_DIRECT				53
+#define PLIC_INT_SPI0						54
+#define PLIC_INT_SPI1						55
+#define PLIC_INT_CAN0						56
+#define PLIC_INT_CAN1						57
+#define PLIC_INT_I2C0_MAIN					58
+#define PLIC_INT_I2C0_ALERT					59
+#define PLIC_INT_I2C0_SUS					60
+#define PLIC_INT_I2C1_MAIN					61
+#define PLIC_INT_I2C1_ALERT					62
+#define PLIC_INT_I2C1_SUS					63
+#define PLIC_INT_MAC0_INT					64
+#define PLIC_INT_MAC0_QUEUE1					65
+#define PLIC_INT_MAC0_QUEUE2					66
+#define PLIC_INT_MAC0_QUEUE3					67
+#define PLIC_INT_MAC0_EMAC					68
+#define PLIC_INT_MAC0_MMSL					69
+#define PLIC_INT_MAC1_INT					70
+#define PLIC_INT_MAC1_QUEUE1					71
+#define PLIC_INT_MAC1_QUEUE2					72
+#define PLIC_INT_MAC1_QUEUE3					73
+#define PLIC_INT_MAC1_EMAC					74
+#define PLIC_INT_MAC1_MMSL					75
+#define PLIC_INT_DDRC_TRAIN					76
+#define PLIC_INT_SCB_INTERRUPT					77
+#define PLIC_INT_ECC_ERROR					78
+#define PLIC_INT_ECC_CORRECT					79
+#define PLIC_INT_RTC_WAKEUP					80
+#define PLIC_INT_RTC_MATCH					81
+#define PLIC_INT_TIMER1						82
+#define PLIC_INT_TIMER2						83
+#define PLIC_INT_ENVM						84
+#define PLIC_INT_QSPI						85
+#define PLIC_INT_USB_DMA					86
+#define PLIC_INT_USB_MC						87
+#define PLIC_INT_MMC_MAIN					88
+#define PLIC_INT_MMC_WAKEUP					89
+#define PLIC_INT_MMUART0					90
+#define PLIC_INT_MMUART1					91
+#define PLIC_INT_MMUART2					92
+#define PLIC_INT_MMUART3					93
+#define PLIC_INT_MMUART4					94
+#define PLIC_INT_G5C_DEVRST					95
+#define PLIC_INT_G5C_MESSAGE					96
+#define PLIC_INT_USOC_VC_INTERRUPT				97
+#define PLIC_INT_USOC_SMB_INTERRUPT				98
+#define PLIC_INT_E51_0_MAINTENACE				99
+#define PLIC_INT_WDOG0_MRVP					100
+#define PLIC_INT_WDOG1_MRVP					101
+#define PLIC_INT_WDOG2_MRVP					102
+#define PLIC_INT_WDOG3_MRVP					103
+#define PLIC_INT_WDOG4_MRVP					104
+#define PLIC_INT_WDOG0_TOUT					105
+#define PLIC_INT_WDOG1_TOUT					106
+#define PLIC_INT_WDOG2_TOUT					107
+#define PLIC_INT_WDOG3_TOUT					108
+#define PLIC_INT_WDOG4_TOUT					109
+#define PLIC_INT_G5C_MSS_SPI					110
+#define PLIC_INT_VOLT_TEMP_ALARM				111
+#define PLIC_INT_ATHENA_COMPLETE				112
+#define PLIC_INT_ATHENA_ALARM					113
+#define PLIC_INT_ATHENA_BUS_ERROR				114
+#define PLIC_INT_USOC_AXIC_US					115
+#define PLIC_INT_USOC_AXIC_DS					116
+#define PLIC_INT_SPARE						117
+
+#define PLIC_INT_FABRIC_F2H_0					118
+#define PLIC_INT_FABRIC_F2H_1					119
+#define PLIC_INT_FABRIC_F2H_2					120
+#define PLIC_INT_FABRIC_F2H_3					121
+#define PLIC_INT_FABRIC_F2H_4					122
+#define PLIC_INT_FABRIC_F2H_5					123
+#define PLIC_INT_FABRIC_F2H_6					124
+#define PLIC_INT_FABRIC_F2H_7					125
+#define PLIC_INT_FABRIC_F2H_8					126
+#define PLIC_INT_FABRIC_F2H_9					127
+#define PLIC_INT_FABRIC_F2H_10					128
+#define PLIC_INT_FABRIC_F2H_11					129
+#define PLIC_INT_FABRIC_F2H_12					130
+#define PLIC_INT_FABRIC_F2H_13					131
+#define PLIC_INT_FABRIC_F2H_14					132
+#define PLIC_INT_FABRIC_F2H_15					133
+#define PLIC_INT_FABRIC_F2H_16					134
+#define PLIC_INT_FABRIC_F2H_17					135
+#define PLIC_INT_FABRIC_F2H_18					136
+#define PLIC_INT_FABRIC_F2H_19					137
+#define PLIC_INT_FABRIC_F2H_20					138
+#define PLIC_INT_FABRIC_F2H_21					139
+#define PLIC_INT_FABRIC_F2H_22					140
+#define PLIC_INT_FABRIC_F2H_23					141
+#define PLIC_INT_FABRIC_F2H_24					142
+#define PLIC_INT_FABRIC_F2H_25					143
+#define PLIC_INT_FABRIC_F2H_26					144
+#define PLIC_INT_FABRIC_F2H_27					145
+#define PLIC_INT_FABRIC_F2H_28					146
+#define PLIC_INT_FABRIC_F2H_29					147
+#define PLIC_INT_FABRIC_F2H_30					148
+#define PLIC_INT_FABRIC_F2H_31					149
+#define PLIC_INT_FABRIC_F2H_32					150
+#define PLIC_INT_FABRIC_F2H_33					151
+#define PLIC_INT_FABRIC_F2H_34					152
+#define PLIC_INT_FABRIC_F2H_35					153
+#define PLIC_INT_FABRIC_F2H_36					154
+#define PLIC_INT_FABRIC_F2H_37					155
+#define PLIC_INT_FABRIC_F2H_38					156
+#define PLIC_INT_FABRIC_F2H_39					157
+#define PLIC_INT_FABRIC_F2H_40					158
+#define PLIC_INT_FABRIC_F2H_41					159
+#define PLIC_INT_FABRIC_F2H_42					160
+#define PLIC_INT_FABRIC_F2H_43					161
+#define PLIC_INT_FABRIC_F2H_44					162
+#define PLIC_INT_FABRIC_F2H_45					163
+#define PLIC_INT_FABRIC_F2H_46					164
+#define PLIC_INT_FABRIC_F2H_47					165
+#define PLIC_INT_FABRIC_F2H_48					166
+#define PLIC_INT_FABRIC_F2H_49					167
+#define PLIC_INT_FABRIC_F2H_50					168
+#define PLIC_INT_FABRIC_F2H_51					169
+#define PLIC_INT_FABRIC_F2H_52					170
+#define PLIC_INT_FABRIC_F2H_53					171
+#define PLIC_INT_FABRIC_F2H_54					172
+#define PLIC_INT_FABRIC_F2H_55					173
+#define PLIC_INT_FABRIC_F2H_56					174
+#define PLIC_INT_FABRIC_F2H_57					175
+#define PLIC_INT_FABRIC_F2H_58					176
+#define PLIC_INT_FABRIC_F2H_59					177
+#define PLIC_INT_FABRIC_F2H_60					178
+#define PLIC_INT_FABRIC_F2H_61					179
+#define PLIC_INT_FABRIC_F2H_62					180
+#define PLIC_INT_FABRIC_F2H_63					181
+#define PLIC_INT_BUS_ERROR_UNIT_HART_0				182
+#define PLIC_INT_BUS_ERROR_UNIT_HART_1				183
+#define PLIC_INT_BUS_ERROR_UNIT_HART_2				184
+#define PLIC_INT_BUS_ERROR_UNIT_HART_3				185
+#define PLIC_INT_BUS_ERROR_UNIT_HART_4				186
+
+#endif /* _DT_BINDINGS_INTERRUPT_CONTROLLER_MICROCHIP_MPFS_PLIC_H */
-- 
2.33.1

