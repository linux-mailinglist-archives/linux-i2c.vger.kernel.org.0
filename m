Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00A675FC7C5
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Oct 2022 16:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbiJLOwG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Oct 2022 10:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiJLOwF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Oct 2022 10:52:05 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0325DED2F;
        Wed, 12 Oct 2022 07:52:00 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CE3s55020005;
        Wed, 12 Oct 2022 14:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=NITcHVQbtLHKjNA5JWDGoNFeE8/JmfmEbwMAKDhff8g=;
 b=DTAgnzdsbj8yS4J7ADkRsznxA7yXFh49u29fPmXrzjcXBAXJubmDCVfUibLHh4m7aMoP
 z3XYiRJ0Pa49cJqop7+QnSzOhd1q30YOlRoCtV3th5Jc4Et7DJoBu8Uof3xUtKzUaB5E
 okx0luuZp3Jp9v+YO6kPr4vO/GkVDSW3yuOsXt01hf7bqOR8cWdciL8SWezQWljDdKP3
 Tmby0+Cb3JPym7YmUl6PvwRw/1t9WRNxEHVlvXIRtWB0beho1NbJulzJK/wGYCamljyA
 Y7K0xHEMBnVsHYwiHBb54/ch+nNQNxBXz3zgABH9g+pThpW8YFQwHX0GA0kKaFTqic31 lg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k2ymd1wj2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 Oct 2022 14:51:47 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29CCcKvE039747;
        Wed, 12 Oct 2022 14:51:47 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2046.outbound.protection.outlook.com [104.47.56.46])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3k2ynbgfcw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 Oct 2022 14:51:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/wmKp03hy1r4o/b++yeMQER8Om5qBgcO4E2IpR7zgZrw59NEflKd4PVaNfZCKzsEUyBuu3aSlmkzcSDdjPuagefmSq+8D3IBLRy8tMD+Dl7MHW6wNObfekKVPFcaZWqzwFxFpFDb06GANni3S+932pXjyJDcSHPyvBWJafFWBVGivpXb+dZ4bZ8HqBLhY5B3meeGbCv5M2HHcz0pYh+/CywXV1i+XiDAnvuSk3j8f+a/xCs1h+7zSjOrjoxIxOo3VwoC+SsgICLxD67N7elT04uZKfdLHTLNcXPurJXHgGZY+TVUcgRJf5q025aKSaj3nPHnNMHZZWvmOMOQGI9RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NITcHVQbtLHKjNA5JWDGoNFeE8/JmfmEbwMAKDhff8g=;
 b=AiZ9gVvnMv5ctXT9y4TGt3rASXqWotAYLxlOY+m65sjUebmUi38ZhmgJhabWWGwLJ66RnmzXZkcNuS3VEf6MXAraaH67Dp5qt7jS/Kh7KNWjSsi0QhPltAUIRXO706kkWUnia4YZD4L39aqKsldyutJtCqLGwB49IeSABiNhDuof+BXYOhc8f/E4otd5H0hg3HW0fBTW9VRlQjSfy/MRb+0v7A2KFDysiKNXXsD1ukWN2lL1Arsfn3DTkAt5H6Qk1sHk5ia/0z+K2a7wkNuh2SAhVLaXS5ACSZG5/JGflO56QYibsyQ5ZvXnYrvFtfRc2/7k6lrUP+f7HUAIGV8bzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NITcHVQbtLHKjNA5JWDGoNFeE8/JmfmEbwMAKDhff8g=;
 b=zH1MeVkJgZqK32s+Gti+vh6IlY2Ru7z6VahNZbZY+3Hhpm0wN0hxKrsykGgESvKYObfhE7VEIDLU6P/4ERbjmYO+PqKigRxNDNTid13Gz9TcqchXPCmrP37mHSJvEsu+8YL+wEzls05F8lS+4D/ZUSdzzR3EV/bBrpsJ08Bs4bw=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB5581.namprd10.prod.outlook.com
 (2603:10b6:a03:3d7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 14:51:45 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Wed, 12 Oct 2022
 14:51:45 +0000
Date:   Wed, 12 Oct 2022 17:51:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Bence =?iso-8859-1?B?Q3Pza+Fz?= <bence98@sch.bme.hu>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] i2c: cp2615: prevent buffer overflow in
 cp2615_i2c_master_xfer()
