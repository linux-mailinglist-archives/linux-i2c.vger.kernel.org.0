Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0195872FC71
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 13:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243755AbjFNLaG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 07:30:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244060AbjFNL34 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 07:29:56 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2095.outbound.protection.outlook.com [40.107.117.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34F361BE9;
        Wed, 14 Jun 2023 04:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1BahQwcwPRHCztMrvjlHpzUYxLSjjfKMXGAjpFCduk08o4XqFxIZcKpMSrNGIOVZCjlZbPouLr1GAoRkVbk543xtr0ZcUSObauI7hiQVz8VbUdvmiMYviQ+0mWAPqEaFnoXemuzYmUte1zIbQczjkDQyeHxfnK5CB0Q4qE0OKAOpBirbeWczhUX4NA8HGKWxZvKanhevcv5grLTgmYCJfE188rESxSJFYoLtIv+hlYjPs3Qrsmiy6dpSG3VDc6bOg95CdPcJDzJihbxZuTa1QTgtpz/qyzIU+SPC/voRPBUeOKVMh/+vCJ0Ss6inpUC7zRaNHJ0DcM5EgBktY8HOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oH4ORBdq1gfG1j5hOHyBs9nGhOHX3ka8WOXR6em4C0c=;
 b=O+9hnkMKxiFrDrzGtgjM9kdvbcXrj5VMvYhDS5Qc/X8bX4UBWNTpJhD4DPg+C25caiP2Vr6AnD/2xj00tuzSpYepIqwFjrG2tb5UPvALd0FN+Yyp9DqQQ+wq4jUzu0VHO8dFitQQMhsGwsqrTl/ycJu1OV0k6LqguC+K/nw/oiSHE+5QIz1XwgDOJ76Slp6XxoNHUiHI61X/7hUbdSbaiLOmsdnOqDXvlRLHMGxqbOm0aQL2H9g5xr4TUnhkDLLD/+euBJZAQA5Af3W1CNxqglluQ3YX+hrSPbh2QYhIlRUw5+/jSMVpHZ/KExAurneCFu2z6Wb7Ejy4dZCNO+sMGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oH4ORBdq1gfG1j5hOHyBs9nGhOHX3ka8WOXR6em4C0c=;
 b=bU3sjmZIH73xL2ZDJ6s6wYGjpnH3u+4XTfAAvxvTC8pxdjJiGu9gHiB2KUsyNmsSisI3wXz1Hze81kwuVkxpB/8qxuqPTFz2FfQz/e84B4+7nquCxVMFS4GPhcD7Dxp3m4+11meJvSsjW7T7rvJYUcJV83liv/tbiz/uhJIFWPSIAjfEM+ytDPlkKGqCL8skwaVmlDty1MGA0ZBvpEtzZHVXziP0GgrN9sw2++62rqszm13JUeQLQDR+rzOFRokXwS7uLDKMZeU6Ut3CXKN57xz8hRSWKf0BikdxHgiH95XY7R/0yq5XFmwtHJ+fQKS9aAiIQsj+m1aq67p5N4eJxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3743.apcprd06.prod.outlook.com (2603:1096:4:d0::18) by
 TYZPR06MB6141.apcprd06.prod.outlook.com (2603:1096:400:343::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 11:29:51 +0000
Received: from SG2PR06MB3743.apcprd06.prod.outlook.com
 ([fe80::7dfd:a3ed:33ca:9cc8]) by SG2PR06MB3743.apcprd06.prod.outlook.com
 ([fe80::7dfd:a3ed:33ca:9cc8%6]) with mapi id 15.20.6455.045; Wed, 14 Jun 2023
 11:29:50 +0000
From:   Wang Ming <machel@vivo.com>
To:     Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     opensource.kernel@vivo.com, Wang Ming <machel@vivo.com>
Subject: [PATCH v1] drivers/i2c/muxes:Fix resource leaks in device_for_each_child_node() loops
Date:   Wed, 14 Jun 2023 19:28:50 +0800
Message-Id: <20230614112903.667-1-machel@vivo.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYWPR01CA0028.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::15) To SG2PR06MB3743.apcprd06.prod.outlook.com
 (2603:1096:4:d0::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR06MB3743:EE_|TYZPR06MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d4af41-2059-40c5-65af-08db6ccaaab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bIbnFfG0sSdd3vBSKl+7giVc/VvA7brKt8cd+iMchObX3/monDxuZcEIn7e+zSp3wa1pzbE+vGfOfyZWy3TD9QkEz1XFlOaUl0Eedgf5RsFkw34MAa4swqblU/YMHqQoFoW7CuI8UlVNn/6EpN3WcMNPLaLIUxQdAHtHAfxvG0og09F452jYFYXM/FwSMe7DlZeev+zqJuxZjc/IedsLzhyBHlDU41WFLlsWXFaFzbTI95HFbqDNc15fA06V5Lbuvk/4CXi5/NmeuoTeUikZRBidzGJpC3aR4rGSMBVQXD6Uo+YVkb0u2qsx75XSmJKEoVqNNjj1//KHEoMkiL10AUinSRoijntpH21ymP/7wbtU8C3mHWk6DDPC6pHtA9n0v/bhxSRqUOXvocGPvRBkXKvsoFuairJE7IllrvOuKThmM5QLw7Z1dmlbXydF0YvQK+bOnlsfj/Z2x2efbMrDuUj4W75H3Z2KfpKQoxbuSHWI1x+rfHdE4XBE/fFHsmpylMbPNHiXOsCY5UyWqCUhpYpK+BOh0d0gNjSlNHilZWOo1u+xtzCVxXjdtN/r7+Cj/9tis66Qzg8VyguXVRQBDyHTie4YsLCoUChWdchSEyu30rz0an0TudGeAunkR9Wx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3743.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199021)(86362001)(6486002)(107886003)(316002)(8676002)(41300700001)(5660300002)(26005)(83380400001)(52116002)(6512007)(38350700002)(38100700002)(1076003)(6506007)(8936002)(66556008)(36756003)(66946007)(4326008)(478600001)(186003)(2906002)(66476007)(2616005)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KjiTaO/K4PmUQtg8sPoG9p6G3eDojxL/yNJVQsqSWiSMJDA7D7UK8ECb6tgO?=
 =?us-ascii?Q?96S0TzO76BlwJqMNWb4cPs0BykI7wtkmnupi5PfRE8KpzKgfJ3zI3YIyGD92?=
 =?us-ascii?Q?10kbxToADwCBGMbiqJpgq+u/hWoVfNGn0RbSMWb852eSD85SeAW7+3Xck9X7?=
 =?us-ascii?Q?8zBVH92b5fXxVVOouzd68Qkd6buySTS9VEskdpiLc0gxpK2kA7XrioCLp+Y7?=
 =?us-ascii?Q?0R4d/ufKxv4k/qLtphujG/rzUtX6ZMQgeizNDTRBGOsCTYQMNypVikMbqRm+?=
 =?us-ascii?Q?lO8k6ZCcIsbhH8Hm4AEvcmi1rGrxDHXSnRIDh/ZarixlrCVXYo3OK7DyNjW9?=
 =?us-ascii?Q?o9bqzii68l26nmWc42pz86vbFnJcaHNJGYHgyOHQL2R+0f5HzE0v9LnEZksE?=
 =?us-ascii?Q?TcotZGvEq1nBolUvvdhb5a38wmWTG54+Xs79TmqZ1A5Wu5ShC+P+R7XqzqP8?=
 =?us-ascii?Q?v7+Ho1D/rCKAfiMgo9SsXdzEvCmC0cOqL00qwMWSIMXHHaq+OacfKlk+z5FI?=
 =?us-ascii?Q?NX3Ud9HhoxawbrLZBVMq7KnitL7P68eA27W/gbxn1fdU6fQbl7xxxMaCmPm+?=
 =?us-ascii?Q?FVvXJsJRdBqAqwOmYM7pUE5mPGRiUn833jhk6uSoP3WxBiWXe1qsKlk6GGaT?=
 =?us-ascii?Q?brd3UzPidsLfkaUf+Sps+yicqGJP5oZuSct6JDZueoFFwXhePm2pd9WiXfbE?=
 =?us-ascii?Q?n49Ndi8135SjPivFg5fyUj7tzK2UvMtxwcAIO+FO5Vvdr4zIOYsdxYut6IkD?=
 =?us-ascii?Q?HJKFx8lKW9eABdxuhUb09CdGPYZmZN8n5WFaLCe8ip3qRW/0b9TnbTXzYjh/?=
 =?us-ascii?Q?NoNrtvfpRW5kc/vPQaAfEarALvmgYr9amlhBl7YGAsr16DHc8IVwD4jX+vPQ?=
 =?us-ascii?Q?Prg7IoGG0g5suZGYpDmcho0BpJZ/Bh2wh4dIyd+9+xW70mAL8re7+Mu4wXRS?=
 =?us-ascii?Q?MGhI+cdgs0C2Vtz35taUABuHjc0T2TLn8DAxTvw/X2c8arUtYKrNi63BIIX1?=
 =?us-ascii?Q?QrA/RQ6Sok6T0Lty7wtLphdMncZ8zot+pws6ngPC3j736CPnWDbM9ZE/4ilM?=
 =?us-ascii?Q?Wf9c79H6rs2vL1NVCVwkw6Fmc4jYF2b/qQWuUhfQMDAa82vgfVlNJD0eZsKE?=
 =?us-ascii?Q?DzjZDp1quDt4ZjrX2ZA2IKWfY0ww/k2IF0CroK0HWLWzjEEFjUgL6tQpJKGZ?=
 =?us-ascii?Q?H4UB+UQRkUvMIscI8V9sjOpl+CKXX/uJgKt4cRGJIssFgyTbVIiB3sIsOQuK?=
 =?us-ascii?Q?ANQhAJqahwjD0tVbTY9az0v+2Zm9lDroNHAi/mgFhLw2HZJzcTdsUbCl8a4j?=
 =?us-ascii?Q?6zX7XqOqinq++WUyNrvshMJdSiCLwQefBS1N7eWzK7J956Gs95HcQoKYakFo?=
 =?us-ascii?Q?LhCBtJslOaAmN/cj0HE0wKe1xe/Gh65PtOF2nqKVSaWYyxvSDfgxQEdi8n5H?=
 =?us-ascii?Q?zo8Ye3Q23lf4sZTICRvSpJjIESlPtoubjUl0wBwgDoI70nBjljrCO1/Zf0Pc?=
 =?us-ascii?Q?AtqCp0aoYUI5JLTTDmKnqX67PIQctCxootg8qkqE1sQRBJzS3gQcQzhanW4U?=
 =?us-ascii?Q?j4+jsepM/Q+AKd1dzqxhJL7fXNRp5F4/K4EIpXY5?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d4af41-2059-40c5-65af-08db6ccaaab6
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3743.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 11:29:50.9029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfHnV12J7WUPGbV/lLj3fvLEzO3gsoNDrb8BmZQB1/HsLc5Ik2adv3Xld4w05em+Ldn5HuXM5tgOiwQPaKkzrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6141
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The device_for_each_child_node loop in i2c-mux-gpio should
have fwnode_handle_put() before return which could avoid
resource leaks.This patch could fix this bug.

Signed-off-by: Wang Ming <machel@vivo.com>
---
 drivers/i2c/muxes/i2c-mux-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-g=
pio.c
index 5d5cbe013..90966de7a 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -106,6 +106,7 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
                } else if (is_acpi_node(child)) {
                        rc =3D acpi_get_local_address(ACPI_HANDLE_FWNODE(ch=
ild), values + i);
                        if (rc)
+                               fwnode_handle_put(child);
                                return dev_err_probe(dev, rc, "Cannot get a=
ddress\n");
                }

--
2.25.1


________________________________
=E6=9C=AC=E9=82=AE=E4=BB=B6=E5=8F=8A=E5=85=B6=E9=99=84=E4=BB=B6=E5=86=85=E5=
=AE=B9=E5=8F=AF=E8=83=BD=E5=90=AB=E6=9C=89=E6=9C=BA=E5=AF=86=E5=92=8C/=E6=
=88=96=E9=9A=90=E7=A7=81=E4=BF=A1=E6=81=AF=EF=BC=8C=E4=BB=85=E4=BE=9B=E6=8C=
=87=E5=AE=9A=E4=B8=AA=E4=BA=BA=E6=88=96=E6=9C=BA=E6=9E=84=E4=BD=BF=E7=94=A8=
=E3=80=82=E8=8B=A5=E6=82=A8=E9=9D=9E=E5=8F=91=E4=BB=B6=E4=BA=BA=E6=8C=87=E5=
=AE=9A=E6=94=B6=E4=BB=B6=E4=BA=BA=E6=88=96=E5=85=B6=E4=BB=A3=E7=90=86=E4=BA=
=BA=EF=BC=8C=E8=AF=B7=E5=8B=BF=E4=BD=BF=E7=94=A8=E3=80=81=E4=BC=A0=E6=92=AD=
=E3=80=81=E5=A4=8D=E5=88=B6=E6=88=96=E5=AD=98=E5=82=A8=E6=AD=A4=E9=82=AE=E4=
=BB=B6=E4=B9=8B=E4=BB=BB=E4=BD=95=E5=86=85=E5=AE=B9=E6=88=96=E5=85=B6=E9=99=
=84=E4=BB=B6=E3=80=82=E5=A6=82=E6=82=A8=E8=AF=AF=E6=94=B6=E6=9C=AC=E9=82=AE=
=E4=BB=B6=EF=BC=8C=E8=AF=B7=E5=8D=B3=E4=BB=A5=E5=9B=9E=E5=A4=8D=E6=88=96=E7=
=94=B5=E8=AF=9D=E6=96=B9=E5=BC=8F=E9=80=9A=E7=9F=A5=E5=8F=91=E4=BB=B6=E4=BA=
=BA=EF=BC=8C=E5=B9=B6=E5=B0=86=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6=E3=80=81=
=E9=99=84=E4=BB=B6=E5=8F=8A=E5=85=B6=E6=89=80=E6=9C=89=E5=A4=8D=E6=9C=AC=E5=
=88=A0=E9=99=A4=E3=80=82=E8=B0=A2=E8=B0=A2=E3=80=82
The contents of this message and any attachments may contain confidential a=
nd/or privileged information and are intended exclusively for the addressee=
(s). If you are not the intended recipient of this message or their agent, =
please note that any use, dissemination, copying, or storage of this messag=
e or its attachments is not allowed. If you receive this message in error, =
please notify the sender by reply the message or phone and delete this mess=
age, any attachments and any copies immediately.
Thank you
