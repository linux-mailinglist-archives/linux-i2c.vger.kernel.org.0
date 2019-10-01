Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7571C39B2
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2019 18:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727823AbfJAQAL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Oct 2019 12:00:11 -0400
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:9565 "EHLO
        smtp-fw-6001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727398AbfJAQAL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Oct 2019 12:00:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1569945610; x=1601481610;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=qDD5LT8DtwKPIaKWHMsLpUgPzfzI2haoHG8xYLA7T7o=;
  b=fXaF52mGGeCZLSuVbHEHCld6mDh3UEUdBPxtyRaYYg+vUWtwkk5AQqHn
   ts3lbm8FdJuQvOLJ+Lz6bctvjS/tB+dyYzFH0My1U48jSdlP1ExRnMkV9
   n7tAMc1VBu9BADEgPjY0Au7ebcRYY2Ajj00fkM5bFMh8SUbcCLv7d8MrQ
   8=;
X-IronPort-AV: E=Sophos;i="5.64,571,1559520000"; 
   d="scan'208";a="419068076"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.124.125.6])
  by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP; 01 Oct 2019 16:00:08 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
        by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS id C54C4A1CA2;
        Tue,  1 Oct 2019 16:00:07 +0000 (UTC)
Received: from EX13D02UWB003.ant.amazon.com (10.43.161.48) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 1 Oct 2019 16:00:07 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D02UWB003.ant.amazon.com (10.43.161.48) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 1 Oct 2019 16:00:06 +0000
Received: from 8c859006a84e.ant.amazon.com (172.26.203.30) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 1 Oct 2019 16:00:06 +0000
From:   Patrick Williams <alpawi@amazon.com>
CC:     Patrick Williams <alpawi@amazon.com>,
        Patrick Williams <patrick@stwcx.xyz>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 0/2] i2c: pxa: migrate to i2c-core-slave APIs
Date:   Tue, 1 Oct 2019 10:59:58 -0500
Message-ID: <20191001160001.2388-1-alpawi@amazon.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
MIME-Version: 1.0
Content-Type: text/plain
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c-pxa has its own i2c slave APIs rather than using the i2c-core
APIs.  There are no in-tree drivers currently using this custom
slave API set.

Migrate the i2c-pxa driver from its own i2c slave APIs to the
i2c-core slave APIs so that in-tree slave devices can be used with
the i2c-pxa hardware (ex. i2c-slave-eeprom).

Patrick Williams (2):
  i2c: pxa: migrate to new i2c_slave APIs
  i2c: pxa: remove unused i2c-slave APIs

 drivers/i2c/busses/Kconfig            |  1 +
 drivers/i2c/busses/i2c-pxa.c          | 75 +++++++++++++++++++++------
 include/linux/i2c-pxa.h               | 18 -------
 include/linux/platform_data/i2c-pxa.h |  4 --
 4 files changed, 61 insertions(+), 37 deletions(-)
 delete mode 100644 include/linux/i2c-pxa.h

-- 
2.17.2 (Apple Git-113)

