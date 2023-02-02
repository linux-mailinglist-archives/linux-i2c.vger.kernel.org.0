Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B81468792B
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Feb 2023 10:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232153AbjBBJml (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Feb 2023 04:42:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232386AbjBBJmj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Feb 2023 04:42:39 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151C6834BA;
        Thu,  2 Feb 2023 01:42:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJ73XxoOqJozXxvPCkbVeF6+HekO3DeQio8vp+i06/w/F5RmJUwiqiTqk3my1dpKFbsnuYcBCoKAip+Gn5NsS0r3pPWOBbLXepErBgBYv3KacMEI/JCDD04nUV2C8+qciwCpx+VTXRr5CFhYbaMYlrgPeHjtyISUYe0Agt8nL2YSUncKwEhSiPkcbzzKXDth384BWb/FIkYRClJFFzQwEWfpsyZ7XHOkTSgaU9xBwayIF7OyScSKtSEnDTG9ZXwvc3L6jJ0LMZKbzzZpWKYLY11F238zbfVNUau84t4XsrlFlC464WxGLn02dThZynYDndpkwg2BacwmxLVgOBPwvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjr55nIyFy1t0854NhMgogAN03O3WQl//c7ZUy4jYR0=;
 b=a8iPFDWEIerrSIYml9K3XaQEx7LdGiw83zlfMPeeVnqvZZJmlzjt//sgldNKF8XjtcozcKxK790oS8XdKnpSNXqY3HDuOJhE0xVF5ViFALI/ypyp10NRedE9goRhfZlgSO1N8+JmKG3ZjQPYKaGWQ3YzScUDdbN2K0ooVGQYdsjsagkdzAsc/uezdOSQ3uJMghBuaI0RSMSjy1eWf7ZUUMVBF4S/+ON4FvfuhvLp0ezQrFvZum5cVnfH2Cfhh/hGJw6vDxcJnpwLcdE673UYO2Y5TQi6g9inDrA6t8VaHamGpZ+icONALthoPLt+Qm32manSTbLfyXdbyoMOCDPtdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjr55nIyFy1t0854NhMgogAN03O3WQl//c7ZUy4jYR0=;
 b=YBnVCefk1jWcpQM14TJxheyvMXEWC+qJuSnMEXEcm/QxxKvQ9XlOWE2EgIhV2iCd95kWS9Q5mFuuE1sUanH5bJZ+eCWM/25jiYnhphwkYr5DVDHcmLi0SVfhDeDSNs+nBUxV7hX5ha6CQNzMXg+D0i8hWJJu0RtakLJk94e+v0Y=
Received: from BN8PR15CA0005.namprd15.prod.outlook.com (2603:10b6:408:c0::18)
 by MW4PR02MB7124.namprd02.prod.outlook.com (2603:10b6:303:7c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 09:42:23 +0000
Received: from BN1NAM02FT021.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::b5) by BN8PR15CA0005.outlook.office365.com
 (2603:10b6:408:c0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27 via Frontend
 Transport; Thu, 2 Feb 2023 09:42:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT021.mail.protection.outlook.com (10.13.2.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.22 via Frontend Transport; Thu, 2 Feb 2023 09:42:23 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 01:42:20 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 01:42:20 -0800
Envelope-to: git@amd.com,
 manikanta.guntupalli@amd.com,
 michal.simek@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 manion05gk@gmail.com,
 robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org,
 andrew@lunn.ch,
 devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.3] (port=36989 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pNW6m-000CDJ-GP; Thu, 02 Feb 2023 01:42:20 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id ABE531055BA; Thu,  2 Feb 2023 15:12:19 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <devicetree@vger.kernel.org>, <andrew@lunn.ch>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <git@amd.com>, <manikanta.guntupalli@amd.com>,
        <srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
        <manion05gk@gmail.com>
Subject: [PATCH V4 0/9] Added Standard mode and SMBus support.
Date:   Thu, 2 Feb 2023 15:11:29 +0530
Message-ID: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1NAM02FT021:EE_|MW4PR02MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b650f69-6eb2-479e-2fff-08db0501c932
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4sMRtXDhNAeFv7BUOrATc6C8pT0luDmiq7I81UxWrPhk5D7O5/2+cw5/vizTRY00vvg5YTpkEUFwxDbJDQafNuKPZp4vzYQuugw7MNrlTOCKiiq7FOi8hV3Qmg67fxCwr7tsVdQqEOhK2LimUExLSTO82axo6FdQyJ0U91wZhGzPze0VBEVuOglNlDjqH8EzZfwp4LbPQs67W7NxPi+uzvmxq8o5XqdsHgYPQmACGXY+mBwg4CKXkkErUpXChlTKTcdPrqrCkcTbojqQOJPpUJJC+30Phrd3HXloMoWhFUyXwKEnUR6//Ef79NzAtN7VXByUKnzlM6d1TN3HaixKzCSOgYe+p0/88WgUw6AURouNJjNqz6/GMSHorHDu2xN1fsjCQPH4DHg7JaE8HsTIjjaZM0pFNhocfX8A803bxI6O7vyXQ4D62gRB19r2OZsmvjfQ8y8MPacj1RJ6NkxUv+BPqh3arhtSfW6vQErqBTtyacaY+dr5MjxkN/La+OqbwbVf3NTo+M6p/nNT4ujFQDpGni6TVReiT3tk8Wa0ZiEeRRRZ0ePozUEpjTRsBOfLgmDHT7XVPyG/a+9+guxEc3/dDhiQI9sB3OqQElmZQtm9qaKKwjiQOScBj0zAPjbrdDQ6/HOfgVqqG98ZT/HPSaddJaLBoAAYSbsONKuE4T++lZ243az82NoYy5O6BIc8hzoAho8h96qNhpYi1pP7YXgMZn0XcLWUZzFEYMClwAXjD29klyhCJ1Kv1+RKCUlBYvzOSz4SzVtjq6JV+IRkqCLOP0k3AdMrZbWzwR3iN5o=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230025)(39860400002)(396003)(346002)(376002)(136003)(451199018)(40470700004)(36840700001)(46966006)(2906002)(110136005)(54906003)(478600001)(6666004)(7416002)(40460700003)(44832011)(5660300002)(966005)(36860700001)(26005)(6266002)(186003)(2616005)(42186006)(42882007)(8936002)(336012)(316002)(40480700001)(8676002)(41300700001)(47076005)(83170400001)(82310400005)(4326008)(356005)(7636003)(83380400001)(70206006)(70586007)(36756003)(82740400003)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 09:42:23.0266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b650f69-6eb2-479e-2fff-08db0501c932
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT021.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7124
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
Changes for V4:
Added description for clock-frequency in xlnx,xps-iic-2.00.a.yaml

 .../bindings/i2c/xlnx,xps-iic-2.00.a.yaml     |   8 +-
 drivers/i2c/busses/i2c-xiic.c                 | 582 ++++++++++++++++--
 2 files changed, 538 insertions(+), 52 deletions(-)

-- 
2.25.1

