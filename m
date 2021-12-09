Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB80346EA9F
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 16:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239191AbhLIPJr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 10:09:47 -0500
Received: from mail-bn8nam12on2076.outbound.protection.outlook.com ([40.107.237.76]:40129
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239190AbhLIPJr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Dec 2021 10:09:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ovm/spe8nZA2Z7AqL6jew/JmxvktYqaU00ll6aMV5k1KiRphCuou7lyq1db8JSgpucf2z3hbJb0ObMIeHSFKcolluTIUc/Z3EItYWqsx7JSF2J+XdV3ZcPLw86QN5Jo+qpi5pnBhUntwwJiBL+7T5XeHM4WPIrmfGKaDaiIFdTdqPuiAidJ1rd/dAbF1S5wWpJLYeUvmgUH1cchTUiGwcXDDshDuacgEnAR2gvBkMRD6JoFxutZsOCdfWnvYWPzOboonjhytEwIpM+r5zLY1VHpbtW0yGHtwHwzMHOG0S7KRw+z5gLZdpVhHq9QLRpca02LoIMLdxT0uyWQip+yJMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbLhIRsgwe8ksrnvwi8Rk/xSnMJ04UgcCgTrN4U02xA=;
 b=khbEAuDtJgmd7nG/sGUjUPwujSNRWXxfnVehrffcYcGpA7U5lHcy3I7HUbHWhBwm8Qj8OxHZbnpTDR7yonIWgH7yeCt19YtR7HXXB5VwVeriNm+PINXC+fw7I81gL6axt4JaS01kTp7Bs8U8H2zb+mqjsczVWEqOBUDv3vUiMq7HEWbUcfkg/vpTyQmQvgb5d2qYGh0NdxbNKUoBiV5oYKnNo1spKprxt6o3d7Bar70YdnQwl3wynRUmzHYztnl03beP9UgKh2X1xEN4DX05PDLohJhDEgZUBZYT43XvQUN6g+hVxrVuLXQt5eTJYipoyDL+7hqedwjH/phQKUpHhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 203.18.50.12) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbLhIRsgwe8ksrnvwi8Rk/xSnMJ04UgcCgTrN4U02xA=;
 b=cPsXiBRCWqQJzBXcVWz629iorKaKN39wLzn1dA9Rjzu5FTDE+Yph4Ia7FK/UydCsMcC2g4oWcp75tN8jNFi/kugyosyjOjUgQKdUbWxETYkrVo7acfxPbr+olIvdgnz7wsY90dFd7Qm1OVztOX3uBEBSmS2qwsXWJ20SFiyVDpbGg5B0WoTr5jZEPwvmCo943Br3X8/Jcw3M9NqX/q8eAmK6nG35KP0OHGgNwphTQuPCdzFAxtrzxLZh5MRVIGQxXjvnXknmaXk4wruPR8DETKiys9/MW42/A4vXF6/adJlqE7j29K1JZMsVoDal6ImVVMecdlGLFWsqfByEFEasow==
Received: from DS7PR03CA0256.namprd03.prod.outlook.com (2603:10b6:5:3b3::21)
 by DM6PR12MB4436.namprd12.prod.outlook.com (2603:10b6:5:2a3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 15:06:11 +0000
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::ad) by DS7PR03CA0256.outlook.office365.com
 (2603:10b6:5:3b3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Thu, 9 Dec 2021 15:06:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 203.18.50.12)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 203.18.50.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=203.18.50.12; helo=mail.nvidia.com;
Received: from mail.nvidia.com (203.18.50.12) by
 DM6NAM11FT036.mail.protection.outlook.com (10.13.172.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4755.13 via Frontend Transport; Thu, 9 Dec 2021 15:06:10 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 9 Dec
 2021 15:06:06 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 9 Dec
 2021 15:06:04 +0000
Received: from kyarlagadda-linux.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 9 Dec 2021 15:05:59 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <andy.shevchenko@gmail.com>, <christian.koenig@amd.com>,
        <digetx@gmail.com>, <dri-devel@lists.freedesktop.org>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linaro-mm-sig@lists.linaro.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <p.zabel@pengutronix.de>,
        <sumit.semwal@linaro.org>, <thierry.reding@gmail.com>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH 2/2] i2c: tegra: Add SMBus block read and SMBus alert functions
