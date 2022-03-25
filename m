Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10A5A4E7232
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Mar 2022 12:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235690AbiCYLfk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 07:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbiCYLfj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 07:35:39 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F50A9956;
        Fri, 25 Mar 2022 04:34:04 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 8779320003;
        Fri, 25 Mar 2022 11:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648208042;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=qF9syJqPzWTEYD5QGUV7EFY8GaWp9HCNhV2qmKXb9Nw=;
        b=DfxL25n9DRB/Qw0W7qIpdyUscecNzg6LjWgpoCEr1DGWOL2fAU+od0gCGQcRCvlCZ3Tqnz
        Ov+XGQx0fKvOSzJyAWaugFpb4V5uGA54XGL3HObJHckvLdS0504rzCccAeEbLJdGGrtMSS
        19FJaCm2TrHPOxOlPaK1hNlTJWFsVCA19FUdtF1nWs+tLrWg5/iKN+Jq/P8qFh7CckQwU6
        sd/eL5ZFbMWNFZFysKGIDI8zjopmvSY8iRkfYajqKlNvQk9S+la8y9MH/V/AkNjn9VduOx
        woH0YPgEIVyQw1BU4BE1gU1kdo5vBdGR3YWpuRX2lbeaX6uOVovNto/w9aNI5Q==
From:   =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
Subject: [PATCH v3 0/9] introduce fwnode in the I2C subsystem
Date:   Fri, 25 Mar 2022 12:31:39 +0100
Message-Id: <20220325113148.588163-1-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In order to allow the I2C subsystem to be usable with fwnode, add
some functions to retrieve an i2c_adapter from a fwnode and use
these functions in both i2c mux and sfp. ACPI and device-tree are
handled to allow these modifications to work with both descriptions.
I2C mux support has also been modified to support fwnode based
descriptions.

This series is a subset of the one that was first submitted as a larger
series to add swnode support [1]. In this one, it will be focused on
fwnode support only since it seems to have reach a consensus that
adding fwnode to subsystems makes sense.

[1] https://lore.kernel.org/netdev/YhPSkz8+BIcdb72R@smile.fi.intel.com/T/

---------------

Changes in V3:
 - Add index parameter to property_read_string_array()
 - Implement support for devbice-tree and software nodes
 - Restrict index support for ACPI to 0
 - Add unittests for of_property_read_string_array_index()
 - Add unittests for fwnode_property_read_string_index()

Changes in V2:
 - Remove sfp modifications
 - Add property_read_string_index fwnode_operation callback
 - Implement .property_read_string_index for of and swnode
 - Renamed np variable to fwnode

Clément Léger (9):
  of: add of_property_read_string_array_index()
  of: unittests: add tests for of_property_read_string_array_index()
  device property: add index argument to property_read_string_array()
    callback
  device property: add fwnode_property_read_string_index()
  device property: add tests for fwnode_property_read_string_index()
  i2c: fwnode: add fwnode_find_i2c_adapter_by_node()
  i2c: of: use fwnode_get_i2c_adapter_by_node()
  i2c: mux: pinctrl: remove CONFIG_OF dependency and use fwnode API
  i2c: mux: add support for fwnode

 drivers/acpi/property.c                 |  5 ++-
 drivers/base/property.c                 | 37 ++++++++++++++++++--
 drivers/base/swnode.c                   | 21 ++++++++----
 drivers/base/test/property-entry-test.c | 18 ++++++++++
 drivers/i2c/Makefile                    |  1 +
 drivers/i2c/i2c-core-fwnode.c           | 45 +++++++++++++++++++++++++
 drivers/i2c/i2c-core-of.c               | 30 -----------------
 drivers/i2c/i2c-mux.c                   | 39 ++++++++++-----------
 drivers/i2c/muxes/Kconfig               |  1 -
 drivers/i2c/muxes/i2c-mux-pinctrl.c     | 23 +++++++------
 drivers/of/property.c                   |  5 +--
 drivers/of/unittest.c                   | 20 +++++++++++
 include/linux/fwnode.h                  |  7 ++--
 include/linux/i2c.h                     |  8 ++++-
 include/linux/of.h                      | 22 ++++++++++++
 include/linux/property.h                |  3 ++
 16 files changed, 207 insertions(+), 78 deletions(-)
 create mode 100644 drivers/i2c/i2c-core-fwnode.c

-- 
2.34.1

