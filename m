Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECFD57F39
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2019 11:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbfF0JYb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jun 2019 05:24:31 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:4016 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726506AbfF0JYa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jun 2019 05:24:30 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5R9JbXB012626;
        Thu, 27 Jun 2019 04:24:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=uI0jWr4XrDzI8THF1uadsSVBLz7Uz/eY/SWYvWO68OU=;
 b=m87Zyt+NEfr89XHAbS7qUrm24jlVSvtEVDgLka6YTnj5aWp8H2LxUULmJqwoAgAqS85i
 IXk2vkvTQkCDLmd/+5JxTB5NVALsHQOf4dR/f0XdLLDBe8As+88jdfvL9+0/bqIsaHmU
 DAGChnGyBphprlLB6nmVU4T0T0fUlvLJJtjS/IULRbmDfKRuEKJh8IKjeqom2u30nFt4
 h5x8oAlmaaqmWqE5/evAnsEatBnI6/3qnh74tZ6QBMgOpWz1BSSGocYuQwtfdFUfid4W
 1UWA9tuOYGHeY3enHfqYT329AEym5JuTwwOF4t3VzZy69KBgHos/bOQH4TPsm+27P+Ze Rg== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail3.cirrus.com ([87.246.76.56])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t9hr2gr51-1;
        Thu, 27 Jun 2019 04:24:13 -0500
Received: from EDIEX02.ad.cirrus.com (ediex02.ad.cirrus.com [198.61.84.81])
        by mail3.cirrus.com (Postfix) with ESMTP id CD23A6144B2A;
        Thu, 27 Jun 2019 04:25:00 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 27 Jun
 2019 10:24:11 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 27 Jun 2019 10:24:11 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D366E45;
        Thu, 27 Jun 2019 10:24:11 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v8 0/6] I2C IRQ Probe Improvements
Date:   Thu, 27 Jun 2019 10:24:05 +0100
Message-ID: <20190627092411.26123-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=950 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906270109
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series attempts to align as much IRQ handling into the
probe path as possible. Note that I don't have a great setup
for testing these patches so they are mostly just build tested
and need careful review and testing before any of them are
merged.

The series brings the ACPI path inline with the way the device
tree path handles the IRQ entirely at probe time. However,
it still leaves any IRQ specified through the board_info as
being handled at device time. In that case we need to cache
something from the board_info until probe time, which leaves
any alternative solution with something basically the same as
the current handling although perhaps caching more stuff.

Thanks,
Charles

See previous discussions:
 - https://lkml.org/lkml/2019/2/15/989
 - https://www.spinics.net/lists/linux-i2c/msg39541.html

Charles Keepax (6):
  i2c: core: Allow whole core to use i2c_dev_irq_from_resources
  i2c: acpi: Use available IRQ helper functions
  i2c: acpi: Factor out getting the IRQ from ACPI
  i2c: core: Move ACPI IRQ handling to probe time
  i2c: core: Move ACPI gpio IRQ handling into i2c_acpi_get_irq
  i2c: core: Tidy up handling of init_irq

 drivers/i2c/i2c-core-acpi.c | 58 ++++++++++++++++++++++++++++++++-------------
 drivers/i2c/i2c-core-base.c | 11 +++++----
 drivers/i2c/i2c-core.h      |  9 +++++++
 3 files changed, 56 insertions(+), 22 deletions(-)

-- 
2.11.0

