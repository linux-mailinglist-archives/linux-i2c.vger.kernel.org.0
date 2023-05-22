Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA2AC70B90E
	for <lists+linux-i2c@lfdr.de>; Mon, 22 May 2023 11:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbjEVJg0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 May 2023 05:36:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbjEVJgZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 May 2023 05:36:25 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2073.outbound.protection.outlook.com [40.107.8.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A659D;
        Mon, 22 May 2023 02:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXR8EVb49UwgivwA/RChv5I0TG7fR7AGkN5V5cXuqVMeX9WyG1UM8qH6G0RSssQMBp/REcM4uqWLOsTRA2I2whGUP40Qg6vGxubzFiYGWllIa2+MhMaw2J5cNb3ArDx0uY2ocLmyp8OasUUuZ2SNUEcAFSzyCFsi0Ol+EF5QidXdkIQavZlNwBFWeuHnN7f8EIYMhotwxvQZ62Eq4CYetx6CYeR52LEG8KWkdxHKV89ntW53Tf55XZNjuwiLJnqukyChUpyuSpURIifw/p6yPj+hYeb4SCPJtWBkwQWwVdAgH3AWodthDyRUNTzXb/TU2npRnaDKXQxqz9IN28nQsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gME1iF7kjz+Hdzye0yRQsLtOaFAf2L1sKo2CgAtTJqY=;
 b=ghWoEwvHgPRBwu7kQ0gtj949+Sx3V257RSODiB4LZSwYGgHaBPZSmN1l8DP0bknzdoYl4EuBdyac/W+9v+0D8b+gRB48YMTiOmMnxv0XH32WQxCeo6UlPGPSgIdJCw/rb08SRkmzYiz9sRr8qEOpCPNUR8EV5yjCPf7kc/4YUb5aEKMTG0V52JC/OkWh71UaCHXGGN9vnvpe9SqA+LV74ggmTOApO61VcbDwPevOR1yc6IzbzOD+tmiE2YdXSe7jPOqozR/goi1EqU55TqaXoyavinqAMKGEqdPFdapNEHua0lBZbcIFR6ryG6FuMPA1UklJIQguhBAlHblPZTPxZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gME1iF7kjz+Hdzye0yRQsLtOaFAf2L1sKo2CgAtTJqY=;
 b=ny3sjSb3endfhjx+kxsSErKDoUI6pY4jdBi9mza/jWvK6YBWJs+qw7LyyNO0KEp/BXZT4UIBWbR+XcrY+pT8MVFIBss21ra935RvAyjbGZcsNWpyFYMFCLYEfs+7wGrc29cuHuI5qhV0/sXbnVbKg/ptNXGdBNSDr3S/wBwZO/zvz3bJbg4XCPQWh7THacyrLITY0i2O+9e1ib0EegftrI6mhQbJL3rGf95pDqSGdoip8aXGRQEvtknro/ewyiSQUpK00+gMEb5mt7YLI8/ST/twutsIuQloTCz5CsbHsx2PReVXxsID8Jp1qGX4+wRtM6jqr90Y/E+IXQOizggQsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by PAXPR04MB9328.eurprd04.prod.outlook.com (2603:10a6:102:2b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Mon, 22 May
 2023 09:36:18 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::6c14:307b:6fd3:3bfc]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::6c14:307b:6fd3:3bfc%7]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 09:36:18 +0000
Message-ID: <cbec7486-d1dc-8597-3711-a7a3ee3ec517@suse.com>
Date:   Mon, 22 May 2023 11:36:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v8 2/6] usb: ljca: Add transport interfaces for sub-module
 drivers
