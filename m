Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A24D5FF058
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Oct 2022 16:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbiJNO34 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Oct 2022 10:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbiJNO3z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Oct 2022 10:29:55 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66AD12BB09;
        Fri, 14 Oct 2022 07:29:54 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29ECPoMx017618;
        Fri, 14 Oct 2022 14:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2022-7-12;
 bh=57YsQ/Tgba1xRE2uvCIaPDudqkaJij99hFAVJ69iVZo=;
 b=E4u6qiLVhF0aLnMJYP5M4UnRcVSSpIRQS/9cw0aHQaujavNggO/ZSIf0sPL3bwsswVrR
 yRLZuZj7pU4wGL5ZAVWl+pdv9zh3k4xiQKXwQNVgnCMzZ7JAHyXJx0KsrCJjavmX0IIj
 GhFWCN0Q8eZkrN30jtKBfqerVgZ7+4RmQIjITiIfzUJuKj462wBsh/i1qjZUvBA20rXX
 g1H3VJTFAHQpS9yKF00xLUgtywt5WKlRyul3MJutZk/eA3lUqklmL5NkgAZOybj/8U1E
 UHQQQCn9lOqOqPKv9xuTLq4qdwomBmzQRPB3TlhYG0hha2ftcW2GKOI2ZDjKqKXOkUJO Tg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k6mswjxtj-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 Oct 2022 14:29:40 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29EDjQHp003895;
        Fri, 14 Oct 2022 14:23:47 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3k2yndqxy0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 Oct 2022 14:23:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKcZdoe60dYvQ+ec6bPSSskb7ZOnaMYWW32/WRMYdcG4LMtXcaiOoL68OJ3l7yPS3Gape57cSj9ZTNlNk7wv0adIZ2UeQckznBpQFsVdcQOXUHY2o0xBRiHtJYakRXM7NIKXRb1IP5SpSpaC1xwVGtI8VFsO6LusRaNz1eWGrXRSj9Y/ZtnZ/6UvPL+md4Egr9ug9ev2X4n5kuX8I+Fyhw4/ljtn2LiZWg7FXDaeCVT3xHIL9qBAVPOPUsWHIXOYYJZoc92rGT+XQ/i+7NbT203VbKdpOuAmW6lBeIXEbWfxXJbflzOJgNWZKV4xI/IiqSulUbEa1CkcMH98sb37lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57YsQ/Tgba1xRE2uvCIaPDudqkaJij99hFAVJ69iVZo=;
 b=aJWH3cYMJDslflVAR6qbhVb0qH5vV+NGe/p00j7xv4gGc4xikT0M9a3ZdzutUZeNvLx0eUQkLsZVf6LNJCQJtoPLfX9LcrjZ5A7j+lQFJ2KAHFDsbFluRTL/QLvp9pv02zVESr5bwruUmlAZqJY+zSo7SpXCr0Ccu0zkT8IwMMUeHP7BFgJ9v3D1OwORS/ZgpPcjJpnz0z0vKN5unBkLpssJES4CRbtsz/GLOPHL1teBDH4YdkpXo38kk0oveu0SxmoPJ5Oy0ppA2poLPGqGQ/wnQd9uoTnEVO2rXjXjzLhXsKtZQ7+J4F+DdtM4iAvDa88O62KcS8xS0yCxG56pYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57YsQ/Tgba1xRE2uvCIaPDudqkaJij99hFAVJ69iVZo=;
 b=O2vcx5ePq+9n7iB8Yco/DJk4ci3BzSfRq4VudwDxvlaviLF16ChQOjQFSnIgdjliiE8vBW34e5eZxKj0zxFzYjRj0vMTOnOU4WFcD0IsAbL0EYBPCVLrs10Rus5w7hUbqBeTLwPyffhHGPtYaH/EcOQhToF2bAdSGdHgCBHeTzY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY8PR10MB6612.namprd10.prod.outlook.com
 (2603:10b6:930:54::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 14:23:36 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Fri, 14 Oct 2022
 14:23:36 +0000
Date:   Fri, 14 Oct 2022 17:23:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Bence =?iso-8859-1?B?Q3Pza+Fz?= <bence98@sch.bme.hu>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH] i2c: cp2615: prevent buffer overflow in
 cp2615_i2c_master_xfer()
