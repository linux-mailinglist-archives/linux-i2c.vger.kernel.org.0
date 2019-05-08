Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B75017B37
	for <lists+linux-i2c@lfdr.de>; Wed,  8 May 2019 16:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727733AbfEHOBw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 May 2019 10:01:52 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:50157 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726703AbfEHOBo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 May 2019 10:01:44 -0400
Received: from Internal Mail-Server by MTLPINE2 (envelope-from asmaa@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 8 May 2019 16:46:54 +0300
Received: from farm-1.mtbu.labs.mlnx (farm-1.mtbu.labs.mlnx [10.15.2.31])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id x48Dkqjv008571;
        Wed, 8 May 2019 09:46:52 -0400
Received: (from asmaa@localhost)
        by farm-1.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id x48Dkl1f018446;
        Wed, 8 May 2019 09:46:47 -0400
From:   Asmaa Mnebhi <Asmaa@mellanox.com>
To:     minyard@acm.org, wsa@the-dreams.de, vadimp@mellanox.com,
        michaelsh@mellanox.com, rdunlap@infradead.org
Cc:     Asmaa Mnebhi <Asmaa@mellanox.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH v9 0/1] Add support for IPMB driver
Date:   Wed,  8 May 2019 09:46:43 -0400
Message-Id: <cover.1557322882.git.Asmaa@mellanox.com>
X-Mailer: git-send-email 2.1.2
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Addressed Randy's comments about the documentation.

Those instructions are for any software engineer who wants
to build this driver and load it onto their system.

Thank you.

Asmaa Mnebhi (1):
  Add support for IPMB driver

 Documentation/IPMB.txt           | 103 +++++++++++
 drivers/char/ipmi/Kconfig        |   8 +
 drivers/char/ipmi/Makefile       |   1 +
 drivers/char/ipmi/ipmb_dev_int.c | 382 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 494 insertions(+)
 create mode 100644 Documentation/IPMB.txt
 create mode 100644 drivers/char/ipmi/ipmb_dev_int.c

-- 
2.1.2

