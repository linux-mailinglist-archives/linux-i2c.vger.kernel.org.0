Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 028444CEDD
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 15:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbfFTNe7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 09:34:59 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:5868 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726562AbfFTNe7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jun 2019 09:34:59 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5KDYLFw022021;
        Thu, 20 Jun 2019 08:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=lTma+isYmZ86XvEFPQ4p1OK4O8R26zPHPYXD3Zj9zxQ=;
 b=hva258S0GWbBOIZp5KNgwXIUvCQWFxWrPf+Vp2RCEpVFmizBreL8hIsZh3XjUJjRUs1y
 nyxEWGs9HSST7neF2/+udscaLpVBDidL+Hw700ron4Efr0wA7YQXb7SXHxeOWwfbcKdE
 o3kvT4223uBtlTplkji5GWSCz+m1jhajsivI+W0upLZojFSU5j8coXh+9wXG3p0wzEOH
 7pHnVXMy4uB81NTMQOWX5K5LVSpY3VYL/x8GWQWaV/Z+MFI4Dv3nvmSLbEub+ghHRBGU
 ySZl35fIfWDTLs3kPok1UhACuX6ARTl6ZOUVJuVNx3dxsG9FBOe1I07Pk6bQuJ4co0rD qQ== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t780gjqht-1;
        Thu, 20 Jun 2019 08:34:21 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
        by mail1.cirrus.com (Postfix) with ESMTP id F2BB3611C8C7;
        Thu, 20 Jun 2019 08:34:20 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 20 Jun
 2019 14:34:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 20 Jun 2019 14:34:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 51E7445;
        Thu, 20 Jun 2019 14:34:20 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v5 0/7] I2C IRQ Probe Improvements
Date:   Thu, 20 Jun 2019 14:34:13 +0100
Message-ID: <20190620133420.4632-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=936 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906200102
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

Charles Keepax (7):
  i2c: core: Allow whole core to use i2c_dev_irq_from_resources
  i2c: acpi: Use available IRQ helper functions
  i2c: acpi: Factor out getting the IRQ from ACPI
  i2c: core: Make i2c_acpi_get_irq available to the rest of the I2C core
  i2c: core: Move ACPI IRQ handling to probe time
  i2c: core: Move ACPI gpio IRQ handling into i2c_acpi_get_irq
  i2c: core: Tidy up handling of init_irq

 drivers/i2c/i2c-core-acpi.c | 57 +++++++++++++++++++++++++++++++--------------
 drivers/i2c/i2c-core-base.c | 11 +++++----
 drivers/i2c/i2c-core.h      | 11 +++++++++
 3 files changed, 57 insertions(+), 22 deletions(-)

-- 
2.11.0