Date:   Thu, 9 Dec 2021 20:35:21 +0530
Message-ID: <1639062321-18840-3-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1662357-1e62-47e2-b6de-08d9bb256fb7
X-MS-TrafficTypeDiagnostic: DM6PR12MB4436:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4436301CE5775F4903AB27E7C0709@DM6PR12MB4436.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: COF6HRgxcMKIFVo00KbZkjQDOI1lCOrt4fXl//RUUhq69QdaqUoZNi1GAcRviUbnzRhhVIqN5z/OC6RXMkitz8e6oKIno0JvsqVnPJVJ7jfP8j8FBUnWNovoVcgiE5HdlIS3wYoxGnTDhFx8r3U3o+ELdfI+VGj/3M7a4bAWfsmBLrHz+yVpqQGreIG19C/Yqypjq8WZqTqmWFDFavFuuvTmjhhpxl3QQ+ag7eq624jxegpdnuhAwwOUBqq+E8OWiX4D8hPXWyceGtLKNy/S0sV0qD3oPFUbd04yeT3pWz33cXPAm3nvTwt4yTfEkD0BA5tDA74LoK6GqIvFhUtdLPPTfkzeX67WB5EU32tRJFV+Gty+gJsGkew3VC5P5c3Pmc4TO3KoSyXI2q4ptEIuozipsvNb+c5WyupMNY6iPqYbxMYmOTVXzoN/rqmPSEB9W8cPV54fmXXUCwv9zWtj7ozkWrZfXy6zQu/wMDYT/TQWBtKVOBG3TdOyWO6NY4ve6HpZxmaA8Ft68Kv0MXkxoyvwz90dpsYsEi3Tc47NQh2XrRwfmuf8sW5SvyOLoSslGvvI5a4zF8Jpolyy/b+YdUhRixj/cPnRzh5Fcpjo/5rJ2speqVR8LU4vWle2+whjS61GCinvYrrqmQLg0V8UWMfAuOkFH0mT86h9GGc0QfyRBP9odcx+y98cnRSWtL168mqG0Gsp7rHvIzsuWcDi7pmSBgLq8hBuhJyfSb6FrdUOd7o4Nr+PIupPamjG0aZwZu3WGVW1DfA7UyQXGxKFqyvlIO/F4umDsFyQwasPKVIIA+jZtKSOsN8Oi2Ntpq5CqAq7Pt60vwt553QjKq0sHQxTCFfEzBG0GZod3M+wj/g=
X-Forefront-Antispam-Report: CIP:203.18.50.12;CTRY:HK;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:hkhybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(70586007)(8936002)(82310400004)(110136005)(86362001)(36756003)(7696005)(36860700001)(7636003)(356005)(316002)(107886003)(2906002)(70206006)(40460700001)(8676002)(508600001)(34020700004)(5660300002)(921005)(15650500001)(26005)(47076005)(4326008)(7416002)(336012)(2616005)(83380400001)(426003)(6666004)(186003)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 15:06:10.7756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1662357-1e62-47e2-b6de-08d9bb256fb7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[203.18.50.12];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4436
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Emulate the SMBus block read using ContinueXfer and SMBus using GPIO
interrupt.

For SMBus block read, the driver  reads the first byte with ContinueXfer
set which will help to parse the data count and read the remaining bytes
without stop condition in between.
SMBus alert is implemented using external gpio interrupt.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 54 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a5be8f0..3b70013 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -14,6 +14,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
+#include <linux/i2c-smbus.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -226,6 +227,11 @@ struct tegra_i2c_hw_feature {
 	bool has_interface_timing_reg;
 };
 
