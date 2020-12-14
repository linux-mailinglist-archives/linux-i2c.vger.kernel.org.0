Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 988882D9835
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Dec 2020 13:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439116AbgLNMov (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Dec 2020 07:44:51 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9198 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439081AbgLNMor (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Dec 2020 07:44:47 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CvgzQ0cBCzkrm1;
        Mon, 14 Dec 2020 20:43:14 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.9) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Mon, 14 Dec 2020 20:43:53 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Wolfram Sang <wsa@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v2 1/1] dt-bindings: i2c: dw: cancel mandatory requirements for "#address-cells" and "#size-cells"
Date:   Mon, 14 Dec 2020 20:43:47 +0800
Message-ID: <20201214124347.2120-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20201214124347.2120-1-thunder.leizhen@huawei.com>
References: <20201214124347.2120-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The "#address-cells" and "#size-cells" are required only when the I2C
controller has subnodes. However, some I2C controllers defined in
"arch/arm64/boot/dts/amd/" and "arch/arm64/boot/dts/hisilicon/"
directories do not have child nodes. So they don't need these two
properties and don't write them explicitly.

Therefore, setting properties "#address-cells" and "#size-cells" as
"required" in this yaml file causes the following warnings:
/root/linux-next/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dt.yaml: \
i2c@f7100000: '#address-cells' is a required property
/root/linux-next/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dt.yaml: \
i2c@f7100000: '#size-cells' is a required property

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index 4f746bef23742e9..c22b66b6219eaa3 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -101,8 +101,6 @@ unevaluatedProperties: false
 required:
   - compatible
   - reg
-  - "#address-cells"
-  - "#size-cells"
   - interrupts
 
 examples:
@@ -110,8 +108,6 @@ examples:
     i2c@f0000 {
       compatible = "snps,designware-i2c";
       reg = <0xf0000 0x1000>;
-      #address-cells = <1>;
-      #size-cells = <0>;
       interrupts = <11>;
       clock-frequency = <400000>;
     };
@@ -119,8 +115,6 @@ examples:
     i2c@1120000 {
       compatible = "snps,designware-i2c";
       reg = <0x1120000 0x1000>;
-      #address-cells = <1>;
-      #size-cells = <0>;
       interrupts = <12 1>;
       clock-frequency = <400000>;
       i2c-sda-hold-time-ns = <300>;
@@ -148,8 +142,6 @@ examples:
       reg = <0x100400 0x100>, <0x198 0x8>;
       pinctrl-0 = <&i2c_pins>;
       pinctrl-names = "default";
-      #address-cells = <1>;
-      #size-cells = <0>;
       interrupts = <8>;
       clocks = <&ahb_clk>;
     };
-- 
1.8.3


