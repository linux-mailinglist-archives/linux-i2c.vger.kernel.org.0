Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB64350830E
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Apr 2022 10:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376591AbiDTICX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Apr 2022 04:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376590AbiDTICR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Apr 2022 04:02:17 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam08on2064.outbound.protection.outlook.com [40.107.102.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C6A8625E
        for <linux-i2c@vger.kernel.org>; Wed, 20 Apr 2022 00:59:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzZscDYspNrMqPSmXM10u/qRwRWLM2tAbDtGdIkRCZNLKx+PuCMW0/L8y4i9826wgtu1G8BIYkIVbeTE+IvIihI0CmBza9PEfh7A7Hh94ajKIhdi6JIpvwlLKVoEz1YZ4tVKyg0yxJeg3WvfjJOpUrkeV7roBk038+QmuH4/vtQQsmSRAeNsU4dNY7shTxEu0+I2/CNeEPl7Up2K32jLe6rZytvMJhItmVAXKuSOrCgyUGAe+bn5OqbTRIJJYjlv+zfe7zOOfRycfRTrJSMoUsWc3qB5fix0bNAKiV2yDyzL7u4sjcp4TIBmwM7ShjISgQ4h1MsP5b8yleoQxO/X4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZMcNAglV1kVbqR+YU2MwC5DfgSeB+Hrd0dz5Q/5tQ8=;
 b=f4fYPE2j9OaQl3b3BLFWDh3Ex/sE9yKFMDCqaCV042MrNsIcY9BVO5pI82qIr/uk0fW8RZeomzl1AphWDzg4Tq3Gv7oXYOya2CljW8pwpGlVneWMPBBjhYgWA/dBE9a1o2D0G7/kwpKR/DOT2I0SvKyfqeKS49bdVj8gEIUeIODm8Jah8Fox45HPF6gA3xmO4xnf5OPJ6bDRUnvAYmwQ/O4j2OWGNfFjxNuwvf7YVt65C09ejXh8eTZSn79MerV5jzqXFIDjjxRyhnOtIzpuLMOPLpdo0Y1Z78Q4KyT4XpXn4D7MZH7e41d8PHBKOzx9bUOdj53pgaw8jgFPl66mmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZMcNAglV1kVbqR+YU2MwC5DfgSeB+Hrd0dz5Q/5tQ8=;
 b=g0ygdCViHut3XlqOoaBIpgvwC7PJ+7xNmaZSAbS8+kbY3rJl0i75UABxpETBJjgc/XBv1dcRxFpL6ngSuU45UAWQgw/f1uFBH5+mSeJZNgHFPDEeVs3bjDixQ3drium6bujVwlcVkh0zXiHhJdiOCXdOpv3m1228Qm2l3tCYR4E=
Received: from SN7PR04CA0061.namprd04.prod.outlook.com (2603:10b6:806:121::6)
 by BN6PR02MB2404.namprd02.prod.outlook.com (2603:10b6:404:2b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 07:59:29 +0000
Received: from SN1NAM02FT0057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:121:cafe::8e) by SN7PR04CA0061.outlook.office365.com
 (2603:10b6:806:121::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Wed, 20 Apr 2022 07:59:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0057.mail.protection.outlook.com (10.97.4.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Wed, 20 Apr 2022 07:59:29 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 20 Apr 2022 00:59:27 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 20 Apr 2022 00:59:27 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org
Received: from [10.140.6.59] (port=54328 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1nh5FH-0006KN-D4; Wed, 20 Apr 2022 00:59:27 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 0/4] i2c: xiic: misc fixes
Date:   Wed, 20 Apr 2022 13:29:20 +0530
Message-ID: <20220420075924.14546-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0431386-a7e1-466f-7466-08da22a3b264
X-MS-TrafficTypeDiagnostic: BN6PR02MB2404:EE_
X-Microsoft-Antispam-PRVS: <BN6PR02MB24041F13B4D66B4FF2EF137AAAF59@BN6PR02MB2404.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Y4zE+DrDSKsLQvE0mzJ0nBL2pcQTnQAvQmTCOJ2GJ+tiUSIERwbOVUTo6bnqnE9sIifgrCMYYJMpvbfz/Py1XZYxxO8Hy0+NvSmbzMezxWSKrVtk12nHnAqcWe4rTdXQlxnLIKfG0oWu23Xm9b5fmm6hrvXNnImihyLyMhMxhdDGkceCKDTWntbAW+sU3mmlTqf9hpbsqpkkxD6XhWQodSoMp/M+uxaHkrT72/fcO87usPwGhU1RVTkb/5+YKqugKK8P+UDUfvT9TyudrlWAzNCcP0+cod7n8l2MGL84nD7Dhh0W8hn1IokFCt2TmdS35zvItFh2Wgh2KEgPI4PYbL+A4ZOdFwmvRiusn9wHYvQDgxvluMYWpWN/tktFrBHmLAZ6f5708AJXjeuFVuhAyopIBb/35fVndZQg6g+xpeMiEmPKDUHZhnUGId8D8Fu9AW4sAiz5dLkgXNOqmHA2TRQGk3F1+IKLb0GUOSlMBIDCAAhICzPjGSJoTXgc5vjP4z2w5F4FJnKiabGyFd+BwLmYKE6IujtHP/Mq8i95XeQv/FF6WtwizSpY8MFaQYIElMZFc0iVXjdGE7/36REWazn+TWRncruFj1tujsF+XOsOpS19FDGMJOmQtlxfqjKl5ZTSzutEeHxCgVLQhP0trM1yWxw3SqfkSdx8bN5kNc3TRwdTu0ZzBzYEE+UhxjQlegiEcMusICf4rVb7p+S2A==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36860700001)(336012)(1076003)(186003)(426003)(2616005)(70586007)(7636003)(356005)(70206006)(83380400001)(47076005)(107886003)(40460700003)(4326008)(26005)(5660300002)(9786002)(8936002)(6666004)(7696005)(54906003)(6916009)(316002)(2906002)(36756003)(508600001)(82310400005)(8676002)(44832011)(4744005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 07:59:29.3506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0431386-a7e1-466f-7466-08da22a3b264
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2404
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix the coding style issues.
Fix the interrupt path for grouped messages.

Michal Simek (1):
  i2c: xiic: Fix coding style issues

Raviteja Narayanam (1):
  i2c: xiic: Fix Tx Interrupt path for grouped messages

Shubhrajyoti Datta (2):
  i2c-xiic: return value of xiic_reinit
  i2c: xiic: Correct the datatype for rx_watermark

 drivers/i2c/busses/i2c-xiic.c | 82 +++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 37 deletions(-)

-- 
2.17.1

