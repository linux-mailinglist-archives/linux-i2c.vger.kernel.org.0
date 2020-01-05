Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F443130A5E
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Jan 2020 23:51:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbgAEWuu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jan 2020 17:50:50 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:37950 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727221AbgAEWuu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jan 2020 17:50:50 -0500
Received: from [37.160.42.38] (port=5507 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1ioEjK-00GSqI-WF; Sun, 05 Jan 2020 23:50:45 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: [PATCH 04/26] docs: i2c: call it "I2C" consistently
Date:   Sun,  5 Jan 2020 23:49:50 +0100
Message-Id: <20200105225012.11701-4-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200105225012.11701-1-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
 <20200105225012.11701-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Uppercase "I2C" is used almost everywhere in the docs, but the lowercase
version "i2c" is used somewhere. Use the uppercase form consistently.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Documentation/i2c/dev-interface.rst         | 18 +++---
 Documentation/i2c/dma-considerations.rst    |  2 +-
 Documentation/i2c/i2c-protocol.rst          |  4 +-
 Documentation/i2c/i2c-topology.rst          | 66 ++++++++++-----------
 Documentation/i2c/instantiating-devices.rst |  2 +-
 Documentation/i2c/old-module-parameters.rst |  6 +-
 Documentation/i2c/slave-interface.rst       |  4 +-
 Documentation/i2c/writing-clients.rst       |  4 +-
 8 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/Documentation/i2c/dev-interface.rst b/Documentation/i2c/dev-interface.rst
index 69c23a3c2b1b..c3717a87df12 100644
--- a/Documentation/i2c/dev-interface.rst
+++ b/Documentation/i2c/dev-interface.rst
@@ -2,26 +2,26 @@
 I2C Device Interface
 ====================
 
-Usually, i2c devices are controlled by a kernel driver. But it is also
+Usually, I2C devices are controlled by a kernel driver. But it is also
 possible to access all devices on an adapter from userspace, through
 the /dev interface. You need to load module i2c-dev for this.
 
-Each registered i2c adapter gets a number, counting from 0. You can
+Each registered I2C adapter gets a number, counting from 0. You can
 examine /sys/class/i2c-dev/ to see what number corresponds to which adapter.
 Alternatively, you can run "i2cdetect -l" to obtain a formatted list of all
-i2c adapters present on your system at a given time. i2cdetect is part of
+I2C adapters present on your system at a given time. i2cdetect is part of
 the i2c-tools package.
 
 I2C device files are character device files with major device number 89
 and a minor device number corresponding to the number assigned as
 explained above. They should be called "i2c-%d" (i2c-0, i2c-1, ...,
-i2c-10, ...). All 256 minor device numbers are reserved for i2c.
+i2c-10, ...). All 256 minor device numbers are reserved for I2C.
 
 
 C example
 =========
 
-So let's say you want to access an i2c adapter from a C program.
+So let's say you want to access an I2C adapter from a C program.
 First, you need to include these two headers::
 
   #include <linux/i2c-dev.h>
@@ -66,7 +66,7 @@ the device supports them. Both are illustrated below::
   /* Using SMBus commands */
   res = i2c_smbus_read_word_data(file, reg);
   if (res < 0) {
-    /* ERROR HANDLING: i2c transaction failed */
+    /* ERROR HANDLING: I2C transaction failed */
   } else {
     /* res contains the read word */
   }
@@ -79,12 +79,12 @@ the device supports them. Both are illustrated below::
   buf[1] = 0x43;
   buf[2] = 0x65;
   if (write(file, buf, 3) != 3) {
-    /* ERROR HANDLING: i2c transaction failed */
+    /* ERROR HANDLING: I2C transaction failed */
   }
 
   /* Using I2C Read, equivalent of i2c_smbus_read_byte(file) */
   if (read(file, buf, 1) != 1) {
-    /* ERROR HANDLING: i2c transaction failed */
+    /* ERROR HANDLING: I2C transaction failed */
   } else {
     /* buf[0] contains the read byte */
   }
