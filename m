Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1C50500381
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Apr 2022 03:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233757AbiDNBSU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Apr 2022 21:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232466AbiDNBST (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Apr 2022 21:18:19 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2117.outbound.protection.outlook.com [40.107.114.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C1504C424
        for <linux-i2c@vger.kernel.org>; Wed, 13 Apr 2022 18:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxHhDeOGV+j5QTqf/Z3zXmymp11RdyqlaaoUrpXT41a9ksG5E09Ro4Wd17mnC2UJfKVIMIHeeS4Zjuka33wJuoia7rLB49jF5vS9GTvlPl6cOsy0hqIkTm0iC/p9PQzO79AQ5U03VxgA7K421u82CJjdL1cs8xoAjGYDmyQJIwqa6vZORPC9VPoK6QRINpu1BFOdJaJ1wkfmSPGZkhXZhcKtGdpzTsDWCeroSOtKyvWZGME6sC6Int6rzo/BS/q5l4LuqmCLbFeBbM7glLe2wLvetKpQbGOnzEJskJLHNWBaduKlfvSsvuxCbSjSi6WDbSKrC6BaMeMDfoTcttPaWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NxTYUP5r01VOo8GbpUR0RkKbXLIkA8o6kUWZY2dA2g=;
 b=Qzhp68G8M/V3xtapEfHjIi0+6Va7vGwLyzZx5g3LxsGc4vT8Xum+TW9KriMUzmgBSqlhiZgb28Ns8c7AV0BrcF+XLNv7fuaXUtQGQxg0Wq9yFYuI1s6NpT7eH5Ny1/wD5rKrZsjyEXERcj4TAbjX/O57TEGD4k14rPW6oRAGVaIjPQABYWfO1VLphJ3J075MgOq/zgHowXLD4JypNP0fEMqfNRjRlRVsSNwPEmL6CRcFmA94oRZ5H4onlILRFBCZdD6iQwQbWuhIwmYZUFF5ExHiA1N7kMkHxfRzirhTGtD2scd532sVDZwhRrWJAlYw/LvUb1BZ8MWjPa4fIAF7kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NxTYUP5r01VOo8GbpUR0RkKbXLIkA8o6kUWZY2dA2g=;
 b=YlD10csE5ux8IeyLFiFDSnNk/2FJTQzAbjhQdATEWcSQShsLLz37c50TyqFimSW1ZMFJP1Kdd/tb4elSYUCYkaSGbXXfrhJKXzX8FZ0dWNG0fP80em+aB618UY43NY11/Rl+arE1ShFbxmEDOgQ3csr67MqrO1qJpGMhS0u/hqg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY2PR01MB2427.jpnprd01.prod.outlook.com (2603:1096:404:7b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 01:15:51 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::697c:9b30:7de5:706f]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::697c:9b30:7de5:706f%4]) with mapi id 15.20.5144.029; Thu, 14 Apr 2022
 01:15:51 +0000
Message-ID: <874k2wtqgp.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] i2c: rcar: call pm_runtime_put() only if it has ID_P_PM_BLOCKED
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 14 Apr 2022 01:15:51 +0000
X-ClientProxiedBy: TY2PR04CA0014.apcprd04.prod.outlook.com
 (2603:1096:404:f6::26) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e243c6d-1a6f-4ee1-d366-08da1db450ad
