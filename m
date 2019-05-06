Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA581503C
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 17:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfEFP3g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 11:29:36 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:53899 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725994AbfEFP3g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 May 2019 11:29:36 -0400
Received: from Internal Mail-Server by MTLPINE2 (envelope-from asmaa@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 6 May 2019 18:29:34 +0300
Received: from farm-1.mtbu.labs.mlnx (farm-1.mtbu.labs.mlnx [10.15.2.31])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id x46FTWJm030965;
        Mon, 6 May 2019 11:29:32 -0400
Received: (from asmaa@localhost)
        by farm-1.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id x46FTVgX025135;
        Mon, 6 May 2019 11:29:31 -0400
From:   Asmaa Mnebhi <Asmaa@mellanox.com>
To:     minyard@acm.org, wsa@the-dreams.de, vadimp@mellanox.com,
        michaelsh@mellanox.com
Cc:     Asmaa Mnebhi <Asmaa@mellanox.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH v7 0/1] Add support for IPMB driver
Date:   Mon,  6 May 2019 11:29:28 -0400
Message-Id: <cover.1557156354.git.Asmaa@mellanox.com>
X-Mailer: git-send-email 2.1.2
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Vadim,

I have addressed your comments:
1) removed typecasting and replaced it with a macro to get the 8 bit
address. I think it is more readable this way.
2) added space

Thank you for your feedback!

Asmaa Mnebhi (1):
  Add support for IPMB driver

 Documentation/IPMB.txt           | 103 ++++++++++
 drivers/char/ipmi/Kconfig        |   8 +
 drivers/char/ipmi/Makefile       |   1 +
 drivers/char/ipmi/ipmb_dev_int.c | 399 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 511 insertions(+)
 create mode 100644 Documentation/IPMB.txt
 create mode 100644 drivers/char/ipmi/ipmb_dev_int.c

-- 
2.1.2

