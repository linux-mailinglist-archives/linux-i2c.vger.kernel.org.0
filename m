Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC07545E1F8
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Nov 2021 22:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231977AbhKYVPg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Nov 2021 16:15:36 -0500
Received: from st43p00im-ztbu10063701.me.com ([17.58.63.178]:46817 "EHLO
        st43p00im-ztbu10063701.me.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238840AbhKYVNe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Nov 2021 16:13:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
        t=1637874275; bh=upGKxHmahNemjwC/qgovouI7MEhaJzt9MumjoTdvl+s=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=FWy99SjW+Jr//BDAk7fn8iyqpGRZIqjJG/Xt5SdHmB5k2iYCxNHsoG1FqWjLPFgKb
         N2mBp349OmD9TRHJlqQP8aTsA4O4HZpS/td5E/VBid82ujNtW0uzE93hRZI+68saOk
         pwHUxBdruiXMCM+7ppSSN/rFyr0hBCuP3h4AKRhhxZh5boos9ndFFVOIVjOkSpXpSm
         99xRme8LCaMexheHKZivOS+Q5m2dw4upSmJPmPsN8wcpvbZVCeD65+IpQzvDgFg3oq
         jYHrcqk9d3yoIzHelzQag5lwA0tKZfgL8I8y2+WRCvAUwvwrqMhRopgohDnKuq+Yqx
         XipP3z0E0VsCw==
Received: from gnbcxl0045.gnb.st.com (101.220.150.77.rev.sfr.net [77.150.220.101])
        by st43p00im-ztbu10063701.me.com (Postfix) with ESMTPSA id C62449A0695;
        Thu, 25 Nov 2021 21:04:32 +0000 (UTC)
Date:   Thu, 25 Nov 2021 22:04:28 +0100
From:   Alain Volmat <avolmat@me.com>
To:     wsa@kernel.org, broonie@kernel.org, robh+dt@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [RFC] sti: Conflict in node name for an IP supporting both I2C and
 SPI
Message-ID: <20211125210428.GA27075@gnbcxl0045.gnb.st.com>
Mail-Followup-To: wsa@kernel.org, broonie@kernel.org, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Patrice Chotard <patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425,18.0.790
 definitions=2021-11-25_07:2021-11-25,2021-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2111250118
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

in the STi platform [1], the I2C and SPI controllers are handled by the
same IP, which can be configured in either one or the other mode.
This leads to warnings during the DT build and I was wondering if you could
give me some hints about how such situation should be handled since this
concern DT warnings but also bindings and YAML.

In the SoC DT (dtsi), for each IP, there are 2 entries:

One for the I2C mode (implemented by the driver i2c/busses/i2c-st.c)
                i2c@9840000 {
                        compatible = "st,comms-ssc4-i2c";
                        interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
                        reg = <0x9840000 0x110>;
                        clocks = <&clk_s_c0_flexgen CLK_EXT2F_A9>;
                        clock-names = "ssc";
                        clock-frequency = <400000>;
                        pinctrl-names = "default";
                        pinctrl-0 = <&pinctrl_i2c0_default>;
                        #address-cells = <1>;
                        #size-cells = <0>;

                        status = "disabled";
                };

One for the SPI mode (implemented by the driver spi/spi-st-ssc4.c)
                spi@9840000 {
                        compatible = "st,comms-ssc4-spi";
                        reg = <0x9840000 0x110>;
                        interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
                        clocks = <&clk_s_c0_flexgen CLK_EXT2F_A9>;
                        clock-names = "ssc";
                        pinctrl-0 = <&pinctrl_spi0_default>;
                        pinctrl-names = "default";
                        #address-cells = <1>;
                        #size-cells = <0>;

                        status = "disabled";
                };

So basically, there are 2 nodes, one for each mode, and enabling one or the
other mode is done within the board DT.
Since the address is the same, this obviously leads to warning during the build
of the DT.

arch/arm/boot/dts/stih407-family.dtsi:363.15-376.5: Warning (unique_unit_address): /soc/i2c@9840000: duplicate unit-address (also used in node /soc/spi@9840000)

In order to fix this, I could think of only having one node (for example
I2C) in the SoC DT (dtsi) and then, within each board DT override some of the
properties (including the compatible) to make it be a SPI node when necessary.
However in such case I think this would leads to an issue regarding Yaml.
The YAML for I2C controller [2] mentions that the node name pattern should
be "^i2c(@.*)?", while in case of a SPI controller [3] it should be
"^spi(@.*|-[0-9a-f])*$".
For that reason, this way doesn't seem possible.

What would you advice to handle such case ?

Regards,
Alain

[1] arch/arm/boot/dts/stih407-family.dtsi
[2] schemas/i2c/i2c-controller.yaml
[3] Documentation/devicetree/bindings/spi/spi-controller.yaml
