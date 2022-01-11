Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61FA248BB73
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 00:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245558AbiAKXck (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jan 2022 18:32:40 -0500
Received: from mail-co1nam11on2059.outbound.protection.outlook.com ([40.107.220.59]:35745
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1346834AbiAKXck (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 Jan 2022 18:32:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsOHOiOWpgwfTPGQbUmI05BwoDm1Ik/tImVZWoQ26gcs8vCWUT1/JH2vSSVkgQjpdgoqJufsl25fBCSpWf7RGtCZzKEZwfDjBbq2sZPbNhxSTJEN9+45BkJxx55apxnrYeaT6m/YAARth1RSO6ZC5QVy24akYe5XbWJZfMG8Wm2N9rWU87+1Leqm9wM+A00BKXP1mCM+I4xRopRqn/9uIOLVkUYrl/B4Ax7nE8ZQDoBmbBWm6xPoi/RqQ4sBtRO6W6/1X3ZM3zvtPivTOfDtf9CMP8fAT95BJMtVAwFh+Xs0o4P6y/NXneTjcr3k4I/LHXYSporxef2oR/eZlGGNPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tK+iwUgi+c1SRMTWx6eNWoJ5pagjEwqJ7zxfgcUIBjE=;
 b=B/glUxLNRQsB5X12mklKUDExVYQyV3jHrOJTYozSbT0AoqhdZ5l1A5ER3QLM5mc6dCCrsalVZ3vvJ+3JA2x/7gj3XmC31ppDvrmX9IHWbWqkLrcX0NZunaI3/fuDB8TiiUfb5XXW3jn52o22ctqVs1SrYPcUerSGPd6Rc5jeFz8zQu6pexK9iZBhlZ7t95LcRKAImq4zdScB7X9UIjvvnVb3ZrL6WMe2It5lyxGsn0UJ0QJMN81ba/5yLpHcmOkI9BQYS2JpZeTUivTyK5GpXAEYCCULQuG9Wv6rLnd2h0JUsif3X+EBWBlQzvku54xvIdWP2Okztv7hDO7bf+9MaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vpitech.com; dmarc=pass action=none header.from=vpitech.com;
 dkim=pass header.d=vpitech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vpitech.onmicrosoft.com; s=selector2-vpitech-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tK+iwUgi+c1SRMTWx6eNWoJ5pagjEwqJ7zxfgcUIBjE=;
 b=R4gGoPGjHXDQTAIgYWVrESCKyDERU0V1mtsjAaIrNWYfEy87GVIoLrKqKX/g6zknWgonGLg7Tj7gOqXA6c6V4Vs7UGAUgvRqiB/Ez48B8or1YZwJphvcCW3Gg2BZSOqYDi9YOxMkCUD16Heaz710SyCF/Yx1QWxvQxlxM5ijbbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vpitech.com;
Received: from CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:15b::19)
 by CO6P222MB0473.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:140::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 23:32:38 +0000
Received: from CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
 ([fe80::acb2:d13e:3a3:c824]) by CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
 ([fe80::acb2:d13e:3a3:c824%9]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 23:32:38 +0000
From:   Alex Henrie <alexh@vpitech.com>
To:     linux-i2c@vger.kernel.org, marcan@marcan.st, wsa@kernel.org,
        jdelvare@suse.de, alexhenrie24@gmail.com
Cc:     Alex Henrie <alexh@vpitech.com>
Subject: [PATCH] i2c: i801: Add module parameter to inhibit BIOS access
Date:   Tue, 11 Jan 2022 16:31:51 -0700
Message-Id: <20220111233151.8484-1-alexh@vpitech.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0175.namprd05.prod.outlook.com
 (2603:10b6:a03:339::30) To CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:15b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd0ef530-2cdd-4f7b-9511-08d9d55aa789
X-MS-TrafficTypeDiagnostic: CO6P222MB0473:EE_
X-Microsoft-Antispam-PRVS: <CO6P222MB0473CD811B385970FA2A5C6EB8519@CO6P222MB0473.NAMP222.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: on8wt1tzr8RH3chHEUk1sRtnV3gLflhfFy8nSE78QXbi6vpBQIz7EDYg7U/oL+kyWSKzGzrVCQL4pLfVGooJfan3dXH0IAnzcZsktDqq6P+shHRQXamSMFl5x7VJbOpyWLSCTTqHHFUKh3P+RX/EclE/9tkJD3OTr7e1MyaxvttyuVQly2YcINDNQQa4VWIWtO0+i43ZsBFr/18tPQz8gZ2GEqFoKUp7SVz5nsYhKBH3BSzi73fMp4hxztKhEFUI/HQNStdmb0HpMyUYlXAKbFsigh4ERg/GlTyU3FsXFuJScE5d62d3dBsHXX/v5Udw+pYyNjqSEhXdaDsSvPYYLw+cnddsLwaznJeU2y2Hq5B8z2c+RrzLenR/Tk4Iarnly+eR0k/IhTIoQAUnGxb4P36J9veN2k8m3ttoF6rFfOGRv2Rs8mEPTH1NDA3zVrdCbghRLmSSApYmKnPrdTuxxVXcuV0dgQ1jLl/wgHbQRB9KX/A/XXrhdPX4+Dv2H1eRRHVKorXJiY9X6W5OV5SBtAzjttr9riDL9ayiiQR5MmmKZbEEnVnotpsfHFdClArlUWpbwa5jcVrM4CSmGtSiDotcMR284i/yznXPHA/O6yP1A1DxlU+9F/KnhOPzVC1R9ls4ZwLPeWzpv1QPFVgLUDPy2WfKK/QFofyywNrnDY9v4XNlg9OdTzgpBsuj/Ttfe3hWYVsyUF7BdeY0Zl3tMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(366004)(346002)(39830400003)(136003)(376002)(396003)(8936002)(5660300002)(316002)(52116002)(6666004)(6506007)(66946007)(107886003)(6486002)(83380400001)(1076003)(508600001)(66556008)(186003)(36756003)(6512007)(38350700002)(38100700002)(26005)(4326008)(86362001)(66476007)(2906002)(8676002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8thHuBvPme3IuCMj/qJpZL3idkaa6TcINMsLlnqpHangJqIUR79RGX0BeBXy?=
 =?us-ascii?Q?lH4ey2A3BiRcbOE92Fb2oQVY3/ZaVeeSS1UPhQ3UjvUsMw6n33AP+ZuWRloT?=
 =?us-ascii?Q?pWkoPu0htXmJAG2emzMULL3KKyKRJ2AMEkjwUtqo++sHgvNZOQzOMc5RKRLv?=
 =?us-ascii?Q?2F8EeYGV0eKMD3g4yH1Zu2Z6Er/dVypKqlPdbrqwXD+eIdXJ4+kGGCTeuhot?=
 =?us-ascii?Q?Pin75Hy9gwavjPthXIPbFqx4nxS4S2PRdPB81lFxHZWELGe+eiqCo24O6DTq?=
 =?us-ascii?Q?tUBlOVEfX90eTZUaKoe90M/0fO5f8u/kaDUwNDyBljsuicnYa1+bfHZBnv2+?=
 =?us-ascii?Q?48aQCdWNQhm8yeSV6k9GWNphovnRQeerkUz0ZCk/BybJW8FF4Dhy0fxzIsNg?=
 =?us-ascii?Q?tDuezgLhNfiGwVsGA38w43otfUoZY2QhgV66D5PD2zPtv7N8UisHtKrssTon?=
 =?us-ascii?Q?77XcVsVsoL5t7P/xObaMe8JIfANm6Sa3RYEu7pKRrqNC41j0bQzvAlff47h0?=
 =?us-ascii?Q?pXBbi6/wt5gGlGj937ySIvqRDkf7EXMX6Uo6THmoKutm9xQLa9KpzstY2Qf3?=
 =?us-ascii?Q?dQl6WM1a3SfZLWpccEszlu2t0lyVvRDvaHIsblmr/RIDDMtwDCsG2007apMM?=
 =?us-ascii?Q?5oU23J1M52oVYdMEc6yO/6EedpaDcSvKma7Vgj6xT8D8MJOTNA4V4O3bVBRi?=
 =?us-ascii?Q?IQ8KmUn5qinUsEF0DKOrMgov6by2sVN5SQ6VJYVZ310ohc6/vhaeuu5LpHnx?=
 =?us-ascii?Q?UxH/sVjjr3PSwIuEx2cZHapVupGo8S1uTLXYxAAKE5XV3AXV3WLn3OvWl/KG?=
 =?us-ascii?Q?ec1NsImF8CEybHR3gL/yW5+rEGqTlNwvzmQyR8YwfBQ87sXHXB4EZ/E3L9SN?=
 =?us-ascii?Q?TDrn51iTydiHyf7r75gf+fd0UEiRdHLg4W8s+EWYgpvM76PY1bbpTq3SIhaH?=
 =?us-ascii?Q?+qRdEaRHXb+Uyue6eJCR+PmYqDU/Zwj26+h4HAhaeIi1DDeXoTzEyIu58RFg?=
 =?us-ascii?Q?ty+jJDw/7lI9bnBKiPTK1aT4gK+0ZNu8GTQFQbgxzZqt0Nmf4yAUeQpgPH7R?=
 =?us-ascii?Q?Ol0NALZVwssu2iHmeAx3gm5DcDsTTnWIxEpwe4zzsjm+8tv8i2JLWULwMPQc?=
 =?us-ascii?Q?ntbY11U85rRpIS4nJRHcOwCjli7DLbCrmJspep5Dm1B7ygeEUU9k5AsUTUT4?=
 =?us-ascii?Q?Vrpy9a3dDteOIkxmDanyH1NaKAsElZjpev687+Mu9uIo1Z/gR06iE6ZDqROo?=
 =?us-ascii?Q?kObP82pGaiiNLXdv0BGmRdx4ra/jq1dtCiguv2PmibtaTrqBPdv0598uJ8iW?=
 =?us-ascii?Q?214MAdIB0rxNNY7/VfvUhsgwqmBpiRZJ8fLXCHpUwsTiF+k99lU58h5uT7+Y?=
 =?us-ascii?Q?O5/HhZKdrnhbJg/QhLVFulZBFE6bA25JoGTrP0gsaBaG9GJTC6f7l3FThD8C?=
 =?us-ascii?Q?jiem9VmBH0ADParsetjSH2mkqBBUNA30l49N6KSDLvB9oqpLoY5TdecNaUjF?=
 =?us-ascii?Q?KUurnvK9oFyn8XJF1lKEXsF3v8zEVNT7vFEU/jAl/FG0s+41/zQp8rgpUKlh?=
 =?us-ascii?Q?swewZkunBueJsZ1EqNorYjtECfxbvEHsPiGslx6+N26YzJfejIlgMmBlojAX?=
 =?us-ascii?Q?ph0gmnwBAa/fpBwJVw/694k=3D?=
X-OriginatorOrg: vpitech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0ef530-2cdd-4f7b-9511-08d9d55aa789
X-MS-Exchange-CrossTenant-AuthSource: CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 23:32:38.5313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 130d6264-38b7-4474-a9bf-511ff1224fac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QdEEv0nMZda/QYnhiCi/p93Q2akOqMR/iOyM6jC58GmbxYEiVwg8UQzeVzsFsitYKbwqOR3h6526Lix4nl2+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6P222MB0473
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This parameter can only be set before the module is loaded (e.g. by
passing i2c_i801.block_acpi=1 on the kernel command line).

Signed-off-by: Alex Henrie <alexh@vpitech.com>
---
 drivers/i2c/busses/i2c-i801.c | 63 +++++++++++++++++++++++++++--------
 1 file changed, 49 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 41446f9cc52d..615fd1185b61 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -288,6 +288,11 @@ struct i801_priv {
 	 * ACPI AML use. Protected by acpi_lock.
 	 */
 	bool acpi_reserved;
+	/*
+	 * If set to true ACPI AML tried to use SMBus but block_acpi was
+	 * set. Protected by acpi_lock.
+	 */
+	bool acpi_blocked;
 	struct mutex acpi_lock;
 };
 
@@ -320,6 +325,11 @@ MODULE_PARM_DESC(disable_features, "Disable selected driver features:\n"
 	"\t\t  0x10  don't use interrupts\n"
 	"\t\t  0x20  disable SMBus Host Notify ");
 
+static bool block_acpi;
+module_param(block_acpi, bool, S_IRUGO);
+MODULE_PARM_DESC(block_acpi, "Prevent ACPI AML from accessing SMBus. "
+	"[0] = allow ACPI access, 1 = deny ACPI access");
+
 /* Make sure the SMBus host is ready to start transmitting.
    Return 0 if it is, -EBUSY if it is not. */
 static int i801_check_pre(struct i801_priv *priv)
@@ -1616,23 +1626,48 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
 	acpi_status status;
 
 	/*
-	 * Once BIOS AML code touches the OpRegion we warn and inhibit any
-	 * further access from the driver itself. This device is now owned
-	 * by the system firmware.
+	 * If BIOS AML code tries to touches the OpRegion we have two options:
+	 * Warn and inhibit any further access from the driver, or warn and
+	 * inhibit all access from the BIOS.
 	 */
 	mutex_lock(&priv->acpi_lock);
 
-	if (!priv->acpi_reserved && i801_acpi_is_smbus_ioport(priv, address)) {
-		priv->acpi_reserved = true;
-
-		dev_warn(&pdev->dev, "BIOS is accessing SMBus registers\n");
-		dev_warn(&pdev->dev, "Driver SMBus register access inhibited\n");
-
-		/*
-		 * BIOS is accessing the host controller so prevent it from
-		 * suspending automatically from now on.
-		 */
-		pm_runtime_get_sync(&pdev->dev);
+	if (i801_acpi_is_smbus_ioport(priv, address)) {
+		if (block_acpi) {
+			/*
+			 * Refuse to allow the BIOS to use SMBus. SMBus does
+			 * have a lock bit in the status register that in theory
+			 * can be used to safely share the SMBus between the
+			 * BIOS and the kernel, but some badly behaved BIOS
+			 * implementations don't use it. In that case, the only
+			 * way to ensure continued safe access from the driver
+			 * is to cripple the BIOS.
+			 */
+			if (!priv->acpi_blocked) {
+				dev_warn(&pdev->dev,
+					 "BIOS tried to access SMBus registers\n");
+				dev_warn(&pdev->dev,
+					 "BIOS SMBus register access inhibited\n");
+				priv->acpi_blocked = true;
+			}
+			mutex_unlock(&priv->acpi_lock);
+			return -EPERM;
+		}
+		if (!priv->acpi_reserved) {
+			/* This device is now owned by the system firmware. */
+			priv->acpi_reserved = true;
+
+			dev_warn(&pdev->dev,
+				 "BIOS is accessing SMBus registers\n");
+			dev_warn(&pdev->dev,
+				 "Driver SMBus register access inhibited\n");
+
+			/*
+			 * BIOS is accessing the host controller so prevent it
+			 * from suspending automatically from now on.
+			 */
+			pm_runtime_get_sync(&pdev->dev);
+		}
 	}
 
 	if ((function & ACPI_IO_MASK) == ACPI_READ)
-- 
2.34.1

