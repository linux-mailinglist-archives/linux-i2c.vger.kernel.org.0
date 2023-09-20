Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0A797A8C7C
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Sep 2023 21:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjITTPB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Sep 2023 15:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbjITTPA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Sep 2023 15:15:00 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2108.outbound.protection.outlook.com [40.107.100.108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B3310E3;
        Wed, 20 Sep 2023 12:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkUZFLFPnjWPnSejH+y8Fh6eUHs/7E9bEIMD7f24lkxngE5ssp2vv67wbnSFxt48cPYZ3rSULxvo4rcF25flefBDAeGqRHfkcW4vQlFv8UhUymPPXFH5IEVAeLVzi8I038OtCAVb7uEHZVMROVtZ9hXTC/h5gqG75ATyqgloJWjscMBCKbOaXevaNL6qf3wkLQqaQX1XL1rmCNWDw7DCkI/9NBVc/WzPuR10gfnoWTepCa+P57EyFYmKb3Ff8PTWl4Ce+Py09QPzQz8o70N3+EG0p+N2xVkjW1fU84QvwuOXTCU4jJyUahVuQY1COP4rRw1VhBssL69aIe5e7DbITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diMjfkNCcyUEjctOwWkqGguG6+MGlLIbfxUFHprbz1U=;
 b=cPXn3tHM28WlKPz5BNRXqB4qufgoRXBcSEgKpLqUnzProY/fuIhn1qKJyq3AbWa7NZVZicanBC449ls98ykT6T//qSm5HgjVbC3Z1TjTvmRamE8TskxEIuciN7Qdh39JX2u5SRZvCKykqn7Vxq9XJislNZraOkIU2r+PBmeEbo4/eRr08ambusGxjApP4oN2e99ffVid1V7A4TOhb1dMQOx8LwtDl79RTSo3j6BxtEBHImrqRyEWjgUkSZir8s6d3qfgPCKQK2zfTohUP4cpWJ9vjDBWEMcaZIdsiFzLlXBLAEYjGfPVlM+CK3vcLpJnYcu0ERdK7PTfnJzOoAXDkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diMjfkNCcyUEjctOwWkqGguG6+MGlLIbfxUFHprbz1U=;
 b=qCxWDs7pRwErG/JPnlIQ9RWUtvY3t1BvcB7/c8ad+kVVs3NnxR/855WeT7kZroFHTddEF2hvsVRx+5LIqgstORHy02+jl8mN4cNBRcih8czybLPNxSub3zecfUH/OmeiDyEqhls3CwHYvdo7kJRuiazlOeTn+mIUVJfK2O17q9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DM6PR01MB4044.prod.exchangelabs.com (2603:10b6:5:2c::17) by
 LV8PR01MB8432.prod.exchangelabs.com (2603:10b6:408:18b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.28; Wed, 20 Sep 2023 19:14:23 +0000
Received: from DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::c00b:cb2e:a349:bcbc]) by DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::c00b:cb2e:a349:bcbc%4]) with mapi id 15.20.6813.017; Wed, 20 Sep 2023
 19:14:23 +0000
Message-ID: <9219ad29-b9a3-4f07-81b5-43b4b6d9d178@os.amperecomputing.com>
Date:   Wed, 20 Sep 2023 12:14:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Content-Language: en-US
To:     Yann Sionneau <ysionneau@kalrayinc.com>,
        Wolfram Sang <wsa@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yann Sionneau <yann@sionneau.net>,
        Will Deacon <will@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <xxnggfauhkfum63p5bkgxsu3m5odyjda7pnwpb5ocwf4gez7fh@4lu6qyqy6dvh>
 <37e10c3d-b5ab-75ec-3c96-76e15eb9bef8@sionneau.net>
 <v4hdblxwhl6ncdfxre5gyrve7bgdsorfqpqj53ib6q4tr7aguy@4kfr6ergb3jn>
 <9de89e14-35bd-415d-97f1-4b6db1258997@os.amperecomputing.com>
 <ZQlwC9TCSwWJpuxy@arm.com> <ZQl1zwVkx9n2MPvr@shikoro>
 <da400d3e-a357-1ae8-cb92-728cc4974b67@kalrayinc.com>
 <ZQm1UyZ0g7KxRW3a@arm.com>
 <cde7e2fc-2e13-4b82-98b3-3d3a52c4c185@os.amperecomputing.com>
 <p7wl7fk4cdyhvw2mfsa6sfc7dhfls3foplmzwj6pzstargt2oh@33zuuznup2gq>
 <ZQq2cT+/QCenR5gx@shikoro>
 <ba6d4378-b646-4514-3a45-4b6c951fbb9c@kalrayinc.com>
