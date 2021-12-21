Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A65AD47C675
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 19:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241275AbhLUSXc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 13:23:32 -0500
Received: from mga03.intel.com ([134.134.136.65]:44983 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241271AbhLUSXb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Dec 2021 13:23:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640111010; x=1671647010;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7+5zVsIZ/ITzZCzzI7K9rUDfhR9Qdw/EbbOne19K668=;
  b=gVs8+190OiL8EQPn7U2X7kAYX2f7tb7ofUAqLUbl3h9SL7fE6vU/1Yv5
   kGhegiWN8c4OWCZqAtbqQEdvxW3u/2/wFIoBtdWSCRKjlLv+j2PEqt7oc
   eRq7z4S9hm3OySKM9JBdgG9RwN30Uy6VOywzrmw0qxU/IQLMmAD8Iyv85
   fZGV2uhPtPeyRq4WfsSxZsnK8U7bpfxlsXuDc16NJ1OnWZtx/UiYvPydV
   g7xNi1rC/0FPLFl0N3pwztd32X//F7o/gM0hu3XecDLAJIWPYS3nf7k3q
   P6BdgAZhG/Kb25XdjQi3jWr4ivlX0ALzrr5fXpXNDFn0voAtkpAGmxAKa
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="240418045"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="240418045"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 10:15:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="548200384"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 21 Dec 2021 10:15:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D30F9190; Tue, 21 Dec 2021 20:15:39 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: [PATCH v3 0/8] platform/x86: introduce p2sb_bar() helper
Date:   Tue, 21 Dec 2021 20:15:18 +0200
Message-Id: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There are a few users and at least one more is coming that would
like to utilize P2SB mechanism of hiding and unhiding a device from
the PCI configuration space.

Here is the series to deduplicate existing users and provide
a generic way for new comers.

It also includes a patch to enable GPIO controllers on Apollo Lake
when it's used with ABL bootloader w/o ACPI support.

The patch that bring the helper ("platform/x86/intel: Add Primary
to Sideband (P2SB) bridge support") has a commit message that
sheds a light on what the P2SB is and why this is needed.

Please, comment on the approach and individual patches.

The changes made in v2 do not change the main idea and the functionality
in a big scale. What we need is probably one more (RE-)test done by Henning.
I hope to have it merged to v5.17-rc1 that Siemens can develop their changes
based on this series.

I have tested this on Apollo Lake platform (I'm able to see SPI NOR and
since we have an ACPI device for GPIO I do not see any attempts to recreate
one).

(Since it's cross subsystem, the PDx86 seems the main one and
I think it makes sense to route it throught it with immutable
tag or branch provided for the others).

Bjorn, are you okay with this approach and the commit message in the main
patch?

Changes in v3:
- resent with cover letter

Changes in v2:
- added parentheses around bus in macros (Joe)
- added tag (Jean)
- fixed indentation and wrapping in the header (Christoph)
- moved out of PCI realm to PDx86 as the best common denominator (Bjorn)
- added a verbose commit message to explain P2SB thingy (Bjorn)
- converted first parameter from pci_dev to pci_bus
- made first two parameters (bus and devfn) optional (Henning, Lee)
- added Intel pin control patch to the series (Henning, Mika)
- fixed English style in the commit message of one of MFD patch (Lee)
- added tags to my MFD LPC ICH patches (Lee)
- used consistently (c) (Lee)
- made indexing for MFD cell and resource arrays (Lee)
- fixed the resource size in i801 (Jean)

Andy Shevchenko (6):
  PCI: Introduce pci_bus_*() printing macros when device is not
    available
  PCI: Convert __pci_read_base() to __pci_bus_read_base()
  pinctrl: intel: Check against matching data instead of ACPI companion
  mfd: lpc_ich: Factor out lpc_ich_enable_spi_write()
  mfd: lpc_ich: Switch to generic p2sb_bar()
  i2c: i801: convert to use common P2SB accessor

Jonathan Yong (1):
  platform/x86/intel: Add Primary to Sideband (P2SB) bridge support

Tan Jui Nee (1):
  mfd: lpc_ich: Add support for pinctrl in non-ACPI system

 drivers/i2c/busses/Kconfig             |   1 +
 drivers/i2c/busses/i2c-i801.c          |  39 ++-----
 drivers/mfd/Kconfig                    |   1 +
 drivers/mfd/lpc_ich.c                  | 136 +++++++++++++++++++++----
 drivers/pci/pci.h                      |  16 ++-
 drivers/pci/probe.c                    |  81 +++++++--------
 drivers/pinctrl/intel/pinctrl-intel.c  |  14 ++-
 drivers/platform/x86/intel/Kconfig     |  12 +++
 drivers/platform/x86/intel/Makefile    |   2 +
 drivers/platform/x86/intel/p2sb.c      |  99 ++++++++++++++++++
 include/linux/pci.h                    |   8 ++
 include/linux/platform_data/x86/p2sb.h |  27 +++++
 12 files changed, 335 insertions(+), 101 deletions(-)
 create mode 100644 drivers/platform/x86/intel/p2sb.c
 create mode 100644 include/linux/platform_data/x86/p2sb.h

-- 
2.34.1

