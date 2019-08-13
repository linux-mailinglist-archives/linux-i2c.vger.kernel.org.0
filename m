Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFC6D8BE26
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 18:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbfHMQVR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 12:21:17 -0400
Received: from mout.gmx.net ([212.227.15.19]:45051 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727211AbfHMQVQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Aug 2019 12:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565713257;
        bh=iDUcfRWgj6xMZ6ufkHWxUXFO8H+8dzKn12ZcmJVMWeI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=dCCwDtMigstSqGI9gP6G2PaZPNT5E4d3jocGaFRRFzopTdUVIYfODuCd04Y9grOhM
         fw2AB4t0MVxKCr3o4tdT0O4Hro1D+Aj4jbA5bpj0KChoG9/4F3EnTbPXUO0Dv5GHgo
         PjaC1CmUMOxf50c0Yg+IVNQGGlIWLQGSfxtFqQxk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M3lc9-1hxIIF3UNH-000xKJ; Tue, 13 Aug 2019 18:20:56 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 01/13] ARM: dts: bcm283x: Enable HDMI at board level
Date:   Tue, 13 Aug 2019 18:20:36 +0200
Message-Id: <1565713248-4906-2-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:YeUUJDIN5zMfxRBinVGGPBzmrODzPMlVYsAXObRVUltuHVuiyj/
 PB/mvRpGBXubvAnEdwOGqM10roF2Q5/iYO0jGY2RtHz42ErMNzJkUIXjscRrf+knxTd4mmK
 B9buV8kkhs0YVT91EkuamKADVi7RIJ7gV1Ejlqxd9MlGN4tKoVUXnrMyc9fZ6gSyrnyCU1U
 3qut7AU+rBD+AOd114wpA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fNRUHP566jo=:GTXSW49JCETG09U/9GoNNk
 A/UQoeRsY1ChScmzOVh5PnI0AZRjP6v3u/2EaepghWRoswOKqMo9RcAGsF/AA3+p5Fa2pRedS
 m90GqZY1f85W3Olw4YF5Y49us7+ztI0l/L86X89Wu3aA9a7XzLE++W8mGxQubtq9qiXTEIr5j
 DPRpdUr6uVyg0oPw2HUf843PpTE59IMdqnB689C5Vcsx4UKEP4nKyXeF9CGHOl5OrMZFOa1FG
 Yu/NybQNj/aMJY84EWv0JXEdPDPB5GzGNVUw67zbbtM8f4AUMHaSgeDOjZ7qM5A3FbW9O9XmC
 HGFyhBXWRYik+LjnZEjm6zQJ3xbbwtrFyVfdqsTTVZpC0Djk+JmsRePirxn4EVzkOPQHpoFFb
 ZZ5Wklbr2KsBd/9/67gERBAdcgs0TiDfys2ENJm183jIaRQcLsvSRNFIygwQizB5uAMyjdfzd
 bE+wZfzYixUnDcx+vWGTyaOLAmUf+dG8IXCxcxTM0N6XX1+9ai93aCiu4vBXRvQUOpEGDmvkD
 KNyr5gP1GpKxs8njI5Rr5pZ5NppDDU0X9+X3WPSICv1IgNYmvYaw0YIZvMsM5rzitoLQzA1Cl
 2yPNdae/e2E0LbEJfhrU8GhhrZZ3zeg2xRTH5jlgqLF9gqPU4OZwS9qkEBzu5s9GqihFo0QRG
 sNuJcUYwUMCarZjgZVg8ENvZ6I7oLADRsZyS0cASCAu5BSFZ9nY2WPLmUxTmgQudYPUvBJAZh
 JNGAC5v5pmPa0fLopxi5Bt0CVtJmQDlHQekpI7baUS6QMSRGGIBXO9dCfM9Va3EkpNBolxtCd
 jl6O5xn9KiBaRcGWCobQic7I+bl91lMMWOb4oHpS53s/OwxpgmOMo352Iki+EVfZe/QSRchYr
 V6fpzpDCp/Ja/vBtXACJLKj2kZ4nWQ1zhnpmlpIVrOyFxy03tkbNq+vuHKteZiqoGDIlsHGu1
 1q+TJeJNaLVXkaDXj6JjpIcnog+igGXWrPd2Soovl+ExD0ef6XAwiLQyaGBWR27oZTDUXKylq
 uzEy7qf39vJmO8aQ6rBnBjeWwqPGsPUJ6wAz8ZV24AAKxbIxp423HZzyn4B59DqyxXi5S3CGx
 Np+9NfcMbBkXMRAn7iloX1KYBIJAAJF+0F5Ks1SL8vBIrNKrHuolH3Udg==
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There might be headless setups of the Compute Module without HDMI,
so better enable HDMI at board level. Btw this allows moving HDMI
into bcm2835-common.dtsi.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts   | 2 ++
 arch/arm/boot/dts/bcm2835-rpi-a.dts        | 2 ++
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts   | 2 ++
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts   | 2 ++
 arch/arm/boot/dts/bcm2835-rpi-b.dts        | 2 ++
 arch/arm/boot/dts/bcm2835-rpi-cm1-io1.dts  | 2 ++
 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts   | 2 ++
 arch/arm/boot/dts/bcm2835-rpi-zero.dts     | 2 ++
 arch/arm/boot/dts/bcm2835-rpi.dtsi         | 5 -----
 arch/arm/boot/dts/bcm2836-rpi-2-b.dts      | 2 ++
 arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts | 2 ++
 arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts | 2 ++
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts      | 2 ++
 arch/arm/boot/dts/bcm2837-rpi-cm3-io3.dts  | 2 ++
 14 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts b/arch/arm/boot/dts/=
