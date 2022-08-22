Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B26BA59BC5F
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 11:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234250AbiHVJLJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 05:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234214AbiHVJLD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 05:11:03 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D7719C3C;
        Mon, 22 Aug 2022 02:11:00 -0700 (PDT)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id 6202E10000D;
        Mon, 22 Aug 2022 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1661159459;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Dal7GyI2b/xrscuLAR/7CyLZaZ9PzPJxuJocl+hrnSo=;
        b=Q3odBjnNarjITCg0SSZQ2ogQbPjX2oWuu7i8OIbzOaMDvvjFdxqCFpNy4ddDOJrFxlI8Cw
        eHal9mDmmvlc2g65+wWWqvdEoss+l0lP2Tn823fzzfAU/73wXuxo3GPI1PfHpOByKc3bbP
        uJIozYfDmSraHLSzr2oUqM1t0crctlKSWWx6tFhg45SWqE6VpltDGjqPB6A6+ysE8SV3tu
        7soApSKJe1VwO7azAtwghOEFu9sPYDo8Xu/LKVjXTnl/9uVpCgqHx0mh3nrpIC+IYQDoD8
        tfzuSz64ZGtf556TjPMBwQrZgKEVOZirudp2FZDL2WcPHYGK0jIlmwpE7AxXIw==
From:   luca.ceresoli@bootlin.com
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] docs: i2c: i2c-topology: reorder sections more logically
Date:   Mon, 22 Aug 2022 11:10:49 +0200
Message-Id: <20220822091050.47099-3-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822091050.47099-1-luca.ceresoli@bootlin.com>
References: <20220822091050.47099-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

The sequence of sections is a bit confusing here:

 * we list the mux locking scheme for existing drivers before introducing
   what mux locking schemes are
 * we list the caveats for each locking scheme (which are tricky) before
   the example of the simple use case

Restructure it entirely with the following logic:

 * Intro ("I2C muxes and complex topologies")
 * Locking
   - mux-locked
     - example
     - caveats
   - parent-locked
     - example
     - caveats
 * Complex examples
 * Mux type of existing device drivers

While there, also apply some other improvements:

 * convert the caveat list from a table (with only one column carrying
   content) to a bullet list.
 * add a small introductory text to bridge the gap from listing the use
   cases to telling about the hardware components to handle them and then
   the device drivers that implement those.
 * make empty lines usage more uniform

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v2: none
---
 Documentation/i2c/i2c-topology.rst | 206 +++++++++++++++--------------
 1 file changed, 109 insertions(+), 97 deletions(-)

diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
index 1b11535c8946..6f2da7f386fd 100644
--- a/Documentation/i2c/i2c-topology.rst
+++ b/Documentation/i2c/i2c-topology.rst
@@ -16,7 +16,10 @@ Some example use cases are:
    from the I2C bus, at least most of the time, and sits behind a gate
    that has to be operated before the device can be accessed.
 
-These constructs are represented as I2C adapter trees by Linux, where
+Several types of hardware components such as I2C muxes, I2C gates and I2C
+arbitrators allow to handle such needs.
+
+These components are represented as I2C adapter trees by Linux, where
 each adapter has a parent adapter (except the root adapter) and zero or
 more child adapters. The root adapter is the actual adapter that issues
 I2C transfers, and all adapters with a parent are part of an "i2c-mux"
@@ -34,46 +37,7 @@ Locking
 =======
 
 There are two variants of locking available to I2C muxes, they can be
-mux-locked or parent-locked muxes. As is evident from below, it can be
-useful to know if a mux is mux-locked or if it is parent-locked. The
-following list was correct at the time of writing:
-
-In drivers/i2c/muxes/:
-
-======================    =============================================
-i2c-arb-gpio-challenge    Parent-locked
-i2c-mux-gpio              Normally parent-locked, mux-locked iff
-                          all involved gpio pins are controlled by the
-                          same I2C root adapter that they mux.
-i2c-mux-gpmux             Normally parent-locked, mux-locked iff
-                          specified in device-tree.
-i2c-mux-ltc4306           Mux-locked
-i2c-mux-mlxcpld           Parent-locked
-i2c-mux-pca9541           Parent-locked
-i2c-mux-pca954x           Parent-locked
-i2c-mux-pinctrl           Normally parent-locked, mux-locked iff
-                          all involved pinctrl devices are controlled
-                          by the same I2C root adapter that they mux.
-i2c-mux-reg               Parent-locked
-======================    =============================================
-
-In drivers/iio/:
-
-======================    =============================================
-gyro/mpu3050              Mux-locked
-imu/inv_mpu6050/          Mux-locked
-======================    =============================================
-
-In drivers/media/:
-
-=======================   =============================================
-dvb-frontends/lgdt3306a   Mux-locked
-dvb-frontends/m88ds3103   Parent-locked
-dvb-frontends/rtl2830     Parent-locked
-dvb-frontends/rtl2832     Mux-locked
-dvb-frontends/si2168      Mux-locked
-usb/cx231xx/              Parent-locked
-=======================   =============================================
+mux-locked or parent-locked muxes.
 
 
 Mux-locked muxes
