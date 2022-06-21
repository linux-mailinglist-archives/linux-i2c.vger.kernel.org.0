Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA48552B06
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jun 2022 08:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345720AbiFUGgO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jun 2022 02:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235008AbiFUGgN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jun 2022 02:36:13 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757AE15A07;
        Mon, 20 Jun 2022 23:36:10 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25L0whY0012569;
        Tue, 21 Jun 2022 06:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=DR/mRBRdE8ufolzsS2Xz+JHdfF8ZcMoC7u/3ASCfhwM=;
 b=E6Im/mGSgPIC9n7a4qowlUwT8d/cxCCrId6cAKntTgs9ewyphUcvkwi4+0mWKBkszgcg
 iTBJGDwDW3SEUUh0ORjLVcO2QhlIS40XZDujUGJd+AWskkOC9SDL+YY6WN0gbSJXJnqC
 8Bf7M70ACyFCbZO4DKp7YFIzKTmL9c3si6hcIN48WAzTMDVpAaNn4EzUNhUBYcWNe+fA
 9CGQ99+IzuTJNUuwiOMML9XmBdcp9FnVScZYzbXbmvdvRp0STN0gsLg54t63TOusTk3y
 TRqM5M9ra15bCxaQ5rANkKdnOQgpiqhxi8A9rngkiPuZNhHZyR75IDoA9NnUaRmxWKUI dw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs6asvp5k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 21 Jun 2022 06:36:04 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25L6Gexa021418;
        Tue, 21 Jun 2022 06:36:03 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gtg5u1kx2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 21 Jun 2022 06:36:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ahtm1ZAWVrd94CVChYrBiLjI2V3XLPSFz7VfiLZ3upbDr6rcGvW31+aT8tNgbUcjVLZ+8Qx5MaPMbH/WuQkJ4Hc2HcFf3nZtS7NUmoEjkgSshSx/WT2l27WiEA4ArPk4jkG/CVleOdONRBnHTEtqspMKfRCgCWixkkAQmee7+CGh7dahgLBGBreFgvyqkb8uN4l8qqlIvDnwciJViQYiuTSv6OcuTH9m8SnYAbtGniTOPWI4d/jq+6zHiO52VLlzT+OHaFU4ADVkl1ryA38oM/viTr5E6HLhflnkLesQo+jqNCb13220g/puK26Z0gPv8SLUb80UTceGE0xIyALStg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DR/mRBRdE8ufolzsS2Xz+JHdfF8ZcMoC7u/3ASCfhwM=;
 b=LOyzt41jnGvcVvIV9cQzIrlfrGb+Ksrfvv/a1nDDnvRiDZVg/sWb/xy6EHQKfolQ1xLerNi9oJrbOeIz1LbnHltEqQy97FyQlpCoMn4Lo5o2cNf5Y14jwDeexCD/LC/jKGn7TzGhvapX3LisSKs+FVWBZCbwozmR87aLpRFhwWEUFOWSMIcWuT/+s7uWtQXVLeLfLB3kt4TQsxEK7fKXA2B5xPnekrOaQjcMdzTpdcfqjHvG1s0tmqZGU1K61jcvAOhoEE3Rq2W4PphunF3YRIBNMJpVXo/iKE56XL6pibO35Ao/1/qbdDPawT66KkffL7ORCyS5jxVbtEqIqgyPvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DR/mRBRdE8ufolzsS2Xz+JHdfF8ZcMoC7u/3ASCfhwM=;
 b=MQtrkkVD/C647HwxWpnD3S/V8fhCYPkQQsrPAfD0bRHKXTwOlPzAUc2/rLoJhIt1rqOB/hWfzcTAX2WPBs39ZYPrQ6OU0egFnQ3FfYkJwPekbV641u43WltF9348huyF+8FzDVQdSW6oMGN1DHNkuH5Bal6OyED5o5vEtgp3BAk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH0PR10MB4743.namprd10.prod.outlook.com
 (2603:10b6:510:3e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Tue, 21 Jun
 2022 06:36:02 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 06:36:01 +0000
Date:   Tue, 21 Jun 2022 09:35:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Rishi Gupta <gupt21@gmail.com>
Cc:     Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: mcp2221: prevent a buffer overflow in
 mcp_smbus_write()
Message-ID: <20220621063534.GI1999@kadam>
References: <20220620162824.58937-1-harshit.m.mogalapalli@oracle.com>
 <CALUj-gtbja9aPo1yUdGkFNEr4nYf7nhO4X6NSK5QQSQkHex+NQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALUj-gtbja9aPo1yUdGkFNEr4nYf7nhO4X6NSK5QQSQkHex+NQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0033.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::21)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94e97054-3187-4dd3-1150-08da53504eb9
