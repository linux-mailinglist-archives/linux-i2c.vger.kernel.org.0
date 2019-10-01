Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B268C3D95
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2019 19:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729985AbfJAQkZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Oct 2019 12:40:25 -0400
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:35264 "EHLO
        smtp-fw-6001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729851AbfJAQkZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Oct 2019 12:40:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1569948024; x=1601484024;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=B6ZukSVqPXIDGwanru0AxvEjOvXIzvMDbuKH0fi3bms=;
  b=nPpfREgestedl+iuTO8n5jzvJdO57zsy+ZE6BM0V8syEP+ITTB7dK3PY
   LHOcyeE/HrmpA4dPswmpT2tNnp6fvbykzK+tt3TuHtl2R1d67OoNsYMTs
   7Dz+zFqUgTjjuyRCArB3Cp+UzGx8zgIfwhcGtSVgqg+S7O8XrfVAhc3pM
   I=;
X-IronPort-AV: E=Sophos;i="5.64,571,1559520000"; 
   d="scan'208";a="419078825"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com) ([10.124.125.6])
  by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP; 01 Oct 2019 16:40:19 +0000
Received: from EX13MTAUWC001.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
        by email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com (Postfix) with ESMTPS id 080C1A25ED;
        Tue,  1 Oct 2019 16:40:17 +0000 (UTC)
Received: from EX13D02UWC001.ant.amazon.com (10.43.162.243) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 1 Oct 2019 16:40:16 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D02UWC001.ant.amazon.com (10.43.162.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 1 Oct 2019 16:40:16 +0000
Received: from 8c859006a84e.ant.amazon.com (172.26.203.30) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 1 Oct 2019 16:40:15 +0000
From:   Patrick Williams <alpawi@amazon.com>
CC:     =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjorn.ardo@axis.com>,
        Patrick Williams <alpawi@amazon.com>,
        Patrick Williams <patrick@stwcx.xyz>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] i2c: slave-eeprom: initialize empty eeprom properly
Date:   Tue, 1 Oct 2019 11:40:05 -0500
Message-ID: <20191001164009.21610-1-alpawi@amazon.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
MIME-Version: 1.0
Content-Type: text/plain
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2c-slave-eeprom driver emulates at24 class eeprom devices,
which come initialized with all 1s.  Do the same in the software
emulation.

Signed-off-by: Patrick Williams <alpawi@amazon.com>
---
 drivers/i2c/i2c-slave-eeprom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index db9763cb4dae..efee56106251 100644
--- a/drivers/i2c/i2c-slave-eeprom.c
+++ b/drivers/i2c/i2c-slave-eeprom.c
@@ -131,6 +131,8 @@ static int i2c_slave_eeprom_probe(struct i2c_client *client, const struct i2c_de
 	if (!eeprom)
 		return -ENOMEM;
 
+	memset(eeprom->buffer, 0xFF, size);
+
 	eeprom->idx_write_cnt = 0;
 	eeprom->num_address_bytes = flag_addr16 ? 2 : 1;
 	eeprom->address_mask = size - 1;
-- 
2.17.2 (Apple Git-113)

