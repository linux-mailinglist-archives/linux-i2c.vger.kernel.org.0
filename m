Return-Path: <linux-i2c+bounces-15228-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A036D3046F
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 12:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B0BE30BEA67
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 11:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C9536D50B;
	Fri, 16 Jan 2026 11:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="Zf2EATU0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013057.outbound.protection.outlook.com [40.107.162.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF0236CE16;
	Fri, 16 Jan 2026 11:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768562359; cv=fail; b=WXL/ApdDdTNZMyzrdF2URiDxqm2Ka7cOh2F4bVNouUlxG4dCrPqJKGgt4BxwEGRQuSd2KPZ8hQNG+ns3SBEEonTdsSmB+wnMgA9d/XQhn5l1xIUadv7yibCum1XldLwD1ke6RRR4nfgLojOhuhwKtZm1Aiam13y+VomOrwKZOps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768562359; c=relaxed/simple;
	bh=NXqk3egmaKMX+VSxfoySzVwWXt/FyJL1AZRS+3kbhR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cyKyX5Poohv6EBeYRO58k1xyBqOvdqxNzfHxo3D/G/km/7NpwIbyQd/Vmtw12TvegmaknT06OdIvXDgFzmpLD+iwPQe4mj6F8vE8YDI2wwlo3j7Mdv8uvAPnKw5tZHNmcaFtzyUWWLyklNc06LnW9E5BtmFPQCvX0m+oZPXN7N0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=Zf2EATU0; arc=fail smtp.client-ip=40.107.162.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZN2pc8WL1Uy0Dgy3Q59CYJjYNZL4jUOBIpntzWFmEfpvvioLXIxOhHDkOAXQOU3wI971xL1FNJ6b/qkWdXMjURjVcckU4uIrJZRObcxzGXrhlBpOkEVmT79dhD4uB73cMFytLOit1XkWlehLTLmmsl+zGipuyHEzUCewWWjbtd8DSwUVAclfbMeZxc3iPJS14wZUC5Sq+K+q3cTdWTSrA/bHXTAoDk4EOsNyqCRoT6tnewZL5rifC6Uzthri+oW45EAAJTh23nAs2nxbpEWxsxjqQoHOfR+XjhYUShibeinM4SYl+u667weUWeLjbvmy8mWQJHAkIc6XeQoWGUp+Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ko8zW2QcX5C+Au+BA6LOsombT6GjVQNsNcD3Ant5Sa4=;
 b=zNrFFC8jyiUWIqqFQGafM19Ya+QgNg68rde+cW++2imxJPIdc2WgfTfEUzavgOC8ul/UbaDBSxUnTB78p2LWSQPmUM29VhpNHWNdfFX1kvwjWMD97Zpn23vmJE7EuD2/cb0C2G5Sc/tNhM2y7oE/aM5DvmNw4qXhmaZJI9L1OvOHZ/iXALD2YFBuSUukKrGS6rNy8OX1gnAW6JzoHDgIb5/RWKPR+g/Q/hnRRACUh1nKMzpfUQMu56A5bQvn4Bu+emANhos0GbmepnsmcMzNKTcCu34rDTbmvk5A5XZAl+dRw7ricaDrJKS0H0wKuoKdzbbOw8pKNQpliHL1F5IMtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ko8zW2QcX5C+Au+BA6LOsombT6GjVQNsNcD3Ant5Sa4=;
 b=Zf2EATU0IpDApRD72znQdopMZXtIU5PSngh1zmJU8EW68sreJjQWSA6kAx2xm2NE1grbLJqc5D56AbyCRFDIVYCcgILTnzBdsEZN52xf1/FOnQLJL7XOrus9N7zbIzo+nN0KEqH2vE1iE0yttNbtzBso0JACilZ1WRDnQ5r6mjU=
