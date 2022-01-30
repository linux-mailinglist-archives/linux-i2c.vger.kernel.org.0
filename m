Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D874A382E
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 19:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355370AbiA3SnK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jan 2022 13:43:10 -0500
Received: from mail-bn8nam11on2059.outbound.protection.outlook.com ([40.107.236.59]:61696
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1355543AbiA3Sm7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Jan 2022 13:42:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5Jh++2WTAPo93o4hccz+bEKM91RxrsvPIKyV2mWXjtA8iYIwRGytlkQnYvzV0mt1UavOeyuNqGo+ldexbCKWt36x13TQ4J4o0qs+Ky7eL2r1fEpYYiFVYo0vj37jBLWvKo8bBHWt3zQz7EGqqR/0fhUSlhle3HuOPjL76d318RMqTql9vUqxGtwH3Bhd/48G4M/JEEWZvoj4u29FfCS+KDkrHAsivMjqLl8ERsKDgHgyCKxRfo7x+WMTomJN+RUihNDxO4sr22zqKtShUZxB79wEGWSv4U+J4OcgLi+tq+A5iOeCJRjHeStFG4Q6P/R+hRKYppKR6xrgF/++KgOtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgTFlXo7NHNu1ByWNxcXZi9d+Hvh9yPQDXbwuZiHutM=;
 b=MzTXtqxcC0LNRzPANvpE172CJ+QOL5ux22SrTgNNSDUEmE2uhiRY0DT9TQUz4g+rnkn7aLRi6XYqFTIUpXbOH0VyxiauX73ly/nb0fjuIx2LgNWydFPrUKoaSi2wH7L4bjo17vH/V2uD0GJLtLPVNckou767M1X9so4WxDv5GuuWIz0H+wo3xRyWy+Iq3bqwAi/t1HZ1eLbeda1gvN4/i1O/PV8uynmUuia767if4JZFgU8YqXFV3ttsREFSJoRy1EYiv8p4TLRo2yOnfRWtLbrHTwcwg0tgeIZ07YdMhtNH/y3nph533qg8HMop5BClUgG68u/rNW8I7TBS7v68Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgTFlXo7NHNu1ByWNxcXZi9d+Hvh9yPQDXbwuZiHutM=;
 b=4RAw+OKsQzOzxOvzkunxZ8N7jACwIVUIYoxgnxepSbsDYU6p0/YPcykZKQ60DdDGO5A1uSoG6rcS+uauLEPF5TZyFX+BDBHW9MoC74cHFlPU/QAXCa40DDiXMoHD46TCHeqg6CEB+VnSprV9RlQVxT6Eriu4sineUEO/n0pr6q8=
Received: from BN6PR17CA0027.namprd17.prod.outlook.com (2603:10b6:405:75::16)
 by MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Sun, 30 Jan
 2022 18:42:55 +0000
Received: from BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::c5) by BN6PR17CA0027.outlook.office365.com
 (2603:10b6:405:75::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20 via Frontend
 Transport; Sun, 30 Jan 2022 18:42:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT018.mail.protection.outlook.com (10.13.176.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Sun, 30 Jan 2022 18:42:54 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 30 Jan
 2022 12:42:53 -0600
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
Subject: [PATCH v4 7/9] i2c: piix4: Add EFCH MMIO support to SMBus base address detect
Date:   Sun, 30 Jan 2022 12:41:28 -0600
Message-ID: <20220130184130.176646-8-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220130184130.176646-1-terry.bowman@amd.com>
References: <20220130184130.176646-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7e9af14-0e7f-4f69-b644-08d9e42053cd
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_
X-Microsoft-Antispam-PRVS: <MW4PR12MB5667793848EDBD4CC85CDD6A83249@MW4PR12MB5667.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o1e3nyxlGQOxP74WteAGzRE37cId+rU58PtGhxWuWkVQisPQ+pblupwoVfCHFKZPhSIo4Ur6wr8g3XsCUQ/ac7up0nfS5WKxNp1/R69HJZP5m+5FgBMayYKHZo+ucNjZcmvzf5+ogA++cl58/gIrV/X3BkCGlrYQ/fhXVAnMtRiEwIR+9E5SHYGiWuhT+OYhM8vrbaSvAGjKhSsZWjwziezg09UBmEHYqfiC0LGzbFCMXgVxtWNAo0TU3sR6LvzpzPpaXXGA2B3/IIsUC4ES78f9T1dVbkUVp8uLsv/NDS/IVZYWyf945rAtWp4UICY/oSKzUxeeLFp3UyL+TuBfoH0Oj60iqkdvsI3mBsi5+jTzFh9Z/CJCUETT8xooa/mqpWO5IuFK+4VzgVH80gOibixEFsfT4I0K6ERcgeqjq/sfD4Fp4eVjgghoh1MPPzqSLI9FxrteZeC7VIqbPL4yWSG1yowA5GOvuc2ZlMhcJ9nSUGGEjB5yKi74+swmgOkFy6snBOE+uktif7Uq9xX9JBJ4Fwksjv48ltn1lu/S8RBguA6Fr9e5pxlsI4WGsy9cku7EiMPeLT5ODOXOrtNvkQQ/ONXd2OCS+7x2PNmj9LTgwZliyB8GwCerMqkNtgaMhx4BqtGNrHVfeh7icYHgPPwzsRUlyrItbCZhCqgOk+BixmpDK9U0ssViAsMqTfGCpFk1VEqSDsvIkUV5EVpDASJ8dKBpVgFEPCDcfiqUvkqEDJvg79XAVl7H1f7lyeWEwFKZxoy610Ca4avXinuJXjNr9a0N/uDlAIUr6ruxkUeUJ/BQzhSgEPdNWJuuWrAH
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700004)(36840700001)(46966006)(7696005)(1076003)(40460700003)(316002)(508600001)(81166007)(44832011)(70586007)(2616005)(47076005)(83380400001)(36860700001)(5660300002)(2906002)(356005)(16526019)(186003)(26005)(110136005)(36756003)(6666004)(336012)(82310400004)(86362001)(4326008)(54906003)(8936002)(70206006)(426003)(8676002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 18:42:54.4931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e9af14-0e7f-4f69-b644-08d9e42053cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5667
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The EFCH SMBus controller's base address is determined using details in
FCH::PM::DECODEEN[smbusasfiobase] and FCH::PM::DECODEEN[smbusasfioen].These
register fields were accessed using cd6h/cd7h port I/O. cd6h/cd7h port I/O
is no longer available in later AMD processors. Change base address
detection to use MMIO instead of port I/O cd6h/cd7h.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 7defa0c5f1f9..a23c0327e1f6 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -344,10 +344,15 @@ static int piix4_setup_sb800_smba(struct pci_dev *PIIX4_dev,
 	if (retval)
 		return retval;
 
-	outb_p(smb_en, SB800_PIIX4_SMB_IDX);
-	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
-	outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
-	smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
+	if (mmio_cfg.use_mmio) {
+		smba_en_lo = ioread8(mmio_cfg.addr);
+		smba_en_hi = ioread8(mmio_cfg.addr + 1);
+	} else {
+		outb_p(smb_en, SB800_PIIX4_SMB_IDX);
+		smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
+		outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
+		smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
+	}
 
 	piix4_sb800_region_release(&PIIX4_dev->dev, &mmio_cfg);
 
-- 
2.30.2

