Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1EA4A3828
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 19:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347062AbiA3SnE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jan 2022 13:43:04 -0500
Received: from mail-dm6nam10on2056.outbound.protection.outlook.com ([40.107.93.56]:44512
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1355405AbiA3Smg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Jan 2022 13:42:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3in9xfURWe2FSYZ0ZpEcr7TAc+O08hyjep8N+8k/p1MoETFfAz6bG3e4xZpK7qn7M4eSJOIcPjNqep++sJArS2ZfQpZkVP7zlu2qvCadebK5eK9HzwPZXA6XwPXo9G2QhA3KOM68bE+CDWVx9ARX6gQX0t/8UxfIlcHBI3Arm0eRxyL5jEE2DY+JoFtNd0k+3enI7NJGiNgWVJUsxqxyGcTKj341njcGKCzTMQuEfwG0xDXVBgoq2uA9qXkpWBlNJ9UBR33V7tvWaT7bTFO1aRO7SaEAn8ouGtbhmx7q8LDHityPPIlrQRV9tE0VYiB8kVZ5JbajnOnzLSykV0s2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kaeqvj0ieVhZRvgKFiIDCSaGfERuMbMXUjROaXySCFQ=;
 b=faCv1XGPNJYHsMB89+4JBeqckAn/owhwDTA2HEI9ZeUfMhmwB990yii4SiX+TJJW2qbFuCHgdUEl7qwuHY9oTZuDfzGterOLnoZCMfTiZG9JVC0JmwrYdiw2YTRZRItJ42cp+y0cJaXTyL1UlQv6pSQd6GIYfhuJUc+ta3l4pwn11DlSoHeZwVt79YPjwg5n0jBaH0uHEh3M2aNCAfzphgoWAWV7NO29uKALR/Hfd7fOBl5x+uQtSoJbG+yaVoqwCiGAREVVVpcQCXXj3BxB59VHU34wg3jPtwfNAK3oDQo6ngPOnNgLzN53bsGtpsWfMgXw/15lzYHVDTuMr1DRZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kaeqvj0ieVhZRvgKFiIDCSaGfERuMbMXUjROaXySCFQ=;
 b=EAZB71lBtBpd9PJoInar42lJI7Algs8i/mMkb3lL5yhj1WHlKLtbWsGNcn04deKRe0Wgla18aTUKyZh1v3adsNG9JXKKf83vGczapl33MpDtu5C9VskxvGBye1qSciOrfq2npL9BtPb8nasecVW4HszVnY6AEMGyCiw7lr/dED8=
Received: from BN9PR03CA0495.namprd03.prod.outlook.com (2603:10b6:408:130::20)
 by MWHPR1201MB0141.namprd12.prod.outlook.com (2603:10b6:301:56::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Sun, 30 Jan
 2022 18:42:33 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:130:cafe::f4) by BN9PR03CA0495.outlook.office365.com
 (2603:10b6:408:130::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Sun, 30 Jan 2022 18:42:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Sun, 30 Jan 2022 18:42:32 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 30 Jan
 2022 12:42:31 -0600
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
Subject: [PATCH v4 5/9] i2c: piix4: Move SMBus port selection into function
Date:   Sun, 30 Jan 2022 12:41:26 -0600
Message-ID: <20220130184130.176646-6-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6e30f360-c368-4dee-a47a-08d9e4204695
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0141:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB01410AF8DBB37718DF242F3683249@MWHPR1201MB0141.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qM2PTj3I0xNB1n1hUUW88yfeOsDJUepkxIFLBgTD4HF/ODe68GoLcUbWB+seUARar2yIkO3iYY8CPUeWubl83LZr5m/Feb2yIiOOK20zTbRGnE2ffzVpE6x1JwgG7UIpCAgDLiNMIeXj30E9pAKyzz+Xk9KKLmnTsAUmFsmXxC2FV0veZxP9yShylXiA5Gsoje/QTgl8axnqbs7RXuM7ZM3sKU88Y8+1FfmeX2LQepzWsv9C2AOH5WR4BRaaKJCriZpEmmxcFSsSPfAW87NQR/MDPww2EYXQfKidheAx/6w/nSFn29nOTECzXec/BoUxL47aB2LVIze0/nfKyu8QCdoOiboHCsYPbCW3K+M2HSHgRVEq2QNbt/WRWPgzWYYctpUoZhr8iORxDjfEhTSPxG7tzz1/g44uYD5mbAFzm/iMnEwpJffvnRx7nZrlmNYriwSDTu4+Y33v6UNScU+wwxVwPVTc7jrp5uaFiqpqY9lxEycpBfh+bQfjMDkj97Aou++fg1RuYnrfT21A5w8ZG+iQ3zmYUMq9hi6H9M0+mPL06lJxM+2klbbOz6V2TeaYI8VJJqUCeSmH2/5LJlbXaqTzAB8zqZEAdsQwL44O5eHBEVWbB0iCMXx7G4yfzHPrLubStteSWZ8zR7DOx96XMbQkLWYrW0MCLB3Wka2K3k02+tAigEeGfcqu6JUgnwMyQBBro+7Vta4W6x+h+leH36oW3B7RMrpkODZHZMrpMOc=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(70586007)(426003)(336012)(4326008)(70206006)(356005)(8936002)(8676002)(81166007)(26005)(86362001)(5660300002)(186003)(2906002)(1076003)(16526019)(44832011)(2616005)(316002)(82310400004)(36860700001)(54906003)(83380400001)(36756003)(7696005)(47076005)(110136005)(508600001)(40460700003)(6666004)(2101003)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 18:42:32.3309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e30f360-c368-4dee-a47a-08d9e4204695
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0141
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move port selection code into a separate function. Refactor is in
preparation for following MMIO changes.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index eab06e9e5fdf..32a30af5778a 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -699,6 +699,19 @@ static void piix4_imc_wakeup(void)
 	release_region(KERNCZ_IMC_IDX, 2);
 }
 
+static int piix4_sb800_port_sel(u8 port)
+{
+	u8 smba_en_lo, val;
+
+	outb_p(piix4_port_sel_sb800, SB800_PIIX4_SMB_IDX);
+	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
+
+	val = (smba_en_lo & ~piix4_port_mask_sb800) | port;
+	if (smba_en_lo != val)
+		outb_p(val, SB800_PIIX4_SMB_IDX + 1);
+
+	return (smba_en_lo & piix4_port_mask_sb800);
+}
 /*
  * Handles access to multiple SMBus ports on the SB800.
  * The port is selected by bits 2:1 of the smb_en register (0x2c).
@@ -715,8 +728,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 	unsigned short piix4_smba = adapdata->smba;
 	int retries = MAX_TIMEOUT;
 	int smbslvcnt;
-	u8 smba_en_lo;
-	u8 port;
+	u8 prev_port;
 	int retval;
 
 	retval = piix4_sb800_region_request(&adap->dev);
@@ -776,18 +788,12 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		}
 	}
 
-	outb_p(piix4_port_sel_sb800, SB800_PIIX4_SMB_IDX);
-	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
-
-	port = adapdata->port;
-	if ((smba_en_lo & piix4_port_mask_sb800) != port)
-		outb_p((smba_en_lo & ~piix4_port_mask_sb800) | port,
-		       SB800_PIIX4_SMB_IDX + 1);
+	prev_port = piix4_sb800_port_sel(adapdata->port);
 
 	retval = piix4_access(adap, addr, flags, read_write,
 			      command, size, data);
 
-	outb_p(smba_en_lo, SB800_PIIX4_SMB_IDX + 1);
+	piix4_sb800_port_sel(prev_port);
 
 	/* Release the semaphore */
 	outb_p(smbslvcnt | 0x20, SMBSLVCNT);
-- 
2.30.2

