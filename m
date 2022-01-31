Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 192154A4A23
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 16:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379397AbiAaPOr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 10:14:47 -0500
Received: from mga09.intel.com ([134.134.136.24]:61344 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1377812AbiAaPOS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 Jan 2022 10:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643642058; x=1675178058;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3D8YLxy7IJXHCZSfu3Aufg/zIoMBFH7k7WLe87F7zsI=;
  b=JNF9yr4cYM9XUnDWw/z3EYD2K74oNY7CClEqTjoWnyiYZ2KYJH4CCuZv
   L69GaHOQ9o3RFyNg6TC+eKbo6NHLpc07Jzr07/SxzVU+NG2Kef9vaPP9d
   6U+3NlCWHzLld3wQi2fxJ24rzogCZK6Q4AZDJ9TsTm81+Ck/zyHamtKPd
   kSvvc2vg+P0iH3iE0BdT0nAM59cLQ+KzT85MTYjYDyGLX0o28anC6xRIv
   5/B8trHTB679s/DnAzEeV5VHf6wU7aVjnWKTPD2DJ5KD/2nRxoVOLrKmS
   sNlJ6QF+GabCQwAQyvY8oFPzz9/getQ7Zg3NqkmFUgAG/sPQDvH1MIrHf
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="247248983"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="247248983"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 07:14:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="768615387"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 31 Jan 2022 07:14:01 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BB70F21A; Mon, 31 Jan 2022 17:14:15 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: [PATCH v4 0/8] platform/x86: introduce p2sb_bar() helper
Date:   Mon, 31 Jan 2022 17:13:38 +0200
Message-Id: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There are a few users and at least one more is coming (*) that would like
to utilize P2SB mechanism of hiding and unhiding a device from the PCI
configuration space.

Here is the series to consolidate p2sb handling code for existing users
and provide a generic way for new comer(s).

It also includes a patch to enable GPIO controllers on Apollo Lake
when it's used with ABL bootloader w/o ACPI support.

The patch that bring the helper ("platform/x86/intel: Add Primary
to Sideband (P2SB) bridge support") has a commit message that
sheds a light on what the P2SB is and why this is needed.

The changes made in v2 do not change the main idea and the functionality
in a big scale. What we need is probably one more (RE-)test done by Henning.
I hope to have it merged to v5.18-rc1 that Siemens can develop their changes
based on this series.

I have tested this on Apollo Lake platform (I'm able to see SPI NOR and
since we have an ACPI device for GPIO I do not see any attempts to recreate
one).

*) One in this series, and one is a due after merge in the Simatic IPC drivers

The series may be routed either via MFD (and I guess Lee would prefer that)
or via PDx86, whichever seems better for you, folks. As of today patches
are ACKed by the respective maintainers, but I2C one and one of the MFD.

Wolfram, can you ACK the patch against i2c-i801 driver, if you have no
objections?

Changes in v4:
- added tag to the entire series (Hans)
- added tag to pin control patch (Mika)
- dropped PCI core changes (PCI core doesn't want modifications to be made)
- as a consequence of the above merged necessary bits into p2sb.c
- added a check that p2sb is really hidden (Hans)
- added EDAC patches (reviewed by maintainer internally)

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
  pinctrl: intel: Check against matching data instead of ACPI companion
  mfd: lpc_ich: Factor out lpc_ich_enable_spi_write()
  mfd: lpc_ich: Switch to generic p2sb_bar()
  i2c: i801: convert to use common P2SB accessor
  EDAC, pnd2: Use proper I/O accessors and address space annotation
  EDAC, pnd2: convert to use common P2SB accessor

Jonathan Yong (1):
  platform/x86/intel: Add Primary to Sideband (P2SB) bridge support

Tan Jui Nee (1):
  mfd: lpc_ich: Add support for pinctrl in non-ACPI system

 drivers/edac/Kconfig                   |   1 +
 drivers/edac/pnd2_edac.c               |  62 ++---
 drivers/i2c/busses/Kconfig             |   1 +
 drivers/i2c/busses/i2c-i801.c          |  39 +---
 drivers/mfd/Kconfig                    |   1 +
 drivers/mfd/lpc_ich.c                  | 136 +++++++++--
 drivers/pinctrl/intel/pinctrl-intel.c  |  14 +-
 drivers/platform/x86/intel/Kconfig     |  12 +
 drivers/platform/x86/intel/Makefile    |   1 +
 drivers/platform/x86/intel/p2sb.c      | 305 +++++++++++++++++++++++++
 include/linux/platform_data/x86/p2sb.h |  27 +++
 11 files changed, 500 insertions(+), 99 deletions(-)
 create mode 100644 drivers/platform/x86/intel/p2sb.c
 create mode 100644 include/linux/platform_data/x86/p2sb.h

-- 
2.34.1

