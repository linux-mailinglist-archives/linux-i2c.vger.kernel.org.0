Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 428895FC7C0
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Oct 2022 16:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbiJLOvl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Oct 2022 10:51:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbiJLOvj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Oct 2022 10:51:39 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 361FFDED35;
        Wed, 12 Oct 2022 07:51:35 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CE3oWi013110;
        Wed, 12 Oct 2022 14:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=lX2+8G7/HgIVWgbjbkYvfW49G79RA8Ck29lMyxF6b1I=;
 b=Mj6yfjaz511kInvJ1dyvxFZFFgJ7oHSWNl2qWRu2akb+OvXncCC78pXrWiAHbtNaYWRc
 3zm7N7ArWLk1nk9p4MQKphWjjiu6LoK7hiwXenLVMwD3TvDhH+61wI0WNKpL4V5QHgLu
 +eLgf2e9xaGFTr4d6RTsRd4f6jfn86L7K5jB1xEvDikCOO1jm+9z+kb9rHWqyLT5oBl8
 GuBY0H8NNEORlxHxRou7V98iucgLY367NcECo1rxgoOS/L3fQ6vVMPQHRn6AA7qH2xKk
 55/VBUwLY7sYTqBZFBykgEyACesCIeWTEzWkKrQJQSsHSWrKH6SqBTeQ8W1h3ktaQSCw 1Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k2yt1jb2h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 Oct 2022 14:51:25 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29CDL6N8003640;
        Wed, 12 Oct 2022 14:51:25 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2045.outbound.protection.outlook.com [104.47.57.45])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3k2yn555xk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 Oct 2022 14:51:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7y1VA5Yw9gYqaf1Xsa6CfWvZ/z/GkPOjIt4HnXMknhYyJbH/M52ojw5KMWZLa4dzeoqNzZ0SXOmEcgJiVq0c8h3suHfrJE3R26zDecrGkpHsseab+wv7UY/WUFZqXMItye8EblMBMc6sD80EgXW5npkfyQjvCYjb9/sgB21C9uNEetylmA2OZnTrDQSo7LLvTXlqJI9EN10QN7scizlk/ZaLX4jId592lyUASIiglrD50bx8aNlEg6QgFAENuVxrpNlLWWkHFl+HDM1N1zkTkDfDa7A4bGZBBTsOXgGfSd7AoHmoctx9eYtesgwGqHBhun3QQDyVgzNMKxiLStiag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lX2+8G7/HgIVWgbjbkYvfW49G79RA8Ck29lMyxF6b1I=;
 b=YXBGOpVcMRC1bCzzOOuSpPkNA60Wd3R2RH71AuZ0VZCq773U4ncag3CutFeDY9DwOAsK4LXb43d1Do2tzejENbyBDhZJdvieGI9EBveP8uClehy/RKEW7MioLoR/Armv3Fp8O/nuXcWRbr/6X/Zkyw42lf9DANJYP27tPWaiHRwLw+AxK1YNwfwHbx5DGhd2wWJsCRWh9RVoYYS4PYB6hngFGSgg+wAkb2+z2+uyhsZ7Y6EDCAhEN5P/EJnWlO0Rg7A+6DAk52LqT/hf1ls5E2ZQl3D2gq87BWiTMyQU4BGnm3SW5UM3vDZQhtGrwTXPgNYiGTylKosMLp1bkU7K4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lX2+8G7/HgIVWgbjbkYvfW49G79RA8Ck29lMyxF6b1I=;
 b=cHqnHJ+wreOcICdTIY2qSUpvycX/Pa3WqpLsJhJnYZzDn5YInYAoFZ4pEGckebF4U8hmgHD0Kq+RAUo/Xh6S8xHyEWOJPLU1B4e2eTLOSclnAfaGad85+z+cIxakb2jFq+u6NP38SUVCqTN4xNTGuS7SqW4mh92vpz1Plmbff14=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB6605.namprd10.prod.outlook.com
 (2603:10b6:303:229::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 14:51:23 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Wed, 12 Oct 2022
 14:51:23 +0000
Date:   Wed, 12 Oct 2022 17:51:13 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Octavian Purdila <octavian.purdila@intel.com>,
        Laurentiu Palcu <laurentiu.palcu@intel.com>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] i2c: dln2: prevent buffer overflow in dln2_i2c_write()
