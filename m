Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7336B8BE43
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 18:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbfHMQVS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 12:21:18 -0400
Received: from mout.gmx.net ([212.227.15.19]:56119 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728267AbfHMQVS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Aug 2019 12:21:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565713261;
        bh=Tog8MR549dxeaXAammAwAidG+XtuOysLRumT+/w95sk=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=L/eBvY4AYW2K0JNCMA8b0o9l7cCAPZtfyVK6cfdCldUYaOL7LOA2whNVDK3lQBJMy
         rs4+IUH0RKe88nTd9XLjl7LfTKOZ3vtTWO0hi69S7CFOd3j9w81CLaew22cLcdeYI5
         0vLSKq28ACUD2vBNb1ZXjcCZXhIdt780o2Q9EsHY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MuUj2-1iEPfj20WI-00rXwk; Tue, 13 Aug 2019 18:21:01 +0200
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
Subject: [PATCH V2 10/13] dt-bindings: arm: bcm2835: Add Raspberry Pi 4 to DT schema
Date:   Tue, 13 Aug 2019 18:20:45 +0200
Message-Id: <1565713248-4906-11-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:npR3UJkhcDl4Lun93ftjDmmmRittMWdFbbCbLAdC+Bwi8P2kMrE
 GZiz3OavvpVS78sDhZeguCPtxFNFCgE54zcbOqs0QL74yD/hHNYI4bnMOo5rwmxaQOx+7Sk
 mGmIeTFndJWRDrOYVCam777KxsgFsb8eHlDAFWhwbJgGcuxtDOaf2dxBgjcY78k0GuG9Bwz
 ytMrfyvOwsP8PAtSqLJrg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:loX9HJrMuYk=:Cvg3Qtj6UooChF9sEh6l+8
 ac6FCzBEBZbr8/4141/Mr6O/H1OlcU3YM+9SoXhzLocJ8knyk1vDJgF9jWzVP2ZOICTatZosN
 yDP/UWJl5fXrsmo+n1Or1PS+SCz70q7BRji33nAKzF0TsMVAN4fqtD1CRvhADCU+XNnUBByZa
 caG1UVyXV3RPtZURPvipxMHZwvWrl2EHos2At9sPE4C8NAoqcCbzU7G4SDTuAFLC1REueggwZ
 jTm/SEXlM9h06M5nyZFAHv9/D2eZgiKwIMYszzVWvPVmLHd0TpfeBwFSVIExhAxRU5JqDfgfN
 b/HLXmHqcbz2ykc4yXqcJpNYquvuMXpp8L/gn0tkvTrYcmoyuJWX402sqbp+Sms4PCeV+FoYg
 XOFUbsMQTLSoY50QzEeTbq8oQpHrP+dKjAdn1kXDQ8gyZ9FHUknetOclK6fUqBCJr15eS+kFw
 wB3VOnRs38YcbQBQr0m+HvBqlbqitzar6s5TBtdGcmyHaPGlnUoJJcb+i5TKLg9STeFgI1yDB
 e7XfGW8EW6rywA7vlTQIErlJ7s1tHIfBhxQpAcw0DrIoqhgOQmRgPh4zq6Az36G5Tnvc1clw/
 zmHqWpvft9w49Ej0IoVgIr1lJYjt7a40pEA/TjnztUFG2yYRGZOF5CrDWoq9BShjLqoe3ltRP
 /dQpWSez8W9H4dKg4SJVKLgljMFI/Ij8OGd7TfQ5TykSa7e1K2b/apSfszVWRXyZfwfz4F6xL
 0M+uToxk8K2zOqcdFyIoFmRXhSUGsDcnAMBpea27zzE9oLktUtIlUdijDY+lWZhtY/L9pIIpr
 4MgkCZdCkfAfvZNGDmQ46bPHyECT+PrJWpKuu0JdcWcKSaN3dYc+DkErU99KQNG1M3WBwBdHm
 uyLk0oaLA8ItfCRCsy9n70eOrgDmfEDGlUbr/Nl7wIII+wk9/DVF7fkAAzs/+LWPaGWgFTaY9
 Zmv6QlhiCUFvDNC+yMxhluTcTgOUS4VODLneDCPFMkm7bkLnM5Wzb02ejZ7TAfR2XAGSaKU9x
 9B00ZcJSYD/OO94bqhvgU2LdwUkWVC1CBsevCPEhS/xexmULRc6h9UGhU97/tYh/wrqZ+cOFA
 ZFcCfTwgwNWPf2g9EFVaFq0Q+JsPbMNS69JCt9VONdvOQDHIgOeV3N8Dg==
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add new Raspberry Pi 4 to DT schema.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Eric Anholt <eric@anholt.net>
=2D--
 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Docu=
mentation/devicetree/bindings/arm/bcm/bcm2835.yaml
index 1a4be26..8c3bbad 100644
=2D-- a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
@@ -15,6 +15,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - description: BCM2711 based Boards
+        items:
+          - enum:
+              - raspberrypi,4-model-b
+
       - description: BCM2835 based Boards
         items:
           - enum:
=2D-
2.7.4