@@ -88,40 +52,8 @@ full transaction, unrelated I2C transfers may interleave the different
 stages of the transaction. This has the benefit that the mux driver
 may be easier and cleaner to implement, but it has some caveats.
 
-==== =====================================================================
-ML1. If you build a topology with a mux-locked mux being the parent
-     of a parent-locked mux, this might break the expectation from the
-     parent-locked mux that the root adapter is locked during the
-     transaction.
-
-ML2. It is not safe to build arbitrary topologies with two (or more)
-     mux-locked muxes that are not siblings, when there are address
-     collisions between the devices on the child adapters of these
-     non-sibling muxes.
-
-     I.e. the select-transfer-deselect transaction targeting e.g. device
-     address 0x42 behind mux-one may be interleaved with a similar
-     operation targeting device address 0x42 behind mux-two. The
-     intension with such a topology would in this hypothetical example
-     be that mux-one and mux-two should not be selected simultaneously,
-     but mux-locked muxes do not guarantee that in all topologies.
-
-ML3. A mux-locked mux cannot be used by a driver for auto-closing
-     gates/muxes, i.e. something that closes automatically after a given
-     number (one, in most cases) of I2C transfers. Unrelated I2C transfers
-     may creep in and close prematurely.
-
-ML4. If any non-I2C operation in the mux driver changes the I2C mux state,
-     the driver has to lock the root adapter during that operation.
-     Otherwise garbage may appear on the bus as seen from devices
-     behind the mux, when an unrelated I2C transfer is in flight during
-     the non-I2C mux-changing operation.
-==== =====================================================================
-
-
 Mux-locked Example
-------------------
-
+~~~~~~~~~~~~~~~~~~
 
 ::
 
@@ -152,6 +84,39 @@ This means that accesses to D2 are lockout out for the full duration
 of the entire operation. But accesses to D3 are possibly interleaved
 at any point.
 
+Mux-locked caveats
+~~~~~~~~~~~~~~~~~~
+
+When using a mux-locked mux, be aware of the following restrictions:
+
+* If you build a topology with a mux-locked mux being the parent
+  of a parent-locked mux, this might break the expectation from the
+  parent-locked mux that the root adapter is locked during the
+  transaction.
+
+* It is not safe to build arbitrary topologies with two (or more)
+  mux-locked muxes that are not siblings, when there are address
+  collisions between the devices on the child adapters of these
+  non-sibling muxes.
+
+  I.e. the select-transfer-deselect transaction targeting e.g. device
+  address 0x42 behind mux-one may be interleaved with a similar
+  operation targeting device address 0x42 behind mux-two. The
+  intension with such a topology would in this hypothetical example
+  be that mux-one and mux-two should not be selected simultaneously,
+  but mux-locked muxes do not guarantee that in all topologies.
+
+* A mux-locked mux cannot be used by a driver for auto-closing
+  gates/muxes, i.e. something that closes automatically after a given
+  number (one, in most cases) of I2C transfers. Unrelated I2C transfers
+  may creep in and close prematurely.
+
+* If any non-I2C operation in the mux driver changes the I2C mux state,
+  the driver has to lock the root adapter during that operation.
+  Otherwise garbage may appear on the bus as seen from devices
+  behind the mux, when an unrelated I2C transfer is in flight during
+  the non-I2C mux-changing operation.
+
 
 Parent-locked muxes
 -------------------
