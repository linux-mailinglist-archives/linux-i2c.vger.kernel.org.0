Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EEC04D0185
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Mar 2022 15:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237180AbiCGOhr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Mar 2022 09:37:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243299AbiCGOhq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Mar 2022 09:37:46 -0500
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130058.outbound.protection.outlook.com [40.107.13.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD6358EB58;
        Mon,  7 Mar 2022 06:36:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=au9m9QsSphPB54LZgseN8j9NyUBK27I9+UWlfBinEMYCUfhXJc+i5M32ZyUfALCR3onTc3vSMLvwQxFI0jUCp/fFEZtoMtbkK/vOlQIsp0rFAK/WLTfXJZkrkQBmBoVmz/RdVp//3n7QgPwNF2tnnG2RVb64SxURwG88nta2ms3Sgz0ISBtnF2AI+BtAzviQzvE7DAVA0gXDVLeSXHCnch7fvo2reszE3gm7vriYLNtFWWvLN0glxYWLG643Opw6MgqT+7h1DXy4Nd81pWMgFVuVhikCfbwi5Kpwe6DVRwQFb3pecOeCBIUHSXOPSPV11hw93i/SYtuxg4IMIYxR2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2aIDEB8QD/DdQSyTeBW4Q0gGXaXcgl4YQEkDDykEmQ4=;
 b=nRdEaQ5hsqHFusmJ7NeQsVcEISz6cOgc95c9lbrT0XiZSQ7XrpSmpj5bohWH+ycVrI2RIOOMtCRs1j5H9dKmfjuC8Hm1EjSDpVOwm+YRbl8vg1F66UMv2bIGnlj8MImes5GkBHyipKYdeVqFEHajMUMGeRQoQsjuLk8njEb/TOcglhQAoA98/jQwgEL/ObUIlmrpxVqBFJfcZNecyP2gBD43cn4T95cWUSCcyvdbQnQuyrW1wICSf3wCuEZ9UmPU7umI1y96rjjH0Hcc5wfEoGrfJqaZGxP6isFA5LggieWRGwS2cGkIkaqYiz7vfph8WX5tkzy+jtJPsEeKK3Ew/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2aIDEB8QD/DdQSyTeBW4Q0gGXaXcgl4YQEkDDykEmQ4=;
 b=dfDhYGVxl0SaO1ARnogpOVMRHmOPHN/Rw7Vclk9L+Pb73+qYKrly/NOPqgJAWAag37RNSthvViOJ+iUmnJG5uZlcXvAsGTejpDMFWmk6/UOrgbHnE85mvHSbN1FjhiwSXOZyrZwuceu5fx3W1x3QfSNLh8M/e9GmiIvRe7dmd12/ypnm8C7EGmeRsWxwaBvz42QC3TzbHFRuvUodPpAAqqLUmr4/6Gow47KPnS8BUd28Q9r2amtn4q+JIFPcENuSAY1ctn2cMqQb3SRfZ5GVCgP5l9Wt1IFzHw0a0826aD3QVec6IUTylImKfYoCB+3Mda99phFQvdAS7zG3NM03hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
Received: from AM9PR08MB6999.eurprd08.prod.outlook.com (2603:10a6:20b:41a::7)
 by PR3PR08MB5787.eurprd08.prod.outlook.com (2603:10a6:102:90::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Mon, 7 Mar
 2022 14:36:49 +0000
Received: from AM9PR08MB6999.eurprd08.prod.outlook.com
 ([fe80::784c:5631:d38f:9a63]) by AM9PR08MB6999.eurprd08.prod.outlook.com
 ([fe80::784c:5631:d38f:9a63%6]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 14:36:49 +0000
From:   Alifer Moraes <alifer.m@variscite.com>
To:     linux-kernel@vger.kernel.org
Cc:     eran.m@variscite.com, festevam@gmail.com, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, linux@rempel-privat.de,
        pierluigi.p@variscite.com, s.hauer@pengutronix.de,
        shawnguo@kernel.org, gaopan <b54642@freescale.com>,
        Fugang Duan <B38611@freescale.com>,
        Vipul Kumar <vipul_kumar@mentor.com>
Subject: [PATCH] i2c: imx: add irqf_no_suspend
Date:   Mon,  7 Mar 2022 11:36:30 -0300
Message-Id: <20220307143630.28697-1-alifer.m@variscite.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CP3P284CA0108.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:6f::23) To AM9PR08MB6999.eurprd08.prod.outlook.com
 (2603:10a6:20b:41a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90f968bc-165d-4abd-e82d-08da0047e986
X-MS-TrafficTypeDiagnostic: PR3PR08MB5787:EE_
X-Microsoft-Antispam-PRVS: <PR3PR08MB5787B172A68801D59FA0C73E87089@PR3PR08MB5787.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IP4w20tcM1M8BphI9zrCOhJjZsAT6YxPQglI9aL1GST013E4g1+n8WjXN6gJ8JeDpv/CIVz2fhZJ3Qd8/EGyZNmL69a6vrkdCmAWY9+p4sVXS/8x7WUHOBFpYxaKsa8uS9JV416fVNKbHOX+YLQjff6p43Po+6ATaHH334gELwCAP9ShZ92MqAhq2scoJRf3/NgnZ/yfPtm6cFdMLenQxk3OvLa9r0WRpRomLtgubaSl+15Hv6f/6+CRYPC1S1dyXnDveTP16NLIlubm/VBT2H5413V2UER3ijzu/fo6JzRXsVhFoKhrDC7G9RJ1gzqFPgGizcZ/Veh3YH7PwHZ/SoVCs12gAvy7VLRX0Ze4fJ1Y7e6oXl/atodbvvP1ARDJxVKGr5gp0bULf39W2kUr4lzRfobJbhrL2Py28zqt2bp9ROcKSZeygxhSfbJdQiyY3HOgj6EvB6Zo0HufEye0UEQaiA8zdvbujb3Gm6+hU9jJRWdnbDp7JXy6jUwiGzLwtf0JYsphSzaQtgXDtb3N9FKsc1dT3ajqbLGtnp/EVc/+XHXdlZwEz3qsVmuase4uFzItUH3BH+BfcxBnQvXP+wINnsGJeiDsheOtiGyak3M0lvGQxEJpzCwwvuUNmqn4X1PJhi8ZyYURn0Ul8WpYK/PyUkrNT03nx+P9vGb5ImY8wsm/8L/UEREjyNdlIf0zBtNdWRjoiX2B0MmjZhVEJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6999.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(346002)(366004)(38350700002)(83380400001)(186003)(26005)(1076003)(38100700002)(54906003)(2616005)(6916009)(36756003)(6666004)(52116002)(2906002)(6506007)(6512007)(86362001)(66476007)(66556008)(7416002)(8936002)(5660300002)(4744005)(6486002)(508600001)(4326008)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nl7SoX3TacsjUo5QeEmzNi34oLRMeFQpHhX0tEyNhOJKTtJdODpBTyVnbiTj?=
 =?us-ascii?Q?04pcN5YQEOaPuUOYxyikOMpeo0+0I+IxFnxYBAKQ+fTzo7XtUjuqKTSB5VSi?=
 =?us-ascii?Q?m4lIbDsJ2SUwGpfUlXuwHZLizoUmwnDDV/Fjert7Svvt0otX6XrIq/sBCcpy?=
 =?us-ascii?Q?vA3qx0Z0IRE8QZaxXQDDZ5N8/BT+G/kKXzRg5TwQHdpYtVIFwugyR1Gvgth7?=
 =?us-ascii?Q?EssyFhnWUFB1J5BE//9BVfECv7FwFbd5OGxOlmK9HtdUNbQIeYUXlpAXN5+u?=
 =?us-ascii?Q?kgB5TA/7CMuuvbq2kL9km6C8K/HdCQB2KSEl7+DBQSKklSrZPZp3GGkd5rdE?=
 =?us-ascii?Q?O7hwt+dfxHKJ+doQQAmgPbQnR+4U2NzQrZlWojUQtCLgr+KGqCAjBtPTQexg?=
 =?us-ascii?Q?pt3ahchuZ23h/40qV2Nwfr8OA039s/TCxR5unIjOgi1o6w3ngZdzJrMqzIiU?=
 =?us-ascii?Q?p0ouxzcD1RERW/1D1a0ZOlCxZywkBjG7OwcBgZ5+StDdUoYjNZ0IDc6d2bRF?=
 =?us-ascii?Q?uS9jDZVrLjeR6+FtqqB8sN/sdFBaeFICTb/OQJA7qXnt+o3ZCgCyAR5d0gqw?=
 =?us-ascii?Q?4+4mzv2eGIUDle8P2fS4fC7WACRNpLaE0aIoWTkOYIPCi93IqFmwpFi2YoaP?=
 =?us-ascii?Q?VFLE89R565dI20TgMqXNIHK28CjEwvhWpNqJUTnmQwP7hUF4CT3aN27UK596?=
 =?us-ascii?Q?yqCxcIVhYNLmYgnc0VYnPssOmUK99AGoKln48S4LzxjEdKfUtr4pbr29TbNR?=
 =?us-ascii?Q?6dE1dDFk53Trg5nDj1l/a2hMVCJY0C6lygKL6h2bI07R25IR09Ux4r4sG9oB?=
 =?us-ascii?Q?mWW5o9CwBoqzctbLNbmP1opTqxL2H4/CXp4qgTGTjd94FGHYDbqIdJ3IvWqT?=
 =?us-ascii?Q?aR/jSgAFHw3bP/cteF7toyz3TORlVMSSC49cfgNviQ8FWOTf1vS4YUOotAZK?=
 =?us-ascii?Q?c1y1zR6F+ae59Xjjmi9APAv2P/sG5KPaNU2F0cRIWVThfNOA4tbO8QLfdocM?=
 =?us-ascii?Q?kUc66cVz//AWEUQfRDlznV1IZDsAC3e6HciyZZoGZWNZtYf+cqV+dn/yylsM?=
 =?us-ascii?Q?R01bkKudotffb0UXIcjKv6LXIjH257iaL2Grxc2gxXIKFYykmyMlryRg1vc0?=
 =?us-ascii?Q?KTvc4wl+WvE2FlexQjKyDZr208zZkdN8m4uhAczeulFjY8FQ2uJFMxJwQUoD?=
 =?us-ascii?Q?0nnjd5ZiOgb/wM8GN+pRArlRJY5m6efUY03kml1pmY7xS7IXoxOd6F4BNsKJ?=
 =?us-ascii?Q?WYXb3qngIK2F0xEN1hrpVPsufIwnnV4k+CDjqNGc+CRbn6dSGddhncn4d5bR?=
 =?us-ascii?Q?ThYjlhU+0dq+kzRAU1KhUJgqQdDmIXanLDxl+nWgludvdLqn0wjE9F05Xtxu?=
 =?us-ascii?Q?M1wPjmFznMCXZYc0qjxybnDXuARCWxdGBE4Dymr9TRQY3MRVtQT/yXmmg3Wx?=
 =?us-ascii?Q?31QtXdafTggjAx00Bvlho0VeV+Fc4Sch+WKCRPUnX6Qx5X9A9gUumH4BIngH?=
 =?us-ascii?Q?XV075XNNNhnazmKd6QH1dIAL39XOLeMQFFNM5RZGv81oI+zpE70/wRykrED4?=
 =?us-ascii?Q?TwHPOCTYO1WMZFIEbAcWfzeHw05HUITHBLR9fgFPrZfuwF2YCEkBUKuBgavQ?=
 =?us-ascii?Q?npXjBYR3H4dJ6uGv7u9B4Gs=3D?=
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f968bc-165d-4abd-e82d-08da0047e986
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6999.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:36:49.0550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxmgr304JkBKi82PZYeW7u8DB9MZoC2ovr408CGDKx2t8jtzzuDRT19ZL5VMD5N817uh5QzL4gRw58lt+l6JhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5787
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: gaopan <b54642@freescale.com>

The i2c irq is masked when pcie starts a i2c transfer process
during noirq suspend stage. As a result, i2c transfer fails.
To solve the problem, IRQF_NO_SUSPEND is added to i2c bus.

Signed-off-by: Gao Pan <b54642@freescale.com>
Signed-off-by: Fugang Duan <B38611@freescale.com>
Signed-off-by: Vipul Kumar <vipul_kumar@mentor.com>
---
 drivers/i2c/busses/i2c-imx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 27f969b3dc07..fcc09a1e7f44 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1478,7 +1478,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		goto rpm_disable;
 
 	/* Request IRQ */
-	ret = request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHARED,
+	ret = request_threaded_irq(irq, i2c_imx_isr, NULL,
+				   IRQF_SHARED | IRQF_NO_SUSPEND,
 				   pdev->name, i2c_imx);
 	if (ret) {
 		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
-- 
2.25.1

