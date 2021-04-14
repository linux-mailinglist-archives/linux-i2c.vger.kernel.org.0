Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913E435FDD1
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 00:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbhDNWeE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 18:34:04 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:42382 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbhDNWeE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 18:34:04 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 97475891AF;
        Thu, 15 Apr 2021 10:33:41 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618439621;
        bh=ZMUWmJcEVDSXU5SeAiBXupQ9ZrnX6dLTNnP8Rg7usac=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=NmrLQ11iaAxhKLqG2qBzAamGN/nmrCOpyVCvAijnPXDwXyy9ADc9TQK54TBJFc3rx
         JMUdT27bM7U6XEiL7ZmiiYmrJwon/BrKgRtehjyLgBd0LqulzbqYwBvz4YasYG9SgC
         wcpXs2JH53mKnjbXd/yGjIutN2QNj2SE5mhxZhXGnKUm/sZ2NL6/TW0VbXZ+U4A0xT
         cxIVKkG65IWgRVryww4MyJRWgMFx/c05mzAwpiQoc9Y6SX6ecF28JcxwvR05H7lHwG
         XeUfF1ZrBdYIjFg4a6ct/hnx9oYX1B8PfH7qJ/7pr8qoTAOysqNDa9TKmCiZxxOUvu
         gI9AFwTqGpVcg==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60776dc50000>; Thu, 15 Apr 2021 10:33:41 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id AF7CC13EEED;
        Thu, 15 Apr 2021 10:34:01 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 17F4528945B; Thu, 15 Apr 2021 10:33:41 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 2/6] i2c: mpc: Update license and copyright
Date:   Thu, 15 Apr 2021 10:33:21 +1200
Message-Id: <20210414223325.23352-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414223325.23352-1-chris.packham@alliedtelesis.co.nz>
References: <20210414223325.23352-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=3YhXtTcJ-WEA:10 a=uHd7jcRfAAAA:8 a=qElQSwgLyQ8-3NUW6WYA:9 a=Ht9MEGjvesGdgnQqdPSO:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use SPDX-License-Identifier and add copyright for Allied Telesis
because of the reasonably large rewrite in the preceding patch.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v4:
    - New, split out from "i2c: mpc: Interrupt driven transfer"

 drivers/i2c/busses/i2c-mpc.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 0a80fafbe6c6..37244138875a 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -1,16 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * (C) Copyright 2003-2004
- * Humboldt Solutions Ltd, adrian@humboldt.co.uk.
-
  * This is a combined i2c adapter and algorithm driver for the
  * MPC107/Tsi107 PowerPC northbridge and processors that include
  * the same I2C unit (8240, 8245, 85xx).
  *
- * Release 0.8
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
+ * Copyright (C) 2003-2004 Humboldt Solutions Ltd, adrian@humboldt.co.uk
+ * Copyright (C) 2021 Allied Telesis Labs
  */
=20
 #include <linux/kernel.h>
--=20
2.31.1

