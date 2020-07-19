Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C93232253B4
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Jul 2020 21:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgGSTgC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Jul 2020 15:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgGSTgC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 Jul 2020 15:36:02 -0400
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E4BC0619D2;
        Sun, 19 Jul 2020 12:36:02 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id AA300BC065;
        Sun, 19 Jul 2020 19:35:59 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     jdelvare@suse.com, wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH for v5.9] i2c: Replace HTTP links with HTTPS ones
Date:   Sun, 19 Jul 2020 21:35:53 +0200
Message-Id: <20200719193553.61319-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++
X-Spam-Level: *****
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely
 or at least not (just) HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 Documentation/i2c/busses/i2c-ali1535.rst | 2 +-
 Documentation/i2c/busses/i2c-ali15x3.rst | 2 +-
 Documentation/i2c/busses/i2c-piix4.rst   | 4 ++--
 drivers/i2c/busses/i2c-ali1535.c         | 2 +-
 drivers/i2c/busses/i2c-ali15x3.c         | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/i2c/busses/i2c-ali1535.rst b/Documentation/i2c/busses/i2c-ali1535.rst
index 6941064730dc..3fe2bad63597 100644
--- a/Documentation/i2c/busses/i2c-ali1535.rst
+++ b/Documentation/i2c/busses/i2c-ali1535.rst
@@ -28,7 +28,7 @@ Additionally, the sequencing of the SMBus transactions has been modified to
 be more consistent with the sequencing recommended by the manufacturer and
 observed through testing.  These changes are reflected in this driver and
 can be identified by comparing this driver to the i2c-ali15x3 driver. For
-an overview of these chips see http://www.acerlabs.com
+an overview of these chips see https://www.acerlabs.com
 
 The SMB controller is part of the M7101 device, which is an ACPI-compliant
 Power Management Unit (PMU).
diff --git a/Documentation/i2c/busses/i2c-ali15x3.rst b/Documentation/i2c/busses/i2c-ali15x3.rst
index d4c1a2a419cb..4e67715c0b1f 100644
--- a/Documentation/i2c/busses/i2c-ali15x3.rst
+++ b/Documentation/i2c/busses/i2c-ali15x3.rst
@@ -67,7 +67,7 @@ They are part of the following ALI chipsets:
   * "Aladdin IV" includes the M1541 Socket 7 North bridge
     with host bus up to 83.3 MHz.
 
-For an overview of these chips see http://www.acerlabs.com. At this time the
+For an overview of these chips see https://www.acerlabs.com. At this time the
 full data sheets on the web site are password protected, however if you
 contact the ALI office in San Jose they may give you the password.
 
diff --git a/drivers/i2c/busses/i2c-ali1535.c b/drivers/i2c/busses/i2c-ali1535.c
index a43deea390f5..9600d98296fa 100644
--- a/drivers/i2c/busses/i2c-ali1535.c
+++ b/drivers/i2c/busses/i2c-ali1535.c
@@ -20,7 +20,7 @@
     the manufacturer and observed through testing.  These
     changes are reflected in this driver and can be identified
     by comparing this driver to the i2c-ali15x3 driver.
-    For an overview of these chips see http://www.acerlabs.com
+    For an overview of these chips see https://www.acerlabs.com
 
     The SMB controller is part of the 7101 device, which is an
     ACPI-compliant Power Management Unit (PMU).
diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index 02185a1cfa77..7156499df800 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -19,7 +19,7 @@
        with AGP and 100MHz CPU Front Side bus
        "Aladdin IV": Includes the M1541 Socket 7 North bridge
        with host bus up to 83.3 MHz.
-    For an overview of these chips see http://www.acerlabs.com
+    For an overview of these chips see https://www.acerlabs.com
 
     The M1533/M1543C devices appear as FOUR separate devices
     on the PCI bus. An output of lspci will show something similar
-- 
2.27.0

