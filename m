Return-Path: <linux-i2c+bounces-5283-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 247DF94E09C
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 11:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29C8F1C20E48
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 09:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BF3219FC;
	Sun, 11 Aug 2024 09:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="A37aWJnN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEA6B64E
	for <linux-i2c@vger.kernel.org>; Sun, 11 Aug 2024 09:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723367328; cv=none; b=b/3arZF9KExW9FVWyJsG9+lK4ePk7iXJBttQpRhpBXiD+yVtUm0vQUS6+rOCKAbo4Hin0K9Ox5ujloWS/2zsYM8kfgZLmgVl9uOxeqC5bbjrUDPHKlPL+v060RRq+hpGAx0Lb6d6xVdWorJlmujNi6lVpSho+bem0Yek6Vfuaac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723367328; c=relaxed/simple;
	bh=ujrBwfeRUF419cUKi3j1gN30TYNBTDqKOTHua6zvWcM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BAt86YkW5emYNIdmaK2wJ7oNu3ZVPsNTE8X3H+RUT43wOgo88jyDuj4ufxzZu+FOM4lYMuGo66HoRYIZR8GubtYGnaQn1e0dxsiqKNoKsDBWBc6kR9G3rN56nkM7KlyNX8Bu8kOeAwbmCBN45l5v0YJF+wiDS+U//fmcKTlBJiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=A37aWJnN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=GvsKeqkUg/ZtR4
	vpIWTlwaIk9EGawNQRbiZkAFc5PmQ=; b=A37aWJnNpok8532W/2Az47RkHjvqeP
	1J/aGcQfL+AA1uKkJ3YFkGq7fw8E1JxLOnIeY74F6O1xAYpxHiXmOW6Hj3fEaCls
	skyULSJh9BroMu8v1oraY6H1C0h0YwFVxKw+Q36caeh+lcpgGmYE21wNquWbacO+
	AVBjm6gvrBToZi4Iw47a//uuUwdxk17CXRInKXiK4Crcb9ztCBTfezwvms107i30
	HLqTcyZKWQWJ3j5Jo2JTDM+SWkw+rr08NoEyYxsnwkN64GKsr3I3eeqzIqJZPXe6
	fj0l2uIR5xXyMWMe5Dw9PEreaaP9Hi1bQeXimNNr3IvCUe8BdalPszmw==
Received: (qmail 1055632 invoked from network); 11 Aug 2024 11:08:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2024 11:08:37 +0200
X-UD-Smtp-Session: l3s3148p1@LwvCuGQf/OMujnvj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-tools] treewide: remove FSF address
Date: Sun, 11 Aug 2024 11:08:34 +0200
Message-ID: <20240811090834.5196-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We keep it simply in COPYING. Makes updating much easier.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 eeprog/eeprog.8         | 4 ----
 eeprom/ddcmon           | 5 -----
 eeprom/decode-dimms     | 5 -----
 eeprom/decode-dimms.1   | 4 ----
 eeprom/decode-edid      | 5 -----
 eeprom/decode-vaio      | 5 -----
 eeprom/decode-vaio.1    | 4 ----
 py-smbus/smbusmodule.c  | 5 -----
 stub/i2c-stub-from-dump | 5 -----
 tools/i2cbusses.c       | 5 -----
 tools/i2cbusses.h       | 5 -----
 tools/i2cdetect.c       | 5 -----
 tools/i2cdump.c         | 5 -----
 tools/i2cget.c          | 5 -----
 tools/i2cset.c          | 5 -----
 tools/util.c            | 5 -----
 tools/util.h            | 5 -----
 17 files changed, 82 deletions(-)

diff --git a/eeprog/eeprog.8 b/eeprog/eeprog.8
index 70f78ae..e518ae1 100644
--- a/eeprog/eeprog.8
+++ b/eeprog/eeprog.8
@@ -12,10 +12,6 @@
 .\"  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 .\"  GNU General Public License for more details.
 .\"
