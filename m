Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B82B674ACB
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 05:36:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbjATEgX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Jan 2023 23:36:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjATEgC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Jan 2023 23:36:02 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 705E3BCE00;
        Thu, 19 Jan 2023 20:34:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 42380B82485;
        Thu, 19 Jan 2023 14:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C97C433D2;
        Thu, 19 Jan 2023 14:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674138317;
        bh=DOwhtS4jE7pYqDk0EUsW0L6K6Omzw1zbVbFWpn/2xH0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DYHW/AHnm5CgG8wG0DFV9sxNV63AtfcEDCq2VQcjXyzfVLfC2GBQ2Co+oV/bwa4BS
         RjkR7vSk1NsDek0YKGlUaQusQFpsxv4XtrX2pmHqtTK2GVgCMUSpU06vlAOW/In8MC
         X0cFueOfUdA8CYH8Cxgi3BQHdG/6LIdnwU3KTECmgHGcAlYmywiUppGVQD2qYnPDm1
         yHkKWR75sKDaKUWU4uZZw5zavEa/m/IOBLihr5jiyy+Kj4eBNiUGwOzlwgjTbkt+T8
         42c+W2p8W4TvgV/d5oRmD2ac2BJCuHnpVQjz79n/k4IkJXjiofs3NzealJhVWEfnZC
         UzKnCX+IiQ7qg==
Date:   Thu, 19 Jan 2023 14:25:12 +0000
From:   Lee Jones <lee@kernel.org>
To:     nick.hawkins@hpe.com
Cc:     verdun@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/5] ARM: Add GXP I2C Support
Message-ID: <Y8lSyJWm+JAQw3AW@google.com>
References: <20230117204439.76841-1-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230117204439.76841-1-nick.hawkins@hpe.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 17 Jan 2023, nick.hawkins@hpe.com wrote:

> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> The GXP SoC supports 10 I2C engines. Each I2C engine is completely
> independent and can function both as an I2C master and I2C slave. The
> I2C master can operate in a multi master environment. The engines support
> a scalable speed from 8kHZ to 1.5 Mhz.
> 
> ---
> 
> Changes since v1:
>  *Removed yaml documentation of hpe,gxp-sysreg as it has been
>   applied to syscon.yaml
>  *Made i2cX a generic node name i2c in dts file
>  *Added status field to the dtsi and the dts for i2c bus
>  *Removed unnecessary size-cells and address-cells from yaml
>  *Removed phandle from hpe,sysreg-phandle
>  *Changed hpe,i2c-max-bus-freq to clock-frequency
>  *Removed rogue tab in structure definition
>  *Removed use of __iomem *base local variables as it was
>   unnecessary
>  *Switched #if IS_ENABLED() -> if (IS_ENABLED()) inside
>   functions
>  *Removed use of pr_* functions
>  *Removed informational prints in register and unregister
>   functions
>  *Removed print from interrupt handler
>  *Removed informational prints from probe function
>  *Switched dev_err -> dev_err_probe in probe function
>  *Used the respective helper for mapping the resource to
>   __iomem
> 
> Nick Hawkins (5):
>   i2c: hpe: Add GXP SoC I2C Controller
>   dt-bindings: i2c: Add hpe,gxp-i2c
>   ARM: dts: hpe: Add I2C Topology
>   ARM: multi_v7_defconfig: add gxp i2c module
>   MAINTAINERS: Add HPE GXP I2C Support
> 
>  .../devicetree/bindings/i2c/hpe,gxp-i2c.yaml  |  54 ++
>  MAINTAINERS                                   |   2 +
>  arch/arm/boot/dts/hpe-bmc-dl360gen10.dts      | 109 ++++
>  arch/arm/boot/dts/hpe-gxp.dtsi                | 125 ++++
>  arch/arm/configs/multi_v7_defconfig           |   1 +
>  drivers/i2c/busses/Kconfig                    |   7 +
>  drivers/i2c/busses/Makefile                   |   1 +
>  drivers/i2c/busses/i2c-gxp.c                  | 609 ++++++++++++++++++
>  8 files changed, 908 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
>  create mode 100644 drivers/i2c/busses/i2c-gxp.c

Not trying to be rude, but why have you sent this to me?

-- 
Lee Jones [李琼斯]
