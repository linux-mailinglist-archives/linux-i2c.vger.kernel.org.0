Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA1C2C8538
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 14:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgK3Nce (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 08:32:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgK3Nce (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 08:32:34 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9138C0613CF;
        Mon, 30 Nov 2020 05:31:53 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id s8so16206500wrw.10;
        Mon, 30 Nov 2020 05:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OohUDjp6HEgwFCMO0olHO61AfJV21cETxnMeTMXANPE=;
        b=LEEf+aDfTzgycqlcDqg7AO6TQ+daYocnGIKufN7HaBFo7no9n+QWHT7G6y6QpnbfFB
         9tcr/5p+6N/pbAVl+ektMve/T6qZcluAPnXVoUG9vCEiZ0vFo6+seRUKdt0iHGoCRchc
         VbvxYQd4r6ziLeS94h0hEi93aP9Ft2YO89nT0w3gnROBGSnF7CI9Dld1kdsUcGgXPbLl
         zlvLjGKJ3J/Q6+A4NQwKJLeLFzXrYYGywCbFihnhfJDh3yAGIz58Dx3xpdVXUYoaQX8d
         yb3RkB2l62Z9R8dpnfWc1qjcVpn69+5yT1Vbtm1LEedBsDXFBP/iDACXzQ1F//IgF3Xi
         1QwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OohUDjp6HEgwFCMO0olHO61AfJV21cETxnMeTMXANPE=;
        b=HbQFhW++PQlKvyPHBAOKlN0y5u19lrhWgUO3wzlege5NiUmGBFjA3gbhsz32rVFddj
         uLVTwTGnkgUdq7+S4Dr3tA+Xjkap/ZX8KsWX4V2hM0/lhzIlX0jzVCu+vxe2VJ0cItcX
         Rox7c/ipadVmLOmm6g/EpJKE2y3zu4wzwuc7dtpECAMdKYpvM5FOXEEyZLV62JXrVQUK
         AyLLJQpHkrES2Tnf63YegAVOlh+D2zA2eHXQZhisC5LyUMyEUuVda9sbmWbaZs57xUvp
         2ZrWxNKrpKA5Rk72kLwPqkimHYSNEql7sgFCxXwIKCK8zI/Bl0Wt986YrQQBG1V5ELfx
         Bm/A==
X-Gm-Message-State: AOAM532t9tU2wtslHtXEY+BwQN7cZkUqRUvyY4T3e+tQ/ViZ8hbl6Vh5
        hLIZlCXwR0G1SCP2Y9uCes9nvBXYZp0gVnQF
X-Google-Smtp-Source: ABdhPJxvWyJlVNttaBLVyFzU+UG14IKAfTbd0MHaUPq0yLKidX3VHINPbTXhWrEbFVHnes7BVEFDMw==
X-Received: by 2002:a05:6000:14b:: with SMTP id r11mr29006695wrx.53.1606743112313;
        Mon, 30 Nov 2020 05:31:52 -0800 (PST)
Received: from valhalla.home ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id g192sm7452333wme.48.2020.11.30.05.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 05:31:51 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org
Cc:     rjw@rjwysocki.net, lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: [PATCH 00/18] Add functionality to ipu3-cio2 driver allowing software_node connections to sensors on platforms designed for Windows
Date:   Mon, 30 Nov 2020 13:31:11 +0000
Message-Id: <20201130133129.1024662-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello all

Previous version:

https://lore.kernel.org/linux-media/20201019225903.14276-1-djrscally@gmail.com/

This series aims to add support for webcams on laptops with ACPI tables
designed for use with CIO2 on Windows. There are two main parts; the
first is extending the ipu3-cio2 driver to allow for patching the
firmware via software_nodes if endpoints aren't defined by ACPI. Patch #13
deals directly with that, all preceding patches are either supplemental
changes or incidental fixes along the way.

The second main part is a way to handle the unusual definition of resource
destined for the sensors in these ACPI tables; regulators and GPIO lines
that are supposed to be consumed by the sensor are lumped in the _CRS of
a dummy ACPI device upon which the sensor is dependent. Patch 18 defines a
new driver to handle those dummy devices and map the resources to the
sensor instead. 14-17 are supporting changes for that driver.

Changelogs mostly in the individual patches, but a broad summary:

	- Altered fwnode_device_is_available() to return true if the
	fwnode_handle doesn't implement that operation.
	- Altered fwnode_graph_get_endpoint_by_id() to parse secondary
	if no endpoint found on primary.
	- Enforce parent->child ordering of software_nodes on registration
	- Added a function to get the next ACPI device with matching _HID,
	plus an iterator macro
	- Altered cio2-bridge.c to store the bridge struct (and basically
	everything else) in heap, plus removed the requirement to delay
	ipu3-cio2 probe until after the i2c devices were instantiated. 
	Also now ensured we handle multiple sensors with the same _HID.
	- Added a function to get devices _dependent_ on a given ACPI dev,
	according to their _DEP entries.
	- Added a function to explicitly construct the name of an I2C dev
	created from an ACPI dev.
	- Added a driver to handle the dummy ACPI devices discussed above.

Comments very welcome!

Dan Scally (1):
  i2c: i2c-core-base: Use the new i2c_acpi_dev_name() in
    i2c_set_dev_name()

Daniel Scally (16):
  property: Return true in fwnode_device_is_available for node types
    that do not implement this operation
  property: Add support for calling fwnode_graph_get_endpoint_by_id()
    for fwnode->secondary
  software_node: Fix failure to put() and get() references to children
    in software_node_get_next_child()
  software_node: Enforce parent before child ordering of nodes array for
    software_node_register_nodes()
  software_node: Alter software_node_unregister_nodes() to unregister
    the array in reverse order
  software_node: amend software_node_unregister_node_group() to perform
    unregistration of array in reverse order to be consistent with
    software_node_unregister_nodes()
  lib/test_printf.c: Use helper function to unwind array of
    software_nodes
  ipu3-cio2: Add T: entry to MAINTAINERS
  ipu3-cio2: Rename ipu3-cio2.c to allow module to be built from
    multiple source files retaining ipu3-cio2 name
  media: v4l2-core: v4l2-async: Check possible match in match_fwnode
    based on sd->fwnode->secondary
  acpi: Add acpi_dev_get_next_match_dev() and macro to iterate through
    acpi_devices matching a given _HID
  ipu3-cio2: Add functionality allowing software_node connections to
    sensors on platforms designed for Windows
  acpi: utils: Add function to fetch dependent acpi_devices
  i2c: i2c-core-acpi: Add i2c_acpi_dev_name()
  gpio: gpiolib-acpi: Export acpi_get_gpiod()
  ipu3: Add driver for dummy INT3472 ACPI device

Heikki Krogerus (1):
  software_node: Add support for fwnode_graph*() family of functions

 MAINTAINERS                                   |   9 +
 drivers/acpi/utils.c                          |  98 ++++-
 drivers/base/property.c                       |   9 +
 drivers/base/swnode.c                         | 157 +++++++-
 drivers/gpio/gpiolib-acpi.c                   |   3 +-
 drivers/i2c/i2c-core-acpi.c                   |  14 +
 drivers/i2c/i2c-core-base.c                   |   2 +-
 drivers/media/pci/intel/ipu3/Kconfig          |  32 ++
 drivers/media/pci/intel/ipu3/Makefile         |   4 +
 drivers/media/pci/intel/ipu3/cio2-bridge.c    | 260 ++++++++++++
 drivers/media/pci/intel/ipu3/cio2-bridge.h    | 108 +++++
 drivers/media/pci/intel/ipu3/int3472.c        | 381 ++++++++++++++++++
 drivers/media/pci/intel/ipu3/int3472.h        |  96 +++++
 .../ipu3/{ipu3-cio2.c => ipu3-cio2-main.c}    |  27 ++
 drivers/media/pci/intel/ipu3/ipu3-cio2.h      |   6 +
 drivers/media/v4l2-core/v4l2-async.c          |   8 +
 include/acpi/acpi_bus.h                       |   9 +
 include/linux/acpi.h                          |   5 +
 include/linux/i2c.h                           |   5 +
 lib/test_printf.c                             |   4 +-
 20 files changed, 1213 insertions(+), 24 deletions(-)
 create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.c
 create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.h
 create mode 100644 drivers/media/pci/intel/ipu3/int3472.c
 create mode 100644 drivers/media/pci/intel/ipu3/int3472.h
 rename drivers/media/pci/intel/ipu3/{ipu3-cio2.c => ipu3-cio2-main.c} (98%)

-- 
2.25.1

