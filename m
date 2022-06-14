Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD1554AE10
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 12:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbiFNKOK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 06:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242741AbiFNKOJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 06:14:09 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C2C457B5;
        Tue, 14 Jun 2022 03:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655201648; x=1686737648;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ru6Hs1IZbuBJ7mwIdfAMjY/hLuzXXJRVVCdFdhzK58c=;
  b=CgaBa9RMv1JcNZ9Gr39IlXAs1EmIBNjmJ3Qz0FhucoaBzWqG6zf8V+og
   2eTdnvvnPCdjxfNSHW3IIhFzE06TzxUL2wMEm9deF8mq0fu3sa/AeKe5d
   ViaEE2GHh0vspkrUgYaWmylzNqSgV9wLvqbBVnlKZxylm24EhOTZgs9Wk
   gQLG9d2LWIKK5aIgV3osIhHYFRG2amX3tTXWgboEfPS66P11Z8W3U7QkS
   fVMcgX42GHkrwJiB44rbQ3cBAltohSdy8MvIIhTSQado1ZW3qg32Bdjfm
   eqdYcBbao5t94fUSJSgAz+S80D5pyGO7LkSYFTNE6RDUpsK1hviU7jsrS
   w==;
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="177866867"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jun 2022 03:14:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 14 Jun 2022 03:14:06 -0700
Received: from rob-ult-m19940.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 14 Jun 2022 03:14:03 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <andrew@sanpeople.com>,
        <mhoffman@lightlink.com>, <khali@linux-fr.org>, <wsa@kernel.org>,
        <peda@axentia.se>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [RESEND 0/3] i2c: at91: Fixes and updates
Date:   Tue, 14 Jun 2022 13:13:44 +0300
Message-ID: <20220614101347.16910-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Resend due to the fact that the i2c list no longer accepts replys on the
old patch-set. Comments not addressed yet.

The first patch is mostly a prerequisite for the second one. It only
moves the i2c_recover_bus() out of the actual transfer function. This
helps the second patch disable the controller before using GPIO
recovery. The second patch will keep the controller enabled when a
transfer occurs. Before using GPIO recovery, the controller must be
disabled, to ignore potential glitches. However, the controller must be
enabled for HW recovery (bus CLEAR command). The third and last patch
adds advanced digital filtering support for SAMA5D4. The TWI IP found in
SAMA5D4 supports advanced digital filtering, even if, at the moment of
this patch, the SAMA5D4 datasheet does not mention it.

Codrin Ciubotariu (3):
  i2c: at91: move i2c_recover_bus() outside of at91_do_twi_transfer()
  i2c: at91: keep the controller disabled when it is not used
  i2c: at91: add advanced digital filtering support for SAMA5D4

 drivers/i2c/busses/i2c-at91-core.c   |  1 +
 drivers/i2c/busses/i2c-at91-master.c | 53 ++++++++++++++++++++++------
 2 files changed, 44 insertions(+), 10 deletions(-)

-- 
2.34.1

