Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 235EE59DF69
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 14:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357595AbiHWLm3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Aug 2022 07:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357928AbiHWLjd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Aug 2022 07:39:33 -0400
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00137.outbound.protection.outlook.com [40.107.0.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08DB786CF;
        Tue, 23 Aug 2022 02:28:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IoU013dnspOebzHHO6aZ4LXoKHyBNSyfBXpviUG+3BnTOlQJK4qNX4rLXaL/b47aHXO3HwXNoDhyPER3c2nwWl+fxhbP+5Cfrl46uOsGv6bglmj8KiXFAGxf7r9sDpHe1/WcvVfUaEH+oHHAyDZxZongagFVmD29khQ+MoH/O2k896UBlS1cKX+bISs42nRKd9/Hg6I27Toi8Q619+7hIPMSe7pnB07A6H2AxFgMkEi0y0dVdAV5xSpxtdFq+s/JzmOw2GeAZTUKKSyNecLIZZ/XFEEWoXUCqTG3VAobueUv5Hp+51oQqVwFZ17nloCc6IRu+gGp+qgBcbQinjoeFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+w+NUFAqEf1WD/mrZZur+ZGqgvosTVBhLYL3r1c52s=;
 b=SodSwcozuU/Sv71X+636AZFlxwVpCNcethyeXOFBnxlax8KR3P5YfR5o0Lj21Iw8czcFX4aq61DqBlAjyuoQDMfWzpOHylGQ1DNo7jjDToo1c8A2gdg8KybvTZ5UVpnnPeinow2HHrTF3l2vPTvHsgq6J/OMQXRZsUeoLiGpUascIgVcTfp6G/xPZoKaZlgGBZkTlVdPcX+SCVurUjPS0NOHb/K+CIx4GYsnuzqXUUPpMcfNy+5AEwigiHAfB44maFdnOEtl9logHcK+V7NGO+TWAOL/J0M3x+2CLal6ryN3G8pbS6IUb2INDD57Qm63FVIoB1jYdbNpAFtUjHwwnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+w+NUFAqEf1WD/mrZZur+ZGqgvosTVBhLYL3r1c52s=;
 b=AHXH4kfaRcoSCMYIa484sI1FNxu/t8yjUdGdPOsUvV82OKgDqyJj5X22PQivrxYpnU+k4lte4ALKthnVTkeqXIIcn5J3lFB0RJiTO2ZAvBcYQ4IBicreU/mt3AtURrofQ7BVpLI3rdbp69mTFabc8nOwPZjnX9zD2lJvnT9whYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS8PR02MB7078.eurprd02.prod.outlook.com (2603:10a6:20b:2e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Tue, 23 Aug
 2022 09:28:35 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179%6]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 09:28:35 +0000
Message-ID: <72f284ef-233c-37af-a73c-b58e26361d6e@axentia.se>
Date:   Tue, 23 Aug 2022 11:28:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/3] docs: i2c: i2c-topology: fix typo
Content-Language: en-US
To:     luca.ceresoli@bootlin.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        Bagas Sanjaya <bagasdotme@gmail.com>
References: <20220822091050.47099-1-luca.ceresoli@bootlin.com>
 <20220822091050.47099-4-luca.ceresoli@bootlin.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20220822091050.47099-4-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0023.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:a::9)
 To AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d825e8b3-ddda-4152-f5e8-08da84e9da4d
