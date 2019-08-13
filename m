Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1B38BE39
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 18:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728412AbfHMQVT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 12:21:19 -0400
Received: from mout.gmx.net ([212.227.15.18]:48967 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728304AbfHMQVS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Aug 2019 12:21:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565713258;
        bh=ljCWWxQsddXKHwCHwwLRNEuJ6GYiE6WQq8ZhiJ9nBow=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=TrU66qmEYyQhbj0nXpv2a/K8Xn5CO0p9ae2fmLRuve9MxnFqzFG/VG3QIgC35wEbO
         rgB+z2vfDTVAHEv8pkJWtckqy9hmDwEP/YeSBD6UILbIsU0lzGNoVextYk48M09q9a
         JDFSFcSfkwmnZe6B5/sdflRZhheldsTw58Zr48b4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MGz1V-1i1g0Q3rUp-00E6Tv; Tue, 13 Aug 2019 18:20:58 +0200
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
Subject: [PATCH V2 03/13] dt-bindings: bcm2835-cprman: Add bcm2711 support
Date:   Tue, 13 Aug 2019 18:20:38 +0200
Message-Id: <1565713248-4906-4-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:KSfyLs+GVp5WjPQyPhum21eug5l34GiwTaN7iVomfgen/gamzy8
 tgmzYNTBwC1hym+UOSCs2how3XbtQJHBzPXJIVj5AJf7j0XgV/psrhkuM/pTtDn+vrkV9+X
 CAJygQ7hgSc5tJAj5KKML0sbnFGvdy4jM96CD+taNfVhEp8WqW8rm6vSu9pnSg/7asi8Srs
 aHTnO75cC3wfduwf+heww==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Gato0k7oJfA=:NZkdiiHlw7JN+KllaTE9Xa
 hafwVRfb7CVFJoWYI3plj5UsY99g/7MMOyJV8HBAAbStNodEbr04JY2mBBeyO5lpncyL4J9SU
 XHMjJciLMM6zWO4vETdaLhfFyoA2XtFnInL8n18n4PuEKzjSF1ajpKWFNWAkaamTwzEz7s2vB
 TXI3cisMj8fFgdVmaUdp6FGnJrQwm0fj2cPgISh7pNgR21Uv1cXzeqdxfhPeBn3QLtNsMuqU2
 dJyDbYYaHH1LkA5vY3vTdYBb5rVSZYyKzYl0CbhPQ0OJjC3D44Y+MCzRHvmmyupuVNKQeyp7m
 xamx7OHoTg93KTsCan4xcSMJgTW3Yx985VI4s96TpR+KGdRHB4zghuFbopd0uAnNsMtlzg+tY
 KQiFJQwaZ5ScbvZWK/n6VAugwdpC7KmjY/yEfgm1xxUzzjQsdt0ZyDNWWGI5n4J+FRUbxbnTS
 IRV1hhHeOZVcr3n7WCmgIVRX6MC8nxno8mYdkeWSdZwazND4689UmgwvlyCeqeu8kTIZwnMl7
 D3ddJOQ9jl3867Lr8/ICfu50oMqilSGCl7Wdpv6qLq2zIsgo0zAloV/X3zO7CNW758MyIhNC2
 cfAu8UpzQv7dQgU3g9N4cqpWcYvL+HRlQBNJbQ901UlSHa12FmllrKwwyWL0KuR2tNLJ44QQT
 y60+Tbybt3TocMLwGrqpzBbU3fWAwqmP2O6WJVPNrnW+3G7hAL5Y7QMYsevTAHgbtYAIj+Uqb
 ek2YbBYr54I5bmYMN/80ABQei62MjaNMd8y/8VAYwvYxakLH6j1Z8xvKPg25JRqBN/RrnvtMF
 55CHoV0Xdyeje3xtMWCRiufOb5rMPOEgILNYZm5r/NHxI1aJFGn9YNIG2VhK0VPuruUivLkhU
 HRXIKH5H/ncfinmotIFVhkC4B3CfH/idmxBtSVDLf0wUpYWZDQYbPj53nxnlZBgx2p3KiQaWb
 xu4Qu/de203a5jzWyILAkh78HoLw62WLUi1aayq92ypUbHO5TRrUXNnCpvjqow8BZpbn6DUW6
 flnLwr0xb9sA+EZxBb1PpNXT7pky2vqY1tQ51dQ/Iwo3B1BXnsdBhugAq5wFfd2tk2zWbiBeT
 lsD8H8Ou99FadQuPHhDz2jS6OqPMydtYV2SeUoRNEF/7D8eUpkRB0iMW18oS6x4qv/jhLxDL6
 FOQIa8tdIB+xEnJMcoaClb8K0CzDxgJreyy1LhC4C+MBUKJg==
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The new BCM2711 supports an additional clock for the emmc2 block.
So we need an additional compatible.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Eric Anholt <eric@anholt.net>
=2D--
 Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt | 4 +++-
 include/dt-bindings/clock/bcm2835.h                             | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.t=
xt b/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
index dd906db..9e0b03a 100644
=2D-- a/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
+++ b/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
@@ -12,7 +12,9 @@ clock generators, but a few (like the ARM or HDMI) will =
source from
 the PLL dividers directly.

 Required properties:
=2D- compatible:	Should be "brcm,bcm2835-cprman"
+- compatible:	should be one of the following,
+	"brcm,bcm2711-cprman"
+	"brcm,bcm2835-cprman"
 - #clock-cells:	Should be <1>. The permitted clock-specifier values can b=
e
 		  found in include/dt-bindings/clock/bcm2835.h
 - reg:		Specifies base physical address and size of the registers
diff --git a/include/dt-bindings/clock/bcm2835.h b/include/dt-bindings/clo=
ck/bcm2835.h
index 2cec01f..b60c0343 100644
=2D-- a/include/dt-bindings/clock/bcm2835.h
+++ b/include/dt-bindings/clock/bcm2835.h
@@ -58,3 +58,5 @@
 #define BCM2835_CLOCK_DSI1E		48
 #define BCM2835_CLOCK_DSI0P		49
 #define BCM2835_CLOCK_DSI1P		50
+
+#define BCM2711_CLOCK_EMMC2		51
=2D-
2.7.4

