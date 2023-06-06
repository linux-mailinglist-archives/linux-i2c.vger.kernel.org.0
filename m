Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAC14724B8E
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jun 2023 20:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238893AbjFFSjQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Jun 2023 14:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238986AbjFFSjP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Jun 2023 14:39:15 -0400
X-Greylist: delayed 737 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 06 Jun 2023 11:39:13 PDT
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com [67.231.159.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F74710CB;
        Tue,  6 Jun 2023 11:39:13 -0700 (PDT)
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356HWEq0015275;
        Tue, 6 Jun 2023 14:26:35 -0400
Received: from can01-yqb-obe.outbound.protection.outlook.com (mail-yqbcan01lp2237.outbound.protection.outlook.com [104.47.75.237])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3r00mvjcku-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Jun 2023 14:26:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0Z+NhB5zdKTZIcHZG/ZHTq251R8Xxjl6Cn4MPo04ijYx/pB1PUmYkLp5BMPYaRPBpJdV5WPxFaVK/2QHwrvmxalBERk0BDxHRXw7qlbJY1NvPqQlrBgy0ELMtQEEhkGyPuj1hay/JOulLvHVg2+QePEBEivzhDlk6sY4edE22/ujp4SVOA1SZcXfO9eCLIA2XnVovRKp8yJ0dPwhSHjz4Skf+uJmM8DJbqquzuQauwJZnqnkcONopmX0pVtb5wh1z76PNgeOlpeJr+/nvszabhxLB1ELZ9qatqNdTRONa72x1l3bMauBbMdf74CBQirtSc8TlihTvlH9lc1KlvIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vy1i7aSpdwV49pNkWKpyrlDslQjRzhqGkYGLQuD91bg=;
 b=CqHyytnZ7FNhmvwx8GHTkHXWHfSuIUy6okogFJXE7ebkzQM/q6ydKEO+2L+nlt/MC9aX1yQjroAY2A+1h1gN0z4tvLTrLflCZSBtz4/u6/od6GxDIZ98gmJNVmFFGLAkjq2Kxwh9KNY3iON9mj19HXfBvbP/b8LhOiEZmfN1w2rdVLDtApe+nDxr+ypioewM65VrGtr50F9sHLwQB3pMzl5/MecwhEiWAAZy70ylYdwoQTGRsWY0998wruDeUj9M1CfW3VqPoK1Ah5rx6zIfvODQGw7Pf+DEom2kntNYAt30OaymijQ9p0QCeBQG2QX/nMRTECWpxX8WGcr0YQchKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vy1i7aSpdwV49pNkWKpyrlDslQjRzhqGkYGLQuD91bg=;
 b=gas0RMJsmdvFJbK7Dhm1EhDBdmr23U8UfhOESBr4KEBaaoV9oYfpUJv+YKgCsPhz4Lapv6bckZaPBhAQLN/sYGwl2L6VQjNj0W4TmuNOe2kwlLh3dqxyEFSJ3Nylk+ZnDPuvVOcmj5XkoE+Ts62LdoUJPaSrFXpgJHF6h5v4gtU=
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b9::6)
 by YT3PR01MB6677.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:74::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 18:26:33 +0000
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::c059:dcd5:ca20:4a0]) by YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::c059:dcd5:ca20:4a0%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 18:26:33 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     Michal Simek <michal.simek@amd.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>, Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH] i2c: xiic: Don't try to handle more interrupt events after error
Date:   Tue,  6 Jun 2023 12:25:58 -0600
Message-Id: <20230606182558.1301413-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0307.namprd04.prod.outlook.com
 (2603:10b6:303:82::12) To YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:b9::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB8838:EE_|YT3PR01MB6677:EE_
