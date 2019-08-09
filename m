Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEEFC87A64
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 14:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406454AbfHIMp5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 08:45:57 -0400
Received: from mga12.intel.com ([192.55.52.136]:64792 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405948AbfHIMp5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 9 Aug 2019 08:45:57 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Aug 2019 05:45:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; 
   d="scan'208";a="350482342"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 09 Aug 2019 05:45:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id D01359E0; Fri,  9 Aug 2019 15:45:53 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@the-dreams.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 0/2] watchdog: Correct iTCO for Cannon Lake and beyond
Date:   Fri,  9 Aug 2019 15:45:51 +0300
Message-Id: <20190809124553.67012-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Starting from Intel Cannon Lake PCH the NO_REBOOT bit which is required by
the iTCO driver was moved from private register space to be part of the
TCO1_CNT register. This series introduces a new iTCO version (6) that gets
set for Cannon Lake, Cedar Fork, Comet Lake, Elkhart Lake and Ice Lake
which are affected by this move.

Mika Westerberg (2):
  watchdog: iTCO: Add support for Cannon Lake PCH iTCO
  i2c: i801: Use iTCO version 6 in Cannon Lake PCH and beyond

 drivers/i2c/busses/i2c-i801.c | 138 +++++++++++++++++++++-------------
 drivers/watchdog/iTCO_wdt.c   |  25 +++++-
 2 files changed, 109 insertions(+), 54 deletions(-)

-- 
2.20.1

