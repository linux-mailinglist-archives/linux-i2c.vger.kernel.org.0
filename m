Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E11733EA23
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Mar 2021 07:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbhCQGyW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Mar 2021 02:54:22 -0400
Received: from mail-eopbgr80040.outbound.protection.outlook.com ([40.107.8.40]:10718
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230196AbhCQGxz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Mar 2021 02:53:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQSijPWpDwbpZ6PRVq9SgzItkUFGzx/0kIJKzV1+TQ3gCeymWvioKWIYFE1cllwMFKh0/hROjQVHXy0NC+/jrsVxGZhGDQnjB/IKLHjQitzEHYb1O1ESHKkH4a0N/SM2zH0K+8Kj6QbnbB2F6S1Jel9NrDQ/kTGWk2NZFXTiZAuWPwtYtiHw8zt1zkem0GRmmIyFhBUfNBAxmA2emb5loiND6MRgZ/akXyL2+Ki9jM9r9j47gt4zjFGjj1kOE1qeblWsLEpGHsjVx0wIMLlep8p6g5WUicxnR4LWt7+BSqAUobVL4rstUsPYusY3oFamiH48YTB3InHnnxDtAqZwmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Se8hWqGvCo9wJQw1RkitCxcl2pq7EcTPAm1sjr//KQ=;
 b=JVNAkeXaXwogc7XkHh7euH6pR3lzpWQTovFlbUzgOCyzSjANSM7rUOczedxqMwwO00JthvwCwLyPA9a/5D9rO6V2jkHjevYA0OcZ4eqYZ4PKgM4SVloTPtbeM7S3/PHMFLI58KgXdeEJSIosL6t6Q3HOaWXk2YzNCzyid1ufZiwRF5OfebTQf4GTPs7JAqNIEIP2W6/oGapfnzT4JwIPVOZoL+Mg5IO+bltltWb2I5Koe6swG/2KSZTAYt/OYBBX0oc7XKEe6I2QRohLE5DF4nS24vv/1o/2haNWIx23qWIpLHSx26YEFUtXK922RIO1NCtmmTBnzm8ko2ppZMJnoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Se8hWqGvCo9wJQw1RkitCxcl2pq7EcTPAm1sjr//KQ=;
 b=NKN+px0ww2+yL5lbRGw46IaJGmIXTWzN8m2ZFbbGpIMturOXc39DCt9u7s+SkbdVYQ9kmnRGaHvmRkK1G6Lfv8lfO15r50iy3K/HJVctPWXoCbtJZq3t4XAKqtr4pRIc2FyhuWFHhOUfQqAtucLg+D4gh10UjGrqxJJp9wboYi4=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com (2603:10a6:208:123::11)
 by AM0PR04MB7091.eurprd04.prod.outlook.com (2603:10a6:208:197::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 06:53:52 +0000
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236]) by AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 06:53:52 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] i2c: imx-lpi2c: directly retrun ISR when detect a NACK
Date:   Wed, 17 Mar 2021 14:53:49 +0800
Message-Id: <20210317065359.3109394-2-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR02CA0215.apcprd02.prod.outlook.com
 (2603:1096:201:20::27) To AM0PR04MB5618.eurprd04.prod.outlook.com
 (2603:10a6:208:123::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by HK2PR02CA0215.apcprd02.prod.outlook.com (2603:1096:201:20::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 06:53:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 96b3eca0-040d-465b-8662-08d8e9116cac
X-MS-TrafficTypeDiagnostic: AM0PR04MB7091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB70918B80390FEF3611375249F36A9@AM0PR04MB7091.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IwM31GGqK8BF4WOu2azxXFYhwaGiiTrsM1DRwRKlAczaeZd1auXah5iCRCmXUhWWXGZWevDTsDTTSgx7z3beKqoTawuhj8cgXB1qa+jTf1KUybllT/ws8iNYrnNQvnSShqqaSE/tJBxjAHO8le0NnU2ib5px3TlxDWEq9kaVBrBCs4S8axJ7xL79UMI66KrW/tUVJBpUxnQ6B0M/n8hcqdpTC0qHjCQI//0m1B7k9ajD82M+/g2nFIX88vh8kG4LB/XIwoZiV8eLiXnpOa2uoKWdthyDW3JIvCn3V59qKyVxZUmeb6b1BY0OCnK5uVY9MBM5d3ePOL398WlmcbCFen2gUgfrIIfSsyRtG8kCdUAuySbWAtJ1kTJ0Dh49C3ANk5GU/rWlxAAfvr0SEQqjuk6WpBl0zfdYfRFD1PeSwEhjO3VGzOvyNAb/xap7sxY3c4h/573ZyqzOc9REUXeMNQJM3OSKVqp6M327ZJN1YwwFwcBExzhFrg+AetHRC1Du7D/pmjP75UMRmDzyjewiYWFSq3TY6606BJkkKCsgYD2+orXmcfwUPCcUfrL9z93JYXdM6wropGz0OYzmFEVZJ9V9VYZ4o4KhVt9sTQ5J7PXUggtPA13Na7BMrZEVt673
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5618.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(478600001)(66556008)(66476007)(69590400012)(6506007)(66946007)(83380400001)(36756003)(16526019)(5660300002)(2616005)(316002)(2906002)(1076003)(8936002)(26005)(52116002)(186003)(956004)(4326008)(6512007)(6486002)(8676002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NjvVRzFk502hwF/Kssyyw4GRVrONJ+v9lJhhtj0GWBhnwEUbKzvSG0THp+Y4?=
 =?us-ascii?Q?1DG7wQRbAmWpPh5PUBLfy4ArUDp6f0H78gJfJS/468yrlpU+QNn8BCFxFPH7?=
 =?us-ascii?Q?fwgpvB61CqUx3D9xgsXpXHr1KiobpCUmanUz0HeiZACd/uqcsOblmQVD4W4/?=
 =?us-ascii?Q?o2NlSs/2ITuuFiTd8CTpvLHjCMEabQwZtQCa7bTw0sT0DPK4po/lTCVWB2/r?=
 =?us-ascii?Q?9TK5YaA+U4/PVWw+G8zMyS6jYniPZZOh06J1XH64BMXSi3gIj+gakI5LmEuS?=
 =?us-ascii?Q?yLX2xOVO2u0hgG9RcAjo+WTfgnL0xUg35pG9KUWllBfB1QMwEsYst9CBef0D?=
 =?us-ascii?Q?tq0yTdTD8Ua4dEgXBAZSW5B+T4R/1aniKckEZgiHg+ONW1tehqNPk8G7jZ6H?=
 =?us-ascii?Q?Sf8WLW/7r1iLZCOL95StHFw1Ln86ABsgdngvM7rTSG1ehhC1dSvH2zs48pxR?=
 =?us-ascii?Q?jpKZVPnqjonMEu6mkqiT9Zjkl8CDOWoTrL1z0vjr1sjwZQe/BX0DhXjBvBpD?=
 =?us-ascii?Q?/tMBr+etz+AqYVnr1FVNq71swoW8V5yKaGlTRyQpir4H+vgfPUY0hCkJs89S?=
 =?us-ascii?Q?6oPs+2XVSI462dIrMuH9P171tUq42J6hl2i/wKmfT6HKx4YDh08+AEZi0XCd?=
 =?us-ascii?Q?Jvj8lozX64bMFqNlUhRznwEPOIQ+pP3qmB6bg4V0+/lMMm/mpvH8kd/OMo86?=
 =?us-ascii?Q?ra0yk7BcWw5PWQ5l2WnAqeLReRqm3TnjMJjtJq1N0+1qc9fx8kKL1E5STubR?=
 =?us-ascii?Q?geRDpai+sSxx6Y7UUZ89y/a84LWJlY1ued6aN6LtmRpU9eX5CeE7EUQRrR3V?=
 =?us-ascii?Q?KLDaU7bH33+TNqeVaV/+Mwgy1TK4VVtdkdjeIyyubRJ+LBD2YgrDShGO/mTd?=
 =?us-ascii?Q?t2uWcO1zlxefZ8e/hCfyAjtP6rcvY0Wmg/IBfq/TkBxMAcGw/ghU1GhlgIcF?=
 =?us-ascii?Q?NX1bA5AaQ+nj1ZS5nby/nRiIkDtTc41DYD9S4NYKHS//BT/ZjdaFga0vdflN?=
 =?us-ascii?Q?FccDNFPcf0h0ys66/wOyWzke3gBChLld04SoFrqDbovs3MRBvWyxhqwDHwyL?=
 =?us-ascii?Q?XJCh0/vwRNjG4zPfvH+qYdYgZGaYIeGrwhLHfYbvI6/PW2L6oT2VR25ENPN7?=
 =?us-ascii?Q?t7dJEXkByPjRDTR2hwINSOkVn0tlhdTM63T0YeTIKLdlO+6ucTes0Egs4RnP?=
 =?us-ascii?Q?Fj3buBhFIckMYlTBQZ7TFmUbUno98QGgwetsCG0t6YXEMqr5xo8rLZXTdNr4?=
 =?us-ascii?Q?2u8rLXEVFwLCqEp/iZVAyn+16JX4Q9mH+WYCI+CpF5at9vgv9fM4lCSKCwMy?=
 =?us-ascii?Q?bJt57BECnCXaO/Yt3mwKHwkk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b3eca0-040d-465b-8662-08d8e9116cac
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5618.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 06:53:52.3464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAYj9Q1EKiKIAOMBMSNuE431/uFlI9RGwimzhYfU7+lb+Fyfh7yuLI5uIVpaom+jEVZey5wZs7nkygDJhvtbww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7091
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Gao Pan <pandy.gao@nxp.com>

A NACK flag in ISR means i2c bus error. In such codition,
there is no need to do read/write operation. It's better
to return ISR directly and then stop i2c transfer.

Signed-off-by: Gao Pan <pandy.gao@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 9db6ccded5e9..bbf44ac95021 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -507,15 +507,17 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
 	lpi2c_imx_intctrl(lpi2c_imx, 0);
 	temp = readl(lpi2c_imx->base + LPI2C_MSR);
 
+	if (temp & MSR_NDF) {
+		complete(&lpi2c_imx->complete);
+		goto ret;
+	}
+
 	if (temp & MSR_RDF)
 		lpi2c_imx_read_rxfifo(lpi2c_imx);
-
-	if (temp & MSR_TDF)
+	else if (temp & MSR_TDF)
 		lpi2c_imx_write_txfifo(lpi2c_imx);
 
-	if (temp & MSR_NDF)
-		complete(&lpi2c_imx->complete);
-
+ret:
 	return IRQ_HANDLED;
 }
 
-- 
2.25.1

