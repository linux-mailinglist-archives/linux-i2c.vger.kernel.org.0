Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6D39422B3E
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Oct 2021 16:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235600AbhJEOkY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Oct 2021 10:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235734AbhJEOkS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Oct 2021 10:40:18 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004A8C061762
        for <linux-i2c@vger.kernel.org>; Tue,  5 Oct 2021 07:38:27 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id y15so21406063lfk.7
        for <linux-i2c@vger.kernel.org>; Tue, 05 Oct 2021 07:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bft5UO0IvHnnqu7NpeleauDM+2TITH2jaKZbwnmA6VM=;
        b=UU9L+06t7QQJbnIFm6uKYIL3+oggbtuy1cE6fNaxN5loz+ex+Wx1xNM0Y61247WKKq
         t5Z+Q7lDLXzCH4RFCU2qjmOSqghXPGLyiEfq5cFrAcCd2Dtp3giGhL0aYbaeH2ZbQkh+
         pBVgWY2c7yWewZ76+sPWg3r5Y47Ll/aR1h+PRecw3yYibWciEUrsXmyfEVCUYQstqFXb
         EOl9cEQZteQwpvPuEVEp/opTKIeazXBV6PD+n7k07E2+5qnKaiOcjXlEXlNC+6iKasjO
         XhSPAZOpi9xso7qEzN/vIQsecPJrYLN2XLDfNyWcZ/zig5mNwz5Rj5YGIAoj/pVNSsN7
         wuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bft5UO0IvHnnqu7NpeleauDM+2TITH2jaKZbwnmA6VM=;
        b=XdB9sL648Wa51NK1LHhCIXf5khh7HTX7MGKImL1fQqgdzTX4rrfH7t3lETxRFUlX6T
         sJJu/uExmR90SuYVkcFkBFkDMTdN5ojkT+Y2bJpo0yPcBtazwbJLgth27gobNrAQ/VXQ
         nsJCNO1YE/SmTGWcWKSKykZxvjCPGOpX5GfEp+mrx0o7UpcnX/xIONghj/vV66WApCml
         98Ho2GuG5AHQXt74bY/NCU5dIY7Gei83bm25XJRPrIoZ0sIxp3+lwJsUCsdGj2Vd0+/T
         DUAsC0mi4A98TogLI74dUA3MEp2BvdCGM3yTG1LPyVm4CWpfRVR6hBa2fp53azfuZ2Af
         Ydjw==
X-Gm-Message-State: AOAM531HkZxXYvaH45fPPoZjIQm71Kf61o1j1pxswcHfdKjtR5aEszNM
        RflLnTSXUwe6ENOg2ElGnhxzJQ==
X-Google-Smtp-Source: ABdhPJxtNs3DBnnLdW1v/+5GPBOiTJoGXMzrfQcqBWcrRZZgflaIbwl8qX/DwjWUYD8Pej361yO4XA==
X-Received: by 2002:a05:6512:21c:: with SMTP id a28mr3890008lfo.626.1633444701917;
        Tue, 05 Oct 2021 07:38:21 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id u25sm1973835lfc.176.2021.10.05.07.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 07:38:21 -0700 (PDT)
From:   =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
To:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, robh+dt@kernel.org,
        p.zabel@pengutronix.de, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, dinguyen@kernel.org, p.yadav@ti.com,
        Tudor.Ambarus@microchip.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        alexandre.belloni@bootlin.com, sre@kernel.org,
        thunder.leizhen@huawei.com, Jonathan.Cameron@huawei.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        ka@semihalf.com, tn@semihalf.com, jam@semihalf.com,
        amstan@google.com,
        =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>,
        Joanna Brozek <jbrozek@antmicro.com>,
        Mariusz Glebocki <mglebocki@antmicro.com>,
        Tomasz Gorochowik <tgorochowik@antmicro.com>,
        Maciej Mikunda <mmikunda@antmicro.com>
