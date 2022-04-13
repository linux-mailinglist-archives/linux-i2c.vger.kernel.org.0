Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04EE14FEE65
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Apr 2022 07:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232351AbiDMFF2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Apr 2022 01:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbiDMFF1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Apr 2022 01:05:27 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 932233B572;
        Tue, 12 Apr 2022 22:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdaiLdJpSNuhvY8VwsJY/YGqEFSJKqh8FXah5UCi9pQnkNbfytGq17bl9pvrLhYf1gfBaRpz63EKOWWBJr9HCdgkBPGwJ5izQpHGFcxdUz4AKi2V/dSckLnX5+XOGEarZOr6R0b03NWMXVvC6hZr1nZYPKz9/sikfGcVuczmBHitbnYncN14HS5teQeNPnbZSqT+vGbsJgREH1AsllVGOCn1twONmK6/304tbrYwsXfCMVLA/GBZit+DgJ1ZMrHUNqoS2SCv6jJH1ks1hlt2+jJdzaXZPHJIxfMh4uxCiMIvRZKCPX2Rb4ggkXn2uv/hKQbmbhoEuq4WZ4+4y4CLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKay6WfqvDXbpodPIUS+xCL5VZqiXlTfPuPBUmV0RLU=;
 b=fycL5Pxd9Wx0r852gXlQmLpFr6aRF0ncZGiT0sIhFTB2hOE6qeW9IXv3wPb8aVeWE7PMInEf5dfW6IleEpCiPuepAqtH4hRoX6AY4unOPigY5ay1hqYMHoCTepNDlhRhT1EB8Cgzh3+6LkjkWezM50oT9u//lTn4phu1Z3ofPvS+Ek3/Qwb+QkkYFv6xn2zhXbGz7gm2p+JvQWZBVc5kwwJ/7IJ2WrIiHSmbIImq6P4CbnYGmLZ6l8VTsIZELOAjApnW4txkAS01LCDHN+aW55+50QwpD2G4YTXXKwvr4DcKUfpLOKwQ49lXvvT8pUESzYzWogaC6+obt1H28Y1xMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKay6WfqvDXbpodPIUS+xCL5VZqiXlTfPuPBUmV0RLU=;
 b=tasVJHWfliIlTgeNeWRSGeaIP6Zr5slKdiEd4/W46RYQxx2qeijUSzyitx5IECx3IgRNOr7AbMfrzE9V154fhXiFWUfyZnL9tasqCs/KfmwKglbJv01tO0Mq/xz9L24IBQdjm8Cyb89WYaNRR/vHc72S+UECcv3TsSDDQV1lMjg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MN2PR12MB4173.namprd12.prod.outlook.com (2603:10b6:208:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 05:03:05 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::dc98:c8ea:da72:b229]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::dc98:c8ea:da72:b229%4]) with mapi id 15.20.5144.029; Wed, 13 Apr 2022
 05:03:05 +0000
Message-ID: <9353972d-e2f3-8994-28ec-38b46345b3c1@amd.com>
Date:   Wed, 13 Apr 2022 10:32:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] i2c: amd-mp2: Remove name from maintainers list
To:     Nehal-bakulchandra Shah <Nehal-bakulchandra.Shah@amd.com>,
        Elie Morisse <syniurge@gmail.com>
Cc:     Basavaraj.Natikar@amd.com, LKML <linux-kernel@vger.kernel.org>,
        linux-i2c@vger.kernel.org
