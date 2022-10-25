Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D49C60C5C8
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 09:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbiJYHrd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 03:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbiJYHr2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 03:47:28 -0400
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-ve1eur02on0619.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe06::619])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0867616250F;
        Tue, 25 Oct 2022 00:47:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgkEnRgxLDc3KaeBDgsG+OHd0e5PEGommjeYdYNj4dzJ6Ve0nrqar8dWvYYB2BOt0GaVRRaGY8/mNJfRJ74iftOeAAeRwTIAzxkGURz9o6/SgZDujTK/oTOXQ6FqPh6EdLdYx0KVqykEgpPX4XDBl9fjxhrzVT2VHI2TionAv5/2muMOIKG7BIAMqKmQof+5RBemdIgVZLZiowDfOGNg1ntm1F3s1B0ymkg1ilQ6BSRk2Mpf5SFiT+8Ki0svgW5UaV/LTkOJnn/VJyyz4zIoeEh7rhE8G8uQd/g9GKe6dXCcmQtPdoUltUcuewY9ZsQKfikCvHPFFCGc4edGSU8CYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tv5dVBaP5LwfREeWPkWh0aX+ikDHSt1lECgoXGQn758=;
 b=ACy6U3JVqRGWUbiIy4ZA2aARdDX1XlxEDlkIKeCzWbtY7Nq2gaGTdjG6iWZPvbe7bMV+zkmwFvMDHaRAyESgrXD1Rp/segQCXu3zr15bDxuzw5v5sBUIuki90H8/DgilK/IfxZveltScvFhcmtuqQIxkFj1wQPrwiOARSRpq4S3y6NkZjzH/aiAk/Ou9UPrit66YUeF9A4/EoevufrmpvWpjm+f8jxDq/o2lhPcLkexO4DLUMh8KBCfBpa78++DoZjOPcjOjcCaZ2SsqbcAqhbs6R4AVXLILmP8mf5zTPJV811XS95YkOQzpr9zLwgoX4G0NNZsbdltZ9ODEEeZB8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vigem.de; dmarc=pass action=none header.from=vigem.de;
 dkim=pass header.d=vigem.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vigem.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tv5dVBaP5LwfREeWPkWh0aX+ikDHSt1lECgoXGQn758=;
 b=Wk+YQ2VXOtNAVWLp5Dldb0wztvU5GXdn3EJizE9iPcod0P9Li6kYbmZEt0IbeKG+iGxptF2Q9gbW91hip0rP61FxeoQ7q5y7ljri3eXZSplzAl2pfVtM0coV3r7SJ6a9ynBN5QQZZ2q5e2FWfp5Ut8QkGToOJVVV7pfaAX4dVlU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vigem.de;
Received: from DU0P190MB1930.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:3bd::20)
 by AM8P190MB0803.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 07:47:16 +0000
Received: from DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
 ([fe80::7b61:c1b1:967f:577e]) by DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
 ([fe80::7b61:c1b1:967f:577e%6]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 07:47:16 +0000
Date:   Tue, 25 Oct 2022 09:47:14 +0200 (CEST)
From:   =?UTF-8?Q?Sven_Z=C3=BChlsdorf?= <sven.zuehlsdorf@vigem.de>
To:     Rishi Gupta <gupt21@gmail.com>
cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: NULL pointer dereferences in hid-mcp2221 -- full dmesg
In-Reply-To: <79152feb-bcbc-9e3e-e776-13170ae4ef40@vigem.de>
Message-ID: <1812dbcc-1cc1-fb88-12dc-f77f8d5ae402@vigem.de>
References: <79152feb-bcbc-9e3e-e776-13170ae4ef40@vigem.de>
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:3bd::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P190MB1930:EE_|AM8P190MB0803:EE_
X-MS-Office365-Filtering-Correlation-Id: 201f3ea5-2bb1-4ba2-6690-08dab65d2317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: izckcs56oMftn0dxOJxebry7ByDNoHBE5cEcuiahmpqw+t2F8SNsDyOSOlATku8gcnRNCm92xozE0s+eetjKejJL/aYwlZMNBh6dRcIPVP8vuaAb40rGWhP6S5LwoCpusK1G0x/9GGiGk4Wg+wSuWcTlHaJ9AKsq0WYDquB+ey6TesuN/iCr1Z2oL77/EU36CtcMxyeK4qG6QjMarX6NaQjGs77xZ+Y5OWWS5GhhPqXHMj3qn32ZWpU7UYeOzRqGDNtU501vU0Ovs3cu8DJJd7e0zu+CgI0az3K1dbsv0R4uHmPHquVTGC25775gkeTgHaG585SnO78n69AwSjmVnog8y9mc18ZVK3brI+Y4tleW6Y0A7yffMwHlPv7HzwMCul+WQn16POth9Kj3WnvY6ZzgTjiLaWKb8Nyc84Ozv8Sb2Tu4MzBFGoa7p2gB6ApxoLRyBi4uq3oylQpKoR7Rknr7ozLo5h6gWZj35AiNNhmSHzLKFiHsTvXSaDZ4NahhRXBwTkwE+ixN0kcH8OIrAwpJpzl57dgsDfABgXhnuYSKwNohtDmOtfjIjRaVa4F6FdnNBhJaIbGiQsrcQZmMlWYkehQ6YlmWoYSesD9bgKK2hYPfc1W/yDMHGitesDsPryzawgFbwVLdL8qrjOtzYXiEqBBG/n1hpQv3AMvU6LLLCLTS18Ezoj2gGgF2swrOK14aejx8hy0E1IJiAPqCTqulbJaFUzZi+QJhr2rbAwCuZqo22+s78AQHkRDd1E5khDJ7TzIABCK4xpo2V007jutmo+hyhoHNFpFFLAvgZ7bEJKSC2btsPM2L+g87AwxP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P190MB1930.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39840400004)(396003)(136003)(366004)(376002)(346002)(451199015)(2616005)(36756003)(2906002)(30864003)(66946007)(45080400002)(6506007)(41300700001)(31696002)(66476007)(8936002)(316002)(6916009)(66556008)(966005)(31686004)(6486002)(86362001)(5660300002)(8676002)(4326008)(52116002)(478600001)(26005)(38350700002)(38100700002)(186003)(6512007)(83380400001)(45980500001)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cKK4wElJLAMHshjmt8ipvdd7MzE8F+te/T/zWP4g0OHZLVK1dr7xkRkp81M9?=
 =?us-ascii?Q?R7oMzSjLCXOySrtmz9Eaty1EUm0f50zKI7z5v1C+zAUBc29G8wdmgyeXeOpT?=
 =?us-ascii?Q?I2MMQC3BVlyIQfwei1LPiH3uVOoWn19wiRaKpUZW1Q/dpCWMk+muIrtwtSqD?=
 =?us-ascii?Q?VsmQKA7r50P7dz4qnU3h/fcmIFqC5mMtnXoqfpXuEoJg6Xs9KOuAWYMUtVQG?=
 =?us-ascii?Q?YZQVilgUbtmpBYqPG37GgWGiCAgrsACD1Y1bwyZz9FrOjjnQUi6md12CuKS1?=
 =?us-ascii?Q?vauVJD2gUZpoc6lMOnca+x4uRyTCvPyERlE+Efh8ZPJgU17s1NOld5Q3mJAX?=
 =?us-ascii?Q?M1nnKmMOop8qYLnx417j01s9s9WbM1ZQivTDEJoTdYMLh/jNH30fJmKEccJK?=
 =?us-ascii?Q?G4rdX4lgKYaOLt9pG8os9JL5Zn/6AMh7oY9+agcj+eVmMaJ81eN/pzZt27S+?=
 =?us-ascii?Q?qMMXkYb1+IUj0XJQixEeOcmIcSV9iOHB+xXswsSb1xnhuP6/SFHvuZdp+Q1l?=
 =?us-ascii?Q?s2SlVWDvUSgMd0kGwRYlhVCnhpVMsDsbetDoxUftMd5WPH4hYHRtSW0dqM/J?=
 =?us-ascii?Q?RzdFHDsEl4Kcj6ddInk39UExsXU9j+j5HHSy8F+c5ecFxG6WX/VoZljeA24B?=
 =?us-ascii?Q?38StmxDdOnK7v+JCX3uDU3QksUQBwNRqeAByhiOwmV5H94Xg1xYU6Amwa43a?=
 =?us-ascii?Q?mPU/4/aSr3IEntQUgdcTYzeu9YViClDWUnMbp88GUN0Or7YfTn/TRDkoSsQp?=
 =?us-ascii?Q?zpSkfHqsbucn9tXU8c3x+Eb5oNVPJoXTGV6OBCcXSeS5ojRJWNxb0wtwxRQ/?=
 =?us-ascii?Q?s8ldK6ZuMmMfcy65TnnMWxwAlJsTUDCkuxppRMuLAtmh+86dc/WUE2pb9Yq+?=
 =?us-ascii?Q?7Zc/wK9pj1KSoZtafMKL4cQKDimnQ6QDfT7lBmvgioRX+R2oncJ38oNSWF7U?=
 =?us-ascii?Q?tkrxYT50lxI9G/1g8cHyXPd0lLO0UZf2NAWjY0RBI7NIQkuGF0+BflD30t/0?=
 =?us-ascii?Q?LM1VATpcCnY7eVcWqGzJHV7DNz6MH2+WqWoSNXlxLtCTNb45ZQdC+s7kkt/M?=
 =?us-ascii?Q?+SFV/oZhFxpaFc4hU/SLsk4gWQciJ41B8cwRol7YXINb/MDSUMJ2WJzACCVt?=
 =?us-ascii?Q?UU25AjOs60braJLEInAHguBsJOEQ39UdJTXYNpB16VYvBxSSzc2O33pf9821?=
 =?us-ascii?Q?nFetQtSnfFKn3FNu04kkDhtdrGrLiDsFNfPLaorFVWNnoJkV0F3OkhvOxbJY?=
 =?us-ascii?Q?vE8BFilsH1aNOi54bbSNXL0AYLqamqxDclRKnTiosgTvva8How381UuAOC/2?=
 =?us-ascii?Q?eE3t3wiTc2pRfG5hJb5OAzQASQzllPn+Ysc6ZYCt2JzkwYdJNVD/kURlXjTa?=
 =?us-ascii?Q?AxAUGAFa5NHz9/MHKTrOfeEbyAcvY/xsYglhIMFcgZhT+15kyBllNfU49X/Z?=
 =?us-ascii?Q?zS4psYytgIu5ykYLcWPxCvUqO0FTgvZRfV2UPPQBPvanIvIfUtLHtVu6PnQf?=
 =?us-ascii?Q?q/A7h1bNOGbor2I6sv7WNsNnTJqCjLFjztOI6eww1lVfg02vYFCjUJuoYbRe?=
 =?us-ascii?Q?xHpeid146LjaVN5f+L6EFK3xZCkMQF8D26q0S+ggyRQdg0VKLbdonqcHVUPR?=
 =?us-ascii?Q?ZA=3D=3D?=
