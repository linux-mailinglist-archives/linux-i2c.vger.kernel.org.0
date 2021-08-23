Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF93F3F52F5
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Aug 2021 23:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbhHWVnC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Aug 2021 17:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232963AbhHWVnB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Aug 2021 17:43:01 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F8AC061757
        for <linux-i2c@vger.kernel.org>; Mon, 23 Aug 2021 14:42:18 -0700 (PDT)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 6D55E81BC0;
        Mon, 23 Aug 2021 23:42:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1629754935;
        bh=7NG7DGUKQCJmXtKUNKNuvWJQLJf9GT6DpCAdaR4ZeRs=;
        h=From:To:Cc:Subject:Date:From;
        b=l7bjOeMAuSW1bC1hJ9ZhDhYOI7SsDP7FrOS5n6vURFPKq9Q1wlAszcTIwbv3+bCWY
         ty1trVK1CwuHndIfDKpdYJXEC2aHb9T2nhEJL9nmF8ESUCr6r8Y93f8DYLFiZvl0LN
         DZPWABK1tyDqCMEhQusv+ve+j4FL9byKC0+5mubtmAw1vjkJjoPNBLyOxUgNqmeVtO
         1lXGfurh8YBQie720wTjbeWbhnfBsdSY3zfcs1ZEcZVL11VJAvzS3rxb27a5CXIqtq
         5xJ1N6LTCX+lHrvw4sU7+gCVlWGTkUwJnCpVOBT3559B2H4NmUC2VKHHlqpsS4QauX
         bROLz4S/YxPrw==
From:   Marek Vasut <marex@denx.de>
To:     linux-i2c@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 0/6] i2c: xiic: Fix broken locking
Date:   Mon, 23 Aug 2021 23:41:39 +0200
Message-Id: <20210823214145.295104-1-marex@denx.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Booting ZynqMP with XIIC I2C driver shows multitude of race conditions
in the XIIC driver. This is because locking is completely missing from
the driver, and there are odd corner cases where the hardware behaves
strangely.

Most of these races could be triggered easily when booting on SMP
machines, like the ZynqMP which has up to 4 cores. It is sufficient
for the interrupt handler to run on another core than xiic_start_xfer
and the driver fails completely.

This does not add support for long transfers, this only fixes the
driver to be usable at all instead of being completely broken.

The V2 fixes a few remaining details which cropped up in deployment
over the last year or so, so I believe the result should be reasonably
well tested.

Marek Vasut (6):
  i2c: xiic: Fix broken locking on tx_msg
  i2c: xiic: Drop broken interrupt handler
  i2c: xiic: Defer xiic_wakeup() and __xiic_start_xfer() in
    xiic_process()
  i2c: xiic: Switch from waitqueue to completion
  i2c: xiic: Only ever transfer single message
  i2c: xiic: Fix RX IRQ busy check

 drivers/i2c/busses/i2c-xiic.c | 161 +++++++++++++++-------------------
 1 file changed, 69 insertions(+), 92 deletions(-)

Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: Wolfram Sang <wsa@kernel.org>

-- 
2.32.0

