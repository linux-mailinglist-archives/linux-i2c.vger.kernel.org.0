Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92DBA55FFA2
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 14:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbiF2MSq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 08:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbiF2MSp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 08:18:45 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70095.outbound.protection.outlook.com [40.107.7.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC7DAE2A;
        Wed, 29 Jun 2022 05:18:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBYkiwd/7Or1+CBmqrtqRPDAihzkrsHQq5lNm0vK+R17deW9nbX3MJIAhZEK7A99zctFeLU1gBUWJn8iP4R43YTAI8s9DKiKX6Xg2C95eJCO8nU7yKvB6dlryWA35b1xzOKgc+ta1Ay3pU/vvCslujNcfqHb4wXEHuekVGQyxs7qJ1KyUyrzUYsg4WCUJWFnBkzuZc3UCqQzP0voitY26Qkt685g065cMieNaNDTGPuElJAM64E+ejjmmeumYC2a2EvWb0KocOkPzBcT7DOnfyeQQ7z/GDaGhRJSV7ynJvo5W/gCQlJz+QZo2xVteCppwM1Yp4EkvZSSysaVWsnHig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hr75VPG5Qvuu0VtGDFq/5npsWmiQlLIRLzdoQqlSGx8=;
 b=U2adlM98kcDJp6qXNa5VscfFmwS9wNPMsfZvl10LeMiGQ/+nk+OvuQSWr1DEHmRSLKoRbXXNxLrFRXxppEob4n1LYob75naaLv9zMeIVNu02tynlUKqSD7lbsdEiW5FNRF6XELoZdn1jBfFycrBygxicxoc3AImoSufWc9VZlu8gIHHLKXgtGJcK7cp9Hi/t5WVX7Teis08RnT65vbSddUQqZ2GIklLHQw47rKpLs1Xygt+4Kj2KG7Ozk41JHuiTM5qUN9Mn3RISTdK74+k8RZVO99QGq+j+sr1BQckHxhyP1ttxPIrPDnQz1HfioOZ90qgN6PDyB1Vp6dq8wtgWvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hr75VPG5Qvuu0VtGDFq/5npsWmiQlLIRLzdoQqlSGx8=;
 b=Rtb7w/7e5cy+vBVLv9n+qOodwhKqX86hSowcJtFfxKjHtrMhdFQ4mgCp3z8U4hkxv6iXBuMkxoHZ/SDMtLujedjgRF80cpqfszm+k4ZGhAj42o5tSh/0o2xnk5L2YILX27K4PG3PFotuDJRSRfnLbXeEgoOCJVguF8Zg02PthZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by PR3PR07MB8242.eurprd07.prod.outlook.com (2603:10a6:102:179::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.11; Wed, 29 Jun
 2022 12:18:38 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::8885:ac49:4a47:2293]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::8885:ac49:4a47:2293%9]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 12:18:38 +0000
Message-ID: <9d90d39c-c5ce-409b-9b87-71592dcca1cc@nokia.com>
Date:   Wed, 29 Jun 2022 14:18:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 01/12] i2c: xiic: Add standard mode support for > 255 byte
 read transfers
Content-Language: en-US
To:     Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>,
        michal.simek@xilinx.com, michal.simek@amd.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com