Message-ID: <Y0bUYc2fadLgoQfZ@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: LO6P123CA0035.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::8) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|MW4PR10MB6605:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a170bb3-ddad-478d-b180-08daac613b1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kZY3jGa4PG/o0LNWNVmrnD8Gp/rc39OIY+hQHihyUAYPOWGjj6o/h/KFqFnsfhTpT4p85TfEc2WXfIwj3CYaEALrDldLGjB4p+n/u8KSWo82v7jcT4f6UqV4XyS6IKXplNxnmcSvMIKGLZ7/2q+M+PY6oWktlytIOeWiD0T8pWMndiR7dnrzT07bE94pXA4awC5O8eRexwI/R35i3ntFkBoNjSQmy4EYmVzcMGhbi5NSe2FfM55FhraWDTu9qI7RKr7scrJglg7xfm6NyaePFr3O27uUUAsvTvGoGx1Yznh9MPmS00mXbBM5scMFZv8BwDx7xqWHn7BjSSBBV38zfUDw3GOYL7EtxGjyYj/2VDnxWLnUUmdT+vJmPGWl0Iww2VDiwlVO1AZe6deyDw7axSK1Qn4L6fXqSbz3vR2qCMR+IVv2KwAKaVfTsU0EZKWDFAJ1njMQCUNwRectwvR3zRxGE0NQYVU2zEeNVclIlOzEImU/jOxG0I5AOcxH9BWi3vZdIX8crmHSZjYfuVyFfvk6AWzxKHnrF6aGBaPgZgsDXtJ8eHQPQp+gpxnttwnHNypw9mL7QDf14Xg2FGCwWWnylIyDFf+mdeD1QHZGqUSEsmANyfrn9sP8F+tjsyJz/P73fSXxHkf7g4csxn1aiHB+/mZyzu4KZo9Jrg7uuQxAcx/22eVlofUGLI6MtLHCyBX+k+NlBt3pHizdp8WSi/Or6E7c30SY75UpAa9BFOxCV0Qlor6zS4kdn4Qt6DSd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(396003)(366004)(39860400002)(136003)(346002)(376002)(451199015)(6486002)(8936002)(2906002)(44832011)(186003)(86362001)(66556008)(66946007)(66476007)(4326008)(8676002)(316002)(6916009)(5660300002)(33716001)(41300700001)(54906003)(4744005)(38100700002)(478600001)(6512007)(6666004)(6506007)(9686003)(26005)(70780200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qmKYMAuSsgJ0y6RiajbdHWI97NvJD79YJtPUWKbmrsOaWXE5mr2zpJmHA5V9?=
 =?us-ascii?Q?Ev74ErSUjdZqLyO5PwKr4SOYTZ1/ASG+/3tI8Jeyv/cThvz0oeNamTA0Xgh5?=
 =?us-ascii?Q?6iqAQjlGVOQNKDXldrS6ICkg+GxXXhBDQoyNYUXLkMKwx3zXDDsOeTTczX24?=
 =?us-ascii?Q?0EEtVS3da/lSly/x0B2w3979wmdQYF7uVgFQ0++OONMtxOxIQyHpwOp4WZMv?=
 =?us-ascii?Q?uncYntktPP6vxFK9uie1QWIZ0PchvuqWuahDK4dDLQmLRo+NFwVYnUBDfeOc?=
 =?us-ascii?Q?ygNbWMcpFrnemdfFQUyqlNjYQeEouJwOnCpO8yk6gsMDqao10Kk9/FkHugVu?=
 =?us-ascii?Q?u/2VmtrYK7etoT9OFAEFKI2dgiwIi3FKDVh2QoSuJQhCSwxMyEPwnr9gfN1s?=
 =?us-ascii?Q?qBOje1Y5c/Rp2VPTp0ZdYq2JMO8G3RuMmuorzt358MIi00Etcx07wvlHmgif?=
 =?us-ascii?Q?DoMsPNADfTHeft/4ECpNc0W5wVRwiDRdBmMcx3kEtnRMUYSSe/nQtW+FD5CW?=
 =?us-ascii?Q?6Udlx09pfT5dTMwbS89Zxnd6xf2PDdLHJt2ecDxjpBu7R9dsOL4WA6k9olhc?=
 =?us-ascii?Q?ETtgFlQtnzCZ9iWWQwQUUl9vOUfYHT4YM8sLr+PF8Es6zooq2y0ZM4hbzktU?=
 =?us-ascii?Q?/dyZkLLbp5yfDlcp6P8Lxnico0jeJBLG6hhf3kZ5nIk1sbsF7GFL+8dtgQ+C?=
 =?us-ascii?Q?COuWWJmZsjEpK+cEknRZQ1vzf0OkYvtA89QvuqFrzgYj9K0qmOuHSHBJAUwG?=
 =?us-ascii?Q?Z1tFK22e1pbpvwBNxDwT2FPIyXigqWsiBhAG6lMqISor+CAKOeCrwWO5N/W7?=
 =?us-ascii?Q?tALvaV0loQ8eVe1alAc0ks8NSoirI3BK2FSiuxqSIMZyDl9d3D3j4TxQWqP2?=
 =?us-ascii?Q?s+UBhGf0x/h9PQb1X7192UFstpFOAqijIW9+Bmj2cG1iOC7/YMLE3n6W0Vnf?=
 =?us-ascii?Q?IEQVvnz6b4o/lcuGGqVDc5hJlYW1CkBS7IGBSj258gz/lLjsxH+UKemG2UJU?=
 =?us-ascii?Q?f41w8tx9rAM01dMHAFABjbF/CVgqaTPb0t2bMPoReYW52AIETmkCR/5wiH0a?=
 =?us-ascii?Q?bbVyuNgDYDRaklE0GWyd8zu7rTU73kwRnze56bkcdxOa0lBDDxpVsnzwJF2s?=
 =?us-ascii?Q?MYr3ItKJZ4dSSpXzggQKoCOgMamZdJn2ous7jeZgMUg6qX0Uv/LXAbExSVZX?=
 =?us-ascii?Q?ZMcu30bQ5Ieb9PmXsvee10bEWZpQ/JjJIHmQYEzT+GoV3Rlxz2/tAfBZsXwQ?=
 =?us-ascii?Q?o2rn4DRorpT+GK55Oiej1q8sS6jbwtgxp5JzEAhdk6a54AvLEntflqpm006o?=
 =?us-ascii?Q?DwJ1cOyyI93vrQbkJChtxW8/w3iQmkf62ehr7oHlumLNUqBHUm0sIiWN4GUL?=
 =?us-ascii?Q?+MfF+dDU4pdks5zzswGVhj0cNI1J9tFmbQpN+CPfAXyKVzcFyv14xfqAt15X?=
 =?us-ascii?Q?dWZ3Ks6o9y1CPLGVFNh6mNxqKkC2YW0ieaxq9gWEce5RHkpacyExrcjcWLXM?=
 =?us-ascii?Q?jUsi9uS6ujL1Hj7VjJ7JGY53A0CPiYyvwnDnPdIPdCTmxFcme5fBlZvvK19q?=
 =?us-ascii?Q?0+VFXNc6K87Xhj1qMehjwUQOg6/mxd+TZbTxUahCrX4vHV16Zxdr1U07zoVV?=
 =?us-ascii?Q?rA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a170bb3-ddad-478d-b180-08daac613b1a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 14:51:23.1787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIr28HgpNQgSgZ0teru7bQa9uBTk47LBE1PfmSdPkbYxlLNqKO2ZB1E4RHXf34OT1ZpLGZH3xhvEL7I7Qqf6nXsxwlYx1I433DI+GyERZ7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6605
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_07,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120097
X-Proofpoint-GUID: svH0J7DYyy1D9x4ZLGPu7_BJzGhnPlDI
X-Proofpoint-ORIG-GUID: svH0J7DYyy1D9x4ZLGPu7_BJzGhnPlDI
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The "data_len" value is use controlled via the ioctl.  It needs to
be bounds checked to prevent a buffer overflow.

Fixes: db23e5001f75 ("i2c: add support for Diolan DLN-2 USB-I2C adapter")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/i2c/busses/i2c-dln2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-dln2.c b/drivers/i2c/busses/i2c-dln2.c
index 2a2089db71a5..14f4aeeb263d 100644
--- a/drivers/i2c/busses/i2c-dln2.c
+++ b/drivers/i2c/busses/i2c-dln2.c
@@ -83,6 +83,9 @@ static int dln2_i2c_write(struct dln2_i2c *dln2, u8 addr,
 
 	BUILD_BUG_ON(sizeof(*tx) > DLN2_I2C_BUF_SIZE);
 
+	if (data_len > sizeof(tx->buf))
+		return -EINVAL;
+
 	tx->port = dln2->port;
 	tx->addr = addr;
 	tx->mem_addr_len = 0;
-- 
2.35.1

