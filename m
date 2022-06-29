Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3B1055FFDA
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 14:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbiF2MZb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 08:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231811AbiF2MZa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 08:25:30 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2133.outbound.protection.outlook.com [40.107.22.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37755338BC;
        Wed, 29 Jun 2022 05:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNPPZY71tRZ2FE20YA/IEgCbjlyQq0pJ/A9F2TGvy9cRxWAwlX3gNM6c833nfPugMyrhjZHJDQbvmfhIRZk3r0LJmpy70Ek6rvOksxm2ojqUzXlmbDhXttkhx2hh+Hwd+C26I1vWOCIVR+gs3akWX+bWdpHcaLiljita6pz+POANNsdklw3qG+7+hOZ1/HbC/Ke2OMEQxEisAjoqGWWkmSVpsTzAgS1pHoJW0iwp9mflUMhjI+3aTL95dIf5fej7ntX7/17tfmqURq74yiLyxCBUTqoXexnDcW4hWEQ8IzZfFXqYvNCOk87h5ALPsHfp3H4Xm3ic5PPug1GeHBgc5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVLUbERcuxL8VQkG1d3Fqzzwouh7FCCJFD+rbjGf/xA=;
 b=QI+n9J6jrHF3qGw7ZciMiEN1zBCz8lgca2a7YvaUS/regQiS4bVDCed34TmcS1UnB6l45Mblhdf9xoT7aNQm9XJOUTLjvA0mzvsEBFsufVuTctZ+AnevjpX/tj2gzNIxQq5TX0GnKv0G3gF1MglwShm0qRN7jDmXI0+KsZgJzWR0tSPT/GZwsjXUYMcbvzFO3Q28wr1acNh1aNDGIQQR6CeIYdWHGMG+FDgJvafotjQq+lXvGDg7rw0pAXQquCFxhm+LMFBhJEbxThwkWY4+8uEIHo0wPSNYLRA4V4qTkoJiEBCuMRSs8vPZBRoltgf5ZkFvfqtQsECwI9NPqBH5sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVLUbERcuxL8VQkG1d3Fqzzwouh7FCCJFD+rbjGf/xA=;
 b=aRCfMP49Tt+AbI00/6OvCHcTe4t1FdyNoI7FEGBINuTVspoyj2utmFWn/SeC+6+8VmCboOoVMvrtoFCdMtFBD7XMdMkFxNMCag39zKtLwY03kJ8KpQ4bvldcGxluR2zwp3tBBgxogLQS4/I6f8Bf6+EglntDKDbmd2VxlDb/D/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by VI1PR0702MB3808.eurprd07.prod.outlook.com (2603:10a6:803:4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.11; Wed, 29 Jun
 2022 12:25:27 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::8885:ac49:4a47:2293]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::8885:ac49:4a47:2293%9]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 12:25:27 +0000
Message-ID: <7a41766b-3009-caba-e473-9035b44b1b06@nokia.com>
Date:   Wed, 29 Jun 2022 14:25:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 06/12] i2c: xiic: Add smbus_block_read functionality
Content-Language: en-US
To:     Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>,
        michal.simek@xilinx.com, michal.simek@amd.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com