@@ -160,28 +125,10 @@ Parent-locked muxes lock the parent adapter during the full select-
 transfer-deselect transaction. The implication is that the mux driver
 has to ensure that any and all I2C transfers through that parent
 adapter during the transaction are unlocked I2C transfers (using e.g.
-__i2c_transfer), or a deadlock will follow. There are a couple of
-caveats.
-
-==== ====================================================================
-PL1. If you build a topology with a parent-locked mux being the child
-     of another mux, this might break a possible assumption from the
-     child mux that the root adapter is unused between its select op
-     and the actual transfer (e.g. if the child mux is auto-closing
-     and the parent mux issues I2C transfers as part of its select).
-     This is especially the case if the parent mux is mux-locked, but
-     it may also happen if the parent mux is parent-locked.
-
-PL2. If select/deselect calls out to other subsystems such as gpio,
-     pinctrl, regmap or iio, it is essential that any I2C transfers
-     caused by these subsystems are unlocked. This can be convoluted to
-     accomplish, maybe even impossible if an acceptably clean solution
-     is sought.
-==== ====================================================================
-
+__i2c_transfer), or a deadlock will follow.
 
 Parent-locked Example
----------------------
+~~~~~~~~~~~~~~~~~~~~~
 
 ::
 
@@ -211,10 +158,29 @@ When there is an access to D1, this happens:
  9.  M1 unlocks its parent adapter.
  10. M1 unlocks muxes on its parent.
 
-
 This means that accesses to both D2 and D3 are locked out for the full
 duration of the entire operation.
 
+Parent-locked Caveats
+~~~~~~~~~~~~~~~~~~~~~
+
+When using a parent-locked mux, be aware of the following restrictions:
+
+* If you build a topology with a parent-locked mux being the child
+  of another mux, this might break a possible assumption from the
+  child mux that the root adapter is unused between its select op
+  and the actual transfer (e.g. if the child mux is auto-closing
+  and the parent mux issues I2C transfers as part of its select).
+  This is especially the case if the parent mux is mux-locked, but
+  it may also happen if the parent mux is parent-locked.
+
+* If select/deselect calls out to other subsystems such as gpio,
+  pinctrl, regmap or iio, it is essential that any I2C transfers
+  caused by these subsystems are unlocked. This can be convoluted to
+  accomplish, maybe even impossible if an acceptably clean solution
+  is sought.
+
+
 
 Complex Examples
 ================
@@ -260,8 +226,10 @@ This is a good topology::
 When device D1 is accessed, accesses to D2 are locked out for the
 full duration of the operation (muxes on the top child adapter of M1
 are locked). But accesses to D3 and D4 are possibly interleaved at
-any point. Accesses to D3 locks out D1 and D2, but accesses to D4
-are still possibly interleaved.
+any point.
+
+Accesses to D3 locks out D1 and D2, but accesses to D4 are still possibly
+interleaved.
 
 
 Mux-locked mux as parent of parent-locked mux
@@ -393,3 +361,47 @@ This is a good topology::
 When D1 or D2 are accessed, accesses to D3 and D4 are locked out while
 accesses to D5 may interleave. When D3 or D4 are accessed, accesses to
 all other devices are locked out.
+
+
+Mux type of existing device drivers
+===================================
+
+Whether a device is mux-locked or parent-locked depends on its
+implementation. The following list was correct at the time of writing:
+
+In drivers/i2c/muxes/:
+
+======================    =============================================
+i2c-arb-gpio-challenge    Parent-locked
+i2c-mux-gpio              Normally parent-locked, mux-locked iff
+                          all involved gpio pins are controlled by the
+                          same I2C root adapter that they mux.
+i2c-mux-gpmux             Normally parent-locked, mux-locked iff
+                          specified in device-tree.
+i2c-mux-ltc4306           Mux-locked
+i2c-mux-mlxcpld           Parent-locked
+i2c-mux-pca9541           Parent-locked
+i2c-mux-pca954x           Parent-locked
+i2c-mux-pinctrl           Normally parent-locked, mux-locked iff
+                          all involved pinctrl devices are controlled
+                          by the same I2C root adapter that they mux.
+i2c-mux-reg               Parent-locked
+======================    =============================================
+
+In drivers/iio/:
+
+======================    =============================================
+gyro/mpu3050              Mux-locked
+imu/inv_mpu6050/          Mux-locked
+======================    =============================================
+
+In drivers/media/:
+
+=======================   =============================================
+dvb-frontends/lgdt3306a   Mux-locked
+dvb-frontends/m88ds3103   Parent-locked
+dvb-frontends/rtl2830     Parent-locked
+dvb-frontends/rtl2832     Mux-locked
+dvb-frontends/si2168      Mux-locked
+usb/cx231xx/              Parent-locked
+=======================   =============================================
-- 
2.34.1

