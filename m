Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC1127A6AED
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 20:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232441AbjISSy3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 14:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232362AbjISSy2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 14:54:28 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2125.outbound.protection.outlook.com [40.107.223.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF5E9D;
        Tue, 19 Sep 2023 11:54:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5Sukd6fdW5UKd/DxiqtrbZ5ktCGaTsUAo0OaS208BWPtcwm5TzxxMS9ic47tziSWCwcMg0DHnI8NQL5mOeKdkXhk28Gt5E0skIUSaegtb9qyvE/uux3YKwsY80PyyBcGWi1X2Q7/V+zfi6TVL5smekdepJ2BUg1DtkLviPU1bIKLdaOiWCiJLTji0qhjqx125hEQzh05F0FMJadkR5IhXNJg0yGwpsFfVxql4D+Yggg5tdzmPSd8hK+JabUuh1Cn99KHASCMvTDzcavc4embp+Ec/mTyEynwxjOMnibmnTtZlghtl1V1DKakqmcBEbrx8MXAdJDB22cIiwsO7iysA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbHVfAUsfONtzHRRpCmVRcaEGL/yaY+08R4+FLQsp0c=;
 b=bOM8oSphGd8khHWExBlFFxfqRNabXJiMOWVMGL9CwlVHqg4rYBxo5Kaba6H/ThAN+rD1pzu4bkAhHeTvAvwUGVdJjnYtUd67/E+h8P0DCSaOMmYcHg5ZweQEIQpY1VeiyIzy1HH1DEyIF/0ycxG8U5MKKmj1x4lnAiV1g2uRcwqlw3TPlqjMn3Oi3D9wnOjpfpKBewlaN59DU+2fYtRGFV5unXh+fMAjP0YekjQsK2OODcUzenbMraGe7Fz2pApfDwMIg8yllet0OT/lBoyvLNg8IXDhOQfcf68uMWkCbYUxpyndkU0wPGDnauoknYTAThJUqN0/72osHMuGw4b5Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbHVfAUsfONtzHRRpCmVRcaEGL/yaY+08R4+FLQsp0c=;
 b=ob/FPMuqymWzrrrfZsMs9tUQmI5WBtdWQKAl0XpLMxLJPgc4Nsi98dVIoGbi0ltnkHOOD7azm3jjZ0ybztD0X13ZByWJDhwqmKq/7RiKApvqPeO3Lm21aQPrxadvFhP95BiDxHZNLrkDXYRE4OVuM8mthMzgQXBCNDI+7OkerjE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DM6PR01MB4044.prod.exchangelabs.com (2603:10b6:5:2c::17) by
 CH3PR01MB8313.prod.exchangelabs.com (2603:10b6:610:17c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.27; Tue, 19 Sep 2023 18:54:15 +0000
Received: from DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::c00b:cb2e:a349:bcbc]) by DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::c00b:cb2e:a349:bcbc%4]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 18:54:15 +0000
Message-ID: <cde7e2fc-2e13-4b82-98b3-3d3a52c4c185@os.amperecomputing.com>
Date:   Tue, 19 Sep 2023 11:54:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Content-Language: en-US
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Yann Sionneau <ysionneau@kalrayinc.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Yann Sionneau <yann@sionneau.net>,
        Will Deacon <will@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230913232938.420423-1-janb@os.amperecomputing.com>
 <i6h72feyrvo6pajo67b346masyxt7ycpfj46mvrfp4o7suh4ud@xuv5lu64s75m>
 <a7a85428-d40d-4adb-8f84-75e1dabe19c9@os.amperecomputing.com>
 <xxnggfauhkfum63p5bkgxsu3m5odyjda7pnwpb5ocwf4gez7fh@4lu6qyqy6dvh>
 <37e10c3d-b5ab-75ec-3c96-76e15eb9bef8@sionneau.net>
 <v4hdblxwhl6ncdfxre5gyrve7bgdsorfqpqj53ib6q4tr7aguy@4kfr6ergb3jn>
 <9de89e14-35bd-415d-97f1-4b6db1258997@os.amperecomputing.com>
 <ZQlwC9TCSwWJpuxy@arm.com> <ZQl1zwVkx9n2MPvr@shikoro>
 <da400d3e-a357-1ae8-cb92-728cc4974b67@kalrayinc.com>
 <ZQm1UyZ0g7KxRW3a@arm.com>
