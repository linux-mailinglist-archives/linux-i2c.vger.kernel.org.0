Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED9FD76E560
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Aug 2023 12:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235336AbjHCKRa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Aug 2023 06:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235282AbjHCKQx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Aug 2023 06:16:53 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A3B4F3A92;
        Thu,  3 Aug 2023 03:16:18 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,251,1684767600"; 
   d="scan'208";a="175475623"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Aug 2023 19:16:17 +0900
Received: from localhost.localdomain (unknown [10.226.93.128])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DA03B400386C;
        Thu,  3 Aug 2023 19:16:13 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-acpi@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 0/4] Extend device_get_match_data() to struct bus_type
Date:   Thu,  3 Aug 2023 11:16:07 +0100
Message-Id: <20230803101611.323342-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch series extend device_get_match_data() to struct bus_type,
so that buses like I2C can get matched data.

v4->v5:
 * Added const struct device_driver variable 'drv' in i2c_device_get_match
   _data().
 * For code readability and maintenance perspective, added separate NULL
   check for drv and client variable and added comment for NULL check for
   drv variable.
 * Created separate patch for converting i2c_of_match_device_sysfs() to
   non-static.
 * Removed export symbol for i2c_of_match_device_sysfs().
 * Replaced 'dev->driver'->'drv'.
 * Replaced return value data->NULL to avoid (potentially) stale pointers,
   if there is no match.

v3->v4:
 * Documented corner case for device_get_match_data()
 * Dropped struct i2c_driver parameter from i2c_get_match_data_helper()
 * Split I2C sysfs handling in separate patch(patch#3)
 * Added space after of_device_id for i2c_of_match_device_sysfs()
 * Added const parameter for struct i2c_client, to prevent overriding it's
   pointer.
 * Moved declaration from public i2c.h->i2c-core.h
v2->v3:
 * Added Rb tag from Andy for patch#1.
 * Extended to support i2c_of_match_device() as suggested by Andy.
 * Changed i2c_of_match_device_sysfs() as non-static function as it is
   needed for i2c_device_get_match_data().
 * Added a TODO comment to use i2c_verify_client() when it accepts const
   pointer.
 * Added multiple returns to make code path for device_get_match_data()
   faster in i2c_get_match_data().
RFC v1->v2:
 * Replaced "Signed-off-by"->"Suggested-by" tag for Dmitry.
 * Documented device_get_match_data().
 * Added multiple returns to make code path for generic fwnode-based
   lookup faster.
 * Fixed build warnings reported by kernel test robot <lkp@intel.com>
 * Added const qualifier to return type and parameter struct i2c_driver
   in i2c_get_match_data_helper().
 * Added const qualifier to struct i2c_driver in i2c_get_match_data()
 * Dropped driver variable from i2c_device_get_match_data()
 * Replaced to_i2c_client with logic for assigning verify_client as it
   returns non const pointer.

Biju Das (4):
  drivers: fwnode: Extend device_get_match_data() to struct bus_type
  i2c: Add i2c_device_get_match_data() callback
  i2c: i2c-core-of: Convert i2c_of_match_device_sysfs() to non-static
  i2c: Extend i2c_device_get_match_data() to support i2c sysfs

 drivers/base/property.c     | 27 ++++++++++++++++-
 drivers/i2c/i2c-core-base.c | 60 ++++++++++++++++++++++++++++++-------
 drivers/i2c/i2c-core-of.c   |  4 +--
 drivers/i2c/i2c-core.h      |  9 ++++++
 include/linux/device/bus.h  |  3 ++
 5 files changed, 90 insertions(+), 13 deletions(-)

-- 
2.25.1