Received: from AS4P192CA0043.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::9)
 by VE1PR06MB6975.eurprd06.prod.outlook.com (2603:10a6:800:1a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 11:19:11 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:658:cafe::5) by AS4P192CA0043.outlook.office365.com
 (2603:10a6:20b:658::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 11:19:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 11:19:11 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 16 Jan 2026 12:19:09 +0100
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: bsp-development.geo@leica-geosystems.com,
	LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Subject: [PATCH V3 2/2] i2c: imx: add abort path for invalid block length
Date: Fri, 16 Jan 2026 11:19:06 +0000
Message-ID: <20260116111906.3413346-3-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116111906.3413346-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20260116111906.3413346-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jan 2026 11:19:09.0572 (UTC) FILETIME=[EF567C40:01DC86D9]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AC:EE_|VE1PR06MB6975:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 07623958-bd6b-42ad-1965-08de54f112c9
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RUdIXzQzUmMAZJJD1ALpsU1EZQDTp9D8xpf/cduajMU1vL4WqRnaV/VM11dT?=
 =?us-ascii?Q?EjyT+aycGLwaswUFSIwT4Uu0J6D+UwCDA6MqbbKC+5QqQM28ZptN0muJ0PEv?=
 =?us-ascii?Q?22PSwPWZl4nnu5uQHuS65efezOwPa5xujyirnyQFQpyBZSGnZCLXhB43agm/?=
 =?us-ascii?Q?nQHxiltE7w1XEZodza9FaHlKTCMO/7L45NiTNiRDvl8Es0FVPcwh41KYW3pm?=
 =?us-ascii?Q?Z5OTw9ZNB4wY0TzNOPbal5zeQa0UkgJJQCpdfZ1L06IsEySamL1i04SE5xNw?=
 =?us-ascii?Q?VwOOFARkaJFYHA2A3LS5H6r0tuZ6Vy/zehhoFROzVd51bHO1bS9JAorC9vLj?=
 =?us-ascii?Q?fvLQBlZWOfMva1GWYwJdUKU54WN9O460ujJnGDQGrYmrZYdO5Xjyesfqo6qd?=
 =?us-ascii?Q?gPmD2rdvHKRtjXcx8czvAIRfHX/YN9w/2XSMuVj+CoGdqpc1VI7GQ6k3/Bq9?=
 =?us-ascii?Q?DvtCUydORxPOPeqNJx+CqlWI5M1iS5+ugzHVPVW1cqtT/v7yS7F6GqbuvfVW?=
 =?us-ascii?Q?ul68p6o2uz4ghh7VI7KlK6YArHtv8BUtw3Cjw4LlpRfA+/AbbP/9rIQLeSmv?=
 =?us-ascii?Q?H1ixY9QHg8LVw8J/lbCvlTnmMAHH8vu4x6l3Le2IT1FDFGY7A1yGaAyWzSaY?=
 =?us-ascii?Q?Ny+NxmiSNmoYEf0LwMkbUSupjBCtfk/ZFXZQ4dUBdxDIAXKerMOeIBV0f7to?=
 =?us-ascii?Q?I1PaZTRrhaBT24SpEWm2OdkVX7/HQUuEXDcjU7qtEnsHgEa1m5pAscK/NyJg?=
 =?us-ascii?Q?kT7tS+D4iCcEew2X3DPox1Iirwdg/BWqydciDPkI5cRGHtgGMFcEjNXmouBn?=
 =?us-ascii?Q?mbGeSN+gTS0OlIu56N9DEiIECEKwiziiACPNrxe0g4Pla/zk9s0a1q+3oMlO?=
 =?us-ascii?Q?fMAM9SYTBnz5KwYTC4uIVsy8/eaTs2Cz1PvlWbmB51wdzhSrsc8dbOBQZbJc?=
 =?us-ascii?Q?l6KIw+dBro+VKmdg2ZZhKFTVpmRX9btrwJ7c0sVSw4XdJKHwBv441ijnrDsi?=
 =?us-ascii?Q?ljB+Bce99C2l7As5V4dTWcxUjLIDpPXsqC7aM6zGcUIT+M/uzGB8T4w0L2yh?=
 =?us-ascii?Q?hzKxBHBY3GCM2UC/+Y1lL5cFQLF8aV/c+H4apTR6N3uSyDL1SidFSZ42TC7F?=
 =?us-ascii?Q?GLeZbcX8kRPf30qez3OOKNZWXCnVpBV2ceeBAy6mrY9AMTrrkyj6I0UR/luQ?=
 =?us-ascii?Q?GdNxWw6v6O7XYnvMuGN16BB9GyweUC1/x5V8PAO1tI8L8sOvy1aUxFx1mjnc?=
 =?us-ascii?Q?ubXlCxbPCpLDO7rGgGGHkcOqm1sYOh/6mlIEYzA0zYZXx20ne59nZZRzRpeJ?=
 =?us-ascii?Q?6PJP0MP94FPfjpS4PG6Mgn08+P2ix+KHI3diBDgo/p7p2kG/yvKjrVTnXWo/?=
 =?us-ascii?Q?/n0Lh/WRykmkCQh8WP6rwfvJtKrWXzVqJXRPblFoN/I1xqwReOVCMzv/+SQJ?=
 =?us-ascii?Q?6cD9CbSpGsl0cq4wIfmnhqG9T9IplRbsz6E9m15OyhnnpjSVqGjWg1IH5VsM?=
 =?us-ascii?Q?lOEJNeq34+SQwtI49crwFeoYLHj+oCd+VpYsWkvS/qBmAnnmw3UtyUIkuf4f?=
 =?us-ascii?Q?Lu6ry98x8aeli6GWwiZL6tc8xYrpojRpLtuXxBVDsWSL2yTmovW9351+153n?=
 =?us-ascii?Q?1cdtEEr1Pnaw5BIShxRyq9LElN4qoNeNmCMBKf6PmpvxdZmPDegTozizUhoT?=
 =?us-ascii?Q?bfb3JX7hQ7z74tYFxIJCiBM9Ecg=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:19:11.1184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07623958-bd6b-42ad-1965-08de54f112c9
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB6975

When a block read returns an invalid length (0 or >I2C_SMBUS_BLOCK_MAX),
the current implementation leaves the bus hanging with SDA held low,
blocking all further I2C communication on the bus.

Add a dedicated IMX_I2C_STATE_READ_BLOCK_DATA_ABORT state and ISR
handler to properly terminate the transfer when an invalid block length
is detected:
  - Set TXAK and receive the next byte with NACK
  - On the following interrupt, generate a Stop condition
  - Read and discard the final byte
  - Report -EPROTO to the caller

This ensures the bus is released correctly and allows other devices on
the bus to continue operating normally.

Tested on i.MX 8M Plus with continuous block read operations.

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/i2c/busses/i2c-imx.c | 55 ++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 05ba41144648..d3fbc2df7f04 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -232,6 +232,7 @@ enum imx_i2c_state {
 	IMX_I2C_STATE_READ_CONTINUE,
 	IMX_I2C_STATE_READ_BLOCK_DATA,
 	IMX_I2C_STATE_READ_BLOCK_DATA_LEN,
+	IMX_I2C_STATE_READ_BLOCK_DATA_ABORT,
 };
 
 struct imx_i2c_struct {
@@ -1053,14 +1054,60 @@ static inline void i2c_imx_isr_read_continue(struct imx_i2c_struct *i2c_imx)
 	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
 }
 
+static inline void i2c_imx_isr_read_block_data_abort(struct imx_i2c_struct *i2c_imx)
+{
+	unsigned int temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+
+	if (i2c_imx->is_lastmsg) {
+		/*
+		 * Last byte to read.
+		 *
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.4.4 Generation of Stop
+		 *
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: Figure 17-5.
+		 * Flowchart of typical I2C interrupt routine
+		 *
+		 * Before the last byte is read, a Stop signal must be generated.
+		 */
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		if (!(temp & I2CR_MSTA))
+			i2c_imx->stopped = 1;
+		temp &= ~(I2CR_MSTA | I2CR_MTX);
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+		i2c_imx->state = IMX_I2C_STATE_FAILED;
+		wake_up(&i2c_imx->queue);
+	} else {
+		/*
+		 * Next-to-last byte to read.
+		 *
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.4.4 Generation of Stop
+		 *
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: Figure 17-5.
+		 * Flowchart of typical I2C interrupt routine
+		 *
+		 * For a master receiver to terminate a data transfer, it must
+		 * inform the slave transmitter by not acknowledging the last
+		 * data byte. This is done by setting the transmit acknowledge
+		 * bit (I2C_I2CR[TXAK]) before reading the next-to-last byte.
+		 */
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		temp |= I2CR_TXAK;
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+		i2c_imx->is_lastmsg = true;
+	}
+}
+
 static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_imx)
 {
 	u8 len = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
 
 	if (len == 0 || len > I2C_SMBUS_BLOCK_MAX) {
 		i2c_imx->isr_result = -EPROTO;
-		i2c_imx->state = IMX_I2C_STATE_FAILED;
-		wake_up(&i2c_imx->queue);
+		i2c_imx->state = IMX_I2C_STATE_READ_BLOCK_DATA_ABORT;
+		i2c_imx->is_lastmsg = false;
+		return;
 	}
 	i2c_imx->msg->len += len;
 	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;
@@ -1106,6 +1153,10 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 			i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
 		break;
 
+	case IMX_I2C_STATE_READ_BLOCK_DATA_ABORT:
+		i2c_imx_isr_read_block_data_abort(i2c_imx);
+		break;
+
 	case IMX_I2C_STATE_WRITE:
 		if (i2c_imx_isr_write(i2c_imx))
 			break;
-- 
2.43.0