Cc:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
 <1656072327-13628-2-git-send-email-manikanta.guntupalli@xilinx.com>
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
In-Reply-To: <1656072327-13628-2-git-send-email-manikanta.guntupalli@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR05CA0257.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::33) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a0cb7db-fcae-4b78-e4b2-08da59c97f42
X-MS-TrafficTypeDiagnostic: PR3PR07MB8242:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uCS0qA1DMtFybnUex9OB9pmiYgKHpSWAtp5y5GSe7VROPn6vNzvnEjHzPD8zm+K5mwwbzCXC5wIuqQuaPreg+xmeciZHjLlGiPOqVDm++k89C2CsOnCreGl6oxPN+ZqaQBd1TGOKpr9LLrXLFDehH5PuvEQJAiUie0S+MMMh33k5TMQgouL+SkOc4I4djmdr1/69vK1TFyo2JUAtkSOsCR1sMg9xGVmGHZFuiaPVM45jb2xxQGgHmDecGa+O7S4bi8aBCYD0tlJ8i5iDIugD3zSNIcD5Bk5xdI/W2FT9Krw++kUYE8Gjhv9QiQtPIzS/o973/mTJWkKpJDiwos7TcB/FbEh4b1GYFlHI1fXI40M5CrqZaEdYxTwYX2e+Q6/8Y7crnO2Gbf5/+MVca4JFr9AR8RVtG+jNlqS7IpZvtsFQ3VvYWg7FFW+nF/3ek+RMuIhqoS5KqrhCbZyJTPeqSrSryvkKjBbjEZwJHzTgtIi62J8yBEfQYvbf5h6qpkfj+uJ6yKaZcNrhi7d0jU1a7xjvj+LywohAhtBkXxkqwL3DcJBL0e9cGMRGwLgg2K5LlDuYMZdw8pZ22gyUU4cn2Q6qUMJqxOXcin0bnaBk3lMgsVhdeioGPxnc8CQ/lhndT/RY44vQ+bF6N92pLVbAAQDqsviNTifSJl95mkhpsogxw+v/YF/mYWjUS4M2P/CuhyPFMixIZ5VM3kSARTCkkdEdn3xHH+/+bhbvoO53T0Gr8oBbvqC+F3cbkwrruvQOKqAzTWZxjl3egrbpLdRqLS3skWsr+akYQQHH3qODEU+snStYkbG6Kq7dZzVTtZSc6DMuR9oTSuTaSr8kJBRiJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(5660300002)(83380400001)(478600001)(82960400001)(36756003)(8936002)(2906002)(4326008)(6666004)(86362001)(31696002)(66476007)(66556008)(66946007)(6512007)(8676002)(26005)(41300700001)(38100700002)(6486002)(44832011)(31686004)(6506007)(186003)(2616005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aElkT1NYdU9NTXNlOWc1bWZZU0loaUY0aDVQT0FibTFlbVJtK2tVTUhqbkN1?=
 =?utf-8?B?SkVMaVk2Q0hzc2xZNjh2NVdnT2doK2JEL21nbWpJTzJNOHQrdlVwbU8wMFFs?=
 =?utf-8?B?MTIraDRvV05XazczNWl3SHdYaDEzQllYZHdLRE5oYzBXZTNINSs0SGVtbWJM?=
 =?utf-8?B?eUZpR1hKOXFrMExKMHFCNk1Dbnh4cUR2bEZEalUzL1I5MDFZMVNsYzI1RHh1?=
 =?utf-8?B?bDFZbWNkTEI2WmRCYWZHUzZyNVJJWFRMbUtlU3U0WmxDTGt1Ulh1VHFtN0ho?=
 =?utf-8?B?T1QrWTg5OUhNTHQzdHZreUZNaU1yZmVacXJJM2czVy8xanRNbk15N0M4UXdP?=
 =?utf-8?B?eXM3RzU5UFJUMXFsTWp0ekZ5YkNJQmttb09BUVNxaHprOFkvUXV1aWtra3U2?=
 =?utf-8?B?TmN4Um5rOVJGOVdpY3ZjTi9yTnFaZjdQYWtxWWcyVzBRemtydnBYMVgwaWlm?=
 =?utf-8?B?UGlCT2lqUkMyN0M0ZUYzb0k4UENsNWVJN2ZGc21YSEQvaSs4cFhlTTd5UzZx?=
 =?utf-8?B?eVk1bDhINmlHaExOU2ZHTjVDVExUY1lNaDUvQTVwZDV4WnFwQU5mTC9QemJK?=
 =?utf-8?B?RU5IQXpUdi9KZ1J2MHpDM0N6ZlBvZlBnaXoxWUpqR2pjYUhUODN0Z1NKNEZo?=
 =?utf-8?B?SjljZUVsbWRzOTFqZVE0cDgxcU1SWDBkN3RjczA4a29DVWFVMVhsNEl0YXAz?=
 =?utf-8?B?elJzY3pWNGZLNkZuWFFNSnpJM3VTRVFXSVd1YWd6eWsvYW12MkZFN2FRQ1lJ?=
 =?utf-8?B?ZzdpTFJWM0c0OTZva04yOEpodnhIQUsyVUpjRWZFamxlQm5iWnZiamlHaHFw?=
 =?utf-8?B?b0EwSTA1K0xFQWhPNHZ6c2s1Z25KOERaUVZKcWZtazVRMjdrRytudkNUbC9C?=
 =?utf-8?B?UFBaQ2pqTXFxckNweGh3WjNBcUZ6amU5dzlqYWczc1dXWGhmSlNMNytJTHdJ?=
 =?utf-8?B?bDZEdTZJZVJNRDRFdVJ6M2xLaU9VV2l3NklHQ2IvRUwxUUdhdFVnelc3Y2s5?=
 =?utf-8?B?Q3BRNVdyYUFkOWMycFpsN1dkTnVaOFVzU1Z4SEZqd2Q2TFk5a2huc3g0dVBT?=
 =?utf-8?B?QStrUnpqR0hJdUZBdkFrVWdqaHNvamNyZmRta3NwanFzQ3NpYzhtWlBwNU1K?=
 =?utf-8?B?dHlEdEphcmRDWG1nd3h3YysrYkhHaEx0eTAxWFExYW8wTEZnNXgxMTFlREhv?=
 =?utf-8?B?R2VrZXg3aHZ6MFFUTmxUNmRSSktpdE9GSEd4Zm8zUko4NHBmZWNHQ3NhOFdu?=
 =?utf-8?B?YkNUcURxcC9ma3R5U2p4V1JPYjFVdDRud0tVTnhNRmRlVlNsZ2ZFak1ybU1a?=
 =?utf-8?B?LzEyMVdLRXlQMTRVUGFVOWw3RWlsbGNVdW02NCswRUdLM2NNZWd2TVBuMExE?=
 =?utf-8?B?TkVHZ2xVaytQNGdTdytLdkhvRzVmdUdlTlZvNlJjNVdWbXg3WXUwWDBOTWFs?=
 =?utf-8?B?bG1zT2twSEN3WWJ0ZndSVVNGbG8rMzNGWlc4L2J1RGplWVAyUjY3QUgwdkdz?=
 =?utf-8?B?QTJhZlFpd25wSHEzUy9oOW1MMDBhZ2RyMU5PSElwcmZwWWlBMExxOEM1dG1X?=
 =?utf-8?B?d3lCMWFMWVRCdmJ6eE0yMGhIdEUwY21PQzUxK0JjQUFneFVMMnlBWk8xYnEv?=
 =?utf-8?B?UmI2SGxsMCtFRWZHbmU2emlISENVUUJJaEFRK2NFbjdzZmlvSnJianFqUTBq?=
 =?utf-8?B?UnNPcFRLRlRscHNQOFNLTC9OSEdpaWVid09oZGNjeVIwM2xCaDVCTTNBNWkr?=
 =?utf-8?B?TDNzZkhqMFA0Ri9nbEhLYll6cVYvU2R1NE5mc0lZdHB0NnJuajNnV0ZJTllC?=
 =?utf-8?B?bDhucldGaHhIV2tsejRJNE9LVjhjMUlVTStJdklJSlk4Vk1BVDhtdGhxeU5Y?=
 =?utf-8?B?VlY1c3A1ODFvcnRodlExb1Zma3pOZUNzcC9vemp2YVNFMURQWCswaEFLTFpK?=
 =?utf-8?B?bEhHWlgraFhDdVZDMUJ6eU0xT3V6Lzlvb1ZjcUFmMk53anJWWFhBMUpiaVBs?=
 =?utf-8?B?U2dkbEtqSVdDK3BRYzFZWExhem4yaVNGRVJybHl0a2RrYTc5dHhRWVUxdUN3?=
 =?utf-8?B?WGFkUWowdGFZYzltekdFai84cjR4eHI3THQ3dmhQSUtLRmxIemlmSSs4eG8y?=
 =?utf-8?B?NHI2YjlBSmo2MnQ0c1BSV200cnd5c2JXQVhlTnd0R2FGdC9BYjdJd3g2bk5x?=
 =?utf-8?B?UkE9PQ==?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0cb7db-fcae-4b78-e4b2-08da59c97f42
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 12:18:38.6610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 36/DHD2K5S881/cLxrR1MG0zb7YEoqmcawxFbc/eWhzoQ/MVtmHw3szSE8E1i+bWeDK3LP5LOZlyhY9o3NqSstKhkHm7oh43j6j6NYS5yTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB8242
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
[...]
> +static void xiic_std_fill_tx_fifo(struct xiic_i2c *i2c)
> +{
> +	u8 fifo_space = xiic_tx_fifo_space(i2c);
> +	u16 data = 0;
> +	int len = xiic_tx_space(i2c);
> +
> +	dev_dbg(i2c->adap.dev.parent, "%s entry, len: %d, fifo space: %d\n",
> +		__func__, len, fifo_space);
> +
> +	if (len > fifo_space)
> +		len = fifo_space;
> +	else if (len && !(i2c->repeated_start))
> +		len--;
> +
> +	while (len--) {
> +		data = i2c->tx_msg->buf[i2c->tx_pos++];
> +		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, data);
> +	}
> +}
This function looks very similar to the original xiic_fill_tx_fifo. The
only difference is that it does not decrease the len in case of
repeated_start (btw, why?), and it does not set the DYN_STOP bit. But
this could be done conditionally based on i2c->dynamic, instead. No need
for this duplication, in my opinion.
[...]
> @@ -579,31 +681,99 @@ static int xiic_busy(struct xiic_i2c *i2c)
>   static void xiic_start_recv(struct xiic_i2c *i2c)
>   {
>   	u16 rx_watermark;
> +	u8 cr = 0, rfd_set = 0;
>   	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
> +	unsigned long flags;
>   
> -	/* Clear and enable Rx full interrupt. */
> -	xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK | XIIC_INTR_TX_ERROR_MASK);
> +	dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n",
> +		__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
> +		xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
>   
> -	/* we want to get all but last byte, because the TX_ERROR IRQ is used
> -	 * to inidicate error ACK on the address, and negative ack on the last
> -	 * received byte, so to not mix them receive all but last.
> -	 * In the case where there is only one byte to receive
> -	 * we can check if ERROR and RX full is set at the same time
> -	 */
> -	rx_watermark = msg->len;
> -	if (rx_watermark > IIC_RX_FIFO_DEPTH)
> -		rx_watermark = IIC_RX_FIFO_DEPTH;
> -	xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, (u8)(rx_watermark - 1));

