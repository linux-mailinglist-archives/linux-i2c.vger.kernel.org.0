Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDE9355228
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241800AbhDFLdN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:33:13 -0400
Received: from mail-db8eur05on2048.outbound.protection.outlook.com ([40.107.20.48]:33152
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241735AbhDFLdL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:33:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIK4ke1+BSCJ/h9HRn7shqN+sK8Aq4bbbsPmtRSEKIYzKDDWR1IQPRJxRN3jBsXabt27DhZIOuqUIC2JFuXxLAiQyWb+Qln5wi/tL5pbk/k/ch9easPLlgUGP4ZoI+d3NXbms2T3BRuF5vw08+Q45nZk44Gvei0jL+WDzgcZVDcyarOC3pI/5CoZN2sIVjVJ1kY+PFtgqyjDM9s7OgiYq+rXkxwhbl3+EtxOVupdprb5FRafmkmKoNTAf+CmZWHK5pPyhcXjvIFl1KWfeUYrH/R4eCG0s/0++dlDDee6lUhx8ZJgI96MIwBdgcf/VJM13juhJV4//Ze3eL+77Osy4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+VY+rsjT/BGHI5/+IiuUFsFO9vzTd2P9vRixHslR28=;
 b=bXrL2TN7VbG7s/vb+tgAhNbwWopWJgexDMVIMr1Asnlk+T7BcRZC7uMJLGJEP8Y2LEAu8CnLQqfjlWxKQ8FxXBtfBRzWZrNHcps+GPyTlf98elqygo5FlRpYDrx9s6AEdsxPhWLkA6u+c9vwijhO7q0sV1/9Nf4P/RgCL07Z5+LkyOMPrDM91RDY0bkJU4Eup5LiYP+9CYJZ7fDCmtey2P9HcQ6MYlJ281FnkrDxMlnwRHeT8t3pMeHfta7N4q5G8VOad8ovDRPfvAtfjl3KNmzbKF6lWBJz0me37k3X7i+NYrO9vJ74hki4zP8o65AWnCUBZWe/0TM1FT5kyQc6Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+VY+rsjT/BGHI5/+IiuUFsFO9vzTd2P9vRixHslR28=;
 b=OWWW0DZE6cSJROai3Ud1kLghFM10v5Gst/GCXoOebpR8mvdMnu+7ka5ua+AWIdvrLWK4w8cCC7MwDxKAoLuaq5a79MdacPRFwY6bnDA3gpbU5chBUEEkOX561h5ZC3HDh1US74oYAeX5AqBp+UwwZjEYXzcxVVzduXTSUAtktNQ=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM6PR0402MB3765.eurprd04.prod.outlook.com (2603:10a6:209:19::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 11:33:00 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:33:00 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 01/18] i2c: imx-lpi2c: directly retrun ISR when detect a NACK
Date:   Tue,  6 Apr 2021 19:32:49 +0800
Message-Id: <20210406113306.2633595-2-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
References: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR0401CA0010.apcprd04.prod.outlook.com
 (2603:1096:202:2::20) To AM6PR04MB5623.eurprd04.prod.outlook.com
 (2603:10a6:20b:a9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 11:32:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63945085-8857-455c-8ab5-08d8f8efbb76
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB37659ED59BE4D01A6E3F2E16F3769@AM6PR0402MB3765.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xgB/DcsxSMNLnjn302r4GgAn6vYoFtr0qGu2mJmGZo6KvrjniMZd28IMoc3PLu8cAJWvb9igHrdDwdXzXKIMWaFpv9OXrYYHVTQJEVznJ28sM5upsbjMHBYpNXsmmfdS8tU+cERoQLo1yJ5N9wEs2pikYMLl25256iG2KEhNyt/DN+QanU4p5nL2CYeQhe30ocPRhZaGPEi6lcR9B9e/NmlV4wHruK/11VNtRx0NyGdpNGrvzVcwVQ0t4IM729uhQdczure+uk21IeyiRV4JHvOE2yxk0Sm8Nu0VTUxhp3YUwIaJg9KPViWZpWTWMfcom1MZZWLGSspwaA3VjgHIcmpYNN2/US45upfSNbjulaiiK0KknjCaNltWhy3IJ1jU2r4wt4O7CMgsFKhjGp/3HWQjOnloO7c9/u961cSxwCJFllqsiBi/UVI6iKAtT75xPOwXEXZwO7w9t+SspD8Tsjj7DIUGKr6+5Ttecyo0wuL2UutwCMkfcDAsDi0SZq4vbm8vAFDajwkl3UDy0ItnDo7PLMN3PU59e5P/UU9VQ7AOOeRxE9ZBSCHmXnas0TuUeJbjjt12JL0t7/pVKYNJCD0Bu9w5WqV/pH6/0nwNQb2nS8/f51zfzgNVeh21k2/hscxlBgYX/cwzcx+u0FXE4bPFAo8f3sEKKKkEzaSr9TgDvpvupjIXO61jQipIjvHCBr56ZAy/dPOpB3nrKwO+sAXXoR70zqCTBhy9DanwCZ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(69590400012)(66946007)(36756003)(6666004)(38350700001)(66476007)(66556008)(498600001)(83380400001)(52116002)(1076003)(26005)(38100700001)(4326008)(956004)(16526019)(2616005)(186003)(86362001)(6506007)(6512007)(2906002)(6486002)(8936002)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rDZwYgFijkR8Jh/MYbMQOmOEi84NzvVBp+o+Z5fs3UaGYypsj/ZQupVukUSB?=
 =?us-ascii?Q?twGZ+nv/gN8hMZ4zCLkHBgAT5nfA53bNNXKjniIvyqTKpXYjibronyNzQ689?=
 =?us-ascii?Q?26iLZ0BZ1zeIZhYxKvKlrYiEPwoGuxuLEyDgtjpSCO07lXa2h5r69OxmjUm/?=
 =?us-ascii?Q?diwEMhl1e9QXtsQDM7liFqVx4Jwotuq7yKvpOhNniHeH1cGsrFtSbneg9ODV?=
 =?us-ascii?Q?5T3NtrWsHEfC+mA2Xvy/nxPgGaF5gjv6o+ZCnYhiANAAw4x8PBo4Z5DiNp/7?=
 =?us-ascii?Q?ADwhxpqe0bUghK5ogenDPVr7fUrT5/eCThD8f+XUg4MLmaLHlZT9/ljCVWuj?=
 =?us-ascii?Q?ws3TxoYTE2Nq5fFvcBWG1co0lNBr+PYazZMXqcEpI4wbYGImYbw1RQK8ZL0o?=
 =?us-ascii?Q?vhnbW8Pgi00tgVAUR+BoKywOSpExa3l4Y2vAAVN0Th2PZo6H0xMUgd73qMuB?=
 =?us-ascii?Q?dSqdg9ITRS026yHsARru8cGRUAsQK/A6Wpq2wmrxiLrnwDe1JvKMNt1vSKn2?=
 =?us-ascii?Q?8BZvvBmjp55jMucjRJswS7TamQjE2b54j/wDMeEVr+nnE90VPMmmOCmHq6qf?=
 =?us-ascii?Q?4EzcU+5Pl3oXjBsVIA49IhyRofJtaPcvICEeR0ov9RhPRAYFof6URuW2Ct3D?=
 =?us-ascii?Q?1k/ygIzP8Q58P1GzWzly3dqfgHWUYmovc661GZmZ8kdxTBs+zX2wzNKP0WPI?=
 =?us-ascii?Q?h9xKgVE/AGYFqc4nBO+rQyWxeaOIzCo0RqhfM9z4vkzjqOeVusKBkmnIYwSp?=
 =?us-ascii?Q?3O385zA0prr3pX2HWvfj93iXpL04O8xVnX2BdupIhnhb/hRpT8Wv8pNd2qWP?=
 =?us-ascii?Q?4QeKzIO6Q1WwY2Asx53AoMD3YqmFW9W0ojIEPvcGIna6f2kLOsTxMTgMiEp7?=
 =?us-ascii?Q?iaC+Igs1loTU65Mc+GxtVN4O8f6IK9BLt+1Zaalo9FK0k0IUKj5O+5s3j/SM?=
 =?us-ascii?Q?9/Js0FsZ27l10+1mq6oifGP1F4zBaG9GvLl51pYSOegtzGKBtqzhXztsU5bx?=
 =?us-ascii?Q?BKiGtnUSlfYcpgtITj/yQEWoHVWKsrcMhFaHRXOwnaXe1uh2pIHD6S0wbzYx?=
 =?us-ascii?Q?p/7PfgNs9TOgLaSZYySaxIZ/ZskWsiEs0EoHkW39yomwc6r9M6AI04wzcJ5E?=
 =?us-ascii?Q?dRErBoWfYdfNADErcu4UXGYkqaK+F6nCODw3K/Q46rYDBjEA/w3SErlavxFm?=
 =?us-ascii?Q?cqX3iGI/u/RmXUJf4/zOqK3zzh6Kk3WzifDsyqiYWYW34j4hLNm+T9krCnXj?=
 =?us-ascii?Q?G16lZ5pnjiBHQdw+4BJwy2X2Hfck7zksoAfEtoQ63+iUkWEJO8EWl7kbm1Qi?=
 =?us-ascii?Q?73oFhXNkTf+rrVKG6OA9oeb4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63945085-8857-455c-8ab5-08d8f8efbb76
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:33:00.2583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9lbOy0uRy16SAi25Z8wXHCOSZjCy8x+CAe2VdUVpXbMTwnAO5aeeKIiVNeOcGTFs6b4RwO0Bx/qtlEuMbha6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3765
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Gao Pan <pandy.gao@nxp.com>

A NACK flag in ISR means i2c bus error. In such codition,
there is no need to do read/write operation. It's better
to return ISR directly and then stop i2c transfer.

Signed-off-by: Gao Pan <pandy.gao@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
---
V2 changes:
 - No change. Has been reviewed by Dong Aisheng <aisheng.dong@nxp.com> in V1.
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

