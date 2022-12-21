Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0F856537D0
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Dec 2022 21:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbiLUUvw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Dec 2022 15:51:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiLUUvv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Dec 2022 15:51:51 -0500
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0285D1EAD7;
        Wed, 21 Dec 2022 12:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671655909; x=1703191909;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QXFJyE0aj5SXv72Hpk/vCuJFFStLbliUaOJ/1u7reO8=;
  b=nINdmI9iJJlgpvT57fCIDrSZbsgMbzAOe9Ws7vS5GUAS74QYvijhn0Mc
   f8JsoNPAg9hNLQ3zOF1aHJF7KZYKauy9QzTaZrUT8pjT0033RvmMX2ASh
   fnBTbY8zVrdgTifELwqsPJeqc9E/wF/NWamEAKP1P3OdGV6qem1+xV3OI
   o=;
X-IronPort-AV: E=Sophos;i="5.96,263,1665446400"; 
   d="scan'208";a="281547877"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-pdx-2c-m6i4x-94edd59b.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2022 20:51:46 +0000
Received: from EX13D49EUA002.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
        by email-inbound-relay-pdx-2c-m6i4x-94edd59b.us-west-2.amazon.com (Postfix) with ESMTPS id 7F307421C1;
        Wed, 21 Dec 2022 20:51:44 +0000 (UTC)
Received: from EX19D019EUA002.ant.amazon.com (10.252.50.84) by
 EX13D49EUA002.ant.amazon.com (10.43.165.30) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Wed, 21 Dec 2022 20:51:43 +0000
Received: from dev-dsk-hhhawa-1b-84e0d7ff.eu-west-1.amazon.com (10.43.162.134)
 by EX19D019EUA002.ant.amazon.com (10.252.50.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.20; Wed, 21 Dec 2022 20:51:38 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <wsa@kernel.org>, <linus.walleij@linaro.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <farbere@amazon.com>, <itamark@amazon.com>, <hhhawa@amazon.com>,
        "kernel test robot" <lkp@intel.com>
Subject: [PATCH v4 0/2] i2c: Set i2c pinctrl recovery info from it's device pinctrl
Date:   Wed, 21 Dec 2022 20:51:14 +0000
Message-ID: <20221221205116.73941-1-hhhawa@amazon.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.162.134]
X-ClientProxiedBy: EX13D28UWC004.ant.amazon.com (10.43.162.24) To
 EX19D019EUA002.ant.amazon.com (10.252.50.84)
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series include two changes:
1. Adding new API to get the device pinctrl information when it's
initialized before device probed.
2. Make the i2c init recovery to get the device pins if it's not
initialized by the driver from the device pins.

Change Log v3->v4:
- Split the change into 2 commits
- Add cover letter and remove change log from commit message
- Fix compilation failure when CONFIG_PINCTRL is not defined
Reported-by: kernel test robot <lkp@intel.com>

Change Log v2->v3:
- Add API to get the device pinctrl
- Make the i2c init recovery to get the device pins

Change Log v1->v2:
- set the rinfo->pinctrl to dev->pins->p instead calling
  devm_pinctrl_get()

Hanna Hawa (2):
  pinctrl: Add an API to get the pinctrl pins if initialized
  i2c: Set i2c pinctrl recovery info from it's device pinctrl

 drivers/i2c/i2c-core-base.c     |  6 +++++-
 include/linux/pinctrl/devinfo.h | 14 ++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

-- 
2.38.1