From:   Jan Bottorff <janb@os.amperecomputing.com>
In-Reply-To: <ba6d4378-b646-4514-3a45-4b6c951fbb9c@kalrayinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:610:11a::7) To DM6PR01MB4044.prod.exchangelabs.com
 (2603:10b6:5:2c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB4044:EE_|LV8PR01MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: bd493f7d-18d5-44fe-8b57-08dbba0dcca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PLEc44ZIlVqARNYFubB7f+0gkPz5QNaT4DBuOlaHNZP9TOEs7uMHrYLDJzsNM/Czi9TckQ1lva8+hSllpo3xKDaGRr51MEyVZdOqEd0gaxAMz8FVxOZc2gbCA5H9Pa3HkAUpI5/VcNvhJXKBnj/Ex3MWIhNh6Umx37IfBymW+029qGrd0YcaiPt0S3Rt8zfkGCa6HmOcS1JJnTAkbbUitL3aZnJylxiodWTcZ3Q4KIGf5f7x8xwsQTHVXAlZvd27h8obvEfXWARUTO9hH9nVWLC29ZqYiH8eoOzBp23Ux7UbajVtib5f5kK3dmevmP8VV8Ywh4vdFxqgIahUZo5xqHJ5jjG3/MYjW0bilrRk840vqQ4mtW/6H0jc00XzZXPzNzY8h1ciIS0qHcZmzLJsEj37qgkDEWRkHbdC8JZjjJw33rWCuADydh1SCVJ/1OTXoCZIMXblgv6V7shlR3JiHG+E/zQgGA/DDeTpbpPzBanWbO577oRPTNwpzHUukYxF8UO62cJsL+MT8td6nntUent5Imc/XI8EF6VyA1EjYE/tCSzYb4D6zt7SGRNlWGTqj7mBUB6HS8HWARTSYy+s02FWJs9TvA8QyejByJXVog/2McUKkggF7FDtp18gTOmLEXSlVL9dGRhC0DBB1obRbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB4044.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(396003)(376002)(346002)(366004)(451199024)(1800799009)(186009)(31686004)(83380400001)(5660300002)(41300700001)(6666004)(86362001)(31696002)(8936002)(8676002)(53546011)(6486002)(921005)(6506007)(26005)(2616005)(6512007)(7416002)(66946007)(478600001)(2906002)(38100700002)(110136005)(66556008)(66476007)(316002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUpEWERzVlNxTk9kSklJbzZTTS83YmRVYzJlNmNzMytKbXc3cHkzTHJISHdQ?=
 =?utf-8?B?OXBNUWwvRzJUZ0p2RUtDbkVtWW1ZWkFVcHNud2JkSHN2TW9md3dCZkFCMmVC?=
 =?utf-8?B?NUNMYkV5N1VkQm5ITjhFbElTZkpSd0tmdisrSXdIVUtyZzBSSTllREY4anZt?=
 =?utf-8?B?L20vckhCTXRnUFQvQVFPQzJmbFVzaEk1SExqbjdxQVFScS9ZVjNyck1hQjVs?=
 =?utf-8?B?VjVocW9IcDJFVm12T1pCOHR5dWFzb3psSnY0ZktPT0VTQ3plMGtpWHZ2R0dK?=
 =?utf-8?B?aldDUXpBK0w1TEsrc3YyVU9DYTlvNU1YQXlJY2x6T3VydDZEbHhJV1E3SW82?=
 =?utf-8?B?UU0zSDhHQ1ZVbk5hdkNhVVM4cjBJWmE2aWc4Zkt2MTV6R1NPSERINEVuSmN3?=
 =?utf-8?B?RWZUeU1GZkY0RUFDclF0NVp0dkp0eWt5bmNzVEdDRWcwR1doRDg4VkdKNDd0?=
 =?utf-8?B?MlVkakp6QVRILzJxZVlJRVlTRG9ZaU14eVBNeExVWUZpSm5qUjdTVFpVYlF4?=
 =?utf-8?B?Y2hJUHRQdHVxVkdQU2RWMGwxcXRFL3A5WFFjK3dBZTU5Y08yemRHSm1YTzNW?=
 =?utf-8?B?U0VMUFhwcmNyTTVwbTNTRlN2TW5tOXFBdTFnR2h4Lzg3cHltM1gzSExHam1E?=
 =?utf-8?B?TmUwVGN3K3U2dHBEckVKdEFuMkZ5R0VUYmk3aGIwbGxudm9GQWMyb2trUmdC?=
 =?utf-8?B?TkhyNUVnUWZGQXZJOXk2cm1xQ3BpSS9JR0IybG5hdC9rbEkxRTc3V3ltWlVq?=
 =?utf-8?B?WWVEWUJ3Zy9OUXhGMFV6cW9OSFRVSHI0K0ZSV21PQlVKWEpES0tFZ05ady9S?=
 =?utf-8?B?bVF1RDQwRG1QV3VpbEZkRWZlazFxOWRyTjVLYkx4aGJuWDQzNU51L0haeG8r?=
 =?utf-8?B?bEdWUlR3K2k3ZnArZUE3VUZWVHhDNmtVNEwydEJIUUxMT2JBQ2NQOVgxMXF0?=
 =?utf-8?B?K3FKdGFYbnIrZFlvOS9neEh2VTFXY3NYTG54WFcyYzR0d2toVEwxd21qWnVv?=
 =?utf-8?B?VVA4OXFKNjh0eVd1S2pNN0hJa3NiMHJFQnVSNUZYSjlERnpHejc2VnRBV0tQ?=
 =?utf-8?B?ekFYUDZiUExsTytkNGY1SEJjRG9aelgyck5vNnd3NmVGLytDYTBKb1pZcXcv?=
 =?utf-8?B?S3AxVFZEbWxVTDA1WE4xOHdZU3lqL0pvZ0ZoS0xrMEx0aE5lc0w3Yk04WjJy?=
 =?utf-8?B?ZlRSem1zeDZiMWFhcEVqOUlTMGZTM0hWZ1MwR0RTYmtQbmNGcHRad09MdTZm?=
 =?utf-8?B?NG9nSDlRMjB4dlF1TmNIUDBnT0IrK092Vis5a3VBQ1hmczZkUzh2N2VtYmwr?=
 =?utf-8?B?ajFWeGx2OEt1VmZGV01QQlgvOHpCZFRsRVZFNVZVaytZbmhNaVM2djJSQWV4?=
 =?utf-8?B?VllKMk96ZHBsc3VVdkUvdDRaaVk2WndHd0YvV2dFeTd2VmJZcWRGdHBFRXBx?=
 =?utf-8?B?MGw3NUJPZEpoY3RSSFJqTnFSYlJidkZmOHA1QkRjcmlDMFQ5VWg0aWx5bTZF?=
 =?utf-8?B?cTRJSW4wRU9QK2VRa201SFBkQlhYcndBdEVYYlBIamxLQ0xLQ2REUDJVQzZh?=
 =?utf-8?B?a05zT1VOTHpqSXFsYWxVMEl5TlJXOUthL09nWXdNRG5WQXVOTTZ2S3JJdS9x?=
 =?utf-8?B?TUp2QU9FdDU1QkdwZk5BY1RlMWwwdFlrK1hybGVRczNGOU1rWGxpRnVOZkZ1?=
 =?utf-8?B?N0hPMGRtY2xhMnQxa0lmeGQyMjMrMjl2QWkvNm5WVHVURXU1eVZ4ZG9pdXZO?=
 =?utf-8?B?NEpkZ29ramFGS3dqVGswdkVYdW05QWs1SW1rdTEzKzBPb0dXdEh5V3FvMlZ6?=
 =?utf-8?B?ZlJJYmlUWEdXcFdoYWNZd20rV3lKeXBtbDBRa3B3ZWJtSmY2VHFaRERVbUlR?=
 =?utf-8?B?RmNBd3V6dmhpcHhpK1JmOVBZd0o3bmpVbEhVWmRmQ0daaTM5N1V5MllQdHBw?=
 =?utf-8?B?ejQ2ZkVYMkltaC9vTitWM2FXZWwvTFg0RTRIZHEvQzQ2U1FJZ0FYbUdiK3ov?=
 =?utf-8?B?NGFROEQxa3o3QVJCSHVUL2MzOVhHQzU2TUpVK1B2am4yVG5OWlgvZW9HY01a?=
 =?utf-8?B?L2dvQlpGdUlpNE1HV1dOcHB6UXlVMTUvUlVGT2F2Z0FJK0pZR2E0UFFrVDdy?=
 =?utf-8?B?QTNVY25laDFKWmRKcEpuZWU5NjVlV2hoenduM1FRbWpVUDR2ZWo2MUtSVGVW?=
 =?utf-8?Q?dAnFr6F60PbHpnyGzJlQ7r0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd493f7d-18d5-44fe-8b57-08dbba0dcca4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB4044.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:14:23.5208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGMTiUc2MtKbX+189noLPocPy145tnndmP8z3m6FmAhu45gANMVkREIk48Du8zQtmu4X9lFD7z/ubV93xlQyU3jTGX9Cdq02dPIuuSu/LLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR01MB8432
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/20/2023 6:27 AM, Yann Sionneau wrote:
> Hi,
> 
> On 20/09/2023 11:08, Wolfram Sang wrote:
>>> same thread." [1] Thus I'd suggest the next fix for the problem:
>>>
>>> --- a/drivers/i2c/busses/i2c-designware-common.c
>>> +++ b/drivers/i2c/busses/i2c-designware-common.c
>>> @@ -72,7 +72,10 @@ static int dw_reg_write(void *context, unsigned 
>>> int reg, unsigned int val)
>>>   {
>>>       struct dw_i2c_dev *dev = context;
>>> -    writel_relaxed(val, dev->base + reg);
>>> +    if (reg == DW_IC_INTR_MASK)
>>> +        writel(val, dev->base + reg);
>>> +    else
>>> +        writel_relaxed(val, dev->base + reg);
>>>       return 0;
>>>   }
>>>
>>> (and similar changes for dw_reg_write_swab() and dw_reg_write_word().)
>>>
>>> What do you think?
>> To me, this looks reasonable and much more what I would have expected as
>> a result (from a high level point of view). Let's hope it works. I am
>> optimistic, though...
>>
> It works if we make sure all the other register accesses to the 
> designware i2c IP can't generate IRQ.
> 
> Meaning that all register accesses that can trigger an IRQ are enclosed 
> in between a call to i2c_dw_disable_int() and a call to 
> regmap_write(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_MASTER_MASK); or 
> equivalent.
> 
> It seems to be the case, I'm not sure what's the best way to make sure 
> it will stay that way.
> 
> Moreover, maybe writes to IC_ENABLE register should also use the 
> non-relaxed writel() version?
> 
> Since one could do something like:
> 
> [ IP is currently disabled ]
> 
> 1/ enable interrupts in DW_IC_INTR_MASK
> 
> 2/ update some variable in dev-> structure in DDR
> 
> 3/ enable the device by writing to IC_ENABLE, thus triggering for 
> instance the TX_FIFO_EMPTY irq.
> 

It does seem like there are a variety of register write combinations 
that could immediately cause an interrupt, so would need a barrier.

I understand barriers a bit better now, although still wonder about some 
cases. Like say you write to some driver memory and then write the DW 
command fifo register, and it does not immediately cause an interrupt, 
but will in the future. Even without the barrier the memory write would 
typically become visible to other cores after some small amount of time, 
but don't see that's it's architecturally guaranteed to be visible. This 
implies the barrier is perhaps needed on many/all of the registers.

Jan


