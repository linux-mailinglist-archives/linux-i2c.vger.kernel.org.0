Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D79B521E36
	for <lists+linux-i2c@lfdr.de>; Tue, 10 May 2022 17:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345959AbiEJP1d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 11:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345684AbiEJP10 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 11:27:26 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C5EFC4;
        Tue, 10 May 2022 08:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652195858; x=1683731858;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=n+IMnOFQ96I6mX1bgHpYEfGAC36nuqLi9egMYIgnSiU=;
  b=WrA+DXv6PMrvgowk0mIiDlBInd9UCz90OA2fUcUnnbJchOJgMi1l9Ydr
   qGo1vw8SKddpVdGb4eGes1PF7EbAji+uzIXB1U9XHcaAfG/oG3/qOYEww
   8v0vjkvEp5cK/gpcGzLnusW0MR/Muae27aHJi5FXmwO7LmZrYqDihB0+h
   fcvNvZ4YX9xIQtpSU2Ns/F2EJPF8NKz5uTJ3b8Hd8kYdrYh+2eqb+WfES
   9TWV2ACxq/x1n4lM/uh701FpJaFfiNNIyKTcUmFg7t2ELYhFgQiXJEMAi
   zrb6fMIA9yxwlRg3o5802h/NsdDk5JGBQJ1H0FPlAJWVS4RFiqxKGYBfx
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="269541484"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="269541484"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 08:17:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="541817698"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 10 May 2022 08:17:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6A964512; Tue, 10 May 2022 18:15:16 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?=C5=81ukasz=20Bartosik?= <lb@semihalf.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: [PATCH v5 0/8] platform/x86: introduce p2sb_bar() helper
Date:   Tue, 10 May 2022 18:14:43 +0300
Message-Id: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There are a few users and at least one more is coming (*1) that would
like to utilize P2SB mechanism of hiding and unhiding a device from
the PCI configuration space.

Here is the series to consolidate p2sb handling code for existing users
and provide a generic way for new comer(s).

It also includes a patch to enable GPIO controllers on Apollo Lake
when it's used with ABL bootloader w/o ACPI support (*2).

The patch that brings the helper ("platform/x86/intel: Add Primary to
Sideband (P2SB) bridge support") has a commit message that sheds a light
on what the P2SB is and why this is needed.

The changes made in v5 do not change the main idea and the functionality
in a big scale. What we need is probably one more retest done by Henning
(*3). I hope to have it merged to v5.19-rc1 that Siemens can develop
their changes based on this series (*4).

I have tested this on Apollo Lake platform (I'm able to see SPI NOR and
since we have an ACPI device for GPIO I do not see any attempts to recreate
one).

*1) One in this series, and one is a recent merge of the Simatic IPC drivers
*2) This patch can be postponed as Lee hasn't given his tag yet.
*3) Henning gave his tag and I dared to used it even against changed patch 1
*4) The changes were posted in between of v4 and v5 of this series, but need
    more work.

Taking into account the *2) the series is ready to be merged via PDx86 tree.

Changes in v5:
- rewritten patch 1 to use pci_scan_single_device() (Lukas, Bjorn)
- rebased patch 2 on top of the new Intel SPI NOR codebase
- fixed a potential bug and rewritten resource filling in patch 5 (Lee)
- added many different tags in a few patches (Jean, Wolfram, Henning)

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
 drivers/edac/pnd2_edac.c               |  62 +++-------
 drivers/i2c/busses/Kconfig             |   1 +
 drivers/i2c/busses/i2c-i801.c          |  39 ++----
 drivers/mfd/Kconfig                    |   1 +
 drivers/mfd/lpc_ich.c                  | 161 +++++++++++++++++++------
 drivers/pinctrl/intel/pinctrl-intel.c  |  14 +--
 drivers/platform/x86/intel/Kconfig     |  12 ++
 drivers/platform/x86/intel/Makefile    |   2 +
 drivers/platform/x86/intel/p2sb.c      | 133 ++++++++++++++++++++
 include/linux/platform_data/x86/p2sb.h |  28 +++++
 11 files changed, 338 insertions(+), 116 deletions(-)
 create mode 100644 drivers/platform/x86/intel/p2sb.c
 create mode 100644 include/linux/platform_data/x86/p2sb.h


base-commit: 3bf222d317a20170ee17f082626c1e0f83537e13
-- 
2.35.1

