Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2B145A128
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 12:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235944AbhKWLUk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 06:20:40 -0500
Received: from gloria.sntech.de ([185.11.138.130]:52032 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235940AbhKWLUk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 06:20:40 -0500
Received: from ip5f5b2004.dynamic.kabel-deutschland.de ([95.91.32.4] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mpTnc-0008AF-IZ; Tue, 23 Nov 2021 12:17:20 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, jassisinghbrar@gmail.com,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, lewis.hanly@microchip.com,
        conor.dooley@microchip.com, daire.mcnamara@microchip.com,
        atish.patra@wdc.com, ivan.griffin@microchip.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-crypto@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
        bin.meng@windriver.com, conor.dooley@microchip.com
Subject: Re: [PATCH 02/13] dt-bindings: interrupt-controller: add defines for mpfs-plic
Date:   Tue, 23 Nov 2021 12:17:19 +0100
Message-ID: <4654853.heXYEcuSsU@diego>
In-Reply-To: <20211108150554.4457-3-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com> <20211108150554.4457-3-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Am Montag, 8. November 2021, 16:05:43 CET schrieb conor.dooley@microchip.com:
> From: Ivan Griffin <ivan.griffin@microchip.com>
> 
> Add device tree bindings for the Microchip Polarfire Soc interrupt
> controller
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Ivan Griffin <ivan.griffin@microchip.com>
> ---
>  .../microchip,mpfs-plic.h                     | 199 ++++++++++++++++++
>  1 file changed, 199 insertions(+)
>  create mode 100644 include/dt-bindings/interrupt-controller/microchip,mpfs-plic.h
> 
> diff --git a/include/dt-bindings/interrupt-controller/microchip,mpfs-plic.h b/include/dt-bindings/interrupt-controller/microchip,mpfs-plic.h
> new file mode 100644
> index 000000000000..81c8cd02abd8
> --- /dev/null
> +++ b/include/dt-bindings/interrupt-controller/microchip,mpfs-plic.h
> @@ -0,0 +1,199 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (C) 2021 Microchip Technology Inc.  All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_MICROCHIP_MPFS_PLIC_H
> +#define _DT_BINDINGS_INTERRUPT_CONTROLLER_MICROCHIP_MPFS_PLIC_H
> +
> +#define PLIC_INT_INVALID					0
> +#define PLIC_INT_L2_METADATA_CORR				1
> +#define PLIC_INT_L2_METADAT_UNCORR				2
> +#define PLIC_INT_L2_DATA_CORR					3
> +#define PLIC_INT_L2_DATA_UNCORR					4
> +#define PLIC_INT_DMA_CH0_DONE					5
> +#define PLIC_INT_DMA_CH0_ERR					6
> +#define PLIC_INT_DMA_CH1_DONE					7
> +#define PLIC_INT_DMA_CH1_ERR					8
> +#define PLIC_INT_DMA_CH2_DONE					9
> +#define PLIC_INT_DMA_CH2_ERR					10
> +#define PLIC_INT_DMA_CH3_DONE					11
> +#define PLIC_INT_DMA_CH3_ERR					12
> +
> +#define PLIC_INT_GPIO0_BIT0_OR_GPIO2_BIT0			13
> +#define PLIC_INT_GPIO0_BIT1_OR_GPIO2_BIT1			14
> +#define PLIC_INT_GPIO0_BIT2_OR_GPIO2_BIT2			15
> +#define PLIC_INT_GPIO0_BIT3_OR_GPIO2_BIT3			16
> +#define PLIC_INT_GPIO0_BIT4_OR_GPIO2_BIT4			17
> +#define PLIC_INT_GPIO0_BIT5_OR_GPIO2_BIT5			18
> +#define PLIC_INT_GPIO0_BIT6_OR_GPIO2_BIT6			19
> +#define PLIC_INT_GPIO0_BIT7_OR_GPIO2_BIT7			20
> +#define PLIC_INT_GPIO0_BIT8_OR_GPIO2_BIT8			21
> +#define PLIC_INT_GPIO0_BIT9_OR_GPIO2_BIT9			22
> +#define PLIC_INT_GPIO0_BIT10_OR_GPIO2_BIT10			23
> +#define PLIC_INT_GPIO0_BIT11_OR_GPIO2_BIT11			24
> +#define PLIC_INT_GPIO0_BIT12_OR_GPIO2_BIT12			25
> +#define PLIC_INT_GPIO0_BIT13_OR_GPIO2_BIT13			26
> +#define PLIC_INT_GPIO1_BIT0_OR_GPIO2_BIT14			27
> +#define PLIC_INT_GPIO1_BIT1_OR_GPIO2_BIT15			28
> +#define PLIC_INT_GPIO1_BIT2_OR_GPIO2_BIT16			29
> +#define PLIC_INT_GPIO1_BIT3_OR_GPIO2_BIT17			30
> +#define PLIC_INT_GPIO1_BIT4_OR_GPIO2_BIT18			31
> +#define PLIC_INT_GPIO1_BIT5_OR_GPIO2_BIT19			32
> +#define PLIC_INT_GPIO1_BIT6_OR_GPIO2_BIT20			33
> +#define PLIC_INT_GPIO1_BIT7_OR_GPIO2_BIT21			34
> +#define PLIC_INT_GPIO1_BIT8_OR_GPIO2_BIT22			35
> +#define PLIC_INT_GPIO1_BIT9_OR_GPIO2_BIT23			36
> +#define PLIC_INT_GPIO1_BIT10_OR_GPIO2_BIT24			37
> +#define PLIC_INT_GPIO1_BIT11_OR_GPIO2_BIT25			38
> +#define PLIC_INT_GPIO1_BIT12_OR_GPIO2_BIT26			39
> +#define PLIC_INT_GPIO1_BIT13_OR_GPIO2_BIT27			40
> +#define PLIC_INT_GPIO1_BIT14_OR_GPIO2_BIT28			41
> +#define PLIC_INT_GPIO1_BIT15_OR_GPIO2_BIT29			42
> +#define PLIC_INT_GPIO1_BIT16_OR_GPIO2_BIT30			43
> +#define PLIC_INT_GPIO1_BIT17_OR_GPIO2_BIT31			44
> +#define PLIC_INT_GPIO1_BIT18					45
> +#define PLIC_INT_GPIO1_BIT19					46
> +#define PLIC_INT_GPIO1_BIT20					47
> +#define PLIC_INT_GPIO1_BIT21					48
> +#define PLIC_INT_GPIO1_BIT22					49
> +#define PLIC_INT_GPIO1_BIT23					50
> +#define PLIC_INT_GPIO0_NON_DIRECT				51
> +#define PLIC_INT_GPIO1_NON_DIRECT				52
> +#define PLIC_INT_GPIO2_NON_DIRECT				53
> +#define PLIC_INT_SPI0						54
> +#define PLIC_INT_SPI1						55
> +#define PLIC_INT_CAN0						56
> +#define PLIC_INT_CAN1						57
> +#define PLIC_INT_I2C0_MAIN					58
> +#define PLIC_INT_I2C0_ALERT					59
> +#define PLIC_INT_I2C0_SUS					60
> +#define PLIC_INT_I2C1_MAIN					61
> +#define PLIC_INT_I2C1_ALERT					62
> +#define PLIC_INT_I2C1_SUS					63
> +#define PLIC_INT_MAC0_INT					64
> +#define PLIC_INT_MAC0_QUEUE1					65
> +#define PLIC_INT_MAC0_QUEUE2					66
> +#define PLIC_INT_MAC0_QUEUE3					67
> +#define PLIC_INT_MAC0_EMAC					68
> +#define PLIC_INT_MAC0_MMSL					69
> +#define PLIC_INT_MAC1_INT					70
> +#define PLIC_INT_MAC1_QUEUE1					71
> +#define PLIC_INT_MAC1_QUEUE2					72
> +#define PLIC_INT_MAC1_QUEUE3					73
> +#define PLIC_INT_MAC1_EMAC					74
> +#define PLIC_INT_MAC1_MMSL					75
> +#define PLIC_INT_DDRC_TRAIN					76
> +#define PLIC_INT_SCB_INTERRUPT					77
> +#define PLIC_INT_ECC_ERROR					78
> +#define PLIC_INT_ECC_CORRECT					79
> +#define PLIC_INT_RTC_WAKEUP					80
> +#define PLIC_INT_RTC_MATCH					81
> +#define PLIC_INT_TIMER1						82
> +#define PLIC_INT_TIMER2						83
> +#define PLIC_INT_ENVM						84
> +#define PLIC_INT_QSPI						85
> +#define PLIC_INT_USB_DMA					86
> +#define PLIC_INT_USB_MC						87
> +#define PLIC_INT_MMC_MAIN					88
> +#define PLIC_INT_MMC_WAKEUP					89
> +#define PLIC_INT_MMUART0					90
> +#define PLIC_INT_MMUART1					91
> +#define PLIC_INT_MMUART2					92
> +#define PLIC_INT_MMUART3					93
> +#define PLIC_INT_MMUART4					94
> +#define PLIC_INT_G5C_DEVRST					95
> +#define PLIC_INT_G5C_MESSAGE					96
> +#define PLIC_INT_USOC_VC_INTERRUPT				97
> +#define PLIC_INT_USOC_SMB_INTERRUPT				98
> +#define PLIC_INT_E51_0_MAINTENACE				99
> +#define PLIC_INT_WDOG0_MRVP					100
> +#define PLIC_INT_WDOG1_MRVP					101
> +#define PLIC_INT_WDOG2_MRVP					102
> +#define PLIC_INT_WDOG3_MRVP					103
> +#define PLIC_INT_WDOG4_MRVP					104
> +#define PLIC_INT_WDOG0_TOUT					105
> +#define PLIC_INT_WDOG1_TOUT					106
> +#define PLIC_INT_WDOG2_TOUT					107
> +#define PLIC_INT_WDOG3_TOUT					108
> +#define PLIC_INT_WDOG4_TOUT					109
> +#define PLIC_INT_G5C_MSS_SPI					110
> +#define PLIC_INT_VOLT_TEMP_ALARM				111
> +#define PLIC_INT_ATHENA_COMPLETE				112
> +#define PLIC_INT_ATHENA_ALARM					113
> +#define PLIC_INT_ATHENA_BUS_ERROR				114
> +#define PLIC_INT_USOC_AXIC_US					115
> +#define PLIC_INT_USOC_AXIC_DS					116
> +#define PLIC_INT_SPARE						117
> +
> +#define PLIC_INT_FABRIC_F2H_0					118
> +#define PLIC_INT_FABRIC_F2H_1					119
> +#define PLIC_INT_FABRIC_F2H_2					120
> +#define PLIC_INT_FABRIC_F2H_3					121
> +#define PLIC_INT_FABRIC_F2H_4					122
> +#define PLIC_INT_FABRIC_F2H_5					123
> +#define PLIC_INT_FABRIC_F2H_6					124
> +#define PLIC_INT_FABRIC_F2H_7					125
> +#define PLIC_INT_FABRIC_F2H_8					126
> +#define PLIC_INT_FABRIC_F2H_9					127
> +#define PLIC_INT_FABRIC_F2H_10					128
> +#define PLIC_INT_FABRIC_F2H_11					129
> +#define PLIC_INT_FABRIC_F2H_12					130
> +#define PLIC_INT_FABRIC_F2H_13					131
> +#define PLIC_INT_FABRIC_F2H_14					132
> +#define PLIC_INT_FABRIC_F2H_15					133
> +#define PLIC_INT_FABRIC_F2H_16					134
> +#define PLIC_INT_FABRIC_F2H_17					135
> +#define PLIC_INT_FABRIC_F2H_18					136
> +#define PLIC_INT_FABRIC_F2H_19					137
> +#define PLIC_INT_FABRIC_F2H_20					138
> +#define PLIC_INT_FABRIC_F2H_21					139
> +#define PLIC_INT_FABRIC_F2H_22					140
> +#define PLIC_INT_FABRIC_F2H_23					141
> +#define PLIC_INT_FABRIC_F2H_24					142
> +#define PLIC_INT_FABRIC_F2H_25					143
> +#define PLIC_INT_FABRIC_F2H_26					144
> +#define PLIC_INT_FABRIC_F2H_27					145
> +#define PLIC_INT_FABRIC_F2H_28					146
> +#define PLIC_INT_FABRIC_F2H_29					147
> +#define PLIC_INT_FABRIC_F2H_30					148
> +#define PLIC_INT_FABRIC_F2H_31					149
> +#define PLIC_INT_FABRIC_F2H_32					150
> +#define PLIC_INT_FABRIC_F2H_33					151
> +#define PLIC_INT_FABRIC_F2H_34					152
> +#define PLIC_INT_FABRIC_F2H_35					153
> +#define PLIC_INT_FABRIC_F2H_36					154
> +#define PLIC_INT_FABRIC_F2H_37					155
> +#define PLIC_INT_FABRIC_F2H_38					156
> +#define PLIC_INT_FABRIC_F2H_39					157
> +#define PLIC_INT_FABRIC_F2H_40					158
> +#define PLIC_INT_FABRIC_F2H_41					159
> +#define PLIC_INT_FABRIC_F2H_42					160
> +#define PLIC_INT_FABRIC_F2H_43					161
> +#define PLIC_INT_FABRIC_F2H_44					162
> +#define PLIC_INT_FABRIC_F2H_45					163
> +#define PLIC_INT_FABRIC_F2H_46					164
> +#define PLIC_INT_FABRIC_F2H_47					165
> +#define PLIC_INT_FABRIC_F2H_48					166
> +#define PLIC_INT_FABRIC_F2H_49					167
> +#define PLIC_INT_FABRIC_F2H_50					168
> +#define PLIC_INT_FABRIC_F2H_51					169
> +#define PLIC_INT_FABRIC_F2H_52					170
> +#define PLIC_INT_FABRIC_F2H_53					171
> +#define PLIC_INT_FABRIC_F2H_54					172
> +#define PLIC_INT_FABRIC_F2H_55					173
> +#define PLIC_INT_FABRIC_F2H_56					174
> +#define PLIC_INT_FABRIC_F2H_57					175
> +#define PLIC_INT_FABRIC_F2H_58					176
> +#define PLIC_INT_FABRIC_F2H_59					177
> +#define PLIC_INT_FABRIC_F2H_60					178
> +#define PLIC_INT_FABRIC_F2H_61					179
> +#define PLIC_INT_FABRIC_F2H_62					180
> +#define PLIC_INT_FABRIC_F2H_63					181
> +#define PLIC_INT_BUS_ERROR_UNIT_HART_0				182
> +#define PLIC_INT_BUS_ERROR_UNIT_HART_1				183
> +#define PLIC_INT_BUS_ERROR_UNIT_HART_2				184
> +#define PLIC_INT_BUS_ERROR_UNIT_HART_3				185
> +#define PLIC_INT_BUS_ERROR_UNIT_HART_4				186

Some thoughts I had while reading the patch:

(1) Are these constants really helpful?
    - the PLIC is part of the soc, so most references will be handled in
      the core soc dtsi - and only once - and no board devicetree will
      likely need to handle them at all
    - named constants are helpful if they make the number clearer
      but PLIC_INT_GPIO0_BIT2_OR_GPIO2_BIT2
      or PLIC_INT_FABRIC_F2H_47 (and friends) probably do not really
      provide any additional value to someone reading the devicetree source


(2) If they should stay, they probably need a different prefix as they're
      pretty specific to the plic on the polarfire soc, so maybe
      MPFS_PLIC_* ?


Heiko



> +
> +#endif /* _DT_BINDINGS_INTERRUPT_CONTROLLER_MICROCHIP_MPFS_PLIC_H */
> 




