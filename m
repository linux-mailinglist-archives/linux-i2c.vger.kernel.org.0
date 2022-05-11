Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF6B523463
	for <lists+linux-i2c@lfdr.de>; Wed, 11 May 2022 15:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243174AbiEKNh1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 May 2022 09:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243888AbiEKNh0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 May 2022 09:37:26 -0400
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80A5A666BD;
        Wed, 11 May 2022 06:37:24 -0700 (PDT)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24B9kBLM020873;
        Wed, 11 May 2022 06:37:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=pfpt0220;
 bh=Cuxao/Cs7zjSSejDLbRlnXlWLx6Anw6Uo7EA8Lvp4rA=;
 b=PHTO4bLNCMkFm+hWrtWinA0x53gB2NgUzNY8/1L3HOiS/vmmI0Ea6FfEmQqYlyiAI1qe
 APRnZvwtOnm9vDCYpxkXUtP9UIJ/b/tNQlXtrpdQ5oeeobo5aZIBpLClYvyZKv6ovAIj
 T7rbijZeKayDIyVgbM6ZE3g3kUdfNZZOTfKdE4MZeLT/Vk2nODut6ZZbtAHwdTposHJe
 rjPiK7K9bNJN7jeb4utNZ8Nao7fc2ncYPWOrvnj6r+SjC6miSGkzwInkZduewxhULSVl
 wzwH4pGGvJ3hW+nfIfnCifUeLYyL6JmxQL1irtGEI1S+zU7PMsDlJ04aozonJFduUTRE JQ== 
Received: from dc5-exch01.marvell.com ([199.233.59.181])
        by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3g0at20uaf-3
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 11 May 2022 06:37:22 -0700
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 11 May
 2022 06:37:20 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 May 2022 06:37:20 -0700
Received: from localhost.localdomain (unknown [10.110.150.250])
        by maili.marvell.com (Postfix) with ESMTP id 540A63F7095;
        Wed, 11 May 2022 06:37:20 -0700 (PDT)
From:   Piyush Malgujar <pmalgujar@marvell.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <sgarapati@marvell.com>, <sbalcerak@marvell.com>,
        <cchavva@marvell.com>, Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH 3/3] drivers: i2c: thunderx: Allow driver to work with ACPI defined TWSI controllers
Date:   Wed, 11 May 2022 06:36:59 -0700
Message-ID: <20220511133659.29176-4-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220511133659.29176-1-pmalgujar@marvell.com>
References: <20220511133659.29176-1-pmalgujar@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: J1j3R9mGARKXaQ6nv0-gWUftY3zAhRvZ
X-Proofpoint-GUID: J1j3R9mGARKXaQ6nv0-gWUftY3zAhRvZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_05,2022-05-11_01,2022-02-23_01
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Due to i2c->adap.dev.fwnode not being set, ACPI_COMPANION() wasn't properly
found for TWSI controllers.

Signed-off-by: Szymon Balcerak <sbalcerak@marvell.com>
Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
---
 drivers/i2c/busses/i2c-thunderx-pcidrv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
index 5621e983406b0bebf9c5c9e30921e45f3f15909b..3dd5a4d798f99e9b5282360cf9d5840042fc8dcc 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -220,6 +220,7 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 	i2c->adap.bus_recovery_info = &octeon_i2c_recovery_info;
 	i2c->adap.dev.parent = dev;
 	i2c->adap.dev.of_node = pdev->dev.of_node;
+	i2c->adap.dev.fwnode = dev->fwnode;
 	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
 		 "Cavium ThunderX i2c adapter at %s", dev_name(dev));
 	i2c_set_adapdata(&i2c->adap, i2c);
-- 
2.17.1

