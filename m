Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7566F23DE1F
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 19:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbgHFRWe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 13:22:34 -0400
Received: from www.zeus03.de ([194.117.254.33]:59448 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730400AbgHFRV6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 6 Aug 2020 13:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=RmIIiEsjof6RecDUXQvDxCUtUgZ
        kIvmo3hbuvZuq9/w=; b=yH9DSscvUhF1cfFq0Ul+mdure037qA7bIWM/+HYSPKR
        L3K3uIawPgO5Y/tj4upfZw8bHkUVYwJphafVqkOH/JChiHXHB7UNXPt751YcYeFx
        tV9PbDV2K0dldhvM6S9Fohn0ZY2bVyPNifIeSCvLDEby6yZt4IETblGALtH4Sxtc
        =
Received: (qmail 3392327 invoked from network); 6 Aug 2020 16:54:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Aug 2020 16:54:34 +0200
X-UD-Smtp-Session: l3s3148p1@vAWgqjas92Yut2cI
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-tools] add BUGS section to manpages
Date:   Thu,  6 Aug 2020 16:54:21 +0200
Message-Id: <20200806145421.1389-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

For all manpages installed on my Debian system, add a BUGS section, so
people can easily find whom to contact.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 eeprom/decode-dimms.1     | 3 +++
 eeprom/decode-vaio.1      | 3 +++
 stub/i2c-stub-from-dump.8 | 4 ++++
 tools/i2cdetect.8         | 4 ++++
 tools/i2cdump.8           | 4 ++++
 tools/i2cget.8            | 4 ++++
 tools/i2cset.8            | 4 ++++
 tools/i2ctransfer.8       | 4 ++++
 8 files changed, 30 insertions(+)

diff --git a/eeprom/decode-dimms.1 b/eeprom/decode-dimms.1
index 710d6bf..c684500 100644
--- a/eeprom/decode-dimms.1
+++ b/eeprom/decode-dimms.1
@@ -62,6 +62,9 @@ Same as -x except treat multibyte hex data as little endian
 .TP
 .B \-h, --help
 Display the usage summary
+.SH BUGS
+To report bugs or send fixes, please write to the Linux I2C mailing list
+<linux-i2c@vger.kernel.org>.
 .SH SEE ALSO
 .BR decode-vaio (1)
 .SH AUTHORS
diff --git a/eeprom/decode-vaio.1 b/eeprom/decode-vaio.1
index 125d597..9bdcacf 100644
--- a/eeprom/decode-vaio.1
+++ b/eeprom/decode-vaio.1
@@ -29,6 +29,9 @@ The purpose of the
 tool is to decode the information found in the Sony Vaio laptop
 identification EEPROMs.
 The tool requires the eeprom kernel module to be loaded.
+.SH BUGS
+To report bugs or send fixes, please write to the Linux I2C mailing list
+<linux-i2c@vger.kernel.org>.
 .SH SEE ALSO
 .BR decode-dimms (1)
 .SH AUTHOR
diff --git a/stub/i2c-stub-from-dump.8 b/stub/i2c-stub-from-dump.8
index b1550ed..3d55ac9 100644
--- a/stub/i2c-stub-from-dump.8
+++ b/stub/i2c-stub-from-dump.8
@@ -45,6 +45,10 @@ There are some limitations to the kind of devices that can be handled:
 .IP \(bu
 Device must not have banks (as most Winbond devices do).
 
+.SH BUGS
+To report bugs or send fixes, please write to the Linux I2C mailing list
+<linux-i2c@vger.kernel.org>.
+
 .SH SEE ALSO
 i2cdump(8), i2cdetect(8), i2cset(8)
 
diff --git a/tools/i2cdetect.8 b/tools/i2cdetect.8
index 14c1f18..9e9f7cc 100644
--- a/tools/i2cdetect.8
+++ b/tools/i2cdetect.8
@@ -113,6 +113,10 @@ using the "receive byte" method, after user confirmation:
 .RE
 .fi
 
+.SH BUGS
+To report bugs or send fixes, please write to the Linux I2C mailing list
+<linux-i2c@vger.kernel.org>.
+
 .SH SEE ALSO
 i2cdump(8), i2cget(8), i2cset(8), i2ctransfer(8), sensors-detect(8)
 
diff --git a/tools/i2cdump.8 b/tools/i2cdump.8
index 18bf600..6acfcc2 100644
--- a/tools/i2cdump.8
+++ b/tools/i2cdump.8
@@ -116,6 +116,10 @@ user confirmation:
 .RE
 .fi
 
+.SH BUGS
+To report bugs or send fixes, please write to the Linux I2C mailing list
+<linux-i2c@vger.kernel.org>.
+
 .SH SEE ALSO
 i2cdetect(8), i2cget(8), i2cset(8), i2ctransfer(8), isadump(8)
 
diff --git a/tools/i2cget.8 b/tools/i2cget.8
index 680279f..ac4024a 100644
--- a/tools/i2cget.8
+++ b/tools/i2cget.8
@@ -113,6 +113,10 @@ equivalent, so this is the only way to read data from a large EEPROM if your
 master isn't fully I2C capable. With a fully I2C capable master, you would
 use \fIi2ctransfer\fR to achieve the same in a safe and faster way.
 
+.SH BUGS
+To report bugs or send fixes, please write to the Linux I2C mailing list
+<linux-i2c@vger.kernel.org>.
+
 .SH SEE ALSO
 i2cdetect(8), i2cdump(8), i2cset(8), i2ctransfer(8)
 
diff --git a/tools/i2cset.8 b/tools/i2cset.8
index 8c73c60..138f545 100644
--- a/tools/i2cset.8
+++ b/tools/i2cset.8
@@ -125,6 +125,10 @@ address 0x48 on bus 1 (i2c-1), after user confirmation:
 Also see i2cget(8) for examples of combined usage of \fIi2cset\fR and
 \fIi2cget\fR.
 
+.SH BUGS
+To report bugs or send fixes, please write to the Linux I2C mailing list
+<linux-i2c@vger.kernel.org>.
+
 .SH SEE ALSO
 i2cdetect(8), i2cdump(8), i2cget(8), i2ctransfer(8), isaset(8)
 
diff --git a/tools/i2ctransfer.8 b/tools/i2ctransfer.8
index 152d20d..3b14375 100644
--- a/tools/i2ctransfer.8
+++ b/tools/i2ctransfer.8
@@ -152,6 +152,10 @@ It can confuse your I2C bus, cause data loss, or have more serious side effects.
 Writing to a serial EEPROM on a memory DIMM (chip addresses between 0x50 and 0x57) may DESTROY your memory, leaving your system unbootable!
 Be extremely careful using this program.
 
+.SH BUGS
+To report bugs or send fixes, please write to the Linux I2C mailing list
+<linux-i2c@vger.kernel.org>.
+
 .SH AUTHORS
 Wolfram Sang, based on
 .B i2cget
-- 
2.27.0

