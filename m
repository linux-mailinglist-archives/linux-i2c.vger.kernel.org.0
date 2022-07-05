Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EACA5675B7
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jul 2022 19:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233387AbiGER2J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jul 2022 13:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233203AbiGER1x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Jul 2022 13:27:53 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7395020BC9
        for <linux-i2c@vger.kernel.org>; Tue,  5 Jul 2022 10:27:50 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id p11so9203536qkg.12
        for <linux-i2c@vger.kernel.org>; Tue, 05 Jul 2022 10:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version;
        bh=jGv/8a4OE2FF2boAoZjfVNjwwG46katZ6upeh5yB6Bw=;
        b=hTGFQNxyT1qplMGbtaO1BiskwDQoA0l3zJLJuyz4GaTfCC+jZ8sk6fc1vXy7XSlFq1
         LLQMeRPFE4yMuExILF2gsf0kWzm4hM0OrPzs3vfCZvSzOcFoVHA7jqeTFp/VnXVm7BCH
         +bsjLLTECEuK8VW16xkcd77nh9kJ1RbLVBPE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version;
        bh=jGv/8a4OE2FF2boAoZjfVNjwwG46katZ6upeh5yB6Bw=;
        b=ajQjmMyrjG+g+JSJQnuhx+g0rsH7dA7iskvdZKicvbevcciFd3OzD6IjNOsZCeSNBB
         KkvWIDUtthofYz87B4cA2nxk4WR2GIW9rLIQOWskOW/mcP1YwVIRhpL7VyBG3+uUWUgz
         bgt4r67s7993FSTK8cJjDCELig8xta38aHjEtGp5aAeRkBsyb1gfL+GSJCpfbRabPlaE
         lRgJ1O6drrqcOCfXaMG7wfRs6BAME+hbA9uB1fZb1EOY7X6/JYDqwTfonSewLrMnK8kd
         lYbmtHYgoPphg+3waZ8Nb//JBA5HbUUrN4MwkQS8IaNoWrk3AIcL8Wk6zmWXwxDuKung
         REXA==
X-Gm-Message-State: AJIora8Vct1apLX05i0SvtoD/altpYSof4Bt2YPMkWfI4zlg0h6dJPHw
        WgKbFwQpjWI/+uz4kkvCnrQXDw==
X-Google-Smtp-Source: AGRyM1tICpJBWTpJluwVWgvr/SiLOtLEOfN8aYULIVJ2nAnAkDYsCqqAiCqdyZRxsnO8pWoWjjJEXw==
X-Received: by 2002:a05:620a:c1b:b0:6af:1f8c:d73d with SMTP id l27-20020a05620a0c1b00b006af1f8cd73dmr24124048qki.536.1657042069366;
        Tue, 05 Jul 2022 10:27:49 -0700 (PDT)
Received: from ubuntu-22.localdomain ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id d8-20020ac85ac8000000b00304e70585f9sm24439851qtd.72.2022.07.05.10.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 10:27:48 -0700 (PDT)
From:   William Zhang <william.zhang@broadcom.com>
To:     Linux ARM List <linux-arm-kernel@lists.infradead.org>
Cc:     joel.peshkin@broadcom.com, kursad.oney@broadcom.com,
        f.fainelli@gmail.com, anand.gore@broadcom.com,
        Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
        philippe.reynes@softathome.com, dan.beygelman@broadcom.com,
        William Zhang <william.zhang@broadcom.com>,
        Al Cooper <alcooperx@gmail.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        Conor Dooley <conor.dooley@microchip.com>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jan Dabros <jsd@semihalf.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jie Deng <jie.deng@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matt Mackall <mpm@selenic.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sunil Goutham <sgoutham@marvell.com>,
        Sven Peter <sven@svenpeter.dev>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tyrone Ting <kfting@nuvoton.com>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 5/9] arm: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA
Date:   Tue,  5 Jul 2022 10:26:09 -0700
Message-Id: <20220705172613.21152-6-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705172613.21152-1-william.zhang@broadcom.com>
References: <20220705172613.21152-1-william.zhang@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000f18cf005e3122ba0"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--000000000000f18cf005e3122ba0
Content-Transfer-Encoding: 8bit

