Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36437A651B
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 11:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbfICJZx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 05:25:53 -0400
Received: from mx2.suse.de ([195.135.220.15]:54278 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726840AbfICJZw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 05:25:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C6340ABC7
        for <linux-i2c@vger.kernel.org>; Tue,  3 Sep 2019 09:25:51 +0000 (UTC)
Date:   Tue, 3 Sep 2019 11:26:00 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: [PATCH 7/7] decode-dimms: Point the user to the right drivers
Message-ID: <20190903112600.3db9caef@endymion>
In-Reply-To: <20190903111706.43f9bc2b@endymion>
References: <20190903111706.43f9bc2b@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The header comment only mentioned the legacy eeprom driver, while the
at24 and ee1004 drivers should be used nowadays.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 eeprom/decode-dimms |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

--- i2c-tools.orig/eeprom/decode-dimms	2019-09-03 10:41:14.805360317 +0200
+++ i2c-tools/eeprom/decode-dimms	2019-09-03 10:53:19.259559561 +0200
@@ -22,9 +22,12 @@
 #    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 #    MA 02110-1301 USA.
 #
-#
-# The eeprom driver must be loaded (unless option -x is used). For kernels
-# older than 2.6.0, the eeprom driver can be found in the lm-sensors package.
+# A kernel driver must be loaded (unless option -x is used). Up to DDR3,
+# you need either the at24 driver (in the kernel tree since v2.6.27) or
+# the legacy eeprom driver (in the kernel tree since v2.6.0). For kernels
+# older than 2.6.0, the eeprom driver can be found in the lm-sensors 2
+# package. For DDR4, you need the ee1004 driver (in the kernel tree since
+# kernel v4.20).
 #
 # References:
 # PC SDRAM Serial Presence

-- 
Jean Delvare
SUSE L3 Support
