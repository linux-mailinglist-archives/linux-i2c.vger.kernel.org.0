Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C260254768
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Aug 2020 16:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbgH0Otz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Aug 2020 10:49:55 -0400
Received: from mail-eopbgr70050.outbound.protection.outlook.com ([40.107.7.50]:53991
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728223AbgH0Otw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 Aug 2020 10:49:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYbk2EqkRx8EX+Ga4RK3jq71mfPj3KPRTsMvpk5tUZLKRhX5iRPE9uj4M39HLM3G+itWD8hkHPvnR8nsEUwj4s5CTr/iGirB9cmloOIltKkDP50cELIeNosv/ousk0D9bqoisJ4zuqeIe8unjdSWZQZDlIQjuqoM8BToxHDehDfY9uJuh24hYwD7zjoHhXVBww7YIqI9Pty7spcLUv/mSeZT2rwC0uGP3X6as9DzbJFOGsvWGUuJNMhx/b2ecDCwwLT6xJX9XLx3O0fDTaBxYOjmH5cIF62Rx3IbhqyhIjE0EZTurRqjRRItIGY3AOmDR9VCHxiSNew884E8H2CbOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FyRWKlnH3yqrOYB1lc6uTar5eM9GhquqGnjqkqAoiU=;
 b=BitqtHNM8Sa8vLV1Y/lTknGbl03LRXG0qhkx3opxqx1Fh5+CY6CmgwvCwqDrTqwkhBSli1RQSznhTpMr34itCIof1+JPikxyN6G4MPLOEUrm1B5+5etC47ejh2u0SdOQF40GvQpn2MQPyW1YcqBnqrWlFf5cIBhdkn1D3/q5uVgYdnMPEBq3/svMvA1/fpc+VpEypmWGsV1gNm6bR8K6DWU91yHQCck9SjZahnk0jISClf4HnmUnlYtpt9Jqc32YTpaF8ON4F2qgPmaRuE5+Pvs5W4Y0dG1N92Zxw9cYwArdCYZBonScx638fG6ubT0BlQqfmZnRxGgcjfQY7C/Sjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FyRWKlnH3yqrOYB1lc6uTar5eM9GhquqGnjqkqAoiU=;
 b=hI0+nfeQ2gz34SA6PoCh1+DTJj4bjrFyytrgwAPBDxirmJV8ffSzMNT68emvo76qe9HMD6KRwIOMCc3JH2/4T2gnFyjBJI9sP/MTndX4LG4MXhvbc2M3QNsxKU8wglZVcsU/iavSCvDRn1R9tT3pA/Z2L65qODT2ugxLhzXDQ4Y=
Authentication-Results: the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=none action=none header.from=vaisala.com;
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com (2603:10a6:208:107::25)
 by AM8PR06MB6852.eurprd06.prod.outlook.com (2603:10a6:20b:1d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Thu, 27 Aug
 2020 14:49:36 +0000
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3138:abae:774c:ae7d]) by AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3138:abae:774c:ae7d%7]) with mapi id 15.20.3326.019; Thu, 27 Aug 2020
 14:49:36 +0000
From:   ext-jaakko.laine@vaisala.com
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        linux-arm-kernel@lists.infradead.org,
        Jaakko Laine <ext-jaakko.laine@vaisala.com>
