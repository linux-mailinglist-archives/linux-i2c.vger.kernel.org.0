Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 804546D0726
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Mar 2023 15:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbjC3Nnm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Mar 2023 09:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232140AbjC3Nnd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Mar 2023 09:43:33 -0400
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF993B478;
        Thu, 30 Mar 2023 06:43:23 -0700 (PDT)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32UDAlfs014499;
        Thu, 30 Mar 2023 06:43:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=pfpt0220; bh=pb5YbcNoHH+axt8Jf0ON9Yqce8nZG/8Ncik7Xh+7464=;
 b=IjOnVZyASM9puyrwb6k5l/zHapglmZ016trqewTUFDXnSaMwvxfC3mom6d/pDRExSU3k
 THbahhkayKJSTiSkuJZ4d5+H0o2KdD9HgDhVDWufar8LBM5YZnxl2um8T7u/Bb9CI008
 aqS7wUWMXd7kGe453Mg9iZCpRM1vE4avNtFhv34+iRcaz3LCxUTmL+VlrbHm0kOdYeFS
 vUBXzcDObadMh52ayUvGsqQjFlZIRyh6GrOtgB8TNHDf84JpzxsXCKInXQ1zYyhk71HK
 UIako9M7n5Y5ws4YOpWG5WdHZK2wneGQegnyozKMsrJv87YgMavopJYSoryy6whkurcJ Kw== 
Received: from dc5-exch01.marvell.com ([199.233.59.181])
        by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3pn2ty2nw9-10
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 30 Mar 2023 06:43:22 -0700
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 30 Mar
 2023 06:40:10 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Thu, 30 Mar 2023 06:40:10 -0700
Received: from localhost.localdomain (unknown [10.110.150.250])
        by maili.marvell.com (Postfix) with ESMTP id A4E495C68E9;
        Thu, 30 Mar 2023 06:40:10 -0700 (PDT)
From:   Piyush Malgujar <pmalgujar@marvell.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <wsa@kernel.org>, <rric@kernel.org>
CC:     <jannadurai@marvell.com>, <cchavva@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH 0/3] i2c: thunderx: Marvell thunderx i2c changes
Date:   Thu, 30 Mar 2023 06:39:50 -0700
Message-ID: <20230330133953.21074-1-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: MNUgYNyM6yOuFM4MxelWnZRDlYcykyyy
X-Proofpoint-ORIG-GUID: MNUgYNyM6yOuFM4MxelWnZRDlYcykyyy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_09,2023-03-30_03,2023-02-09_01
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The changes are for Marvell OcteonTX2 SOC family:

- Handling clock divisor logic using subsytem ID
- Support for high speed mode
- Handle watchdog timeout

Suneel Garapati (3):
  i2c: thunderx: Clock divisor logic changes
  i2c: thunderx: Add support for High speed mode
  i2c: octeon: Handle watchdog timeout

 drivers/i2c/busses/i2c-octeon-core.c     | 113 +++++++++++++++++------
 drivers/i2c/busses/i2c-octeon-core.h     |  19 ++++
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |   7 ++
 3 files changed, 110 insertions(+), 29 deletions(-)

-- 
2.17.1

