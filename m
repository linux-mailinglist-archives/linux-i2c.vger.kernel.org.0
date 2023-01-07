Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9B266611D5
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Jan 2023 22:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbjAGVl5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 Jan 2023 16:41:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbjAGVln (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 7 Jan 2023 16:41:43 -0500
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00659271AC
        for <linux-i2c@vger.kernel.org>; Sat,  7 Jan 2023 13:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References;
        bh=GcaqUWjB3pCY9HRie1twbOV8D4d9s/mjPCEUH7Y0MC0=; b=ADSkt2CuFTKvjNa/snpjj0cNeN
        QOxJ/kvffwB7NNPXZFm1suB5UvqiTlaxVrY9tJYm6LG/H/x5RypRje0ZEzI8r+Ucxgag14IuCwrE8
        +zB+BWpaLKq/dAuCg6IFx8SNyOdPJEkqAfGUHndWUnKO4m78xq74KMxTUWZMiS45vMrUOmsN+uRMo
        kfLWOT2phd2J7cOQzfvuhs2C1+kZtBHfbyEk02HZK69t6tyXujjxWajxiQNsdQlDIg0RgqIqto8ds
        ZX1HKWkIekQsAnsjAzOWkE25LEZ/KdFGjxlVomCUsHcTtawfayHSG/PYuzvuepNmMU1Q9/sR5ziZk
        0Z0Bp13A==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pEGb5-000ITH-IH; Sat, 07 Jan 2023 22:19:23 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pEGb5-000KM5-21; Sat, 07 Jan 2023 22:19:23 +0100
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 0/5] i2c: cadence: Small cleanups
Date:   Sat,  7 Jan 2023 13:18:09 -0800
Message-Id: <20230107211814.1179438-1-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26774/Sat Jan  7 09:54:43 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series has a set of small cleanups for the Cadence I2C driver. The
changes are mostly cosmetical and there is no change in behavior of the
driver.

Lars-Peter Clausen (5):
  i2c: cadence: Remove unused CDNS_I2C_DATA_INTR_DEPTH define
  i2c: cadence: Remove `irq` field from driver state struct
  i2c: cadence: Remove redundant expression in if clause
  i2c: cadence: Remove always false ternary operator
  i2c: cadence: Remove unnecessary register reads

 drivers/i2c/busses/i2c-cadence.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

-- 
2.30.2

