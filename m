Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E27BE524E30
	for <lists+linux-i2c@lfdr.de>; Thu, 12 May 2022 15:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354361AbiELN0V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 May 2022 09:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354412AbiELN0S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 May 2022 09:26:18 -0400
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2095.outbound.protection.outlook.com [40.107.255.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E66C3CA56;
        Thu, 12 May 2022 06:26:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjwoFJC5qtM95UuXaLL1LgzbJdZSmGVOyfeEo0VOV1ogDVUe/GHhKJJUE3dEwiTJeVZvEHahCwZU92MJzL8OvBZf83pcUWJj97cMTY9FXOYvUtpOH1ysWtx9Rly302u52WhPcaEuWI3ocJBQfEFu94BpQ0qBzZU+1XbKG58LYCh2axHPA8CV/yfV1fytWFCyg1se0AAUt8eIQNFlZZUXaIfrIJLxgNYFUB9a8Cl8n1PsbQefm3PdGgqppNNV9gExyv+JtZkW16xceLs6CS7AAc/L2/ziyHoWlEi6FyMASjIGSNNsRH0iD1hZv8v41VAA8c2GbEvRutYcce0piZ2Ivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+Ei++l8lmdvNx8jPnWLTrsnKEdjHcLWtnXjPHuwL/0=;
 b=kjDfWsLBHhz+K+FVgreHOuCYCCN6qXcUNLD9PhjdF5glbFCIyDWeIDiLwqjSiO2GJwv1RbDX3wb4ot5q8SbLNqIpmPlxjx/iiqESpwSqGAIPoZ1ieZZDil2TtWi1oVB/UtYIINzCqxujhloVOLTsIBVi3AvrAoxdJhg1UGRjGIviOP6S4OYzI0Ow3NGDwN89HmANAwMFYAoBKu2v/Jj1lr6dF/4SNWWlcISs6zR+igFjqVPAZkwwdgybIA3o1vK9IXDaEMLoPKCJMw5ueuR1DzUYqAelP8Ku+kB0xc0X6NA7PX2riYL3n2y7iGP+fhwkK7RXIEXYznNLOVGmd+Q6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+Ei++l8lmdvNx8jPnWLTrsnKEdjHcLWtnXjPHuwL/0=;
 b=br/synv7ktX9za79G15VsGlTIJ88lJKCyIKObQkAF5Cry6uiHZqLfug2OnHSZFZqO/vs1urscA1p3vkCy1UKNazysQahOj1VarEjVFE+c4wxkqGadGgX+VMDPUoGqRqMGi59SMSnT2xk+/TwrNyY+tQQ2DPoyLJyQDYpjRlcn3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by SG2PR06MB2442.apcprd06.prod.outlook.com (2603:1096:4:56::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Thu, 12 May
 2022 13:26:12 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::88e1:dc04:6851:ad08]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::88e1:dc04:6851:ad08%7]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 13:26:11 +0000
From:   Guo Zhengkui <guozhengkui@vivo.com>
To:     Guenter Roeck <linux@roeck-us.net>, Peter Rosin <peda@axentia.se>,
        linux-i2c@vger.kernel.org (open list:PCA9541 I2C BUS MASTER SELECTOR
        DRIVER), linux-kernel@vger.kernel.org (open list)
