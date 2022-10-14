Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4586A5FF046
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Oct 2022 16:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbiJNO0J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Oct 2022 10:26:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbiJNO0I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Oct 2022 10:26:08 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4039D155DA1;
        Fri, 14 Oct 2022 07:26:03 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EBsrKE031132;
        Fri, 14 Oct 2022 14:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=4cVXFR2zva9w2spm9y4FpHcXTVxCw+xW06WEkeI/aBY=;
 b=smiUxLn4lO3gsvmjLMQVM8nCvgR3hby41H0Jy2rfU9O+wteyZpQrOCqADgODre1WDOWr
 BY7YK0eor4cbNvANQwbFXQQ14CL7Qwa5o1JTu1muZsrKASVM6FI3HnwU6bhmKW2DodQt
 IgD8oirfHZwlVJ5gyAoTurqyAto+El418du4jLnlvdUGmv0B2Zv2fOQrd9uMVprdxJmZ
 570KfWI1eetGIgnraJmVFMqpbYG5NZqOhxEWyXFpPbW1yyt5d0z06zzrP8diQl7rzstE
 D1zsbdigNPOYqs01oq2D0mNzRTTvjw5sAQgIZVPY4REoNzxb9WKdT0YZNmk2mW46chga hA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k30ttgda5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 Oct 2022 14:25:57 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29EEPsS7030213;
        Fri, 14 Oct 2022 14:25:56 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3k2yn73t1j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 Oct 2022 14:25:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRKR6Oth3y6ie7GjhHVmUyn3gr34rYzH7Ok9P3AgD6kAzQvRboGa+eGLs3mxIhdmUoZb+UmNi74iVde971qBZUvi+KyuESxf83kJDRiC1Q5pdE492/opCDNojw/w/iA8zyNysdqQI3tBJ9KljbZnkshMb9DnzUzJwDCJXAO20E8pLT/qEo5PIXNoA05PiYrQybTdcIhIMQNurjx2gzrVicfWC4NVOZFylqJTqM9QBPVPQWqrxoaNnNzgr1NL0a6zP58Dyw1sL94JdyiCu6CDS7MKTz7HBf6Bv7jLEtj/pyUPnoKZlOx3whveDw76Y8tVxpZxlGj/mHsnZFN2W4Fd5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cVXFR2zva9w2spm9y4FpHcXTVxCw+xW06WEkeI/aBY=;
 b=P3rReXWMXL1MJ1l6ab5+y6VPh/8kzinSRpS+U8APlBbsEBi/jI8tr4JE1nUUTXdi/rofBcdJbYTDxJMtXYnFtsd0jzTRNJJZ2ZPu8nHfq2yiN/Xehv3I+g8FCNVjylIY2jT6HeoFQp2yPGi9sP7uJ80BEIuD3LIn6JqNJprm2wNE2Kv44xgdro2g6XBngk8P/h9ULtzjQSRhtjXEZoUkagxCV9zRF7HlVypPUd6E0EpTaghzT5vX3NWPm8mnCJdToVHAYrCS9jLXdop/atNRh8OLWF1IU8uOYLfOjFXcTnXT0x9HTzh+XmjMMXlYUS+FFu+Fh5mkAUmDjsGXqs3tBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cVXFR2zva9w2spm9y4FpHcXTVxCw+xW06WEkeI/aBY=;
 b=Z/lIt95k077tRr9pO26PZdlASQiB4d5HQCSfrk5e684Yg1hEebh8bo6GhK/61E91A0Xt+ji+KNVTnc5vvd9sa0dwb9jhlLtRyCthaY/qp83go2W1PuckQ8vrirGbd9wR8du/UN/MaDS87SIxpnYF44YH2HBMbjIJ71LndKsVgxg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SA2PR10MB4747.namprd10.prod.outlook.com
 (2603:10b6:806:110::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 14:25:54 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Fri, 14 Oct 2022
 14:25:53 +0000
Date:   Fri, 14 Oct 2022 17:25:37 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Octavian Purdila <octavian.purdila@intel.com>,
        Laurentiu Palcu <laurentiu.palcu@intel.com>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: dln2: prevent buffer overflow in dln2_i2c_write()
Message-ID: <Y0lxYa+Fxn1fM/4G@kadam>
References: <Y0bUYc2fadLgoQfZ@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0bUYc2fadLgoQfZ@kili>
X-ClientProxiedBy: JNXP275CA0042.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::30)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|SA2PR10MB4747:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e9ff391-2127-434c-1391-08daadf0006b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ijs2c9jAgdxmFcryT/m5WDb88Y6oqzHgKRtaOb8oAMWmMowYf5ujq05OwT1SlwgNifJKLHVvbS9euoG6bRnJdYDwD5zwAA4qD2PGovQEHG/YrYT2W+uFBppQ/mQ602uxQ3kg//Ju0NOa/M0zawSrjaX5t39RgnIHIyNJC/QEAagtyskt+bQBb2vDUpL91BSa1C/RV6IQZYFaXJsglniKDA+g28lwvFAUpJ68GcNkIdcWLw432VRGCgjZekPh1rHJ10g8yqADD2MMkS2DDLe08hGVOLBCY1ZEgV6LcZE6lbzmiBtTPncZL54D/E6frySjfp1pP1XmDfw3hH2A2Ap9hsnEyUxo/Ge7J6/MsquLFGOzMq6DNxacx3Jm6lRyzYeZNaVeiVT2Dgt1bZOtj/B9TofeVBG/m4y/X2FlzPZpj2joj4WxzObQfkiF/l5ndqTgjfCqy+O/s//dM5mRVCacBRTuXLuXJiksdyFxegON0ITL1Nzpci6FBPk/szfSwJlvyIOqtvLbYVMmEWQnYv7fO5fJG9ZKIFi8/YSjmpPCpqWVdXYdG2503bm5RONQv0nBZ2H5QHxZigBZMUS6DNeNiywGl/lzTRWVvweGf4T8/ChiK5qAFOJzBQRTT+SKmVAe9QT9CTUlck8CWkTMSotWh44CtBbeuZtYvwggew7BPcuMB0YPgD6q4jPTm5BTfEMFPNQmuaK6W/8J8c8mGL6A/yapN8moo5cbU9wfsymVMmdF5phdQ87SpQ3SBI9UwlMlrAYczWTcocKIDdbTvsnIEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199015)(9686003)(6512007)(26005)(6666004)(4744005)(6506007)(186003)(2906002)(6916009)(5660300002)(44832011)(33716001)(54906003)(6486002)(478600001)(316002)(41300700001)(8936002)(4326008)(66946007)(8676002)(66556008)(66476007)(86362001)(38100700002)(70780200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+B+6W4wc02b84ePhSGs0bganAvDvmVmVLbEHqskOdvYYGMn3Svs6t0+JDutz?=
 =?us-ascii?Q?g9//IB8+QpFNq9i54YqK6zyVDBKWulxNSH2iFKu3BiTj6cmJ8unt14XVaNFZ?=
 =?us-ascii?Q?8fAlgRyP6tvTIrp8idCCJg9XuPQGdG3Fqk6FLU6Mz2a5eonRCEMcQt0DYAG/?=
 =?us-ascii?Q?BRKijJl7KLvBFuhKIDjgxcKyCZZj1t4WYez0Vb5CipcjbOlOEncu/OCFiFCd?=
 =?us-ascii?Q?PTWS2VCq5a8vCf+j7LXhptNb3PhWA3JIwLQhqN2u7InaTrqyHlBYfLps4dn6?=
 =?us-ascii?Q?0PTHulnmMphHmrAzgwesqURkkIAcvFbEmmYpZxyfYcaKmgiUfrA/eIBUtN25?=
 =?us-ascii?Q?Dz+5llK89sqY8vthqUAl3Tyds2jkJQ3FPhM/HAIt5HE7cDYC7baQPBvZQpZg?=
 =?us-ascii?Q?T5C9YyfPQhqOId4/cwDsgkrKzRrHAHqmOSB13WZ1bsT4js39Esk6OazEFTGJ?=
 =?us-ascii?Q?uaCY9dhuzn9Sala+IOCTMN0vcMm9jt45QtDsbhqwlR8Yu1kKYXfXBx+RLh2v?=
 =?us-ascii?Q?nZ7YC8/BcYZS2uoITp3QHiDNnmbQxgzT6KXcUuqVbICKRSC9pwdXGtJEqKo9?=
 =?us-ascii?Q?zoSBdvVZ7Q9M0JVcC2XFRfhzHtHO/WJ3NIDgzz1SqD4CQdOqmSbXTinpuNRO?=
 =?us-ascii?Q?N8KVaEqHbnPrM/MRQTWAWwjmGSej4FCIoTKSpWa5uynfqdmxXxc7b254jHri?=
 =?us-ascii?Q?rRTM15WI7gwmEBA5zyy4NO2oxq+1plVAxaswsxwhlmg7tkC9EZjbki5QCop/?=
 =?us-ascii?Q?xOTnljzh2zt4lA2a5A7SuXZ7AxfO+5+Oi3BCSYCgBmKYCNgQwcp7mF5P2fM/?=
 =?us-ascii?Q?T4aBwqU/ikSQH2wl2wVH5doxT9LkLRbNyDVRj9nOfYhuUp8PdL3vpdC3voHk?=
 =?us-ascii?Q?UviJrkwyqtobmXmQOW7EkG8LH+SdI7arflWyUemOathMNhhUrACdEhRyGzim?=
 =?us-ascii?Q?Bg95wB30or13rYVvImpo4g5O5GY1cZq7ShNYzzLvJjYGXiSJS52Q7gmB0zFz?=
 =?us-ascii?Q?78/HKLfnFYlG99cWTnYkXAH53roOPKufOPFP5gK1Onr+9MdCIRh9YOpJF7qS?=
 =?us-ascii?Q?U4DRBtir+HHNvWkmlTWolpZ8KNCqdTeaXklQZbDAYwp205RRJIfB6qAj5QZ6?=
 =?us-ascii?Q?Lgdb6Dne63rVKdVIuVEdM0k49PVI9YWSLQR3miN4c4IshHEqgzgKT4CiITmA?=
 =?us-ascii?Q?1ujTincYymD7lD0zM9t2vMOsIXeEO5HwfCrhn5RM/gFJU/Mx032B+jMvjNOT?=
 =?us-ascii?Q?CBEwpVoAMVEvA74ihwNQGhEAdBRyf4X6qBxT0j1JUtHecBbARfPK6gT/+CmO?=
 =?us-ascii?Q?J+/UP2blNB98232ejGTGujW2ggFz8u5u1ukWkIuCIU2IAAfy6jszJGfqg2h8?=
 =?us-ascii?Q?2y3T4BKD0Rsrm5t/HApvbttPVFZZG2jYYV2xuyZpEIBqUUIYsoydzwhA/rsk?=
 =?us-ascii?Q?Isvtoa+iixbn9n1GQYUuzkvjWOBO98N0wuiZw/pUFIwp5DxYYSkbWpZLDA69?=
 =?us-ascii?Q?46wTi5TDxIZLo0HLagPDqFDhQ0NPF2lK4mCCsbUzwo8vQCG/KxaEb66tWwBO?=
 =?us-ascii?Q?ja+ELm3FYnR+K0cEsy5K4kw6HaTHgvZWUyj0Vsqks2toQP7k3NrZUvZfZmLT?=
 =?us-ascii?Q?Ug=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e9ff391-2127-434c-1391-08daadf0006b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 14:25:53.8838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40+OB99sdiQsq+zXlnhPvQLVKMjktYpsV1aFzlFhSWu7Qu4+0DDL7ngA9qZXkbiu39HWTWpj9xbKsFLhMUF91uPt4ITp80EnxqYS1DsOxYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4747
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_08,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=925 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140081
X-Proofpoint-GUID: MwlFkZm9DllBnL8V3arfS_NwpJTkXg4h
X-Proofpoint-ORIG-GUID: MwlFkZm9DllBnL8V3arfS_NwpJTkXg4h
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 12, 2022 at 05:51:13PM +0300, Dan Carpenter wrote:
> The "data_len" value is use controlled via the ioctl.  It needs to
> be bounds checked to prevent a buffer overflow.
> 
> Fixes: db23e5001f75 ("i2c: add support for Diolan DLN-2 USB-I2C adapter")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/i2c/busses/i2c-dln2.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-dln2.c b/drivers/i2c/busses/i2c-dln2.c
> index 2a2089db71a5..14f4aeeb263d 100644
> --- a/drivers/i2c/busses/i2c-dln2.c
> +++ b/drivers/i2c/busses/i2c-dln2.c
> @@ -83,6 +83,9 @@ static int dln2_i2c_write(struct dln2_i2c *dln2, u8 addr,
>  
>  	BUILD_BUG_ON(sizeof(*tx) > DLN2_I2C_BUF_SIZE);
>  
> +	if (data_len > sizeof(tx->buf))
> +		return -EINVAL;

Never mind.  This is checked in i2c_check_for_quirks() so the patch is
not required.  My bad.

regards,
dan carpenter

