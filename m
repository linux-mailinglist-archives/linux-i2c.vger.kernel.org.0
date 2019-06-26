Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47B1456D0E
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 17:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbfFZPDb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 11:03:31 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:12054 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726157AbfFZPDb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jun 2019 11:03:31 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5QEx8JR031474;
        Wed, 26 Jun 2019 10:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=t95MC3q32p9rAPkXg0ISKU0GoUuWK1qfv3qhH/m8tXU=;
 b=m6V0jnW2XbCeWbBkiaAFgfMtZhaJcoLVFqVqfbyFLEeiy/pf23SwVNz8jmyVJst9vH1M
 J9GAwoXulCJTV3m1e4lxe2LleSWEpRFxjsnI4rWukBfI9n8TtXLaXJs7PabXP4Io+kPW
 98B/+twHRZC2mG1XJQZle9RpZJjGz1oiKBJyVWiGFSwQqgkIR1k+fNO9H/78ZdmBmQlF
 +CqK1eYIU/R7ofyW4DvE1Bqo1xFWy1l0VHUagOdMJp5tQTjwMJWf/dCld11J8USJVDkG
 mJojEGhpW/SNJOmo0/vYniJph1hJanFO65g4DohWTxPwYhQrz/SvcVuS4WKmcbjNUYCr eQ== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail3.cirrus.com ([87.246.76.56])
        by mx0b-001ae601.pphosted.com with ESMTP id 2tc7gt8b77-1;
        Wed, 26 Jun 2019 10:03:03 -0500
Received: from EDIEX02.ad.cirrus.com (ediex02.ad.cirrus.com [198.61.84.81])
        by mail3.cirrus.com (Postfix) with ESMTP id D51676159F99;
        Wed, 26 Jun 2019 10:03:50 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 26 Jun
 2019 16:03:02 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Wed, 26 Jun 2019 16:03:02 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 112CA44;
        Wed, 26 Jun 2019 16:03:02 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v7 0/6] I2C IRQ Probe Improvements
Date:   Wed, 26 Jun 2019 16:02:56 +0100
Message-ID: <20190626150302.22703-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=950 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906260177
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

 drivers/i2c/i2c-core-acpi.c | 59 ++++++++++++++++++++++++++++++++-------------
 drivers/i2c/i2c-core-base.c | 11 +++++----
 drivers/i2c/i2c-core.h      |  9 +++++++
 3 files changed, 57 insertions(+), 22 deletions(-)

-- 
2.11.0