@@ -144,7 +144,7 @@ The following IOCTLs are defined:
   If possible, use the provided ``i2c_smbus_*`` methods described below instead
   of issuing direct ioctls.
 
-You can do plain i2c transactions by using read(2) and write(2) calls.
+You can do plain I2C transactions by using read(2) and write(2) calls.
 You do not need to pass the address byte; instead, set it through
 ioctl I2C_SLAVE before you try to access the device.
 
diff --git a/Documentation/i2c/dma-considerations.rst b/Documentation/i2c/dma-considerations.rst
index 203002054120..142d52ce9ebb 100644
--- a/Documentation/i2c/dma-considerations.rst
+++ b/Documentation/i2c/dma-considerations.rst
@@ -2,7 +2,7 @@
 Linux I2C and DMA
 =================
 
-Given that i2c is a low-speed bus, over which the majority of messages
+Given that I2C is a low-speed bus, over which the majority of messages
 transferred are small, it is not considered a prime user of DMA access. At this
 time of writing, only 10% of I2C bus master drivers have DMA support
 implemented. And the vast majority of transactions are so small that setting up
diff --git a/Documentation/i2c/i2c-protocol.rst b/Documentation/i2c/i2c-protocol.rst
index 2f8fcf671b2e..0222c97f3436 100644
--- a/Documentation/i2c/i2c-protocol.rst
+++ b/Documentation/i2c/i2c-protocol.rst
@@ -2,7 +2,7 @@
 I2C Protocol
 ============
 
-This document describes the i2c protocol. Or will, when it is finished :-)
+This document describes the I2C protocol. Or will, when it is finished :-)
 
 Key to symbols
 ==============
@@ -57,7 +57,7 @@ Modified transactions
 =====================
 
 The following modifications to the I2C protocol can also be generated by
-setting these flags for i2c messages. With the exception of I2C_M_NOSTART, they
+setting these flags for I2C messages. With the exception of I2C_M_NOSTART, they
 are usually only needed to work around device issues:
 
 I2C_M_IGNORE_NAK:
diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
index 0c1ae95f6a97..0875090d6aeb 100644
--- a/Documentation/i2c/i2c-topology.rst
+++ b/Documentation/i2c/i2c-topology.rst
@@ -2,8 +2,8 @@
 I2C topology
 ============
 
-There are a couple of reasons for building more complex i2c topologies
-than a straight-forward i2c bus with one adapter and one or more devices.
+There are a couple of reasons for building more complex I2C topologies
+than a straight-forward I2C bus with one adapter and one or more devices.
 
 1. A mux may be needed on the bus to prevent address collisions.
 
@@ -11,20 +11,20 @@ than a straight-forward i2c bus with one adapter and one or more devices.
    may be needed to determine if it is ok to access the bus.
 
 3. A device (particularly RF tuners) may want to avoid the digital noise
-   from the i2c bus, at least most of the time, and sits behind a gate
+   from the I2C bus, at least most of the time, and sits behind a gate
    that has to be operated before the device can be accessed.
 
 Etc
 ===
 
-These constructs are represented as i2c adapter trees by Linux, where
+These constructs are represented as I2C adapter trees by Linux, where
 each adapter has a parent adapter (except the root adapter) and zero or
 more child adapters. The root adapter is the actual adapter that issues
-i2c transfers, and all adapters with a parent are part of an "i2c-mux"
+I2C transfers, and all adapters with a parent are part of an "i2c-mux"
 object (quoted, since it can also be an arbitrator or a gate).
 
 Depending of the particular mux driver, something happens when there is
-an i2c transfer on one of its child adapters. The mux driver can
+an I2C transfer on one of its child adapters. The mux driver can
 obviously operate a mux, but it can also do arbitration with an external
 bus master or open a gate. The mux driver has two operations for this,
 select and deselect. select is called before the transfer and (the
@@ -34,7 +34,7 @@ optional) deselect is called after the transfer.
 Locking
 =======
 
