Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 901EB5B99A0
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Sep 2022 13:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbiIOLbk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Sep 2022 07:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiIOLbh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Sep 2022 07:31:37 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3FE92FFDF;
        Thu, 15 Sep 2022 04:31:34 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28FB4MKC000834;
        Thu, 15 Sep 2022 11:31:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=OooRjHDb7kbQ3CtOkDzOZ0m637wojHuM+Yp6+7oTL+w=;
 b=rNWxyw5Sm8qFVUg0TTkIgZhg4b0W4aNabEQghVeAG1W9As3hrI2RiPvGnNGP7tUxIcSv
 C7DvpP0IYyXKlttj+mlEinoAcOAcJzbnAieuBjVC0i4IITwc6t/GK83Y8AwbPtQSGV/w
 we37ItWRwvQwHH2TG7thqsPdy4eWlt0VXintxLGeMGMV1DsDQghPPYyjvmS3HDRugxI3
 jaaQ1jKjdnUHKwXKLMPEPL1xiIoQdhzFx1qNv5UkVMHg7k0hYGP2sR/x6x757ABhHpFN
 BYQaGKliYHZSdmMm0zK+quptshmbofJcoFS1qC0gr50Fp5baFirWEeQ4i4qIIUpjhhtx 9A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jjxyf4tdh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 15 Sep 2022 11:31:08 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28FBUUYq004553;
        Thu, 15 Sep 2022 11:31:07 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3jjym11m8m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 15 Sep 2022 11:31:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebqiJEEELXR+SU0sFibCdux8R0luj9Z83JXmIKGoqajlY5V3/xKfLPc2Itz3sk8asP7XMM6BpQKfz/N54JF85uLdt329A7EcRFfpt8II9tmk/Ntlvo0lLL4/PKBopie5gkIAwo0w2JWDLfNforipVpcOMHGi3LanEZDSSTDIw6hhxqRhYj/bHgyz0ZqAshKrqDj3oSR09bPKe6+S5Ha/SM0bwQKfHSJeCEueJkk7xJrIxHAFOaBfe+zq1emBPI8Yam5t/udO1YPyf21RzylCJntfyeYHoYXdVXUPLvcnDeKnhF+VeakNNIrrlgPPfkIT0zSTBM8XRJGLTdRULfcf8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OooRjHDb7kbQ3CtOkDzOZ0m637wojHuM+Yp6+7oTL+w=;
 b=nrFmjplujpFhPjntUdT0HumEFZAYpfFBdgoQAmEo2Vs7JEb1tvDxlnO32CioZNeHpDaXEYBvhzSsU/rLVimD4LuLAPNjBKAXad8iEVjheA6BXIVmz4fn3DhLFr5hP50PunO7KNBBEdCxZVdTy1/nVl9ipG8DRfLrMPLKANDM7P++KoKWftK9W09FcG3S/fVROoEB+uvMUyp2GfitX0RAS4VbqPm64a9KuFg36BJCteo5qMSGC8/WlqkAkm53KS+TGtkovThTt2UeCSyhfviVPMeIYBhVsdEDKZ6mVlaY01vuCJc0CeZfw+rUkVHsVF8QA/5UW2qrQ2RGsnbvxggv+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OooRjHDb7kbQ3CtOkDzOZ0m637wojHuM+Yp6+7oTL+w=;
 b=evEc1bFyWcnyvahHBKJNIA7vRTVRnpfMFJcAdQIRTys6wG59tFZGyfJ3if18XvEAraqayoK+z1+JUgAGV52sdWBR3wPd3eiMihSH72nY1loA72QlRXiIbtgzPS9KnfOM3XEoH07sXjnbInuWOQmiK0i9+CU/ZLVVjQgAj4L+6o8=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH0PR10MB5707.namprd10.prod.outlook.com
 (2603:10b6:510:149::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 11:31:05 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 11:31:05 +0000
Date:   Thu, 15 Sep 2022 14:30:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Wolfram Sang <wsa@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] i2c: mux: harden i2c_mux_alloc() against integer overflows
Message-ID: <YyMM8iVSHJ4ammsg@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0178.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|PH0PR10MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: d1893769-611a-44f1-5f86-08da970dc6ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pDtff4V/NAb6t8CVkVFyK2aXb6yCKTA0s43AWCf3yWB+a2rdnkNOJ/AusoIEwwvplFldySrnJqoWxVQ9IVIxBaNTuUv843UFnm8ZgXX0piiVdaSXhmcCch7IUj+NAh7Bpzu+3GjQibqUwmb5ZwDPHEwrh25jwbTGIIxRnB6gSZrP+o0YhiygREWpG1JJbE+Gd85gB+I20vavDaQwxK8e3yZGcX7FH3juzah3OfLCksoONuQ7/G4ltAN4gxhjCrs1xiDbO5vcAsMbqZbWSvtngHR12rsoZDIW7S3ptZjT6myeTFZ/piJSUqW7WwHMWZBzdCIA+7glYfURme5Zqsy+eXBbxaqxg6miG6w3ETpw2gWz7+i7gD+5+OwGOajlABwqFZcaYLeuPHyAxA+Uv4qNXfRZdDlVb++WcmTiSO589NVRcfhFebANWens1MuFByomuG8zUCOL31Y2qcWlULdOhEQkT1YdusNK0yZHha6JZN8bTSa4OzZP0GI5fIMXE19c1131KJwDkjNChQs38+iBknpsDRfMir4q7cqPF8nxL7BCiWhk64UHDxoKgQ0Arpi4uzndrYGmpoQybnAf06g1HqKJahkOBx97XgXtKcr3hMXuuF19xYvrVPsWUoOTqS95HQ3VsMm4oWG4BHt3ysHvO3YZvuo6lVZqAn47a0R635sIF77J7fgHGEsBssKUSrt9Sl2HANP4PMi+pGtV2iolug==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199015)(5660300002)(316002)(186003)(38100700002)(478600001)(6486002)(2906002)(8936002)(41300700001)(86362001)(6916009)(26005)(6512007)(54906003)(6506007)(6666004)(9686003)(44832011)(33716001)(66476007)(66556008)(4326008)(8676002)(83380400001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rGLP/stdEDUn+cndcm/abh6MPdY9XrdBw+lhCrTJbVNDPgw1l4kqHQt4h7jy?=
 =?us-ascii?Q?QYAGsv+THcHlVNx6m7vP9JoVrsLegddsLHnru9fLYDSsFrM6hboUDPX9paNe?=
 =?us-ascii?Q?7n5aZSZt/QfemdaDleZqlNv+PPxTRsQ+fYmRQO8old9odoErPuzrZGiCQMO/?=
 =?us-ascii?Q?9E7kXmTnxlXQ449xyiRvzQkJooALMAt5PaZ/M1yRY4tWXMexI3RvnzqWiIbW?=
 =?us-ascii?Q?FFj1+BbOZbD7U1E2Yqv/0MeoYjiZParvRwcBkjFWmHLk9ntq9FXgDI/TMToK?=
 =?us-ascii?Q?WcOv1rwnXIHr4pcMvBBppWsYK7noE2mdTH/HYGBTnY5J0oVYvgxy95PurN+H?=
 =?us-ascii?Q?MO5YFs/5m1IivJNzvhTC0F0XrGhgSgSVLEIrmW7OuKK0We2QGjXUmi6iLEwu?=
 =?us-ascii?Q?oUDkUMAaOgWgWn4Lsdiq2+CNhfYbPCVwWAuVEY+pP0cXxlFzWNCwsX9Y0udL?=
 =?us-ascii?Q?ckzDHjSVcqnAFhVSaBnHI/lyyEzksMtMegriWpehz2UNSFycUZjWrbqZ6fjk?=
 =?us-ascii?Q?KLQxSCTs6CvFwEn+/nFrxcc/VUhusNSl68DkA04HnEZ6rdwTa7E9MOGR0Ryk?=
 =?us-ascii?Q?nEJxwFV7ORN1xUNbt115jvvIh6FtWp8f1Ub4fMI8ScnLg//hKzyqLy4IOAtw?=
 =?us-ascii?Q?hR0tOSYo1HaxYgtQ3T6wDnCJX4ujJmqctzVTOV0558pysdZJt6ogIVVf2Arz?=
 =?us-ascii?Q?ZxAATY9vQfK5/xaIGRokZa5OrlInuRyioLygnHJ15zJP989AKRrR4PzerfNL?=
 =?us-ascii?Q?P8/7ahnFSpDCHNZOIiWtl0RaTVWnlKYbBqLrAi+CSkEjwEByd5nXVXUcyj3v?=
 =?us-ascii?Q?2BdC8iFZsTzoK/VEZeZiRbcmD0FCUE2M1lP+9G4OgnHL5Q9IFe5S1mRHVqF+?=
 =?us-ascii?Q?t8PJ5OkyMorUsWjOENA9Uok1KD6cwYHdFNxTvj5brq2AgHTB10suWSmxpxWS?=
 =?us-ascii?Q?Wcrx6XNW5chLxZx33QtxtM+ZJ/uNHPcj3wMZbBVj6Cc+pch/1FYz6JU77ymb?=
 =?us-ascii?Q?oMZWgftRIouK98dUNj655ryc23OdFxDj1v8tuI9qSoMrRjCMfrASGIgKKCIL?=
 =?us-ascii?Q?CquSUIizw6//UVx5ERgZ2dJgeVvJ4jTWnttIFevIcNiuDGzcW1ViGR/Ncde6?=
 =?us-ascii?Q?3qYCT+QarrnKE3fkPGFi/z949pDXVLlWH/T62JBCFBRF8E8W0rnL2jFg6G/K?=
 =?us-ascii?Q?fhdMjJOCfBAV7Y/rvqpj/TI6J1Cnr6UmHwN+RiWfMaGmISjapbLdEFw3f3jj?=
 =?us-ascii?Q?EIFjWc4D8+K5wAmlJ5bYil5T/heNirx6Ojn4vE4EpyuqG70IKVscOtWTEgn2?=
 =?us-ascii?Q?oWcBbvGVBCwWkln+TEJB0VHCjtKy5aT1bGqYgnD1ZvoS04ZAcgU5XByhJQeO?=
 =?us-ascii?Q?a6PFRJm+51HwhM47B4Dw6gEfu9GsY6g7u+sgY0DqWgLN90CrFNapxc9T74zf?=
 =?us-ascii?Q?g4aZbd+44lo+DcuUMr5CD2oTNFhECJmQJjHgQ/RIZbVYENnGhWDt11Nucj/w?=
 =?us-ascii?Q?EP1ivdqtPGlgs/TGPlvcgDxmGcmUxos2FmdGc/mAcI7JIwUHV2ruHGjBcnSd?=
 =?us-ascii?Q?UTrel9bCJx5WdqHpPuIlfuQu4eGrbWNpKT0S0hoBtQvryBiCzrmgI10k+cee?=
 =?us-ascii?Q?EQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1893769-611a-44f1-5f86-08da970dc6ab
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 11:31:05.1085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NF7YC5kStTEJTsDWyY3ocGLH1fmuyyU6JxwtH3Zam5czcAZYRe5fxnWe9bQ1RvJ7kSNAxQU7ADU+lpUak5sYHv/WzT9AniWcMM/quWagOE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5707
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_06,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2208220000
 definitions=main-2209150064
X-Proofpoint-GUID: 1FtHd-3_0eJYiQGsH6BsvS_sfkZMSzkP
X-Proofpoint-ORIG-GUID: 1FtHd-3_0eJYiQGsH6BsvS_sfkZMSzkP
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

A couple years back we went through the kernel an automatically
converted size calculations to use struct_size() instead.  The
struct_size() calculation is protected against integer overflows.

However it does not make sense to use the result from struct_size()
for additional math operations as that would negate any safeness.

Fixes: 1f3b69b6b939 ("i2c: mux: Use struct_size() in devm_kzalloc()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/i2c/i2c-mux.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 774507b54b57..313904be5f3b 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -243,9 +243,10 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
 				   int (*deselect)(struct i2c_mux_core *, u32))
 {
 	struct i2c_mux_core *muxc;
+	size_t mux_size;
 
-	muxc = devm_kzalloc(dev, struct_size(muxc, adapter, max_adapters)
-			    + sizeof_priv, GFP_KERNEL);
+	mux_size = struct_size(muxc, adapter, max_adapters);
+	muxc = devm_kzalloc(dev, size_add(mux_size, sizeof_priv), GFP_KERNEL);
 	if (!muxc)
 		return NULL;
 	if (sizeof_priv)
-- 
2.35.1

