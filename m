Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 266629F11C
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2019 19:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729960AbfH0RFM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Aug 2019 13:05:12 -0400
Received: from mout.gmx.net ([212.227.15.18]:41339 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727064AbfH0RFM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 27 Aug 2019 13:05:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566925495;
        bh=4j2ABTJxXzVQpL1MUAY5wsip78ebEuKdC8l4vRx7EGc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=hEwUgqVaNCqE/dzyWKEOO0BL1Jy88FW4iCc+pt0yDQ6MmArvC+vLPcTsPGXAkm9eC
         GoDCMgTHjrrXOf/y+AxpAdpTVZCLpsl1CH20VMGLeQzgvIywGAnPacehTilT8vHzpW
         4rU2dV8iZLl2U9WubhiSlJVN7Zu4pY5zLtjgtROY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0LyEqr-1iEXVC300D-015c7i; Tue, 27 Aug 2019 19:04:55 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Wolfram Sang <wsa@the-dreams.de>, Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 1/3] dt-bindings: i2c: bcm2835: Add brcm,bcm2711 compatible
Date:   Tue, 27 Aug 2019 19:04:14 +0200
Message-Id: <1566925456-5928-2-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566925456-5928-1-git-send-email-wahrenst@gmx.net>
References: <1566925456-5928-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:KrvTLehEGpnLznYvNUOXcPZV4nLSLV7YsDxTvKjwp/Im4ZcKLfx
 NDSV4j3sntIH7leBqwk3CIBRzER5r6wgp0vbCdGJcsykK4HWy9Uha+g/hI0O51rM/wPgiHD
 5I3XnUPLVulET1NJLjQqiXzQRz3B12xFbicDGuOyvTzMDWAo5H+lg1wGVo8hIHn493NHlRG
 N99Q95uNlnMRYyPtesB7A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:W376pQCHREo=:v8k8uKMZ99f8P7I+UOXMs+
 gZukDeraPdNnkwEeoIGqMPHI81RIe1WPdIlkWYwc86131Efjn+zux5cWk9DgQSbvJNXVc7C70
 /GM0pmwOyp0y1sTQXEycle9lHOtj1mSVyj0bIJVlFheyNjkYE411gXx9h6jGxtbqzaMiyIH9k
 7n89Z5GjqsxTRR3oMwXMRe8gHI1UlkAV2KTjEo7spelmXNa26jxxaExIEeaGP7ZH3Iv3jW60t
 cQT7x5UxbV7g2L5x0LqzJEVgjnMlLK06dSw+soDWS+sKjYIMCTBeBNxDOy51i0LKcc/zf7k8x
 JG7pa6BO78XcMcTdbieBZhCH6MyQUoCFNITRQVUwvbt7l8+fG4JTCCIPMr3jBcyrLHUBBr9cK
 JcipZt/SArexNypDTHPEZoDV40C3oaprO10gS4XG81WuJ2g4mHhawjeHgr0oiOLjYpCiQO4qC
 oUa/UjPA9lYxTJiHQiuk0KJbatzmlUC1qOokycotes5eTtfXDHZ7G/eePZel1Hw05dT3fXtpk
 NAIwFnXFlU81a2mj0/sKKy3HP0eWEjb/APD94BvyYKWAGjs+VD/GzjEghpzKjo6zjPJ48XRok
 V7l3CWsEAieuVDyTHAItSMG3ZTO/5mIuNLeRV8i0xIzNeA8eDB0qBFPLBDwmGpTb/a8S2gB0r
 D7kDo9eoJ+8Vb/2+TSs8LVPuSXdURFT8xXLhXL3mfsGjJQutSRtOi8btVSJjZmQpOoKSH66m9
 MGCUeIKKJUY60aBjy02GLTsBVntMQtvxxVMVhnH7rfOeTZ2EaRZvZ6k+YeV6Wir1a+hY3HKD0
 PmFu5QQ+vkFXFVe97qyJe35oH+7jSQrKJ9ciQcfar2ZghQGoTooWUdGtXRUK5FtzlH5C1u9Zb
 xvwajglRrSnkhlv9IrZOxYZlwcyg2Md74dSkVv5zVY8jlpEzhV7RV3qRfbCT1Pb22LjiUPmQH
 ktmFmVhgY3rVGNMPd2w7ktUwAp1488Aggamp/cjJyq5usUfiYGMUj2JNKOcg9ppB8WMZh1hFK
 jVcP68sSvPx3QB/Mlh6b8JpXyim6n4p/mgUeeK5XvHVdiqzRdTQ0aGfsFM+B0aS7tCLbEt6oZ
 fAOvXp/naKOv87IjJm0JF/ynk+Tp0ys9Z/MAdgFU26sKeeV7hB9VZVTZ5Fpq0W2r4ddwYDsQQ
 SrKyJtYdWM2jtp0Hbd4LXL3GMX5VmqUR06Z33XowuoSFMOcw==
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a new compatible for the BCM2711, which hasn't the clock stretch bug.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Eric Anholt <eric@anholt.net>
Reviewed-by: Rob Herring <robh@kernel.org>
=2D--
 Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt b/=
Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
index e9de375..c9a6587 100644
=2D-- a/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
@@ -1,7 +1,9 @@
 Broadcom BCM2835 I2C controller

 Required properties:
=2D- compatible : Should be "brcm,bcm2835-i2c".
+- compatible : Should be one of:
+	"brcm,bcm2711-i2c"
+	"brcm,bcm2835-i2c"
 - reg: Should contain register location and length.
 - interrupts: Should contain interrupt.
 - clocks : The clock feeding the I2C controller.
=2D-
2.7.4

