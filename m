Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1304A678F94
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 06:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbjAXFE7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 00:04:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232433AbjAXFEz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 00:04:55 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4595F31E1C;
        Mon, 23 Jan 2023 21:04:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8XTvsLAIIkEH1PUAEja9YNtV0jL57u1nzntVplBb7xnqReJF85NXOLs0fMHzoh9LcVIAqx7w4vsBM5YTnFM6Nf3w8VNGvg9Z4GW68M52e57XFqbozCd0h17pk3GC/bL0JGf4Q+wXcGHPSpnUukCJrhRHnbn3NQmHv8Jr80GZbHYgAudOtGYGQBgyz10Slv7NmdJU4vTGXbh6iVB6t20/dRi2kZIT/XSHjgRpktWF+JfwISHOcjlOzws2PoBQn+4m/7RlbOU6y2vy4y8sk0h95tW2OWKYhdP147Z9Jx8QC/TaP5E5Phu+Q3brbWsOEtHa1o6v1R6Wx3QSb8gkXY85w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZbBlcZ78fHrLZsu21hTHQIrudhTlxDAEyjpwkZaMd4=;
 b=CncxGlI8cSi3sNZPKjqTB5zA2e1spxuff89PgB+bumgXHv9/OSnTDvjL7H30Vu0oHhtKaTbleDzgZPpJc00o8aMDAGqV8kWPJgjL6d7mgnFBFAMDJq+21O+OiSaOauclbmy05iN7oVVBVdmiowuP9jNOf99VlZRf+FNBAPwd71RTBJzJHFfcxHgGnRtqRd9rHxkBekfJcbBxAqaPLFNLBWa9U+KT/oG9EvhDXp9xxaCd/00Mn3+aIFZngpClZ8kEkjyncQLu0xdZn4DiYUAJwh4ckwXIBe1hkYq/55ksBXupKyvqE6IacgK6ee6qb4hhLB54NOrO+IDPryMWGpHFTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZbBlcZ78fHrLZsu21hTHQIrudhTlxDAEyjpwkZaMd4=;
 b=neHz4RdaWWmzLsvCLYM04ZBbMm26VVMgC4PuKh3hcwZkSJSz4fN6I/RkQSTbVNBww1+Ch4wnNH8dQwD5N7/mmr1WK2iaaAzOendmta/1JkLZhIen8RyOsOniY7JL7fh1nthgGfIc+bXvNb5kb4quHn+Bsq0xxI8LHqhF8rBOILM=
Received: from DM6PR02CA0117.namprd02.prod.outlook.com (2603:10b6:5:1b4::19)
 by SA0PR02MB7276.namprd02.prod.outlook.com (2603:10b6:806:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 05:04:48 +0000
Received: from DM3NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::fe) by DM6PR02CA0117.outlook.office365.com
 (2603:10b6:5:1b4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 05:04:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT036.mail.protection.outlook.com (10.13.5.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Tue, 24 Jan 2023 05:04:48 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 23 Jan 2023 21:04:46 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 21:04:46 -0800
Envelope-to: git@amd.com,
 manikanta.guntupalli@amd.com,
 michal.simek@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 manion05gk@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.3] (port=57518 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pKBUD-0002dY-PO; Mon, 23 Jan 2023 21:04:46 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id 01BF9105510; Tue, 24 Jan 2023 10:34:44 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <git@amd.com>, <manikanta.guntupalli@amd.com>,
        <srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
        <manion05gk@gmail.com>
Subject: [PATCH V3 0/9] Added Standard mode and SMBus support.
Date:   Tue, 24 Jan 2023 10:34:33 +0530
Message-ID: <1674536682-25278-1-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3NAM02FT036:EE_|SA0PR02MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: 292da4eb-35bf-49b6-a0c8-08dafdc884b4
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 40G68O9ot+AstyEcPo70SI7E+C9bsK26OxBUDpj4aOpH/4MsxFtDSZd33gwDebrCuV74Jo7rmt6z/2nAy1hVpqT8olWR8xAk37RWYqUrxSNpjQBIBqNKuCM4KQNobikfSKsbDXSQJtewzudEQJRWXK+iEICbtAFwG6rJr7qZQxucDfpVEHE8Akf9DF7zUVWPjHRWzBfHzct4b7fark3uZVSuJya0flI37/ptI26Y27brpQYJ1GKD13ocpkhryjXzwrjPk/ufgwNBip6KnVah3V5qEclCY7uwhKRrBVENat7wraGXDwpkH/c9pa4bE2T9qEW5Lc0hlCBAQ1O5FbXxUHlYua1cFYvNZNIZYzIk+MX4kRi7zgNFNVn0kZStQVvR+j/yNETQ7sr5iPuvFqyDti4k+/+gIggqHVa0+2pbkvVrkg0U9UfcsXle4F7hI0Rh1/whexerEmw6PFiCCNUFLXJFx+lOGLR4Zbzo4fwFgD/6zI4bjFA0bR/maecI4pf+w9k75zDa1CPoeWsI6a8t8fxFxzyEMCO3i0lmj7AlkiZP0DfCGkYOm9XcKh2hcsb9LU42aKVcCsaLVDQAKXMfUzKmhrM5PeRxfRyFWyPUqj0CAbQ8nYBtsUBRat34fXjD10uEL1eEQXvQdoTlQeDlLSaquN1TX0MyOyBkjbM6Tu41wDnTvYRNDKs1okURm7VK9RgeKUR3Ecc57dWmR54OzwjQNfnHhJJvSbewRiEUXknw3QakNy9TeaOmsiD1bvxZjRGPQFYs0NO1pxfSdfKrBzDzLEbbypt598PjntjMsJI=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199015)(40470700004)(46966006)(36840700001)(478600001)(2616005)(47076005)(4326008)(8676002)(26005)(186003)(966005)(70206006)(42882007)(336012)(316002)(70586007)(6266002)(83380400001)(41300700001)(8936002)(44832011)(5660300002)(2906002)(110136005)(82740400003)(7636003)(36860700001)(83170400001)(356005)(82310400005)(42186006)(54906003)(6666004)(40460700003)(36756003)(40480700001)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 05:04:48.7125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 292da4eb-35bf-49b6-a0c8-08dafdc884b4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT036.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7276
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

-Added standard mode for AXI I2C controller.
-Added Smbus block read support to xiic driver.
-Added 'xlnx,axi-iic-2.1' new IP version support.
-Added dynamic SCL frequency configuration support.
-Removed 'local_irq_save/restore' calls as discussed
 here: https://www.spinics.net/lists/linux-i2c/msg46483.html.

Raviteja Narayanam (9):
  i2c: xiic: Add standard mode support for > 255 byte
  i2c: xiic: Fix Rx and Tx paths in standard mode
  i2c: xiic: Switch to Xiic standard mode for i2c-read
  i2c: xiic: Add wait for FIFO empty in send_tx
  i2c: xiic: Add smbus_block_read functionality
  i2c: xiic: Remove interrupt enable/disable in Rx path
  dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to
  i2c: xiic: Update compatible with new IP version
  i2c: xiic: Add SCL frequency configuration support
---
Changes for V2:
Updated in changelog of respective patch
Changes for V3:
Acked-by michal

 .../bindings/i2c/xlnx,xps-iic-2.00.a.yaml     |   7 +-
 drivers/i2c/busses/i2c-xiic.c                 | 582 ++++++++++++++++--
 2 files changed, 537 insertions(+), 52 deletions(-)

-- 
2.25.1

