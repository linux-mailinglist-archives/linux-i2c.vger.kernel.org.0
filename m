Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B79E759BBE9
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 10:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233538AbiHVIqK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 04:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiHVIqI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 04:46:08 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C04AE2A25A;
        Mon, 22 Aug 2022 01:46:07 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27M8K0DV002427;
        Mon, 22 Aug 2022 08:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2022-7-12; bh=bXtP+jhWSI9YtQAoJBzNA8U3hurwyUDO2JnRtT/cKg4=;
 b=cotfquOtZVOxnC1l1aj/Kza+SEP+D6oTrAN4YuYdD/E8yDThwV5tHJfrHIVuvvLXIe2i
 zX53yeA5N7cFtjcfXs4T8LzFtD79DRY5vg+QDNLxAzLtPLHXei5KhgnkV5nIZ8pSwngQ
 oXaCS6OWRL/dh1J0PvHj0dBJPy2hgpxaWbfVqOWmokfWZsqwNalFzPgJHCU9ZGjJm1VL
 ilRfyt7bWSSKzqHW7vFqcojw6DyF1zNWkgcS5DRbbgfncP5cAwYdUqDjGIeK+kzjbhrk
 rTsGTPJKOjQjBnRoWEoru8uvyPam85tHIlNGx6i/R5utoXgEtJ7pg6zvwRjQUOAROF3l 3A== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j466h02kh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Aug 2022 08:45:03 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 27M8Z7AW038204;
        Mon, 22 Aug 2022 08:45:02 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3j3mkfs9cx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Aug 2022 08:45:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5jfvuxjg6SFv6Z8LvcH0sJ5bBlM4VKrbHroCwPJEPPIYb44WSNPQByKnJlo/DD7bG5jDI9cks1fxXjFAKV6O+5RgmTqP+83z7ON9xlwxvZl4deGsveA4tPTBecXIsv/aMAYbDc3WANdkOg9pClBctC6KtigQizndgDHcg789I5P7xi5gZq65BQxZvjvRUsUL7TRv63xGRsXR5bZgCSXN4w+annwpI4Cjr5WCFQocS/Fwa4JA37McfMRZBkAovHULp60lLP9QsgwEfDpFxiCmN78gCuFitqSIU0lPT9fSTCieXXScsfIt+NqMFLZyf+GHF9w7M87/Tr5X2bZvwcAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXtP+jhWSI9YtQAoJBzNA8U3hurwyUDO2JnRtT/cKg4=;
 b=QPwuochC4RqzZWJFLJn2w6TmBQVTeySnN90ygXGlhRM7+gVyuEzdfXUXLuNVCj8lObFNOQgs7RIXtdWN9o9EWyiQHzC5e6yZkffcebez7VmBByvny9kugaKAaZROCN08/SluB1UycdgR8q9gTvMVo+55c4u4Wkpvwvg4L9sf6jL9sRVP2wOyPPnZEyqi1MP5Mp5LdOjHP+wJUeC5L01oSW63tdyYsnq57eNA/iUQZPcDa++ma4o73iPLZukj13DmbmXiFMVfPF5zReZIHnkYpsXgFKgKSnXfGCZdfIOEE8XrdvA3EiMC20tJQcH8TgketpSXKDeyi8ur/D+YZJkxog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXtP+jhWSI9YtQAoJBzNA8U3hurwyUDO2JnRtT/cKg4=;
 b=Mgzo53ZKxpcvmlX056OOLL+/RgzbK84DRtonAgtgjA3a4Gkak24J1ZvqodEcwW2ED9I8kw5KgYm/EJmY9EZV1IE/UsQOlUXZq/ocibBftQQ6M4LnLcdNy3x+JKOqN4pSrfqfTHbTm3TYbI/LrjjcTuLJcv5MEFBF8DvhIOON5Kc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN7PR10MB2561.namprd10.prod.outlook.com
 (2603:10b6:406:c9::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Mon, 22 Aug
 2022 08:44:54 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 08:44:54 +0000
Date:   Mon, 22 Aug 2022 11:44:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Arminder Singh <arminders208@outlook.com>,
        linux-kernel@vger.kernel.org
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Hector Martin <marcan@marcan.st>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        Arminder Singh <arminders208@outlook.com>
Subject: Re: [PATCH] i2c: pasemi: Add IRQ support for Apple Silicon
Message-ID: <202208220231.f88sizqa-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0072.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0010a8e1-c469-4fd1-eaef-08da841a95a5
X-MS-TrafficTypeDiagnostic: BN7PR10MB2561:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iiURD78QU1subsP24s7NcyY3JaRsuqmagOI+Q9ZwTVRjgnxMoD5ua/9SBIaDFhR6TUAMhNcZmPu51UlcyzZ8oY+SfAWURTdxDbQ6aSndLIRXd5/UgV9Nr2WCIsdKgespnGzBj1PvoeOHglDlxKCSBquXdvQj0OdkGS/KBZR17RVojlQrckzwYhs74TQW76ilIKcamoHnT86XwjKqbOIn2AKtUT7EzxwRq4m+xmiSZfKigwZDoZAQtBC0WDdqvfOj5J7cG58KSu+2cuoP+NP5JKHOFmQxGafR5rvqj3+WadY4i4SUZF75t35uMm7/4EQoWzG2LGRiCq5uLOZkpUr6qECQe0/wvJCbgdgS5Ab8c5f9NhZ4MLxlivKUO6ZP2beheo2P/cZ/nlV8QavETqyWw15wiepMRLz5hdqCdEucSo8G05u0+celEFgU632ASqCNbSun7kKuxXXD963EEKrxsZJ3dnQIzb5B3moF6kGSvzpsp209Ly083f9EZjAZAEC6gMbTctJDEcl93Wnksqb/NyOONjufMAyDnA7asacn+uYR5q5xh5b7B0cemkQYVrkvBY7kltHFCR5EqjkamFQhCR644MFb/Rcxisr0VMfd68pBsj8Km6AOQ2emYUgeAWjLpZpferv0ecN7pmMYhBQm90cYACvCD7af++uwW1ieJt9tTNxIO/JOeV7pe8CfXp/YVDrNlj/QnW5grUwAetiNowoSdBOfRl9o6dnHPwStudAGT2MTZVS6Am/Z9SX2W7CJ0qN1X8Zc4vSdzt0ag7C1zW0m/YDLn3VbWiDcLirMtHQnNYokjvqPyMW4lqmGh0WQmWTBPT82Mm1eJph43EC3E3PbSwfbbNX54PCs+AEGNEOE9Kpk+Dh48ic5I6xHS+04
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(366004)(376002)(39860400002)(346002)(47660400002)(6666004)(52116002)(6506007)(26005)(6512007)(9686003)(478600001)(966005)(6486002)(41300700001)(83380400001)(2906002)(186003)(1076003)(4326008)(7416002)(8676002)(66946007)(66476007)(66556008)(5660300002)(8936002)(44832011)(316002)(54906003)(36756003)(38100700002)(38350700002)(86362001)(46800400005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xPFz5KsjcasP9sQUZVT7bRmNJTGj/xq9+GceR9KxlL/UZBQUVkW7NUIWL7G7?=
 =?us-ascii?Q?L+tyM5RNsWzVqSbH7R58xJomo7FGDPK+WJL7bpuHqCrk9WXSecciuIl7G/rv?=
 =?us-ascii?Q?XPhA6BXQuXt66JhkrdoHcr6bABxyY6LcYTi4tk8J7YJyxkANGIrrSpZQ1sKO?=
 =?us-ascii?Q?CJO7uhYD4SeosswAX0o2aROqEH7MBzeEbrbK8GdLc487PTlnvYKfsZbnnKLS?=
 =?us-ascii?Q?mLrGL8BnTdSdi+F5JKRdIuvmxue7iLTyuoAUHT76rftkyAgCNxVSY7HRuBxh?=
 =?us-ascii?Q?G+CBMd/6qviB7p6fclyAaAGaBOFZ6HLjI2aTpSDiutoi/O0AbDwAv8FtNy0O?=
 =?us-ascii?Q?7MZ46gujLoAvGFaVudBLC412U56qkgHGjMF/zxKgrFhev3vN556+T+r6UqDs?=
 =?us-ascii?Q?Nd+hrTdJOVbLA+Gk7mZTrfSwmjK6OudV3BHr+ueqkly7g97rFYOmnShR83ur?=
 =?us-ascii?Q?Q6W6idF1HTF88YvGgIp+zBd9gGzrQO7SkOplIWIZlF6aweGpfQqmzCO7aogP?=
 =?us-ascii?Q?JI5kFYKMwy6kbDxePTD2U9suuWPtrnfwrLn55VZwNhgJ5J9jDU4m2u+3wXGh?=
 =?us-ascii?Q?zyu9BGUKIpMw4Kn8/NiWXJkadg3/Lxu3uZGLcl9+S/M3qDrBfZtGKNtwg5JK?=
 =?us-ascii?Q?ktqYLMCTJaYVBMVTBVTZBvmMvWVMMbeiaBvEjdmTxC0n5t9fBkzV9Nsui/Ak?=
 =?us-ascii?Q?zrz4m2Rgr1Vxqpmy4/2sFi3EOKrN/CtHMpzWWuY/P2S06X5WNiu7vavGn8PC?=
 =?us-ascii?Q?B/Ma+XFzQxou0fdPsaip6IsB+T3tFe4jaZ5BPUrNzjalW6qeGvY+1Bxrwrra?=
 =?us-ascii?Q?PJOm/xEVXEBO9/Im4mH1A9JuWW4Iz7SMMGj+hOyCxch5l5zqb9HZEGBoFLtK?=
 =?us-ascii?Q?OHZW0OwNzrFgRmcRG2KOpjRaiq2IIp6swC46rZrZNpcNEKJ/PPT7Wv8oIsgC?=
 =?us-ascii?Q?LCuM0+SZlH4cB6WknSeEwu2rL+bo43ACdjHmbT9aCsnXXfKWmvnNvi03HXWw?=
 =?us-ascii?Q?+v655VJJyktKyaGNJIWYJIaKz402U9nrMuRzF2Stcf9zueV/Z2Pw+cLz8qvG?=
 =?us-ascii?Q?X0GXll3gooVeL/4JHtTe7UYzKb0dS5sP+iwrXuNxeKlW6uEFceThD169qx89?=
 =?us-ascii?Q?8c8C/y9G43nhrIgZuqg6x5q/iRcoUbVm+OucjuPRu0VAVz/idswVhCxLB6fr?=
 =?us-ascii?Q?UOFlRTw4ag7XXh6oRRooX/rF0TF5pPYX6ZnIzo5VLE6ExBQwoqFZfZ/ryLul?=
 =?us-ascii?Q?ct40bc516/zLvvGClAcHLLlq+Hj8RxQFb4gWOTZW0SNth+OIRDUQG+FLit31?=
 =?us-ascii?Q?o21cQNYnO9DuchZ4C7zmBg6KJNvazROqNVVxRDvTVXNoSmDuOUSLvQqJad25?=
 =?us-ascii?Q?dhFsraLePaKcM6pg7xkP8i5oEIw5dLqyGo2Wsbq8FL1kd27rnGqA8k+RWrJe?=
 =?us-ascii?Q?xApTh6lefJuDMoRQ7mjZrqIUW4PTIc40D48C5JqcySz30m8r2akJRhtbUBQi?=
 =?us-ascii?Q?yvfwFkv6P3lOJskw+7932SN5eDLjAnY1/AvR/3GVfT51Dphhlk8CAftswPot?=
 =?us-ascii?Q?G4D1eCehp+6RYCq/YKjj6Udcs1eycsC5xFJpNNKC9YJQzbooTkcGRm7H+ChM?=
 =?us-ascii?Q?ZA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0010a8e1-c469-4fd1-eaef-08da841a95a5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 08:44:54.4634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gmc6v4bhU6YCUKriKuCbh4v3B8qbNi4HHsiknHZaFu23KVauWpBad/cnhNBHirrewMc7+SYxzWsjuNl/NubW1j2CyPVmBRtQByYy2ujFuAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2561
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_04,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208220037
X-Proofpoint-ORIG-GUID: yWtAwSOKStO3TcI33We8aUeZakfhGg-6
X-Proofpoint-GUID: yWtAwSOKStO3TcI33We8aUeZakfhGg-6
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FAKE_REPLY_C,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Arminder,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arminder-Singh/i2c-pasemi-Add-IRQ-support-for-Apple-Silicon/20220821-034703
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: parisc-randconfig-m031-20220821 (https://download.01.org/0day-ci/archive/20220822/202208220231.f88sizqa-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/i2c/busses/i2c-pasemi-core.c:92 pasemi_smb_waitready() error: uninitialized symbol 'status'.

vim +/status +92 drivers/i2c/busses/i2c-pasemi-core.c

8032214346c0c8 drivers/i2c/busses/i2c-pasemi.c      Julia Lawall   2010-09-05   80  static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13   81  {
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13   82  	int timeout = 10;
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13   83  	unsigned int status;
98584b2b51d808 drivers/i2c/busses/i2c-pasemi-core.c Arminder Singh 2022-08-20   84  	unsigned int bitmask = SMSTA_XEN | SMSTA_MTN;
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13   85  
98584b2b51d808 drivers/i2c/busses/i2c-pasemi-core.c Arminder Singh 2022-08-20   86  	if (smbus->use_irq) {
98584b2b51d808 drivers/i2c/busses/i2c-pasemi-core.c Arminder Singh 2022-08-20   87  		reinit_completion(&smbus->irq_completion);
98584b2b51d808 drivers/i2c/busses/i2c-pasemi-core.c Arminder Singh 2022-08-20   88  		reg_write(smbus, REG_IMASK, bitmask);
98584b2b51d808 drivers/i2c/busses/i2c-pasemi-core.c Arminder Singh 2022-08-20   89  		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(10));
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13   90  		status = reg_read(smbus, REG_SMSTA);
98584b2b51d808 drivers/i2c/busses/i2c-pasemi-core.c Arminder Singh 2022-08-20   91  	} else {
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13  @92  		while (!(status & SMSTA_XEN) && timeout--) {

"status" not intialized.

beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13   93  			msleep(1);
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13   94  			status = reg_read(smbus, REG_SMSTA);
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13   95  		}
98584b2b51d808 drivers/i2c/busses/i2c-pasemi-core.c Arminder Singh 2022-08-20   96  	}
98584b2b51d808 drivers/i2c/busses/i2c-pasemi-core.c Arminder Singh 2022-08-20   97  
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13   98  
be8a1f7cd4501c drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-11-15   99  	/* Got NACK? */
be8a1f7cd4501c drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-11-15  100  	if (status & SMSTA_MTN)
be8a1f7cd4501c drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-11-15  101  		return -ENXIO;
be8a1f7cd4501c drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-11-15  102  
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13  103  	if (timeout < 0) {
c06f50ed36cc0a drivers/i2c/busses/i2c-pasemi.c      Sven Peter     2021-10-08  104  		dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13  105  		reg_write(smbus, REG_SMSTA, status);
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13  106  		return -ETIME;
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13  107  	}
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13  108  
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13  109  	/* Clear XEN */
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13  110  	reg_write(smbus, REG_SMSTA, SMSTA_XEN);
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13  111  
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13  112  	return 0;
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-13  113  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

