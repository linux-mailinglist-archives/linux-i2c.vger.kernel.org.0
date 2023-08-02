Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C93376CBB0
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 13:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234191AbjHBLXe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 07:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233115AbjHBLXc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 07:23:32 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0A05726B2;
        Wed,  2 Aug 2023 04:23:23 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,249,1684767600"; 
   d="scan'208";a="175352213"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Aug 2023 20:23:23 +0900
Received: from localhost.localdomain (unknown [10.226.92.171])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6668C41B83E0;
        Wed,  2 Aug 2023 20:23:19 +0900 (JST)
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
Subject: [PATCH v4 0/3] Extend device_get_match_data() to struct bus_type
Date:   Wed,  2 Aug 2023 12:23:14 +0100
Message-Id: <20230802112317.252745-1-biju.das.jz@bp.renesas.com>
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

v3->v4:
 * Documented corner case for device_get_match_data()
 * Dropped struct i2c_driver parameter from i2c_get_match_data_helper()
 * Split I2C sysfs handling in seperate patch(patch#3)
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

Biju Das (3):
  drivers: fwnode: Extend device_get_match_data() to struct bus_type
  i2c: Add i2c_device_get_match_data() callback
  i2c: Extend i2c_device_get_match_data() to support i2c sysfs

 drivers/base/property.c     | 27 ++++++++++++++++++++-
 drivers/i2c/i2c-core-base.c | 48 ++++++++++++++++++++++++++++++-------
 drivers/i2c/i2c-core-of.c   |  5 ++--
 drivers/i2c/i2c-core.h      |  9 +++++++
 include/linux/device/bus.h  |  3 +++
 5 files changed, 81 insertions(+), 11 deletions(-)

-- 
2.25.1

