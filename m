Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33FD5104EBB
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2019 10:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfKUJG4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Nov 2019 04:06:56 -0500
Received: from mail-eopbgr740058.outbound.protection.outlook.com ([40.107.74.58]:53716
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726170AbfKUJGz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 21 Nov 2019 04:06:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUNddtynFw4tbJbVLVEmVAgG3g3fMQZjtrFENT2grfYxzIB3/3XZAeLPNoty2KYZnfVF5y8OJ7za05Dt+ywN4R3lcmkxLVUL5QC3XQwR0YIdf6sYv7dhT5f0//QE1jI0h+0cuadN0P4jBbMRm7w4fqMqrbeBq2Z5chCSpUVPf4Bwg4Rv0GuI4xJ0gdwWPnMC1r6eZZZDEbmBqYEyApE0BHhde53Dk5a9NYtqOT0ajY/XMj+fBTh8rQ1eyRUYVCdLerzzJQU+SH1uJyokUmuEBz3SjkYwbh2oZlecLHCc82QtHNszs6Y/580p2tQ60T8F9PmSIU9cDvcJ+0K2xjtCVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+4z02INYpeY6l3JRbOXIlsxdd40cwARpzeOolD7X1A=;
 b=GpJvoQav9Cm5VP2Y7vZnWJYNmfnFB9WZ03osO4kWv68wHU39T8WY0S0Te3C/X3ri5NqmK+938GxTYoY4GKqxckM9JyynNXmPukR2LVZLHrT662RKcxdWCmOgCQDt7TYASICYMJXyJRKhtLJuK/FH80rULR4/RZaqN5XjvL03s80y6S4mnufz59Ra8QqWVocF4Oeeqilfv+fP30IG1ifrWhWx8gVxZU1KX0uU8Q45skalJMGmJBDi2U+iZCDbPpn3AP8HJr5gSn2PuVYipqwyjhDoCmCDiPF3ioF8t+qwk5FpKOekyocku5w8BpqqpjJAi4GNrTbUZASTJT1XjkTMkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+4z02INYpeY6l3JRbOXIlsxdd40cwARpzeOolD7X1A=;
 b=plQ2nB4XYZIOy6Ic60eUbMTKkmJPRzG7lKojQjw92rsDXbMlPrz5MkpAldvOXiZmfz04BmvCIi1f4Fh61Wy/AnPGB2RmxnzEfpairRzZAFKxZ09RUx9MkYpqi+Xe1b1g7vEkKkvCjlqTKzX2GxtX6LXac3WJoZ8kmtXKLGAtmIQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Akshu.Agrawal@amd.com; 
Received: from MN2PR12MB2878.namprd12.prod.outlook.com (20.179.80.143) by
 MN2PR12MB3583.namprd12.prod.outlook.com (20.178.241.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.30; Thu, 21 Nov 2019 09:06:52 +0000
Received: from MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::305d:cfb0:baaf:7008]) by MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::305d:cfb0:baaf:7008%4]) with mapi id 15.20.2451.031; Thu, 21 Nov 2019
 09:06:52 +0000
From:   Akshu Agrawal <akshu.agrawal@amd.com>
Cc:     akshu.agrawal@amd.com, rrangel@chromium.org,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] i2c: i2c-cros-ec-tunnel: Fix slave device enumeration
Date:   Thu, 21 Nov 2019 14:36:17 +0530
Message-Id: <20191121090620.75569-1-akshu.agrawal@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: MAXPR0101CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::25) To MN2PR12MB2878.namprd12.prod.outlook.com
 (2603:10b6:208:aa::15)
MIME-Version: 1.0
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e733823c-48d4-4ad0-bdf4-08d76e6225ba
X-MS-TrafficTypeDiagnostic: MN2PR12MB3583:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3583E9768D7645FC44200F1CF84E0@MN2PR12MB3583.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-Forefront-PRVS: 0228DDDDD7
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(199004)(189003)(51416003)(86362001)(52116002)(6666004)(99286004)(2906002)(186003)(81156014)(26005)(6116002)(8676002)(16586007)(4326008)(50466002)(81166006)(8936002)(2616005)(50226002)(3846002)(6436002)(6506007)(386003)(54906003)(44832011)(316002)(36756003)(4744005)(1671002)(1076003)(6486002)(14454004)(66066001)(48376002)(25786009)(47776003)(6512007)(5660300002)(66946007)(478600001)(66476007)(66556008)(109986005)(305945005)(7736002)(266003);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR12MB3583;H:MN2PR12MB2878.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tCb94M0V9s2gz+klgg0ujjzojkJO/XAxGVIYLSy4XB4qNcMlmuUmFJ01xWoLLpps0GXmHlaBvCVR0ULtOzQwaI1luyt1jE9nITzviPTORDHabrdfEdqduPG2i+EM/4s032Lp0icG0tg6zztq7OehiYQ4IzgXMlwvP2u/Wy9xsXWJjaX7TNgUBLtPMWxnpGvWWODkRv+mNYhj35kSuW2DKj4NOdJ2TIhGkIyU5TDuGTJ6j2RSVVAGONKn+eSL2nBdrkJ53oEd1Hb1LHn5txJ7NLn237L3Lum3zGddx5GXQW+f5tFL/lgmvqa8Ic/Ax0v+Y79n6y89ljn6b1JDL59MulvBlzfXe8YR98vNETOciDJq8vjVn323A88QxLUcrJWNFysoNYHvb1UhUuGpGSMAR1wGoV1utkbdxLYSrzwfRQA6R0bq49LHg/h1TtzlpPLg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e733823c-48d4-4ad0-bdf4-08d76e6225ba
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2019 09:06:52.0687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VVc0hXsGk780421ItFrEABnzmmn0TbtCDV4Xy0T9KIdSLRfsJUkgWJPoBVdSUuMvAQwacfqcKc6FpML2RsFqQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3583
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

During adding of the adapter the slave device registration
use to fail as the acpi companion field was not populated.

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
---
 drivers/i2c/busses/i2c-cros-ec-tunnel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
index c551aa96a2e3..aca8070393bd 100644
--- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
+++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
@@ -273,6 +273,7 @@ static int ec_i2c_probe(struct platform_device *pdev)
 	bus->adap.dev.parent = &pdev->dev;
 	bus->adap.dev.of_node = np;
 	bus->adap.retries = I2C_MAX_RETRIES;
+	ACPI_COMPANION_SET(&bus->adap.dev, ACPI_COMPANION(&pdev->dev));
 
 	err = i2c_add_adapter(&bus->adap);
 	if (err)
-- 
2.17.1