X-OriginatorOrg: vigem.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 201f3ea5-2bb1-4ba2-6690-08dab65d2317
X-MS-Exchange-CrossTenant-AuthSource: DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 07:47:16.5795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: dc3cc44e-876e-4b98-9250-42df44be4933
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHdwlyXvuL9PPMlnPFAGHd5qPF6el4TUQIjfc/xlZk/3xwkgKX0Iz66Uv7/xD8Ti0K7nQA2bmcHDx+scB5emtTHlF6ZvZ9qN3UymIdQc7UE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P190MB0803
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[    0.000000] Linux version 6.1.0-rc1-yocto-standard-upstream (oe-user@oe-host) (x86_64-vigem-linux-gcc (GCC) 11.3.0, GNU ld (GNU Binutils) 2.38.20220708) #1 SMP PREEMPT Tue Oct 18 18:25:50 UTC 2022
[    0.000000] Command line: rootwait noinitrd root=PARTUUID=deadbeef-cafe-babe-0815-000000000002 printk.time quiet console=tty0 console=ttyS0,115200n8 pci=assign-busses,pcie_scan_all,realloc=on log_buf_len=256K
[    0.000000] x86/split lock detection: #AC: crashing the kernel on kernel split_locks and warning on user-space split_locks
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
[    0.000000] x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
[    0.000000] x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
[    0.000000] x86/fpu: xstate_offset[9]: 2432, xstate_sizes[9]:    8
[    0.000000] x86/fpu: Enabled xstate features 0x2e7, context size is 2440 bytes, using 'compacted' format.
[    0.000000] signal: max sigframe size: 3632
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009dfff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009e000-0x000000000009efff] reserved
[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000061400fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000061401000-0x0000000061410fff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000061411000-0x00000000654a1fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000654a2000-0x00000000675a1fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000675a2000-0x00000000676e7fff] ACPI data
[    0.000000] BIOS-e820: [mem 0x00000000676e8000-0x0000000069541fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x0000000069542000-0x000000006d9fefff] reserved
[    0.000000] BIOS-e820: [mem 0x000000006d9ff000-0x000000006f7fffff] usable
[    0.000000] BIOS-e820: [mem 0x000000006f800000-0x000000008fffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed20000-0x00000000fed44fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000047fffffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] e820: update [mem 0x5faf8018-0x5fb2c257] usable ==> usable
[    0.000000] e820: update [mem 0x5faf8018-0x5fb2c257] usable ==> usable
[    0.000000] e820: update [mem 0x5fac3018-0x5faf7257] usable ==> usable
[    0.000000] e820: update [mem 0x5fac3018-0x5faf7257] usable ==> usable
[    0.000000] e820: update [mem 0x5f982018-0x5f9a2a57] usable ==> usable
[    0.000000] e820: update [mem 0x5f982018-0x5f9a2a57] usable ==> usable
[    0.000000] e820: update [mem 0x5f961018-0x5f981a57] usable ==> usable
[    0.000000] e820: update [mem 0x5f961018-0x5f981a57] usable ==> usable
[    0.000000] e820: update [mem 0x5f940018-0x5f960a57] usable ==> usable
[    0.000000] e820: update [mem 0x5f940018-0x5f960a57] usable ==> usable
[    0.000000] e820: update [mem 0x5f91f018-0x5f93fa57] usable ==> usable
[    0.000000] e820: update [mem 0x5f91f018-0x5f93fa57] usable ==> usable
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009dfff] usable
[    0.000000] reserve setup_data: [mem 0x000000000009e000-0x000000000009efff] reserved
[    0.000000] reserve setup_data: [mem 0x000000000009f000-0x000000000009ffff] usable
[    0.000000] reserve setup_data: [mem 0x00000000000a0000-0x00000000000fffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x000000005f91f017] usable
[    0.000000] reserve setup_data: [mem 0x000000005f91f018-0x000000005f93fa57] usable
[    0.000000] reserve setup_data: [mem 0x000000005f93fa58-0x000000005f940017] usable
[    0.000000] reserve setup_data: [mem 0x000000005f940018-0x000000005f960a57] usable
[    0.000000] reserve setup_data: [mem 0x000000005f960a58-0x000000005f961017] usable
[    0.000000] reserve setup_data: [mem 0x000000005f961018-0x000000005f981a57] usable
[    0.000000] reserve setup_data: [mem 0x000000005f981a58-0x000000005f982017] usable
[    0.000000] reserve setup_data: [mem 0x000000005f982018-0x000000005f9a2a57] usable
[    0.000000] reserve setup_data: [mem 0x000000005f9a2a58-0x000000005fac3017] usable
[    0.000000] reserve setup_data: [mem 0x000000005fac3018-0x000000005faf7257] usable
[    0.000000] reserve setup_data: [mem 0x000000005faf7258-0x000000005faf8017] usable
[    0.000000] reserve setup_data: [mem 0x000000005faf8018-0x000000005fb2c257] usable
[    0.000000] reserve setup_data: [mem 0x000000005fb2c258-0x0000000061400fff] usable
[    0.000000] reserve setup_data: [mem 0x0000000061401000-0x0000000061410fff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000061411000-0x00000000654a1fff] usable
[    0.000000] reserve setup_data: [mem 0x00000000654a2000-0x00000000675a1fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000675a2000-0x00000000676e7fff] ACPI data
[    0.000000] reserve setup_data: [mem 0x00000000676e8000-0x0000000069541fff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x0000000069542000-0x000000006d9fefff] reserved
[    0.000000] reserve setup_data: [mem 0x000000006d9ff000-0x000000006f7fffff] usable
[    0.000000] reserve setup_data: [mem 0x000000006f800000-0x000000008fffffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed20000-0x00000000fed44fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000047fffffff] usable
[    0.000000] efi: EFI v2.80 by American Megatrends
[    0.000000] efi: ACPI=0x6953e000 ACPI 2.0=0x6953e014 TPMFinalLog=0x69504000 SMBIOS=0x6d68b000 SMBIOS 3.0=0x6d68a000 MEMATTR=0x6028c018 ESRT=0x62a07818 TPMEventLog=0x5fb49018 
[    0.000000] SMBIOS 3.5.0 present.
[    0.000000] DMI: Default string Default string/Default string, BIOS 1.01.10.AR01 08/05/2022
[    0.000000] tsc: Detected 2000.000 MHz processor
[    0.000014] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000017] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000026] last_pfn = 0x480000 max_arch_pfn = 0x400000000
[    0.000212] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT 
[    0.003031] e820: update [mem 0x7f000000-0xffffffff] usable ==> reserved
[    0.003036] last_pfn = 0x6f800 max_arch_pfn = 0x400000000
[    0.016183] esrt: Reserving ESRT space from 0x0000000062a07818 to 0x0000000062a07850.
[    0.016189] e820: update [mem 0x62a07000-0x62a07fff] usable ==> reserved
[    0.016209] Using GB pages for direct mapping
[    0.016921] printk: log_buf_len: 262144 bytes
[    0.016922] printk: early log buf free: 124208(94%)
[    0.016924] Secure boot disabled
[    0.016926] ACPI: Early table checksum verification disabled
[    0.016929] ACPI: RSDP 0x000000006953E014 000024 (v02 ALASKA)
[    0.016933] ACPI: XSDT 0x000000006953D728 0000E4 (v01 ALASKA A M I    01072009 AMI  01000013)
[    0.016940] ACPI: FACP 0x00000000676E5000 000114 (v06 ALASKA A M I    01072009 INTL 20091013)
[    0.016947] ACPI: DSDT 0x00000000676CC000 018D5E (v02 ALASKA A M I    01072009 INTL 20091013)
[    0.016951] ACPI: FACS 0x0000000069540000 000040
[    0.016954] ACPI: FIDT 0x00000000676CB000 00009C (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.016957] ACPI: SSDT 0x00000000676E7000 000409 (v02 INTEL  xh_nccrb 00000000 INTL 20200430)
[    0.016961] ACPI: SSDT 0x00000000676E6000 000748 (v02 INTEL  RAS_ACPI 00000001 INTL 20200430)
[    0.016965] ACPI: ERST 0x00000000676CA000 000230 (v01 ALASKA A M I    00000001 INTL 00000001)
[    0.016968] ACPI: BERT 0x00000000676C9000 000030 (v01 ALASKA A M I    00000001 INTL 00000001)
[    0.016972] ACPI: SSDT 0x00000000676C8000 000745 (v02 INTEL  ADDRXLAT 00000001 INTL 20200430)
[    0.016975] ACPI: MCFG 0x00000000676C7000 00003C (v01 ALASKA A M I    01072009 MSFT 00000097)
[    0.016978] ACPI: BDAT 0x00000000676C6000 000030 (v01 ALASKA A M I    00000000 INTL 20091013)
[    0.016982] ACPI: HMAT 0x00000000676C5000 000688 (v01 ALASKA A M I    00000001 INTL 20091013)
[    0.016985] ACPI: HPET 0x00000000676C4000 000038 (v01 ALASKA A M I    00000001 INTL 20091013)
[    0.016989] ACPI: WDDT 0x00000000676C3000 000040 (v01 ALASKA A M I    00000000 INTL 20091013)
[    0.016992] ACPI: APIC 0x00000000676C1000 00009E (v04 ALASKA A M I    00000000 INTL 20091013)
[    0.016995] ACPI: SLIT 0x00000000676C0000 00002D (v01 ALASKA A M I    00000001 AMI  01000013)
[    0.016999] ACPI: SRAT 0x00000000676BE000 001570 (v03 ALASKA A M I    00000002 AMI  01000013)
[    0.017002] ACPI: OEM4 0x000000006765C000 061EE1 (v02 INTEL  CPU  CST 00003000 INTL 20200430)
[    0.017006] ACPI: OEM1 0x0000000067617000 044D89 (v02 INTEL  CPU EIST 00003000 INTL 20200430)
[    0.017009] ACPI: OEM2 0x0000000067605000 011831 (v02 INTEL  CPU  HWP 00003000 INTL 20200430)
[    0.017013] ACPI: SSDT 0x00000000675E7000 01D9A5 (v02 INTEL  SSDT  PM 00004000 INTL 20200430)
[    0.017017] ACPI: HEST 0x00000000675E6000 00013C (v01 ALASKA A M I    00000001 INTL 00000001)
[    0.017020] ACPI: DMAR 0x00000000675E5000 0000D0 (v01 ALASKA A M I    00000001 INTL 20091013)
[    0.017023] ACPI: FPDT 0x00000000675E4000 000044 (v01 ALASKA A M I    01072009 AMI  01000013)
[    0.017027] ACPI: TPM2 0x00000000675E3000 00004C (v04 ALASKA A M I    00000001 AMI  00000000)
[    0.017030] ACPI: WSMT 0x00000000676C2000 000028 (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.017033] ACPI: Reserving FACP table memory at [mem 0x676e5000-0x676e5113]
[    0.017035] ACPI: Reserving DSDT table memory at [mem 0x676cc000-0x676e4d5d]
[    0.017036] ACPI: Reserving FACS table memory at [mem 0x69540000-0x6954003f]
[    0.017036] ACPI: Reserving FIDT table memory at [mem 0x676cb000-0x676cb09b]
[    0.017037] ACPI: Reserving SSDT table memory at [mem 0x676e7000-0x676e7408]
[    0.017038] ACPI: Reserving SSDT table memory at [mem 0x676e6000-0x676e6747]
[    0.017039] ACPI: Reserving ERST table memory at [mem 0x676ca000-0x676ca22f]
[    0.017040] ACPI: Reserving BERT table memory at [mem 0x676c9000-0x676c902f]
[    0.017041] ACPI: Reserving SSDT table memory at [mem 0x676c8000-0x676c8744]
[    0.017042] ACPI: Reserving MCFG table memory at [mem 0x676c7000-0x676c703b]
[    0.017042] ACPI: Reserving BDAT table memory at [mem 0x676c6000-0x676c602f]
[    0.017043] ACPI: Reserving HMAT table memory at [mem 0x676c5000-0x676c5687]
[    0.017044] ACPI: Reserving HPET table memory at [mem 0x676c4000-0x676c4037]
[    0.017045] ACPI: Reserving WDDT table memory at [mem 0x676c3000-0x676c303f]
[    0.017046] ACPI: Reserving APIC table memory at [mem 0x676c1000-0x676c109d]
[    0.017047] ACPI: Reserving SLIT table memory at [mem 0x676c0000-0x676c002c]
[    0.017048] ACPI: Reserving SRAT table memory at [mem 0x676be000-0x676bf56f]
[    0.017049] ACPI: Reserving OEM4 table memory at [mem 0x6765c000-0x676bdee0]
[    0.017049] ACPI: Reserving OEM1 table memory at [mem 0x67617000-0x6765bd88]
[    0.017050] ACPI: Reserving OEM2 table memory at [mem 0x67605000-0x67616830]
[    0.017051] ACPI: Reserving SSDT table memory at [mem 0x675e7000-0x676049a4]
[    0.017052] ACPI: Reserving HEST table memory at [mem 0x675e6000-0x675e613b]
[    0.017053] ACPI: Reserving DMAR table memory at [mem 0x675e5000-0x675e50cf]
[    0.017054] ACPI: Reserving FPDT table memory at [mem 0x675e4000-0x675e4043]
[    0.017055] ACPI: Reserving TPM2 table memory at [mem 0x675e3000-0x675e304b]
[    0.017056] ACPI: Reserving WSMT table memory at [mem 0x676c2000-0x676c2027]
[    0.017088] Zone ranges:
[    0.017089]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.017091]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.017093]   Normal   [mem 0x0000000100000000-0x000000047fffffff]
[    0.017094] Movable zone start for each node
[    0.017095] Early memory node ranges
[    0.017095]   node   0: [mem 0x0000000000001000-0x000000000009dfff]
[    0.017097]   node   0: [mem 0x000000000009f000-0x000000000009ffff]
[    0.017098]   node   0: [mem 0x0000000000100000-0x0000000061400fff]
[    0.017099]   node   0: [mem 0x0000000061411000-0x00000000654a1fff]
[    0.017100]   node   0: [mem 0x000000006d9ff000-0x000000006f7fffff]
[    0.017101]   node   0: [mem 0x0000000100000000-0x000000047fffffff]
[    0.017103] Initmem setup node 0 [mem 0x0000000000001000-0x000000047fffffff]
[    0.017107] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.017109] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.017139] On node 0, zone DMA: 96 pages in unavailable ranges
[    0.020110] On node 0, zone DMA32: 16 pages in unavailable ranges
[    0.020466] On node 0, zone DMA32: 34141 pages in unavailable ranges
[    0.047267] On node 0, zone Normal: 2048 pages in unavailable ranges
[    0.047707] ACPI: PM-Timer IO Port: 0x508
[    0.047716] ACPI: X2APIC_NMI (uid[0xffffffff] high edge lint[0x1])
[    0.047719] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.047737] IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
[    0.047740] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.047742] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.047747] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.047749] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.047753] TSC deadline timer available
[    0.047754] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.047775] [mem 0x90000000-0xfed1ffff] available for PCI devices
[    0.047778] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.047785] setup_percpu: NR_CPUS:64 nr_cpumask_bits:8 nr_cpu_ids:8 nr_node_ids:1
[    0.048146] percpu: Embedded 54 pages/cpu s180328 r8192 d32664 u262144
[    0.048153] pcpu-alloc: s180328 r8192 d32664 u262144 alloc=1*2097152
[    0.048156] pcpu-alloc: [0] 0 1 2 3 4 5 6 7 
[    0.048178] Built 1 zonelists, mobility grouping on.  Total pages: 4028360
[    0.048180] Kernel command line: consoleblank=0 pci=assign-busses,pcie_scan_all,realloc=on pciehp.pciehp_debug=1 pci_hotplug.debug=1 log_buf_len=256K libata.allow_tpm=1  rootwait noinitrd root=PARTUUID=deadbeef-cafe-babe-0815-000000000002 printk.time quiet console=tty0 console=ttyS0,115200n8 pci=assign-busses,pcie_scan_all,realloc=on log_buf_len=256K
[    0.048274] random: crng init done
[    0.050075] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.050990] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.051324] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.051335] software IO TLB: area num 8.
[    0.104465] Memory: 15888336K/16369860K available (18448K kernel code, 2717K rwdata, 4772K rodata, 1704K init, 1540K bss, 481264K reserved, 0K cma-reserved)
[    0.104518] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.104527] ftrace: allocating 55972 entries in 219 pages
[    0.117192] ftrace: allocated 219 pages with 6 groups
[    0.117272] rcu: Preemptible hierarchical RCU implementation.
[    0.117273] rcu: 	RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=8.
[    0.117275] 	Trampoline variant of Tasks RCU enabled.
[    0.117275] 	Rude variant of Tasks RCU enabled.
[    0.117276] 	Tracing variant of Tasks RCU enabled.
[    0.117277] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    0.117278] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.122834] NR_IRQS: 4352, nr_irqs: 488, preallocated irqs: 16
[    0.123019] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.123206] kfence: initialized - using 2097152 bytes for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
[    0.123233] Console: colour dummy device 80x25
[    0.123252] printk: console [tty0] enabled
[    0.123297] printk: console [ttyS0] enabled
[    0.123305] ACPI: Core revision 20220331
[    0.124070] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635855245 ns
[    0.124119] APIC: Switch to symmetric I/O mode setup
[    0.124121] DMAR: Host address width 46
[    0.124123] DMAR: DRHD base: 0x000000d7ffc000 flags: 0x0
[    0.124129] DMAR: dmar0: reg_base_addr d7ffc000 ver 4:0 cap 8ed008c40780466 ecap 60000f050df
[    0.124132] DMAR: DRHD base: 0x000000fb7fc000 flags: 0x0
[    0.124138] DMAR: dmar1: reg_base_addr fb7fc000 ver 4:0 cap 8ed008c40780466 ecap 60000f050df
[    0.124140] DMAR: DRHD base: 0x000000b3ff6000 flags: 0x1
[    0.124143] DMAR: dmar2: reg_base_addr b3ff6000 ver 4:0 cap 8ed008c40780466 ecap 60000f050df
[    0.124145] DMAR: RMRR base: 0x0000006756c000 end: 0x0000006756efff
[    0.124147] DMAR: ATSR flags: 0x0
[    0.124149] DMAR-IR: IOAPIC id 8 under DRHD base  0xb3ff6000 IOMMU 2
[    0.124151] DMAR-IR: HPET id 0 under DRHD base 0xb3ff6000
[    0.124152] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
[    0.125005] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.125007] x2apic enabled
[    0.125016] Switched APIC routing to cluster x2apic.
[    0.125725] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.130098] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x39a85c9bff6, max_idle_ns: 881590591483 ns
[    0.130102] Calibrating delay loop (skipped), value calculated using timer frequency.. 4000.00 BogoMIPS (lpj=2000000)
[    0.130106] pid_max: default: 32768 minimum: 301
[    0.133123] LSM: Security Framework initializing
[    0.133131] landlock: Up and running.
[    0.133196] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.133227] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.133439] x86/tme: not enabled by BIOS
[    0.133447] CPU0: Thermal monitoring enabled (TM1)
[    0.133449] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.133605] process: using mwait in idle threads
[    0.133607] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.133608] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.133613] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.133616] Spectre V2 : Mitigation: Enhanced IBRS
[    0.133617] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.133618] Spectre V2 : Spectre v2 / PBRSB-eIBRS: Retire a single CALL on VMEXIT
[    0.133619] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.133622] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
[    0.133623] MMIO Stale Data: Vulnerable: Clear CPU buffers attempted, no microcode
[    0.133965] Freeing SMP alternatives memory: 52K
[    0.134025] smpboot: CPU0: Intel(R) Xeon(R) D-1712TR CPU @ 2.00GHz (family: 0x6, model: 0x6c, stepping: 0x1)
[    0.134102] cblist_init_generic: Setting adjustable number of callback queues.
[    0.134102] cblist_init_generic: Setting shift to 3 and lim to 1.
[    0.134102] cblist_init_generic: Setting shift to 3 and lim to 1.
[    0.134102] cblist_init_generic: Setting shift to 3 and lim to 1.
[    0.134102] Performance Events: PEBS fmt4+-baseline,  AnyThread deprecated, Icelake events, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.134102] ... version:                5
[    0.134102] ... bit width:              48
[    0.134102] ... generic registers:      8
[    0.134102] ... value mask:             0000ffffffffffff
[    0.134102] ... max period:             00007fffffffffff
[    0.134102] ... fixed-purpose events:   4
[    0.134102] ... event mask:             0001000f000000ff
[    0.134102] Estimated ratio of average max frequency by base frequency (times 1024): 1280
[    0.134102] rcu: Hierarchical SRCU implementation.
[    0.134102] rcu: 	Max phase no-delay instances is 400.
[    0.134102] smp: Bringing up secondary CPUs ...
[    0.134102] x86: Booting SMP configuration:
[    0.134102] .... node  #0, CPUs:      #1 #2 #3 #4
[    0.144326] MMIO Stale Data CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/processor_mmio_stale_data.html for more details.
[    0.144326]  #5 #6 #7
[    0.153216] smp: Brought up 1 node, 8 CPUs
[    0.153216] smpboot: Max logical packages: 1
[    0.153216] smpboot: Total of 8 processors activated (32000.00 BogoMIPS)
[    0.154533] devtmpfs: initialized
[    0.154533] ACPI: PM: Registering ACPI NVS region [mem 0x676e8000-0x69541fff] (31825920 bytes)
[    0.155225] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.155229] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
[    0.155279] pinctrl core: initialized pinctrl subsystem
[    0.155695] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.155849] i2c-core: driver [dummy] registered
[    0.155851] thermal_sys: Registered thermal governor 'step_wise'
[    0.155852] thermal_sys: Registered thermal governor 'user_space'
[    0.155870] cpuidle: using governor menu
[    0.155870] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[    0.155870] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.155870] dca service started, version 1.12.1
[    0.155870] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0x80000000-0x8fffffff] (base 0x80000000)
[    0.155870] PCI: MMCONFIG at [mem 0x80000000-0x8fffffff] reserved in E820
[    0.155870] pmd_set_huge: Cannot satisfy [mem 0x80000000-0x80200000] with a huge-page mapping due to MTRR override.
[    0.156103] PCI: Using configuration type 1 for base access
[    0.156109] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.158137] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.161108] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.161108] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.161121] cryptd: max_cpu_qlen set to 1000
[    0.178105] raid6: avx512x4 gen() 30774 MB/s
[    0.195103] raid6: avx512x2 gen() 32854 MB/s
[    0.211109] raid6: avx512x1 gen() 31891 MB/s
[    0.228120] raid6: avx2x4   gen() 26094 MB/s
[    0.245132] raid6: avx2x2   gen() 26885 MB/s
[    0.262144] raid6: avx2x1   gen() 22236 MB/s
[    0.262145] raid6: using algorithm avx512x2 gen() 32854 MB/s
[    0.279157] raid6: .... xor() 20453 MB/s, rmw enabled
[    0.279158] raid6: using avx512x2 recovery algorithm
[    0.279211] i2c-core: driver [pca953x] registered
[    0.279243] ACPI: Added _OSI(Module Device)
[    0.279244] ACPI: Added _OSI(Processor Device)
[    0.279245] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.279246] ACPI: Added _OSI(Processor Aggregator Device)
[    0.347345] ACPI: 5 ACPI AML tables successfully acquired and loaded
[    0.361805] ACPI: Dynamic OEM Table Load:
[    0.432478] ACPI: Dynamic OEM Table Load:
[    0.442800] ACPI: Dynamic OEM Table Load:
[    0.540732] ACPI: EC: EC started
[    0.540733] ACPI: EC: interrupt blocked
[    0.540810] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.540812] ACPI: \_SB_.PC00.LPC0.ITEC: Boot DSDT EC used to handle transactions
[    0.540814] ACPI: Interpreter enabled
[    0.540848] ACPI: PM: (supports S0 S5)
[    0.540850] ACPI: Using IOAPIC for interrupt routing
[    0.540918] HEST: Table parsing has been initialized.
[    0.541055] GHES: APEI firmware first mode is enabled by APEI bit and WHEA _OSC.
[    0.541058] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.541060] PCI: Using E820 reservations for host bridge windows
[    0.548316] ACPI: Enabled 6 GPEs in block 00 to 7F
[    0.592222] ACPI: PCI Root Bridge [PC00] (domain 0000 [bus 00-13])
[    0.592229] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.593716] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug AER LTR]
[    0.593936] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
[    0.593938] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.595039] PCI host bridge to bus 0000:00
[    0.595041] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.595044] pci_bus 0000:00: root bus resource [io  0x1000-0x5fff window]
[    0.595045] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.595047] pci_bus 0000:00: root bus resource [mem 0x000c8000-0x000cffff window]
[    0.595048] pci_bus 0000:00: root bus resource [mem 0xfe010000-0xfe010fff window]
[    0.595050] pci_bus 0000:00: root bus resource [mem 0x90000000-0xb3ffffff window]
[    0.595051] pci_bus 0000:00: root bus resource [mem 0x20000000000-0x20fffffffff window]
[    0.595053] pci_bus 0000:00: root bus resource [bus 00-13]
[    0.595061] pci_bus 0000:00: scanning bus
[    0.595080] pci 0000:00:00.0: [8086:09a2] type 00 class 0x088000
[    0.595213] pci 0000:00:00.1: [8086:09a4] type 00 class 0x088000
[    0.595320] pci 0000:00:00.2: [8086:09a3] type 00 class 0x088000
[    0.595425] pci 0000:00:00.3: [8086:09a5] type 00 class 0x088000
[    0.595525] pci 0000:00:00.4: [8086:0998] type 00 class 0x060000
[    0.595616] pci 0000:00:01.0: [8086:0b00] type 00 class 0x088000
[    0.595627] pci 0000:00:01.0: reg 0x10: [mem 0x20fffa90000-0x20fffa93fff 64bit]
[    0.595737] pci 0000:00:01.1: [8086:0b00] type 00 class 0x088000
[    0.595748] pci 0000:00:01.1: reg 0x10: [mem 0x20fffa8c000-0x20fffa8ffff 64bit]
[    0.595855] pci 0000:00:01.2: [8086:0b00] type 00 class 0x088000
[    0.595865] pci 0000:00:01.2: reg 0x10: [mem 0x20fffa88000-0x20fffa8bfff 64bit]
[    0.595972] pci 0000:00:01.3: [8086:0b00] type 00 class 0x088000
[    0.595982] pci 0000:00:01.3: reg 0x10: [mem 0x20fffa84000-0x20fffa87fff 64bit]
[    0.596087] pci 0000:00:01.4: [8086:0b00] type 00 class 0x088000
[    0.596097] pci 0000:00:01.4: reg 0x10: [mem 0x20fffa80000-0x20fffa83fff 64bit]
[    0.596203] pci 0000:00:01.5: [8086:0b00] type 00 class 0x088000
[    0.596214] pci 0000:00:01.5: reg 0x10: [mem 0x20fffa7c000-0x20fffa7ffff 64bit]
[    0.596320] pci 0000:00:01.6: [8086:0b00] type 00 class 0x088000
[    0.596331] pci 0000:00:01.6: reg 0x10: [mem 0x20fffa78000-0x20fffa7bfff 64bit]
[    0.596439] pci 0000:00:01.7: [8086:0b00] type 00 class 0x088000
[    0.596449] pci 0000:00:01.7: reg 0x10: [mem 0x20fffa74000-0x20fffa77fff 64bit]
[    0.596553] pci 0000:00:02.0: [8086:09a6] type 00 class 0x088000
[    0.596563] pci 0000:00:02.0: reg 0x10: [mem 0xb3f82000-0xb3f83fff]
[    0.596654] pci 0000:00:02.1: [8086:09a7] type 00 class 0x088000
[    0.596664] pci 0000:00:02.1: reg 0x10: [mem 0xb3f00000-0xb3f7ffff]
[    0.596670] pci 0000:00:02.1: reg 0x14: [mem 0xb3e80000-0xb3efffff]
[    0.596760] pci 0000:00:02.4: [8086:3456] type 00 class 0x130000
[    0.596770] pci 0000:00:02.4: reg 0x10: [mem 0x20fff900000-0x20fff9fffff 64bit]
[    0.596777] pci 0000:00:02.4: reg 0x18: [mem 0x20fffa70000-0x20fffa73fff 64bit]
[    0.596783] pci 0000:00:02.4: reg 0x20: [mem 0x20fffa40000-0x20fffa5ffff 64bit]
[    0.596883] pci 0000:00:0b.0: [8086:18a6] type 01 class 0x060400
[    0.596904] pci 0000:00:0b.0: reg 0x10: [mem 0x20fffa20000-0x20fffa3ffff 64bit]
[    0.596931] pci 0000:00:0b.0: enabling Extended Tags
[    0.597010] pci 0000:00:0b.0: PME# supported from D0 D3hot D3cold
[    0.597015] pci 0000:00:0b.0: PME# disabled
[    0.597055] pci 0000:00:0b.0: PTM enabled (root), 2ns granularity
[    0.597193] pci 0000:00:0e.0: [8086:18f2] type 00 class 0x010601
[    0.597210] pci 0000:00:0e.0: reg 0x10: [mem 0xb3f80000-0xb3f81fff]
[    0.597219] pci 0000:00:0e.0: reg 0x14: [mem 0xb3f88000-0xb3f880ff]
[    0.597229] pci 0000:00:0e.0: reg 0x18: [io  0x5080-0x5087]
[    0.597238] pci 0000:00:0e.0: reg 0x1c: [io  0x5070-0x5073]
[    0.597247] pci 0000:00:0e.0: reg 0x20: [io  0x5020-0x503f]
[    0.597256] pci 0000:00:0e.0: reg 0x24: [mem 0xb3f87000-0xb3f877ff]
[    0.597303] pci 0000:00:0e.0: PME# supported from D3hot
[    0.597307] pci 0000:00:0e.0: PME# disabled
[    0.597398] pci 0000:00:0f.0: [8086:18ac] type 00 class 0x088000
[    0.597423] pci 0000:00:0f.0: reg 0x10: [mem 0x20fffa99000-0x20fffa993ff 64bit]
[    0.597636] pci 0000:00:15.0: [8086:18ae] type 01 class 0x060400
[    0.597656] pci 0000:00:15.0: reg 0x10: [mem 0x20fffa00000-0x20fffa1ffff 64bit]
[    0.597680] pci 0000:00:15.0: enabling Extended Tags
[    0.597753] pci 0000:00:15.0: PME# supported from D0 D3hot D3cold
[    0.597756] pci 0000:00:15.0: PME# disabled
[    0.597792] pci 0000:00:15.0: PTM enabled (root), 2ns granularity
[    0.597923] pci 0000:00:18.0: [8086:18d3] type 00 class 0x078000
[    0.597955] pci 0000:00:18.0: reg 0x10: [mem 0x20fffa98000-0x20fffa98fff 64bit]
[    0.598070] pci 0000:00:18.0: PME# supported from D3hot
[    0.598075] pci 0000:00:18.0: PME# disabled
[    0.598188] pci 0000:00:18.4: [8086:18d6] type 00 class 0x078000
[    0.598220] pci 0000:00:18.4: reg 0x10: [mem 0x20fffa97000-0x20fffa97fff 64bit]
[    0.598336] pci 0000:00:18.4: PME# supported from D3hot
[    0.598341] pci 0000:00:18.4: PME# disabled
[    0.598431] pci 0000:00:1a.0: [8086:18d8] type 00 class 0x070002
[    0.598449] pci 0000:00:1a.0: reg 0x10: [io  0x5060-0x5067]
[    0.598457] pci 0000:00:1a.0: reg 0x14: [mem 0xb3f86000-0xb3f860ff]
[    0.598603] pci 0000:00:1a.1: [8086:18d8] type 00 class 0x070002
[    0.598621] pci 0000:00:1a.1: reg 0x10: [io  0x5050-0x5057]
[    0.598628] pci 0000:00:1a.1: reg 0x14: [mem 0xb3f85000-0xb3f850ff]
[    0.598772] pci 0000:00:1a.2: [8086:18d8] type 00 class 0x070002
[    0.598789] pci 0000:00:1a.2: reg 0x10: [io  0x5040-0x5047]
[    0.598797] pci 0000:00:1a.2: reg 0x14: [mem 0xb3f84000-0xb3f840ff]
[    0.598941] pci 0000:00:1a.3: [8086:18d9] type 00 class 0xff0000
[    0.599132] pci 0000:00:1d.0: [8086:0998] type 00 class 0x060000
[    0.599311] pci 0000:00:1e.0: [8086:18d0] type 00 class 0x0c0330
[    0.599335] pci 0000:00:1e.0: reg 0x10: [mem 0x20fffa60000-0x20fffa6ffff 64bit]
[    0.599418] pci 0000:00:1e.0: PME# supported from D3hot D3cold
[    0.599421] pci 0000:00:1e.0: PME# disabled
[    0.599680] pci 0000:00:1f.0: [8086:18dc] type 00 class 0x060100
[    0.599880] pci 0000:00:1f.4: [8086:18df] type 00 class 0x0c0500
[    0.599903] pci 0000:00:1f.4: reg 0x10: [mem 0x20fffa96000-0x20fffa960ff 64bit]
[    0.599924] pci 0000:00:1f.4: reg 0x20: [io  0x5000-0x501f]
[    0.600010] pci 0000:00:1f.5: [8086:18e0] type 00 class 0x0c8000
[    0.600032] pci 0000:00:1f.5: reg 0x10: [mem 0xfe010000-0xfe010fff]
[    0.600222] pci 0000:00:1f.7: [8086:18e1] type 00 class 0x130000
[    0.600242] pci 0000:00:1f.7: reg 0x10: [mem 0x20fff800000-0x20fff8fffff 64bit]
[    0.600254] pci 0000:00:1f.7: reg 0x18: [mem 0x20fff000000-0x20fff7fffff 64bit]
[    0.600266] pci 0000:00:1f.7: reg 0x20: [mem 0x20fffa94000-0x20fffa95fff 64bit]
[    0.600348] pci_bus 0000:00: fixups for bus
[    0.600351] pci 0000:00:0b.0: scanning [bus 01-01] behind bridge, pass 0
[    0.600361] pci 0000:00:15.0: scanning [bus 02-02] behind bridge, pass 0
[    0.600371] pci 0000:00:0b.0: scanning [bus 00-00] behind bridge, pass 1
[    0.600439] pci_bus 0000:01: scanning bus
[    0.600471] pci 0000:01:00.0: [8086:0d9f] type 00 class 0x020000
[    0.600491] pci 0000:01:00.0: reg 0x10: [mem 0xb3b00000-0xb3bfffff]
[    0.600517] pci 0000:01:00.0: reg 0x1c: [mem 0xb3c00000-0xb3c03fff]
[    0.600654] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
[    0.600658] pci 0000:01:00.0: PME# disabled
[    0.600882] pci_bus 0000:01: fixups for bus
[    0.600884] pci 0000:00:0b.0: PCI bridge to [bus 01-13]
[    0.600890] pci 0000:00:0b.0:   bridge window [mem 0xb3b00000-0xb3cfffff]
[    0.600896] pci_bus 0000:01: bus scan returning with max=01
[    0.600897] pci_bus 0000:01: busn_res: [bus 01-13] end is updated to 01
[    0.600903] pci 0000:00:15.0: scanning [bus 00-00] behind bridge, pass 1
[    0.600964] pci_bus 0000:02: scanning bus
[    0.600999] pci 0000:02:00.0: working around ROM BAR overlap defect
[    0.601001] pci 0000:02:00.0: [8086:1533] type 00 class 0x020000
[    0.601030] pci 0000:02:00.0: reg 0x10: [mem 0xb3d00000-0xb3d7ffff]
[    0.601059] pci 0000:02:00.0: reg 0x18: [io  0x4000-0x401f]
[    0.601075] pci 0000:02:00.0: reg 0x1c: [mem 0xb3d80000-0xb3d83fff]
[    0.601245] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
[    0.601250] pci 0000:02:00.0: PME# disabled
[    0.601450] pci_bus 0000:02: fixups for bus
[    0.601451] pci 0000:00:15.0: PCI bridge to [bus 02-13]
[    0.601454] pci 0000:00:15.0:   bridge window [io  0x4000-0x4fff]
[    0.601458] pci 0000:00:15.0:   bridge window [mem 0xb3d00000-0xb3dfffff]
[    0.601463] pci_bus 0000:02: bus scan returning with max=02
[    0.601464] pci_bus 0000:02: busn_res: [bus 02-13] end is updated to 02
[    0.601468] pci_bus 0000:00: bus scan returning with max=02
[    0.601469] pci_bus 0000:00: on NUMA node 0
[    0.603242] ACPI: PCI Root Bridge [PC01] (domain 0000 [bus 14-f2])
[    0.603248] acpi PNP0A08:01: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.605389] acpi PNP0A08:01: _OSC: platform does not support [SHPCHotplug AER]
[    0.605746] acpi PNP0A08:01: _OSC: OS now controls [PCIeHotplug PME PCIeCapability LTR]
[    0.605747] acpi PNP0A08:01: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.605878] PCI host bridge to bus 0000:14
[    0.605880] pci_bus 0000:14: root bus resource [io  0x6000-0xafff window]
[    0.605882] pci_bus 0000:14: root bus resource [mem 0xb4000000-0xd7ffffff window]
[    0.605884] pci_bus 0000:14: root bus resource [mem 0x21000000000-0x21fffffffff window]
[    0.605885] pci_bus 0000:14: root bus resource [bus 14-f2]
[    0.605890] pci_bus 0000:14: scanning bus
[    0.605900] pci 0000:14:00.0: [8086:09a2] type 00 class 0x088000
[    0.606005] pci 0000:14:00.1: [8086:09a4] type 00 class 0x088000
[    0.606105] pci 0000:14:00.2: [8086:09a3] type 00 class 0x088000
[    0.606203] pci 0000:14:00.3: [8086:09a5] type 00 class 0x088000
[    0.606301] pci 0000:14:00.4: [8086:0998] type 00 class 0x060000
[    0.606386] pci 0000:14:02.0: [8086:347a] type 01 class 0x060400
[    0.606398] pci 0000:14:02.0: reg 0x10: [mem 0x21ffff40000-0x21ffff5ffff 64bit]
[    0.606447] pci 0000:14:02.0: PME# supported from D0 D3hot D3cold
[    0.606450] pci 0000:14:02.0: PME# disabled
[    0.606467] pci 0000:14:02.0: PTM enabled (root), 2ns granularity
[    0.606804] pci 0000:14:03.0: [8086:347b] type 01 class 0x060400
[    0.606816] pci 0000:14:03.0: reg 0x10: [mem 0x21ffff20000-0x21ffff3ffff 64bit]
[    0.606864] pci 0000:14:03.0: PME# supported from D0 D3hot D3cold
[    0.606867] pci 0000:14:03.0: PME# disabled
[    0.606883] pci 0000:14:03.0: PTM enabled (root), 2ns granularity
[    0.607203] pci 0000:14:04.0: [8086:347c] type 01 class 0x060400
[    0.607215] pci 0000:14:04.0: reg 0x10: [mem 0x21ffff00000-0x21ffff1ffff 64bit]
[    0.607264] pci 0000:14:04.0: PME# supported from D0 D3hot D3cold
[    0.607266] pci 0000:14:04.0: PME# disabled
[    0.607283] pci 0000:14:04.0: PTM enabled (root), 2ns granularity
[    0.607610] pci_bus 0000:14: fixups for bus
[    0.607612] pci 0000:14:02.0: scanning [bus 15-15] behind bridge, pass 0
[    0.607618] pci 0000:14:03.0: scanning [bus 16-16] behind bridge, pass 0
[    0.607624] pci 0000:14:04.0: scanning [bus 17-17] behind bridge, pass 0
[    0.607630] pci 0000:14:02.0: scanning [bus 00-00] behind bridge, pass 1
[    0.607684] pci_bus 0000:15: dev 00, created physical slot 6
[    0.607842] pci_bus 0000:15: scanning bus
[    0.607855] pci 0000:15:00.0: [1987:5012] type 00 class 0x010802
[    0.607872] pci 0000:15:00.0: reg 0x10: [mem 0xd7e00000-0xd7e03fff 64bit]
[    0.608121] pci_bus 0000:15: fixups for bus
[    0.608122] pci 0000:14:02.0: PCI bridge to [bus 15-f2]
[    0.608125] pci 0000:14:02.0:   bridge window [mem 0xd7e00000-0xd7efffff]
[    0.608129] pci_bus 0000:15: bus scan returning with max=15
[    0.608130] pci_bus 0000:15: busn_res: [bus 15-f2] end is updated to 15
[    0.608134] pci 0000:14:03.0: scanning [bus 00-00] behind bridge, pass 1
[    0.608188] pci_bus 0000:16: dev 00, created physical slot 82
[    0.608345] pci_bus 0000:16: scanning bus
[    0.608359] pci 0000:16:00.0: [1987:5012] type 00 class 0x010802
[    0.608376] pci 0000:16:00.0: reg 0x10: [mem 0xd7d00000-0xd7d03fff 64bit]
[    0.608612] pci_bus 0000:16: fixups for bus
[    0.608613] pci 0000:14:03.0: PCI bridge to [bus 16-f2]
[    0.608617] pci 0000:14:03.0:   bridge window [mem 0xd7d00000-0xd7dfffff]
[    0.608620] pci_bus 0000:16: bus scan returning with max=16
[    0.608621] pci_bus 0000:16: busn_res: [bus 16-f2] end is updated to 16
[    0.608625] pci 0000:14:04.0: scanning [bus 00-00] behind bridge, pass 1
[    0.608678] pci_bus 0000:17: dev 00, created physical slot 83
[    0.608828] pci_bus 0000:17: scanning bus
[    0.608852] pci 0000:17:00.0: [8086:158b] type 00 class 0x020000
[    0.608868] pci 0000:17:00.0: reg 0x10: [mem 0x21ffe000000-0x21ffeffffff 64bit pref]
[    0.608885] pci 0000:17:00.0: reg 0x1c: [mem 0x21fff808000-0x21fff80ffff 64bit pref]
[    0.608898] pci 0000:17:00.0: reg 0x30: [mem 0xd7c80000-0xd7cfffff pref]
[    0.608966] pci 0000:17:00.0: PME# supported from D0 D3hot D3cold
[    0.608969] pci 0000:17:00.0: PME# disabled
[    0.608991] pci 0000:17:00.0: reg 0x184: [mem 0x21fff400000-0x21fff40ffff 64bit pref]
[    0.608993] pci 0000:17:00.0: VF(n) BAR0 space: [mem 0x21fff400000-0x21fff7fffff 64bit pref] (contains BAR0 for 64 VFs)
[    0.609007] pci 0000:17:00.0: reg 0x190: [mem 0x21fff910000-0x21fff913fff 64bit pref]
[    0.609009] pci 0000:17:00.0: VF(n) BAR3 space: [mem 0x21fff910000-0x21fffa0ffff 64bit pref] (contains BAR3 for 64 VFs)
[    0.609265] pci 0000:17:00.1: [8086:158b] type 00 class 0x020000
[    0.609281] pci 0000:17:00.1: reg 0x10: [mem 0x21ffd000000-0x21ffdffffff 64bit pref]
[    0.609298] pci 0000:17:00.1: reg 0x1c: [mem 0x21fff800000-0x21fff807fff 64bit pref]
[    0.609311] pci 0000:17:00.1: reg 0x30: [mem 0xd7c00000-0xd7c7ffff pref]
[    0.609377] pci 0000:17:00.1: PME# supported from D0 D3hot D3cold
[    0.609380] pci 0000:17:00.1: PME# disabled
[    0.609399] pci 0000:17:00.1: reg 0x184: [mem 0x21fff000000-0x21fff00ffff 64bit pref]
[    0.609400] pci 0000:17:00.1: VF(n) BAR0 space: [mem 0x21fff000000-0x21fff3fffff 64bit pref] (contains BAR0 for 64 VFs)
[    0.609413] pci 0000:17:00.1: reg 0x190: [mem 0x21fff810000-0x21fff813fff 64bit pref]
[    0.609415] pci 0000:17:00.1: VF(n) BAR3 space: [mem 0x21fff810000-0x21fff90ffff 64bit pref] (contains BAR3 for 64 VFs)
[    0.609681] pci_bus 0000:17: fixups for bus
[    0.609682] pci 0000:14:04.0: PCI bridge to [bus 17-f2]
[    0.609685] pci 0000:14:04.0:   bridge window [mem 0xd7c00000-0xd7cfffff]
[    0.609689] pci 0000:14:04.0:   bridge window [mem 0x21ffd000000-0x21fffafffff 64bit pref]
[    0.609690] pci_bus 0000:17: bus scan returning with max=17
[    0.609692] pci_bus 0000:17: busn_res: [bus 17-f2] end is updated to 17
[    0.609695] pci_bus 0000:14: bus scan returning with max=17
[    0.609696] pci_bus 0000:14: on NUMA node 0
[    0.609829] ACPI: PCI Root Bridge [PC02] (domain 0000 [bus f3-fa])
[    0.609833] acpi PNP0A08:02: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.610830] acpi PNP0A08:02: _OSC: platform does not support [SHPCHotplug AER]
[    0.611082] acpi PNP0A08:02: _OSC: OS now controls [PCIeHotplug PME PCIeCapability LTR]
[    0.611083] acpi PNP0A08:02: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.611179] PCI host bridge to bus 0000:f3
[    0.611181] pci_bus 0000:f3: root bus resource [io  0xb000-0xffff window]
[    0.611183] pci_bus 0000:f3: root bus resource [mem 0xd8000000-0xfb7fffff window]
[    0.611184] pci_bus 0000:f3: root bus resource [mem 0x22000000000-0x22fffffffff window]
[    0.611186] pci_bus 0000:f3: root bus resource [bus f3-fa]
[    0.611190] pci_bus 0000:f3: scanning bus
[    0.611200] pci 0000:f3:00.0: [8086:09a2] type 00 class 0x088000
[    0.611307] pci 0000:f3:00.1: [8086:09a4] type 00 class 0x088000
[    0.611412] pci 0000:f3:00.2: [8086:09a3] type 00 class 0x088000
[    0.611512] pci 0000:f3:00.3: [8086:09a5] type 00 class 0x088000
[    0.611612] pci 0000:f3:00.4: [8086:0998] type 00 class 0x060000
[    0.611703] pci 0000:f3:04.0: [8086:18d1] type 01 class 0x060400
[    0.611760] pci 0000:f3:04.0: PME# supported from D0 D3hot D3cold
[    0.611763] pci 0000:f3:04.0: PME# disabled
[    0.611855] pci_bus 0000:f3: fixups for bus
[    0.611857] pci 0000:f3:04.0: scanning [bus f4-f5] behind bridge, pass 0
[    0.611864] pci 0000:f3:04.0: scanning [bus 00-00] behind bridge, pass 1
[    0.611927] pci_bus 0000:f4: scanning bus
[    0.611943] pci 0000:f4:00.0: [8086:1888] type 00 class 0x020000
[    0.611955] pci 0000:f4:00.0: reg 0x10: [mem 0x22ff0000000-0x22ff7ffffff 64bit pref]
[    0.611965] pci 0000:f4:00.0: reg 0x1c: [mem 0x22ffc030000-0x22ffc03ffff 64bit pref]
[    0.611973] pci 0000:f4:00.0: reg 0x30: [mem 0xfb600000-0xfb6fffff pref]
[    0.612019] pci 0000:f4:00.0: PME# supported from D0 D3hot D3cold
[    0.612022] pci 0000:f4:00.0: PME# disabled
[    0.612037] pci 0000:f4:00.0: reg 0x184: [mem 0x22ffb000000-0x22ffb03ffff 64bit pref]
[    0.612039] pci 0000:f4:00.0: VF(n) BAR0 space: [mem 0x22ffb000000-0x22ffbffffff 64bit pref] (contains BAR0 for 64 VFs)
[    0.612047] pci 0000:f4:00.0: reg 0x190: [mem 0x22ffc340000-0x22ffc343fff 64bit pref]
[    0.612048] pci 0000:f4:00.0: VF(n) BAR3 space: [mem 0x22ffc340000-0x22ffc43ffff 64bit pref] (contains BAR3 for 64 VFs)
[    0.612256] pci 0000:f4:00.1: [8086:1888] type 00 class 0x020000
[    0.612268] pci 0000:f4:00.1: reg 0x10: [mem 0x22fe8000000-0x22fefffffff 64bit pref]
[    0.612278] pci 0000:f4:00.1: reg 0x1c: [mem 0x22ffc020000-0x22ffc02ffff 64bit pref]
[    0.612286] pci 0000:f4:00.1: reg 0x30: [mem 0xfb500000-0xfb5fffff pref]
[    0.612331] pci 0000:f4:00.1: PME# supported from D0 D3hot D3cold
[    0.612334] pci 0000:f4:00.1: PME# disabled
[    0.612347] pci 0000:f4:00.1: reg 0x184: [mem 0x22ffa000000-0x22ffa03ffff 64bit pref]
[    0.612349] pci 0000:f4:00.1: VF(n) BAR0 space: [mem 0x22ffa000000-0x22ffaffffff 64bit pref] (contains BAR0 for 64 VFs)
[    0.612356] pci 0000:f4:00.1: reg 0x190: [mem 0x22ffc240000-0x22ffc243fff 64bit pref]
[    0.612358] pci 0000:f4:00.1: VF(n) BAR3 space: [mem 0x22ffc240000-0x22ffc33ffff 64bit pref] (contains BAR3 for 64 VFs)
[    0.612526] pci 0000:f4:00.2: [8086:1888] type 00 class 0x020000
[    0.612537] pci 0000:f4:00.2: reg 0x10: [mem 0x22fe0000000-0x22fe7ffffff 64bit pref]
[    0.612548] pci 0000:f4:00.2: reg 0x1c: [mem 0x22ffc010000-0x22ffc01ffff 64bit pref]
[    0.612555] pci 0000:f4:00.2: reg 0x30: [mem 0xfb400000-0xfb4fffff pref]
[    0.612601] pci 0000:f4:00.2: PME# supported from D0 D3hot D3cold
[    0.612603] pci 0000:f4:00.2: PME# disabled
[    0.612616] pci 0000:f4:00.2: reg 0x184: [mem 0x22ff9000000-0x22ff903ffff 64bit pref]
[    0.612618] pci 0000:f4:00.2: VF(n) BAR0 space: [mem 0x22ff9000000-0x22ff9ffffff 64bit pref] (contains BAR0 for 64 VFs)
[    0.612625] pci 0000:f4:00.2: reg 0x190: [mem 0x22ffc140000-0x22ffc143fff 64bit pref]
[    0.612626] pci 0000:f4:00.2: VF(n) BAR3 space: [mem 0x22ffc140000-0x22ffc23ffff 64bit pref] (contains BAR3 for 64 VFs)
[    0.612795] pci 0000:f4:00.3: [8086:1888] type 00 class 0x020000
[    0.612806] pci 0000:f4:00.3: reg 0x10: [mem 0x22fd8000000-0x22fdfffffff 64bit pref]
[    0.612817] pci 0000:f4:00.3: reg 0x1c: [mem 0x22ffc000000-0x22ffc00ffff 64bit pref]
[    0.612824] pci 0000:f4:00.3: reg 0x30: [mem 0xfb300000-0xfb3fffff pref]
[    0.612870] pci 0000:f4:00.3: PME# supported from D0 D3hot D3cold
[    0.612872] pci 0000:f4:00.3: PME# disabled
[    0.612885] pci 0000:f4:00.3: reg 0x184: [mem 0x22ff8000000-0x22ff803ffff 64bit pref]
[    0.612886] pci 0000:f4:00.3: VF(n) BAR0 space: [mem 0x22ff8000000-0x22ff8ffffff 64bit pref] (contains BAR0 for 64 VFs)
[    0.612894] pci 0000:f4:00.3: reg 0x190: [mem 0x22ffc040000-0x22ffc043fff 64bit pref]
[    0.612895] pci 0000:f4:00.3: VF(n) BAR3 space: [mem 0x22ffc040000-0x22ffc13ffff 64bit pref] (contains BAR3 for 64 VFs)
[    0.613093] pci_bus 0000:f4: fixups for bus
[    0.613094] pci 0000:f3:04.0: PCI bridge to [bus f4-fa]
[    0.613097] pci 0000:f3:04.0:   bridge window [mem 0xfb300000-0xfb6fffff]
[    0.613101] pci 0000:f3:04.0:   bridge window [mem 0x22fd8000000-0x22ffc4fffff 64bit pref]
[    0.613103] pci_bus 0000:f4: bus scan returning with max=f5
[    0.613105] pci_bus 0000:f4: busn_res: [bus f4-fa] end is updated to f5
[    0.613108] pci_bus 0000:f3: bus scan returning with max=f5
[    0.613109] pci_bus 0000:f3: on NUMA node 0
[    0.613282] ACPI: PCI Root Bridge [UC06] (domain 0000 [bus fe])
[    0.613286] acpi PNP0A08:06: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.613400] acpi PNP0A08:06: _OSC: platform does not support [SHPCHotplug AER LTR]
[    0.613598] acpi PNP0A08:06: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
[    0.613599] acpi PNP0A08:06: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.613680] PCI host bridge to bus 0000:fe
[    0.613681] pci_bus 0000:fe: root bus resource [bus fe]
[    0.613685] pci_bus 0000:fe: scanning bus
[    0.613694] pci 0000:fe:00.0: [8086:3450] type 00 class 0x088000
[    0.613787] pci 0000:fe:00.1: [8086:3451] type 00 class 0x088000
[    0.613858] pci 0000:fe:00.2: [8086:3452] type 00 class 0x088000
[    0.613927] pci 0000:fe:00.3: [8086:0998] type 00 class 0x060000
[    0.613995] pci 0000:fe:00.5: [8086:3455] type 00 class 0x088000
[    0.614068] pci 0000:fe:0b.0: [8086:3448] type 00 class 0x088000
[    0.614149] pci 0000:fe:0b.1: [8086:3448] type 00 class 0x088000
[    0.614207] pci 0000:fe:0b.2: [8086:344b] type 00 class 0x088000
[    0.614272] pci 0000:fe:0c.0: [8086:344a] type 00 class 0x110100
[    0.614408] pci 0000:fe:1a.0: [8086:2880] type 00 class 0x110100
[    0.614524] pci_bus 0000:fe: fixups for bus
[    0.614526] pci_bus 0000:fe: bus scan returning with max=fe
[    0.614527] pci_bus 0000:fe: on NUMA node 0
[    0.614604] ACPI: PCI Root Bridge [UC07] (domain 0000 [bus ff])
[    0.614607] acpi PNP0A08:07: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.614716] acpi PNP0A08:07: _OSC: platform does not support [SHPCHotplug AER LTR]
[    0.614913] acpi PNP0A08:07: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
[    0.614914] acpi PNP0A08:07: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.614993] PCI host bridge to bus 0000:ff
[    0.614994] pci_bus 0000:ff: root bus resource [bus ff]
[    0.614998] pci_bus 0000:ff: scanning bus
[    0.615008] pci 0000:ff:00.0: [8086:344c] type 00 class 0x088000
[    0.615102] pci 0000:ff:00.1: [8086:344c] type 00 class 0x088000
[    0.615207] pci 0000:ff:00.2: [8086:344c] type 00 class 0x088000
[    0.615303] pci 0000:ff:00.3: [8086:344c] type 00 class 0x088000
[    0.615407] pci 0000:ff:00.4: [8086:344c] type 00 class 0x088000
[    0.615503] pci 0000:ff:00.5: [8086:344c] type 00 class 0x088000
[    0.615601] pci 0000:ff:0a.0: [8086:344d] type 00 class 0x088000
[    0.615714] pci 0000:ff:0a.1: [8086:344d] type 00 class 0x088000
[    0.615820] pci 0000:ff:0a.2: [8086:344d] type 00 class 0x088000
[    0.615916] pci 0000:ff:0a.3: [8086:344d] type 00 class 0x088000
[    0.616017] pci 0000:ff:0a.4: [8086:344d] type 00 class 0x088000
[    0.616121] pci 0000:ff:0a.5: [8086:344d] type 00 class 0x088000
[    0.616224] pci 0000:ff:1d.0: [8086:344f] type 00 class 0x088000
[    0.616337] pci 0000:ff:1d.1: [8086:3457] type 00 class 0x088000
[    0.616432] pci 0000:ff:1e.0: [8086:3458] type 00 class 0x088000
[    0.616509] pci 0000:ff:1e.1: [8086:3459] type 00 class 0x088000
[    0.616565] pci 0000:ff:1e.2: [8086:345a] type 00 class 0x088000
[    0.616621] pci 0000:ff:1e.3: [8086:345b] type 00 class 0x088000
[    0.616677] pci 0000:ff:1e.4: [8086:345c] type 00 class 0x088000
[    0.616732] pci 0000:ff:1e.5: [8086:345d] type 00 class 0x088000
[    0.616788] pci 0000:ff:1e.6: [8086:345e] type 00 class 0x088000
[    0.616844] pci 0000:ff:1e.7: [8086:345f] type 00 class 0x088000
[    0.616897] pci_bus 0000:ff: fixups for bus
[    0.616898] pci_bus 0000:ff: bus scan returning with max=ff
[    0.616899] pci_bus 0000:ff: on NUMA node 0
[    0.617254] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    0.617288] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
[    0.617320] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    0.617355] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    0.617387] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.617419] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    0.617451] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    0.617483] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    0.617568] ACPI: EC: interrupt unblocked
[    0.617569] ACPI: EC: event unblocked
[    0.617584] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.617586] ACPI: EC: GPE=0x23
[    0.617587] ACPI: \_SB_.PC00.LPC0.ITEC: Boot DSDT EC initialization complete
[    0.617589] ACPI: \_SB_.PC00.LPC0.ITEC: EC: Used to handle transactions and events
[    0.618114] iommu: Default domain type: Translated 
[    0.618114] iommu: DMA domain TLB invalidation policy: lazy mode 
[    0.618175] SCSI subsystem initialized
[    0.618180] libata version 3.00 loaded.
[    0.618180] ACPI: bus type USB registered
[    0.618180] usbcore: registered new interface driver usbfs
[    0.618180] usbcore: registered new interface driver hub
[    0.618180] usbcore: registered new device driver usb
[    0.618185] pps_core: LinuxPPS API ver. 1 registered
[    0.618186] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.618188] PTP clock support registered
[    0.618206] Registered efivars operations
[    0.618206] Advanced Linux Sound Architecture Driver Initialized.
[    0.618306] Bluetooth: Core ver 2.22
[    0.618310] NET: Registered PF_BLUETOOTH protocol family
[    0.618311] Bluetooth: HCI device and connection manager initialized
[    0.618313] Bluetooth: HCI socket layer initialized
[    0.618315] Bluetooth: L2CAP socket layer initialized
[    0.618318] Bluetooth: SCO socket layer initialized
[    0.618333] PCI: Using ACPI for IRQ routing
[    0.622059] PCI: pci_cache_line_size set to 64 bytes
[    0.622074] pci 0000:00:02.0: BAR 0: reserving [mem 0xb3f82000-0xb3f83fff flags 0x40200] (d=0, p=0)
[    0.622078] pci 0000:00:02.1: BAR 0: reserving [mem 0xb3f00000-0xb3f7ffff flags 0x40200] (d=0, p=0)
[    0.622080] pci 0000:00:02.1: BAR 1: reserving [mem 0xb3e80000-0xb3efffff flags 0x40200] (d=0, p=0)
[    0.622084] pci 0000:00:0b.0: BAR 0: reserving [mem 0x20fffa20000-0x20fffa3ffff flags 0x140204] (d=0, p=0)
[    0.622089] pci 0000:00:0e.0: BAR 0: reserving [mem 0xb3f80000-0xb3f81fff flags 0x40200] (d=0, p=0)
[    0.622091] pci 0000:00:0e.0: BAR 1: reserving [mem 0xb3f88000-0xb3f880ff flags 0x40200] (d=0, p=0)
[    0.622093] pci 0000:00:0e.0: BAR 2: reserving [io  0x5080-0x5087 flags 0x40101] (d=0, p=0)
[    0.622095] pci 0000:00:0e.0: BAR 3: reserving [io  0x5070-0x5073 flags 0x40101] (d=0, p=0)
[    0.622097] pci 0000:00:0e.0: BAR 4: reserving [io  0x5020-0x503f flags 0x40101] (d=0, p=0)
[    0.622098] pci 0000:00:0e.0: BAR 5: reserving [mem 0xb3f87000-0xb3f877ff flags 0x40200] (d=0, p=0)
[    0.622103] pci 0000:00:15.0: BAR 0: reserving [mem 0x20fffa00000-0x20fffa1ffff flags 0x140204] (d=0, p=0)
[    0.622107] pci 0000:02:00.0: BAR 0: reserving [mem 0xb3d00000-0xb3d7ffff flags 0x40200] (d=0, p=0)
[    0.622109] pci 0000:02:00.0: BAR 2: reserving [io  0x4000-0x401f flags 0x40101] (d=0, p=0)
[    0.622111] pci 0000:02:00.0: BAR 3: reserving [mem 0xb3d80000-0xb3d83fff flags 0x40200] (d=0, p=0)
[    0.622114] pci 0000:00:18.0: BAR 0: reserving [mem 0x20fffa98000-0x20fffa98fff flags 0x140204] (d=0, p=0)
[    0.622118] pci 0000:00:18.4: BAR 0: reserving [mem 0x20fffa97000-0x20fffa97fff flags 0x140204] (d=0, p=0)
[    0.622130] pci 0000:00:1e.0: BAR 0: reserving [mem 0x20fffa60000-0x20fffa6ffff flags 0x140204] (d=0, p=0)
[    0.622137] pci 0000:00:1f.5: BAR 0: reserving [mem 0xfe010000-0xfe010fff flags 0x40200] (d=0, p=0)
[    0.622145] pci 0000:14:02.0: BAR 0: reserving [mem 0x21ffff40000-0x21ffff5ffff flags 0x140204] (d=0, p=0)
[    0.622148] pci 0000:15:00.0: BAR 0: reserving [mem 0xd7e00000-0xd7e03fff flags 0x140204] (d=0, p=0)
[    0.622150] pci 0000:14:03.0: BAR 0: reserving [mem 0x21ffff20000-0x21ffff3ffff flags 0x140204] (d=0, p=0)
[    0.622153] pci 0000:16:00.0: BAR 0: reserving [mem 0xd7d00000-0xd7d03fff flags 0x140204] (d=0, p=0)
[    0.622155] pci 0000:14:04.0: BAR 0: reserving [mem 0x21ffff00000-0x21ffff1ffff flags 0x140204] (d=0, p=0)
[    0.622162] pci 0000:17:00.0: BAR 0: reserving [mem 0x21ffe000000-0x21ffeffffff flags 0x14220c] (d=0, p=0)
[    0.622164] pci 0000:17:00.0: BAR 3: reserving [mem 0x21fff808000-0x21fff80ffff flags 0x14220c] (d=0, p=0)
[    0.622166] pci 0000:17:00.0: BAR 7: reserving [mem 0x21fff400000-0x21fff7fffff flags 0x14220c] (d=0, p=0)
[    0.622167] pci 0000:17:00.0: BAR 10: reserving [mem 0x21fff910000-0x21fffa0ffff flags 0x14220c] (d=0, p=0)
[    0.622177] pci 0000:17:00.1: BAR 0: reserving [mem 0x21ffd000000-0x21ffdffffff flags 0x14220c] (d=0, p=0)
[    0.622179] pci 0000:17:00.1: BAR 3: reserving [mem 0x21fff800000-0x21fff807fff flags 0x14220c] (d=0, p=0)
[    0.622181] pci 0000:17:00.1: BAR 7: reserving [mem 0x21fff000000-0x21fff3fffff flags 0x14220c] (d=0, p=0)
[    0.622182] pci 0000:17:00.1: BAR 10: reserving [mem 0x21fff810000-0x21fff90ffff flags 0x14220c] (d=0, p=0)
[    0.622220] pci 0000:00:01.0: BAR 0: reserving [mem 0x20fffa90000-0x20fffa93fff flags 0x140204] (d=1, p=1)
[    0.622222] pci 0000:00:01.1: BAR 0: reserving [mem 0x20fffa8c000-0x20fffa8ffff flags 0x140204] (d=1, p=1)
[    0.622225] pci 0000:00:01.2: BAR 0: reserving [mem 0x20fffa88000-0x20fffa8bfff flags 0x140204] (d=1, p=1)
[    0.622227] pci 0000:00:01.3: BAR 0: reserving [mem 0x20fffa84000-0x20fffa87fff flags 0x140204] (d=1, p=1)
[    0.622229] pci 0000:00:01.4: BAR 0: reserving [mem 0x20fffa80000-0x20fffa83fff flags 0x140204] (d=1, p=1)
[    0.622232] pci 0000:00:01.5: BAR 0: reserving [mem 0x20fffa7c000-0x20fffa7ffff flags 0x140204] (d=1, p=1)
[    0.622234] pci 0000:00:01.6: BAR 0: reserving [mem 0x20fffa78000-0x20fffa7bfff flags 0x140204] (d=1, p=1)
[    0.622236] pci 0000:00:01.7: BAR 0: reserving [mem 0x20fffa74000-0x20fffa77fff flags 0x140204] (d=1, p=1)
[    0.622240] pci 0000:00:02.4: BAR 0: reserving [mem 0x20fff900000-0x20fff9fffff flags 0x140204] (d=1, p=1)
[    0.622241] pci 0000:00:02.4: BAR 2: reserving [mem 0x20fffa70000-0x20fffa73fff flags 0x140204] (d=1, p=1)
[    0.622243] pci 0000:00:02.4: BAR 4: reserving [mem 0x20fffa40000-0x20fffa5ffff flags 0x140204] (d=1, p=1)
[    0.622248] pci 0000:01:00.0: BAR 0: reserving [mem 0xb3b00000-0xb3bfffff flags 0x40200] (d=1, p=1)
[    0.622249] pci 0000:01:00.0: BAR 3: reserving [mem 0xb3c00000-0xb3c03fff flags 0x40200] (d=1, p=1)
[    0.622254] pci 0000:00:0f.0: BAR 0: reserving [mem 0x20fffa99000-0x20fffa993ff flags 0x140204] (d=1, p=1)
[    0.622264] pci 0000:00:1a.0: BAR 0: reserving [io  0x5060-0x5067 flags 0x40101] (d=1, p=1)
[    0.622265] pci 0000:00:1a.0: BAR 1: reserving [mem 0xb3f86000-0xb3f860ff flags 0x40200] (d=1, p=1)
[    0.622269] pci 0000:00:1a.1: BAR 0: reserving [io  0x5050-0x5057 flags 0x40101] (d=1, p=1)
[    0.622270] pci 0000:00:1a.1: BAR 1: reserving [mem 0xb3f85000-0xb3f850ff flags 0x40200] (d=1, p=1)
[    0.622273] pci 0000:00:1a.2: BAR 0: reserving [io  0x5040-0x5047 flags 0x40101] (d=1, p=1)
[    0.622275] pci 0000:00:1a.2: BAR 1: reserving [mem 0xb3f84000-0xb3f840ff flags 0x40200] (d=1, p=1)
[    0.622285] pci 0000:00:1f.4: BAR 0: reserving [mem 0x20fffa96000-0x20fffa960ff flags 0x140204] (d=1, p=1)
[    0.622287] pci 0000:00:1f.4: BAR 4: reserving [io  0x5000-0x501f flags 0x40101] (d=1, p=1)
[    0.622292] pci 0000:00:1f.7: BAR 0: reserving [mem 0x20fff800000-0x20fff8fffff flags 0x140204] (d=1, p=1)
[    0.622293] pci 0000:00:1f.7: BAR 2: reserving [mem 0x20fff000000-0x20fff7fffff flags 0x140204] (d=1, p=1)
[    0.622295] pci 0000:00:1f.7: BAR 4: reserving [mem 0x20fffa94000-0x20fffa95fff flags 0x140204] (d=1, p=1)
[    0.622314] pci 0000:f4:00.0: BAR 0: reserving [mem 0x22ff0000000-0x22ff7ffffff flags 0x14220c] (d=1, p=1)
[    0.622316] pci 0000:f4:00.0: BAR 3: reserving [mem 0x22ffc030000-0x22ffc03ffff flags 0x14220c] (d=1, p=1)
[    0.622317] pci 0000:f4:00.0: BAR 7: reserving [mem 0x22ffb000000-0x22ffbffffff flags 0x14220c] (d=1, p=1)
[    0.622319] pci 0000:f4:00.0: BAR 10: reserving [mem 0x22ffc340000-0x22ffc43ffff flags 0x14220c] (d=1, p=1)
[    0.622321] pci 0000:f4:00.1: BAR 0: reserving [mem 0x22fe8000000-0x22fefffffff flags 0x14220c] (d=1, p=1)
[    0.622323] pci 0000:f4:00.1: BAR 3: reserving [mem 0x22ffc020000-0x22ffc02ffff flags 0x14220c] (d=1, p=1)
[    0.622324] pci 0000:f4:00.1: BAR 7: reserving [mem 0x22ffa000000-0x22ffaffffff flags 0x14220c] (d=1, p=1)
[    0.622326] pci 0000:f4:00.1: BAR 10: reserving [mem 0x22ffc240000-0x22ffc33ffff flags 0x14220c] (d=1, p=1)
[    0.622329] pci 0000:f4:00.2: BAR 0: reserving [mem 0x22fe0000000-0x22fe7ffffff flags 0x14220c] (d=1, p=1)
[    0.622330] pci 0000:f4:00.2: BAR 3: reserving [mem 0x22ffc010000-0x22ffc01ffff flags 0x14220c] (d=1, p=1)
[    0.622332] pci 0000:f4:00.2: BAR 7: reserving [mem 0x22ff9000000-0x22ff9ffffff flags 0x14220c] (d=1, p=1)
[    0.622334] pci 0000:f4:00.2: BAR 10: reserving [mem 0x22ffc140000-0x22ffc23ffff flags 0x14220c] (d=1, p=1)
[    0.622336] pci 0000:f4:00.3: BAR 0: reserving [mem 0x22fd8000000-0x22fdfffffff flags 0x14220c] (d=1, p=1)
[    0.622338] pci 0000:f4:00.3: BAR 3: reserving [mem 0x22ffc000000-0x22ffc00ffff flags 0x14220c] (d=1, p=1)
[    0.622339] pci 0000:f4:00.3: BAR 7: reserving [mem 0x22ff8000000-0x22ff8ffffff flags 0x14220c] (d=1, p=1)
[    0.622341] pci 0000:f4:00.3: BAR 10: reserving [mem 0x22ffc040000-0x22ffc13ffff flags 0x14220c] (d=1, p=1)
[    0.622370] e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]
[    0.622373] e820: reserve RAM buffer [mem 0x5f91f018-0x5fffffff]
[    0.622378] e820: reserve RAM buffer [mem 0x5f940018-0x5fffffff]
[    0.622382] e820: reserve RAM buffer [mem 0x5f961018-0x5fffffff]
[    0.622386] e820: reserve RAM buffer [mem 0x5f982018-0x5fffffff]
[    0.622390] e820: reserve RAM buffer [mem 0x5fac3018-0x5fffffff]
[    0.622393] e820: reserve RAM buffer [mem 0x5faf8018-0x5fffffff]
[    0.622396] e820: reserve RAM buffer [mem 0x61401000-0x63ffffff]
[    0.622400] e820: reserve RAM buffer [mem 0x62a07000-0x63ffffff]
[    0.622403] e820: reserve RAM buffer [mem 0x654a2000-0x67ffffff]
[    0.622406] e820: reserve RAM buffer [mem 0x6f800000-0x6fffffff]
[    0.623119] vgaarb: loaded
[    0.623139] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.623147] hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[    0.625145] clocksource: Switched to clocksource tsc-early
[    0.625248] pnp: PnP ACPI init
[    0.631652] system 00:01: [io  0x0500-0x05fe] has been reserved
[    0.631656] system 00:01: [io  0x0400-0x041f] has been reserved
[    0.631659] system 00:01: [mem 0xff000000-0xffffffff] has been reserved
[    0.631993] system 00:02: [io  0x0a00-0x0a1f] has been reserved
[    0.631995] system 00:02: [io  0x0a20-0x0a2f] has been reserved
[    0.631997] system 00:02: [io  0x0a30-0x0a3f] has been reserved
[    0.631998] system 00:02: [io  0x0a40-0x0a4f] has been reserved
[    0.632000] system 00:02: [io  0x0a50-0x0a5f] has been reserved
[    0.632001] system 00:02: [io  0x0a60-0x0a6f] has been reserved
[    0.632310] pnp 00:03: [dma 0 disabled]
[    0.632636] pnp 00:04: [dma 0 disabled]
[    0.633111] system 00:06: [io  0x0500-0x05fe] has been reserved
[    0.633114] system 00:06: [mem 0xfd000000-0xfd69ffff] has been reserved
[    0.633116] system 00:06: [mem 0xfd6f0000-0xfdffffff] could not be reserved
[    0.633118] system 00:06: [mem 0xfe000000-0xfe01ffff] could not be reserved
[    0.633119] system 00:06: [mem 0xfe200000-0xfe7fffff] has been reserved
[    0.633121] system 00:06: [mem 0xff000000-0xffffffff] has been reserved
[    0.633841] pnp: PnP ACPI: found 8 devices
[    0.639845] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.639907] NET: Registered PF_INET protocol family
[    0.640190] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.643917] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5, 131072 bytes, linear)
[    0.643943] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.643949] TCP established hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.644095] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
[    0.644335] TCP: Hash tables configured (established 131072 bind 65536)
[    0.644373] UDP hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.644414] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.644476] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.644553] RPC: Registered named UNIX socket transport module.
[    0.644555] RPC: Registered udp transport module.
[    0.644556] RPC: Registered tcp transport module.
[    0.644556] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.644562] pci_bus 0000:00: max bus depth: 1 pci_try_num: 2
[    0.644573] pci 0000:00:0b.0: PCI bridge to [bus 01]
[    0.644580] pci 0000:00:0b.0:   bridge window [mem 0xb3b00000-0xb3cfffff]
[    0.644589] pci 0000:00:15.0: PCI bridge to [bus 02]
[    0.644591] pci 0000:00:15.0:   bridge window [io  0x4000-0x4fff]
[    0.644596] pci 0000:00:15.0:   bridge window [mem 0xb3d00000-0xb3dfffff]
[    0.644604] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.644606] pci_bus 0000:00: resource 5 [io  0x1000-0x5fff window]
[    0.644608] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.644610] pci_bus 0000:00: resource 7 [mem 0x000c8000-0x000cffff window]
[    0.644611] pci_bus 0000:00: resource 8 [mem 0xfe010000-0xfe010fff window]
[    0.644612] pci_bus 0000:00: resource 9 [mem 0x90000000-0xb3ffffff window]
[    0.644614] pci_bus 0000:00: resource 10 [mem 0x20000000000-0x20fffffffff window]
[    0.644616] pci_bus 0000:01: resource 1 [mem 0xb3b00000-0xb3cfffff]
[    0.644618] pci_bus 0000:02: resource 0 [io  0x4000-0x4fff]
[    0.644619] pci_bus 0000:02: resource 1 [mem 0xb3d00000-0xb3dfffff]
[    0.644719] pci_bus 0000:14: max bus depth: 1 pci_try_num: 2
[    0.644727] pci 0000:14:02.0: BAR 15: assigned [mem 0x21000000000-0x210001fffff 64bit pref]
[    0.644730] pci 0000:14:03.0: BAR 15: assigned [mem 0x21000200000-0x210003fffff 64bit pref]
[    0.644732] pci 0000:14:02.0: BAR 13: assigned [io  0x6000-0x6fff]
[    0.644734] pci 0000:14:03.0: BAR 13: assigned [io  0x7000-0x7fff]
[    0.644735] pci 0000:14:04.0: BAR 13: assigned [io  0x8000-0x8fff]
[    0.644737] pci 0000:14:02.0: PCI bridge to [bus 15]
[    0.644739] pci 0000:14:02.0:   bridge window [io  0x6000-0x6fff]
[    0.644742] pci 0000:14:02.0:   bridge window [mem 0xd7e00000-0xd7efffff]
[    0.644745] pci 0000:14:02.0:   bridge window [mem 0x21000000000-0x210001fffff 64bit pref]
[    0.644749] pci 0000:14:03.0: PCI bridge to [bus 16]
[    0.644751] pci 0000:14:03.0:   bridge window [io  0x7000-0x7fff]
[    0.644754] pci 0000:14:03.0:   bridge window [mem 0xd7d00000-0xd7dfffff]
[    0.644757] pci 0000:14:03.0:   bridge window [mem 0x21000200000-0x210003fffff 64bit pref]
[    0.644761] pci 0000:14:04.0: PCI bridge to [bus 17]
[    0.644763] pci 0000:14:04.0:   bridge window [io  0x8000-0x8fff]
[    0.644766] pci 0000:14:04.0:   bridge window [mem 0xd7c00000-0xd7cfffff]
[    0.644769] pci 0000:14:04.0:   bridge window [mem 0x21ffd000000-0x21fffafffff 64bit pref]
[    0.644773] pci_bus 0000:14: resource 4 [io  0x6000-0xafff window]
[    0.644774] pci_bus 0000:14: resource 5 [mem 0xb4000000-0xd7ffffff window]
[    0.644776] pci_bus 0000:14: resource 6 [mem 0x21000000000-0x21fffffffff window]
[    0.644777] pci_bus 0000:15: resource 0 [io  0x6000-0x6fff]
[    0.644779] pci_bus 0000:15: resource 1 [mem 0xd7e00000-0xd7efffff]
[    0.644780] pci_bus 0000:15: resource 2 [mem 0x21000000000-0x210001fffff 64bit pref]
[    0.644781] pci_bus 0000:16: resource 0 [io  0x7000-0x7fff]
[    0.644783] pci_bus 0000:16: resource 1 [mem 0xd7d00000-0xd7dfffff]
[    0.644784] pci_bus 0000:16: resource 2 [mem 0x21000200000-0x210003fffff 64bit pref]
[    0.644786] pci_bus 0000:17: resource 0 [io  0x8000-0x8fff]
[    0.644787] pci_bus 0000:17: resource 1 [mem 0xd7c00000-0xd7cfffff]
[    0.644788] pci_bus 0000:17: resource 2 [mem 0x21ffd000000-0x21fffafffff 64bit pref]
[    0.644818] pci_bus 0000:f3: max bus depth: 1 pci_try_num: 2
[    0.644821] pci 0000:f3:04.0: PCI bridge to [bus f4-f5]
[    0.644825] pci 0000:f3:04.0:   bridge window [mem 0xfb300000-0xfb6fffff]
[    0.644828] pci 0000:f3:04.0:   bridge window [mem 0x22fd8000000-0x22ffc4fffff 64bit pref]
[    0.644832] pci_bus 0000:f3: resource 4 [io  0xb000-0xffff window]
[    0.644833] pci_bus 0000:f3: resource 5 [mem 0xd8000000-0xfb7fffff window]
[    0.644835] pci_bus 0000:f3: resource 6 [mem 0x22000000000-0x22fffffffff window]
[    0.644836] pci_bus 0000:f4: resource 1 [mem 0xfb300000-0xfb6fffff]
[    0.644838] pci_bus 0000:f4: resource 2 [mem 0x22fd8000000-0x22ffc4fffff 64bit pref]
[    0.644847] pci_bus 0000:fe: max bus depth: 0 pci_try_num: 1
[    0.644854] pci_bus 0000:ff: max bus depth: 0 pci_try_num: 1
[    0.645171] pci 0000:15:00.0: CLS mismatch (64 != 32), using 64 bytes
[    0.645240] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.645241] software IO TLB: mapped [mem 0x000000005b91f000-0x000000005f91f000] (64MB)
[    0.645330] RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 655360 ms ovfl timer
[    0.645416] RAPL PMU: hw unit of domain package 2^-14 Joules
[    0.645444] icx_uncore 0000:fe:0c.0: vgaarb: pci_notify
[    0.645448] icx_uncore 0000:fe:0c.0: runtime IRQ mapping not provided by arch
[    0.645457] icx_uncore 0000:fe:0c.0: vgaarb: pci_notify
[    0.645837] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x39a85c9bff6, max_idle_ns: 881590591483 ns
[    0.645853] clocksource: Switched to clocksource tsc
[    0.647228] Initialise system trusted keyrings
[    0.647256] workingset: timestamp_bits=46 max_order=22 bucket_order=0
[    0.648946] NFS: Registering the id_resolver key type
[    0.648952] Key type id_resolver registered
[    0.648953] Key type id_legacy registered
[    0.649267] Key type cifs.spnego registered
[    0.649271] Key type cifs.idmap registered
[    0.649296] fuse: init (API version 7.37)
[    0.649343] SGI XFS with security attributes, no debug enabled
[    0.663709] xor: automatically using best checksumming function   avx 
[    0.663714] Key type asymmetric registered
[    0.663716] Asymmetric key parser 'x509' registered
[    0.663729] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 248)
[    0.663759] io scheduler mq-deadline registered
[    0.663762] io scheduler kyber registered
[    0.663894] pciehp: pcie_port_service_register = 0
[    0.663902] pcieport 0000:00:0b.0: vgaarb: pci_notify
[    0.663906] pcieport 0000:00:0b.0: runtime IRQ mapping not provided by arch
[    0.664088] pcieport 0000:00:0b.0: PME: Signaling with IRQ 27
[    0.664113] pcieport 0000:00:0b.0: saving config space at offset 0x0 (reading 0x18a68086)
[    0.664116] pcieport 0000:00:0b.0: saving config space at offset 0x4 (reading 0x100547)
[    0.664119] pcieport 0000:00:0b.0: saving config space at offset 0x8 (reading 0x6040011)
[    0.664121] pcieport 0000:00:0b.0: saving config space at offset 0xc (reading 0x10010)
[    0.664124] pcieport 0000:00:0b.0: saving config space at offset 0x10 (reading 0xffa20004)
[    0.664126] pcieport 0000:00:0b.0: saving config space at offset 0x14 (reading 0x20f)
[    0.664128] pcieport 0000:00:0b.0: saving config space at offset 0x18 (reading 0x10100)
[    0.664131] pcieport 0000:00:0b.0: saving config space at offset 0x1c (reading 0xf0)
[    0.664133] pcieport 0000:00:0b.0: saving config space at offset 0x20 (reading 0xb3c0b3b0)
[    0.664135] pcieport 0000:00:0b.0: saving config space at offset 0x24 (reading 0x1fff1)
[    0.664137] pcieport 0000:00:0b.0: saving config space at offset 0x28 (reading 0x0)
[    0.664140] pcieport 0000:00:0b.0: saving config space at offset 0x2c (reading 0x0)
[    0.664142] pcieport 0000:00:0b.0: saving config space at offset 0x30 (reading 0x0)
[    0.664144] pcieport 0000:00:0b.0: saving config space at offset 0x34 (reading 0x40)
[    0.664146] pcieport 0000:00:0b.0: saving config space at offset 0x38 (reading 0x0)
[    0.664148] pcieport 0000:00:0b.0: saving config space at offset 0x3c (reading 0x1301ff)
[    0.664198] pcieport 0000:00:0b.0: vgaarb: pci_notify
[    0.664204] pcieport 0000:00:15.0: vgaarb: pci_notify
[    0.664207] pcieport 0000:00:15.0: runtime IRQ mapping not provided by arch
[    0.664341] pcieport 0000:00:15.0: PME: Signaling with IRQ 28
[    0.664359] pcieport 0000:00:15.0: saving config space at offset 0x0 (reading 0x18ae8086)
[    0.664361] pcieport 0000:00:15.0: saving config space at offset 0x4 (reading 0x100547)
[    0.664363] pcieport 0000:00:15.0: saving config space at offset 0x8 (reading 0x6040011)
[    0.664366] pcieport 0000:00:15.0: saving config space at offset 0xc (reading 0x10010)
[    0.664368] pcieport 0000:00:15.0: saving config space at offset 0x10 (reading 0xffa00004)
[    0.664370] pcieport 0000:00:15.0: saving config space at offset 0x14 (reading 0x20f)
[    0.664372] pcieport 0000:00:15.0: saving config space at offset 0x18 (reading 0x20200)
[    0.664374] pcieport 0000:00:15.0: saving config space at offset 0x1c (reading 0x4040)
[    0.664376] pcieport 0000:00:15.0: saving config space at offset 0x20 (reading 0xb3d0b3d0)
[    0.664379] pcieport 0000:00:15.0: saving config space at offset 0x24 (reading 0x1fff1)
[    0.664381] pcieport 0000:00:15.0: saving config space at offset 0x28 (reading 0x0)
[    0.664383] pcieport 0000:00:15.0: saving config space at offset 0x2c (reading 0x0)
[    0.664385] pcieport 0000:00:15.0: saving config space at offset 0x30 (reading 0x0)
[    0.664387] pcieport 0000:00:15.0: saving config space at offset 0x34 (reading 0x40)
[    0.664389] pcieport 0000:00:15.0: saving config space at offset 0x38 (reading 0x0)
[    0.664392] pcieport 0000:00:15.0: saving config space at offset 0x3c (reading 0x1301ff)
[    0.664434] pcieport 0000:00:15.0: vgaarb: pci_notify
[    0.664441] pcieport 0000:14:02.0: vgaarb: pci_notify
[    0.664443] pcieport 0000:14:02.0: runtime IRQ mapping not provided by arch
[    0.664538] pcieport 0000:14:02.0: PME: Signaling with IRQ 29
[    0.664560] pcieport 0000:14:02.0: pciehp: Slot Capabilities      : 0x003025ff
[    0.664563] pcieport 0000:14:02.0: pciehp: Slot Status            : 0x0040
[    0.664564] pcieport 0000:14:02.0: pciehp: Slot Control           : 0x03c0
[    0.664567] pcieport 0000:14:02.0: pciehp: Slot #6 AttnBtn+ PwrCtrl+ MRL+ AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock- NoCompl- IbPresDis- LLActRep+ (with Cmd Compl erratum)
[    0.664571] pcieport 0000:14:02.0: pciehp: pciehp_get_power_status: SLOTCTRL 58 value read 3c0
[    0.664600] pcieport 0000:14:02.0: pciehp: pcie_enable_notification: SLOTCTRL 58 write cmd 1031
[    0.664611] pci_hotplug: pci_hp_add: Added slot 6 to the list
[    0.664627] pcieport 0000:14:02.0: saving config space at offset 0x0 (reading 0x347a8086)
[    0.664629] pcieport 0000:14:02.0: saving config space at offset 0x4 (reading 0x100547)
[    0.664631] pcieport 0000:14:02.0: saving config space at offset 0x8 (reading 0x6040006)
[    0.664632] pcieport 0000:14:02.0: saving config space at offset 0xc (reading 0x10010)
[    0.664634] pcieport 0000:14:02.0: saving config space at offset 0x10 (reading 0xfff40004)
[    0.664636] pcieport 0000:14:02.0: saving config space at offset 0x14 (reading 0x21f)
[    0.664637] pcieport 0000:14:02.0: saving config space at offset 0x18 (reading 0x151514)
[    0.664639] pcieport 0000:14:02.0: saving config space at offset 0x1c (reading 0x20006060)
[    0.664641] pcieport 0000:14:02.0: saving config space at offset 0x20 (reading 0xd7e0d7e0)
[    0.664642] pcieport 0000:14:02.0: saving config space at offset 0x24 (reading 0x110001)
[    0.664644] pcieport 0000:14:02.0: saving config space at offset 0x28 (reading 0x210)
[    0.664646] pcieport 0000:14:02.0: saving config space at offset 0x2c (reading 0x210)
[    0.664647] pcieport 0000:14:02.0: saving config space at offset 0x30 (reading 0x0)
[    0.664649] pcieport 0000:14:02.0: saving config space at offset 0x34 (reading 0x40)
[    0.664651] pcieport 0000:14:02.0: saving config space at offset 0x38 (reading 0x0)
[    0.664652] pcieport 0000:14:02.0: saving config space at offset 0x3c (reading 0x1301ff)
[    0.664678] pcieport 0000:14:02.0: vgaarb: pci_notify
[    0.664683] pcieport 0000:14:03.0: vgaarb: pci_notify
[    0.664686] pcieport 0000:14:03.0: runtime IRQ mapping not provided by arch
[    0.664778] pcieport 0000:14:03.0: PME: Signaling with IRQ 30
[    0.664800] pcieport 0000:14:03.0: pciehp: Slot Capabilities      : 0x029025e0
[    0.664802] pcieport 0000:14:03.0: pciehp: Slot Status            : 0x0040
[    0.664803] pcieport 0000:14:03.0: pciehp: Slot Control           : 0x03c0
[    0.664806] pcieport 0000:14:03.0: pciehp: Slot #82 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- IbPresDis- LLActRep+ (with Cmd Compl erratum)
[    0.664831] pcieport 0000:14:03.0: pciehp: pcie_enable_notification: SLOTCTRL 58 write cmd 1038
[    0.664836] pci_hotplug: pci_hp_add: Added slot 82 to the list
[    0.664849] pcieport 0000:14:03.0: saving config space at offset 0x0 (reading 0x347b8086)
[    0.664851] pcieport 0000:14:03.0: saving config space at offset 0x4 (reading 0x100547)
[    0.664853] pcieport 0000:14:03.0: saving config space at offset 0x8 (reading 0x6040006)
[    0.664855] pcieport 0000:14:03.0: saving config space at offset 0xc (reading 0x10010)
[    0.664856] pcieport 0000:14:03.0: saving config space at offset 0x10 (reading 0xfff20004)
[    0.664858] pcieport 0000:14:03.0: saving config space at offset 0x14 (reading 0x21f)
[    0.664860] pcieport 0000:14:03.0: saving config space at offset 0x18 (reading 0x161614)
[    0.664861] pcieport 0000:14:03.0: saving config space at offset 0x1c (reading 0x20007070)
[    0.664863] pcieport 0000:14:03.0: saving config space at offset 0x20 (reading 0xd7d0d7d0)
[    0.664865] pcieport 0000:14:03.0: saving config space at offset 0x24 (reading 0x310021)
[    0.664866] pcieport 0000:14:03.0: saving config space at offset 0x28 (reading 0x210)
[    0.664868] pcieport 0000:14:03.0: saving config space at offset 0x2c (reading 0x210)
[    0.664869] pcieport 0000:14:03.0: saving config space at offset 0x30 (reading 0x0)
[    0.664871] pcieport 0000:14:03.0: saving config space at offset 0x34 (reading 0x40)
[    0.664873] pcieport 0000:14:03.0: saving config space at offset 0x38 (reading 0x0)
[    0.664874] pcieport 0000:14:03.0: saving config space at offset 0x3c (reading 0x1301ff)
[    0.664898] pcieport 0000:14:03.0: vgaarb: pci_notify
[    0.664903] pcieport 0000:14:04.0: vgaarb: pci_notify
[    0.664905] pcieport 0000:14:04.0: runtime IRQ mapping not provided by arch
[    0.664987] pcieport 0000:14:04.0: PME: Signaling with IRQ 31
[    0.665001] pcieport 0000:14:04.0: pciehp: Slot Capabilities      : 0x029825e0
[    0.665003] pcieport 0000:14:04.0: pciehp: Slot Status            : 0x0040
[    0.665005] pcieport 0000:14:04.0: pciehp: Slot Control           : 0x03c0
[    0.665007] pcieport 0000:14:04.0: pciehp: Slot #83 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- IbPresDis- LLActRep+ (with Cmd Compl erratum)
[    0.665031] pcieport 0000:14:04.0: pciehp: pcie_enable_notification: SLOTCTRL 58 write cmd 1038
[    0.665035] pci_hotplug: pci_hp_add: Added slot 83 to the list
[    0.665048] pcieport 0000:14:04.0: saving config space at offset 0x0 (reading 0x347c8086)
[    0.665050] pcieport 0000:14:04.0: saving config space at offset 0x4 (reading 0x100547)
[    0.665052] pcieport 0000:14:04.0: saving config space at offset 0x8 (reading 0x6040006)
[    0.665054] pcieport 0000:14:04.0: saving config space at offset 0xc (reading 0x10010)
[    0.665055] pcieport 0000:14:04.0: saving config space at offset 0x10 (reading 0xfff00004)
[    0.665057] pcieport 0000:14:04.0: saving config space at offset 0x14 (reading 0x21f)
[    0.665059] pcieport 0000:14:04.0: saving config space at offset 0x18 (reading 0x171714)
[    0.665060] pcieport 0000:14:04.0: saving config space at offset 0x1c (reading 0x20008080)
[    0.665062] pcieport 0000:14:04.0: saving config space at offset 0x20 (reading 0xd7c0d7c0)
[    0.665064] pcieport 0000:14:04.0: saving config space at offset 0x24 (reading 0xffa1fd01)
[    0.665065] pcieport 0000:14:04.0: saving config space at offset 0x28 (reading 0x21f)
[    0.665067] pcieport 0000:14:04.0: saving config space at offset 0x2c (reading 0x21f)
[    0.665068] pcieport 0000:14:04.0: saving config space at offset 0x30 (reading 0x0)
[    0.665070] pcieport 0000:14:04.0: saving config space at offset 0x34 (reading 0x40)
[    0.665072] pcieport 0000:14:04.0: saving config space at offset 0x38 (reading 0x0)
[    0.665073] pcieport 0000:14:04.0: saving config space at offset 0x3c (reading 0x1301ff)
[    0.665097] pcieport 0000:14:04.0: vgaarb: pci_notify
[    0.665106] pcieport 0000:f3:04.0: vgaarb: pci_notify
[    0.665109] pcieport 0000:f3:04.0: runtime IRQ mapping not provided by arch
[    0.665199] pcieport 0000:f3:04.0: PME: Signaling with IRQ 32
[    0.665206] pcieport 0000:f3:04.0: saving config space at offset 0x0 (reading 0x18d18086)
[    0.665207] pcieport 0000:f3:04.0: saving config space at offset 0x4 (reading 0x100547)
[    0.665209] pcieport 0000:f3:04.0: saving config space at offset 0x8 (reading 0x6040000)
[    0.665211] pcieport 0000:f3:04.0: saving config space at offset 0xc (reading 0x10010)
[    0.665213] pcieport 0000:f3:04.0: saving config space at offset 0x10 (reading 0x0)
[    0.665214] pcieport 0000:f3:04.0: saving config space at offset 0x14 (reading 0x0)
[    0.665216] pcieport 0000:f3:04.0: saving config space at offset 0x18 (reading 0xf5f4f3)
[    0.665218] pcieport 0000:f3:04.0: saving config space at offset 0x1c (reading 0x200000f0)
[    0.665220] pcieport 0000:f3:04.0: saving config space at offset 0x20 (reading 0xfb60fb30)
[    0.665221] pcieport 0000:f3:04.0: saving config space at offset 0x24 (reading 0xfc41d801)
[    0.665223] pcieport 0000:f3:04.0: saving config space at offset 0x28 (reading 0x22f)
[    0.665225] pcieport 0000:f3:04.0: saving config space at offset 0x2c (reading 0x22f)
[    0.665227] pcieport 0000:f3:04.0: saving config space at offset 0x30 (reading 0x0)
[    0.665228] pcieport 0000:f3:04.0: saving config space at offset 0x34 (reading 0x40)
[    0.665230] pcieport 0000:f3:04.0: saving config space at offset 0x38 (reading 0x0)
[    0.665232] pcieport 0000:f3:04.0: saving config space at offset 0x3c (reading 0x1301ff)
[    0.665248] pcieport 0000:f3:04.0: vgaarb: pci_notify
[    0.665359] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.665421] switchtec: loaded.
[    0.665514] Monitor-Mwait will be used to enter C-1 state
[    0.665522] Monitor-Mwait will be used to enter C-2 state
[    0.665527] ACPI: \_SB_.SCK0.C000: Found 2 idle states
[    0.665980] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input0
[    0.666144] ACPI: button: Sleep Button [SLPB]
[    0.666181] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
[    0.667131] ACPI: button: Power Button [PWRF]
[    0.672352] thermal LNXTHERM:00: registered as thermal_zone0
[    0.672354] ACPI: thermal: Thermal Zone [TZ10] (50 C)
[    0.672532] ERST: Error Record Serialization Table (ERST) support is initialized.
[    0.672534] pstore: Registered erst as persistent store backend
[    0.672536] EINJ: EINJ table not found.
[    0.672597] ioatdma: Intel(R) QuickData Technology Driver 5.00
[    0.672607] ioatdma 0000:00:01.0: vgaarb: pci_notify
[    0.672611] ioatdma 0000:00:01.0: runtime IRQ mapping not provided by arch
[    0.672615] ioatdma 0000:00:01.0: enabling device (0144 -> 0146)
[    0.681812] ioatdma 0000:00:01.0: vgaarb: pci_notify
[    0.681826] ioatdma 0000:00:01.1: vgaarb: pci_notify
[    0.681829] ioatdma 0000:00:01.1: runtime IRQ mapping not provided by arch
[    0.681834] ioatdma 0000:00:01.1: enabling device (0144 -> 0146)
[    0.690507] ioatdma 0000:00:01.1: vgaarb: pci_notify
[    0.690520] ioatdma 0000:00:01.2: vgaarb: pci_notify
[    0.690523] ioatdma 0000:00:01.2: runtime IRQ mapping not provided by arch
[    0.690528] ioatdma 0000:00:01.2: enabling device (0144 -> 0146)
[    0.699233] ioatdma 0000:00:01.2: vgaarb: pci_notify
[    0.699245] ioatdma 0000:00:01.3: vgaarb: pci_notify
[    0.699249] ioatdma 0000:00:01.3: runtime IRQ mapping not provided by arch
[    0.699253] ioatdma 0000:00:01.3: enabling device (0144 -> 0146)
[    0.708008] ioatdma 0000:00:01.3: vgaarb: pci_notify
[    0.708021] ioatdma 0000:00:01.4: vgaarb: pci_notify
[    0.708024] ioatdma 0000:00:01.4: runtime IRQ mapping not provided by arch
[    0.708028] ioatdma 0000:00:01.4: enabling device (0144 -> 0146)
[    0.716739] ioatdma 0000:00:01.4: vgaarb: pci_notify
[    0.716751] ioatdma 0000:00:01.5: vgaarb: pci_notify
[    0.716755] ioatdma 0000:00:01.5: runtime IRQ mapping not provided by arch
[    0.716759] ioatdma 0000:00:01.5: enabling device (0144 -> 0146)
[    0.725572] ioatdma 0000:00:01.5: vgaarb: pci_notify
[    0.725585] ioatdma 0000:00:01.6: vgaarb: pci_notify
[    0.725588] ioatdma 0000:00:01.6: runtime IRQ mapping not provided by arch
[    0.725592] ioatdma 0000:00:01.6: enabling device (0144 -> 0146)
[    0.734257] ioatdma 0000:00:01.6: vgaarb: pci_notify
[    0.734269] ioatdma 0000:00:01.7: vgaarb: pci_notify
[    0.734272] ioatdma 0000:00:01.7: runtime IRQ mapping not provided by arch
[    0.734277] ioatdma 0000:00:01.7: enabling device (0144 -> 0146)
[    0.743050] ioatdma 0000:00:01.7: vgaarb: pci_notify
[    0.743142] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.743229] 00:03: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    0.743338] 00:04: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16550A
[    0.743524] serial 0000:00:1a.0: vgaarb: pci_notify
[    0.743527] serial 0000:00:1a.0: runtime IRQ mapping not provided by arch
[    0.743531] serial 0000:00:1a.0: vgaarb: pci_notify
[    0.743535] serial 0000:00:1a.1: vgaarb: pci_notify
[    0.743537] serial 0000:00:1a.1: runtime IRQ mapping not provided by arch
[    0.743540] serial 0000:00:1a.1: vgaarb: pci_notify
[    0.743543] serial 0000:00:1a.2: vgaarb: pci_notify
[    0.743545] serial 0000:00:1a.2: runtime IRQ mapping not provided by arch
[    0.743548] serial 0000:00:1a.2: vgaarb: pci_notify
[    0.743637] 8250_mid 0000:00:1a.0: vgaarb: pci_notify
[    0.743639] 8250_mid 0000:00:1a.0: runtime IRQ mapping not provided by arch
[    0.743645] 8250_mid 0000:00:1a.0: enabling device (0140 -> 0143)
[    0.743773] 8250_mid 0000:00:1a.0: enabling bus mastering
[    0.743841] 8250_mid 0000:00:1a.0: Found HSU DMA, 2 channels
[    0.743893] 0000:00:1a.0: ttyS2 at MMIO 0xb3f86000 (irq = 41, base_baud = 115200) is a TI16750
[    0.743928] 8250_mid 0000:00:1a.0: vgaarb: pci_notify
[    0.743933] 8250_mid 0000:00:1a.1: vgaarb: pci_notify
[    0.743935] 8250_mid 0000:00:1a.1: runtime IRQ mapping not provided by arch
[    0.743940] 8250_mid 0000:00:1a.1: enabling device (0140 -> 0143)
[    0.744024] 8250_mid 0000:00:1a.1: enabling bus mastering
[    0.744080] 8250_mid 0000:00:1a.1: Found HSU DMA, 2 channels
[    0.744126] 0000:00:1a.1: ttyS3 at MMIO 0xb3f85000 (irq = 42, base_baud = 115200) is a TI16750
[    0.744158] 8250_mid 0000:00:1a.1: vgaarb: pci_notify
[    0.744162] 8250_mid 0000:00:1a.2: vgaarb: pci_notify
[    0.744165] 8250_mid 0000:00:1a.2: runtime IRQ mapping not provided by arch
[    0.744169] 8250_mid 0000:00:1a.2: enabling device (0140 -> 0143)
[    0.744246] 8250_mid 0000:00:1a.2: enabling bus mastering
[    0.744306] 8250_mid 0000:00:1a.2: Found HSU DMA, 2 channels
[    0.744337] 8250_mid: probe of 0000:00:1a.2 failed with error -28
[    0.744340] 8250_mid 0000:00:1a.2: vgaarb: pci_notify
[    0.744777] Linux agpgart interface v0.103
[    0.749295] tpm_tis MSFT0101:00: 2.0 TPM (device-id 0x1B, rev-id 22)
[    0.770460] i2c-core: driver [tpm_i2c_atmel] registered
[    0.770465] i2c-core: driver [tpm_i2c_infineon] registered
[    0.770468] i2c-core: driver [tpm_i2c_nuvoton] registered
[    0.770512] i2c-core: driver [st33zp24-i2c] registered
[    0.770608] ACPI: bus type drm_connector registered
[    0.772303] brd: module loaded
[    0.773376] loop: module loaded
[    0.773512] i2c-core: driver [crystal_cove_i2c] registered
[    0.773641] nvme 0000:15:00.0: vgaarb: pci_notify
[    0.773645] nvme 0000:15:00.0: runtime IRQ mapping not provided by arch
[    0.773695] nvme nvme0: pci function 0000:15:00.0
[    0.773702] nvme 0000:15:00.0: vgaarb: pci_notify
[    0.773709] nvme 0000:16:00.0: vgaarb: pci_notify
[    0.773712] nvme 0000:16:00.0: runtime IRQ mapping not provided by arch
[    0.773748] nvme nvme1: pci function 0000:16:00.0
[    0.773752] nvme 0000:16:00.0: vgaarb: pci_notify
[    0.773813] nvme 0000:15:00.0: saving config space at offset 0x0 (reading 0x50121987)
[    0.773820] nvme 0000:15:00.0: saving config space at offset 0x4 (reading 0x100546)
[    0.773824] nvme 0000:15:00.0: saving config space at offset 0x8 (reading 0x1080201)
[    0.773827] nvme 0000:15:00.0: saving config space at offset 0xc (reading 0x8)
[    0.773829] nvme 0000:15:00.0: saving config space at offset 0x10 (reading 0xd7e00004)
[    0.773833] nvme 0000:15:00.0: saving config space at offset 0x14 (reading 0x0)
[    0.773836] nvme 0000:15:00.0: saving config space at offset 0x18 (reading 0x0)
[    0.773839] nvme 0000:15:00.0: saving config space at offset 0x1c (reading 0x0)
[    0.773842] nvme 0000:15:00.0: saving config space at offset 0x20 (reading 0x0)
[    0.773845] nvme 0000:15:00.0: saving config space at offset 0x24 (reading 0x0)
[    0.773848] nvme 0000:15:00.0: saving config space at offset 0x28 (reading 0x0)
[    0.773852] nvme 0000:15:00.0: saving config space at offset 0x2c (reading 0x50121987)
[    0.773855] nvme 0000:15:00.0: saving config space at offset 0x30 (reading 0x0)
[    0.773858] nvme 0000:15:00.0: saving config space at offset 0x34 (reading 0x80)
[    0.773861] nvme 0000:15:00.0: saving config space at offset 0x38 (reading 0x0)
[    0.773864] nvme 0000:15:00.0: saving config space at offset 0x3c (reading 0x1ff)
[    0.773867] ahci 0000:00:0e.0: vgaarb: pci_notify
[    0.773872] ahci 0000:00:0e.0: runtime IRQ mapping not provided by arch
[    0.773875] ahci 0000:00:0e.0: version 3.0
[    0.773917] nvme 0000:16:00.0: saving config space at offset 0x0 (reading 0x50121987)
[    0.773920] nvme 0000:16:00.0: saving config space at offset 0x4 (reading 0x100546)
[    0.773922] nvme 0000:16:00.0: saving config space at offset 0x8 (reading 0x1080201)
[    0.773924] nvme 0000:16:00.0: saving config space at offset 0xc (reading 0x8)
[    0.773926] nvme 0000:16:00.0: saving config space at offset 0x10 (reading 0xd7d00004)
[    0.773928] nvme 0000:16:00.0: saving config space at offset 0x14 (reading 0x0)
[    0.773930] nvme 0000:16:00.0: saving config space at offset 0x18 (reading 0x0)
[    0.773933] nvme 0000:16:00.0: saving config space at offset 0x1c (reading 0x0)
[    0.773935] nvme 0000:16:00.0: saving config space at offset 0x20 (reading 0x0)
[    0.773937] nvme 0000:16:00.0: saving config space at offset 0x24 (reading 0x0)
[    0.773939] nvme 0000:16:00.0: saving config space at offset 0x28 (reading 0x0)
[    0.773940] nvme 0000:16:00.0: saving config space at offset 0x2c (reading 0x50121987)
[    0.773943] nvme 0000:16:00.0: saving config space at offset 0x30 (reading 0x0)
[    0.773944] nvme 0000:16:00.0: saving config space at offset 0x34 (reading 0x80)
[    0.773946] nvme 0000:16:00.0: saving config space at offset 0x38 (reading 0x0)
[    0.773948] nvme 0000:16:00.0: saving config space at offset 0x3c (reading 0x1ff)
[    0.774076] ahci 0000:00:0e.0: AHCI 0001.0301 32 slots 2 ports 6 Gbps 0xa impl SATA mode
[    0.774080] ahci 0000:00:0e.0: flags: 64bit ncq sntf pm clo only pio slum part ems deso sadm sds apst 
[    0.777385] scsi host0: ahci
[    0.777483] scsi host1: ahci
[    0.777556] scsi host2: ahci
[    0.777625] scsi host3: ahci
[    0.777655] ata1: DUMMY
[    0.777657] ata2: SATA max UDMA/133 abar m2048@0xb3f87000 port 0xb3f87180 irq 45
[    0.777659] ata3: DUMMY
[    0.777661] ata4: SATA max UDMA/133 abar m2048@0xb3f87000 port 0xb3f87280 irq 45
[    0.777670] ahci 0000:00:0e.0: vgaarb: pci_notify
[    0.777864] igb: Intel(R) Gigabit Ethernet Network Driver
[    0.777865] igb: Copyright (c) 2007-2014 Intel Corporation.
[    0.777875] igb 0000:02:00.0: vgaarb: pci_notify
[    0.777878] igb 0000:02:00.0: runtime IRQ mapping not provided by arch
[    0.777928] igb 0000:02:00.0: saving config space at offset 0x0 (reading 0x15338086)
[    0.777932] igb 0000:02:00.0: saving config space at offset 0x4 (reading 0x100147)
[    0.777935] igb 0000:02:00.0: saving config space at offset 0x8 (reading 0x2000003)
[    0.777939] igb 0000:02:00.0: saving config space at offset 0xc (reading 0x10)
[    0.777942] igb 0000:02:00.0: saving config space at offset 0x10 (reading 0xb3d00000)
[    0.777945] igb 0000:02:00.0: saving config space at offset 0x14 (reading 0x0)
[    0.777948] igb 0000:02:00.0: saving config space at offset 0x18 (reading 0x4001)
[    0.777952] igb 0000:02:00.0: saving config space at offset 0x1c (reading 0xb3d80000)
[    0.777955] igb 0000:02:00.0: saving config space at offset 0x20 (reading 0x0)
[    0.777958] igb 0000:02:00.0: saving config space at offset 0x24 (reading 0x0)
[    0.777961] igb 0000:02:00.0: saving config space at offset 0x28 (reading 0x0)
[    0.777964] igb 0000:02:00.0: saving config space at offset 0x2c (reading 0xffff)
[    0.777967] igb 0000:02:00.0: saving config space at offset 0x30 (reading 0x0)
[    0.777970] igb 0000:02:00.0: saving config space at offset 0x34 (reading 0x40)
[    0.777973] igb 0000:02:00.0: saving config space at offset 0x38 (reading 0x0)
[    0.777976] igb 0000:02:00.0: saving config space at offset 0x3c (reading 0x1ff)
[    0.777999] nvme nvme0: missing or invalid SUBNQN field.
[    0.778029] nvme nvme0: Shutdown timeout set to 10 seconds
[    0.778070] nvme nvme1: missing or invalid SUBNQN field.
[    0.778084] nvme nvme1: Shutdown timeout set to 10 seconds
[    0.779221] nvme nvme0: 8/0/0 default/read/poll queues
[    0.779325] nvme nvme1: 8/0/0 default/read/poll queues
[    0.779595] nvme nvme0: Ignoring bogus Namespace Identifiers
[    0.779697] nvme nvme1: Ignoring bogus Namespace Identifiers
[    0.806665] pps pps0: new PPS source ptp0
[    0.806696] igb 0000:02:00.0: added PHC on eth0
[    0.806697] igb 0000:02:00.0: Intel(R) Gigabit Ethernet Network Connection
[    0.806698] igb 0000:02:00.0: eth0: (PCIe:2.5Gb/s:Width x1) 00:30:64:3d:a6:6c
[    0.806746] igb 0000:02:00.0: eth0: PBA No: 000300-000
[    0.806747] igb 0000:02:00.0: Using MSI-X interrupts. 4 rx queue(s), 4 tx queue(s)
[    0.806762] igb 0000:02:00.0: vgaarb: pci_notify
[    0.806783] igbvf: Intel(R) Gigabit Virtual Function Network Driver
[    0.806784] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    0.806931] i2c-core: driver [mlxsw_minimal] registered
[    0.807007] xhci_hcd 0000:00:1e.0: vgaarb: pci_notify
[    0.807010] xhci_hcd 0000:00:1e.0: runtime IRQ mapping not provided by arch
[    0.807143] xhci_hcd 0000:00:1e.0: enabling bus mastering
[    0.807149] xhci_hcd 0000:00:1e.0: xHCI Host Controller
[    0.807154] xhci_hcd 0000:00:1e.0: new USB bus registered, assigned bus number 1
[    0.808229] xhci_hcd 0000:00:1e.0: hcc params 0x200077c1 hci version 0x100 quirks 0x0000000000009810
[    0.808237] xhci_hcd 0000:00:1e.0: cache line size of 64 is not supported
[    0.808433] xhci_hcd 0000:00:1e.0: xHCI Host Controller
[    0.808436] xhci_hcd 0000:00:1e.0: new USB bus registered, assigned bus number 2
[    0.808438] xhci_hcd 0000:00:1e.0: Host supports USB 3.0 SuperSpeed
[    0.808611] hub 1-0:1.0: USB hub found
[    0.808623] hub 1-0:1.0: 6 ports detected
[    0.809510] hub 2-0:1.0: USB hub found
[    0.809520] hub 2-0:1.0: 4 ports detected
[    0.809925] xhci_hcd 0000:00:1e.0: vgaarb: pci_notify
[    0.809956] usbcore: registered new interface driver cdc_acm
[    0.809957] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
[    0.809969] usbcore: registered new interface driver usb-storage
[    0.809982] usbcore: registered new interface driver usbserial_generic
[    0.809986] usbserial: USB Serial support registered for generic
[    0.809992] usbcore: registered new interface driver ftdi_sio
[    0.809995] usbserial: USB Serial support registered for FTDI USB Serial Device
[    0.810007] usbcore: registered new interface driver pl2303
[    0.810010] usbserial: USB Serial support registered for pl2303
[    0.810036] i8042: PNP: No PS/2 controller found.
[    0.810063] mousedev: PS/2 mouse device common for all mice
[    0.810567] rtc_cmos 00:00: registered as rtc0
[    0.810651] rtc_cmos 00:00: setting system clock to 2022-10-24T12:11:13 UTC (1666613473)
[    0.810667] rtc_cmos 00:00: alarms up to one day, 114 bytes nvram, hpet irqs
[    0.810683] rtc_cmos 00:00: RTC can wake from S4
[    0.810709] i2c-core: driver [smbus_alert] registered
[    0.810710] i2c_dev: i2c /dev entries driver
[    0.810756] i2c-core: driver [pca9541] registered
[    0.810760] i2c-core: driver [pca954x] registered
[    0.810772] i801_smbus 0000:00:1f.4: vgaarb: pci_notify
[    0.810779] i801_smbus 0000:00:1f.4: runtime IRQ mapping not provided by arch
[    0.810788] i801_smbus 0000:00:1f.4: enabling device (0140 -> 0143)
[    0.810939] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    0.810950] i2c-core: driver [lm75] registered
[    0.811051] i2c_dev: adapter [SMBus I801 adapter at 5000] registered as minor 0
[    0.811060] i2c i2c-0: adapter [SMBus I801 adapter at 5000] registered
[    0.811111] device-mapper: ioctl: 4.47.0-ioctl (2022-07-28) initialised: dm-devel@redhat.com
[    0.811158] intel_pstate: Intel P-state driver initializing
[    0.811761] intel_pstate: HWP enabled
[    0.811771] sdhci: Secure Digital Host Controller Interface driver
[    0.811772] sdhci: Copyright(c) Pierre Ossman
[    0.811808] sdhci-pltfm: SDHCI platform and OF driver helper
[    0.812124] hid: raw HID events driver (C) Jiri Kosina
[    0.812188] usbcore: registered new interface driver usbhid
[    0.812190] usbhid: USB HID core driver
[    0.812212] u32 classifier
[    0.812213]     input device check on
[    0.812214]     Actions configured
[    0.812333] NET: Registered PF_INET6 protocol family
[    0.812533] Segment Routing with IPv6
[    0.812538] In-situ OAM (IOAM) with IPv6
[    0.812555] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    0.812642] NET: Registered PF_PACKET protocol family
[    0.812652] Bridge firewalling registered
[    0.812690] NET: Registered PF_IEEE802154 protocol family
[    0.812695] Key type dns_resolver registered
[    0.813303] microcode: sig=0x606c1, pf=0x10, revision=0x10001a0
[    0.813331] microcode: Microcode Update Driver: v2.2.
[    0.813335] IPI shorthand broadcast: enabled
[    0.813339] AVX2 version of gcm_enc/dec engaged.
[    0.813371] AES CTR mode by8 optimization enabled
[    0.813605] sched_clock: Marking stable (812590994, 1000637)->(830942121, -17350490)
[    0.813764] registered taskstats version 1
[    0.813771] Loading compiled-in X.509 certificates
[    0.813814] Key type .fscrypt registered
[    0.813814] Key type fscrypt-provisioning registered
[    0.813936] Btrfs loaded, crc32c=crc32c-generic, zoned=no, fsverity=no
[    0.814010] pstore: Using crash dump compression: deflate
[    0.814203] Key type encrypted registered
[    0.815604] printk: console [netcon0] enabled
[    0.815605] netconsole: network logging started
[    0.815663] ALSA device list:
[    0.815665]   No soundcards found.
[    0.817175] i2c i2c-0: found normal entry for adapter 0, addr 0x48
[    0.817347] i801_smbus 0000:00:1f.4: No response
[    0.817354] i2c i2c-0: found normal entry for adapter 0, addr 0x49
[    0.817520] i801_smbus 0000:00:1f.4: No response
[    0.817526] i2c i2c-0: found normal entry for adapter 0, addr 0x4a
[    0.817692] i801_smbus 0000:00:1f.4: No response
[    0.817698] i2c i2c-0: found normal entry for adapter 0, addr 0x4b
[    0.817864] i801_smbus 0000:00:1f.4: No response
[    0.817870] i2c i2c-0: found normal entry for adapter 0, addr 0x4c
[    0.818036] i801_smbus 0000:00:1f.4: No response
[    0.818043] i2c i2c-0: found normal entry for adapter 0, addr 0x4d
[    0.818209] i801_smbus 0000:00:1f.4: No response
[    0.818215] i2c i2c-0: found normal entry for adapter 0, addr 0x4e
[    0.818380] i801_smbus 0000:00:1f.4: No response
[    0.818386] i2c i2c-0: found normal entry for adapter 0, addr 0x4f
[    0.818552] i801_smbus 0000:00:1f.4: No response
[    0.818569] i2c i2c-0: 2/6 memory slots populated (from DMI)
[    0.818570] i2c i2c-0: Systems with more than 4 memory slots not supported yet, not instantiating SPD
[    0.818582] i801_smbus 0000:00:1f.4: vgaarb: pci_notify
[    1.045137] usb 1-3: new high-speed USB device number 2 using xhci_hcd
[    1.088363] ata4: SATA link down (SStatus 4 SControl 300)
[    1.088386] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    1.091589] ata2.00: ATA-10: M.2 (S42) 3ME4, L20420, max UDMA/133
[    1.101444] ata2.00: 125045424 sectors, multi 1: LBA48 NCQ (depth 32), AA
[    1.119737] ata2.00: configured for UDMA/133
[    1.120017] scsi 1:0:0:0: Direct-Access     ATA      M.2 (S42) 3ME4   20   PQ: 0 ANSI: 5
[    1.120512] sd 1:0:0:0: Attached scsi generic sg0 type 0
[    1.120533] sd 1:0:0:0: [sda] 125045424 512-byte logical blocks: (64.0 GB/59.6 GiB)
[    1.120540] sd 1:0:0:0: [sda] Write Protect is off
[    1.120541] sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.120548] sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    1.120557] sd 1:0:0:0: [sda] Preferred minimum I/O size 512 bytes
[    1.126363]  sda: sda1 sda2 sda3 sda4
[    1.126463] sd 1:0:0:0: [sda] Attached SCSI disk
[    1.126471] md: Waiting for all devices to be available before autodetect
[    1.126472] md: If you don't use raid, use raid=noautodetect
[    1.126474] md: Autodetecting RAID arrays.
[    1.126474] md: autorun ...
[    1.126475] md: ... autorun DONE.
[    1.127998] EXT4-fs (sda3): mounted filesystem with ordered data mode. Quota mode: disabled.
[    1.128010] VFS: Mounted root (ext4 filesystem) readonly on device 8:3.
[    1.128831] devtmpfs: mounted
[    1.134805] Freeing unused kernel image (initmem) memory: 1704K
[    1.135120] Write protecting the kernel read-only data: 26624k
[    1.135921] Freeing unused kernel image (text/rodata gap) memory: 2028K
[    1.136181] Freeing unused kernel image (rodata/data gap) memory: 1372K
[    1.136187] Run /sbin/init as init process
[    1.136188]   with arguments:
[    1.136188]     /sbin/init
[    1.136189]   with environment:
[    1.136190]     HOME=/
[    1.136190]     TERM=linux
[    1.173161] hub 1-3:1.0: USB hub found
[    1.173472] hub 1-3:1.0: 4 ports detected
[    1.179682] systemd[1]: Current system time is further ahead 15y after build time, but cannot correct: Invalid argument
[    1.202142] systemd[1]: systemd 250.5+ running in system mode (+PAM -AUDIT -SELINUX -APPARMOR +IMA +SMACK -SECCOMP -GCRYPT -GNUTLS -OPENSSL +ACL +BLKID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN -IPTC +KMOD -LIBCRYPTSETUP +LIBFDISK -PCRE2 -PWQUALITY -P11KIT -QRENCODE -BZIP2 -LZ4 +XZ -ZLIB -ZSTD -BPF_FRAMEWORK -XKBCOMMON +UTMP -SYSVINIT default-hierarchy=hybrid)
[    1.202375] systemd[1]: Detected architecture x86-64.
[    1.228835] systemd[1]: Hostname set to <cca9010>.
[    1.310062] systemd[1]: Queued start job for default target Multi-User System.
[    1.327869] systemd[1]: Created slice Slice /system/getty.
[    1.328077] systemd[1]: Created slice Slice /system/modprobe.
[    1.328253] systemd[1]: Created slice Slice /system/netns.
[    1.328435] systemd[1]: Created slice Slice /system/serial-getty.
[    1.328571] systemd[1]: Created slice User and Session Slice.
[    1.328601] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[    1.328623] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[    1.328663] systemd[1]: Reached target Host and Network Name Lookups.
[    1.328671] systemd[1]: Reached target Path Units.
[    1.328680] systemd[1]: Reached target Remote File Systems.
[    1.328688] systemd[1]: Reached target Slice Units.
[    1.328696] systemd[1]: Reached target Swaps.
[    1.331890] systemd[1]: Listening on RPCbind Server Activation Socket.
[    1.331917] systemd[1]: Reached target RPC Port Mapper.
[    1.332652] systemd[1]: Listening on Process Core Dump Socket.
[    1.333330] systemd[1]: Journal Audit Socket was skipped because of a failed condition check (ConditionSecurity=audit).
[    1.333401] systemd[1]: Listening on Journal Socket (/dev/log).
[    1.333460] systemd[1]: Listening on Journal Socket.
[    1.333537] systemd[1]: Listening on udev Control Socket.
[    1.333587] systemd[1]: Listening on udev Kernel Socket.
[    1.334169] systemd[1]: Mounting Huge Pages File System...
[    1.334713] systemd[1]: Mounting POSIX Message Queue File System...
[    1.335282] systemd[1]: Mounting Kernel Debug File System...
[    1.335828] systemd[1]: Mounting Kernel Trace File System...
[    1.336553] systemd[1]: Mounting Temporary Directory /tmp...
[    1.336694] systemd[1]: Create List of Static Device Nodes was skipped because of a failed condition check (ConditionFileNotEmpty=/lib/modules/6.1.0-rc1-yocto-standard-upstream/modules.devname).
[    1.337272] systemd[1]: Starting Load Kernel Module configfs...
[    1.337837] systemd[1]: Starting Load Kernel Module drm...
[    1.338395] systemd[1]: Starting Load Kernel Module fuse...
[    1.338943] systemd[1]: Starting Load Kernel Module tmp421...
[    1.339746] systemd[1]: Starting RPC Bind...
[    1.340376] systemd[1]: Starting File System Check on Root Device...
[    1.340647] i2c-core: driver [tmp421] registered
[    1.340652] i2c i2c-0: found normal entry for adapter 0, addr 0x2a
[    1.340828] i801_smbus 0000:00:1f.4: No response
[    1.340836] i2c i2c-0: found normal entry for adapter 0, addr 0x4c
[    1.341003] i801_smbus 0000:00:1f.4: No response
[    1.341009] i2c i2c-0: found normal entry for adapter 0, addr 0x4d
[    1.341174] i801_smbus 0000:00:1f.4: No response
[    1.341186] i2c i2c-0: found normal entry for adapter 0, addr 0x4e
[    1.341287] systemd[1]: Starting Journal Service...
[    1.341350] i801_smbus 0000:00:1f.4: No response
[    1.341356] i2c i2c-0: found normal entry for adapter 0, addr 0x4f
[    1.341519] i801_smbus 0000:00:1f.4: No response
[    1.342404] systemd[1]: Starting Load Kernel Modules...
[    1.342993] systemd[1]: Starting Generate network units from Kernel command line...
[    1.343833] systemd[1]: Starting Coldplug All udev Devices...
[    1.345311] systemd[1]: Mounted Huge Pages File System.
[    1.345395] systemd[1]: Mounted POSIX Message Queue File System.
[    1.345442] systemd[1]: Mounted Kernel Debug File System.
[    1.345484] systemd[1]: Mounted Kernel Trace File System.
[    1.345524] systemd[1]: Mounted Temporary Directory /tmp.
[    1.345644] systemd[1]: modprobe@configfs.service: Deactivated successfully.
[    1.345770] systemd[1]: Finished Load Kernel Module configfs.
[    1.345893] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    1.345997] systemd[1]: Finished Load Kernel Module drm.
[    1.346148] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    1.346251] systemd[1]: Finished Load Kernel Module fuse.
[    1.346372] systemd[1]: modprobe@tmp421.service: Deactivated successfully.
[    1.346467] systemd[1]: Finished Load Kernel Module tmp421.
[    1.346612] systemd[1]: Finished Load Kernel Modules.
[    1.346822] systemd[1]: Finished Generate network units from Kernel command line.
[    1.347644] systemd[1]: Mounting NFSD configuration filesystem...
[    1.348491] systemd[1]: Mounting FUSE Control File System...
[    1.349302] systemd[1]: Mounting Kernel Configuration File System...
[    1.350225] systemd[1]: Starting Configure Intel x710 temp sensors...
[    1.351123] systemd[1]: Starting Apply Kernel Variables...
[    1.352065] systemd[1]: Started RPC Bind.
[    1.352189] systemd[1]: Mounted NFSD configuration filesystem.
[    1.352266] systemd[1]: Mounted FUSE Control File System.
[    1.352331] systemd[1]: Mounted Kernel Configuration File System.
[    1.360920] systemd[1]: Finished Apply Kernel Variables.
[    1.363415] systemd[1]: nwatemps.service: Main process exited, code=exited, status=1/FAILURE
[    1.363483] systemd[1]: nwatemps.service: Failed with result 'exit-code'.
[    1.363613] systemd[1]: Failed to start Configure Intel x710 temp sensors.
[    1.381336] systemd[1]: Finished File System Check on Root Device.
[    1.382418] systemd[1]: Starting Remount Root and Kernel File Systems...
[    1.388321] EXT4-fs (sda3): re-mounted. Quota mode: disabled.
[    1.389304] systemd[1]: Finished Remount Root and Kernel File Systems.
[    1.389732] systemd[1]: Rebuild Hardware Database was skipped because of a failed condition check (ConditionNeedsUpdate=/etc).
[    1.390632] systemd[1]: Starting Platform Persistent Storage Archival...
[    1.390713] systemd[1]: Create System Users was skipped because of a failed condition check (ConditionNeedsUpdate=/etc).
[    1.391618] systemd[1]: Starting Create Static Device Nodes in /dev...
[    1.395195] systemd[1]: Finished Platform Persistent Storage Archival.
[    1.398245] systemd[1]: Finished Create Static Device Nodes in /dev.
[    1.398310] systemd[1]: Reached target Preparation for Local File Systems.
[    1.399286] systemd[1]: Mounting /var/volatile...
[    1.400661] systemd[1]: Starting Rule-based Manager for Device Events and Files...
[    1.401587] systemd[1]: Mounted /var/volatile.
[    1.401660] systemd[1]: Bind mount volatile /var/cache was skipped because of a failed condition check (ConditionPathIsReadWrite=!/var/cache).
[    1.401676] systemd[1]: Bind mount volatile /var/lib was skipped because of a failed condition check (ConditionPathIsReadWrite=!/var/lib).
[    1.402559] systemd[1]: Starting Load/Save Random Seed...
[    1.402599] systemd[1]: Bind mount volatile /var/spool was skipped because of a failed condition check (ConditionPathIsReadWrite=!/var/spool).
[    1.402632] systemd[1]: Bind mount volatile /srv was skipped because of a failed condition check (ConditionPathIsReadWrite=!/srv).
[    1.412472] systemd[1]: Started Journal Service.
[    1.453154] usb 1-3.1: new low-speed USB device number 3 using xhci_hcd
[    1.473814] Intel(R) 2.5G Ethernet Linux Driver
[    1.473818] Copyright(c) 2018 Intel Corporation.
[    1.473841] igc 0000:01:00.0: vgaarb: pci_notify
[    1.473846] igc 0000:01:00.0: runtime IRQ mapping not provided by arch
[    1.473854] igc 0000:01:00.0: enabling device (0140 -> 0142)
[    1.473923] igc 0000:01:00.0: PTM enabled, 4ns granularity
[    1.473926] igc 0000:01:00.0: enabling bus mastering
[    1.473935] igc 0000:01:00.0: saving config space at offset 0x0 (reading 0xd9f8086)
[    1.473938] igc 0000:01:00.0: saving config space at offset 0x4 (reading 0x100146)
[    1.473941] igc 0000:01:00.0: saving config space at offset 0x8 (reading 0x2000003)
[    1.473943] igc 0000:01:00.0: saving config space at offset 0xc (reading 0x10)
[    1.473946] igc 0000:01:00.0: saving config space at offset 0x10 (reading 0xb3b00000)
[    1.473948] igc 0000:01:00.0: saving config space at offset 0x14 (reading 0x0)
[    1.473951] igc 0000:01:00.0: saving config space at offset 0x18 (reading 0x0)
[    1.473953] igc 0000:01:00.0: saving config space at offset 0x1c (reading 0xb3c00000)
[    1.473956] igc 0000:01:00.0: saving config space at offset 0x20 (reading 0x0)
[    1.473958] igc 0000:01:00.0: saving config space at offset 0x24 (reading 0x0)
[    1.473960] igc 0000:01:00.0: saving config space at offset 0x28 (reading 0x0)
[    1.473963] igc 0000:01:00.0: saving config space at offset 0x2c (reading 0x8086)
[    1.473965] igc 0000:01:00.0: saving config space at offset 0x30 (reading 0x0)
[    1.473968] igc 0000:01:00.0: saving config space at offset 0x34 (reading 0x40)
[    1.473970] igc 0000:01:00.0: saving config space at offset 0x38 (reading 0x0)
[    1.473972] igc 0000:01:00.0: saving config space at offset 0x3c (reading 0x1ff)
[    1.486778] ice: Intel(R) Ethernet Connection E800 Series Linux Driver
[    1.486782] ice: Copyright (c) 2018, Intel Corporation.
[    1.486855] ice 0000:f4:00.0: vgaarb: pci_notify
[    1.486862] ice 0000:f4:00.0: runtime IRQ mapping not provided by arch
[    1.486869] ice 0000:f4:00.0: enabling device (0140 -> 0142)
[    1.487124] ice 0000:f4:00.0: enabling bus mastering
[    1.487129] ice 0000:f4:00.0: saving config space at offset 0x0 (reading 0x18888086)
[    1.487132] ice 0000:f4:00.0: saving config space at offset 0x4 (reading 0x100146)
[    1.487135] ice 0000:f4:00.0: saving config space at offset 0x8 (reading 0x2000000)
[    1.487138] ice 0000:f4:00.0: saving config space at offset 0xc (reading 0x800010)
[    1.487140] ice 0000:f4:00.0: saving config space at offset 0x10 (reading 0xf000000c)
[    1.487143] ice 0000:f4:00.0: saving config space at offset 0x14 (reading 0x22f)
[    1.487146] ice 0000:f4:00.0: saving config space at offset 0x18 (reading 0x0)
[    1.487149] ice 0000:f4:00.0: saving config space at offset 0x1c (reading 0xfc03000c)
[    1.487151] ice 0000:f4:00.0: saving config space at offset 0x20 (reading 0x22f)
[    1.487154] ice 0000:f4:00.0: saving config space at offset 0x24 (reading 0x0)
[    1.487156] ice 0000:f4:00.0: saving config space at offset 0x28 (reading 0x0)
[    1.487159] ice 0000:f4:00.0: saving config space at offset 0x2c (reading 0x8086)
[    1.487161] ice 0000:f4:00.0: saving config space at offset 0x30 (reading 0xfb600000)
[    1.487164] ice 0000:f4:00.0: saving config space at offset 0x34 (reading 0x40)
[    1.487167] ice 0000:f4:00.0: saving config space at offset 0x38 (reading 0x0)
[    1.487169] ice 0000:f4:00.0: saving config space at offset 0x3c (reading 0x1ff)
[    1.520406] pps pps1: new PPS source ptp1
[    1.520449] igc 0000:01:00.0 (unnamed net_device) (uninitialized): PHC added
[    1.544300] igc 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth (5.0 GT/s PCIe x1 link)
[    1.544304] igc 0000:01:00.0 eth1: MAC: 00:a0:c9:00:00:00
[    1.544319] igc 0000:01:00.0: vgaarb: pci_notify
[    1.566825] input:   USB Keyboard as /devices/pci0000:00/0000:00:1e.0/usb1/1-3/1-3.1/1-3.1:1.0/0003:04D9:1603.0001/input/input2
[    1.618231] hid-generic 0003:04D9:1603.0001: input,hidraw0: USB HID v1.10 Keyboard [  USB Keyboard] on usb-0000:00:1e.0-3.1/input0
[    1.632637] input:   USB Keyboard System Control as /devices/pci0000:00/0000:00:1e.0/usb1/1-3/1-3.1/1-3.1:1.1/0003:04D9:1603.0002/input/input3
[    1.684168] input:   USB Keyboard Consumer Control as /devices/pci0000:00/0000:00:1e.0/usb1/1-3/1-3.1/1-3.1:1.1/0003:04D9:1603.0002/input/input4
[    1.684210] hid-generic 0003:04D9:1603.0002: input,hidraw1: USB HID v1.10 Device [  USB Keyboard] on usb-0000:00:1e.0-3.1/input1
[    1.710985] ice 0000:f4:00.0: Get PHY capabilities failed status = -5, continuing anyway
[    1.711706] ice 0000:f4:00.0: Direct firmware load for intel/ice/ddp/ice.pkg failed with error -2
[    1.711708] ice 0000:f4:00.0: The DDP package file was not found or could not be read. Entering Safe Mode
[    1.721330] ice 0000:f4:00.0: not enough device MSI-X vectors. wanted = 10, available = 2
[    1.721333] ice 0000:f4:00.0: Reducing request to 1 MSI-X vectors for LAN traffic.
[    1.749111] usb 1-3.3: new full-speed USB device number 4 using xhci_hcd
[    1.772751] ice 0000:f4:00.0: Get PHY capability failed.
[    1.778098] ice 0000:f4:00.0: ice_init_nvm_phy_type failed: -5
[    1.808080] ice 0000:f4:00.0: ice_update_link_info failed: -5
[    1.833565] cdc_acm 1-3.3:1.0: ttyACM0: USB ACM device
[    1.898107] usb 1-3.4: new full-speed USB device number 5 using xhci_hcd
[    1.924123] ice 0000:f4:00.0: Get PHY capability failed.
[    1.929466] ice 0000:f4:00.0: ice_init_phy_user_cfg failed: -5
[    1.935335] ice 0000:f4:00.0 (unnamed net_device) (uninitialized): Potential misconfiguration of the Ethernet port detected. If it was not intended, please use the Intel (R) Ethernet Port Configuration Tool to address the issue.
[    1.939660] ice 0000:f4:00.0: Failed to get PHY configuration, VSI 8 error -5
[    1.970643] ice 0000:f4:00.0: RDMA is not supported on this device
[    1.970668] ice 0000:f4:00.0: vgaarb: pci_notify
[    1.970685] ice 0000:f4:00.1: vgaarb: pci_notify
[    1.970690] ice 0000:f4:00.1: runtime IRQ mapping not provided by arch
[    1.970697] ice 0000:f4:00.1: enabling device (0140 -> 0142)
[    1.970811] ice 0000:f4:00.1: enabling bus mastering
[    1.970815] ice 0000:f4:00.1: saving config space at offset 0x0 (reading 0x18888086)
[    1.970820] ice 0000:f4:00.1: saving config space at offset 0x4 (reading 0x100146)
[    1.970825] ice 0000:f4:00.1: saving config space at offset 0x8 (reading 0x2000000)
[    1.970829] ice 0000:f4:00.1: saving config space at offset 0xc (reading 0x800010)
[    1.970833] ice 0000:f4:00.1: saving config space at offset 0x10 (reading 0xe800000c)
[    1.970838] ice 0000:f4:00.1: saving config space at offset 0x14 (reading 0x22f)
[    1.970842] ice 0000:f4:00.1: saving config space at offset 0x18 (reading 0x0)
[    1.970847] ice 0000:f4:00.1: saving config space at offset 0x1c (reading 0xfc02000c)
[    1.970851] ice 0000:f4:00.1: saving config space at offset 0x20 (reading 0x22f)
[    1.970855] ice 0000:f4:00.1: saving config space at offset 0x24 (reading 0x0)
[    1.970860] ice 0000:f4:00.1: saving config space at offset 0x28 (reading 0x0)
[    1.970864] ice 0000:f4:00.1: saving config space at offset 0x2c (reading 0x8086)
[    1.970868] ice 0000:f4:00.1: saving config space at offset 0x30 (reading 0xfb500000)
[    1.970873] ice 0000:f4:00.1: saving config space at offset 0x34 (reading 0x40)
[    1.970877] ice 0000:f4:00.1: saving config space at offset 0x38 (reading 0x0)
[    1.970881] ice 0000:f4:00.1: saving config space at offset 0x3c (reading 0x1ff)
[    1.990607] cdc_acm 1-3.4:1.0: ttyACM1: USB ACM device
[    1.991509] hid-generic 0003:04D8:00DD.0003: hiddev96,hidraw2: USB HID v1.11 Device [Microchip Technology Inc. MCP2221 USB-I2C/UART Combo] on usb-0000:00:1e.0-3.4/input2
[    1.998390] mcp2221 0003:04D8:00DD.0003: hidraw2: USB HID v1.11 Device [Microchip Technology Inc. MCP2221 USB-I2C/UART Combo] on usb-0000:00:1e.0-3.4/input2
[    2.050149] i2c_dev: adapter [MCP2221 usb-i2c bridge on hidraw2] registered as minor 1
[    2.050166] i2c i2c-1: adapter [MCP2221 usb-i2c bridge on hidraw2] registered
[    2.050173] i2c i2c-1: found normal entry for adapter 1, addr 0x48
[    2.050179] BUG: kernel NULL pointer dereference, address: 0000000000000000
[    2.057180] #PF: supervisor read access in kernel mode
[    2.062347] #PF: error_code(0x0000) - not-present page
[    2.067517] PGD 0 P4D 0 
[    2.070069] Oops: 0000 [#1] PREEMPT SMP
[    2.073931] CPU: 7 PID: 287 Comm: systemd-udevd Not tainted 6.1.0-rc1-yocto-standard-upstream #1
[    2.082761] Hardware name: Default string Default string/Default string, BIOS 1.01.10.AR01 08/05/2022
[    2.092025] RIP: 0010:mcp_smbus_xfer+0x29/0x348 [hid_mcp2221]
[    2.097811] Code: 00 0f 1f 44 00 00 55 48 89 e5 41 57 41 56 41 55 45 89 cd 41 54 45 89 c4 53 48 83 ec 08 48 8b 9f e8 00 00 00 89 75 d4 89 4d d0 <48> 8b 3b 48 8b 87 b8 1b 00 00 48 8b 40 20 48 85 c0 74 07 be 20 00
[    2.116673] RSP: 0018:ffffa6c4409ab748 EFLAGS: 00010296
[    2.121929] RAX: ffffffffc0509fc0 RBX: 0000000000000000 RCX: 0000000000000000
[    2.129104] RDX: 0000000000000000 RSI: 0000000000000048 RDI: ffff9957c69b5830
[    2.136278] RBP: ffffa6c4409ab778 R08: 0000000000000000 R09: 0000000000000000
[    2.143450] R10: ffff995b3fede000 R11: ffff995b3ff8e000 R12: 0000000000000000
[    2.150625] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[    2.157797] FS:  00007f5b4ee65600(0000) GS:ffff995b301c0000(0000) knlGS:0000000000000000
[    2.165932] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.171710] CR2: 0000000000000000 CR3: 0000000108c9b002 CR4: 0000000000770ee0
[    2.178884] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    2.186059] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    2.193232] PKRU: 55555554
[    2.195959] Call Trace:
[    2.198423]  <TASK>
[    2.200540]  __i2c_smbus_xfer+0x105/0x3d0
[    2.204578]  ? mcp_i2c_xfer+0x160/0x160 [hid_mcp2221]
[    2.209663]  i2c_smbus_xfer+0x62/0xe0
[    2.213350]  i2c_default_probe+0xf1/0x130
[    2.216667] ice 0000:f4:00.1: Get PHY capabilities failed status = -5, continuing anyway
[    2.217384]  i2c_detect.isra.0.cold+0xf4/0x220
[    2.229989]  ? kernfs_add_one+0xe8/0x130
[    2.233941]  ? preempt_count_add+0x7a/0xc0
[    2.238063]  ? _raw_spin_lock_irqsave+0x1e/0x50
[    2.242623]  ? __process_new_driver+0x30/0x30
[    2.247007]  __process_new_adapter+0x18/0x20
[    2.251304]  bus_for_each_drv+0x82/0xd0
[    2.255167]  i2c_register_adapter.cold+0x133/0x1f4
[    2.259990]  i2c_add_adapter+0x5c/0x80
[    2.263764]  mcp2221_probe+0x138/0x250 [hid_mcp2221]
[    2.268762]  ? hid_lookup_quirk+0x7f/0x190
[    2.272136] ice 0000:f4:00.1: Direct firmware load for intel/ice/ddp/ice.pkg failed with error -2
[    2.272884]  hid_device_probe+0xf5/0x160
[    2.281804] ice 0000:f4:00.1: The DDP package file was not found or could not be read. Entering Safe Mode
[    2.285748]  really_probe+0xdf/0x290
[    2.295369] ice 0000:f4:00.1: not enough device MSI-X vectors. wanted = 10, available = 2
[    2.298964]  ? pm_runtime_barrier+0x55/0x90
[    2.307187] ice 0000:f4:00.1: Reducing request to 1 MSI-X vectors for LAN traffic.
[    2.311392]  __driver_probe_device+0x78/0xe0
[    2.323310]  driver_probe_device+0x24/0xe0
[    2.325658] ice 0000:f4:00.1: Get PHY capability failed.
[    2.327431]  __device_attach_driver+0x7d/0x100
[    2.332776] ice 0000:f4:00.1: ice_init_nvm_phy_type failed: -5
[    2.337243]  ? driver_allows_async_probing+0x60/0x60
[    2.348108]  bus_for_each_drv+0x82/0xd0
[    2.351969]  ? __hid_register_driver+0x90/0x90
[    2.356439]  __device_attach+0xc1/0x1f0
[    2.360302]  ? __hid_register_driver+0x90/0x90
[    2.364773]  device_attach+0x10/0x20
[    2.368372]  device_reprobe+0x4a/0x90
[    2.372059]  __hid_bus_reprobe_drivers+0x56/0x60
[    2.373151] ice 0000:f4:00.1: ice_update_link_info failed: -5
[    2.376704]  bus_for_each_dev+0x7c/0xc0
[    2.386344]  ? hid_destroy_device+0x60/0x60
[    2.390554]  __hid_bus_driver_added+0x2c/0x40
[    2.394937]  bus_for_each_drv+0x82/0xd0
[    2.398800]  __hid_register_driver+0x7d/0x90
[    2.403096]  ? 0xffffffffc07c2000
[    2.406434]  mcp2221_driver_init+0x23/0x1000 [hid_mcp2221]
[    2.411955]  do_one_initcall+0x4f/0x210
[    2.415817]  ? kmalloc_trace+0x2a/0xa0
[    2.419593]  do_init_module+0x52/0x200
[    2.423367]  load_module+0x1a78/0x1c50
[    2.427142]  __do_sys_finit_module+0xbb/0x110
[    2.431525]  ? __do_sys_finit_module+0xbb/0x110
[    2.436086]  __x64_sys_finit_module+0x18/0x20
[    2.440469]  do_syscall_64+0x3d/0x90
[    2.444070]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
[    2.449154] RIP: 0033:0x7f5b4efc202d
[    2.452755] Code: c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c3 4d 0e 00 f7 d8 64 89 01 48
[    2.471614] RSP: 002b:00007ffe16a04a18 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    2.473832] ice 0000:f4:00.1: Get PHY capability failed.
[    2.479225] RAX: ffffffffffffffda RBX: 00005651bb4c0670 RCX: 00007f5b4efc202d
[    2.479226] RDX: 0000000000000000 RSI: 00007f5b4f13636b RDI: 0000000000000006
[    2.479227] RBP: 00007ffe16a04a40 R08: 0000000000000000 R09: 0000000000000000
[    2.484576] ice 0000:f4:00.1: ice_init_phy_user_cfg failed: -5
[    2.491744] R10: 0000000000000006 R11: 0000000000000246 R12: 00007f5b4f13636b
[    2.491745] R13: 0000000000000000 R14: 0000000000020000 R15: 00005651bb4c0670
[    2.491748]  </TASK>
[    2.498922] ice 0000:f4:00.1 (unnamed net_device) (uninitialized): Potential misconfiguration of the Ethernet port detected. If it was not intended, please use the Intel (R) Ethernet Port Configuration Tool to address the issue.
[    2.506091] Modules linked in: hid_mcp2221(+) ice(+) igc
[    2.512062] ice 0000:f4:00.1: Failed to get PHY configuration, VSI 9 error -5
[    2.519128]  sch_fq_codel tmp421 configfs
[    2.519132] CR2: 0000000000000000
[    2.528058] ice 0000:f4:00.1: RDMA is not supported on this device
[    2.528505] ---[ end trace 0000000000000000 ]---
[    2.566155] RIP: 0010:mcp_smbus_xfer+0x29/0x348 [hid_mcp2221]
[    2.582323] ice 0000:f4:00.1: vgaarb: pci_notify
[    2.587646] Code: 00 0f 1f 44 00 00 55 48 89 e5 41 57 41 56 41 55 45 89 cd 41 54 45 89 c4 53 48 83 ec 08 48 8b 9f e8 00 00 00 89 75 d4 89 4d d0 <48> 8b 3b 48 8b 87 b8 1b 00 00 48 8b 40 20 48 85 c0 74 07 be 20 00
[    2.587648] RSP: 0018:ffffa6c4409ab748 EFLAGS: 00010296
[    2.591539] i801_smbus 0000:00:1f.4: saving config space at offset 0x0 (reading 0x18df8086)
[    2.591543] i801_smbus 0000:00:1f.4: saving config space at offset 0x4 (reading 0x2800143)
[    2.591546] i801_smbus 0000:00:1f.4: saving config space at offset 0x8 (reading 0xc050011)
[    2.591548] i801_smbus 0000:00:1f.4: saving config space at offset 0xc (reading 0x0)
[    2.591550] i801_smbus 0000:00:1f.4: saving config space at offset 0x10 (reading 0xffa96004)
[    2.591552] i801_smbus 0000:00:1f.4: saving config space at offset 0x14 (reading 0x20f)
[    2.591555] i801_smbus 0000:00:1f.4: saving config space at offset 0x18 (reading 0x0)
[    2.591557] i801_smbus 0000:00:1f.4: saving config space at offset 0x1c (reading 0x0)
[    2.591559] i801_smbus 0000:00:1f.4: saving config space at offset 0x20 (reading 0x5001)
[    2.591561] i801_smbus 0000:00:1f.4: saving config space at offset 0x24 (reading 0x0)
[    2.591563] i801_smbus 0000:00:1f.4: saving config space at offset 0x28 (reading 0x0)
[    2.591565] i801_smbus 0000:00:1f.4: saving config space at offset 0x2c (reading 0x72708086)
[    2.591567] i801_smbus 0000:00:1f.4: saving config space at offset 0x30 (reading 0x0)
[    2.591569] i801_smbus 0000:00:1f.4: saving config space at offset 0x34 (reading 0x0)
[    2.591571] i801_smbus 0000:00:1f.4: saving config space at offset 0x38 (reading 0x0)
[    2.591573] i801_smbus 0000:00:1f.4: saving config space at offset 0x3c (reading 0x2ff)
[    2.594833] ice 0000:f4:00.2: vgaarb: pci_notify

[    2.598855] RAX: ffffffffc0509fc0 RBX: 0000000000000000 RCX: 0000000000000000
[    2.598856] RDX: 0000000000000000 RSI: 0000000000000048 RDI: ffff9957c69b5830
[    2.602198] ice 0000:f4:00.2: runtime IRQ mapping not provided by arch
[    2.608406] RBP: ffffa6c4409ab778 R08: 0000000000000000 R09: 0000000000000000
[    2.608407] R10: ffff995b3fede000 R11: ffff995b3ff8e000 R12: 0000000000000000
[    2.608408] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[    2.613057] ice 0000:f4:00.2: enabling device (0140 -> 0142)
[    2.618830] FS:  00007f5b4ee65600(0000) GS:ffff995b301c0000(0000) knlGS:0000000000000000
[    2.618832] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.623539] ice 0000:f4:00.2: enabling bus mastering
[    2.642332] CR2: 0000000000000000 CR3: 0000000108c9b002 CR4: 0000000000770ee0
[    2.642333] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    2.642334] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    2.642335] PKRU: 55555554