Subject: [PATCH 3/3] i2c: xiic: Support forcing single-master in DT
Date:   Thu, 27 Aug 2020 17:48:48 +0300
Message-Id: <20200827144848.12107-4-ext-jaakko.laine@vaisala.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200827144848.12107-1-ext-jaakko.laine@vaisala.com>
References: <20200827144848.12107-1-ext-jaakko.laine@vaisala.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::33)
 To AM0PR06MB5185.eurprd06.prod.outlook.com (2603:10a6:208:107::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (193.143.230.131) by HE1P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 14:49:35 +0000
X-Mailer: git-send-email 2.19.1
X-Originating-IP: [193.143.230.131]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86d74c9c-80b6-4a58-335d-08d84a986ae0
X-MS-TrafficTypeDiagnostic: AM8PR06MB6852:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR06MB6852EFF4954461A6FB194A23D4550@AM8PR06MB6852.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qm6dm7bVoFC2Uh6R/LGfp59j59+6OBB0CKqW1vrjnG1yfo7VKlhCAmbIt9qwT6A+DkGcqDCMaaTXc7hyI7SoyL8xIFbmYEFob73KQ9ZjmNUmjP7/BP2+zJBc6n/7ACetvW99ja6ClwulcOi1MrJSWBrjMffsYc1MPShVHC7nMWXQKzN6t0jBkXSgknfuUqMnhi6tBKy5RpYVtZ3RF3XvcSgd/tOdmyGm5Hg0h2i4R8vjsd3YlY7QKdQHq7hXdvQUytVc1RSVio56CmYfDvonRJjZ3iPPMB5cDpvZ7zBpc1WOyap25ofnoM/2D8sdcUUC4+2+f+rN2K9pi7dmbKJ8+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR06MB5185.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(39850400004)(396003)(6666004)(5660300002)(478600001)(1076003)(66556008)(66946007)(66476007)(8676002)(86362001)(83380400001)(4326008)(316002)(6916009)(8936002)(6486002)(2906002)(6506007)(9686003)(26005)(186003)(107886003)(16526019)(956004)(6512007)(36756003)(2616005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: efMdoaMnHzSTYsHylJhXE/Z+2Uu35Umf4O5WUO9OPa9+gyCRhcyq4P9EVb+jyqqEjuKgjIcB3mGv/8t5bwpBcJv8n4eSDW3XcuYinKbNTCkZu3ZhJogy/3rGOiTuViZrXroIveQoeRyiQfm1ONGaIahQLKnKx3VPkoN36inbmBt3M3mmcPAL71goM3HZRCTn8O/nLUR+PrUHK3jH4fI2aLltZUV3MGEdrB9fr55oCfxvwLwu2QEE6b8tXcsu7kkbNbCwejso/wzy8sZGF9RRE1XvczSvg77biy8OR03UducoOpjS7CQWRfMXY+scba2y0DQncXpWYiEGMUpEVN+Xrb6OxiPKkMtBBxSHwmo/HdsDtaeQLRjXigTw4ehwD96DWQYg7hVd1N2Mu+HEhtLvBl8aiAAW9zyRNqQeqoYX1oZ+9v8Ia9lHWHA6Q1wxCrR76KnW4kb8wme1GH2u6+ZY3EjZbcsx82R2+uyWHNGf52xIZlPtk728lyu7n/6PQCzErD5UnPfivNMiDafVm0h88cswH67NfsYokjtFX3mnR1y93ClE0qfjRTaZsdcux/+ASQ0Fu5t0fkr5INbZT7RZYk+03Hlo8ULv35h4oJBB4WMVQFCI8xraGLRakh17+gkgQuhpOkIXV2cCNggDYmFzzg==
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d74c9c-80b6-4a58-335d-08d84a986ae0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR06MB5185.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 14:49:36.3706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mad/N0j9Hi5BV3NIMJH3iBojO8S5m4nSENkso/dhGOCd6i07QBYJ2mkOwSHiG9eiwjE0Y9s/XwhKqs2M77bw/eBC9UDwIaYalABIuA0Wuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB6852
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jaakko Laine <ext-jaakko.laine@vaisala.com>

I2C master operating in multimaster mode can get stuck
indefinitely if I2C start is detected on bus, but no master
has a transaction going.

This is a weakness in I2C standard, which defines no way
to recover, since all masters are indefinitely disallowed
from interrupting the currently operating master. A start
condition can be created for example by an electromagnetic
discharge applied near physical I2C lines. Or a already
operating master could get reset immediately after sending
a start.

If it is known during device tree creation that only a single
I2C master will be present on the bus, this deadlock of the
I2C bus could be avoided in the driver by ignoring the
bus_is_busy register of the xiic, since bus can never be
reserved by any other master.

This patch adds this support for detecting single-master flag
in device tree and when provided, improves I2C reliability by
ignoring the therefore unnecessary xiic bus_is_busy register.

Error can be reproduced by pulling I2C SDA -line temporarily low
by shorting it to ground, while linux I2C master is operating on
it using the xiic driver. The application using the bus will
start receiving linux error code 16: "Device or resource busy"
indefinitely:

kernel: pca953x 0-0020: failed writing register
app: Error writing file, error: 16

With multi-master disabled device will instead receive error
code 5: "I/O error" while SDA is grounded, but recover normal
operation once short is removed.

kernel: pca953x 0-0020: failed reading register
app: Error reading file, error: 5

Signed-off-by: Jaakko Laine <ext-jaakko.laine@vaisala.com>
---
 drivers/i2c/busses/i2c-xiic.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 1453d82bb664..087b2951942e 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -59,6 +59,7 @@ enum xiic_endian {
  * @endianness: big/little-endian byte order
  * @clk: Pointer to AXI4-lite input clock
  * @state: See STATE_
+ * @singlemaster: Indicates bus is single master
  */
 struct xiic_i2c {
 	struct device *dev;
@@ -74,6 +75,7 @@ struct xiic_i2c {
 	enum xiic_endian endianness;
 	struct clk *clk;
 	enum xilinx_i2c_state state;
+	bool singlemaster;
 };
 
 
@@ -526,6 +528,15 @@ static int xiic_busy(struct xiic_i2c *i2c)
 	if (i2c->tx_msg)
 		return -EBUSY;
 
+	/* In single master mode bus can only be busy, when in use by this
+	 * driver. If the register indicates bus being busy for some reason we
+	 * should ignore it, since bus will never be released and i2c will be
+	 * stuck forever.
+	 */
+	if (i2c->singlemaster) {
+		return 0;
+	}
+
 	/* for instance if previous transfer was terminated due to TX error
 	 * it might be that the bus is on it's way to become available
 	 * give it at most 3 ms to wake
@@ -811,6 +822,9 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		goto err_clk_dis;
 	}
 
+	i2c->singlemaster =
+		of_property_read_bool(pdev->dev.of_node, "single-master");
+
 	/*
 	 * Detect endianness
 	 * Try to reset the TX FIFO. Then check the EMPTY flag. If it is not
-- 
2.19.1

