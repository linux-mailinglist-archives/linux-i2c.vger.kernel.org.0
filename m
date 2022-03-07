Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 596554CFF40
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Mar 2022 13:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236619AbiCGM5U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Mar 2022 07:57:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242597AbiCGM5T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Mar 2022 07:57:19 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F3489322;
        Mon,  7 Mar 2022 04:56:25 -0800 (PST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227C1VLX006962;
        Mon, 7 Mar 2022 12:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=TB617sFbTnwIrg+OsyAegoub/K+qRhnHNRLAdBOjhPk=;
 b=rjjQc9X/75orepVpehBDcqDs7MkrQrTE7Kl3oh6FbM9CRGDpXyfqT55vzby+CUsl6B3h
 qiK/m6LTNdBJH7N/FulT+ghOXrNIPl+dbP7pssJ/D42lJAJ44spQR4o1kVQmutLbYc22
 UoWnors2A+5XmGpJWcfScgdymAu1JSdPPKOgKEpjrCexhnfpvrBbROCNGwsy7HythjgT
 R+y1R7Cv0zpJqpypnuLTqrsTX6WgjpS8ZfdySFEfu9aZwuAJTKKdiNWY6g+5PG+n8Ls5
 Ct4JnP/ytMqXLwdy+dkMvDfgW/B3g3ks+T5s4QR2ylc6/+nCE/zLD7S5aHk/fCOs42zC bw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ekxn2bq93-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Mar 2022 12:56:21 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227Cp7Ld040701;
        Mon, 7 Mar 2022 12:56:20 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
        by aserp3020.oracle.com with ESMTP id 3ekyp15e5w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Mar 2022 12:56:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtlHfP7JpUPPHDH1rF1xAnFHrk3GhPXerJy5PLpSj40hm6KKmR+S7b47hM2DPVxwfrPidm11PdXDDukq/n0JpOB9A1cr5fGZoLGGborep0/HI5tpWrPjNfMCvRfiWy7BWZTBvD4tX1dlxXK8z4A41qileSifuZFMXC0YVyboD4pyuvCES8QKSPe+WHfKu/cCykaoPQXI8s7gV251+1coXe+wty7o+c4XHzuURklTHOPjZ0zvTiQLc4vuEDqQYHa035eJwWBb7q4LV2V4RTDiZ3YqHlP5r9YcwMDxGadLIPXSixWQ8fqlGzCS4CAgi7g59gyXJw0TcEDt3Jr7q/Ce6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TB617sFbTnwIrg+OsyAegoub/K+qRhnHNRLAdBOjhPk=;
 b=PxpcCl7UMtHnpjj76yvo53++c6tmdDpc1XQRKC2XCusEQXfpiuelebnI5cgrQq32rRde2q7rRdtJ4C2mi2GXZVKgpyCXNOrKmi1mBw74Ryu8GT304u9TDQWR3WuexcpkMiv1YwKdOYGM4Ws2fKq7xrZzIeLyeOoN8HFzgMa8vq3z/9gEB0HE+BHWygHzXHSHQNoHrU42eKjLFNfkR72g9Enh8RX5MIlSLJWlsbkapL45T2ZL7nL5geuabqKQkfwgsh5AiZcTsv+YYAI0mBPezdkiDG9pshVE4onvNfoIb6fs8WbVKdm6ND7zKo1NxKA92321m2O//JRYXU3YoWrvGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TB617sFbTnwIrg+OsyAegoub/K+qRhnHNRLAdBOjhPk=;
 b=rgJn8nAtQhAu69vWKaveHv0kutkOhLBHe0c00hULcf1ltQmVUnjln3gE5hfGecHXCvf956EYxGdXOyN7UjWcSUjscO2p0aeGD12/eTXDoLdPG5HZJBMxPLwwf8t2YkyNLrW7lyWDbzc3HJjYmq4b9Sig5SuHPWWRlxh/I3mhzc4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1614.namprd10.prod.outlook.com
 (2603:10b6:301:8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Mon, 7 Mar
 2022 12:56:18 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 12:56:18 +0000
Date:   Mon, 7 Mar 2022 15:56:03 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] i2c: qcom-geni: remove unnecessary conditions
Message-ID: <20220307125603.GB16710@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51945fbd-a3d4-4db7-4381-08da0039de98
X-MS-TrafficTypeDiagnostic: MWHPR10MB1614:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB161449C186CCD93FDFDE43BD8E089@MWHPR10MB1614.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dvWTOa8tvAnFMuFjgDkh81XZx7NlcNBheee8mdKAvcwPMgtAQcvTZjtmeCcC81KkqAbvD9s82f4MXPNp/80F8Z8a/XTRxMswRX6yGcgCER92a70EHcjXF2Orz+LZ7fi53p/eT08gTuG30Y++N8Z2Xy1wbR21HjbK6+WGAGrURwfhJxlp6t2wERoKTd2PKjUOt4dv0WyIWGSRSZ5gt6bfq3k5XBl2Vg78JKfGqkqSWuY+ItQxql8AZWYZCoHPUT5gne4wgLVgW5zVNaT/dn5e6MimgCI7pUVqEeKF1fA8DQVfZZ/Q2QiXKRyAhCX4Z4rCZl2nkbunskEFTfVqLjkADK7A3fvQEp4QVguGuj6AnJp3JgZcH/pmcC0X+WWDBoMmUGO1yBfEXT1FhcVPwvuFYZymVBUaWx4lwUeRewPKnb+5eKjrznuYULRaDrPwsA+npQmU5K9xHOD+EQD/jnEyxiOxZqkiubghmGx49NJ7luTi0X0FG4wkeqnpm6BpXY11kEEHn2au6di5W0zvy+7410qkPGFcpkDkQGCux4SGZjX0sa3RcRiuz8Sbvupdbs/JXwDDTvBDHVTGfhWD5GMp6S1S2kbjcUSb6hFOOMMLreQaa6zKuCa7MAHaKEjvVtqfgUMJbV2MTVGjFMZwCL2v8Wldv/iNETznrZqf0fwYpJMVLnAqqvm96JeJvRBNLGop3LwbU8DiQ8oaPVhrsB9ysw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(2906002)(4744005)(44832011)(508600001)(6486002)(66476007)(66556008)(110136005)(66946007)(83380400001)(316002)(6666004)(9686003)(6512007)(33656002)(186003)(6506007)(86362001)(33716001)(26005)(5660300002)(1076003)(8936002)(4326008)(8676002)(38350700002)(52116002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aZkGjYNDKYnM/6D6Et57MVjQfS0720HFlc8GTLkfZ+hCZdm1haccZhECIMmK?=
 =?us-ascii?Q?kgnC3j5/GsTZmeUGQ9RXg7fSIIacparwLNpDNU7/dTQMjVcXGBeqIfwvITWT?=
 =?us-ascii?Q?pOdteSu8uSTXIITInlBMxjHeThzkjsc5Ebw94UyVDTtorFXTx36WmFL53lrC?=
 =?us-ascii?Q?5/B/SZwkpEfLgwLEpogZDJbT3glIssycsGaAukahQ0/fFkOm4ncyYtAT7OK8?=
 =?us-ascii?Q?GP0phhpeQxVt483DlReXVtSfIAeyc3M3uA9Ce+C8jKpp2WgVp//6jiSPmPN+?=
 =?us-ascii?Q?/celRb6i55tBBH5nCmxi9LQyK+fQ8+17fApb0RS3gyAn+NxvEjnP6/E8KowQ?=
 =?us-ascii?Q?3Cs9jDLQaSCs7fGRQVR7kp5MT63RqeWaVoT7Adgzsf3HQApOcK1zzpIw8H0f?=
 =?us-ascii?Q?U/k/uD04TFFQxaYU78ulTgAf3NnLNsr2tviB2eydIVwr1kCQUPBHfLjWeFQm?=
 =?us-ascii?Q?mylKkbUg/gGris0xpGRUlkMreyAUAGZJiW/Wos0ChJdNNXjXEEuge+z1Zu4R?=
 =?us-ascii?Q?y4POwq2fxtrkvgKsqLrinR/JfuMk4cbEJske/JNqcVHVvmQRAy7Yw4d9tRjh?=
 =?us-ascii?Q?wbzuHqCXr7snorF4L6mq3uBvrpvKeJ/cNIsyhYlSzkirK/hgxKD2nHh9Q1W7?=
 =?us-ascii?Q?JHHFkZiDz0eYXzNZHUhewxtQ0OeGvworS3i+cMtSSoa0AqeDI8ItOA1MzcD2?=
 =?us-ascii?Q?Bvsf3Ki2fZ3U3YlafG8+Pu3i1Jc6etw27E6TsxfD9Twqsq7dIR1diG79VLI3?=
 =?us-ascii?Q?7Bq5r63BxTMohlbe/FnguVYTW8rbTT16eumIDCu43H4OZn+dDYPesQr4Z8hj?=
 =?us-ascii?Q?KtBkYpNefMkAjdBjdVWDGHS+GDVwKEjrl/7h41xkIF0y9rrJio1LHkO/DUz6?=
 =?us-ascii?Q?ngJhquXSWxjhjpCwk9Je62iBKTs5tfSb4vlmvacLy2H6XTHUNH5ts6CaAsxO?=
 =?us-ascii?Q?WVll7p4bO0ok86Xrn/JJ79o2KB80jHckWM6gsFVq2+/9omqQGzgus1YOOfAD?=
 =?us-ascii?Q?f+rwScZkz8GtwsGKyq24T73RO9my4xbb67KkbvRUN0rn3XEFYHbe1LX1DFKR?=
 =?us-ascii?Q?/XpVWsPT3V0+8zgFDB4ew8Ys7XvUyGmIt3XUFV9JPsL2WzQCBSQUNNKt2bgL?=
 =?us-ascii?Q?KUBWzlONBWLT1s0BhyYD4JTzOuBCyF1BDVkV+WwysE2tmUWpxlg2Oy5oEhuW?=
 =?us-ascii?Q?9lcEyeCy08DZTyA1ft3CWn8GsVQmAnVz+vgXpAF5l64cN6r5SWgUysnKlVdt?=
 =?us-ascii?Q?sUYF8j0Blv54hZINI6ZYf37sKNbgRvAu1mpWKigHiLSS8GARRHJONCn01yF0?=
 =?us-ascii?Q?c9xApg8uPnyJQXdAL/qLRC+sMN9pNqUGZLAC8iVkskAlkc0EqNyB7w2lJQNl?=
 =?us-ascii?Q?6GHhTFrEiflNfBuhWB/kIkrWOXVBrTFmkCzWl7n2XhnRfZmNiSltcEL4pJFo?=
 =?us-ascii?Q?EURoBLb6XKRXcUGDgMd6NRfJZIPUJX9uH7w2wZFSK1AAUgqoYRzblmlc7M1S?=
 =?us-ascii?Q?mG2gyZ6cHSL1fhXfKsmokVsTPM2u2aJNtdJKOBEtha6DfXV+TPFXVQWcEPsA?=
 =?us-ascii?Q?USTP74S+CXy2uIiZOQHCuRchmBIwmihf/k2cFS2xFOTMSQs7g8oSsfB2/hRA?=
 =?us-ascii?Q?HVrAhNVLKGvGHqzlzepdaeCugGRiH2krNGppCA/+g7qqzzxmpdAAjGE06iZ7?=
 =?us-ascii?Q?jFXqaQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51945fbd-a3d4-4db7-4381-08da0039de98
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 12:56:18.3533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sX2usXzEqvJdK2e9WsuyVsueDOp3HmauB9pES/qblazvXArZdVxqtLqbdC0LUYmVslZiGuMO57MqETp9GVsG486vCmf+vcj7GPqn2kPWsmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1614
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203070074
X-Proofpoint-ORIG-GUID: Y4_N_k2tNQySvnFqctNWTDt3tW01ttGe
X-Proofpoint-GUID: Y4_N_k2tNQySvnFqctNWTDt3tW01ttGe
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We know that "ret" is a negative error code at this point so there is
no need to check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index fc1dcc19f2a1..17915c98c2c4 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -727,16 +727,14 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 	if (IS_ERR(gi2c->tx_c)) {
 		ret = dev_err_probe(gi2c->se.dev, PTR_ERR(gi2c->tx_c),
 				    "Failed to get tx DMA ch\n");
-		if (ret < 0)
-			goto err_tx;
+		goto err_tx;
 	}
 
 	gi2c->rx_c = dma_request_chan(gi2c->se.dev, "rx");
 	if (IS_ERR(gi2c->rx_c)) {
 		ret = dev_err_probe(gi2c->se.dev, PTR_ERR(gi2c->rx_c),
 				    "Failed to get rx DMA ch\n");
-		if (ret < 0)
-			goto err_rx;
+		goto err_rx;
 	}
 
 	dev_dbg(gi2c->se.dev, "Grabbed GPI dma channels\n");
-- 
2.20.1