Content-Language: en-US
To:     Ye Xiang <xiang.ye@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
References: <20230511175844.185070-1-xiang.ye@intel.com>
 <20230511175844.185070-3-xiang.ye@intel.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20230511175844.185070-3-xiang.ye@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|PAXPR04MB9328:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc111c1-330a-4b0d-9c7c-08db5aa7fe96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fXZSOrf8aYfXr3djmpWaxG2Kdajv0xirQEv5vvfYscopPpH1RYAWxe7nsxVjoo372KLogpJmemuhpONLepnOZ73KkMTSWaQQ2tG2ib/emMKqWpFz/XRwmLtEgfWK/bHeCU50OQeiUDuCwQb0vLQci5IsCDABKUJl1SQWtCSar6QqNiarKEzlUEqOMYEU+iyaWZksljDOnhm4m0wym5Vir/TvjeySt+wtnoFWVYWRX7cBV0t0vruvDpIxOhjQ7wUmwqZy2kR89z0+GB1yrYS/yPMtQAv9kQpgRpPFphjQ71xYeKFYqc6h8p74ILAp1B1uExnk0YsJ1DIkH47llcBncVvrngqajjV346q8d5R7jv3zm5IXBGo1aH5AMDS1gxHTH9eDeFrz/y4zJC1mN4WCdtryMycZ7onC0rc8LLXZwV5iLhxm/KYxJtMjIlP3Fngc1mbPY/79k3fnB84ZAp+mnlWrcXT9vioXhgmp5sRIzgdNG0z2T+uAhRLH6gnPO4RYbJjqqGrYMnKROROOmC6tMUATkHs57aEiHcRKeYxgrr+fU/Z+E1IWuMoLabAX/u0ZWkgQXQSVR1112L2oQfi64qbPynA4NLhk8j4uIzPp+rmtPDuuCDzKG1nNg8Xd8EucdZXbCnx9Gf5QKgqgl2qhBglCOSqG0lQXpw94I0lqJaY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199021)(478600001)(41300700001)(66476007)(66946007)(4326008)(66556008)(31696002)(6666004)(110136005)(6486002)(316002)(31686004)(8936002)(8676002)(5660300002)(7416002)(86362001)(83380400001)(36756003)(921005)(38100700002)(2906002)(2616005)(6506007)(6512007)(53546011)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0RHM3RWZURPNGN0ZXNhdU1LSEY5amlCRFVMOERxZk5mZEtoQTZRQWU4aUg2?=
 =?utf-8?B?NXI0aGFFcWVpbnRId3RFUlplMkxjZHZwcGM3VVJBUlN1bFJOOFJYbEUzTHVx?=
 =?utf-8?B?WWxEZURrSHhOQ1hDYlNEcVMwNk9vSURUNmxVa0pKSUVMakxvYlRLSS8xbHlZ?=
 =?utf-8?B?UG1CczAwS3ByQ1Y4YldEbFdrRTR4OGczanNtcVhVa2pkcThjS3I0dEQ4emhx?=
 =?utf-8?B?N20xNjJ3dTZuZlBISHJiWGRkb2ppdmVRM25hdWx3cXl0UXNtWVJPaVhjbGZT?=
 =?utf-8?B?MFFLTkZTL0k2djNDZUUrQ3A5eXE2M28zODA3R3dhbjl5aGhUNEZBN1pHSmNk?=
 =?utf-8?B?cFVZbnZkYlhWR29Bc0FkUGlERFFtN3lUUFlWeUJYcUtBeHQrdXRpL3RzaUwx?=
 =?utf-8?B?VEJ0V09KR0NpeFFVZEFJd0ovSUJmWGo3a0lzc3AveWZ3K1J6c1QwYlVvZE9t?=
 =?utf-8?B?V0Myd3U1S2huN3RPUVlTNnlHczd1WW8wLzFSMk1jbk9RWTBFTThJM0YxWkVk?=
 =?utf-8?B?ZDZvKzZSMVFHZGQ2bHI1M1JSYyt2UEdEUXF0dFRveUFhSFIraitBU3NDS01U?=
 =?utf-8?B?NmlMNzFOUU1TT2c4c2g2ek5OUVNGL1Z1VFF4MTN4eWdGYnJ6R3NDNXByV1RW?=
 =?utf-8?B?REZzU2N3T3AraXYrMjdaYlZzcFVsWTRhUHZQUENRak9xY1lBbFRrOU9XMk5p?=
 =?utf-8?B?cGFrTWowbS9WRU1zcHVUdUlRQjFYKzBudno2MWhLUTlKMXFpUXUvRTMvZzBL?=
 =?utf-8?B?WHRBTE5NQTBNeTZ4QXRDczJnejFWTXBGNzdTTUZjbUtBUXhLeWlSTnlHd2xR?=
 =?utf-8?B?OXFsOHBTRDUzMnYwdzBiTzROcERGUlJ0R3Z1UlR4aXU0cTdKWUNTaUh6anI2?=
 =?utf-8?B?V0ZaRVdlRWh1dFVnbEFDNGphTWxoQUtzNlg2NFBhWEtNenRmVUE5ejBoY3lv?=
 =?utf-8?B?WDZWSVd0bm14dXFPM1EvanZuWHllN0haK3ZyU0h3QmFhVEJLYzRpR1VhYXEv?=
 =?utf-8?B?bXNwTWVwS05sc1hxRnRES3NhMUpWMDRQdjdLTnF3MUVXdlUyK0pZVlNEV3pD?=
 =?utf-8?B?eDBHUlBvbGM0MGtKQ2hSUzJvYWZnNGg4VXdlbVlyZ2pIZVpnR084OVFYZi8z?=
 =?utf-8?B?Vm9naWt6YjhQYTJuK01qQmZ3aUUyaXZGMnlPVTVGMWM1K1hIV2V1S0swYVNV?=
 =?utf-8?B?U0dmcEl6TDkxWmlaQklGdGFuZkRlYVcrd2N2elFaeEV0MVNzYnRodkF6bXFI?=
 =?utf-8?B?NklQNnFyUkRnempTb3RFNm16S055OGhONFpwUjhTL3A1d2pIWlYxVTV0VkdC?=
 =?utf-8?B?b2hjVi9pZTVvMndKV3V4WG1KbXlDaUZvN3hERkhCM2NVNVZVVitGLzVscHlZ?=
 =?utf-8?B?bk5VUWcrMHFvUjFBQ2E1UFlLMjVTL2M3NlZNQTA3NXJjc2JaSlRrWjcyR0F2?=
 =?utf-8?B?Nms0eGk5S1dLNVNzOUdvbzZ4TVFCd2k5S0taR0RxOEkzaGUwdyt4RzM2Nmdt?=
 =?utf-8?B?STZXdk9aUW5UR3FJbklnbGtOMVAxbGxYRWRzb0FjNnZiSzVpTlBUVkpnaU01?=
 =?utf-8?B?Q2w3NnYrVlBlQWlRWG5kS2l6cEUvNTQvY05tc2ZucmRLcnNXNnN1blV5U1Ir?=
 =?utf-8?B?dmpSQVNYRjZpL2c0aDB1bEttU1dXUGVqbHR6KzNXZXF0VC94QnpSdHRldVc1?=
 =?utf-8?B?WHRONzlqcDhydWh2ZUhGZFMybkJzUlpkb3JMOEZTYzhNSGI4QVVXbEZzMnB3?=
 =?utf-8?B?VnNIZGM2U2NieEdDeldndGhCVmU5N1V2a3V0YWNtMHlrc3hwTmt5RHZSb0or?=
 =?utf-8?B?Y0FtdlBLVkpTSXB6OFFEeEJJSU00WlFRYlFtWU42NnlGTFhhcFEzYm5jK2Jo?=
 =?utf-8?B?SVNHRDJzaEpsTVJWR1VCRm45SWR5UGxiZzdHV0xNbUhRNmgwOGFST0lEaHlq?=
 =?utf-8?B?bXNoR1RrWFAzU2c2NG9SM29HWDY2QkVjSW5SMUQ2M1pVaGtZQzZ5VzZBckJR?=
 =?utf-8?B?d3pIL2R1VzRQVmxXaGY5K0VCRkloTVN2UWIvejVuTFREUnNHVlo3TjlxL0Iz?=
 =?utf-8?B?RklUUmh1TERiSXJEeDJFTVlqRW15d1A1cXVSTzRsRE9waVlJQ0RGMDlsc3dq?=
 =?utf-8?B?SlZyMVJMSzRlU0lpdDdqbWlhdXUzV2ZSUnE2UW1KOHZTRXBScFRyRjFkWStx?=
 =?utf-8?Q?b7ydWdyONScxxR4H8h7K0/4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc111c1-330a-4b0d-9c7c-08db5aa7fe96
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 09:36:18.3075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NY92DKcYR8oKDNd+kfynyf5ln9pXxIJPqlsQJEBb0zkYYbk+OZ5xyvk+peBvmVBn0JjbaFXV7Y1NOODE6+lwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9328
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 11.05.23 19:58, Ye Xiang wrote:
> Adds the transport interfaces for various LJCA sub-module drivers
> to communicate with LJCA hardware. The sub-modules of LJCA can use
> ljca_transfer() to issue a transfer between host and hardware. And
> ljca_register_event_cb is exported to LJCA sub-module drivers for
> hardware event subscription.
> 
> Signed-off-by: Ye Xiang <xiang.ye@intel.com>
> ---