Cc:     zhengkui_guo@outlook.com, Guo Zhengkui <guozhengkui@vivo.com>
Subject: [PATCH] i2c: mux: pca9541: replace ternary operator with min()
Date:   Thu, 12 May 2022 21:25:11 +0800
Message-Id: <20220512132511.40637-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR01CA0065.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::29) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9198f77a-5475-450f-ddb3-08da341afad4
X-MS-TrafficTypeDiagnostic: SG2PR06MB2442:EE_
X-Microsoft-Antispam-PRVS: <SG2PR06MB24420C32FBCADC08B645E21CC7CB9@SG2PR06MB2442.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mkA1z3m97YK/nZ7HSAP2KM/3eX+6kWIhEuybpLVbqKUrZA7fHnuQUlWqxhpv7e2l/B24/sYAtU6tBhftjn5oUTxtl3nw/+IOsBUxc9kxjNmVBy6J1zBEomkOT3Y7ZOlWdqNmfEndr1MRGeL/2rOWQr0nzR0alOMrXajwg+gXv5V1cy8yNpPcOtmohP5R+TvCtlvR/HJ4XwZ6lksWXGEpH/nY6Yv9VdZcRv1gOeEE/tKcuUdCJ+9UIGFyWkZ537qtIu15rv6y2uT4X5FHcDNH07NPY4uJaiO34cn9264RuGBe2Uy0KFM9XAEoyj9XYFzu2Kde/1bKIAWaQjyuniXiebEIPUqhCKw1EM/KZkRalQQHc62E3tAYVUsJUrU91q5lFl9aVWC8fP/axQX1GXD2Sql6UDHdz7R6tXmIrGFKwBvWbMPxNBHRFMxgqm26snZxatcC0lvtvm+JwxdM+xXUR+NbBqjbQo52HpPhy5ooFbWxt/DohCxXzCc9q/zbX3nwUJQ02z7ulHaIl8wdJx25+EjLDFbYoC5REhuj0bomSbvCgx5dijobSCG9A8WW13zVqTjahUlNO+hIz9vppBMHPSATnsQ75uzGCTn78kzovV2pMB0/Ljf8EnPp47E3MC138TN6x9bEU6vwp0e1oPwp1zK8GXysu5x0NB9dFju8ptEcKabGs+Hjnvqb0k7OvIUwbm4hQn8FCusFhoxzcxQvSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR06MB3492.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(110136005)(8936002)(86362001)(6512007)(1076003)(6506007)(6486002)(316002)(52116002)(5660300002)(4744005)(508600001)(36756003)(2906002)(66556008)(66476007)(107886003)(38350700002)(4326008)(66946007)(38100700002)(8676002)(2616005)(26005)(83380400001)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mDnzEl/rGqFirQzVSMMXD4ST8PtUv8/8kY83uJD1a7u7dzCWpb57CvdSmQIF?=
 =?us-ascii?Q?bVnUNv86h7Fz81v6gsfNVyyAj0ZR1368ZNvXUYH0ntum7ORPImkpCDATbbj8?=
 =?us-ascii?Q?bBXz29U8eU83R7Y1Q3Lcimyy1gpXNPgFzkUB6i3hWqFSNROov5ofnzkmIjp1?=
 =?us-ascii?Q?x6BOUpzckucbXWtWH/b3DIzKCjcXYda8Lc5hmpl4cCSKOUcn41HtRDGKRY2Z?=
 =?us-ascii?Q?B9WBxbjF9VSAthME6Ev9QlU+HhTT3KZqndaNZ6bw76o5suD4oT+26nYmv9e1?=
 =?us-ascii?Q?C6zKdnLxQbRahGKf/t7jhz90Gc/wp4qVMZryC/h+EqkRa1OSqIbOP8Jkic79?=
 =?us-ascii?Q?aqFKGwpgrW1rms807kvPM/y0ZJcChWmhcVbsMClsTKDvUP4/RqAS/Lx7kwlV?=
 =?us-ascii?Q?hambmJex5+4hMrhnZ6ZfFNAOvqaTb8OMnd7RhaEjRh+ogWIrJqe6PBbvU07T?=
 =?us-ascii?Q?5baT4bjP0FoKDR9aVhuUJz9cMssrKDaISgnJgnRqeG5KCyYA0l+uV8uYRxTB?=
 =?us-ascii?Q?PcMMj/5pSNk2Kmr8YLUnPfrY51HcA8TCDIBb6K/Z7riegbCT4hsSeCTMHC73?=
 =?us-ascii?Q?hxKtuhLLbS9AIyg/c36LefXgeItu2Ui4FHREHMzcqiYMaKBEQ923tAv8BJIr?=
 =?us-ascii?Q?OyqXIO0RuyBn2wWjxUbf0yL5nyzjK5VmsVURM359yVTyoovMOTocmOw6alsO?=
 =?us-ascii?Q?HmmG2ZvujL3BkX/aTFuKRq5PCBBucuCvm6suez1eEW5b2oS5wMWC8fxJTgnC?=
 =?us-ascii?Q?ZDcmQay610sxum3Du/tF7xHGT7py602u61F/f1C9kBGxVNo3Z9YHricIMTao?=
 =?us-ascii?Q?xP7gRKE0UcuLACFon/sx6FFj6OqwYh8tEcDrsXFzg85j0TB73ela9rtP6Dt/?=
 =?us-ascii?Q?+wWnAQLaScVnC8bPbS2H0SexpOkgRajdhApULl/1p3jBg8vcLf60VgH1qL+Y?=
 =?us-ascii?Q?z/qfBhhH5DvVbWF0zdT4Gjg1hHl43E5Vefy/e+W0MxO5MVz2OWQdljnr1vz1?=
 =?us-ascii?Q?oykRheFpj0C69JCMV5MCGTe3WgEt9SfrkRXKNxPRgmKfXgVk5mf5q6I+NqgQ?=
 =?us-ascii?Q?nK6ZbmflSEGUwt5CLS9Ll5VLolmGIo253a/GMuP2q7M8+gRQe8bXHOFyesVB?=
 =?us-ascii?Q?mCVCehMIt32YUnRO4gIN+AKGvVZiW3qxYRKThx4EVpXVvQLdPp/Yv6JSeMji?=
 =?us-ascii?Q?MGfE/XF4vl7rVZEn+6FQRZHZcGzeFG7aH0erl/XHwQ73bIUxpxWigci4mMF1?=
 =?us-ascii?Q?jjMgkaU3GdgskXBWYgt++r58mQKVpJIvsj/HD2eWflZ7pBuU3GY9e84eg6/W?=
 =?us-ascii?Q?CqHoA8LP2cxvozV0L48dxhKgKkEXlozjp7HMU0KVVtFpJR92scQ4fTxZOEwq?=
 =?us-ascii?Q?osTVAVC2ojiHmZWSUy9VqRO5r1RFhcwd6xRjWPW4AxTntFv7GzcWQMriyu6N?=
 =?us-ascii?Q?aeyEdwscJ6iJKiMWyvNNa1o0mDz4QwXueSAqBmAmecBrsIZUrQHJe4flAnlc?=
 =?us-ascii?Q?fkrRuT1LUxBl2Va2QfjzfFyQr7Zb2jYfKC1JGxKyHfH+OJBkf8YXmNWW4U77?=
 =?us-ascii?Q?1ozs6cmii/r3Ej01SPMkMvvT54LBmVEGfe7BETAV1F7RQO998LN2wK9TWc3i?=
 =?us-ascii?Q?c42lNrvHx9c2VpOtSZ+Vbz5LRYPXs0oA0m7RtZ23eW1vuvHmC21DxQMkQpFd?=
 =?us-ascii?Q?JU1l6UrsT27qX46QRkmLRyVTuXzSLPo3HxC/842FL14uuYANJyhQxRPxbSE4?=
 =?us-ascii?Q?aM93yVo+0g=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9198f77a-5475-450f-ddb3-08da341afad4
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 13:26:11.0582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPxTel1EDRkgPtJSZGG01VQ7VLHaKySdW9OOhDEWt2tB0dg+S0XvpDeQqpPItQauGm+GvXS/nbsqLelxi/gW0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2442
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix the following coccicheck warning:

drivers/i2c/muxes/i2c-mux-pca9541.c:263:14-15: WARNING opportunity
for min()

min() macro is defined in include/linux/minmax.h. It avoids multiple
evaluations of the arguments when non-constant and performs strict
type-checking.

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 drivers/i2c/muxes/i2c-mux-pca9541.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
index 6daec8d3d331..f374a1e85837 100644
--- a/drivers/i2c/muxes/i2c-mux-pca9541.c
+++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
@@ -260,7 +260,7 @@ static int pca9541_select_chan(struct i2c_mux_core *muxc, u32 chan)
 	do {
 		ret = pca9541_arbitrate(client);
 		if (ret)
-			return ret < 0 ? ret : 0;
+			return min(ret, 0);
 
 		if (data->select_timeout == SELECT_DELAY_SHORT)
 			udelay(data->select_timeout);
-- 
2.20.1