Do we really want to write 255 to RFD if msg->len == 0? That will set
the compare value in the RX_FIFO_PIRQ register to max value (15) but I
don't understand why we would like to do this.
Also, bits 31:4 are reserved so I think we should not try to touch them.

> +	/* Disable Tx interrupts */
> +	xiic_irq_dis(i2c, XIIC_INTR_TX_HALF_MASK | XIIC_INTR_TX_EMPTY_MASK);
>   
> -	if (!(msg->flags & I2C_M_NOSTART))
> -		/* write the address */
> -		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
> -			i2c_8bit_addr_from_msg(msg) | XIIC_TX_DYN_START_MASK);
>   
> -	xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
> +	if (i2c->dynamic) {
> +		u8 bytes;
> +		u16 val;
>   
> -	xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
> -		msg->len | ((i2c->nmsgs == 1) ? XIIC_TX_DYN_STOP_MASK : 0));
> +		/* Clear and enable Rx full interrupt. */
> +		xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK |
> +				XIIC_INTR_TX_ERROR_MASK);
> +
> +		/*
> +		 * We want to get all but last byte, because the TX_ERROR IRQ
> +		 * is used to indicate error ACK on the address, and
> +		 * negative ack on the last received byte, so to not mix
> +		 * them receive all but last.
> +		 * In the case where there is only one byte to receive
> +		 * we can check if ERROR and RX full is set at the same time
> +		 */
> +		rx_watermark = msg->len;
> +		bytes = min_t(u8, rx_watermark, IIC_RX_FIFO_DEPTH);
> +		bytes--;
Again, do we really want to write 255 to RFD if msg->len == 0?