X-MS-Office365-Filtering-Correlation-Id: 06065b16-21fe-4408-f248-08db66bb8de1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vpfZZX+lHYsV7tAD6wWIoft9zJzDkUx4FrTkX6hdXvlWR18xWIiiXcq2Hk6b0ugR8auZZvp2y/q+RQRcfAzbNtpSuJJ8zWIjmEDrR7YO95xoIGWoo2wSEquwe6piyhwDvr8kiI/FWTcTZwiZBY8s3Vah/TSb5FnNdpe92pu24q1jebHydZk8j7ko74xYZRV6iLD/I041mZl3qbbeOyLPQYp4cLuPk+fFMyfT6NJTMGfiM/rt7jM3vuOT+uTysu/YmJ/lxmhy/zxbfU0VniOs7AwvuxqEQ0cb5h+Af7RllZ+DVaT3r02daCFG6v+5ZW7SHS8z2jOXD5UMUpo59hGMEt0C3NHmRzOkTOp/0ItmVjAKCuZdIEqUw7VNyIUkZUUYEZkMTUmBgkxWBef6hAvHlzY/QGGBb/GVpL7xd8uI++B6faTx09h0xgDWSws26aAqq0ivYffuItUiJAWvWOCSVKX2oHyGFdaHtlbcD+8RfdPk2x15tP9uLTz23t/XYGi04Zpf0T0M+2D9JnZHjqu6M0y+t1jYxd4/40k0q7iwEmizgyEatGPzAbDebwJdZBB+/fdcfopqLFiAC79wSksKYrJZvjGF1zaIREKtsF1H6QE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(366004)(376002)(396003)(451199021)(110136005)(478600001)(66556008)(44832011)(8936002)(8676002)(2906002)(36756003)(5660300002)(86362001)(4326008)(66476007)(66946007)(316002)(38100700002)(6506007)(2616005)(1076003)(41300700001)(38350700002)(6512007)(107886003)(26005)(83380400001)(186003)(52116002)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7hZaYGs/Z9TXQr/GpXaRBGu5ryfdnWuEJMpl/tcmTcT3ZHlZ9LRx+JIeagOI?=
 =?us-ascii?Q?90BCfDAYq0x/QzsVZtrF0DGGkRci2cEkvjIL21XnGxkl6SDePnAIaa4I02dg?=
 =?us-ascii?Q?70BqgY9d8G+/CoORuAXi/1Z3DJZpzDKDjclqeHuu5zWcLzGbHvkq9cTjbqt9?=
 =?us-ascii?Q?jgixdzlhGCJ6cO6V8MkUp5ZS+N0r/Y1LcaYDhD+HAmBQlaktb6vSyvCRhqwh?=
 =?us-ascii?Q?Ji07oCA83X9e67nVFjxB0R+Aw4oQ1k7NgYqoPmXc7ScVPDLM4BEpZ2ir2J9A?=
 =?us-ascii?Q?wXMizS0zyVkn6xOi1mYJavdsrsjJ97Za+v05PJ175+Gpr+dtu5BoT8uMLAlo?=
 =?us-ascii?Q?oBLmikI3FQ0U8kmv4dk25teX0S9x63Nb3eCwAQv1UWPdpSwxfq2sAkw9G1rl?=
 =?us-ascii?Q?IizrLwnLYR8m+6ErOqJR9IbxBjuHJFhJsIigofvzmU8UZDx9mepkg1qjtPzX?=
 =?us-ascii?Q?wn+oY/wddyDcrDrH6MiiyEQMDggTWm+7RTU8o30Zug6YGdY35OGZKuXkKcIp?=
 =?us-ascii?Q?BsPRGi/ppy+SoHhTRTKmG4mutPCOUJkNDNvAjCq3wxm8YubU+Gm5EtRvaAbc?=
 =?us-ascii?Q?jbh35sgOsXWYMLASGoLmJk/lpbG7QbBgP2jh8s08hHvf+LJtMllMZUjS5anJ?=
 =?us-ascii?Q?p5ZOCHCrK80/nBECs+DyG8O0EgOCe76DXKJe41HMxuDn87Rc5dAveKP9SS1l?=
 =?us-ascii?Q?8o8CJpAVb6A8B0M4XzcI1YUxAs0fTe/IRHbAKnHLB01sWv++6xaMrzJXZiUx?=
 =?us-ascii?Q?aP4csxCjoWSvPGdCxrGhZU5th8Bqon7ODIYIZRpZnNKFRvDi0Qezx3x4KHbX?=
 =?us-ascii?Q?Egului5r1K7NWWbDVLWb66zHqm2saHcf4ATvWNMyc1DWyBQWWupi4Q7hl5lb?=
 =?us-ascii?Q?YRqD/wM4djKjsyBO1le+W6JbTLtfgYp6BMmI/V60XrYjR3W0mSsXC8DoSid9?=
 =?us-ascii?Q?+LHW0gjs8VewgOMe6DKBf4Q0FRJlOsWkvuVBTJa2LzHM9L/Tb6jmQeM8c9SU?=
 =?us-ascii?Q?6fWNQCRrxZYu4POxZSiRro3sLZyxd00sSbsik1VMj3oJZmJZCudemDQaRMnj?=
 =?us-ascii?Q?bjckPFZc+BG+G/J2qF3KQxMMq/8nSovgsCCC0RjSCAk0aojP7VKNHC26y5pP?=
 =?us-ascii?Q?zq2+7t6vA5Mo7GGGj4dpG0BR60EAzgeDKt2R8x/8aQQwvubq4KnTZznVZfVr?=
 =?us-ascii?Q?fFU+FjzVVBr8ed9/5TCjpFGik0BjZrJ8JLPRx3PsnbG7/gRQyvi41YyuaUbc?=
 =?us-ascii?Q?UF702A4694zWlIyunZvsllZsY5tHW+dnDSMVJgTb6mfnN/57jMh/Wd5V36r/?=
 =?us-ascii?Q?OYy0XwlilbgFoBiVXaj2TSFMYWib9yQd0vCo7Yh8RsLF3o1y3fZ94guVLRYk?=
 =?us-ascii?Q?fesQ35DNaGRQaCengCZAjwDs+xsn3nV+sgl6rW2cwLpW60ybMczs7nZCwju+?=
 =?us-ascii?Q?8PMb/mHIO1TfqHdziT4PyoRFO2VnPKwE0TN0+WIpflAtKt1iRqPIv4yO1Rwc?=
 =?us-ascii?Q?bv0s1B+OXCje21nS7dNghkK5e7J3+IZygAFfGoiFawTYxqL6qIiI02zutxzr?=
 =?us-ascii?Q?pXZr1gLRN0mJE2TxcDxFfIfsm3F6bijWC3xnYJTDtMgY+d1LjHZ1rwls1Zbg?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?VMmoPS7DDm+fIDJ2aCl80kWyBwhz5qSBx9gkvK8hKzKHNbDPlrCB8nCxEamw?=
 =?us-ascii?Q?LdGrEYoRteweNT7zJm0VBhuLPGj11Qvh/Q35AQKqltCVeuoBh+TWT+pmDucV?=
 =?us-ascii?Q?hTRLidRIIri2Yl0y4JT97eAo9FcpgbZTZHl5X3PYWJMkUfwu5kx8nGuYfPfn?=
 =?us-ascii?Q?C3y6RiqMFkS95vui8VNogOTqf/yB95XxfjWVfSUzzWkReIpK6/8sw2F3bC9P?=
 =?us-ascii?Q?pK1pFNuLlUyQCFkdkS9SOBxOpJ5EeE/+QgXvEliSgtc+feswTt4znzQYwrRG?=
 =?us-ascii?Q?gEnvooAlfpe5vrnc8e1ltAjLmZR9KinblpV+Oy4hfIee1ItnPuVwVuqtMrcZ?=
 =?us-ascii?Q?qt/UJ/dA1a/7CjYxn9l726uLXf4q41aAIWTX+w061HiNTQ6QPZDiuAE625uc?=
 =?us-ascii?Q?+XhC4EkSpzkgv73nkjsOq3v2RuakgDlJ4RpE9SDvxk4zoUzNbM6g4LrdoHQe?=
 =?us-ascii?Q?QnH+b7MeCoTD59CO92KeQAP5H0+q03DRkhf9jjOFlHGTWCPlrd4bQcNxO4YG?=
 =?us-ascii?Q?e0pDHlgeL3NnkT0HMruhKypUfUwjLED0WoN65RfMZCk3KReplOub+FACOgvX?=
 =?us-ascii?Q?oUvLuxJm6YbYVVJNLS0AI671o015ZMkT1FC8C+LHQOdTnF9WPvDymajq5YEe?=
 =?us-ascii?Q?UVZDVDlO8syHUkIkFOBfOtKzMy+6NFLYj8kurcd6cuNHTxEocbk0Bi8X5cBZ?=
 =?us-ascii?Q?rL8ntU+3iUaEZz4zNoW5PGg2PoE67vYS1krLWIxe6b3Xq4DyXfVNNfNwRSDc?=
 =?us-ascii?Q?E0h6x9Fv+JLpYREf6kXWRaySMCHmiO22lDjUWG9XJZM1K7r4fAPTy7bX0pA1?=
 =?us-ascii?Q?V4WFv/tH2H5q3MWClp5xL2encz9/jvK4c/aRPHbnW5TklcH+YJ4SgqZQeJ6k?=
 =?us-ascii?Q?vz02lMOzpDfnjQt+qToZ86KpYFlJ8DkiEUSqVfsCDFH7eoNtivSl8pu6sWW0?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06065b16-21fe-4408-f248-08db66bb8de1
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 18:26:33.0277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLyshUSazuod2vu3/c0rEB3pMwSU1J+ejcvKyfUMbbGq4lRYduGwal8Wnmco2VXpky0Een9sQHUO9lrzQSqRKe+YGxoL7aaeQlc4X0ow15Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB6677
X-Proofpoint-GUID: EFjiZk9tNSMH3fj7TDcFsFWZ5EQqLBak
X-Proofpoint-ORIG-GUID: EFjiZk9tNSMH3fj7TDcFsFWZ5EQqLBak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_13,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1011
 mlxlogscore=522 mlxscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060157
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In xiic_process, it is possible that error events such as arbitration
lost or TX error can be raised in conjunction with other interrupt flags
such as TX FIFO empty or bus not busy. Error events result in the
controller being reset and the error returned to the calling request,
but the function could potentially try to keep handling the other
events, such as by writing more messages into the TX FIFO. Since the
transaction has already failed, this is not helpful and will just cause
issues.

This problem has been present ever since:

commit 7f9906bd7f72 ("i2c: xiic: Service all interrupts in isr")

which allowed non-error events to be handled after errors, but became
more obvious after:

commit 743e227a8959 ("i2c: xiic: Defer xiic_wakeup() and
__xiic_start_xfer() in xiic_process()")

which reworked the code to add a WARN_ON which triggers if both the
xfer_more and wakeup_req flags were set, since this combination is
not supposed to happen, but was occurring in this scenario.

Skip further interrupt handling after error flags are detected to avoid
this problem.

Fixes: 7f9906bd7f72 ("i2c: xiic: Service all interrupts in isr")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/i2c/busses/i2c-xiic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 8a3d9817cb41..ee6edc963dea 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -721,6 +721,8 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 			wakeup_req = 1;
 			wakeup_code = STATE_ERROR;
 		}
+		/* don't try to handle other events */
+		goto out;
 	}
 	if (pend & XIIC_INTR_RX_FULL_MASK) {
 		/* Receive register/FIFO is full */
-- 
2.40.1