X-MS-TrafficTypeDiagnostic: PH0PR10MB4743:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4743C9A8E711A6E344E0C0DB8EB39@PH0PR10MB4743.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ocDnKr34u2kzhXatkeS5/UZmdaaOJ613xZZWZ+Owvsr7+IyGix2QGXj0kniz2La9vOXVe4cuYPagWG+sc9oPkGjSm9LAslp1AV0oZlK/4nwCz1NOSmLR2Shz6EUMFweosPj2tf31LbqWX/K+ehMo1X8Kx2f0nafucfAHUFgiWuLts2TYGgAoA7/prjH6+1ZuoYz5Q4MgSIUaCyOImaKgGZVIGJsYTfbQh6akNP5G76sYloa+MPglUunFAm4M4PoD+2UhuW09tnO4cGWSJ4mEKH9021KyZobLRooodLn3uTfbW2vn4dYu6DwA6EHoRAppeSXahGMDb+wgVAW59qZBuR5LE5IT9Rmraxxcz5UdCE0ZrIAdAYvLzgVRiXmJugm0v+l8Dn/2/XTxgksq6ryLeSUitxYwqej5EUO4CU5rw17B6s2XCqQdJ+GQAPe/FcXR4EmeM4JPqUgq5Ryay0Xry/u0HAEhsAqVq++GngoQTFT2djU6u2c6n9p96drN+DGbCWMxHbnEYMWv+urj67sAdl7vPygW3RHH0jvqbqiDLblN42IU3RVitR2YS/MaB3uyyKgfDu9vtEojSxEDx6/JUM9qMQQneqNx7P4MgZMq6GWIZtGcB3O6D7A9mzKISWIcVRVh5R42wLDl8Q4s9gBdIdUSzO6yWICEV+Hn51u9XmscB12VGIVkf2CRbYp4e+AN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(396003)(376002)(136003)(366004)(39860400002)(26005)(66476007)(52116002)(66946007)(6512007)(6506007)(66556008)(1076003)(9686003)(2906002)(316002)(86362001)(38100700002)(6666004)(38350700002)(8676002)(54906003)(4326008)(6916009)(8936002)(478600001)(33716001)(33656002)(5660300002)(44832011)(4744005)(186003)(83380400001)(41300700001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XHGHiOqXcBd/JQvb+1rDcYyWrp3yxh51WUPtm/jNI7LGNb9+vEdQhj5J+6CM?=
 =?us-ascii?Q?MEJXh8L/sN3E99X1Uoa2rUdGMqT3fHsc6uB6zr2qyM9uNEbBIbSSuAAj51Wg?=
 =?us-ascii?Q?aANAUWAHWmLB/M1yC3f3dj3LYkOVM/UvQ1m3toEgNfAzr/4c047NOWxl32EY?=
 =?us-ascii?Q?rswSkdJ2zsrXk5W7rTTb4F1kyTqlRApK3fERo7P2OEapl6LLpeQIOuTkoSZN?=
 =?us-ascii?Q?UuZshRdAKFBnr5/CqHDQrZ+4cYcIdqHggqHKnodlayRkCPG9fffK6uAVbDC1?=
 =?us-ascii?Q?m28M1hpQr1Vbb6AQLbHGtPpbPFnvDBo6S9wyzklvzgdFJqkPGNF7S4haaZ+4?=
 =?us-ascii?Q?R888A2n8gguliA1zknOKe2BeLakPrOFItTIdRh0ABn2HVfTAIz/WaRLM3qSO?=
 =?us-ascii?Q?RvR14xC1YudkuGWw1nc8jgO/wqkEHUKJWmynAnGWpdEcDfY45zmGtHmGiCDk?=
 =?us-ascii?Q?6V8yGStSsBKEWs+xvfClN6YT/4DM9uBg5pVdsQsV1g/zGRLMPGJsLfXlUPMm?=
 =?us-ascii?Q?xhy7oP+gjlg+E+M9usU6FGqbFKzZqfvPTECDx1RsIVNatustJBjq+H7G1+tA?=
 =?us-ascii?Q?4dbAEQwVZYFOtZkTYWjMEgu5ZBQZ46glc6F1ydGj90rQHAJofYQvfkLsMlnu?=
 =?us-ascii?Q?x3jA8WwDpCONRCiwfWgCugT5O2liU1IduDXzQ3hWsTu/e3ZyOpMuAU5ENPBM?=
 =?us-ascii?Q?Ks1tVfu70zv9zpzVtDBrf1e3YFvkNiY20x4Fi0Pko/faw/oIbx17nKeyBdCZ?=
 =?us-ascii?Q?gtta3ZiZHV6gfvUDSzRAvr7bf74UCIlUA5iRZ/tfLnxZv7t7P28/kLe4vEZ6?=
 =?us-ascii?Q?sPgA4v2oV4/sd/vaqsnoJUje6+ZMnWYQfOxi5AiGIvWF+H2u20zm+pj1wOXO?=
 =?us-ascii?Q?C/2zfCy7WfIv4xm8umImPlgA+1klwXZXd4ZpxCydfN/NmaQD9GeG6FKyUJeL?=
 =?us-ascii?Q?amHpjLmZsXpBBLxJDTgUU3R5jfZDepqbKQqYPNdsXBvyLZ/UrTfyS+sz6SvY?=
 =?us-ascii?Q?76sXfiwJtPb9UTme4jhvLF+nwGnmm2ZaIh0AxZvmNMrtrbk7i+mmc3dlUkof?=
 =?us-ascii?Q?hwuZLEzJF6omgJo4gYcwcdPWtuh6fnE/8o1qBKfjgPLD3HpopLD3qHR5NHbA?=
 =?us-ascii?Q?Qfoq2YfMBijhBf55RnEwVZW4tfsZeYRPCXOwatIYYqevZEJ4Mi0cPU9/4at9?=
 =?us-ascii?Q?AIkHjEdMqTK3rrf+96OxK+K7es+FHa4+2MrrCiVLYibP3f7yNQwklBj/8Kbt?=
 =?us-ascii?Q?z7JmRph11G2XNOwARWrvfjNmd0dTwoXbnXKPiMmUWPPX3D87u4Ezjped3spK?=
 =?us-ascii?Q?Ak5AdtaZPkuBfiZ2x+6yflx1pR+rMFIrLJBKTvrMG8czo9KDN3f/+KB/X4Af?=
 =?us-ascii?Q?jAzmbd/dqqRsekwXyGEkZhNeclvv4UMlXvzJxUxWayOWQDoy+7krupHust6K?=
 =?us-ascii?Q?9m2Yx9k6nVQu3RDnh1WVGiflv4pKAXq+Y6huLp8zOFbm/Y5C6d5tz2X2rNrX?=
 =?us-ascii?Q?SQymyM7A+SnwPuwI4hENaJPixPiamy7rm1jLWJo3/AfuOL74r2jAlsiFVo6V?=
 =?us-ascii?Q?wrX7WZQEfSM7chaeXZqyodoE3DQbC3hWjPt/boZEielaFmnTOpWCXzdlv9yE?=
 =?us-ascii?Q?hyQPVaJx19s5Pq8WwkB2o9CIGy8uUm29TG44Jh5Nt/QdnHFtVx4CQr3VQ3/U?=
 =?us-ascii?Q?QpcCuYyX+aYMC9i7aTwUPN+edK6x4xEjoZAHwOZwU+EiQkPJpg1Y9vUCwczo?=
 =?us-ascii?Q?pCDJ225yCgUhmGJs5Ru3tZw7qAFEGF8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e97054-3187-4dd3-1150-08da53504eb9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 06:36:01.8336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YBuHYawUI8IFViAYH9uZAd2ujNDKd1KExU8T11A8heRqcEUA5JRu2UQEasYf2h8rUsqC//qi1rMKG62qGHsj+tUuh9x8kHliO6ZNdo5M3TM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4743
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-21_02:2022-06-17,2022-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206210027
X-Proofpoint-ORIG-GUID: gCxb-0m4bBdc2xsbiOg4U54sQaxsw-2c
X-Proofpoint-GUID: gCxb-0m4bBdc2xsbiOg4U54sQaxsw-2c
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 20, 2022 at 11:58:27AM -0700, Rishi Gupta wrote:
> Hi Harshit,
> 
> Can you check the datasheet for correct buffer sizes please. Then
> accordingly we will decide next step.
> 

No, we don't have access to the data sheets.  This is the exact same
bug as the following patches:

381583845d19 ("HID: cp2112: prevent a buffer overflow in cp2112_xfer()")
690b2549b195 ("i2c: ismt: prevent memory corruption in ismt_access()")

The patch should fix the memory corruption but there may be other issues
with this code.

regards,
dan carpenter

