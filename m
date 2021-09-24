Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93D35416FA1
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Sep 2021 11:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245352AbhIXJzN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Sep 2021 05:55:13 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:7264 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245306AbhIXJzM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Sep 2021 05:55:12 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18O9PNrV027806;
        Fri, 24 Sep 2021 09:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=+7h214Q2GWSEhM42l8Lw5EmA5pkZRD26Dgov90G50/4=;
 b=xZbFWPFaesyMchWoth85tWrXRO3o/2JDomjW+DdEGcrTZ9BO5SFMFVnm2qcsJiXLxgsx
 wlubehEF6IvDAtPmop2f33WyYiGbsJnZE8YVtkMuTxxhPFc0chLVdD4dDk6NbNwGHvTJ
 c9WLWDd+Ei7mBRNzGYUfTRqUn0QpKdKcb3Uo7yfpAUzRHGHr6QSP3TsHug2PTf5wJNUI
 bpyDRxwjpEEcxsXCKXt+xNeSzxs3Zjpklt2T2X9DBSrROuke2xnLfJ0JRiF2VSz2QNRg
 +B7bLJPzGsije2IK+G0OjvhPLNH+hzHE0Wc/S9p5WEwX0V+bdcGdXRoN11iV0L4lRvKa Gw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3b93ey29kf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Sep 2021 09:53:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18O9ngSx094184;
        Fri, 24 Sep 2021 09:53:37 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
        by userp3030.oracle.com with ESMTP id 3b93g320qk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Sep 2021 09:53:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXPbfEmvVxivpoip6wovoSWAE2C/Sa4u5xkXOUNmNMsxLBPEigJRc8vFnPoYa9RfOwhgKmqLNQ/7Dd4UWcsUE2jKKmDIuOmnCNkiu5yVZPep7oW9+D67PPXCS00dHZ8lCFwZVYRsLYaMhFg/tg6bjDvoCPfdM/Qqe0lGBzS4UQj8tXCpwtANB4D9Zwo9vyIHf3eeJ58FNo0hcav0+npBetkhm/bzHyJ+12EM9ltXn1H4OHYB4bnoKRaNqtcraJRjRqDhWnpi5DQnpZJiw32XRpM5SlBoQUpprzBF/9PN5Srasx3WyroZq0XXnyRTqkeoU/6Q85qtYHwSgG9sHypbeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+7h214Q2GWSEhM42l8Lw5EmA5pkZRD26Dgov90G50/4=;
 b=QDtOgUqS8FmbMRcuJ027pNDSrBHVJTDi47G1Z47rE9Ld2cCdyKJa6hmlawIHt05XsRBJNTU521g/7P4FKwYbKtNapXf2WXKVv7jLLh7Y8uUUZjsT9XCFFeoHhaa5+6MOIZ+b6/sNdYy0OynVWWpEN5ju1Z71jzTf9fyHX5ysJvyPeOGWHgxdNjwAMaNf+1R1zz42l3jwWqCwQXE/J4DVAPXrd80ws8SH/Q6FgUIsBeQxgNC3qO8OQ55oqWfvjdVNZkO5na1K/3Vudr4A1fD/SqPsoj40RlBMtufB1xODol0e/MfEpQ6jH74cmhop7XEjq0IJAOyOzaabtNPOaaMRFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7h214Q2GWSEhM42l8Lw5EmA5pkZRD26Dgov90G50/4=;
 b=jp5q39GZLSn3K5KkMgsee7/EXvFcEhtDAIdT321vApcEzMMAY8BdQ90blQBsz+KOSJN6jifHXph5Tnni0pljqRI5u/18xAEkWUR+krwtGxCNDyaDCUicWofC8HgQPVi7C3GlVi1JgiRL0lU2bUc90Mx9a067OX0yS2rsV+1PXgk=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4466.namprd10.prod.outlook.com
 (2603:10b6:303:9b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 09:53:35 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4544.015; Fri, 24 Sep 2021
 09:53:35 +0000
Date:   Fri, 24 Sep 2021 12:53:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     christophe.ricard@gmail.com
Cc:     linux-integrity@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [bug report] tpm/tpm_i2c_stm_st33: Split tpm_i2c_tpm_st33 in 2
 layers (core + phy)
Message-ID: <20210924095324.GA21453@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0066.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0066.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:21::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 09:53:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1316cafd-c96f-4fb3-fc30-08d97f412cc2
X-MS-TrafficTypeDiagnostic: CO1PR10MB4466:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4466D2DFC386DAAB40D71E148EA49@CO1PR10MB4466.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xxGL2GU16DBkt3x5imWdNz+/ul5/HkyDLGTSWP3qYjj/+cz3XbNQ6Naz7BL8Gqa2UdZNKttcC1Lhe/ko/OR1ulChjHjxizjjjcv6AN7yuD5kSK3XoFuHSy7a8NwYuXkUz1CO1Ffrnh1QMKrQtsR1K7i740YDDTK0yiaTBqyMfAF7epb1VGIldqR/qGlkrVdEXqZSd5t+rZqmXDhsSyZEcTH+Y3lyzzaZI0PcsXUjKdDZa7vx4mk0ohpfn6hY9xFK/2vNL1qCSlXXVKFMetijKBIwhw9FMFL0hE0ojXW0Y5g104mniQdiBCzNxprowN59/91qhCbOZrk+Vfx59k+htHkSRMWWiv/ub7Lfj4LGVmkDzkehFKH/dmCxBtNVxshBY8qVNhQU0fm4Q+ear+QfT89m3m6OGm1nqeGjtL4szAl05vMVP9VwfC8lIq2gWwGrjF2TAxranpiFdomYhlcZ6FSLD3coWlkGtdKTtN2VuTwBKCBMTh82c7/gwaItJfq38ol7TfdLpW+f7Rb/rAy5/8ysYChnR8rGXT6/iMftc14wkENBqjGGXnIcv4HsslwVWO70ZtPVL3fGVAohX4IwM4tRgK7BNc52ASzp8fD2oiUCSjrEKBxozamcsvNv1NOVZGl8cr0jYzCJoVgz3iCYdGxZsHTJqYOs3eOcXoRlj4YqkbHtr1wT8OnwaiLQqBJWmSs+Y76Mmi/lbQplQAM1SU1qKF9Y+1KSL7GJjFA7LwM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6666004)(33656002)(8936002)(316002)(38100700002)(5660300002)(956004)(9686003)(9576002)(83380400001)(4326008)(38350700002)(44832011)(8676002)(66556008)(55016002)(66946007)(33716001)(2906002)(66476007)(186003)(86362001)(26005)(508600001)(1076003)(6496006)(6916009)(52116002)(70780200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0WH1bXFfIs7VoxUFCoy2LUzIKfl825hTIb//ju3VvWqzFHvbULbAbPuXDuQD?=
 =?us-ascii?Q?nI2VjgpeO0eFk1KbbnN0nTj7bLZ+TdnNEtjTP9Mrzpr1AH8fsqmuARL2tXZ2?=
 =?us-ascii?Q?T66w4O8xAaOUQsYAeCXTkTdz+Nnh1JI1MtDfL3K1v/UOZWo0tKbu/+BAb5r9?=
 =?us-ascii?Q?+Q3MnGnbwt/224S+lyeQQR/v9EYxHrmlfujkaC0EOBs71cBGlQycvlWvMcBw?=
 =?us-ascii?Q?Yub7/luRkuoaaVAPi/hXNmJZdjkvo0/BIhTnRWYa855y9WJANpBCXh7tV3IM?=
 =?us-ascii?Q?Cd/s2W9h6WaqV2/Sl2KiEpMLhH8j4uqmZ5vgsyHks2hh+cIhrw5Hh829sQko?=
 =?us-ascii?Q?3G8GS1xyXjYrdhuA7/OcetN8PfrrbpW/fNgUMWqlSdhqdpy8Hvu/a30ztj+C?=
 =?us-ascii?Q?zCmIAtU2LxmbCdA6eGJWqVxJp7EpuzvvfNpd3F4IbxT56rdYwry82oJf/mod?=
 =?us-ascii?Q?jGhOfI9JgBkGjBD2oDv5cmx2xnBgKnr9DI4k1UD9hiaLWejXeVMuH0qr/sM2?=
 =?us-ascii?Q?obWlW7kNDF8eUjVr8G53LrwSQCC9UvEOe/Rry2H4OT2+KSilAshzK3RemIme?=
 =?us-ascii?Q?ixI/7EDiHpH01X6qm/hdAo6Q0dFhud0p7iRR9nzRllalsBJB/q5tO6O1egcv?=
 =?us-ascii?Q?O4rpP8G/of1nCLFqWp0KNSEa+bzjPRuFRiaN3/kY+431F+H0cBVWvn24faRO?=
 =?us-ascii?Q?cf5f2Qz6m4cTf7JTHT/dUcetYTcK6y7wxe/QeR8+ASHL4UEIVzlKQ6EKsviX?=
 =?us-ascii?Q?Rns4EhmnQHRN+jY/uBLEGV3IlN2DZXGUNOFga3jvSKxqHh75EV+YqG4JMEOW?=
 =?us-ascii?Q?ZG/oYjw9/gm1stb0SJxEZC7Xm4IYLZH8jeH0K67/XAsH4/bmU0kjUQoJJPrn?=
 =?us-ascii?Q?srxYiyB5ENmrKwZa96wktEtt7vEyHGIt+MoWIM9DueGk5Ee2oANjZrXYiw/y?=
 =?us-ascii?Q?lIsqzzDPOlJjflWMJsW+u+Wm8sIDb47kGxiVCbh0YyZqHC30d6e0/SaqlIiS?=
 =?us-ascii?Q?ov4MHGHsZEbjAqhIZ7SAi1+Qa4fZZDiMsuSpzi2z8mdJ6zE4foBm2TtiC5SX?=
 =?us-ascii?Q?DyqyBlkDFX/L/9IATSN3wS4yp75SLWedaaorawhErzbcOwXOgKF71BS0kdWK?=
 =?us-ascii?Q?ZLVvHc0hbS1K9h9b2TDWGzkJRt3iHfdmiqtQkmwT+r1jyhsnZpWXhFasWD/c?=
 =?us-ascii?Q?Q7bQi4gp++IWRjiY9IWDD/qigW5EA0knpTGL3tXH4J7WEGGnuY4+qrD52WnT?=
 =?us-ascii?Q?Pk6heb+GMY1Jaq4swr9bamPyEgOt0iz7QD0ES4qZ+1yqtDBrN0Su43AJUK3j?=
 =?us-ascii?Q?wcO+tFekjBoN6ff0wQGC5GhI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1316cafd-c96f-4fb3-fc30-08d97f412cc2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:53:35.3072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMzZvp1D4hsGKw//nQ//+s9aoKsFeT5e05+ePmrWKdtV46OaEkjh0UN7rqVa92jpj2pXJ2nvV8fU1VuoBOmaBrBkrsrDdE2+hHBsIYox3Hk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4466
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10116 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109240059
X-Proofpoint-GUID: jqbno4Rbvt-rLUi_-C56y8mnS9i9eFtk
X-Proofpoint-ORIG-GUID: jqbno4Rbvt-rLUi_-C56y8mnS9i9eFtk
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[ Ancient code.  Never use your permanent Gmail address for kernel
  development if you want to have peace in your life.  - dan ]

Hello Christophe Ricard,

The patch bf38b8710892: "tpm/tpm_i2c_stm_st33: Split tpm_i2c_tpm_st33
in 2 layers (core + phy)" from Mar 8, 2015, leads to the following
Smatch static checker warning:

	drivers/char/tpm/st33zp24/st33zp24.c:117 check_locality()
	error: uninitialized symbol 'data'.

drivers/char/tpm/st33zp24/st33zp24.c
    110 static bool check_locality(struct tpm_chip *chip)
    111 {
    112         struct st33zp24_dev *tpm_dev = dev_get_drvdata(&chip->dev);
    113         u8 data;
    114         u8 status;
    115 
    116         status = tpm_dev->ops->recv(tpm_dev->phy_id, TPM_ACCESS, &data, 1);
--> 117         if (status && (data &

The ->recv() functions, st33zp24_i2c_recv() and st33zp24_spi_recv(),
return negative error codes.

st33zp24_i2c_recv() is especially of problematic because theoretically
it could return 1 on error.  The i2c_master_recv() function is tricky.
It would be better if it returned negative and zero instead of returning
the number of bytes sent.

USB had this same issue so Greg added new helper functions in commit
719b8f2850d3 ("USB: add usb_control_msg_send() and usb_control_msg_recv()")

    118                 (TPM_ACCESS_ACTIVE_LOCALITY | TPM_ACCESS_VALID)) ==
    119                 (TPM_ACCESS_ACTIVE_LOCALITY | TPM_ACCESS_VALID))
    120                 return true;
    121 
    122         return false;
    123 } /* check_locality() */

regards,
dan carpenter