X-MS-TrafficTypeDiagnostic: AS8PR02MB7078:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DARbdSSaVBw4/zAFglq55EBd0O+RxhqJYlXM/oveXnNR3+eM9ZPm5UhcpMBawhXSotZVkR+VEoyLaNbHElLaZJEl284jO34G4GeSFUzmy1f9PJFw3Uf0V/htn/QhI5fx9Wr0FPd2wj6Wr2Jmrpj3DEsR4zYWzpPfEm/XHpnckua6pXqJ/q0DHSOQKBCIjxoyL8iRwTO7KUSJ35fA0mKBzEdqWvxlvpN7YtSBMqY6GjCHqi335CGcHaV/1G2BwnN8X7puiwXZz3hGKZ5WfyqBvYuS75d1OZ9E4RVCcg29Z1iZr66/sLvcOtBqyP698bMVGzlEvQBSRbZ7Bb+n5CdV3Igmjpgz5KcOgnR/1x1nA0w9L9HZyfVDrWDrqUptPODhVbxroFnu1GnaugiiYXcJJU3oHLerDX85ec/99l9f6X9qGw8fGhnpdNUF34teBoQCsI80OzQFLsmMb6Nd7XZ3yIzJ+GUU7zDaJlsXXvakWSYFPP1nlmSK6+oodIh2yI90Ks61kElZeUofTxUElK21KIPsN1NSaqdUaUwnSM3NS1wkPzjp7HcXppF6YltA1PEa5zAftmKXpM61vDk+/CJv4pC/bgARVlhY6zftV4UmO8/EjngVCCAp5O747j1/5v2nBdPeZQ/dl+hy+IBx7iAamgmAZ3nm3gtF0ztPwFwJIhdlnsyhvxTLGntR8WLDwp3hRORPj50BF0WwmH0rOnv8ml3PEf05fcqekFVS9+VKfSIXbMiOOyp8Mzkog1KHhvOfA2hhqGg8+6xxRoUTWL/LnX8ha9faXBhxaO3yJOWpxt8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(376002)(346002)(39840400004)(396003)(478600001)(6486002)(316002)(54906003)(186003)(2616005)(83380400001)(6506007)(41300700001)(38100700002)(26005)(6512007)(2906002)(5660300002)(86362001)(8936002)(31696002)(66946007)(31686004)(36756003)(66556008)(4326008)(66476007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTFLekJFM1poVFQ5Yi9SdE1lWFJGalR6UjJVWkhvS0ZyTXRucEN2RnZnNzJY?=
 =?utf-8?B?eXNKbUZ3MlNrYlU2K2VySGFJUGgxZjlPNnFoYTlkMGkzVXB2OEQxWmlEVFAz?=
 =?utf-8?B?cUx5N3htb1dGMFlmeFA3RVNnbXZzdzhwRmJ2eVRBeFIxbTg1S1kyNGJwazN5?=
 =?utf-8?B?TDY1SUpUSWxmUnh0WkNZbXNXUkZCbFRxVnFDYWFlNlV3dld3NlZmVjZaeDgy?=
 =?utf-8?B?aE56bEhSbXdWMm9IcFc3ME5GZ0pqNWlxNzZab1VRSUVIZ29uYm5tWWVBM1RG?=
 =?utf-8?B?akJhM0ljVk9ySlJ5ck56SVh5WFRVdUQ2VDBUNk1JbjdvYWhwOHh3cWlMUDEr?=
 =?utf-8?B?cjRjS2VNSmttYTNBSjZaeHpnYTJ2TEpjS25MVWJ6SjM5aHkrSE1rZHB0T1Ux?=
 =?utf-8?B?V3BUNXRtM3lJeDVxaGExUWZLRlpIMTJTZmExVTdTU0d4V21UR2kzTmJuTVZG?=
 =?utf-8?B?eHdWRE00dm1vLzN5ZlV2aDFCSE1PamJDUElCMWpTVlRSUHdhYlB5SmcwUTJP?=
 =?utf-8?B?QmU1MkJwdEhBc055STc5d3hzbFZPaTIyQ1BQYi9ka3dXQ204bUFkV25wb0Nn?=
 =?utf-8?B?SEN2U2xFcWJGQU5PalRNKyt0UzRPaVlCYVBkUkJQYU5uYncydU5pZmhkR1Nt?=
 =?utf-8?B?VUY0Y0VxcXBFS2hMUUk2UFBoQ1NQWEYxamNSQ2VmTVhDOHE2UkNGMWg1L2hB?=
 =?utf-8?B?TVlZRFUxYlEzRmlaZ0k5OEY1YjRIRXo3cm56aU9lRGJWWTJqVHlMVk1oV2dk?=
 =?utf-8?B?dVB6SllJSS9USnhTcXh3K2duN0tqZkRqaEhJUmEvbmFPN3ExV1hyZkFCN24y?=
 =?utf-8?B?Nm0yZ0dJcDMyYWJkOHhYdCt0SmN0TVNvck9FRGhhdlB6dXhFTDZPdGNuL3Bk?=
 =?utf-8?B?Q09jVDFtVkdCOUFVa2FadHFnTWpGT2E3Y0NXRGI5cjI1aG5tQWFObnVxUkhm?=
 =?utf-8?B?SFp2TEJieWdqejQvVWkyUUhnSE5iWS82cjdYOGl6akxvSlVUd1RCTVRUQ2Zs?=
 =?utf-8?B?eXdwcE1reEpqVVU3VDJ6bDltdnpWRzN6Ukgwbm44S0lhcjdLNnFWM2NuRGtH?=
 =?utf-8?B?VGFzRWNDUjJrQjliV3NOQUZSek9BQXpDcExDMXBrb1RXaXdDSHNBQUI1c2Jk?=
 =?utf-8?B?ckpVY0lVWW5hOG1MZmNrWHNVRmo0L0V5VFZ5WW56K0ErL3lteUdwSTV5dVBj?=
 =?utf-8?B?cVRFRUlpaWk2NXkrYW1KVTBUT1NJK3RpL1ZCbHJsOWxPL25SemlmUmlUNmx4?=
 =?utf-8?B?eXhySjgyS3U5Mjh2WjdSL3ZiTlgvbnJ6Z01sekdKaFppWkRxRnFlL0lkenNB?=
 =?utf-8?B?UDd6N2V2T0NXb09vYmZZdVcydFVROGJ2Qi94U1lkL1VCaEpkR1k4TDFXOFh0?=
 =?utf-8?B?WEs2NUczSHVhWDBVcTdqNUZNT0RvNmxkRmMra3ltSnFPVHBQMmNsM09tc0xV?=
 =?utf-8?B?S0NSZno4UzFTNDMwYVlxWXNCWi9YdjBGMzY4ZFFjTnVrbENURU82RjJnQzNT?=
 =?utf-8?B?SVFvTFN2TUVvaFhuRHFiNC9tbGZIT3ErVHhvVHViZko2ZEhRMy91bkZxdHh4?=
 =?utf-8?B?dFJYZWRpZEJzblhTNTRoallvMy9xOThpZHgzTmdCall1Qlp5T3k0YlVuMkFa?=
 =?utf-8?B?SjVaNmNjeDh5UnB0d2dEMHI1SU5lU0JCSFluZzlqUHE3dlR2N0tFQ2lHVjdC?=
 =?utf-8?B?SDYrZUN6Uk5mdXZyTUJ1TTI0Q1FzNUFXZVI4WHIvUzlHT3poZXN5czlySThB?=
 =?utf-8?B?WnVrU1ZlVTJjTHRpeTBqdm1qOG12V1d4clNQZUdPWWFUbnNMVHcrdGNuNnVU?=
 =?utf-8?B?SXlLVklrT1g1bndjbCtkNzFyamRWcW9uTVBlVTIwRDErQi9mRGY0ZXMrTjRp?=
 =?utf-8?B?ditoMHJGU05MZ2Rpc3B5eDU4Q3RRYjduU0V3RXpZNmVlZHV6ZHJDTkRNVzl4?=
 =?utf-8?B?QS9NQTJjVmNwY1JMVlYzb2dRbW8vTTdDSGg3MU9XQnVVOHlreWltdWZ2bkRx?=
 =?utf-8?B?SDVjTzZpb2NZK2tRMG5Xb2RGU0J4NDh3YmdPbVdXMUtkNkpvS05PZktQc3U4?=
 =?utf-8?B?amU1c0oreS9QNnBacTNFaGZSYmtjb1pGcWVUemN2cHpvUHFHdFZLUGxqa1pR?=
 =?utf-8?Q?e5plPhoLSMVem2qbkMv+thc6O?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: d825e8b3-ddda-4152-f5e8-08da84e9da4d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 09:28:35.2228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OagmVoBT2QqRR/rWX15anRVJ1YC0nNuw2qVKQQ55c5X8X5pIBm8eTwCIPXvrV4Gd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7078
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2022-08-22 at 11:10, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> "intension" should have probably been "intention", however "intent" seems
> even better.
> 
> Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Peter Rosin <peda@axentia.se>

Thanks for polishing my brain-dump!

Cheers,
Peter

> 
> ---
> 
> Changed in v2:
> - this patch is new in v2
> ---
>  Documentation/i2c/i2c-topology.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
> index 6f2da7f386fd..65ed76bc979f 100644
> --- a/Documentation/i2c/i2c-topology.rst
> +++ b/Documentation/i2c/i2c-topology.rst
> @@ -102,7 +102,7 @@ When using a mux-locked mux, be aware of the following restrictions:
>    I.e. the select-transfer-deselect transaction targeting e.g. device
>    address 0x42 behind mux-one may be interleaved with a similar
>    operation targeting device address 0x42 behind mux-two. The
> -  intension with such a topology would in this hypothetical example
> +  intent with such a topology would in this hypothetical example
>    be that mux-one and mux-two should not be selected simultaneously,
>    but mux-locked muxes do not guarantee that in all topologies.
>  