From:   Jan Bottorff <janb@os.amperecomputing.com>
In-Reply-To: <ZQm1UyZ0g7KxRW3a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:610:4c::15) To DM6PR01MB4044.prod.exchangelabs.com
 (2603:10b6:5:2c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB4044:EE_|CH3PR01MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e2aade-0145-40d4-8153-08dbb941d22f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CVABCn2zA8kauetDrVtlH5YAy3MAK25vz1tdwblKrjeSuioUhv1kx+/T2kRNwfw47a4zJA0XEB62tt5b3Y3UmkZPgpxS8qUJfOr0tINRM2y4KJ0/jk7+OkdmkGGlBz8/xXyJnwcVxa/HzA/M9z114At2OrXtjyHiNJfVZb5YrHIwYWJone7Pg8XJH1STP50qhVh3RnPufbe9yByAwtkocamqIcMSELxxDVHyocmYUU9M/dw+qA5+o5cGxOLYe8SG5bFauCT3Q8buAd/ylr/e/xh3fxSkd5CEXkDZyWkiptaft6J9GRFbfbJ6yAHkurIrfjEvhJGtalkbuQ5KVvxxI/+VisHpHziytizZGQEqXTSeB8U4rhJ7FneG4HqEZLe4kS4x2kXHzVy0f/kUrkObEkNBOpxEEIgT1SlS+en4RQvy8P9o1ZyFpjrQNc5HWbv9zjGw2J//9TiOwoEbMRpEoPlI8P2Xdnshod7J9oHpQVUXfO422K2FcVmlt4Q+WiJZn/paao4dUZKnBlWFDEsS4hEMrgs55Yq0SydLo054+vI9YmBfLLDvJ1z6m/DdjzsUyheMx+4JAf0+iFxWK7kfYNdF+9x064fMi5wWaCH6OQk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB4044.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39850400004)(396003)(1800799009)(186009)(451199024)(2906002)(5660300002)(26005)(41300700001)(7416002)(54906003)(66946007)(66476007)(66556008)(316002)(110136005)(966005)(478600001)(8936002)(4326008)(8676002)(31686004)(6486002)(6506007)(53546011)(6512007)(2616005)(38100700002)(6666004)(86362001)(31696002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWJoYTJTNHZtREV1VGprcDVwWm9XYlVUalh6TDIvZ1JRM1QzUzNja2VzYzVj?=
 =?utf-8?B?V29Ib0hhc250ZHRaYmpZdFJSeTVFZ1RJYldKZndDa05OQXJXQzZxYXRTSUd4?=
 =?utf-8?B?anJCSVFmeUpsSy8zZWxBUUFKRmdRcVNWSys3ZW9CUWd0ZXhWUVRydjhVL2Fl?=
 =?utf-8?B?aXhHVDVxQmk3RlhTOFBjNU9ubmZNSHMzWEdjUnhGdGg4WExibXVYdzZDeWdX?=
 =?utf-8?B?VFhxZFgvN2dNNitINHVONCtlL1JVM3ZoOG52Wmg4N01sWVhpaTJ3MHZhWEo4?=
 =?utf-8?B?ajZiYndqSlBveGZ6ZnpRMTFGWXRQcm5XWTl0bFhXcnZwVGRpM1VNdmQrbkZt?=
 =?utf-8?B?MEZHd21vUElHa3FIOUZheXZ6b2k2QTN4YzV5d2NGT0RlS3k0a3N4RzhtUTQ1?=
 =?utf-8?B?VGhIcmdMY2Nja2YwVkxYN3o2T25OR1BoWFBQdk9kRUxsS2NicWJESkIvNmVD?=
 =?utf-8?B?U2JwR3B4T0pQZ3dtTVhZYW04UDJOSWtsaGdKVUYxcy9rT1dpTEk1SmtQcWdy?=
 =?utf-8?B?V3FNMkdGK0FQYUtoQjNWUUZSZGZDY3M2ZktpZS93dStoSXJEQTY5WkRuU0Ix?=
 =?utf-8?B?RFk5bHlENG0ybTVoNzRsMTQxaVd6WHNqWTVHZmJNL1QxOENNM3NwYXFTRnZ3?=
 =?utf-8?B?T2RCeU16YkkvcHd1VjladkZVOW5sZndKVENQWmx2ZisvVnJLbCszWWVuZ2ZJ?=
 =?utf-8?B?ZDd2cUJIeWQ4MkRRVlh5YkdjWWtwbTQ1N0gxSFp0VnBXMDBLWDhZdFdDTUo3?=
 =?utf-8?B?VWgvYXZkQXZubEkyRXU5bjB4VENkbTdHYVB4Z1ZOUWVDOWprTVBVRFJlZkhO?=
 =?utf-8?B?L3AxUEVWNHpteWM4dGxtTk4vRW05VGJUWTdXNUdWcWF0Q2RSZitpckFmb0dv?=
 =?utf-8?B?eDBRZE13czlyM1gyL3FhUmVLZlBOQTFUS3ZYWEQ3MHlZSjJsMTh3NG1ZSFov?=
 =?utf-8?B?UFl3Y1ZkcEE4ekRac0pIbXQ4cDhSd2JEcWhJZ2VZR2wvajNKOFRSNVNEdkhw?=
 =?utf-8?B?RGdzb0YyT3ZNTmtOOU4veGdvaEdaNVkwTXE2QXZRYlpFYjc0T2pLZEFveENU?=
 =?utf-8?B?WWJKRFNvbi9jdkR0ZnlxQVBMZUxwSzFDbmVRTW16TzNvcmk5YVZ5SDgvQkJs?=
 =?utf-8?B?ZnRiU1ZVVkhqWTJEVEhxaGxOdVBrVCszekNJbFJUT2N3V0Vqb0RzWm1Zc1Fn?=
 =?utf-8?B?VUpPdHRtUUVzYXlYZzcxUzdwVE41L2YxbG15Wm5zSGZEamZlcENodnJucGlk?=
 =?utf-8?B?cGhvREhXRmJUT2Rzam4vVHFudnhmbWp4UCs0VURMT1dtQlU0NndIbUIwZXo4?=
 =?utf-8?B?QWorVHBxUkFLa1g0dlArN3l2alBsTlVYbHNLV0JYWXpDTUZJRHNPZHVRWlB0?=
 =?utf-8?B?K3VKdFNsVVcvZkZsNGpIcGt4Z2pZQWVpY1dvN0VPMGI1Y1FOemlYVXFGWEg0?=
 =?utf-8?B?U1EybXVIOHhqS0Jxa2toZ1RLcjJabWpXZzFWYm0zYjZ6MmNsMVFNWmdqWE9Z?=
 =?utf-8?B?REFYSnhvc3NqbGhZUGZNbzhzVURYNUY5TmlBY2FGSEwxaGNjNVVBK3JYNk40?=
 =?utf-8?B?Nk95MWdqN2E3N01xMUw3UzcrMlJGWW5nT0xJNDFWSW5EL0wySTBuUnVUREFq?=
 =?utf-8?B?WmtXbUkrbndSdFVYdWdsekhqdnRMbHpNM3RLTWNBSlZIV3NLRGpyM2VKK1I3?=
 =?utf-8?B?L1UzMDBRc3VsTWxCOXZkTk9yYzgvR1VvWDhWeUZScCtwV1cxdzN0NmsxVUw0?=
 =?utf-8?B?Znlwc1FyRWU2cWwxQ2xZenpZMXk5RWlYaGVZRExkcXlZZHpxWno4ZHp1d0Ur?=
 =?utf-8?B?N21QK1M0TzF1aUZjVnVEd25EZFFjTU1jT3lOZzhpTTQ5OGhJRW1qVjBEMU1X?=
 =?utf-8?B?NFVpaHE2SjdINU80cUw2R1BQSFNkdXdxclpaazhXRXpTbUxBQXZ5d2R5MXB2?=
 =?utf-8?B?ZW5XY2Y3Z3VVNVp3QnhqckNIYmhKR3FFVEdDeFhweDk2MzJHZFk0dWJhK1ZV?=
 =?utf-8?B?aEljcE5FYVltMmFQWFQ4MUtONksrU0R5N1lMcnFpZHRVVGJ3bWZvbnFWSmNt?=
 =?utf-8?B?alhZOCtUR3lMTUFYVXl5NTBQS3JHbHpHZU1aRlNmWTBZeU0rRDN6MXkyZk5k?=
 =?utf-8?B?THRpRno1dkxlQnJTMzFnMUJwT25yclJ4T2p0NmtZREpVRkJXbW9JeEJCdnc2?=
 =?utf-8?Q?HpCVl0ZW1piJvNGShtsHbHg=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e2aade-0145-40d4-8153-08dbb941d22f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB4044.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 18:54:15.4419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtlMrdmDL19cHVrog7XDi2vL0O1P5XOTcvlq8GrGUUCaHgfMRzKIGJeE/gjOjP+SzZnW4HtpIM4zUhY63jGnaFUw54ixYpB25+H6IajUAhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR01MB8313
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/19/2023 7:51 AM, Catalin Marinas wrote:
> 
> While smp_* is ok, it really depends on what the regmap_write() does. Is
> it a write to a shared peripheral (if not, you may need a DSB)? Does the
> regmap_write() caller know this? That's why I think having the barrier
> in dw_reg_write() is better.
> 
> If you do want to stick to a fix in i2c_dw_xfer_init(), you could go for
> dma_wmb(). While this is not strictly DMA, it's sharing data with
> another coherent agent (a different CPU in this instance). The smp_wmb()
> is more about communication via memory not involving I/O. But this still
> assumes that the caller knows regmap_write() ends up with an I/O
> write*() (potentially relaxed).

If we wanted maximum correctness wouldn't we need something like 
writel_triggers_interrupt/regmap_write_triggers_interrupt or maybe 
preinterrupt_wmb?

The ARM docs do have a specific example case where the device write 
triggers an interrupt, and that example specifically says a DSB barrier 
is needed.

If I look at the ARM GIC IPI send function gic_ipi_send_mask in 
https://elixir.bootlin.com/linux/v6.6-rc2/source/drivers/irqchip/irq-gic-v3.c#L1354 
is says:

         /*
	 * Ensure that stores to Normal memory are visible to the
	 * other CPUs before issuing the IPI.
	 */
	dsb(ishst);

I would think the IPI send code is very carefully tuned for performance, 
and would not use a barrier any stronger than required.

I believe dma_wmb maps to DMB on ARM64.

- Jan






