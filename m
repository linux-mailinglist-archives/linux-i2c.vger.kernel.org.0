Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 327476907C0
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Feb 2023 12:51:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjBILvT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Feb 2023 06:51:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjBILup (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Feb 2023 06:50:45 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B01501AE;
        Thu,  9 Feb 2023 03:37:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i67Bhe+f4zOmE80P+7UZKnhC2HZpZsGGwDlshpg93ZMWKvLAfLN7ekwFMBxbDOh07/i1owl92mYD/dlZpbQvcyYdO/KLmMb79rB0qSOuZZjsYgVAwQFJhOC6ZPDXza03iGGnAF1iBZkDwetWsRRLZAHmCSX/C52bblFnimXWpycVYDRCurhz+Q8rPJE7YYItBAYN0+gM6IoVBMrtRuFeM8ENjyE/PbzBEbaypP60VvIdbDN2YBfUoXpfRJ3UUwCkUls15+d04Xcxoz3Yl8UigWm3AL1SZECevAJGhG9f5mBkI3sD4XvVpZ3BYddEucDcwP2iE6vqBHRJIIqygabppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WKbHdvkrDE8Kg4OFYbEmEphV3y2+cbBwNxDuldFtHY=;
 b=nQ5okGLapCGUAR+aH9s2rFFjAUFssR+YBx7LuH1nct4qoLpV8Ax7meLBWLvYb+iDMY11x8WhzluqBwvGlUy+5yfs+CXJ3OBd3aj57BrNeSBoxVBov7ucQPSN+f2JxfJLtn1MUdr5ACHEk83YzxC1tL3VhwIYfjFZzt1mw3NghmYpsJwQPUhsXElixCHE8AG7BunjPDa5L6NMmkrdzYPN5Ih9MTZWvKYUSAR3h0RCiLv0YtcOuGG0n4btMAASd6/7LaKmEjtvK3eC7vI9UfcfaFZ06Da9QI0/zriidbhrb2cOslCnGD8TIEDwS8y+wgI9waU/WxrOzIPU6aLIckEQPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WKbHdvkrDE8Kg4OFYbEmEphV3y2+cbBwNxDuldFtHY=;
 b=Ht93rETfeH6kwO5m9tdOHlcbOTBbIYQimu6l/T5E3v88XvuerEwyOk1YagbmcqUrNSF5SxlpQloHNoebCaKwdPvXlluFgpLqBgcgOx5gprzVctGm9aUD9HL1Zfm9Z77W1OVyiusSZZ5Tc/kK7YxAXRmqwleN0JjoQJi3E0P8pOc=
Received: from DS7PR03CA0207.namprd03.prod.outlook.com (2603:10b6:5:3b6::32)
 by SJ0PR02MB7167.namprd02.prod.outlook.com (2603:10b6:a03:297::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 11:37:34 +0000
Received: from DM3NAM02FT006.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::f3) by DS7PR03CA0207.outlook.office365.com
 (2603:10b6:5:3b6::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19 via Frontend
 Transport; Thu, 9 Feb 2023 11:37:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT006.mail.protection.outlook.com (10.13.4.251) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.19 via Frontend Transport; Thu, 9 Feb 2023 11:37:33 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 9 Feb 2023 03:37:29 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 9 Feb 2023 03:37:29 -0800
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
Received: from [172.23.64.3] (port=47169 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pQ5F3-0007Qt-7k; Thu, 09 Feb 2023 03:37:29 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id 65D351055BA; Thu,  9 Feb 2023 17:07:28 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <devicetree@vger.kernel.org>, <andrew@lunn.ch>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <git@amd.com>, <manikanta.guntupalli@amd.com>,
        <srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
        <manion05gk@gmail.com>
Subject: [PATCH V5 0/3] Added Standard mode and SMBus support.
Date:   Thu, 9 Feb 2023 17:07:23 +0530
Message-ID: <1675942646-31006-1-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3NAM02FT006:EE_|SJ0PR02MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: db7b8f50-11b4-4238-e34a-08db0a920925
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HEjksp0veAUwIVQl6nuJ6YpHh3s8db9SmhrFyCseR0tGzYmWrjSh/mBp2213DH6+LJsqYoeJCMRN8haioyiLm4LU+ArnBa4IEP1JH3jzLmjFnHZwgQPtj00OZyFuzc17yavbHbL1ZMiYNaTiu8xltE5ALeodKJV9SPaEk8nHCdwNC/n6bAALNvoDfmLsso1B8fYGWwjmOzdVgWHhAsb+OoaOxk/1cXN/SY/kpbF+XbVMOTYTDCUG4rt8zWsVtnhyTp1wHXVc6LHCYGjBRPuV9JB5VG9X8aEdYZP4NHqC34e8pJLzUmKjuBoJCUkAPdmfnCiMFFJWn4SkPn0/9EY/hi5P0hPlJaPsjZ1WxcgwyFHHPVX08YZCSemv01XegBt/26ePi6ftWddwyNEPR1qzouT7h9j1j7qCOupcp549W1N+9gtkgX1tgmTh+WQH2rGhVtX2Rgu1zS3ErTVgBfF9fb1hvpoBZCdLWViwZBSoUxmBJVFU+Q5S44LZNDz2qdjWAKDCefIAdimTYMk6c3Dv3bXnC/ju9igkYjnB3xmFY3KwUQZbD7pZmxclVWVzz8OX/XRPjHWVBLLNT3smZ1w/kmSQ+3lT+STX5OOvO5HzbPSWo9L1c25q9db60A93AAJPqWiY10OcNPKhzjIui3pxdTfIgRgJbH6derBLuDZLRwGCSQY9of4YAEVJf3LPvbfqPpUyTZUMBeeTQxGmnt4SR9A0y4lZYC6s3TlLZEf0SX9OneKKxpPT9GPa0+mvz5yCwSAgpy9TCCtp0J1KanCEOgJsgvDNGLzJtJMOcKvpD5U=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230025)(396003)(136003)(346002)(39860400002)(376002)(451199018)(46966006)(36840700001)(40470700004)(478600001)(966005)(2906002)(6666004)(26005)(186003)(6266002)(8936002)(41300700001)(70206006)(70586007)(8676002)(4326008)(44832011)(316002)(82740400003)(4744005)(5660300002)(54906003)(110136005)(42186006)(7416002)(83170400001)(82310400005)(7636003)(40480700001)(40460700003)(36756003)(356005)(47076005)(83380400001)(2616005)(336012)(42882007)(36860700001)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 11:37:33.7100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db7b8f50-11b4-4238-e34a-08db0a920925
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT006.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7167
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

-Add 'xlnx,axi-iic-2.1' new IP version support.
-Add dynamic SCL frequency configuration support.

Raviteja Narayanam (3):
  dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to compatible
  i2c: xiic: Update compatible with new IP version
  i2c: xiic: Add SCL frequency configuration support
---
Changes for v4:
First 6 patches of "Added Standard mode and SMBus support" series applied
to for-next
https://lore.kernel.org/linux-arm-kernel/1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com/
Changes for v5:
Update description and add default value details for clock-frequency
in xlnx,xps-iic-2.00.a.yaml

 .../bindings/i2c/xlnx,xps-iic-2.00.a.yaml     |  11 +-
 drivers/i2c/busses/i2c-xiic.c                 | 149 ++++++++++++++++++
 2 files changed, 159 insertions(+), 1 deletion(-)

-- 
2.25.1

