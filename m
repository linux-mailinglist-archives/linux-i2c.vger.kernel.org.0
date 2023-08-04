Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7E27705B7
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Aug 2023 18:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjHDQRm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 12:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjHDQRl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 12:17:41 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 90250B2;
        Fri,  4 Aug 2023 09:17:39 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,255,1684767600"; 
   d="scan'208";a="171950178"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Aug 2023 01:17:38 +0900
Received: from localhost.localdomain (unknown [10.226.93.35])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9436840116B5;
        Sat,  5 Aug 2023 01:17:33 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Cameron <jic23@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-acpi@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-rtc@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 0/4] Extend device_get_match_data() to struct bus_type
Date:   Fri,  4 Aug 2023 17:17:24 +0100
Message-Id: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch series extend device_get_match_data() to struct bus_type,
so that buses like I2C can get matched data.

There is a plan to replace i2c_get_match_data()->device_get_match_data()
later, once this patch hits mainline as it is redundant.

v6->v7:
 * Added ack from Greg Kroah-Hartman for patch#1
 * Swapped patch#2 and patch#3 from v6.
 * Added Rb tag from Andy for patch#2 and patch#4
 * Updated commit description of patch#2 by removing unnecessary wrapping.
 * Updated typo in commit description struct bus_type()->struct bus_type.
v5->v6:
 * Cced linux-rtc and linux-iio as these subsytems uses i2c_get_match_
   data() and this function become redundant once this patch series hits
   mainline.
 * Added Rb tag from Sakari for patch#1.
 * Moved patch#3 from v5 to patch#2 and patch#2 from v5 to patch#4.
 * Added Rb tag from Andy for patch#2
 * Separate patch#3 to prepare for better difference for
   i2c_match_id() changes.
 * Merged patch#4 from v5 with patch#4.
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
  i2c: Enhance i2c_get_match_data()
  i2c: i2c-core-of: Convert i2c_of_match_device_sysfs() to non-static
  i2c: Add i2c_device_get_match_data() callback

 drivers/base/property.c     | 27 ++++++++++++++++-
 drivers/i2c/i2c-core-base.c | 60 ++++++++++++++++++++++++++++++-------
 drivers/i2c/i2c-core-of.c   |  4 +--
 drivers/i2c/i2c-core.h      |  9 ++++++
 include/linux/device/bus.h  |  3 ++
 5 files changed, 90 insertions(+), 13 deletions(-)

-- 
2.25.1

