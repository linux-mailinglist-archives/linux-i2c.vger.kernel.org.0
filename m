Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2CDF45A0EF
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 12:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233241AbhKWLLU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 06:11:20 -0500
Received: from gloria.sntech.de ([185.11.138.130]:51856 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230471AbhKWLLU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 06:11:20 -0500
Received: from ip5f5b2004.dynamic.kabel-deutschland.de ([95.91.32.4] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mpTeV-00086y-0h; Tue, 23 Nov 2021 12:07:55 +0100
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
Subject: Re: [PATCH 01/13] dt-bindings: interrupt-controller: create a header for RISC-V interrupts
Date:   Tue, 23 Nov 2021 12:07:52 +0100
Message-ID: <272946671.hFph3VMliC@diego>
In-Reply-To: <20211108150554.4457-2-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com> <20211108150554.4457-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Montag, 8. November 2021, 16:05:42 CET schrieb conor.dooley@microchip.com:
> From: Ivan Griffin <ivan.griffin@microchip.com>
> 
> Provide named identifiers for device tree for RISC-V interrupts.
> 
> Licensed under GPL and MIT, as this file may be useful to any OS that
> uses device tree.
> 
> Signed-off-by: Ivan Griffin <ivan.griffin@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../interrupt-controller/riscv-hart.h         | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 include/dt-bindings/interrupt-controller/riscv-hart.h
> 
> diff --git a/include/dt-bindings/interrupt-controller/riscv-hart.h b/include/dt-bindings/interrupt-controller/riscv-hart.h
> new file mode 100644
> index 000000000000..e1c32f6090ac
> --- /dev/null
> +++ b/include/dt-bindings/interrupt-controller/riscv-hart.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (C) 2021 Microchip Technology Inc.  All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_RISCV_HART_H
> +#define _DT_BINDINGS_INTERRUPT_CONTROLLER_RISCV_HART_H
> +
> +#define HART_INT_U_SOFT   0
> +#define HART_INT_S_SOFT   1
> +#define HART_INT_M_SOFT   3
> +#define HART_INT_U_TIMER  4
> +#define HART_INT_S_TIMER  5
> +#define HART_INT_M_TIMER  7
> +#define HART_INT_U_EXT    8
> +#define HART_INT_S_EXT    9
> +#define HART_INT_M_EXT    11

(1) From checking clic doc [0] I see an additional
	12   CLIC software interrupt
defined.

(2) The doc states that the ordering is a recommendation and
	"not mandatory in all incarnations of the CLIC"
Is that clarified somewhere else that this more than recommended?

Thanks
Heiko


[0] https://github.com/riscv/riscv-fast-interrupt/blob/master/clic.adoc

> +
> +#endif /* _DT_BINDINGS_INTERRUPT_CONTROLLER_RISCV_HART_H */
> 




