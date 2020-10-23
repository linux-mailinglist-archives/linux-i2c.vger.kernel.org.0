Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96FAC296B17
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Oct 2020 10:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S375927AbgJWIXs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Oct 2020 04:23:48 -0400
Received: from mail-vi1eur05on2085.outbound.protection.outlook.com ([40.107.21.85]:31553
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S369593AbgJWIXs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 23 Oct 2020 04:23:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gT3qhf7Spnf3oYVwlbpaQYDY87ttM3kXxtBROAKrLTDT2bHdOAx9MiPqOrafIVJ7c+4l/rTxc+Hw98dGssty4Mz1NBXeiPsBsQtp5roN8gHKlkfDj58Rn0tQPa6dW/K7mFXS7Dr8FmFnxtBGXSDBYlWBjY/p5qWiR0O69J90VUaqB8pnTj9HizBIUCcNJ0Cfzwk6/OhVc4N7VTgc1zk7WdqbCQ/J/Lq55+26XTED+yKVmW0Lq07S6ThvK+3qcdq+5Bs0IB2iGObIXbbgQqI45uWq0c0hwcniyGfa+Sb78xS/J8oNGxwlI+CfwyO5c9++dTB0pnnOLmMuQVK8Q5tZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKfCW6ex1LncEkW/NqA2vfj1JSUgmn/Y8S/rGrO4/x4=;
 b=Z3uDiSelDdfY7kSy/BruwnQwVulmgNOjhjDmvAK22R11XT60NdB7PVjincRA8ZB6rgPHBvGqoJLXlS7Zs+uGia2okWUuwLEr/ZVS6/cUVQbNQhtedeooRhK8v5dn0UeWZUGZQGzr8y1UXgtXaBJGnEdVA0371M9uVgQy35Yuy4XALWS6GhHNHB2W0QvDc7aujB3zuRDerSs+DmHMSRxJoZy+FDmNTKEPt941n9s7R6awPDTH99fGmdsKMPZC7nIhc7+RIoofcQG5hZAmcqoNlb9QaGYqffwc7GDOQPYKmPlVQE1RseUVd9X3AGhj1E/OPoloZ944paR8doFRggl6QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKfCW6ex1LncEkW/NqA2vfj1JSUgmn/Y8S/rGrO4/x4=;
 b=HKYAq0LmfpD3JUEosmHm0/qKKjkJx5JfFslbMwH6S84/bR3NUOM2RIe+gYrJQd7kxVoVZvSMlZoJRxE6IvKNvMcAXoKMxFSrW0/fO3cvMGRFiuR5LUephVq71o0g15hkK63CgBWbtoOsITpx4q9F+nkQE1IJGM/ypOI/xjvjGsQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5465.eurprd04.prod.outlook.com (2603:10a6:10:85::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 23 Oct
 2020 08:23:43 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef%8]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 08:23:43 +0000
From:   peng.fan@nxp.com
To:     shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/2] i2c: imx: use devm_request_threaded_irq to simplify code
Date:   Fri, 23 Oct 2020 16:18:22 +0800
Message-Id: <1603441103-17735-1-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0148.apcprd03.prod.outlook.com
 (2603:1096:4:c8::21) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0148.apcprd03.prod.outlook.com (2603:1096:4:c8::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.6 via Frontend Transport; Fri, 23 Oct 2020 08:23:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: be642abf-3460-4d0c-2388-08d8772cf418
X-MS-TrafficTypeDiagnostic: DB7PR04MB5465:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5465D02FBDA20178D262A6F2881A0@DB7PR04MB5465.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6lRSCC5TIVl0Px7QO+o+igPv4tnKPnJTBRK0Ojo2bOIDJBjSEKISvzODGw7cJf6veuq27PrdAVSt9kmw9FWKsky+qu5oGCY+nvFh2BV1nO7y5WNSoFZPAMU55CtJGXfWkD+g3k7O+j/5BE/9GIVAKuMgr4CQ2PliQWocM6aP5Grmne0CnOwiY/P4/d+VjVpN1sD5lKUtzRlIs08vhPe2DIBdhG+TgkaEvCR/puei4aY/goNfMj+KDq70eEdI6SkGSdWvBG4KR0G8Xr+mJ71yNbTmDSXRUYtZl8aunVc+qJyPwVOiDbp9rRrcuWTvd+4nTmbhf8LgtgrgciWo0v5/eKFfwrCVGyZzUv1hkIcbo+6lWiCBuxDSwo1bV+kBG+Mw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(6486002)(83380400001)(956004)(186003)(26005)(316002)(2616005)(478600001)(2906002)(9686003)(36756003)(16526019)(8676002)(66946007)(6512007)(6506007)(69590400008)(8936002)(52116002)(4326008)(86362001)(5660300002)(66556008)(6666004)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: JBZbP1PFnMQOhOvMC9koCCTWnbrTJV2xfpDp8htOCKex4jNYXX7uK84W5UQPdhcgz/6BEpGnO3/fdu7AjofQCWWhBOI/S4FNLlMUShye7IBt68aHsx3KBoIIj2CLMmriGYjji3H5k3xaeZKe/slKjmjU3PIzAs0Jb0Ait7hsvvaO79aiBIsMOtc2W5hpX+B0rHNI8TrkxJRVjd4gMKttCD/vjD2YPk6AfnbD6KtB6ucdCcCSCD1CtVEhzq3jcDDDcAn4iSrxYUClRTjGYJdXBbV6aGZcXWuLAlxQ4iRC4Vgy7HLeThO5QvG4ps5apFMvsVJdo2eFX24g1VzBRo7RwWAVxFmUpwiGWUHoTcBRuGSprsraBZb7Jke+vNfyV1lpYt11PhiHIg1pL/IFEtmlT95gU2EEJ28acH6FtjcEu9hzMCjY1ikPUuUVFN9/ktAle2+CKALleMEYeg2M+cByBw4GVNttoPPc0YCXXhhqyQKJ6WtnsV7P2EcTfqsLOGDglBJwUmeE8jJlX+oF7MnXDyJHO9iEZ7QTd7aGECObNGgcNHwGiagofT74ldc+etQ/PYzq3tyZ8bOvxu6E97kQtiRXvZKaKZqTHG4Sknf+d5UyNcSalcL1MyQlONeuUbdtLlpUFxBPMuxdszAcopi4DQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be642abf-3460-4d0c-2388-08d8772cf418
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2020 08:23:43.3482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W39+UmJ+jVcANvM2SsiyA6TPxsqLsr+n+c2RPN+6AosIauRp67Ln1ymK6u9/oHWft8x94wI/TIyu6q41qx/kCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5465
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Use devm_request_threaded_irq to simplify code

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/i2c/busses/i2c-imx.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index e6f8d6e45a15..ba9d639223ec 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1216,8 +1216,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		goto rpm_disable;
 
 	/* Request IRQ */
-	ret = request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHARED,
-				   pdev->name, i2c_imx);
+	ret = devm_request_threaded_irq(&pdev->dev, irq, i2c_imx_isr, NULL, IRQF_SHARED,
+					pdev->name, i2c_imx);
 	if (ret) {
 		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
 		goto rpm_disable;
@@ -1265,7 +1265,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
 
 clk_notifier_unregister:
 	clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_change_nb);
-	free_irq(irq, i2c_imx);
 rpm_disable:
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
@@ -1278,7 +1277,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 static int i2c_imx_remove(struct platform_device *pdev)
 {
 	struct imx_i2c_struct *i2c_imx = platform_get_drvdata(pdev);
-	int irq, ret;
+	int ret;
 
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
@@ -1298,9 +1297,6 @@ static int i2c_imx_remove(struct platform_device *pdev)
 	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2SR);
 
 	clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_change_nb);
-	irq = platform_get_irq(pdev, 0);
-	if (irq >= 0)
-		free_irq(irq, i2c_imx);
 	clk_disable_unprepare(i2c_imx->clk);
 
 	pm_runtime_put_noidle(&pdev->dev);
-- 
2.28.0

