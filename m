Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1BB05A3E78
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Aug 2022 17:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbiH1Pto (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Aug 2022 11:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbiH1Ptn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Aug 2022 11:49:43 -0400
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 964ED33435;
        Sun, 28 Aug 2022 08:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1661701783; x=1693237783;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2gu/k3/W/Upcjh0+g5rzekrCdIVryRGg8BmX2HEtuLE=;
  b=Akj2uc+Fg667vesEkXwD0UnoHzE5ggjQh4XLgDwM3nuRheSW9M+8VqdP
   QNAauG5j6/TJupL8faMODPP127ul86bnmb9ea5cc6+Fk9XldJraMvmOSD
   9WH8XmnR5wwF6lyJJlsQwXAgL8RQxb0c2OJfFNv59CBZi3IovrH2OKvLY
   c=;
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-pdx-2a-e6c05252.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2022 15:49:31 +0000
Received: from EX13MTAUEB001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-pdx-2a-e6c05252.us-west-2.amazon.com (Postfix) with ESMTPS id 960AC44ADA;
        Sun, 28 Aug 2022 15:49:29 +0000 (UTC)
Received: from EX13D08UEB002.ant.amazon.com (10.43.60.107) by
 EX13MTAUEB001.ant.amazon.com (10.43.60.96) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Sun, 28 Aug 2022 15:49:05 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D08UEB002.ant.amazon.com (10.43.60.107) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Sun, 28 Aug 2022 15:49:05 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP
 Server id 15.0.1497.38 via Frontend Transport; Sun, 28 Aug 2022 15:49:05
 +0000
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
        id D8CA84BB6; Sun, 28 Aug 2022 15:49:04 +0000 (UTC)
From:   Eliav Farber <farbere@amazon.com>
To:     <brgl@bgdev.pl>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <arnd@arndb.de>, <gregkh@linuxfoundation.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <farbere@amazon.com>, <talel@amazon.com>, <hhhawa@amazon.com>,
        <jonnyc@amazon.com>, <hanochu@amazon.com>, <ronenk@amazon.com>,
        <itamark@amazon.com>, <shellykz@amazon.com>, <shorer@amazon.com>,
        <amitlavi@amazon.com>, <almogbs@amazon.com>, <dkl@amazon.com>,
        <dwmw@amazon.co.uk>
Subject: [PATCH v3 0/2] add power-supply control to enable eeprom usage
Date:   Sun, 28 Aug 2022 15:49:02 +0000
Message-ID: <20220828154904.20477-1-farbere@amazon.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

First patch describes the new binding property.
Second patch adds the functionality to the driver.

Change between v3 and v2:
- Apply on top of v6.0-rc1.

Change between v2 and v1:
- Use a gpio regulator for power-supply control.

Eliav Farber (2):
  dt-bindings: at24: add new optional power-supply property
  eeprom: at24: add support for power-supply control

 .../devicetree/bindings/eeprom/at24.yaml      |  4 ++
 drivers/misc/eeprom/at24.c                    | 40 +++++++++++++++++++
 2 files changed, 44 insertions(+)

-- 
2.37.1

