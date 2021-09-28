Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D12D241B54B
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Sep 2021 19:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242077AbhI1Rlh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Sep 2021 13:41:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:35712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242069AbhI1Rlg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Sep 2021 13:41:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4246360E90;
        Tue, 28 Sep 2021 17:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632850797;
        bh=wz591LnCXJxW9tbeCFqIz+lEG7TzLwznltkpkzwUlhs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=c5nT/qkvdPvejKSGpnEKrpeb6tjQzIwHe+1BO8b24voahRUJTaGLMzVfGkQRsTzCy
         ebxkozbatUrART4MedlkUsqMmfxw2HRmuDzDI12+vJRJQ44Rpej9TxI6D0hBxcl0Oh
         mEIASisoFvqSKkDLK31PvI4JzowCjvCDVvaBYc9hULEtc+ihttY++BKBmy+hrmqCMT
         6z3T0MwNjqfoPaAw4M62lLoZz1ytNmxs2X9XKELVX/xgEHNkToe2uuFTdKnFeea1zd
         lxOxGmac+spdgTOUhWuhiVyZtYoaarKPzLBX5TuDazKzQ1fnWNcHNy/qnWmYllyGpz
         5DOkytLaWJPpA==
Received: by mail-ed1-f45.google.com with SMTP id l8so37241308edw.2;
        Tue, 28 Sep 2021 10:39:57 -0700 (PDT)
X-Gm-Message-State: AOAM533+8MH2hLcVhhQxPFFxwh0kHv0B0Malk3tQYxvlhuPKFUUu6uR5
        AcuZqSQ0/k5XiE/2EtNiS+sFO0m4toPaGKe5oQ==
X-Google-Smtp-Source: ABdhPJw+2aohDM44L2GIkVGW0d+FDi1AD/O+XCnfDQ5VUAij0L7aF621b58LHaygqTTDWh/+zVSfb9lrZN3hQb/lM1E=
X-Received: by 2002:a17:906:abd1:: with SMTP id kq17mr7965369ejb.390.1632850791354;
 Tue, 28 Sep 2021 10:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <1632831440-5880-1-git-send-email-abel.vesa@nxp.com>
In-Reply-To: <1632831440-5880-1-git-send-email-abel.vesa@nxp.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 28 Sep 2021 12:39:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLQwdSZLLaL1A=MsHFA7A3iy0XvJbEzja+pdEyNrTboDA@mail.gmail.com>
Message-ID: <CAL_JsqLQwdSZLLaL1A=MsHFA7A3iy0XvJbEzja+pdEyNrTboDA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] arm64: dts: Add i.MX8DXL initial support
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 28, 2021 at 7:17 AM Abel Vesa <abel.vesa@nxp.com> wrote:
>
> This allows i.MX8DXL EVK board to boot to prompt.
>
> Changes since v1:
>  * added commit message for the 8th, 9th and 10th patches
>
> Abel Vesa (5):
>   arm64: dts: imx8-ss-lsio: Add mu5a mailbox
>   arm64: dts: freescale: Add adma subsystem dtsi for imx8dxl
>   dt-bindings: fsl: scu: Add i.MX8DXL ocotp binding
>   dt-bindings: i2c: imx-lpi2c: Add i.MX8DXL compatible match
>   dt-bindings: serial: fsl-lpuart: Add i.MX8DXL compatible
>
> Jacky Bai (5):
>   arm64: dts: freescale: Add the top level dtsi support for imx8dxl
>   arm64: dts: freescale: Add the imx8dxl connectivity subsys dtsi
>   arm64: dts: freescale: Add ddr subsys dtsi for imx8dxl
>   arm64: dts: freescale: Add lsio subsys dtsi for imx8dxl
>   arm64: dts: imx8dxl: Add i.MX8DXL evk board support
>
>  .../bindings/arm/freescale/fsl,scu.txt        |   3 +-
>  .../bindings/i2c/i2c-imx-lpi2c.yaml           |   2 +
>  .../bindings/serial/fsl-lpuart.yaml           |   1 +
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../boot/dts/freescale/imx8-ss-lsio.dtsi      |   7 +
>  arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 266 ++++++++++++++++++
>  .../boot/dts/freescale/imx8dxl-ss-adma.dtsi   |  53 ++++
>  .../boot/dts/freescale/imx8dxl-ss-conn.dtsi   | 137 +++++++++
>  .../boot/dts/freescale/imx8dxl-ss-ddr.dtsi    |  36 +++
>  .../boot/dts/freescale/imx8dxl-ss-lsio.dtsi   |  78 +++++
>  arch/arm64/boot/dts/freescale/imx8dxl.dtsi    | 245 ++++++++++++++++
>  11 files changed, 828 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-lsio.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl.dtsi

Please resend to the DT list if you want the bindings checked and reviewed.

Rob
