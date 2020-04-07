Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90DEA1A0E70
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 15:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728855AbgDGNfV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 09:35:21 -0400
Received: from mga01.intel.com ([192.55.52.88]:26208 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728482AbgDGNfV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Apr 2020 09:35:21 -0400
IronPort-SDR: EMYNDylrvLf3evf5i8JZwOUYKTDeAnE93yvsoV3YVcUDTtz8sUHvOM/N8ziKegqz+qUwgEqZVq
 P6qEcQZgJW4Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 06:35:20 -0700
IronPort-SDR: aJYPjk9EJDKvJDuQm6kKfjl66dBGA6a9fg7FdM1taLW8FwB1wV0m0UujTEBPzXbqL28vLq89WW
 2VTX1xXOjNjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,354,1580803200"; 
   d="scan'208";a="424748773"
Received: from wwanmoha-ilbpg2.png.intel.com ([10.88.227.42])
  by orsmga005.jf.intel.com with ESMTP; 07 Apr 2020 06:35:18 -0700
From:   Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
To:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com
Cc:     linux-i2c@vger.kernel.org, wan.ahmad.zainie.wan.mohamad@intel.com
Subject: [PATCH 0/2] i2c: designware: Calculate *CNT for Fast Mode Plus
Date:   Tue,  7 Apr 2020 21:34:37 +0800
Message-Id: <20200407133439.23422-1-wan.ahmad.zainie.wan.mohamad@intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi.

Custom parameters for HCNT/LCNT are not available for OF based system.
We will use existing SCL timing parameter calculation functions to
get HCNT/LCNT value for Fast Mode Plus and High Speed Mode.

The patches were tested on Keem Bay EVM (OF based system), and using
Tiger Lake platform and Leaf Hill board to cover ACPI and PCI mode.

Thank you.

Best regards,
Zainie.


Wan Ahmad Zainie (2):
  i2c: designware: Calculate SCL timing parameter for Fast Mode Plus
  i2c: designware: Calculate SCL timing parameter for High Speed Mode

 drivers/i2c/busses/i2c-designware-master.c | 37 ++++++++++++++++++----
 1 file changed, 31 insertions(+), 6 deletions(-)

-- 
2.17.1