X-MS-TrafficTypeDiagnostic: TY2PR01MB2427:EE_
X-Microsoft-Antispam-PRVS: <TY2PR01MB24274E5B7DD986299461E875D4EF9@TY2PR01MB2427.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WbHa6bSJ9b25ijNWgBC+dqRhuUn2jM/dblc5Kf1e1BeNq1M1IrF3OdXPlOYYvPAGseJpGGHSCQAwedbWbAfYrpvsm5a7ov3dzmUHW728GSInuxGLX1FuyhoRNcYjPbadP8hbcf0HY00aL0JmUVNyiYMjM4p4RY95tdvBFR9kUR0Djc4yPszjo+zgD1DiYbALSkU/L8EQ+8PVlg44ywMIJVpv+DGYg9aehTgwQUZeI3xg0gmMHRiASijIamfZ9NOPjwmYgMcQj4N5Ha8Pgr/y7yenaife6DOthciSB43QaM7R7JzwjwaDvCyd73k7WzQUqVpXU0jjqrgFfPo0qUk+wuFG/GM+ChhuoywlnoOFcD0J6zYewvFFzZyXybFc8OUSHl9DD+YULjKRaJtjx1A/06r/VIZ9cEt6pHY+zjM42uYZFWPZgI+1rlE3GtlsocmYKebwed6fLfNSEGEjfItgqds1/3BrZ+d0nKfP2VJpgl4zMpZ/s+V7yZ22P3V8X2OuBLvJKF6jDM00ujfH9c6dZWz6qRm+KvbH9YBulaupPIhKPu3pbdInOClzIa+COxywJyWx56vJe9E1d77xRJNDl8jEYfSwEFKtSeJPj6Lr/9tq/858jIZd1vLkqG+xmzxDnChWHHGC62Y7bOJRm2zaaQwive9fC6lMSJLQbnaANJHbV4O53JSZTEe5xv93SK82s1QFO9gZ+n470XLgfUnnNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(66556008)(8676002)(66946007)(66476007)(26005)(186003)(316002)(508600001)(2616005)(110136005)(6506007)(6512007)(6486002)(52116002)(83380400001)(36756003)(2906002)(86362001)(5660300002)(38350700002)(38100700002)(4744005)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uJyuf1XZwOwLRdIe4msJffCxoNpbLNYf+/WnEjx+y0dSJhywmNDzxFfl1e8J?=
 =?us-ascii?Q?tmrC0dMSin6wUPo7+0qoQFqONeBnP7zkl8k7w5fa3JiPb9w5h+rB8YNyxgft?=
 =?us-ascii?Q?CRTquUujReo1+9fHzwAT+wWHy7tpZw8BbdI20oyDhgkOnQGve6sYaY4ITESO?=
 =?us-ascii?Q?VKbCfgA2X7zOvg/3vRGsLuodJAwnudecjnO+k+ya58aZyxSkuQFM4HY1aG4O?=
 =?us-ascii?Q?8T3ik2Qng5ebcBxScFUlImItQBxMFcjablINobH6Y9LrtoNAnEr3MjO8dlm+?=
 =?us-ascii?Q?f86bvhXQLaXIDxgsaGaQT4s0cIQbqkbdAIFQlPrIEgcAeeZoI7k7Ikk64CL+?=
 =?us-ascii?Q?5wNfkX8JAmf2DMjG+LupB3pJRAQmeR7/u/U7tKDHVF2JuZ9wDNBB9IDcTa0E?=
 =?us-ascii?Q?xOyldNybyS5JlC0HXL9vVEDVDHl11uITN4OWxnD3dRLHM0xLWQjfIUqZoS6t?=
 =?us-ascii?Q?AD9vZPO4Ny0FFdMsIoREFbVBTdycRbOwjAIzLFHXhIjcfU2q7KaEcne2C6iv?=
 =?us-ascii?Q?ZBpW2aki8etQoEaGztSr88KzDRVFsL/HNu47dVmk4X9TNhNVEjMbtKSgCj2d?=
 =?us-ascii?Q?ujyroZAWXl5ZNieeOqOuE6FTJVDbpyKVa+NRWNAJ1IWkTqX+wHkN+dCVocuL?=
 =?us-ascii?Q?cHSGklkcfSjA0nNZbBnZgMnsKGhnbGOh2fP5jcKACkrqEWajKVke2d+Duyy4?=
 =?us-ascii?Q?E3V3hpOtWANv0N//7QL3Wo1TEq9aW7XL2vvz24df0E019mK7053gWi+zrPuL?=
 =?us-ascii?Q?yVRLWoV+T6MaKMxb7cO70QOGmCMW6JC5SI6/hsbGkslpbAzQQegm5rk9di7p?=
 =?us-ascii?Q?fH62swWT5TcMVPUGLdmOg/dGQO3YnsYAtLQ+icQQOt4QAz3oxw43G2Oua0De?=
 =?us-ascii?Q?IKbWTKGyDxHgFumwLgb8zYzPjl7ZQhEbhSQ3AhYh6/+QZphFlCBJm9/G8AzY?=
 =?us-ascii?Q?7c75cx6kOLuUOt2xUMFvtTXYfmT8lmI+pXplyuAaK0jEzH4k1d4XMYlgiyTO?=
 =?us-ascii?Q?ZO+NsNa8lmfIM3kmaNZXU8gWq4PppdZTh5HNWEa/+90SBLSyLlc8740NLSsg?=
 =?us-ascii?Q?yFKeofFAzVIfKjPPuuDbNCsJDus0/GOS+ZmxIBp06+JCN6v318YZg3eZNzyK?=
 =?us-ascii?Q?4sIfU1sBuhctqnmiNTg3aZltY8HabL5OpaEQrQGVOSc8qtpYt6505GBOZYlE?=
 =?us-ascii?Q?8X0ru4gNXTQhxEXomiuAl0DDluBd345kZoCrHpoLIpKyBsEyEzq1lTH6pHSJ?=
 =?us-ascii?Q?Wzxu49A5fOifrv0DXGQWYBE1DExt5HTQpFD1jzUG5l6/AL9PGyeryT80I6SM?=
 =?us-ascii?Q?IaNcpNKOxOHP2d2kYM21R75RoheVmeBDlRiKRPkvWX+dXKqdBZ8kGffEJ/+o?=
 =?us-ascii?Q?/fCPfVpmfXsnJ1tipKmWIGo8Y6DB5+HYisAs+4or6aOVc3ywySYt1MWpp4aZ?=
 =?us-ascii?Q?7y9GMYhgm/Ko75xRCiRAWxfCO0N4AmNBVwvQ4srZJyqFIZllQzvq5VO8XHAf?=
 =?us-ascii?Q?23kkPm1SEK2DylxMFrJQyWr4UURhtBEuqIvXz9r/2AvP7Swe9hDJyjErADwx?=
 =?us-ascii?Q?x6cXekWM6k7dTSNY9CHPGM7tSwso2BdXOjT89GavAkdCjzrByScqRoBs2HwY?=
 =?us-ascii?Q?22LThIQw2b6juWN8Czbxrd1kmoMU9KTjUCn8xzOOtlvtOPJl9leDbf0PMiw0?=
 =?us-ascii?Q?tuYrJDDKWqrxzI/441SxzpfohJdRywXSI8N2byCx2W+0RD+gVcOAOD36QRcR?=
 =?us-ascii?Q?WoIuELtDHhwffs9HoGfvZKx8lsa7pGFvAvno3FMDGvF5jdtVCrmD?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e243c6d-1a6f-4ee1-d366-08da1db450ad
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 01:15:51.2640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1dLgjAvWcjcaxB8rtn0i4Ez/AUaE+QbO+wlA9optjbRGa6xT2/tCbr+NpFvFDTqUVSu7PzCCJKcrm1SpgAANbtMMyC9mUPo0uJubdLmrlY6Kmsd7Ao9CbYiO0gOg4jl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2427
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ID_P_PM_BLOCKED is controlling PM status.
We need to check it for pm_runtime_put() on rcar_i2c_probe(),
otherwise it will be duplicated put.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
Wolfram:
It is not deeply tested.

 drivers/i2c/busses/i2c-rcar.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index f71c730f9838..b5f0929bcea5 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1121,7 +1121,8 @@ static int rcar_i2c_probe(struct platform_device *pdev)
  out_del_device:
 	i2c_del_adapter(&priv->adap);
  out_pm_put:
-	pm_runtime_put(dev);
+	if (priv->flags & ID_P_PM_BLOCKED)
+		pm_runtime_put(dev);
  out_pm_disable:
 	pm_runtime_disable(dev);
 	return ret;
-- 
2.25.1