Subject: [PATCH v2 4/4] dts: socfpga: Add Mercury+ AA1 devicetree
Date:   Tue,  5 Oct 2021 16:37:48 +0200
Message-Id: <20211005143748.2471647-5-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005143748.2471647-1-pan@semihalf.com>
References: <20211005143748.2471647-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for the Mercury+ AA1 module for Arria 10 SoC FPGA.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
Signed-off-by: Joanna Brozek <jbrozek@antmicro.com>
Signed-off-by: Mariusz Glebocki <mglebocki@antmicro.com>
Signed-off-by: Tomasz Gorochowik <tgorochowik@antmicro.com>
Signed-off-by: Maciej Mikunda <mmikunda@antmicro.com>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/socfpga_arria10_mercury_aa1.dts  | 111 ++++++++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7e0934180724..0a7809eb3795 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1078,6 +1078,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
 	socfpga_arria10_socdk_nand.dtb \
 	socfpga_arria10_socdk_qspi.dtb \
 	socfpga_arria10_socdk_sdmmc.dtb \
+	socfpga_arria10_mercury_aa1.dtb \
 	socfpga_cyclone5_chameleon96.dtb \
 	socfpga_cyclone5_mcvevk.dtb \
 	socfpga_cyclone5_socdk.dtb \
diff --git a/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts b/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts
new file mode 100644
index 000000000000..1e11168b80db
--- /dev/null
+++ b/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "socfpga_arria10.dtsi"
+
+/ {
+
+	model = "Enclustra Mercury AA1";
+	compatible = "altr,socfpga-arria10", "altr,socfpga";
+
+	aliases {
+		ethernet0 = &gmac0;
+		serial1 = &uart1;
+	};
+
+	memory@0 {
+		name = "memory";
+		device_type = "memory";
+		reg = <0x0 0x80000000>; /* 2GB */
+	};
+
+	chosen {
+		stdout-path = "serial1:115200n8";
+	};
+};
+
+&eccmgr {
+	sdmmca-ecc@ff8c2c00 {
+		compatible = "altr,socfpga-sdmmc-ecc";
+		reg = <0xff8c2c00 0x400>;
+		altr,ecc-parent = <&mmc>;
+		interrupts = <15 IRQ_TYPE_LEVEL_HIGH>,
+			     <47 IRQ_TYPE_LEVEL_HIGH>,
+			     <16 IRQ_TYPE_LEVEL_HIGH>,
+			     <48 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
+
+&gmac0 {
+	phy-mode = "rgmii";
+	phy-addr = <0xffffffff>; /* probe for phy addr */
+
+	max-frame-size = <3800>;
+	status = "okay";
+
+	phy-handle = <&phy3>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy3: ethernet-phy@3 {
+			txd0-skew-ps = <0>; /* -420ps */
+			txd1-skew-ps = <0>; /* -420ps */
+			txd2-skew-ps = <0>; /* -420ps */
+			txd3-skew-ps = <0>; /* -420ps */
+			rxd0-skew-ps = <420>; /* 0ps */
+			rxd1-skew-ps = <420>; /* 0ps */
+			rxd2-skew-ps = <420>; /* 0ps */
+			rxd3-skew-ps = <420>; /* 0ps */
+			txen-skew-ps = <0>; /* -420ps */
+			txc-skew-ps = <1860>; /* 960ps */
+			rxdv-skew-ps = <420>; /* 0ps */
+			rxc-skew-ps = <1680>; /* 780ps */
+			reg = <3>;
+		};
+	};
+};
+
+&gpio0 {
+	status = "okay";
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gpio2 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+	busno = <1>;
+	isl12022: isl12022@6f {
+		status = "okay";
+		compatible = "isil,isl12022";
+		reg = <0x6f>;
+	};
+};
+
+/* Following mappings are taken from arria10 socdk dts */
+&mmc {
+	status = "okay";
+	cap-sd-highspeed;
+	broken-cd;
+	bus-width = <4>;
+};
+
+&osc1 {
+	clock-frequency = <33330000>;
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+	dr_mode = "host";
+};
-- 
2.25.1

