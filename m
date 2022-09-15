Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEBD5B9CA2
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Sep 2022 16:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbiIOOKf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Sep 2022 10:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbiIOOKd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Sep 2022 10:10:33 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB9196FEC;
        Thu, 15 Sep 2022 07:10:30 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28FDtwI1009696;
        Thu, 15 Sep 2022 14:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=2zhS3CgDniVNIPeFVDwUUY4jBcJeTSCIz922FICXM1o=;
 b=ki3X5PxmtXRiw6QvdLR2dZLXIwkunrQjKXteZsGU4ldciQzIgJX/SuRHClvTAUh5lxua
 2xFjYNhuigOK9Ud4Cqv3vpDohg068TGM+oVgLYeZsXXIikVZDXt4hXjMviB/Rq01tjPR
 vAXUy7hi7z0h04FnPRpBxGQanlTzrPF79Ti3v6jfWZ6FpNPKAoHhBGncatPIIGspncTm
 UdIf978HO5OS/6QhsySMn5BjH6Ao70kraQcZcrCfKI4Z4LYgFJwUTj4UA3fzZNyxkueB
 m3yGzuSYItbDd47KroC60yeTDODptLH+3IpukCmFoqNDOmdc56oedH0YhxoDZD7XhenS IA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jjxypdcm7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 15 Sep 2022 14:10:07 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28FDIADJ013456;
        Thu, 15 Sep 2022 14:10:03 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3jm4tjtet7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 15 Sep 2022 14:10:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQK8NzIPSDk5mtp9mivw7PywJyxigyjMKDtsCq1WrJ7fGg5IU8KqHoiFUoH+G2cgzNNT/KQfYw4X7hKfAsjhNjMpCXJp8asAR5nwk74tx6Cd+0tYblCUi+FCV3nNljAZoL1WY8ep80W1jqA6jCxnEKv9dOfsAinLlrWg6aJXeb3l5VxC6EGTqTczcEOzmkCjN9SMP5cZoo1j4CtAnBs/SwM9k2MY9WMjBQeSz0HGKSfi4JWs02T8wJ81kbR6iIkZ0d6bk79IBjSp/S/5glOUKGtSuW3Zw8nklkz/YUxVbEdPyWg63yBW6z68TGEq8rEggw9+o3BNHlF9FTxONJooGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zhS3CgDniVNIPeFVDwUUY4jBcJeTSCIz922FICXM1o=;
 b=jvKWZLcFIZvPQxDegYP0Nkx6XwRoGrS6F3LSAEJ3sEssQwardI6ICEDx0Nuu6yRme/E4TpYJRWNEImg25w8ifEGjs1GdxkozlXu1NjsoxTGW4eApvIRs97Vt3Hyuz3nqgJe8rBZp7t5bPymARDfLHFevHA2+abcyOK72CK/u2t9XSK59OavHz/7+hrbsBw6jTmPQfgdtIxFlY/i0BMaRn4fpqSRuXV7/bM5mKVL8/zssPLvhN8JI1YR8suUN7kY5YvfH7Ucv7Ouzn0Zahh1wycDw8En3T9XqAtUrf/JS4PUEyzaEJslWgbW9xQkcE960byt4iqgF+6uxG0BmXehRvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zhS3CgDniVNIPeFVDwUUY4jBcJeTSCIz922FICXM1o=;
 b=EBpBSBBnWp6VEWIXqVCtn9+EZJU+vgJ3YJPcv+nHwxkoOynCwbcH/n26wvN+uGIKNjeS9pAbwPwEQ7l3gQFuaTBHq0lbhd4wBZGsg6GLKP8gigqLqHyqfMurV7uz18Atai3YyMNzLD960rMDDE7REDGg3fLHPCOYPtzpsc6nZ0c=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY5PR10MB5961.namprd10.prod.outlook.com
 (2603:10b6:930:2e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Thu, 15 Sep
 2022 14:10:00 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 14:10:00 +0000
Date:   Thu, 15 Sep 2022 17:09:45 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: harden i2c_mux_alloc() against integer
 overflows
Message-ID: <YyMyKQnWgu0SL6jj@kadam>
References: <YyMM8iVSHJ4ammsg@kili>
 <YyMt2cWtHC2SeG62@work>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyMt2cWtHC2SeG62@work>
X-ClientProxiedBy: MR2P264CA0037.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::25)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|CY5PR10MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc32890-8333-4cdc-85c8-08da9723fa23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PCg6JZF5OibmHRJerLyHJNMdrutKrymmX83RlJWORdTJsQLosb6an9qeAh873Y+kJmO9baB6RLarq8ejK08grGWo6TfNs/GUNi1aotCvGSAvuCIvXp7iJFVSa4BXLFzaV6z1Q1kNtCmE6Zk03ZKGX/yXKn6cPEV36b/LdmxBKbG3Z+KRa8KQZL64s4AKHi9eP41hElSv6Sx4KBL3CxZwr4wkP2RlXiNbHwashzP93kewLXaOHCuXORrO5+1c+2eCKnhyY5h+6wmCY0EFEaaPdie1lKwMYBDcw4m6mzpoVpMFc3k6tKn6BnKMq8Ptc41u5sX+oCyYLsNstQ7/kGM5b5ws2eonpn2GQUhknOmf5Xtq8NzoysD826WzLudxgdk1K7EneFRfoMbhTqSVvovsEwO5dxdxSy/kAUKoR9RpfP8J9r+ADjFMu4I3M1+w3yxe+fJRy8iWWhy4A61uiu50POjJUBqekiauSLtgMrY0xURAUVFCXjKAGH3MubRkjeOe1UTdx8Rdv1TrVon9GMTRIFfyJYxawNT9fq9BWq/tIVhngzkUXjaS2jzeUWptx4DY0Gwm59RxOJxIfsNH0HKPXj3zFBw91aEGZOkMR9i7Q7iQC8HnS5spTpOWSK7aXSNDuiAIX46m/xNKdq1KEAcu2XJmC/0kW3ntReaiNvov8/lSZWLeG3i9rBzePvaGruSN1/Kxhrac6KmIa0fuMTyRqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(136003)(396003)(366004)(376002)(39860400002)(346002)(451199015)(6666004)(33716001)(26005)(41300700001)(38100700002)(54906003)(86362001)(6486002)(5660300002)(4326008)(66946007)(66476007)(6512007)(6916009)(186003)(316002)(8676002)(6506007)(8936002)(44832011)(2906002)(9686003)(478600001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GNhchxpYKIsapqI1VtKItljJt5fT9mL4Xq/2NzHxq4+H6ixjJVF4iR5lS+oS?=
 =?us-ascii?Q?E1EeH9IEpnjJtQ98JilCta7sOzj4JtYn/QkNtrDFCI/qykSkPFBNFlbUcKZB?=
 =?us-ascii?Q?L0CCveHv7t2Ii1Wca3IcKQ7od6792AvyBsrKZdcBDVeAQwljVbI3X5QEw/vn?=
 =?us-ascii?Q?3GuUh+46O38oxxhPFZc8VwWfE3jfiv6Br/4R9wx4QWVju+b7rrMuXO56WYnn?=
 =?us-ascii?Q?ub6vPF6pxcHOq21CSR8up+DlVfLxJlvctVNyVljaRxTakvMwQWEKAw/+tvR7?=
 =?us-ascii?Q?QZVewEwjmREm2oxUzFDEzGihX9UDeLXJePr/wii8Hf1QkHD64iSemgsUzxTL?=
 =?us-ascii?Q?Wg1+VF9KN0YSyvvSBVqXyP1Np1/QWXTivyagaDIzMxP9RkuA8hnBuh0639Nw?=
 =?us-ascii?Q?HskM2TX8bs3TpSTyocUygPhETtmRCpe+Cg/1L+1cjWbFTdRWeFc1FFoGQUU+?=
 =?us-ascii?Q?fFsgPltANKopTvFD1hLRlLkmU+3U1QjRczX3dFQigRVsajiyckdrJjBhvL89?=
 =?us-ascii?Q?1kUjBbGu8pDwJ88hSC+bKX+74MpGXZNxBiRggVClZw8nqX3o3PaxSPRfgRcl?=
 =?us-ascii?Q?Rx5L2kn93t4lNwPAwG/ISSdWShujaWdzeUtZCDYX4Y/m4WCM4B9wt3A/pDqa?=
 =?us-ascii?Q?CpaP44OokQ1CykwUR/ZAV1AP3hjBgJknJsKd7dn/rWsdou9mHyRqbiMTarIl?=
 =?us-ascii?Q?a+2avFSYs6OpD1CrnNqSHnOgynk8sAk3TnV/e7oHbiF9F+FioNWqcI4OAZIY?=
 =?us-ascii?Q?nrOeM2tTFbK1xJudpP+BgZxU+nuClP19DfBTSScFxIMz3ZQa6AdCFq0n7XG8?=
 =?us-ascii?Q?XaFl0gqMTrDZKXALMFkHrVwi8H8dJkPjszvl+S036W7VH0xhzWk9qRJgDP+i?=
 =?us-ascii?Q?G0oLK1GNFocYdLOl0oITNXweIvx8Q7P5InN5jvt4Jh0UwJwRnKmw75ONsC5D?=
 =?us-ascii?Q?LNuOpPw4WgGXTpPZEMrMNbo0qfdI0NED/lyAV8q3sXo1Dq2GV+f19HN9HhZY?=
 =?us-ascii?Q?os0ST/9K1bkMDTJkzUcYiWew8ULSVh5laqObcKYp9ryHOePKkUO6LYGpD2qA?=
 =?us-ascii?Q?ZGKWHdSSKI8Z03n12HC2ZOHy0AU6PfCsepLEWMsMRNYR3eyfp+tubIK2ryHU?=
 =?us-ascii?Q?jIes8Q5waLJq13O0j0ez3PK5NgFSCDKti/ABU0Aj+lyjXUFL9GVaOgc9wHug?=
 =?us-ascii?Q?QB2wM6mhUk85pmlJY/7K5Gbr1FqROy9s0fuwWrdD0+GtlaMp4yZJfuRbDlxZ?=
 =?us-ascii?Q?ij/3mCXtKZ1hnl4Fb2A5G0Dd2HZlUsK5N13TxLuazLZYekazC0f0BAdH8HWM?=
 =?us-ascii?Q?mAVmQQhbKjfvuT2EpV1Z6yoxWu0ZZB0du359y/BR4XZrRhPhzeDMqTwfdibX?=
 =?us-ascii?Q?tqyC4dHAbyqiVxagBo3DwYAKplRDkPqtphiUAxuOKQxPxxuTGwawvMsSAaSR?=
 =?us-ascii?Q?AK0md2rbNSsFxPXe8kD6zrnmKAgf5gLr/NBqcD0l8yrDBuaoiA4W7Xe0Wj6i?=
 =?us-ascii?Q?plNF0OHxrAxDGM7Zahqh6mvtmmIzDmyZr6uGZ2Ohz+0VGcdyREdLO73DHYXe?=
 =?us-ascii?Q?JjedtCehy1otDG657/TcqPjVPHAcyRcxpfPBLsMYwC7g07FJ/7rlMa57nEtJ?=
 =?us-ascii?Q?RA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc32890-8333-4cdc-85c8-08da9723fa23
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 14:10:00.5284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfDrTGAfU6/XUNAOLlHUYvdyoSY08BnUEVj5HV+fryvihgTeByI2tWRiaffkY3KbyBUmDOY/t2rhCCi6fcV34vHzL47BlvpsAxtMil+LlVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5961
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_08,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2208220000
 definitions=main-2209150083
X-Proofpoint-ORIG-GUID: DtLCp_xkw6rXhnUMrzG9U4YIbhpjSRl8
X-Proofpoint-GUID: DtLCp_xkw6rXhnUMrzG9U4YIbhpjSRl8
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 15, 2022 at 02:51:21PM +0100, Gustavo A. R. Silva wrote:
> On Thu, Sep 15, 2022 at 02:30:58PM +0300, Dan Carpenter wrote:
> > A couple years back we went through the kernel an automatically
> > converted size calculations to use struct_size() instead.  The
> > struct_size() calculation is protected against integer overflows.
> > 
> > However it does not make sense to use the result from struct_size()
> > for additional math operations as that would negate any safeness.
> 
> Right; there most be a couple more similar cases out there. I'll
> look for them and fix them. Thanks!
> 

That thought occured to me too.  :P  The main problem with that theory
is that sometimes people use struct_size() for readability instead of
just for checking for integer overflows.  Also there are some places
which check for integer overflows manually before doing the math.  So
this code is not perfect.

It would probaby be useful to mark passed data as explicitly unsafe for
integer overflows.  Smatch already tracks user data.  And if the user
data has been capped to an unknown value.  But this would be a
completely separate flag which says that "this value came from
size_add/mul()".

regards,
dan carpenter

drivers/char/tpm/eventlog/tpm2.c:57 tpm2_bios_measurements_start() warn: using integer overflow function 'size_add()' for math
drivers/i2c/i2c-mux.c:248 i2c_mux_alloc() warn: using integer overflow function 'size_add()' for math
drivers/infiniband/hw/qib/qib_user_sdma.c:949 qib_user_sdma_queue_pkts() warn: using integer overflow function 'size_add()' for math
drivers/spi/spi.c:3320 spi_replace_transfers() warn: using integer overflow function 'size_add()' for math
drivers/gpu/drm/msm/msm_gem_submit.c:35 submit_create() warn: using integer overflow function 'size_add()' for math
drivers/cxl/pmem.c:151 cxl_pmem_set_config_data() warn: using integer overflow function 'size_add()' for math
drivers/md/dm-stats.c:295 dm_stats_create() warn: using integer overflow function 'size_add()' for math
drivers/md/dm-ioctl.c:1607 retrieve_deps() warn: using integer overflow function 'size_add()' for math
drivers/remoteproc/remoteproc_core.c:527 rproc_handle_vdev() warn: using integer overflow function 'size_add()' for math
drivers/rpmsg/qcom_glink_native.c:984 qcom_glink_handle_intent() warn: using integer overflow function 'size_add()' for math
drivers/net/ethernet/qlogic/qed/qed_ll2.c:1610 qed_ll2_establish_connection() warn: using integer overflow function 'size_add()' for math
drivers/net/ethernet/chelsio/cxgb4/sge.c:2551 cxgb4_ethofld_send_flowc() warn: using integer overflow function 'size_add()' for math
drivers/net/ethernet/intel/ice/ice_flex_pipe.c:2070 ice_pkg_buf_reserve_section() warn: using integer overflow function 'size_mul()' for math
drivers/net/ethernet/intel/ice/ice_switch.c:2562 ice_add_marker_act() warn: using integer overflow function 'size_add()' for math
drivers/net/ethernet/intel/ice/ice_switch.c:2567 ice_add_marker_act() warn: using integer overflow function 'size_add()' for math
drivers/net/ethernet/intel/ice/ice_switch.c:5478 ice_dummy_packet_add_vlan() warn: using integer overflow function 'size_mul()' for math
drivers/net/ethernet/intel/ice/ice_switch.c:5501 ice_dummy_packet_add_vlan() warn: using integer overflow function 'size_mul()' for math
drivers/gpio/gpiolib.c:4261 gpiod_get_array() warn: using integer overflow function 'size_add()' for math
drivers/gpio/gpiolib.c:4261 gpiod_get_array() warn: using integer overflow function 'size_add()' for math
fs/ntfs3/xattr.c:26 unpacked_ea_size() warn: using integer overflow function 'size_add()' for math
fs/ntfs3/xattr.c:291 ntfs_set_ea() warn: using integer overflow function 'size_add()' for math
io_uring/io_uring.c:2477 rings_size() warn: using integer overflow function 'size_add()' for math
kernel/module/sysfs.c:83 add_sect_attrs() warn: using integer overflow function 'size_add()' for math
kernel/irq/generic-chip.c:310 __irq_alloc_domain_generic_chips() warn: using integer overflow function 'size_add()' for math
kernel/irq/generic-chip.c:310 __irq_alloc_domain_generic_chips() warn: using integer overflow function 'size_add()' for math
kernel/dma/swiotlb.c:355 swiotlb_init_remap() warn: using integer overflow function 'size_mul()' for math
kernel/dma/swiotlb.c:476 swiotlb_exit() warn: using integer overflow function 'size_mul()' for math
sound/soc/qcom/qdsp6/q6apm.c:103 audioreach_graph_mgmt_cmd() warn: using integer overflow function 'size_add()' for math
sound/soc/qcom/qdsp6/audioreach.c:458 audioreach_populate_graph() warn: using integer overflow function 'size_add()' for math
sound/soc/qcom/qdsp6/audioreach.c:501 audioreach_alloc_graph_pkt() warn: using integer overflow function 'size_add()' for math
sound/soc/qcom/qdsp6/audioreach.c:502 audioreach_alloc_graph_pkt() warn: using integer overflow function 'size_add()' for math
sound/soc/qcom/qdsp6/audioreach.c:503 audioreach_alloc_graph_pkt() warn: using integer overflow function 'size_add()' for math
sound/soc/qcom/qdsp6/audioreach.c:505 audioreach_alloc_graph_pkt() warn: using integer overflow function 'size_add()' for math
sound/soc/qcom/qdsp6/audioreach.c:506 audioreach_alloc_graph_pkt() warn: using integer overflow function 'size_add()' for math
sound/soc/qcom/qdsp6/audioreach.c:842 audioreach_pcm_set_media_format() warn: using integer overflow function 'size_add()' for math
net/wireless/scan.c:765 cfg80211_scan_6ghz() warn: using integer overflow function 'size_add()' for math
net/tls/tls_sw.c:1486 tls_decrypt_sg() warn: using integer overflow function 'size_add()' for math
net/bridge/br_multicast.c:2770 br_ip6_multicast_mld2_report() warn: using integer overflow function 'size_add()' for math
net/bluetooth/hci_codec.c:153 hci_read_supported_codecs() warn: using integer overflow function 'size_mul()' for math
net/bluetooth/hci_codec.c:165 hci_read_supported_codecs() warn: using integer overflow function 'size_mul()' for math
net/bluetooth/hci_codec.c:172 hci_read_supported_codecs() warn: using integer overflow function 'size_mul()' for math
net/bluetooth/hci_codec.c:220 hci_read_supported_codecs_v2() warn: using integer overflow function 'size_mul()' for math
net/bluetooth/hci_codec.c:232 hci_read_supported_codecs_v2() warn: using integer overflow function 'size_mul()' for math
net/bluetooth/hci_codec.c:239 hci_read_supported_codecs_v2() warn: using integer overflow function 'size_mul()' for math
lib/stackdepot.c:125 depot_alloc_stack() warn: using integer overflow function 'size_add()' for math
mm/percpu.c:2444 pcpu_alloc_alloc_info() warn: using integer overflow function 'size_add()' for math