-.\"  You should have received a copy of the GNU General Public License along
-.\"  with this program; if not, write to the Free Software Foundation, Inc.,
-.\"  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-.\"
 .TH eeprog "8" "Jul 2013" "i2c-tools" "System Administration"
 .SH NAME
 eeprog \- reads and writes 24Cxx EEPROMs connected to I2C serial bus
diff --git a/eeprom/ddcmon b/eeprom/ddcmon
index 2d31e22..93c0113 100755
--- a/eeprom/ddcmon
+++ b/eeprom/ddcmon
@@ -21,11 +21,6 @@
 #    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 #    GNU General Public License for more details.
 #
-#    You should have received a copy of the GNU General Public License
-#    along with this program; if not, write to the Free Software
-#    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
-#    MA 02110-1301 USA.
-#
 # This script is a replacement for the now deprecated ddcmon kernel driver.
 # Instead of having a dedicated driver, it is better to reuse the standard
 # eeprom driver and implement the EDID-specific code in user-space.
diff --git a/eeprom/decode-dimms b/eeprom/decode-dimms
index 08621a2..92f41e8 100755
--- a/eeprom/decode-dimms
+++ b/eeprom/decode-dimms
@@ -17,11 +17,6 @@
 #    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 #    GNU General Public License for more details.
 #
-#    You should have received a copy of the GNU General Public License
-#    along with this program; if not, write to the Free Software
-#    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
-#    MA 02110-1301 USA.
-#
 # A kernel driver must be loaded (unless option -x is used). Up to DDR3,
 # you need either the at24 driver (in the kernel tree since v2.6.27) or
 # the legacy eeprom driver (in the kernel tree since v2.6.0). For kernels
diff --git a/eeprom/decode-dimms.1 b/eeprom/decode-dimms.1
index c3ce597..91378f6 100644
--- a/eeprom/decode-dimms.1
+++ b/eeprom/decode-dimms.1
@@ -13,10 +13,6 @@
 .\"  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 .\"  GNU General Public License for more details.
 .\"
-.\"  You should have received a copy of the GNU General Public License along
-.\"  with this program; if not, write to the Free Software Foundation, Inc.,
-.\"  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-.\"
 .TH decode-dimms 1 "Nov 2017" "i2c-tools" "User Commands"
 .SH NAME
 decode-dimms \- decode the information found in memory module SPD EEPROMs
diff --git a/eeprom/decode-edid b/eeprom/decode-edid
index 60c3712..d2163dc 100755
--- a/eeprom/decode-edid
+++ b/eeprom/decode-edid
@@ -12,11 +12,6 @@
 #    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 #    GNU General Public License for more details.
 #
-#    You should have received a copy of the GNU General Public License
-#    along with this program; if not, write to the Free Software
-#    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
-#    MA 02110-1301 USA.
-#
 # EEPROM data decoding for EDID. EDID (Extended Display Identification
 # Data) is a VESA standard which allows storing (on manufacturer's side)
 # and retrieving (on user's side) of configuration information about
diff --git a/eeprom/decode-vaio b/eeprom/decode-vaio
index c2aefb8..74ab633 100755
--- a/eeprom/decode-vaio
+++ b/eeprom/decode-vaio
@@ -12,11 +12,6 @@
 #    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 #    GNU General Public License for more details.
 #
-#    You should have received a copy of the GNU General Public License
-#    along with this program; if not, write to the Free Software
-#    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
-#    MA 02110-1301 USA.
-#
 # EEPROM data decoding for Sony Vaio laptops.
 #
 # The at24 or eeprom driver must be loaded. For kernels older than 2.6.0, the
diff --git a/eeprom/decode-vaio.1 b/eeprom/decode-vaio.1
index 5e69ee7..35ffb36 100644
--- a/eeprom/decode-vaio.1
+++ b/eeprom/decode-vaio.1
@@ -12,10 +12,6 @@
 .\"  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 .\"  GNU General Public License for more details.
 .\"
