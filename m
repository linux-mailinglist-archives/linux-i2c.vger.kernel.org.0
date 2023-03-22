Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5096C4893
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Mar 2023 12:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjCVLHa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Mar 2023 07:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjCVLH2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Mar 2023 07:07:28 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2045.outbound.protection.outlook.com [40.107.96.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 972D34742F;
        Wed, 22 Mar 2023 04:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKcNC4cXcqjVx0foPQelOpb6dQaQtz7SgFxxXYs1FeB2EOQXMEn9NaHKUqRw669uo5pO0uEyBIRGFvuNViSt1fVovyFTRHi0YLkXvduZhoOJYm0KysQvLJ/FsGcRsMESHQIvzdmcJSovaUAnMmNDZQrcck8aYH9pRufzPKVr1fkKJa/jzvVlp4TDpTjFOug+rdGjacZrEV7NFe6qv7i/TGol2MIx0McSU0H4d+zgonuXhFhkwaqbzG+ZbfTGqhP1EGpNKlkAA0uObR5o36F27eJ6M61zGkbXuNwpoJ99H9iuYa5FC60Yh+Rdc3x0PePc+nt8etDl+wmL/n/fyTCC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IViB8kY3yLpDe2GE2RIvUshWOfxWBQMMwHSR99bBijA=;
 b=SFwdHNFDcYzeePYSbebrJY2rc7p1iTaJC3s7gpAEGM6Lqa5T5tNDwNYCqrikkqDv/D1dSxSWVA7NciIFj/RYbbnKvEgpyk1X8hSaYrcB0Xlzv7g/uw5nrkq138KsnHh8PctHOl9RJCBsC/V2kGLkDU8fmb82bvYQyWJ55azqCx1SDj4+Gw9QTN/1Wr2I/fBwhcWOHFEs2v5x00DGrVYEKeIjCbHeiYowytUJPJWXJSckoisyfpthfoAvv0/8L18Z63cJWT/BXkdXFsQFWIuEOpqVnVRGHOkLnv7M5DeAEbvqfxBFniG2tbJjULpkHA7sIEt4Yioen1XzlBsvGC3MMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IViB8kY3yLpDe2GE2RIvUshWOfxWBQMMwHSR99bBijA=;
 b=DEikCKhHNrCz8UBzc7kdr11knRfJ9t6ci9NeyJu3r7cMNKNAmWRcyXcJ7SGM6zebsaD0aBGPGTtJ2X+zT+qlCUeoN3+AXVSlmnTUiBy1vMhIu04W3q1TMNl7a6YLZKP97N2nrlCdjPw1qSEMuq0TZB9VweyTK4PLo5DetJvzpgdoHQIJzNE42wTt8ko+C8dgDAtuQc3nJMU4Q/PB6MOrZwgoYsstqwNyqt5oCQi+NraYee8+Voy0ocW8FBdPipDKF82TLXBFcAUdBfMuWYnd5GsR+N9BJg2l34M98JamBcw4CLJY6feRWocbtC/S5kXh42IFH/Tk9Cm/Mt5+EADBDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SA1PR12MB7296.namprd12.prod.outlook.com (2603:10b6:806:2ba::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 11:07:23 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 11:07:23 +0000
Message-ID: <db870e74-9d97-740a-9829-5fafc0bb0559@nvidia.com>
Date:   Wed, 22 Mar 2023 11:07:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] i2c: tegra: Share same DMA channel for RX and TX
Content-Language: en-US
To:     Akhil R <akhilrajeev@nvidia.com>, christian.koenig@amd.com,
        digetx@gmail.com, ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        sumit.semwal@linaro.org, thierry.reding@gmail.com, wsa@kernel.org
References: <20230322102413.52886-1-akhilrajeev@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230322102413.52886-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0119.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::35) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SA1PR12MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: c548b475-cc08-427e-9445-08db2ac59ceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zu0CzMX+kVGi/npNjGxAOfpk8EZ6u+MIXGjDuxwgLhYNPHOnqbAc0hAksGTrtZmI50ZV+cKy9rlN30Orb6GD7evkwW/mr6ypOgqEkSRXYdFknPJAG/LQN/K8x/qIjVkJ/1KRUnp30AMxqw6eKP6/ry/34opkqOSYO1A+LHuBXOOQkqHMr0u+AJsMs/vDBCYvCjK6H/68iZULApaPxjVuNCl8k9YXV43aR094TYR8f9e/COwDecc2ZVNm12b68YpMPriY+vItItaPWwERT/8vg3bzX9h9ruka5pA6Q2KHWj11SrRAQRsbGyQGJXCFjn+6lDpdrDiic/XT9TYauDdHScn9NdRRR8T5k+DlyXgEyhBlfL+5Z1E2jyNMypm/qaWReuhacEPGybuPtyv3SPoIG+PAf9CUl2UxIfpsCi49OGcyy2xhMDyXe/evigj8axxcTEbnaaPxGuwc3D2xIrmDcodajP2/f61uf5oeTn2Px78Ft6zdDAYYygiLKJ8LPFESnAprVU9SRxzJxZa3z3kC7kFptVnKlbAO2lkwCTR2V/u30vCjRFDIHmaXV17+O6xt7qFmRO9UBdCBqwuLau9xoF09eGNcEg9bWK6yZV+eTtzKh3hMLAbTGto2EGBjK9RoEHirsqHFfMBk/q0dRpDMVzqmX6GJi5uFjaBQKpQAwWmVpkFYOa8DtDvg4uAmLa8/hKtRiSFcz6CRR3o2/25p4IT83juzx1DO+PNGBYPlBGFRRqLjggFVawxC6XHPMV9w
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199018)(316002)(6666004)(38100700002)(66946007)(8676002)(478600001)(66556008)(66476007)(31686004)(6486002)(2906002)(186003)(2616005)(86362001)(41300700001)(6512007)(5660300002)(8936002)(921005)(6506007)(83380400001)(31696002)(53546011)(36756003)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3ZXYWtJM2FWUnpid05IbHJjckxQYzN5SzZVeFo4c1dEdUNPa0hvK3REMmN0?=
 =?utf-8?B?bFdIQ0hxMjVjLzZJSzllYzdnZ1J5UUVPVXBuUGVkMGF4eWJ4N0FaanNiUHdm?=
 =?utf-8?B?MThtYWhvUmsveXJ2R1A4WUU2NHJYRWZ1Qnp3eFZ6NDl4Z0lvYnBtN0ltMUw3?=
 =?utf-8?B?dmpCNzFXNHlXd3ErMzRjQmRoK2Znd1JCaGNLZkdWc0ttcTkzbXY2ME0rT3Bn?=
 =?utf-8?B?NUszRXZFcUlobFhUbFF3RFdtWlhHNzd5SkNUK01zTElzR3FxMjV1UlNIR0I3?=
 =?utf-8?B?Zmh6K096WkRCWGx2aVNaeVFsak5tQlE5NjBFbDdEV1lzQmxYSlpqSS9hM3lm?=
 =?utf-8?B?aC9nbWxJZTU5WEsrdEN3NFVpZlVkaDhxMjVBamJ1STQ5R0tNamphY2twdVRB?=
 =?utf-8?B?MUZvVWE2V0QxUGNCeXRLdDE2R2hJVThqVmc0VUdxK3JSb3dlYTgzZVZoOTlv?=
 =?utf-8?B?cEVWMUpMZUowcUtMci8xazVZTmtUSWFqZHU4L1pMTWtPYU9QQjdxVm5NbFVX?=
 =?utf-8?B?QmY1TE5TOFk4VEpZcWFSajFEM1diTjcrcDkzZ1pJY1VzVk9KMlpWT2Nyc25s?=
 =?utf-8?B?MFJTRlUyMEJCRlViV0Jud1NHVEl6eTRzMkE0QkFNNzVSVHY0bHdiM2xKOGYv?=
 =?utf-8?B?Y1IzV1hubHlNbWNWd1NMblpMVnpZT2RBTWZ6bU9zTFZXR3dnRnlERllvNkxq?=
 =?utf-8?B?aFpUdFF3a0xWamNVTEdudzhFcmxaa0VpckNRYWVvY2JOZkhSSlJ6WVFhWURh?=
 =?utf-8?B?YlAwTnByMGtVS1ByMEF0MnUxcTRVWmxoTlZTREdpUHcxSXhTMW9VanFhV3BG?=
 =?utf-8?B?bzd3VStMSUk1MWt5Y0V4VENkZm1UM2xvdnAzTURxY0VqMUJiUHpjR2p4WnRz?=
 =?utf-8?B?all6STlCT2xRdUMvY3NRRjE5VnBDeTErNXJCdlRxRndHVVNSeFlIZjE3NThQ?=
 =?utf-8?B?cHhwV3M1VU1TamdYMDBqWWtwcG9RUm1qNlRnSjRiUXpaaVFEL094SVRWR3c3?=
 =?utf-8?B?UTl1d1piOG9tbWtHZG5iQUdnanlyOXEwNm1ZVzhZZEJXMXZMWXZZUDlhZUQ1?=
 =?utf-8?B?M2huKzFhR3Vwa1JEV3NZY2pPaDJ3RHdxM0FPRFZtRE9UQVlTUWxwK0dIQ3kx?=
 =?utf-8?B?UXI1M2UvSERBOExBQW4xZkNSWC9sbXlNT2ZzNEFDTzVtWFdSQ2UwSmlvS0Fp?=
 =?utf-8?B?UjZzc1FUT3BjakptRmpVWWJIYTBWUWNsOEVtUk9PdFlINWZFblNDUUZIZGdm?=
 =?utf-8?B?NHpUZFRqa2JnTzU2QmNzMldVd3lzNXFIRSs4UFJsRnFveFhUbllYcWYwcTcx?=
 =?utf-8?B?S0FLODk2OUg2MDdFNlpJazVOVlNjRFBEbGViR1dwVnFJajFhRVlKNWNUNGEr?=
 =?utf-8?B?UjhxYzdJOURnOFhIQnRVYXNJdnRieGNLdmhCb2FsVENHOVFVYlZzZ3VTTDNY?=
 =?utf-8?B?VXVLRVAzaUpSNzFmZmhDbHQyeE9XWEJVcjZWYkNNVXQzU21NaU95QXlQdGdm?=
 =?utf-8?B?Q2Q1MEJkRUlNZkNuLzdDM0tyZDhOYTNxamVnbVNOVDNtSERKcWpPS2twYVAr?=
 =?utf-8?B?RGJHc1dvU0JNeGZxM3lRb3IwZWMvcUxCbzUvcjRSd0pUS0dMaWtqdnpGUlpP?=
 =?utf-8?B?Q3cyUnk1Qit1WUU1K2JmYnYvT1V3Q2hpcExJdlFLNUtjejdBOE9ZS1Z1a0JJ?=
 =?utf-8?B?SlFOTisyaExjclRCRExpTzZ4ZGxoU3ZCY0l3MUpuWXdua1krcG02VEU4Wm9L?=
 =?utf-8?B?eWZlRUJFYUlNOEFpa1ByRmw2WHQyU1JhelBjOVI5cjhYRzMxU0tWS0N2T3hJ?=
 =?utf-8?B?ZVNtSU9TRDhiOFhGb3VFL2Y4eHlNVFpEaUwxTVZGZmJzN3Nib3VxQncyR3Ja?=
 =?utf-8?B?VXYrWDdOblRIMUZla2VkTlFERVlQUGt4VnI4QUE0SllXbStrNjhsN3RNU1hn?=
 =?utf-8?B?Y2hPSzkxRExGZHg4blBEdjB6TmVnWmsxNUszbWNXbkpJY1VGR0dxb25KSno2?=
 =?utf-8?B?YWNjM1J3VEl1NzNSMUF5MEZEUitOWmR3OEdQUHFvQVhyc3E2ZURSRThUSUpt?=
 =?utf-8?B?aGNzY1dHb0I4VGJMMkt3NDhvWno4c1VEYWlFSUVXeGNNaGJLZzZ6VEx2bDRT?=
 =?utf-8?B?ZkxkMW9LbGVvaklhUnFSRHladzNnQk5XNU9nZTg1MzlYNjcreDRsaGwvV0M4?=
 =?utf-8?B?UW44Nm5LT01CZndxK0k2Y0NUa2trd1NlL1NtVW9WVUdLODJMN1BVb3d3WklE?=
 =?utf-8?B?ZFdIVW41MlNLSHArc1dCQk53Y0FnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c548b475-cc08-427e-9445-08db2ac59ceb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 11:07:23.5789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fl5stidFamiQXchXz7DfxBv+K7eVSsclQsrQnq2TNkaXJp3dh7W9QeHyZ2r3RZqfQztkcynCMF9Bj4fr9e8pzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7296
X-Spam-Status: No, score=2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_PASS,
        SPF_NONE,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 22/03/2023 10:24, Akhil R wrote:
> Allocate only one DMA channel for I2C and share it for both TX and RX
> instead of using two different DMA hardware channels with the same
> slave ID. Since I2C supports only half duplex, there is no impact on
> perf with this.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Just to confirm. This impacts all Tegra devices from Tegra20 to the 
latest. Does this work for all Tegra and the different DMA controllers 
that they have?

Thanks
Jon

-- 
nvpublic