+struct tegra_i2c_smbalert {
+	struct i2c_smbus_alert_setup alert_data;
+	struct i2c_client *ara;
+};
+
 /**
  * struct tegra_i2c_dev - per device I2C context
  * @dev: device reference for power management
@@ -280,6 +286,8 @@ struct tegra_i2c_dev {
 	int msg_err;
 	u8 *msg_buf;
 
+	struct tegra_i2c_smbalert smbalert;
+
 	struct completion dma_complete;
 	struct dma_chan *tx_dma_chan;
 	struct dma_chan *rx_dma_chan;
@@ -1232,6 +1240,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		return err;
 
 	i2c_dev->msg_buf = msg->buf;
+
+	/* The condition true implies smbus block read and len is already read*/
+	if (msg->flags & I2C_M_RECV_LEN && end_state != MSG_END_CONTINUE)
+		i2c_dev->msg_buf = msg->buf + 1;
+
 	i2c_dev->msg_buf_remaining = msg->len;
 	i2c_dev->msg_err = I2C_ERR_NONE;
 	i2c_dev->msg_read = !!(msg->flags & I2C_M_RD);
@@ -1388,6 +1401,15 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			else
 				end_type = MSG_END_REPEAT_START;
 		}
+		/* If M_RECV_LEN use ContinueXfer to read the first byte */
+		if (msgs[i].flags & I2C_M_RECV_LEN) {
+			ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i], MSG_END_CONTINUE);
+			if (ret)
+				break;
+			/* Set the read byte as msg len */
+			msgs[i].len = msgs[i].buf[0];
+			dev_dbg(i2c_dev->dev, "reading %d bytes\n", msgs[i].len);
+		}
 		ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i], end_type);
 		if (ret)
 			break;
@@ -1415,7 +1437,8 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 	u32 ret = I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK) |
-		  I2C_FUNC_10BIT_ADDR |	I2C_FUNC_PROTOCOL_MANGLING;
+		  I2C_FUNC_SMBUS_READ_BLOCK_DATA | I2C_FUNC_10BIT_ADDR |
+		  I2C_FUNC_PROTOCOL_MANGLING;
 
 	if (i2c_dev->hw->has_continue_xfer_support)
 		ret |= I2C_FUNC_NOSTART;
@@ -1727,6 +1750,29 @@ static int tegra_i2c_init_hardware(struct tegra_i2c_dev *i2c_dev)
 	return ret;
 }
 
+static int tegra_i2c_setup_smbalert(struct tegra_i2c_dev *i2c_dev)
+{
+	struct tegra_i2c_smbalert *smbalert = &i2c_dev->smbalert;
+	struct gpio_desc *alert_gpiod;
+	struct i2c_client *ara;
+
+	alert_gpiod = devm_gpiod_get(i2c_dev->dev, "smbalert", GPIOD_IN);
+	if (IS_ERR(alert_gpiod))
+		return PTR_ERR(alert_gpiod);
+
+	smbalert->alert_data.irq = gpiod_to_irq(alert_gpiod);
+	if (smbalert->alert_data.irq <= 0)
+		return smbalert->alert_data.irq;
+
+	ara = i2c_new_smbus_alert_device(&i2c_dev->adapter, &smbalert->alert_data);
+	if (IS_ERR(ara))
+		return PTR_ERR(ara);
+
+	smbalert->ara = ara;
+
+	return 0;
+}
+
 static int tegra_i2c_probe(struct platform_device *pdev)
 {
 	struct tegra_i2c_dev *i2c_dev;
@@ -1821,6 +1867,12 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (err)
 		goto release_rpm;
 
+	if (device_property_read_bool(i2c_dev->dev, "smbus-alert")) {
+		err = tegra_i2c_setup_smbalert(i2c_dev);
+		if (err)
+			dev_warn(&pdev->dev, "smbus-alert setup failed: %d\n", err);
+	}
+
 	return 0;
 
 release_rpm:
-- 
2.7.4