-There are two variants of locking available to i2c muxes, they can be
+There are two variants of locking available to I2C muxes, they can be
 mux-locked or parent-locked muxes. As is evident from below, it can be
 useful to know if a mux is mux-locked or if it is parent-locked. The
 following list was correct at the time of writing:
@@ -45,7 +45,7 @@ In drivers/i2c/muxes/:
 i2c-arb-gpio-challenge    Parent-locked
 i2c-mux-gpio              Normally parent-locked, mux-locked iff
                           all involved gpio pins are controlled by the
-                          same i2c root adapter that they mux.
+                          same I2C root adapter that they mux.
 i2c-mux-gpmux             Normally parent-locked, mux-locked iff
                           specified in device-tree.
 i2c-mux-ltc4306           Mux-locked
@@ -54,7 +54,7 @@ i2c-mux-pca9541           Parent-locked
 i2c-mux-pca954x           Parent-locked
 i2c-mux-pinctrl           Normally parent-locked, mux-locked iff
                           all involved pinctrl devices are controlled
-                          by the same i2c root adapter that they mux.
+                          by the same I2C root adapter that they mux.
 i2c-mux-reg               Parent-locked
 ======================    =============================================
 
@@ -83,9 +83,9 @@ Mux-locked muxes
 Mux-locked muxes does not lock the entire parent adapter during the
 full select-transfer-deselect transaction, only the muxes on the parent
 adapter are locked. Mux-locked muxes are mostly interesting if the
-select and/or deselect operations must use i2c transfers to complete
+select and/or deselect operations must use I2C transfers to complete
 their tasks. Since the parent adapter is not fully locked during the
-full transaction, unrelated i2c transfers may interleave the different
+full transaction, unrelated I2C transfers may interleave the different
 stages of the transaction. This has the benefit that the mux driver
 may be easier and cleaner to implement, but it has some caveats.
 
@@ -109,14 +109,14 @@ ML2. It is not safe to build arbitrary topologies with two (or more)
 
 ML3. A mux-locked mux cannot be used by a driver for auto-closing
      gates/muxes, i.e. something that closes automatically after a given
-     number (one, in most cases) of i2c transfers. Unrelated i2c transfers
+     number (one, in most cases) of I2C transfers. Unrelated I2C transfers
      may creep in and close prematurely.
 
-ML4. If any non-i2c operation in the mux driver changes the i2c mux state,
+ML4. If any non-I2C operation in the mux driver changes the I2C mux state,
      the driver has to lock the root adapter during that operation.
      Otherwise garbage may appear on the bus as seen from devices
-     behind the mux, when an unrelated i2c transfer is in flight during
-     the non-i2c mux-changing operation.
+     behind the mux, when an unrelated I2C transfer is in flight during
+     the non-I2C mux-changing operation.
 ==== =====================================================================
 
 
@@ -137,14 +137,14 @@ Mux-locked Example
 
 When there is an access to D1, this happens:
 
- 1. Someone issues an i2c-transfer to D1.
+ 1. Someone issues an I2C-transfer to D1.
  2. M1 locks muxes on its parent (the root adapter in this case).
  3. M1 calls ->select to ready the mux.
- 4. M1 (presumably) does some i2c-transfers as part of its select.
-    These transfers are normal i2c-transfers that locks the parent
+ 4. M1 (presumably) does some I2C-transfers as part of its select.
+    These transfers are normal I2C-transfers that locks the parent
     adapter.
- 5. M1 feeds the i2c-transfer from step 1 to its parent adapter as a
-    normal i2c-transfer that locks the parent adapter.
+ 5. M1 feeds the I2C-transfer from step 1 to its parent adapter as a
+    normal I2C-transfer that locks the parent adapter.
  6. M1 calls ->deselect, if it has one.
  7. Same rules as in step 4, but for ->deselect.
  8. M1 unlocks muxes on its parent.
@@ -159,8 +159,8 @@ Parent-locked muxes
 
 Parent-locked muxes lock the parent adapter during the full select-
 transfer-deselect transaction. The implication is that the mux driver
