Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 577D47DE4DB
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Nov 2023 17:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344293AbjKAQwT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Nov 2023 12:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344277AbjKAQwS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Nov 2023 12:52:18 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2105.outbound.protection.outlook.com [40.107.220.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E3010C;
        Wed,  1 Nov 2023 09:52:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BldDb84QxppI8M//kSeqdO5AlhhKE2GVK8VDEF8lrQIGPYTdZig1MyTO46PMjbYN4lnC0oMKANlLh/iosNq70AK9KMHK2cS8N3NmdZunhRmHhIiTeDP75qshnVMkyWsUI7NynlUROOKOheXwHWg8P66Yao3kKigyMN/TMXtrQPux+Y+VPr83G1cSiM59GPBBDcnyaduPuMGnUUiHOfnHxvND2zsR4Jv7YZjO9Eb3GKHlY243f5Pdy+S12OdgXJAseUHVe9VfhiPFWyIoLHGRgx6Yhz68qytpegJYQ4MmY+VGs79GtoMub/Acwav6MPuqBbOqE4EiuRWjwf4YW8CTgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NwzRR1oaLJ8aAqAwd2yWmi4XuyO9HkhbWWGKyKE0HI=;
 b=A7LLeU23RQWEbussanku4BlZW2c9laERlDUy0ZEt94s6D2Ng5x4tRtjgVMlxpis12mRDgWTi0KCZV/Ts9mmnWSFPKocoyYgYYmU9SVx4tUdI185e2VsVP8kA0krWDkz82i8huGajSQ6ZCNNGeLrwsT/sYp/lzsy5wKwZFdO3jVvTr30EUYh54rF+rAlIvZbJymPaTT5fr6EYD44wSajjYAQ/bt+ibGkLJ5nW8d+Ki4sEonoHDnVnADTe8V9YXdYigljw7e8fMuJ5TVzwuno9x9knF/imA1iIV0kQrPPg/fwMHiybRli0+6pMgKg3IYzYkGFp51TxlikbgC3YEV8ggQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NwzRR1oaLJ8aAqAwd2yWmi4XuyO9HkhbWWGKyKE0HI=;
 b=M+6ezH2PUru5DWDVoLH0sefKdTwImr30VMjfarpflk4ACSPTx39TxBN58Kr+4okV/I3TPV8GTjLxumc2Y45I5Zmw2TIhAHIlWOAExQR7KiwuKflJCbyWvKrKejeXjTQN6O2nQ14ukG5qDGjGR4pzUi56H0rX2n3wKQMziXLT2AY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7475.prod.exchangelabs.com (2603:10b6:510:f2::9) by
 BN0PR01MB6912.prod.exchangelabs.com (2603:10b6:408:16b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19; Wed, 1 Nov 2023 16:52:08 +0000
Received: from PH0PR01MB7475.prod.exchangelabs.com ([fe80::b84:304e:acf:afcb])
 by PH0PR01MB7475.prod.exchangelabs.com ([fe80::b84:304e:acf:afcb%6]) with
 mapi id 15.20.6907.032; Wed, 1 Nov 2023 16:52:08 +0000
Message-ID: <9e89a22d-7370-4814-ac60-d60cf4a9e63c@os.amperecomputing.com>
Date:   Wed, 1 Nov 2023 09:51:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Content-Language: en-US
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Yann Sionneau <yann@sionneau.net>,
        Wolfram Sang <wsa@kernel.org>,
        Yann Sionneau <ysionneau@kalrayinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Julian Vetter <jvetter@kalrayinc.com>,
        Jonathan Borne <jborne@kalray.eu>
References: <ba6d4378-b646-4514-3a45-4b6c951fbb9c@kalrayinc.com>
 <9219ad29-b9a3-4f07-81b5-43b4b6d9d178@os.amperecomputing.com>
 <d65lwrkji3rvw6r4jdcumo4zu3hbu6zpv6xq73hw6hcshvhtkw@jvuohb3f3loo>
 <3a305e74-2235-47ab-8564-0c594f24dc0a@os.amperecomputing.com>
 <ZRSEntqne/1y1ozq@shikoro>
 <1d56ceef-6573-43b9-a050-124c341a0698@linux.intel.com>
 <ZTpLHZZYtd1WgBu6@ninjato>
 <ab57ba73-ce62-43fc-9cb1-d2db1bd13cd9@os.amperecomputing.com>
 <7ee0acbd-e332-4dc5-a6e6-0df58913ff71@sionneau.net>
 <846d933a-598f-43e7-8478-04f3a0d20d1c@linux.intel.com>
 <wlhhgjsh7hw76m637zpj6c4fmzsd2znphrb3dujen5ieukdbwr@yantuxgq3yb7>
From:   Jan Bottorff <janb@os.amperecomputing.com>
In-Reply-To: <wlhhgjsh7hw76m637zpj6c4fmzsd2znphrb3dujen5ieukdbwr@yantuxgq3yb7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0397.namprd03.prod.outlook.com
 (2603:10b6:610:11b::30) To PH0PR01MB7475.prod.exchangelabs.com
 (2603:10b6:510:f2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7475:EE_|BN0PR01MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c9a722a-a3bd-41cc-5790-08dbdafae239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B4UtM/cLpdB2miSUJvMLNVg9zZyjpsD6w1drk7/7fALakT1LttKP/46aGTwQHyZTv/N61IYlc9pCVRWBs4saNuRitQQ3ezZrufApVeIQb5nf09b45FJjk3rSATCa80D0UdouQnnVwUJRJiMaFkgEBfrBa7RP7f137EPBGRMAhEMeJUbVUBxDH49rMMEG74RaksVWTtiqDDiVIJacXCDTjCbB4UdbdCukbTDHP20Fp3oLjvh251/D3o/IhYhmEFZuGFJhGB8j6Qjn+gd5sWYoA0PQgqAJjcoajgBdlbUW/mgUP7dmHaaWZ/nlwiGITcHuvhY7/c0yOAq6miIO9+gmMVVOaHFh4SiLF0Ckr+G7VgnsXNw3BNHBIG94pkcMByf9GI0qVmY2JZIFXdiu/yAuw0W5V+CDJfhc0nqt4/kaafRwMhfXK9/f/WaBviJtuUPiShUrwaNKpIUUsmLO9WyXCsDUAEEf6ABhoFal17dQyU1Eb+FNF7YEKADe+OhIzzXALoFBUJKcf2iCs2T/G093xpr3K36NO9TTuR4x2n51jZM+q6jXTas4RXZ88LDzQnCgujI6pb9ECEad2+l9BHlglu6qprU4GRDkTLMTAYihg1YRDHt/C0fvuqZF+1UhYYF4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7475.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(39850400004)(366004)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6916009)(316002)(86362001)(2616005)(31696002)(2906002)(66476007)(83380400001)(54906003)(26005)(66556008)(66946007)(478600001)(53546011)(41300700001)(6506007)(6512007)(38100700002)(4326008)(8676002)(8936002)(6666004)(31686004)(6486002)(7416002)(5660300002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGRPNDZiK2pCbDFndERtak9UQ2hOZnh3ZnFUZVJSVjFiVjBEcHJXWG5jK1R4?=
 =?utf-8?B?V3R0UHM1VXErMGZhUHFRdENLbU9FZHpMVXFuam9Ycm53K3VUYnNjQk9KMHJx?=
 =?utf-8?B?VUVWVkUvWjhKVFBDOFJQOVdsYkdKZDBaWnF3UWVNb05Oa0dpZU8vMWpMOUJO?=
 =?utf-8?B?dzFDQTBYYWU4a3dnbisvK2xvM2o1KzRtcENYLzZnQkVnNDZZTllmTTdMdmV3?=
 =?utf-8?B?NWJDTXEySXA4OExYOHpVOUFLUlRtcFUvb0V4bjVVak1DUkJRODNCS0Y2anpv?=
 =?utf-8?B?dGsvRE9IUGlkZm9LRWpoT0N3OHh4ZHhkTk5NWnlPWnV3aFMxa0dISVdXYjBF?=
 =?utf-8?B?VW1CNGJDSEprcDZOdU9OcjJaUGZ3QXJkR0RNSHpzaGQ5S3A4N2M3WExINzFH?=
 =?utf-8?B?VlBSVG1Jdzd1MTM5N1BKOVlmbzU1c2ZHa1ZCQ2NOQy9HMmQycXQyL0d3cCto?=
 =?utf-8?B?MzRHSm9jeDZ1cEp6Qk9qVEpJOWNBS1NMYnMva0VxMXZVaTc1TCs3VjM2Vkli?=
 =?utf-8?B?ZWNBV3pNQk9XYkptMU5DY1IrelpQUFVvd0lkd29YSUhHenVqTitOL2x1NUNR?=
 =?utf-8?B?SERnRnFGWFJZejQzUmFCa1FCN0ZtU01aaCs5Zm9jUk54WmhBcHBQS0VZWVNW?=
 =?utf-8?B?RThoYjZaaUNlNGNSWFlpUHhST2tEK1kzRFlyMVZ4Z2V6NHJvYzZ5VXgyTGha?=
 =?utf-8?B?MG9DUVpnVXBGUkN6eHFKSW9TOWVYRmQxZHNlSG8wVXU1c0FZZmNja2R2MnFZ?=
 =?utf-8?B?amlJajI1Q1MrdGtLdHV6NWJEZk9mSWhGU01teldLMGRlUk9lYjBNaE5GMnVp?=
 =?utf-8?B?TkFSVzNuVUJ1RU1hR0NNTWdub2xGOFlxT3FlU3pwTm1YeVI1bC81YXRUMkJr?=
 =?utf-8?B?VWZtK014bkdWUjhyNDdKYmNaSjVEN0VBeTdnVlAramxzUFRtenc3R2tUcjFr?=
 =?utf-8?B?VGdpWE9sSGF1dWM0cmdJcWg3aWJKV3JqZGo0bEFyVG8vU1BpQk5WZWpMS1gz?=
 =?utf-8?B?WWk5NjEvOE9VMmVRTUJOQnBITElIeXFGZFZXUWkzUEVLOUJFWGFpUzc4cVVo?=
 =?utf-8?B?eGVkNXdPTysyUnlESlJMeFlJRFk2UnJaZ1FuTzlhK0xPeDYzdXdmdjdCRHJm?=
 =?utf-8?B?N1lSQmtVN3FXZEQ3bUxjbFI4MDhLKzFoOWZvN0dpTVUycDJnQnA0bGx4Vkcr?=
 =?utf-8?B?YjhXcEYrb1U0TXk2UktSZE1qelZiYmJiNVZGOUs3VDBPSHM0NHFOREtvK0xl?=
 =?utf-8?B?TG1DSlVPYmRnMWJ5SytWMUZwOW9FTUVnQ0VPaThMdUJKbEUrVll5cmRHZU9P?=
 =?utf-8?B?VUFZbTJxMTNxb0hvbkY1bVFJWWF0alRmSDJSTUhaSzNFZjIrMjArbnlnTXdj?=
 =?utf-8?B?bU02cWxrdjl1Qi9meGdtcGEwc3NYS3BEb2Nra0xWekdZMG83M1BwTVJ6YXlI?=
 =?utf-8?B?RWZDaEMxdG1WdFR2UXpEa1ZmUnM5UUxtOXJ2TDdzWTlEdzh3ZER0VU5BaWFO?=
 =?utf-8?B?d28xeWlqbHluUXhvS1NmYkNwZkV5UU5QSnRJZkZwM1pCMndBTS8yclVMVk5I?=
 =?utf-8?B?NHBQV1dzWU5ickpNZXJBUVhLUTdzTWVjMFgrTndMZTZBMis3WWpIK21KaWsw?=
 =?utf-8?B?amQ5VzFhby9GUFE3bTZUYVYrVTc1YnprN1ZBaUwzQTd1UEplVTR2MUpIWGlo?=
 =?utf-8?B?b1o3SGdzenZDWk1ZY3dMNmo0NTdMOFpWTTVLRFhDYkgxdE8yWkloRG10ZC9R?=
 =?utf-8?B?a1ZXc0NvajYxZENYaDJuUlhQVFQyNGh4aEZvZGJyK0V6dE9USkYreWFhdnht?=
 =?utf-8?B?UG85QXkrMUlFQ1FzaVlZTVlKZW1FeXRvdmtsZDVZZ2kxdm5nMUNBMXRSZ2Nq?=
 =?utf-8?B?Q09FM0VIR3NoVEY3ZnZ0a0tJQTRrNXROYTkwSGYzSUthZmFsaE4zOTlKWkhP?=
 =?utf-8?B?RnlSbWpObU43NDZsTkJ3amxrY3ZMam4wY0VnMTBtVnpMRE5RRTNxM2lET2t4?=
 =?utf-8?B?enNMaTJTcmNta1M3bDRtdDRZOG5xUEhKaUNRYkpudUlOM2dzQ0ZYTW12QU5N?=
 =?utf-8?B?bnIvVk5BakZMZkJ4YktPenlaeFAxcEJ6ZkhZV05yVEZncXlsdWgxbThGckpz?=
 =?utf-8?B?ZW1EL1VUaWkyMER5TDIySElDT0YzalUrSFJzeURvNSt1N01XSXZVQVNsdjYw?=
 =?utf-8?Q?07+URmrMBrRSjp5Ap9DDUYQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9a722a-a3bd-41cc-5790-08dbdafae239
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7475.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 16:52:07.6770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDgUM9+ltuKcpwSCg8kWCTpUVtH6mMA8dq3E3AqdqibSFqIdUsliiHUuI3I+qB86/qhvxujbVJMdvpbMxzsqRBg7us0I+Y7QCV1sB3DioT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR01MB6912
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/31/2023 6:06 AM, Serge Semin wrote:
> On Tue, Oct 31, 2023 at 02:10:13PM +0200, Jarkko Nikula wrote:
>> On 10/31/23 10:44, Yann Sionneau wrote:
>>>
>>> Le 31/10/2023 à 01:12, Jan Bottorff a écrit :
>>>> On 10/26/2023 4:18 AM, Wolfram Sang wrote:
>>>>> So, someone wants to come up with a patch to move to non-relaxed io
>>>>> accessors?
>>>>>
...
>>>> I could make the patch if we have consensus (or maintainers
>>>> decision) on which way to go: 1) only writes to DW_IC_INTR_MASK are
>>>> non-relaxed, 2) make all read/write accessors use the non-relaxed
>>>> version.
>>>
>>> Fine with me, let's go for #2 :)
>>>
>> Also simplicity votes for #2.
> 
> +1 for the option #2. Let's do it and be finally over with this
> patch.)
> 
> -Serge(y)

I think we have agreement to make the dw i2c driver regmap accessors use 
the non-relaxed low-level functions, like writel instead of 
writel_relaxed. These low level functions have memory barriers on 
platforms that require them.

I'll work on a patch for this.

- Jan