bcm2835-rpi-a-plus.dts
index 5b42e9a..6c8ce39 100644
=2D-- a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
@@ -104,6 +104,8 @@

 &hdmi {
 	hpd-gpios =3D <&gpio 46 GPIO_ACTIVE_LOW>;
+	power-domains =3D <&power RPI_POWER_DOMAIN_HDMI>;
+	status =3D "okay";
 };

 &pwm {
diff --git a/arch/arm/boot/dts/bcm2835-rpi-a.dts b/arch/arm/boot/dts/bcm28=
35-rpi-a.dts
index b716214..17fdd48 100644
=2D-- a/arch/arm/boot/dts/bcm2835-rpi-a.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-a.dts
@@ -99,6 +99,8 @@

 &hdmi {
 	hpd-gpios =3D <&gpio 46 GPIO_ACTIVE_HIGH>;
+	power-domains =3D <&power RPI_POWER_DOMAIN_HDMI>;
+	status =3D "okay";
 };

 &pwm {
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts b/arch/arm/boot/dts/=
bcm2835-rpi-b-plus.dts
index 3318082..b0355c2 100644
=2D-- a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
@@ -106,6 +106,8 @@

 &hdmi {
 	hpd-gpios =3D <&gpio 46 GPIO_ACTIVE_LOW>;
+	power-domains =3D <&power RPI_POWER_DOMAIN_HDMI>;
+	status =3D "okay";
 };

 &pwm {
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts b/arch/arm/boot/dts/=
bcm2835-rpi-b-rev2.dts
index 97d7eb5..33b3b5c 100644
=2D-- a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
@@ -99,6 +99,8 @@

 &hdmi {
 	hpd-gpios =3D <&gpio 46 GPIO_ACTIVE_HIGH>;
+	power-domains =3D <&power RPI_POWER_DOMAIN_HDMI>;
+	status =3D "okay";
 };

 &pwm {
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b.dts b/arch/arm/boot/dts/bcm28=
35-rpi-b.dts
index 37e02a1..2b69957 100644
=2D-- a/arch/arm/boot/dts/bcm2835-rpi-b.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b.dts
@@ -94,6 +94,8 @@

 &hdmi {
 	hpd-gpios =3D <&gpio 46 GPIO_ACTIVE_HIGH>;
+	power-domains =3D <&power RPI_POWER_DOMAIN_HDMI>;
+	status =3D "okay";
 };

 &pwm {
diff --git a/arch/arm/boot/dts/bcm2835-rpi-cm1-io1.dts b/arch/arm/boot/dts=
/bcm2835-rpi-cm1-io1.dts
index 41afea4..a75c882 100644
=2D-- a/arch/arm/boot/dts/bcm2835-rpi-cm1-io1.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-cm1-io1.dts
@@ -79,6 +79,8 @@

 &hdmi {
 	hpd-gpios =3D <&gpio 46 GPIO_ACTIVE_LOW>;
+	power-domains =3D <&power RPI_POWER_DOMAIN_HDMI>;
+	status =3D "okay";
 };

 &sdhost {
diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts b/arch/arm/boot/dts/=
bcm2835-rpi-zero-w.dts
index f38f388..09a088f 100644
=2D-- a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
@@ -105,6 +105,8 @@

 &hdmi {
 	hpd-gpios =3D <&gpio 46 GPIO_ACTIVE_LOW>;
+	power-domains =3D <&power RPI_POWER_DOMAIN_HDMI>;
+	status =3D "okay";
 };

 &sdhci {
diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero.dts b/arch/arm/boot/dts/bc=
m2835-rpi-zero.dts
index 5fd0686..6dd93c6 100644
=2D-- a/arch/arm/boot/dts/bcm2835-rpi-zero.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-zero.dts
@@ -101,6 +101,8 @@

 &hdmi {
 	hpd-gpios =3D <&gpio 46 GPIO_ACTIVE_LOW>;
+	power-domains =3D <&power RPI_POWER_DOMAIN_HDMI>;
+	status =3D "okay";
 };

 &sdhost {
diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm283=
5-rpi.dtsi
index f5125b7..6c6a7f6 100644
=2D-- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -67,11 +67,6 @@
 	power-domains =3D <&power RPI_POWER_DOMAIN_USB>;
 };

-&hdmi {
-	power-domains =3D <&power RPI_POWER_DOMAIN_HDMI>;
-	status =3D "okay";
-};
-
 &vec {
 	power-domains =3D <&power RPI_POWER_DOMAIN_VEC>;
 	status =3D "okay";
diff --git a/arch/arm/boot/dts/bcm2836-rpi-2-b.dts b/arch/arm/boot/dts/bcm=
2836-rpi-2-b.dts
index 6a89999..0455a68 100644
=2D-- a/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
+++ b/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
@@ -106,6 +106,8 @@

 &hdmi {
 	hpd-gpios =3D <&gpio 46 GPIO_ACTIVE_LOW>;
+	power-domains =3D <&power RPI_POWER_DOMAIN_HDMI>;
+	status =3D "okay";
 };

 &pwm {
diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts b/arch/arm/boot/dt=
s/bcm2837-rpi-3-a-plus.dts
index 0e29aaa..66ab35e 100644
=2D-- a/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts
@@ -118,6 +118,8 @@

 &hdmi {
 	hpd-gpios =3D <&gpio 28 GPIO_ACTIVE_LOW>;
+	power-domains =3D <&power RPI_POWER_DOMAIN_HDMI>;
+	status =3D "okay";
 };

 &pwm {
diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts b/arch/arm/boot/dt=
s/bcm2837-rpi-3-b-plus.dts
index a1487ae..74ed6d0 100644
=2D-- a/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
@@ -125,6 +125,8 @@

 &hdmi {
 	hpd-gpios =3D <&gpio 28 GPIO_ACTIVE_LOW>;
+	power-domains =3D <&power RPI_POWER_DOMAIN_HDMI>;
+	status =3D "okay";
 };

 &pwm {
diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm=
2837-rpi-3-b.dts
index a36bfdb..054ecaa 100644
=2D-- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
@@ -126,6 +126,8 @@

 &hdmi {
 	hpd-gpios =3D <&expgpio 4 GPIO_ACTIVE_LOW>;
+	power-domains =3D <&power RPI_POWER_DOMAIN_HDMI>;
+	status =3D "okay";
 };

 /* uart0 communicates with the BT module */
diff --git a/arch/arm/boot/dts/bcm2837-rpi-cm3-io3.dts b/arch/arm/boot/dts=
/bcm2837-rpi-cm3-io3.dts
index 433e306..588d941 100644
=2D-- a/arch/arm/boot/dts/bcm2837-rpi-cm3-io3.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-cm3-io3.dts
@@ -78,6 +78,8 @@

 &hdmi {
 	hpd-gpios =3D <&expgpio 1 GPIO_ACTIVE_LOW>;
+	power-domains =3D <&power RPI_POWER_DOMAIN_HDMI>;
+	status =3D "okay";
 };

 &sdhost {
=2D-
2.7.4