-has to ensure that any and all i2c transfers through that parent
-adapter during the transaction are unlocked i2c transfers (using e.g.
+has to ensure that any and all I2C transfers through that parent
+adapter during the transaction are unlocked I2C transfers (using e.g.
 __i2c_transfer), or a deadlock will follow. There are a couple of
 caveats.
 
@@ -169,12 +169,12 @@ PL1. If you build a topology with a parent-locked mux being the child
      of another mux, this might break a possible assumption from the
      child mux that the root adapter is unused between its select op
      and the actual transfer (e.g. if the child mux is auto-closing
-     and the parent mux issus i2c-transfers as part of its select).
+     and the parent mux issus I2C-transfers as part of its select).
      This is especially the case if the parent mux is mux-locked, but
      it may also happen if the parent mux is parent-locked.
 
 PL2. If select/deselect calls out to other subsystems such as gpio,
-     pinctrl, regmap or iio, it is essential that any i2c transfers
+     pinctrl, regmap or iio, it is essential that any I2C transfers
      caused by these subsystems are unlocked. This can be convoluted to
      accomplish, maybe even impossible if an acceptably clean solution
      is sought.
@@ -197,15 +197,15 @@ Parent-locked Example
 
 When there is an access to D1, this happens:
 
- 1.  Someone issues an i2c-transfer to D1.
+ 1.  Someone issues an I2C-transfer to D1.
  2.  M1 locks muxes on its parent (the root adapter in this case).
  3.  M1 locks its parent adapter.
  4.  M1 calls ->select to ready the mux.
- 5.  If M1 does any i2c-transfers (on this root adapter) as part of
-     its select, those transfers must be unlocked i2c-transfers so
+ 5.  If M1 does any I2C-transfers (on this root adapter) as part of
+     its select, those transfers must be unlocked I2C-transfers so
      that they do not deadlock the root adapter.
- 6.  M1 feeds the i2c-transfer from step 1 to the root adapter as an
-     unlocked i2c-transfer, so that it does not deadlock the parent
+ 6.  M1 feeds the I2C-transfer from step 1 to the root adapter as an
+     unlocked I2C-transfer, so that it does not deadlock the parent
      adapter.
  7.  M1 calls ->deselect, if it has one.
  8.  Same rules as in step 5, but for ->deselect.
@@ -240,7 +240,7 @@ and specifically when M2 requests its parent to lock, M1 passes
 the buck to the root adapter).
 
 This topology is bad if M2 is an auto-closing mux and M1->select
-issues any unlocked i2c transfers on the root adapter that may leak
+issues any unlocked I2C transfers on the root adapter that may leak
 through and be seen by the M2 adapter, thus closing M2 prematurely.
 
 
@@ -286,14 +286,14 @@ point.
 
 This kind of topology is generally not suitable and should probably
 be avoided. The reason is that M2 probably assumes that there will
-be no i2c transfers during its calls to ->select and ->deselect, and
+be no I2C transfers during its calls to ->select and ->deselect, and
 if there are, any such transfers might appear on the slave side of M2
-as partial i2c transfers, i.e. garbage or worse. This might cause
+as partial I2C transfers, i.e. garbage or worse. This might cause
 device lockups and/or other problems.
 
 The topology is especially troublesome if M2 is an auto-closing
 mux. In that case, any interleaved accesses to D4 might close M2
-prematurely, as might any i2c-transfers part of M1->select.
+prematurely, as might any I2C-transfers part of M1->select.
 
 But if M2 is not making the above stated assumption, and if M2 is not
 auto-closing, the topology is fine.
diff --git a/Documentation/i2c/instantiating-devices.rst b/Documentation/i2c/instantiating-devices.rst
index 875ebe9e78e3..cf5d9828e823 100644
--- a/Documentation/i2c/instantiating-devices.rst
+++ b/Documentation/i2c/instantiating-devices.rst
@@ -188,7 +188,7 @@ destroyed automatically when the driver which detected them is removed,
 or when the underlying I2C bus is itself destroyed, whichever happens
 first.
 