References: <20220408094221.846853-1-Nehal-bakulchandra.Shah@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20220408094221.846853-1-Nehal-bakulchandra.Shah@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN1PR0101CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:e::30) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94b15faf-d991-4a23-385e-08da1d0ae46d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4173:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB417300903B9470ECE4B6A5F39AEC9@MN2PR12MB4173.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M8C2p/PczK8yOCAIZPMTIeL6X0ZfzzUZDA7ApRRO2alyQ6GztOQz8ILyMtp1Nr9cHY/vxTik8GvSo090coaj18Nld0ASFvpfJtX1Wx0VEbzMVtkCQsvrXR//OvJWkRHLLi0lD/+ORStoG6fNENulOc4LLc8iw1qf5lldxIVtBcHysLyNAcFUYXdrZUMfABu64OuFBzkvrp40GoVtIOqmEq0yyGoo4JAzeOpqUbiyjRFeuD3N7jfRfSVklRs8VY2IdVQoJ7/nTzUtImIh3OnN1X46oh84dnoRMu877XWBPYAliF5/P7+PVC0ndZlyimACpTzzXWaiAuxWtnhOgaGh9Eik7ejTB3H+rxzjFy48PM8p368p5cp7aTDzgKYiZ47CM4oMV4AX4C8wtSeIHKerRq/ZkCAS/J5exQeP59uFFGque5yO+4tU6JnQNTPK2ZKNeKreIYGL8o7XOUVx+hUDzzp+QCI3n9ASFGLeHLCX/1vHeYs1WEqNhIR6WhtSgohh7+l34M6fENRUKi1kEK2UHW+42Dk0UXM1SAiT4M1vKer4doE8muQQEos0M/rGbCXowUnHkOoBS425mLlGCzGI9RFM3zK1989Y0LgpgHm/PgJoZ/EEFpM/hybsa4LHvKy92GPfskrTP0XxitgMRJTCzad6PcX+VVx95EQCogOdPmmMCxaUJTeABqNwxvjEN3jNErvcoC0sD0squ+h0MF5RWhNooqi66/yrcJpl04rdtc0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(66946007)(86362001)(36756003)(66556008)(8936002)(31696002)(4744005)(8676002)(2616005)(4326008)(5660300002)(508600001)(6486002)(2906002)(316002)(31686004)(110136005)(53546011)(6512007)(38100700002)(6506007)(6666004)(186003)(83380400001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MExkZkhMWDRXTnVFWUJ1RE1kRVNsaVhYRnlYbUtXeHZ4YStoVHBhR29Lbi9o?=
 =?utf-8?B?c1A3MEFqTEtOS09ZYkhXZWttSGU1MG1YbkViK3RJc3J6SlIrK055NEFkdjRr?=
 =?utf-8?B?NnJkNHpyOGcreHN3V2FibnBCOW12VTRmS2J4Y1VZTjlQay96YUFFMFpFV3c4?=
 =?utf-8?B?SE00K2ZCY3d6MzFNRnl2bWthVUx4eHFqYzR6bWRhbFZWdFU1NkY0czk2aVdv?=
 =?utf-8?B?V1lvK3RwellmMTVVd3NQUWlLckx2Sk1KM0dNYVhkdEhCeS9GMk1jV0swazFW?=
 =?utf-8?B?c1RuVjY0ZXdvTVBWR1U0N3dUaHhBQ1h2T2dicHpPNTBSY1Z3MSt1S25VMEMv?=
 =?utf-8?B?UDJ2S2M0N3U1eHZDQnNGU0hmWkVqTW9BcXBiemovNzFnc0ZZODl5L0h3SGlr?=
 =?utf-8?B?SndEdXhCTldsUHhQeERyelJtZVFCcFlYZ21kR1J0T0tFOTRJR2hjR3N0K3oy?=
 =?utf-8?B?ZFAxQUIzcExTOGs1L00zWHVZTGJub1RkQy9reStqMVJtS3dxdHpVZkp3V1F4?=
 =?utf-8?B?U3dIYVBKMjA5MmNrZmQzaWlURjVUWitUTHJKZFIxclRSck1EWFNMUnoyeE5O?=
 =?utf-8?B?WVAxZG9iWlU2aHdKWUZZeml1L3BFSVQ0TWtvRi9lUEdpUnJYc1RWS3JzYlUw?=
 =?utf-8?B?c29KYThYTzJGazFHQUlzMEVyenJvOFZvM2RvVEJOcHBvWUFuRHRqQXR5Q2p0?=
 =?utf-8?B?c1VwYytIdDZyNlNpOU1yeSt2dS9Jb0lmeTJCakxPSmhHWFBUblV3a003WG5E?=
 =?utf-8?B?QUxnaHIrSW1oRUJRQk43UnlpbG5vRGFtNXZSd1BiL294UllzTGxOakRGc2Qx?=
 =?utf-8?B?MjVEUFNNVnVzVnM0NGJGV0hqVk1oS0ZwMkpVV3RSSVpIUUFaTTJON0dKYkE4?=
 =?utf-8?B?TEFXM1ZMWG1OcFRkWFJWeHVsd1dwV3BINGpSRnhBUnpKckN1VVNFOWUrekZB?=
 =?utf-8?B?d0g2Z2g2c2Z3cTZ6WkRPSm5OUEtrckU2Q3hyV1UwcnJBeE9NTXNLbUd6a2dN?=
 =?utf-8?B?bkhBWnZIM2dBdE15SGdZUHdRYjhOMTZsendObjhxLy9hRWZoZ2FtS1QwRExa?=
 =?utf-8?B?OGZuZEVsYVBhb3gvWmdncUpJN3Q2QzNGOVJjRWlyYzlHRDlNaTl6ZnIrbHBv?=
 =?utf-8?B?VFVVbHc0QUxpTkw1aEtlRXViaHhHRVlXU3YzT0Y1cC9ndVFHMktZdFJnRTEr?=
 =?utf-8?B?SzdBWUp3MEl3YXR6UnB2WHo1OE9CT3NoQnp2b1FlYWgzQVQ5QVlUNFpFMXdp?=
 =?utf-8?B?NHV1TDVRVitrNyt1ZTJ2bkcxTzdPQlZHOFIyRFZxbzNZajdrRGVNMzNDRWlJ?=
 =?utf-8?B?ZFgyTElSYnFBMmdoamlIaEVMLzlwRThaZlZ2Q01YLzVhOUJTdFhML2MyQUFv?=
 =?utf-8?B?czl3WWlyd2gzUUhFOHRiVm9jTGs4WVBwdStVMjZMSDFCNk10ajN5U2lZeVlR?=
 =?utf-8?B?MjNWU2lGVkFDWUV1SUgzTWc0WTZRR1dNV1h0cFNBb1F2c0MzZmFPangwYm92?=
 =?utf-8?B?cWVCNWVoVDBPZytxeDV2KzNiYm9KZTI2NmlySDNpU1FVNW9LUHhxZUxiZnN0?=
 =?utf-8?B?MHQ1WnU2blN5V3Ryc0psN3RJcmRxZVpxMHE0Q3BiTzR3dmxjMGM0MnRPSmVB?=
 =?utf-8?B?cVM2SU1wTHZXYWYwNUsvN1RIK3k2dFhFME85U0tVK0NtdnVvbkk1WlNyUTI5?=
 =?utf-8?B?dGlLU3FEWlVOS3h5T2Z3NUIzT1NsNDJZTmRVajVhUWowbWswYmVIQ1JvRC9m?=
 =?utf-8?B?bWxkb2pLdUhEUGdya0FSclA5ZVgxcjdXemFyeGVrQ21GcllPdkllOCtEa3Nu?=
 =?utf-8?B?cU9Fdjd3ZGZmdFdQQmNrUEVLUGxIdHNHeUU1V0d3NnZWbEZCRGM5clRrMUtq?=
 =?utf-8?B?OFJZWjRUaVl5L0FpMWtKejM4Y2RtbHIzVVpjMkJ1NDVUMW1kc0pKSTAvaTU0?=
 =?utf-8?B?eGkvU2hZdVZqdXlZdGV6U25GaUt4N0pXaDAyZ3JBajhlQlBXcDZQTXRBbWZI?=
 =?utf-8?B?YXREb0tCd2lyMlN1eTA3Ti9sbGlrMG1MTTdKb2lpMkxZUUxTTEoxVjRwYkt6?=
 =?utf-8?B?ZG96T0V1Z3V3cnlaUmJBeWpVNkFtcTE5RnlKT1pmVGZ0Z0JXUUFMbFA5QTdm?=
 =?utf-8?B?WERJU1h1TXFPdEE2QldxYk9kYUV0RUxOcnpYclJuM1J5V2V0eW1sUFFjczF2?=
 =?utf-8?B?THI5alJoNmhLSk8vMloyMjRlTFZLeUVIUjhkY0pVYVA2ckJ0V0tZZUxRRC9G?=
 =?utf-8?B?dlV3L29wdEN6aWpZdVloOGE0TzRKNkR0bUc4ZzF3Qm96c2w3TXJTRy9rbXBs?=
 =?utf-8?B?K0xML0NvaHpXMUdSWFo2UTNyZFc4M210aGtrK1pONUtERnN3N0d4dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b15faf-d991-4a23-385e-08da1d0ae46d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 05:03:04.9025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1grZIBsX3p0jv4Vn/i5OJgEIu7lrseIoK8AXhRVy+rCCYvMKrpOji51D0R7NbcVj6rac19z5ENgEjnxHDenDjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4173
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 4/8/2022 3:12 PM, Nehal-bakulchandra Shah wrote:
> From: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
> 
> Please remove my name from maintainers list from AMD MP2 I2C DRIVER

Remove input subsystem and add i2c.

This was sent to the wrong subsystem. Adding the i2c maintainers and the
open list.

Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

> 
> Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd768d43e048..6ca6f7abaa4a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -985,7 +985,6 @@ F:	drivers/spi/spi-amd.c
>  
>  AMD MP2 I2C DRIVER
>  M:	Elie Morisse <syniurge@gmail.com>
> -M:	Nehal Shah <nehal-bakulchandra.shah@amd.com>
>  M:	Shyam Sundar S K <shyam-sundar.s-k@amd.com>
>  L:	linux-i2c@vger.kernel.org
>  S:	Maintained
> 
