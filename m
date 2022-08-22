Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6287059BE04
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 12:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234253AbiHVK7F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 06:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234249AbiHVK67 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 06:58:59 -0400
Received: from smtp-fw-9103.amazon.com (smtp-fw-9103.amazon.com [207.171.188.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9278C3123A;
        Mon, 22 Aug 2022 03:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1661165937; x=1692701937;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7s4PF8RXbYEqzbeQRRYuac3gOnJi1NGTK0dQaORCsDM=;
  b=Riw5dd7lqsS6ee91GmGMLqcdtTahtBKnneBP1Gte6mTIBgsRwkXXAucU
   1WDP2pNsnz+U03havLObtz6LkXCJ7IlnSBq8jAbq+E/X9oHnzu7aZzV32
   SOapGBCYgxy3hX3+J0/lLnOH+HSwA8eEINh1GSurG2Z+h0nrpVu9Lcfzu
   w=;
X-IronPort-AV: E=Sophos;i="5.93,254,1654560000"; 
   d="scan'208";a="1046875127"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1a-b09d0114.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-9103.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 10:58:35 +0000
Received: from EX13MTAUWA001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-iad-1a-b09d0114.us-east-1.amazon.com (Postfix) with ESMTPS id 27E6D8150F;
        Mon, 22 Aug 2022 10:58:32 +0000 (UTC)
Received: from EX19D013UWA003.ant.amazon.com (10.13.138.202) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Mon, 22 Aug 2022 10:58:32 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX19D013UWA003.ant.amazon.com (10.13.138.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.12;
 Mon, 22 Aug 2022 10:58:32 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP
 Server id 15.0.1497.38 via Frontend Transport; Mon, 22 Aug 2022 10:58:32
 +0000
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
        id A00FD4C8B; Mon, 22 Aug 2022 10:58:30 +0000 (UTC)
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
Subject: [PATCH v2 0/2] add power-supply control to enable eeprom usage
Date:   Mon, 22 Aug 2022 10:58:28 +0000
Message-ID: <20220822105830.22790-1-farbere@amazon.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

First patch describes the new binding property.
Second patch adds the functionality to the driver.

Change between v2 and v1:
- Use a gpio regulator for power-supply control.

Eliav Farber (2):
  dt-bindings: at24: add new optional power-supply property
  eeprom: at24: add support for power-supply control

 .../devicetree/bindings/eeprom/at24.txt       |  3 ++
 drivers/misc/eeprom/at24.c                    | 41 +++++++++++++++++++
 2 files changed, 44 insertions(+)

-- 
2.37.1