> +
> +		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, bytes);
> +
> +		local_irq_save(flags);
> +		if (!(msg->flags & I2C_M_NOSTART))
> +			/* write the address */
> +			xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
> +				      i2c_8bit_addr_from_msg(msg) |
> +				      XIIC_TX_DYN_START_MASK);
When reviewing this patch, I tried to understand how the controller
knows if it should work in dynamic or in stanard mode. My understanding
is that in order to start the dynamic mode logic, we have to set the
DYN_START bit in the TX FIFO when we write an address there. Is this
correct? But we don't do that if I2C_M_NOSTART flag is set so how is
this supposed to work with this flag? I mean, does the controller really
supports doing I2C_M_NOSTART in dynamic mode?

Or does it support it at all? After all, when we skip this, we will
still write to the TX_FIFO register 5 lines below. How is the controller
supposed to know that the len that we write there is *not* actually an
address?

That being said, we do not annouce the I2C_FUNC_NOSTART support so maybe
we should not care at all and just remove the code handling the
I2C_M_NOSTART flag?
> +
> +		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
> +
> +		/* If last message, include dynamic stop bit with length */
> +		val = (i2c->nmsgs == 1) ? XIIC_TX_DYN_STOP_MASK : 0;
> +		val |= msg->len;
> +
> +		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);
> +		local_irq_restore(flags);
> +	} else {
> +		cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
> +
> +		/* Set Receive fifo depth */
> +		rx_watermark = msg->len;
> +		if (rx_watermark > IIC_RX_FIFO_DEPTH) {
> +			rfd_set = IIC_RX_FIFO_DEPTH - 1;
> +		} else if ((rx_watermark == 1) || (rx_watermark == 0)) {
> +			rfd_set = rx_watermark - 1;
Again, do we really want to write 255 to RFD if msg->len == 0?
[...]

Krzysztof
