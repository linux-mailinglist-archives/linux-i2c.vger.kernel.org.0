Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97A35766C59
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jul 2023 14:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236397AbjG1MBA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jul 2023 08:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236376AbjG1MAw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jul 2023 08:00:52 -0400
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B017944A7;
        Fri, 28 Jul 2023 05:00:28 -0700 (PDT)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36SA5ddm031660;
        Fri, 28 Jul 2023 05:00:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=pfpt0220; bh=d5I9J156HBIlxGsqZmnyiuxD6MjQAVnXpmBg83P5FMI=;
 b=jL14C8S2MXP3oaY5xj9w8PMXqiazmz+7FeVlrDU7aK+j6NlBSVIyl4NX+o8nw563vKpG
 wjAmUWuECvafV5rsOt3Em1ZhCd/rh6o3HCOjDTRJf6CKLbxC1AAuafd/Ut8s+lcg88l4
 k98hMBJHu7f0PlkP0XidiWaKEU8R9xEKtWH9hNQyXImigLvxYaSEtlm8OzCA2dMEPCSu
 nbetUtjGqH4gEK0xSsBvaMBI/pgg228/LitEE+wLdQyL84EIbtnFJbA8lm9IF4Hct15X
 WrFBhvKcigyp7EDmh9ULPevkil4sFH26GtLxWheQKma+ZXXn32VngYaLlq3QDET5s9OX ug== 
Received: from dc5-exch02.marvell.com ([199.233.59.182])
        by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3s389rxam4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Fri, 28 Jul 2023 05:00:24 -0700
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 28 Jul
 2023 05:00:09 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Fri, 28 Jul 2023 05:00:09 -0700
Received: from localhost.localdomain (unknown [10.110.150.250])
        by maili.marvell.com (Postfix) with ESMTP id 40F033F7055;
        Fri, 28 Jul 2023 05:00:09 -0700 (PDT)
From:   Piyush Malgujar <pmalgujar@marvell.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andi.shyti@kernel.org>, <rric@kernel.org>
CC:     <cchavva@marvell.com>, <sgarapati@marvell.com>,
        <jannadurai@marvell.com>, Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v2 0/4] i2c: thunderx: Marvell thunderx i2c changes
Date:   Fri, 28 Jul 2023 05:00:00 -0700
Message-ID: <20230728120004.19680-1-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: I8LXcE0KbYPFx4H5yLEMO7NjEkBB8oPX
X-Proofpoint-GUID: I8LXcE0KbYPFx4H5yLEMO7NjEkBB8oPX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The changes are for Marvell OcteonTX2 SOC family:

- Handling clock divisor logic using subsytem ID
- Support for high speed mode
- Handle watchdog timeout
- Added ioclk support

Changes since V1:
- Addressed comments, added defines as required
- Removed unnecessary code
- Added a patch to support ioclk if sclk not present in ACPI table

Piyush Malgujar (1):
  i2c: thunderx: Adding ioclk support

Suneel Garapati (3):
  i2c: thunderx: Clock divisor logic changes
  i2c: thunderx: Add support for High speed mode
  i2c: octeon: Handle watchdog timeout

 drivers/i2c/busses/i2c-octeon-core.c     | 96 ++++++++++++++++++------
 drivers/i2c/busses/i2c-octeon-core.h     | 27 +++++++
 drivers/i2c/busses/i2c-thunderx-pcidrv.c | 23 ++++--
 3 files changed, 115 insertions(+), 31 deletions(-)

-- 
2.17.1

