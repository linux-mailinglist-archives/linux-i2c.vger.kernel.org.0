Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B008755991C
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jun 2022 14:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbiFXMFg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jun 2022 08:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiFXMFf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jun 2022 08:05:35 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2071.outbound.protection.outlook.com [40.107.212.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E807E008;
        Fri, 24 Jun 2022 05:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTcVhIbruJ8vtic26Wbn/5mIxsGDAU4PzDQ03wmiYRvs86diG0JT/DUXnwap/nxjNDgz5rXFTWxgBLvg/+zPi8xw6HanawFZZtrXUInSwqwVkfKML3jRaiHpsNXnFkYiZxuvHghyUFE5P++H3l0E+J5NJA/Omziud1qnJsWI+0v+uW3cHApiylwA7KiYGX47mlIRJ/aHsKGpJuuIatkvr34p5TPURkqw7MNVRIUjiG11DUQ7kITnMZKPEIjidv4zQSf+Qr7js8JsfSVcuj106iuZP3H7WJPz9ixMV+YlN/h00Ei9WLGm2+FtFscXR70iprKj0SqZo8oDdNbM/O4yjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ortc5wGMpqDqKCCPWM2IIH9tQFFUqUhhT+2/q3ELuSQ=;
 b=KEvSYwM+3aSJw64BvSb74ETGHm8jY1Br94dSUTZz7CjJLYWc6MGmMvinVU5VR9Hgq+65huCJQZQvb8Z8LD7G5Kf9x3Rlac5T4ru3pWw3hsQmlRUBZcIXvnk1PvMIJby7kPjqaVv54NrVsCUiT5DYez6lyqUKIZXZyP0v8ypF9zsLn6CRHuiI4QPbi4XpElSTfq5bw/Td9sbm8sVbU4r+MhoCrzw/JwZAMomShAMkUWiqrsAyYkiau1ejRjUf9DvZOoTXEoNDL1CHnt297w2LiqSrqG9cQgx5bMKrT9g+INCjG8/n+K9AlyKYVfcWZvnKDGGYqDAyldm+KMuTNv5clQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ortc5wGMpqDqKCCPWM2IIH9tQFFUqUhhT+2/q3ELuSQ=;
 b=R41Q+QufdbSg/9BL9Pf1huByMjWjprdjTJFBoKnZf43D6oMh/6Z/rzwsWCd256f5b2MHlJEnxewXZnLafYhcBw/gcxTHqbeaGPhCL5rZ+8znvYhG0Rka8Ns4Tp/+1e/PW1OG6pqmhnHM6F9uDYfm2sbRP3RxS592LnpAc9rOjP8=
Received: from SA1PR03CA0018.namprd03.prod.outlook.com (2603:10b6:806:2d3::29)
 by SA2PR02MB7724.namprd02.prod.outlook.com (2603:10b6:806:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Fri, 24 Jun
 2022 12:05:33 +0000
Received: from SN1NAM02FT0056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:2d3:cafe::f1) by SA1PR03CA0018.outlook.office365.com
 (2603:10b6:806:2d3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Fri, 24 Jun 2022 12:05:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0056.mail.protection.outlook.com (10.97.4.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 12:05:32 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 24 Jun 2022 05:05:32 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 24 Jun 2022 05:05:32 -0700
Envelope-to: git@amd.com,
 michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.2] (port=47729 helo=xhdvnc102.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1o4i43-000AgM-TK; Fri, 24 Jun 2022 05:05:32 -0700
Received: by xhdvnc102.xilinx.com (Postfix, from userid 90444)
        id 1EF63104545; Fri, 24 Jun 2022 17:35:31 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <git@amd.com>
CC:     Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH 00/12] i2c: xiic: Added Standard mode and SMBus
Date:   Fri, 24 Jun 2022 17:35:15 +0530
Message-ID: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdea9280-e027-4fd2-07e0-08da55d9d70c
X-MS-TrafficTypeDiagnostic: SA2PR02MB7724:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NLjlBf1799qg2x8s9bhxTf0SPVY8jHWnrj0nya9c55UnUeTSdjZFtgucJlX5R6/7SnCpU8x5w8BRi6mzmC3LNr9kMrA88+KvJRISQgEV883/Rx4TJdWy2ZLyqDt9JacpdJIXRXpJm6l8fOEhd44vh/byKeuI07It+qWb/kMEqJBs1KIi13mHLr6JU47YOSIEUzJ6XI8d8LkogaIN/qsWv10l06rB2WfoHCRYTydA2guD5Z8omUEgSxq4XuSUNF2vR7DU2ombOW2ioWEycDv0zD3mcLafRIroVjlDNavuvD6zcWBL+DXDt7Ngd+DZeHFxFp9JmWfJDKaGGYzkGCekgZBZtKqSf6FFGYLafWCf2Hec97bYSPGDKHfw7TRbQHMAyB6J0/pL3BEuOmEwLrcOd0abE6T0nW8hjvWZOIkgYBLHg9BhduB05THsp/Jg3zODEA8OzveyCY8zcvQr6xT5AlzoQH9VvCSWGPaqyxHjC7oIN3RzlUL7kMb2Q0qBYy4WcYBn2wvJ4ZLSQmgCdnQuxonz69a1dy4ZhcJ1kkX9UtaZ8dLbsKIReBm8vDGAg+/6rnI2SiR+gbtGYDb+l05tUJ83vg4JzPdyePjyaPmR+xndiFtoF4rU2Zs9xy96t7+nkJp+zYmHwGAQu9xibSEEnBH7ew+WSGz4G8Z/wSByaoScxPtuw/4xl1JH8AfeGZghJ8LBGZf7WW+dhZ5vzgROKtQIDvJ4l6jYfhEYHCs8FrOFOYkLavQOzeQmISP+Qsy9MF8cB2JUQenxeF2P53BVV481NGOXVGqyuswaWQ5mznms5Fyo2TTJjh8zm6s5De2NviKjxYTa2pVLxw+FSs8XoSumVsULTIqbYBeYVmSDZtjj5p1z5HfiPkK9wx/ehv8i
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(346002)(136003)(40470700004)(36840700001)(46966006)(5660300002)(40460700003)(186003)(82310400005)(70206006)(47076005)(42186006)(336012)(966005)(426003)(478600001)(36756003)(36860700001)(2616005)(107886003)(44832011)(7636003)(8936002)(316002)(2906002)(83380400001)(41300700001)(6266002)(26005)(40480700001)(4326008)(6666004)(110136005)(8676002)(356005)(82740400003)(70586007)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 12:05:32.9563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdea9280-e027-4fd2-07e0-08da55d9d70c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7724
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
-Corrected the BNB interrupt enable sequence.

Raviteja Narayanam (11):
  i2c: xiic: Add standard mode support for > 255 byte read transfers
  i2c: xiic: Enter standard mode only for > 255 byte read transfers
  i2c: xiic: Fix Rx and Tx paths in standard mode repeated start
  i2c: xiic: Add wait for FIFO empty in send_tx
  i2c: xiic: Use 'nmsgs' variable instead of repeated_start
  i2c: xiic: Add smbus_block_read functionality
  i2c: xiic: Switch to Xiic standard mode for i2c-read
  i2c: xiic: Remove interrupt enable/disable in Rx path
  dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to compatible
  i2c: xiic: Update compatible with new IP version
  i2c: xiic: Add SCL frequency configuration support

Srinivas Goud (1):
  i2c: xiic: Correct the BNB interrupt enable sequence

 .../bindings/i2c/xlnx,xps-iic-2.00.a.yaml     |   4 +-
 drivers/i2c/busses/i2c-xiic.c                 | 631 ++++++++++++++++--
 2 files changed, 578 insertions(+), 57 deletions(-)

-- 
2.25.1