-.\"  You should have received a copy of the GNU General Public License along
-.\"  with this program; if not, write to the Free Software Foundation, Inc.,
-.\"  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-.\"
 .TH decode-vaio 1 "Oct 2013" "i2c-tools" "User Commands"
 .SH NAME
 decode-vaio \- decode the information found in the Sony Vaio laptop
diff --git a/py-smbus/smbusmodule.c b/py-smbus/smbusmodule.c
index 34af992..8c1f964 100644
--- a/py-smbus/smbusmodule.c
+++ b/py-smbus/smbusmodule.c
@@ -10,11 +10,6 @@
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
- * 
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
- * MA 02110-1301, USA.
  */
 
 #include <Python.h>
diff --git a/stub/i2c-stub-from-dump b/stub/i2c-stub-from-dump
index bcfe8de..ded4ed7 100755
--- a/stub/i2c-stub-from-dump
+++ b/stub/i2c-stub-from-dump
@@ -12,11 +12,6 @@
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 #
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
-# MA  02110-1301, USA
-#
 # This script feeds the i2c-stub driver with dump data from a real
 # I2C or SMBus chip. This can be useful when writing a driver for
 # a device you do not have access to, but of which you have a dump.
diff --git a/tools/i2cbusses.c b/tools/i2cbusses.c
index d23ee7a..d687615 100644
--- a/tools/i2cbusses.c
+++ b/tools/i2cbusses.c
@@ -15,11 +15,6 @@
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     GNU General Public License for more details.
-
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
-    MA 02110-1301 USA.
 */
 
 /* For strdup and snprintf */
diff --git a/tools/i2cbusses.h b/tools/i2cbusses.h
index a192c7f..6f901b6 100644
--- a/tools/i2cbusses.h
+++ b/tools/i2cbusses.h
@@ -12,11 +12,6 @@
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     GNU General Public License for more details.
-
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
-    MA 02110-1301 USA.
 */
 
 #ifndef _I2CBUSSES_H
diff --git a/tools/i2cdetect.c b/tools/i2cdetect.c
index 2d4d3b4..bb2f146 100644
--- a/tools/i2cdetect.c
+++ b/tools/i2cdetect.c
@@ -13,11 +13,6 @@
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     GNU General Public License for more details.
-
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
-    MA 02110-1301 USA.
 */
 
 #include <sys/ioctl.h>
diff --git a/tools/i2cdump.c b/tools/i2cdump.c
index d54a7e4..d315e2f 100644
--- a/tools/i2cdump.c
+++ b/tools/i2cdump.c
@@ -13,11 +13,6 @@
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     GNU General Public License for more details.
-
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
-    MA 02110-1301 USA.
 */
 
 #include <sys/ioctl.h>
diff --git a/tools/i2cget.c b/tools/i2cget.c
index 2ac20f7..b28ab38 100644
--- a/tools/i2cget.c
+++ b/tools/i2cget.c
@@ -16,11 +16,6 @@
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     GNU General Public License for more details.
-
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
-    MA 02110-1301 USA.
 */
 
 #include <sys/ioctl.h>
diff --git a/tools/i2cset.c b/tools/i2cset.c
index 5bf48a1..dd4fdc2 100644
--- a/tools/i2cset.c
+++ b/tools/i2cset.c
@@ -13,11 +13,6 @@
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     GNU General Public License for more details.
-
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
-    MA 02110-1301 USA.
 */
 
 #include <sys/ioctl.h>
diff --git a/tools/util.c b/tools/util.c
index 29e4958..4297d30 100644
--- a/tools/util.c
+++ b/tools/util.c
@@ -11,11 +11,6 @@
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     GNU General Public License for more details.
-
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
-    MA 02110-1301 USA.
 */
 
 #include <stdio.h>
diff --git a/tools/util.h b/tools/util.h
index f4f4817..8fdc46e 100644
--- a/tools/util.h
+++ b/tools/util.h
@@ -11,11 +11,6 @@
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     GNU General Public License for more details.
-
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
-    MA 02110-1301 USA.
 */
 
 #ifndef _UTIL_H
-- 
2.43.0