Message-ID: <Y0bUdt73moVmaajb@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0163.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::10) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|SJ0PR10MB5581:EE_
X-MS-Office365-Filtering-Correlation-Id: 104d66b0-acea-4902-5ce7-08daac614837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +vfUDZIFZOkQLNikDHj/5xXoos8w3MTMZe3mWhBSxqwj9RXufhbz3fFAjb1Xd1gEqtOo6dK8zKzxeGTgtHmNmAUsHvpMNnLfkD1mUsQoQv9HQdFrHPMj223CUjMDTwtpEx4E0BqG3Bps4xOsOTYObDw0DgP3QtwkT8RnZcU6TQYQnJ6dD/qhIjbGrkuTWfiVPWf3h8xkFjyiZGeKihGsIJRF2FWhGtwXIHh7pI3FRiKTD3rJ13NSGv6P3RsKqTJdn37T7tblkm4oZiTUi6pFwUuh1h7xgFU9UltgwY6puUlVgpg1RtPWYSvbTI+llqN091wVZL2pNLHZyMLFIYTRdGQpKqyrGts4TvSfSN8mN91sZIRB1koGZY+LQiUladnyI3M9Zw+NwV7LgQInreSfaPlQEpySf6MqyVPTvpF244StkLhjEfHuU1RW7CcZuTfgIpDdxZ0ZZm5/vDvEWls5f1pseKFTECyPZvWVXDfJTMeo5mfJCEFVMYe4kNnVz2O/pFjEO16aM3BWScdOlF2LZFvxw07zx/BzFjvMzJPORP9/rauDj9kAY6s0NCnq1UxkTz4k50Eb+EdEqt2DfnbWI9mmkTjsHV2B8d+LWEU06/p/a3YMLbWc8s3EfuwkF0Ml+4IaBEAMLCyXMSDf8AZKZcqr/5iNC3y3fyc0045coipBKvL+vmAJa5U0ohuesiEf4g57QkXAkb6S95RquLq1ODrN3YC05BlFqtX31tQawQHcycTfpJ9Yhn3IszHzrO/L
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(396003)(376002)(136003)(366004)(39860400002)(346002)(451199015)(316002)(6916009)(33716001)(6486002)(478600001)(186003)(5660300002)(38100700002)(41300700001)(86362001)(66476007)(6666004)(66946007)(6506007)(2906002)(6512007)(8936002)(9686003)(26005)(44832011)(4326008)(4744005)(8676002)(66556008)(70780200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uXPsi1yYX2jMJaCrLwBxDA4FCOVYheTtmgPQDcY+b1Q7JlGW4+PHYXft14+y?=
 =?us-ascii?Q?NZa5Fjej8r/chcCmgFHTvVKiT2AJ3puHl4pZMYT83RiqJ+Fx/5kzWYgSpkiB?=
 =?us-ascii?Q?EKmooq30dlTA5zTOpzQeebvit14x3FGzv7smN9jblSfcW+mwYrqAi9E/iqU6?=
 =?us-ascii?Q?fjKL7EyD1HJ+izh1K8qlzI0NM+ecUSNZqy5s+32ErqPs6T9IilQMuGISMJbx?=
 =?us-ascii?Q?LtI1VT0Wt+e6wrmZlZpBpDX/XaDweudtY/zGNaAvHSsbmLwvz99Qts4mSn+i?=
 =?us-ascii?Q?HiO1prjnylrzPjdqzgLJBRDTM7xLp00TofButVRCsFNJATLIL/AqrODnfbgr?=
 =?us-ascii?Q?mtPCBWlawyhFF4cFW8gi5aAPDl3bN8lRJwJaR78ZrC9Vz/rMQPBeVA9QT+Il?=
 =?us-ascii?Q?gtE3r4jPISxRqoX6WzHvlRFVATEyNcU+Sp3R3iXREtSNla95xf35I2a1O7p7?=
 =?us-ascii?Q?cQxeJIXR9BiG63TdhPnTaUzjcxyMHw7i5DF2Q6LEPrf23K3NPUGr27KZ9KQx?=
 =?us-ascii?Q?E9+y5MUo6vv4zdo0/mAKU0lcdSU01Dhr68ibHIwI5GnTt2SaP/4JH3nNjDwW?=
 =?us-ascii?Q?RxMIxDrlnTRu7yKpTT2DlfAGlYBazcHEQa5tAT3krq4gZfFu2i/OfrtYflKG?=
 =?us-ascii?Q?YCtsI2yHKDDk4xuLYqVSqnH/SpJeFU+Xh4Cy55my0Fjk/liaYW7K1w2lQYkW?=
 =?us-ascii?Q?p4chhvrkfP4/qTesG0VyyH26X49mUxVWBz+XyDyYgG4iwf9aog31fe9/8624?=
 =?us-ascii?Q?kNnmsJPbW25yWj3xOmbioDlbiy2JABThBzA/p6LS/0qDGq3xb2XuR7CwV9pa?=
 =?us-ascii?Q?xx4hLH7ssTjoG0QIBVV9Tncu34K71MqK3DpKHWnk2Pe8P0yKYzxG9Oh2rEYj?=
 =?us-ascii?Q?yWTVNSsc6CzHIh4vHPhd2J+PL9LJY9mTOc1nMef2hMZMxmgqsbDSXEZmsV8q?=
 =?us-ascii?Q?F21byA08vOqyhJY7WNv2Aciq13Q45apeagL3aE3/kvSsTKoncwci+iOrYzuh?=
 =?us-ascii?Q?b/I/c63agSBkaKxESM6skflmGe4cwexLgv615dkMd42uHnqL+S1ziahM5v+h?=
 =?us-ascii?Q?rpGi+MVDXqgIytlaRUFxCToeqFvCoNe+A3laA+KOR9dX6E7MrNUZ3fBrP/of?=
 =?us-ascii?Q?ylasBEBscUTRAV5KTJYm0ExddIL+89b0XEkm64VDwvLV+1K+Bt32CGv7exmq?=
 =?us-ascii?Q?0DUz7qzlnZkIVGCEOYxIe5WkB5NmKg+ki3z5ttCNRgIZ3sx61JPcXhqqLZa0?=
 =?us-ascii?Q?OeiLyjRs954ad9bleI1EqBjzMcXQjfVecI0AyqAuZbDaVmhRpSbCA1wkvJlM?=
 =?us-ascii?Q?hBKvbCfwe6YtmUNAdK6ZYKDvl+JulSZ/4jVwjMuFJWZY3T744NXseo+j04An?=
 =?us-ascii?Q?JNbbQ8K9FqW8TEP71wUFqMkT6XAsOCOg0SNgE3yNSJuDD6+OMwFJyqlGOXn7?=
 =?us-ascii?Q?BhptdsEGVWkoMLaGTJqkOUK6JmpJhQUg3ZyiGYauR4c6tYzaK+1Gy6Y9UyRN?=
 =?us-ascii?Q?D4uZGsC5nhRzRW09tH3v7iiYNM60u2+/Z6vTpCXqzSrhx2BNAPJqN9suggC8?=
 =?us-ascii?Q?iDZL/LNgfZy8tVPjVjWAq3TxDEI6PmHQC21x7DDok7EOCE2LsjWV9YvUovBl?=
 =?us-ascii?Q?Dw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 104d66b0-acea-4902-5ce7-08daac614837
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 14:51:45.0833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gI5/F+bK2pT1PUewNslOW/zzXUaZeNd6v1dZfgxfVw6ArMiy4HMuovMZV+wmoiuq1RqVVpvh0ztYUQYG1vixRvun3oXMki8P8nxhicef/Dk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5581
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_07,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120097
X-Proofpoint-GUID: A6OlnpuVTHVJYFE1c8qvWKleS4rOQexr
X-Proofpoint-ORIG-GUID: A6OlnpuVTHVJYFE1c8qvWKleS4rOQexr
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The "msg->len" can be controlled by the user via the ioctl.  We need to
ensure that it is not too large.

Fixes: 4a7695429ead ("i2c: cp2615: add i2c driver for Silicon Labs' CP2615 Digital Audio Bridge")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/i2c/busses/i2c-cp2615.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cp2615.c b/drivers/i2c/busses/i2c-cp2615.c
index 3ded28632e4c..ad1d6e548503 100644
--- a/drivers/i2c/busses/i2c-cp2615.c
+++ b/drivers/i2c/busses/i2c-cp2615.c
@@ -231,6 +231,8 @@ cp2615_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		} else {
 			i2c_w.read_len = 0;
 			i2c_w.write_len = msg->len;
+			if (msg->len > sizeof(i2c_w.data))
+				return -EINVAL;
 			memcpy(&i2c_w.data, msg->buf, i2c_w.write_len);
 		}
 		ret = cp2615_i2c_send(usbif, &i2c_w);
-- 
2.35.1