-Those of you familiar with the i2c subsystem of 2.4 kernels and early 2.6
+Those of you familiar with the I2C subsystem of 2.4 kernels and early 2.6
 kernels will find out that this method 3 is essentially similar to what
 was done there. Two significant differences are:
 
diff --git a/Documentation/i2c/old-module-parameters.rst b/Documentation/i2c/old-module-parameters.rst
index a1939512ad66..78a6950e5763 100644
--- a/Documentation/i2c/old-module-parameters.rst
+++ b/Documentation/i2c/old-module-parameters.rst
@@ -2,14 +2,14 @@
 I2C device driver binding control from user-space
 =================================================
 
-Up to kernel 2.6.32, many i2c drivers used helper macros provided by
+Up to kernel 2.6.32, many I2C drivers used helper macros provided by
 <linux/i2c.h> which created standard module parameters to let the user
-control how the driver would probe i2c buses and attach to devices. These
+control how the driver would probe I2C buses and attach to devices. These
 parameters were known as "probe" (to let the driver probe for an extra
 address), "force" (to forcibly attach the driver to a given device) and
 "ignore" (to prevent a driver from probing a given address).
 
-With the conversion of the i2c subsystem to the standard device driver
+With the conversion of the I2C subsystem to the standard device driver
 binding model, it became clear that these per-module parameters were no
 longer needed, and that a centralized implementation was possible. The new,
 sysfs-based interface is described in the documentation file
diff --git a/Documentation/i2c/slave-interface.rst b/Documentation/i2c/slave-interface.rst
index c769bd6a15bf..82ea3e1d6fe4 100644
--- a/Documentation/i2c/slave-interface.rst
+++ b/Documentation/i2c/slave-interface.rst
@@ -59,7 +59,7 @@ The bus driver sends an event to the backend using the following function::
 
 	ret = i2c_slave_event(client, event, &val)
 
-'client' describes the i2c slave device. 'event' is one of the special event
+'client' describes the I2C slave device. 'event' is one of the special event
 types described hereafter. 'val' holds an u8 value for the data byte to be
 read/written and is thus bidirectional. The pointer to val must always be
 provided even if val is not used for an event, i.e. don't use NULL here. 'ret'
@@ -143,7 +143,7 @@ Bus driver support
 If you want to add slave support to the bus driver:
 
 * implement calls to register/unregister the slave and add those to the
-  struct i2c_algorithm. When registering, you probably need to set the i2c
+  struct i2c_algorithm. When registering, you probably need to set the I2C
   slave address and enable slave specific interrupts. If you use runtime pm, you
   should use pm_runtime_get_sync() because your device usually needs to be
   powered on always to be able to detect its slave address. When unregistering,
diff --git a/Documentation/i2c/writing-clients.rst b/Documentation/i2c/writing-clients.rst
index ced309b5e0cc..1bf4b973c673 100644
--- a/Documentation/i2c/writing-clients.rst
+++ b/Documentation/i2c/writing-clients.rst
@@ -95,7 +95,7 @@ to gather information from the client, or write new information to the
 client.
 
 I have found it useful to define foo_read and foo_write functions for this.
-For some cases, it will be easier to call the i2c functions directly,
+For some cases, it will be easier to call the I2C functions directly,
 but many chips have some kind of register-value idea that can easily
 be encapsulated.
 
@@ -344,7 +344,7 @@ Plain I2C communication
 	int i2c_master_recv(struct i2c_client *client, char *buf, int count);
 
 These routines read and write some bytes from/to a client. The client
-contains the i2c address, so you do not have to include it. The second
+contains the I2C address, so you do not have to include it. The second
 parameter contains the bytes to read/write, the third the number of bytes
 to read/write (must be less than the length of the buffer, also should be
 less than 64k since msg.len is u16.) Returned is the actual number of bytes
-- 
2.24.1