Message-ID: <Y0lw3ERnwRMaHjb0@kadam>
References: <Y0bUdt73moVmaajb@kili>
 <CACCVKEEWr-ko9yuZZnzW6icnDesdhajKbb+KWOaVyGDPy9D4Cg@mail.gmail.com>
 <Y0kJrSozgFotrWVt@kadam>
 <CACCVKEFxFmJBKwrq_wjEbh0tqxUyT9KuSU6RQk+rGqqTvRvmNw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACCVKEFxFmJBKwrq_wjEbh0tqxUyT9KuSU6RQk+rGqqTvRvmNw@mail.gmail.com>
X-ClientProxiedBy: JNXP275CA0002.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::14)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|CY8PR10MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: 233abb75-9ea8-4a31-90ad-08daadefae1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4RwckUrj6Cqxf/+aVU649ttTLoVLDY4R/UmVrwOWxQ0VKfGqoyh6z7ymPvK4lNHHj7bNr6U+LoPUCg1PwBuxXrYc2tIkoZufCmweRZm47qcXOR5yddDU7x34QGNb8mv64/irFBXOcEme+yY/Js9VBeHqROLcdGwNDH3HArbnXGuZuN9+F3z2ssHLtr4QnCGKJrVPj5VpABvIyo2dpWqV9RTbheS4Eq5eL2bCF5kahbTy4+y9y0j6zyBVl41Oe1L9oo12PaHbCZ4TsuJ+efsG6TYWfb4/YdgWeR9u3LST01Q/mG5ljUeM+Q4E10VWweOzbIjc7A0QEg5SHVc9pQw9+tohp2bA9OOI34vQkXI/e1/c6DHxzfOc9b0IrjcLNgWbKR8pni0h3ZCcCKU/c1cLbYbVqKt8pjq05FqkpomoetYRqIrVMpv7Sp8KGbzX9QaiO/3EAmC648OKGvz3PB0UYa+zfWllX4x04zo90Wy9BCOqo2xzRawl9dbdiEeq7bun+VkMndtMQ8r+LAckgLry2FM3/3wV4MaBE2xYT5hKRpIDGdO/DnxNfgokyP8BUHNYpDUqYyVT8pciSxAf/X77au1+LsQmGIJ45hIjW3RUK4hNu47zcXTuK3Oq4ykWLtOgYgvYoTV1YBtJEUlyI3qtLE9CeCV1K9xD8kAHGqoSPBfnT9COgCDFpIbdUFag/C+MzDfM0XfgK+fNSKgQBKpligpz/wkvTGJlpZ8+8Ljc+TlVSnk3Sk7yJB5bXYu/gXXO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199015)(8936002)(5660300002)(44832011)(186003)(2906002)(41300700001)(6506007)(26005)(6512007)(9686003)(33716001)(86362001)(38100700002)(316002)(6916009)(54906003)(6486002)(478600001)(107886003)(6666004)(66946007)(66556008)(8676002)(4326008)(66476007)(70780200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFR3WXAxSjVGVHdERmNGdWx1Q2tDS21VV3ZmL0pvUmJTTUpTaVQwK3lSMC9j?=
 =?utf-8?B?QTJ2M1JGblB6OVRaYytpWnIrV05Lem9SL1ZJYVRFRkhoWWY1VUxmQzZtRGlS?=
 =?utf-8?B?SGk4Vks5VmNUVzhoYy8rSXJqdUN6eWFHdWt0cGZtTlk3N0R2YVAzR1p5Yks4?=
 =?utf-8?B?SmRVNUdmNEsrZ1VXSitsTHVMWlU4N2J5alRoUjhtc0JReEtRRzhJaVBubU9j?=
 =?utf-8?B?YTZITzh4Q0o0bE51MWNrMGxGU3gyQTNaeDBRSndMSkFFUVplMmtGTFFENHZT?=
 =?utf-8?B?OEQvMFBPRVdmZG94Nmh5VVNZV2drbkptSGt3NkNvYjVsQWJCM2RURkJtQldl?=
 =?utf-8?B?eHhoNkVHR3EzOWZYcEFQWnNxSW11YmNQOUVOUzF1YmNmN2tSWGZObWVaVzNo?=
 =?utf-8?B?Q1RKNmFSMWNvRXR6blU2RWxiUUtleEgyY3pKbkUxQjJ2WTBiMkRxUnhOalN5?=
 =?utf-8?B?eXBXM1hDaitZY2dUUzE1QUEvQWtqNmkzek40UmsxL2hBbjVyTUMxOGpkbmlk?=
 =?utf-8?B?enFtSUEvcXhhK0xyWlNSbEZ4ZzZqQ3dLU2w5bG84K29LS1MwZDB3QitLK213?=
 =?utf-8?B?ZGxKY0c4M0p1anVtSDl0ekM1dlNRN2tWZXRUQXpXZ0pwUmVhRm5rdEhCMDk2?=
 =?utf-8?B?dXRMRW53Z0xQamoyemJKd1MydllnSEFXbzRHelFzdEE3MFQ1cmNhRm1IVWkw?=
 =?utf-8?B?ZnFHcUtLamhDVEU1cUswMkMyTm9SdDFuWndPRVA4VC8vSkQ0ZUN3KzlLSjhT?=
 =?utf-8?B?MUZrTis5N2RBMzV5ZWlCdzVLTzlTYUgyQ2VIczN4R1p6MnlkTUQ3ZEF2NHV5?=
 =?utf-8?B?ZnJENXdNS3BFQng2VmNJZGFTOTMwcVNnT2VsVTBFdmJDZGRVd21YdFhKd0Uy?=
 =?utf-8?B?L2hhNnowUGJWbUpxdVNIbGlUV3J3VmNYazZsOG8zWG5WY3ZWMjFxVHFvbzlV?=
 =?utf-8?B?THBKdnlDTkdOeUFSczU1Wk1mNkpqNnlzR0Y2c3h4T1FsemVLK0VxN2tWdkJV?=
 =?utf-8?B?M09wanZMTTBaNTFxNy9mbk1wYVl0SHBQSS9VRVEzbkZ2RTRjOHlDQmtvdjVF?=
 =?utf-8?B?TkVyeWpHWlFZUm1UcllaVnVTMmEzRVFUM1FqODF2NldyOWM5WFJDSExKRDND?=
 =?utf-8?B?VlkyTVZoME01ajlBMEV5dWNmRExhWkZ0WDFzcndmbEk4Y2RuTWowVXpYZ2lT?=
 =?utf-8?B?QWJxVjRFZGZPK3pha1hqMHJXeHZtaGtmQ2hsR1RnaVZPNnlyYmxMR3NUeGxR?=
 =?utf-8?B?Q1Z1VVBkYzRwaE1BNXJyK1hkL3prcHBsRFdBZW9UemhPMHhGY0dOS2pyK0tN?=
 =?utf-8?B?TkoxNnB6Y1JEN1c3dFJaTFpEWk9iWG5sbXhsZFNHUHBIRTBMNCtWWDJta3pS?=
 =?utf-8?B?TXFvdWVFc0M3UlJVQUIxUWlnbnk3ZzYyNjRuZG0zczRFYisrTU83Tk0rL2p1?=
 =?utf-8?B?M0x0eHEvd1dSanNtQi9zd2x3R29BN2hIU3JxL0twamlWUnhtODlpSXBGZW1O?=
 =?utf-8?B?VUg0cDE2cEN3ajc0VGd0Vm1FdUN3QVVYM250K3NYUG9MZTMvVnZIZWdlZzlW?=
 =?utf-8?B?WjVYMmxCbjkxaDZkYVduNTN3S2tjdHp2enpXWjlScDhnM3pRRTJibEU0K0dk?=
 =?utf-8?B?NnVGUHlWb1hHMUJKQ0JxUU53cjA2aGpFNmtCTmpVbjViblp1bWFTemRCR08y?=
 =?utf-8?B?dVhQMWc2RnRWenVLd3JQL3V1cWVvb1JxeHZhYkUrODZYVGV6eUpVUFI0M2RW?=
 =?utf-8?B?M05ySDlURVFuM2MwTjJjSEdDU3VWR0w2WkczeDU3UUlVaEdTblNKa0NmUlZo?=
 =?utf-8?B?aWdRZmdtTTFuaEFqQzlJSU5qd2RjSjVrdWI0dGUwV0hHRjBIK2xTUDZzMFBr?=
 =?utf-8?B?N0hEdS9LbXVwNmdTTUlHdDFEdUtBSHVNUlJOZHl6WXRoanVuRWRGRkw1cHp0?=
 =?utf-8?B?am5OWGpncHZ3eGg4NVBOUTlGWk9qYmczVWE3RTVvZXFGbnJ1UTZYaExOeGxa?=
 =?utf-8?B?aDZuR3haMFhJQkR6VWNUN2VaV1hGeWlLeDBhR0NBZ1Q4Umd3dDliM3V4Y1ZM?=
 =?utf-8?B?MzJsRE9ualhmRlBEdWpGYnBaVlhGMFozUDlMVVN1N2Ixd0s0TlFGU095d3N6?=
 =?utf-8?B?cmNrN2RnZDI0OE9aOFJUa2tEV3JBdzRvbDV1TjFTTFZTVC9mL2hkV2FWc1hm?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 233abb75-9ea8-4a31-90ad-08daadefae1a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 14:23:36.3142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qr3qNiWxWiPJf7Pf5l9qcW73y93QHCVrg6jEoYJEvIkqLQPBATYGBorOOgrbnDYLaVzIgaKesLFJ+txYSlTcLJqarXVdaNEL1nI0KKzzxWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6612
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_08,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140081
X-Proofpoint-ORIG-GUID: TVtYpqUwuZBTuxdRS3aPNKgKfRFS86H5
X-Proofpoint-GUID: TVtYpqUwuZBTuxdRS3aPNKgKfRFS86H5
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Oct 14, 2022 at 01:17:32PM +0200, Bence Csókás wrote:
> Dan Carpenter <dan.carpenter@oracle.com> ezt írta (időpont: 2022. okt.
> 14., P, 9:03):
> > > >  drivers/i2c/busses/i2c-cp2615.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/i2c/busses/i2c-cp2615.c b/drivers/i2c/busses/i2c-cp2615.c
> > > > index 3ded28632e4c..ad1d6e548503 100644
> > > > --- a/drivers/i2c/busses/i2c-cp2615.c
> > > > +++ b/drivers/i2c/busses/i2c-cp2615.c
> > > > @@ -231,6 +231,8 @@ cp2615_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> > > >                 } else {
> > > >                         i2c_w.read_len = 0;
> > > >                         i2c_w.write_len = msg->len;
> > > > +                       if (msg->len > sizeof(i2c_w.data))
> > > > +                               return -EINVAL;
> > >
> > > Please move this up to line 225, as an invalid `read_len` is also an
> > > error and should bail out accordingly.
> > >
> >
> > I don't see the bug.  Is that something that requires knowledge of the
> > hardware?
> 
> No, what I mean is that you put the check in the else clause of
> > if (msg->flags & I2C_M_RD) {
> But a `msg->len > MAX_I2C_SIZE` is invalid, regardless of `msg->flags`.
> So the check should be outside if the `if`.
> 

Hm...  I was looking at how that could be added at a lower level and
actually the quirks code you mentioned earlier takes care of this in
i2c_check_for_quirks().

So this patch is not required.  Please drop it.  Sorry for the noise.

regards,
dan carpenter
