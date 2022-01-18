Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 906C1493080
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 23:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240377AbiARWNe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 17:13:34 -0500
Received: from mail-sn1anam02on2081.outbound.protection.outlook.com ([40.107.96.81]:37895
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1343839AbiARWNc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jan 2022 17:13:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2mXO7qxKZp1/e9YZ10LUAKOxJF6X9h/qebCrXoaZrQSnLGGghqa4F6lsrMXBg8cW9BtcaxvrJGzJ0DX8+9dizV9KmmGPIZ/3Iw9twbERy1KG8OyC4LkbxkNfypkXIW1eIj0zQ9eODQcBVwvxyYrhTYJTEbVJ1jyy3x7TPq/NeSPcDmlIE+65vFmn+vGzcUD9pdjxUMNMIHeAjkgFGWZFJlnGAwDRgxBNe1CaHuRlhFwnl/LP0s933v7qsUtVJ1Ip6+O1zS9SlbQu9ONo4e7jYIVLXRV1QloISCaql8xg3RZog2AmTfxYQVE1lyrFaRpN+ZHCrIJkLoJfqKzIlWImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEHpWreIkfKhWip+XqIwMQiNqSz6IwsSk9dHCz3ZAQA=;
 b=HTgM3U0WGSL/EGjYri7Lvzo2uhN48xB80/XfBfQlTvXTj3VQ65Q5/vRPOeW10y7IZLg+k3xt1WX6IHGyWe1hdJVZbatqIzDYotueECMEKzJ8oQe6Pi4FBvH5CqX5HkBNYXRaatoZMSP2NGXp33yMLHK0Yh+ciNmpRj9JM18BGkl2E57PsAB+GwJ2sVCkFAJN6MBZGMXXk3A8SQp3KSp421klAy+ID72RdD0JcVPFQVaP5JV5aUI5K0wQ1pnFG6el67IUa8Znrm9f79M2YoyUOKZGaWxoYemkRjiiWTKKqGr5Shy3CXmNMriBZa5BxJDA+YHVGMCNKEVzFIQT9Wnwmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEHpWreIkfKhWip+XqIwMQiNqSz6IwsSk9dHCz3ZAQA=;
 b=wueVBJTg4RRxTCQgOAeZgSla+LU6Hwr6tRkO2rNLJFnXw5K2QN5IxBzQV/AIDnIqdOnld1YgKwEIAP2N4Thq6iJHUjEAWNNv0vKBq2R+7EH5q52DeZkBR74yTcOoNyyJmiUyAkkCkq5CARgID+t3NNihXYArX82Mrvf8IPscXok=
Received: from BN9PR03CA0499.namprd03.prod.outlook.com (2603:10b6:408:130::24)
 by BN6PR1201MB2547.namprd12.prod.outlook.com (2603:10b6:404:aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 18 Jan
 2022 22:13:27 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:130:cafe::20) by BN9PR03CA0499.outlook.office365.com
 (2603:10b6:408:130::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Tue, 18 Jan 2022 22:13:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 22:13:27 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 16:13:26 -0600
From:   Terry Bowman <terry.bowman@amd.com>
To:     <terry.bowman@amd.com>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <jdelvare@suse.com>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>
CC:     <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <sudheesh.mavila@amd.com>, <Nehal-bakulchandra.Shah@amd.com>,
        <Basavaraj.Natikar@amd.com>, <Shyam-sundar.S-k@amd.com>,
        <Mario.Limonciello@amd.com>
Subject: [PATCH v2 8/8] i2c: piix4: Enable EFCH MMIO for Family 17h+
Date:   Tue, 18 Jan 2022 16:11:52 -0600
Message-ID: <20220118221152.300444-9-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220118221152.300444-1-terry.bowman@amd.com>
References: <20220118221152.300444-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b050a68e-c947-4bca-0a57-08d9dacfc0c4
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2547:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB2547738B4EFEF746A89CE0ED83589@BN6PR1201MB2547.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d6KY5m6ZFVKn0hq2RiW+3Qp2E6I8on3hGqNsQU0YRGHpLn4FAgPpFKDZEGE683keQgPGbgnsiNlqB6avubt7djGng4r7OtvKjDAvHBNBNrHhwtcWgM1NHjlmOthQT3Fq9I1xqhOTbzmJ/FIVlK8reQ5pfdgpePYgnJfSLBdvehF4qoxciasqd09HOypa+2JKjVtqLgYTTUDqDfghjkZbiZBEHzrrMBLHtjeNNEArqP8dx0Xxic/AMhAz26pCrdyl9Lc1UBSm4sDFJOfasK51Pxv1A9oEZfOxPU9xO/FvYlOlicJv4iLVW3MN2UA7zpcp2cVkU9YHZ622HYushkb2t053JitGH90dchfZ+4OtinAz+Qt0OCL3DubEGbz07SfftVnswYa7W6G0fAAIyF4sBjuHcLmeF4j/AqMNBdc5cYiQEX6mVr4HXJLAiWX1CJ4iCgkb5ICNRFm60PEeYrsOoZN2UXCqC7SQ7PCi9tEPJPpsVQODFom34GFSmfQ2dt9tu7OlGJpwQ6+cwUcTWrN2y4QaiU6lG80OimwlwyK8Isil6tjhOPvEBiyNt6hnBmrRTEVWBTm4Q5YVO5i2vlcRFacg1nyrZTAn8fEg7jAdVzmX82DPNEgSxIt76w0kg2m65yeswM+QsY1i+TJI0jhq3980OgxX3vBOEDncs7rTjHc0TsZKBVzbObBcw60jhPwd8jJrL+3cbLYD5a1cQBNPGsJ9OTWCqWsiyt4kfQRDa4KR9z/Gpfm45EGScHlqto/3iJS35V/qBuHUn95kVyQY2N7T0q5aZYdXM+AjGJCNnOsEjhCoiUQZ34QK1IfcmoiC
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(81166007)(70206006)(26005)(356005)(2906002)(2616005)(82310400004)(8936002)(44832011)(316002)(336012)(110136005)(4326008)(40460700001)(6666004)(8676002)(70586007)(47076005)(426003)(5660300002)(1076003)(54906003)(7696005)(86362001)(16526019)(36756003)(36860700001)(508600001)(186003)(83380400001)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 22:13:27.6481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b050a68e-c947-4bca-0a57-08d9dacfc0c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2547
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enable EFCH MMIO using check for SMBus PCI revision ID value 0x51 or
greater. SMBus PCI revision ID 0x51 is first used by family 17h. This
PCI revision ID check will also enable future AMD processors with the
same EFCH SMBus controller HW.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
To: Guenter Roeck <linux@roeck-us.net>
To: linux-watchdog@vger.kernel.org
To: Jean Delvare <jdelvare@suse.com>
To: linux-i2c@vger.kernel.org
To: Wolfram Sang <wsa@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Cc: linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Robert Richter <rrichter@amd.com>
Cc: Thomas Lendacky <thomas.lendacky@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index b59d2c74abf6..f5533a7d8a13 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -102,6 +102,8 @@
 #define SB800_PIIX4_FCH_PM_ADDR                 0xFED80300
 #define SB800_PIIX4_FCH_PM_SIZE                 8
 
+#define AMD_PCI_SMBUS_REVISION_MMIO             0x51
+
 /* insmod parameters */
 
 /* If force is set to anything different from 0, we forcibly enable the
@@ -229,6 +231,13 @@ static void piix4_sb800_region_release(struct device *dev,
 	}
 }
 
+static bool piix4_sb800_use_mmio(struct pci_dev *PIIX4_dev)
+{
+	return (PIIX4_dev->vendor == PCI_VENDOR_ID_AMD &&
+		PIIX4_dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS &&
+		PIIX4_dev->revision >= AMD_PCI_SMBUS_REVISION_MMIO);
+}
+
 static int piix4_setup(struct pci_dev *PIIX4_dev,
 		       const struct pci_device_id *id)
 {
@@ -339,7 +348,7 @@ static int piix4_setup_sb800_smba(struct pci_dev *PIIX4_dev,
 	u8 smba_en_hi;
 	int retval;
 
-	mmio_cfg.use_mmio = 0;
+	mmio_cfg.use_mmio = piix4_sb800_use_mmio(PIIX4_dev);
 
 	retval = piix4_sb800_region_setup(&PIIX4_dev->dev, &mmio_cfg);
 	if (retval)
-- 
2.30.2

