Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22A33B4DFC
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jun 2021 12:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbhFZKau (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Jun 2021 06:30:50 -0400
Received: from mail-dm3nam07on2059.outbound.protection.outlook.com ([40.107.95.59]:27634
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229954AbhFZKat (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 26 Jun 2021 06:30:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfFb6hHM0yglp31unbCalWdjI3N+WWKTvRCOzQZMaMYgK8ZrZX5R6ymGx8/wA55b0fiI9vdAkpMF7UohGeLjPnvU3P8TSNLRaBTq6iuFtoo4JePGwmGvsqFeV79yBbFPeKXtlgViUl7cQiP16VkxhxspDwUZ7Pprj31L0HNQjQi4GD/rqYF0ibrli2rjZxSrX7i62LE29pqEJtNPZ/Cf/vpuQjMLIMj6e7iugCcjtx9fh24X30498vIqbMoWJ8iak4H1GxarxRjPct9l2TfhlNTC2hzoS9DPAStAfrtcyWe673EFr2hQxFM0j36J0jw3NnCh6Q2JzbPSH5L7jBvPgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgluNwHllGv4JdEQzRaEe4Pe1W+OyCZa71hijzXAeLc=;
 b=PwOCa1ZJSv6ZMbxXw89AVR991Su/Y0A5hDa76oWJsxRNJNT72tTN8HuXNR20UtPGYYG5oy/9DUnM9tgKwfJSGAiMC8cZNTA16GDx5tqBBlueyIPorgfnI+OOyElk+Fq5Jfd8URvKsEXBKB3LqkpznFyzhWWEq0CFhoohU1mXnEeWEjfzJgwsdN+ksCYJAVQnuixkxbgV8GjkcrHzAFE5HNOVUqc1+uso3AQP/hEKN54gyEjYRDty+gjo/G/3PvTwS7gEyu8DKrl0ci+HCvKEihFZSzsCzE90WteDIpU7zg40fRX6fzYHIK8xKzAt3sxYBWDFAqmQWPfR6V9A1rmQKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgluNwHllGv4JdEQzRaEe4Pe1W+OyCZa71hijzXAeLc=;
 b=L+EbQkNfoKuBw58mJdyqKjzyyUCpesc6IVuq0D8VD3o2AXeohBvtmya8i0Fcl7VO1iXHJpuUX4I6mOUa+i4yL4KvFnW9R3uBoWpE1qFczq7qhO5Qpw3R4fXTlTO3uQxNz84IuMkRxpFLqI/NF/Z42/Ie9HWKRkGwpLY8NTi+hlw=
Received: from SN4PR0701CA0018.namprd07.prod.outlook.com
 (2603:10b6:803:28::28) by BYAPR02MB5398.namprd02.prod.outlook.com
 (2603:10b6:a03:99::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Sat, 26 Jun
 2021 10:28:25 +0000
Received: from SN1NAM02FT0064.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:28:cafe::d9) by SN4PR0701CA0018.outlook.office365.com
 (2603:10b6:803:28::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Sat, 26 Jun 2021 10:28:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0064.mail.protection.outlook.com (10.97.4.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Sat, 26 Jun 2021 10:28:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 26 Jun 2021 03:28:13 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sat, 26 Jun 2021 03:28:13 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de,
 joe@perches.com
Received: from [10.140.6.6] (port=55646 helo=xhdappanad40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lx5Xn-000AWJ-Lm; Sat, 26 Jun 2021 03:28:12 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        <joe@perches.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH v2 00/10] i2c: xiic: Add features, bug fixes.
Date:   Sat, 26 Jun 2021 15:57:56 +0530
Message-ID: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 531a2072-7437-43f1-e3e2-08d9388d21b3
X-MS-TrafficTypeDiagnostic: BYAPR02MB5398:
X-Microsoft-Antispam-PRVS: <BYAPR02MB53985BE2342E86245D014195CA059@BYAPR02MB5398.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +v3TK5/q3+k+vHzW8oOaI8h8RUUptm6UA8vPQO2oqdg+wrqzRS91TrZ9TJL+Fj7+LojSml76IPsqaV37lrbM7URXl3/vSSkOVATfXXr70dvYkxfEBTQWVQRZnHX/hTFJbEFTDvSJzrU19S5b7oso7VpmftANM5u7zgEI7AULEj5v3umN3iT2KakYsQgYbOD2o20AD7dfAM0PNFfqVd+NLp59sPdX7/6YNnbIwGWwEjLUnNV5DwsDhJx6VRmnIDY+skj3KITIhdrxepblOkW5P4gs2/9cepIrfr/5HvZqgIsANZzNzffLnZoGiXYCIhMBCnbeugJ+JsMGHpcqHeKM+G87SNIQWsNsnH3RBeFp8OQ6lXO2ujRbD+0noWSYq/QKadC60uCN3ordW8veqkrXanrPR55SVztyzRbZJhfHzPTAGEZIOw0XOcbw8L756ppSvpsISVRzLFvTgYvSwwuJ4ufPzgSJBXCcnprCjBApPdqUbPfgsDJBSUzxQcHfcx8mAucQ2Py2iyEaOW25gKdViqd1nNpQuSPYHRGjFvwEYWjLpeORlBrsMkD7xjgaxWxBzcsfG3fP8Nu2hz9bzwgDIJr78GdxzQg14529ED/+1Otw39jx9jqDKkwijTHpE5nJoTddq8NhICwVnORDBp1M0MLEA2rr/7jL8YYy/UBihpbltToIlgaT6tBKEgRawxaKJ/6+bY5FGvp8NdodoqKsQtGoyWFb80rBKRAxOVB0D0dah5JtRb/4Bi5RDG/Ckt1uuJg3BFiUgY2nXlAyDIAAzVlKJ/BasGiMLWDwGuLD+5asdEcRTI8GvdQ/DscJAFEE
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(46966006)(36840700001)(316002)(6666004)(54906003)(36906005)(110136005)(478600001)(4326008)(6636002)(83380400001)(70206006)(36860700001)(2906002)(26005)(2616005)(186003)(70586007)(966005)(47076005)(36756003)(9786002)(8676002)(107886003)(1076003)(8936002)(426003)(7696005)(356005)(5660300002)(82740400003)(336012)(82310400003)(44832011)(7636003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2021 10:28:25.5807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 531a2072-7437-43f1-e3e2-08d9388d21b3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0064.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5398
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

-Add 'standard mode' feature for reads > 255 bytes.
-Add 'smbus block read' functionality.
-Add 'xlnx,axi-iic-2.1' new IP version support.
-Switch to 'AXI I2C standard mode' for i2c reads in affected IP versions.
-Remove 'local_irq_save/restore' calls as discussed here: https://www.spinics.net/lists/linux-i2c/msg46483.html.
-Some trivial fixes.

Changes in v2:
-Grouped the commits as fixes first and then features. 
-The first 4 commits fix the dynamic mode broken feature.
-Corrected the indentation in coding style issues.

Michal Simek (1):
  i2c: xiic: Fix coding style issues

Raviteja Narayanam (7):
  i2c: xiic: Fix Tx Interrupt path for grouped messages
  i2c: xiic: Add standard mode support for > 255 byte read transfers
  i2c: xiic: Switch to Xiic standard mode for i2c-read
  i2c: xiic: Remove interrupt enable/disable in Rx path
  dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to compatible
  i2c: xiic: Update compatible with new IP version
  i2c: xiic: Add smbus_block_read functionality

Shubhrajyoti Datta (2):
  i2c: xiic: Return value of xiic_reinit
  i2c: xiic: Fix the type check for xiic_wakeup

 .../bindings/i2c/xlnx,xps-iic-2.00.a.yaml     |   4 +-
 drivers/i2c/busses/i2c-xiic.c                 | 593 ++++++++++++++----
 2 files changed, 487 insertions(+), 110 deletions(-)

-- 
2.25.1