> +
> +int ljca_register_event_cb(struct ljca *ljca, ljca_event_cb_t event_cb, void *context)
> +{
> +	struct ljca_event_cb_entry *entry, *iter;
> +	struct ljca_stub *stub;
> +	unsigned long flags;
> +	int ret;

Uninitialized variable

> +
> +	stub = ljca_stub_find(ljca->dev, ljca->type);
> +	if (IS_ERR(stub))
> +		return PTR_ERR(stub);
> +
> +	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> +	if (!entry)
> +		return -ENOMEM;
> +
> +	entry->notify = event_cb;
> +	entry->context = context;
> +	entry->id = ljca->id;
> +
> +	spin_lock_irqsave(&stub->event_cb_lock, flags);

You are using GFP_KERNEL a few lines earlier. No need for irqsave

> +
> +	list_for_each_entry(iter, &stub->event_entrys, list) {
> +		if (iter->id == ljca->id) {
> +			ret = -EBUSY;
> +			break;
> +		}
> +	}
> +
> +	if (!ret)
> +		list_add_tail(&entry->list, &stub->event_entrys);
> +
> +	spin_unlock_irqrestore(&stub->event_cb_lock, flags);
> +
> +	if (ret)
> +		kfree(entry);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS_GPL(ljca_register_event_cb, LJCA);

	Regards
		Oliver