Update ARCH_BCM_63XX in all sources to use ARCHB_BCMBCA instead.

Signed-off-by: William Zhang <william.zhang@broadcom.com>
---

 arch/arm/Kconfig.debug         | 2 +-
 drivers/ata/Kconfig            | 2 +-
 drivers/char/hw_random/Kconfig | 2 +-
 drivers/clk/bcm/Kconfig        | 4 ++--
 drivers/i2c/busses/Kconfig     | 2 +-
 drivers/phy/broadcom/Kconfig   | 2 +-
 drivers/spi/Kconfig            | 2 +-
 drivers/tty/serial/Kconfig     | 4 ++--
 8 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 9b0aa4822d69..792796a348c3 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -271,7 +271,7 @@ choice
 
 	config DEBUG_BCM63XX_UART
 		bool "Kernel low-level debugging on BCM63XX UART"
-		depends on ARCH_BCM_63XX
+		depends on ARCH_BCMBCA
 
 	config DEBUG_BERLIN_UART
 		bool "Marvell Berlin SoC Debug UART"
diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index bb45a9c00514..1c9f4fb2595d 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -148,7 +148,7 @@ config SATA_AHCI_PLATFORM
 config AHCI_BRCM
 	tristate "Broadcom AHCI SATA support"
 	depends on ARCH_BRCMSTB || BMIPS_GENERIC || ARCH_BCM_NSP || \
-		   ARCH_BCM_63XX || COMPILE_TEST
+		   ARCH_BCMBCA || COMPILE_TEST
 	select SATA_HOST
 	help
 	  This option enables support for the AHCI SATA3 controller found on
diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index b3f2d55dc551..3da8e85f8aae 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -87,7 +87,7 @@ config HW_RANDOM_BA431
 config HW_RANDOM_BCM2835
 	tristate "Broadcom BCM2835/BCM63xx Random Number Generator support"
 	depends on ARCH_BCM2835 || ARCH_BCM_NSP || ARCH_BCM_5301X || \
-		   ARCH_BCM_63XX || BCM63XX || BMIPS_GENERIC || COMPILE_TEST
+		   ARCH_BCMBCA || BCM63XX || BMIPS_GENERIC || COMPILE_TEST
 	default HW_RANDOM
 	help
 	  This driver provides kernel-side support for the Random Number
diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
index ec738f74a026..77266afb1c79 100644
--- a/drivers/clk/bcm/Kconfig
+++ b/drivers/clk/bcm/Kconfig
@@ -22,9 +22,9 @@ config CLK_BCM2835
 
 config CLK_BCM_63XX
 	bool "Broadcom BCM63xx clock support"
-	depends on ARCH_BCM_63XX || COMPILE_TEST
+	depends on ARCH_BCMBCA || COMPILE_TEST
 	select COMMON_CLK_IPROC
-	default ARCH_BCM_63XX
+	default ARCH_BCMBCA
 	help
 	  Enable common clock framework support for Broadcom BCM63xx DSL SoCs
 	  based on the ARM architecture
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index b1d7069dd377..acf2a393bd56 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -486,7 +486,7 @@ config I2C_BCM_KONA
 
 config I2C_BRCMSTB
 	tristate "BRCM Settop/DSL I2C controller"
-	depends on ARCH_BCM2835 || ARCH_BCM4908 || ARCH_BCM_63XX || \
+	depends on ARCH_BCM2835 || ARCH_BCM4908 || ARCH_BCMBCA || \
 		   ARCH_BRCMSTB || BMIPS_GENERIC || COMPILE_TEST
 	default y
 	help
diff --git a/drivers/phy/broadcom/Kconfig b/drivers/phy/broadcom/Kconfig
index 849c4204f550..93a6a8ee4716 100644
--- a/drivers/phy/broadcom/Kconfig
+++ b/drivers/phy/broadcom/Kconfig
@@ -83,7 +83,7 @@ config PHY_NS2_USB_DRD
 config PHY_BRCM_SATA
 	tristate "Broadcom SATA PHY driver"
 	depends on ARCH_BRCMSTB || ARCH_BCM_IPROC || BMIPS_GENERIC || \