Cc:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
 <1656072327-13628-7-git-send-email-manikanta.guntupalli@xilinx.com>
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
In-Reply-To: <1656072327-13628-7-git-send-email-manikanta.guntupalli@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR05CA0250.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::26) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 819c81e6-43e7-47ad-781c-08da59ca72d8
X-MS-TrafficTypeDiagnostic: VI1PR0702MB3808:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gy/8oXQxeholCiRB6et8ukjSaRt4NLIMR3VUq5M6rI/JGCfve6XfUmjyJOysB3Nf8ycFBsCcHERHh8SwpL0Y3JkbEhfVNiroC5HjbgHoCq8e+brIjJph6XRA9+A+NgbtZos8uHaQQYUl3XzHha5OQQSVY7yzMLuXdraRuzapetr1uBGCGuO5KQ66q3ep7zfDpnYM8hwFhpNMefgmyxVpr8a7DwFwFFtikH8aq9S7ddwKm4nrDEqkY7Qo20DMWk4VybbRm7yDu0MxE81QV8YaSiAamr10sLXaZXFEnjHrHCGqv2uYEN/Z0dWGdxbrTdnHQSaIDIORagoqEz8OzY3QJF2iD/fiGPRdrEwZtCfXEDGKwfeQDKcgVE7NJYEgkXkJXJcC1FVcuEmr9/eZmVyDDhrfulZYpUW5pyOfVEQx0PtUm2L1n0GnpvzXnjiZOD2IwLWEdUaT4G/TKGDECizDM8OjZ+5vfpQwOV8OKysulR0n7YSAAe260x9oOqEPW2qLDv45EWkfDKR6MFegfm4OdirzxiUjWFR9numupgPf8G53mMOgFeL2eIasNFLK7+zpX1MKMIcur3YdcNYZ7u7JoMKNFVa5tESJnK8065sbURrL3SkLRha8OPMMMcnF3K/cmBmLhPaETqLWrZZsYn2foHgOz8Zl5wGvmB24bMW2EymsEsIU9rksqZEaQO/8sUwNpyhNItvx66SbGxSzES/LiP2IBMWhr3V5/F3vjCACAR+KHvOQE2SX+CKRBRXdOhMUtVErK9F/X0xC6ocwFCQA0Gk9dtPrbDNAycW9GZVM55tg3fen1tT72w7O8YIisHgtgJZ6ACkB9mteD9+YBSOvyYHpVuh+bgzSeHHHSP7w8IDtf99pkJa5vRJVdbwrb8hW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(8936002)(6486002)(31696002)(2906002)(86362001)(478600001)(66946007)(4326008)(66476007)(38100700002)(66556008)(82960400001)(8676002)(44832011)(5660300002)(316002)(186003)(4744005)(26005)(6512007)(31686004)(2616005)(36756003)(41300700001)(6506007)(83380400001)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RklBdkZxNWhBWXRuVnZqN1VzUWdjMUEvZEtSVy9TcVdqYTBZSnpPdkVCM1Zj?=
 =?utf-8?B?ZGNIK3ZZZ01Ka3l1ZjVSZDRMMXl0ampSMWNSQ3RyT3NVK2tKQklsTGxlazhE?=
 =?utf-8?B?SjJGeThxU1pzTlU3Z3Y0QkpRZG1OZW1WcTM5NVhVUmk5VDhubHhxTGNsZmcx?=
 =?utf-8?B?TU01YThmbkdhaktaMXh1Z1B5bDZnSjVOSGpBaTZNY05VQXVFenVnMnJLY2dU?=
 =?utf-8?B?UEJLWVN5cEdEaUNGcGNVQmUvaFNnVUJMZDRLdHZ0K2hhMFVYQ3pvMGhvMU9m?=
 =?utf-8?B?UURqZlZOSlFkdFJkd1diMXI1RXlpS1RkQVg0Rmw2dWc4TGg2S2N5MDkrazln?=
 =?utf-8?B?NTRiUG43SGVlRlhRWDFDSUUrZFptWGFRNnVRMmVWdjBiblpvUzNnZVkvelhM?=
 =?utf-8?B?cVhtSUx6NXdpTVNJbS92YW1XTUs4MXdONElid20xRzRWcXRFOUViOGZTVTIz?=
 =?utf-8?B?bFd0Y3huMHR3bnJXQTZWQ1JLY1FrQm05NlRsa293NE1YYzA5ajIvWEViVVVi?=
 =?utf-8?B?Q01CeFJpS2xyT3kyaWFKRUtMdVkydTc1SVZsL0x6MEN0SHBpRk8xSnVrTGlU?=
 =?utf-8?B?MzYxSklRcSt5UzByYk1yT2g2bGZJN1VxdUUrVkcwWmI4ODNnRnF6azgzSWdT?=
 =?utf-8?B?RVErajJtZE5OMTkwUkhUZUZNb2krOW5ZZVZjMEFnMW44L3FIUWpEWDNsRk9I?=
 =?utf-8?B?TFU1Nno5RGVZY2NwaTRaYWNCeEJqMzVpcW9jTWxMTCs1azZKeWEweUFaTW01?=
 =?utf-8?B?UkRCOS9sMCtVUUtRUWc5MmR4a2JBcjhIZStlNklDYnU5RDk5WVd1NGRJdGJU?=
 =?utf-8?B?Ri9PSXdRWUNtUTlGWlF1eWVxWUE3R1pyMDdMVE9aQ3hlenRMM0tzRUFKQnBD?=
 =?utf-8?B?a0NMWU9WNkpPUFNZSENVYU1jR3RFRzBsQ1R4SHI5VnJQUGdPYURnNm5kdTN5?=
 =?utf-8?B?R29nbjkrVTZ0VW11OWg3SWozaGlyREgvQWg0MGFKaHZiNFFHZnFnNkE1YVlp?=
 =?utf-8?B?VFYrejFlc0MyajJXQnVSTEpXR3M1OTF4cmtpZDB6cFEwQnBkTUNuRUtwUnJL?=
 =?utf-8?B?WU9zVFRpN2NtczZwbWY2K3ByNC9Yb1NHajFvV014L28vV2JXWjhsR1F6OU13?=
 =?utf-8?B?TFJjQThyK3BLSzRXNC9uR0dCZFBRZm4rdXZOTVV3SmdDeENrVWhpZGJXL0xK?=
 =?utf-8?B?Wm8zcU90QmU2elRXc0ZkS0lUb2I0ZDF3bTNXelJXMXdiWDlNYzhLaHR4eFBm?=
 =?utf-8?B?TjJsM2RtWVJJRmlaSSs0aWVCenpYdmMwNlBXMVpaNVlzb2RZYTRRdVdqbXJv?=
 =?utf-8?B?T3FxWVNMQkVyOG1GUytNSVk3dEl6czkwS0xHY0NBNnFUckhJUDhXd1VTNnFM?=
 =?utf-8?B?S3RUM2xlZXl3YXhyc1dkTWFJbFFZdFVLWFl4Z1NXNFNqcVZaQXJxUWNpKzFN?=
 =?utf-8?B?MFBTZysraC80SDdDL2E2SXAvVUFsNzd4cFIwVXBFM1JTdUZZa1QvZVpBTUdV?=
 =?utf-8?B?QXBsWVZvRjJ2TUtVMEN1M0VRUTVGU2Y0Q0Q0OVF5YVVDd0Zaek9lTVB2VGFG?=
 =?utf-8?B?LzlCZURBL3FlK2hRMHdDQ2RkRmF1Z3ZrbFVPc0lDaUd1V1ArRFVSeFBSNlhZ?=
 =?utf-8?B?bFBCVnRtT0R2OFZFeHNVSEpTUzNjcVhUdzhVamx4QmNWbGR4YUJZZUNWdzEw?=
 =?utf-8?B?akZwQ0NQcjZnd1JiRXM0OEJLOXRyNGp3ejFZZ0g2TU94ME1TY3pLVkdPbkNJ?=
 =?utf-8?B?dTZIQUVRakNvMTVyb24rUmxoczJhNnlyNXZrQWpmRXk1QWZINk1LQWRkZTVB?=
 =?utf-8?B?UCt4MHV1dHQ0UXBFbk5tbjZZOFplbjNuQnpHTHppNGNlN2JobmFvcjkvOGVk?=
 =?utf-8?B?VzRhbXFRT3J6STBKNk9WekUyZGg1TG1tbHVsT3BlSGdVVTNSenZabzNKYUVZ?=
 =?utf-8?B?ZUJGWDM4NEdVUjBqQ0Fvbm5PK2V3c2oyZGRveURkQ3N6TThXY3g0K1NuNmN2?=
 =?utf-8?B?RG0wMTJOMzFJeWtIUTFKTEhTSm5xOEhobnFDdzNxUjJCRVFhQVBBT0t4L3hh?=
 =?utf-8?B?NkJNL3RqMkxIVjVTbjlaMEc4ZExPaHRrbjdDbGREU0FzTTZFbG5ZRWtsNkE2?=
 =?utf-8?B?RjdocU5DUkw2Z0Z6M296dU0yRFVvN1VkTGkzckNIaW5Td3E3NkRHeWtHUXM2?=
 =?utf-8?B?cUE9PQ==?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 819c81e6-43e7-47ad-781c-08da59ca72d8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 12:25:27.3276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TG85oCmKs0V4AohNmHzFS+qmGz9agoICpKNnW/4FQ+myEbbMll0ReZ1OKEh9kvjs7DVjQCOQ8/AaLfrT6D/w0EebCxT1LaAojMwDajWICQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0702MB3808
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

W dniu 24.06.2022 o 14:05, Manikanta Guntupalli pisze:
> From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
>
> smbus_block_read is added to xiic driver to read from few sensors
> which support this command. Since the number of bytes to read is not
> known prior to transfer, we are using xiic standard mode for low level
> control of IP.
>
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>

I have successfully tested the patches from this series up until this 
one so:

Tested-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