-		   ARCH_BCM_63XX || COMPILE_TEST
+		   ARCH_BCMBCA || COMPILE_TEST
 	depends on OF
 	select GENERIC_PHY
 	default ARCH_BCM_IPROC
diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 2d034459e79f..8e550269d488 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -183,7 +183,7 @@ config SPI_BCM63XX
 
 config SPI_BCM63XX_HSSPI
 	tristate "Broadcom BCM63XX HS SPI controller driver"
-	depends on BCM63XX || BMIPS_GENERIC || ARCH_BCM_63XX || COMPILE_TEST
+	depends on BCM63XX || BMIPS_GENERIC || ARCH_BCMBCA || COMPILE_TEST
 	help
 	  This enables support for the High Speed SPI controller present on
 	  newer Broadcom BCM63XX SoCs.
diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 8a3ee1525d80..e3279544b03c 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -1100,8 +1100,8 @@ config SERIAL_TIMBERDALE
 config SERIAL_BCM63XX
 	tristate "Broadcom BCM63xx/BCM33xx UART support"
 	select SERIAL_CORE
-	depends on ARCH_BCM4908 || ARCH_BCM_63XX || BCM63XX || BMIPS_GENERIC || COMPILE_TEST
-	default ARCH_BCM4908 || ARCH_BCM_63XX || BCM63XX || BMIPS_GENERIC
+	depends on ARCH_BCM4908 || ARCH_BCMBCA || BCM63XX || BMIPS_GENERIC || COMPILE_TEST
+	default ARCH_BCM4908 || ARCH_BCMBCA || BCM63XX || BMIPS_GENERIC
 	help
 	  This enables the driver for the onchip UART core found on
 	  the following chipsets:
-- 
2.34.1


--000000000000f18cf005e3122ba0
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
TltlrAeBKRJ1M9O/DY5v7L1Yrs//7XIRg/d2ZPAOSGBQzFYjYTFWwNBiR1s1zP0m2y56DPbS5gwj
fqAN/I4PJHIvTh3zUgHXNKadYoYRiPHXfaTWO9UhzysOpQIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUohM5GmNlGWe5wpzDxzIy
+EgzbRswDQYJKoZIhvcNAQELBQADggEBACKu9JSQAYTlmC+JTniO/C/UcXGonATI/muBjWTxtkHc
abZtz0uwzzrRrpV+mbHLGVFFeRbXSLvcEzqHp8VomXifEZlfsE9LajSehzaqhd+np+tmUPz1RlI/
ibZ7vW+1VF18lfoL+wHs2H0fsG6JfoqZldEWYXASXnUrs0iTLgXxvwaQj69cSMuzfFm1X5kWqWCP
W0KkR8025J0L5L4yXfkSO6psD/k4VcTsMJHLN4RfMuaXIT6EM0cNO6h3GypyTuPf1N1X+F6WQPKb
1u+rvdML63P9fX7e7mwwGt5klRnf8aK2VU7mIdYCcrFHaKDTW3fkG6kIgrE1wWSgiZYL400xggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgw28eX6TfvsbNfu
SIMwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIPgYZPgWW4RYqL7NYCmuLdm1S+Ge
H/PcUJV33ZnfqGh6MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIy
MDcwNTE3Mjc0OVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQBW0XC9tAcuZ1pP9F2RiNgMTvLp130Q17o7uHM4h/0RdZT0
CciFab65Efjb4MHR4/uVx3CHcwlnpoG1O/8A7BoEtk73kLP4rcGscR2NHuUtvxS0Cs9osf+mUKiP
RcQfjOTKBKsr0o8agx6U1+XkbQBpHgKnCrJhasMeE5HgtcKNjmFApxiPHPlqFQmne1DZr4ubeDHs
jzmTZ6kKNd6Eqiwh7om6T2u0vAk613nOpnxffhxgqrxkgsuKW1TuKbHvwgig0dIKoNom99Kk3Thg
TZ7K/Y1CZiX92+evGTHNyycM2vjW8/xE3/IQGRJhrS7vE3S3YWUbNNB6geVPXpRbB+TL
--000000000000f18cf005e3122ba0--
