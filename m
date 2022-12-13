Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B86BA64B6AC
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 15:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235447AbiLMOAh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 09:00:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbiLMOAg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 09:00:36 -0500
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2050.outbound.protection.outlook.com [40.107.105.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DAD915709;
        Tue, 13 Dec 2022 06:00:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9BtkidUrYRPa2mtojWBhyoBQwX6g5NiFtwa9pm4dwWColrQ/lAJSCyxK/jcGc+tMRVQ/cMi9dJEcxIP72cjNHz3lXiBSlzwHyTvO4Wgil0xZKzHrcoNI0XVOxElTemNOMwntPssu4FYDmT0l1HsUq3+C/JZPAa/69KPA/oHv1eFkZS3gfHtmZFhUAPSDESrBoGxpa+zeaewRsceL+ZU1dAYkRmvshknLELFxSGjn4M0XEzmC6lYfy9CEY3y0v5Sr77AFb4NNF5T2dnfUbM5TNHb27WJHVHnWUOyiTeItTkFQCi7h14rtqM+JZ4sSEs5Le9Dtrk0tqhzSYxZmfahuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7UL4JV10Lx0/ubKWd93Uqbl9IOSpgrlEkeyrS9C8YCA=;
 b=go5tMk9cq1fsvimoHVtNTOHgg56dl0bLwhVr3FHsabQOkEp+wOgntGMhcw8avgcVKqntd8CL58VfVg1+4SKbOLigItHPR/9t34/KHhrR3Y5doohpfw5b1toN6Adv4X7rNOVM5YR+ioojyD3vHGGit3hNqDbA2MCZ/KLwSpqru1JiABmVei4q93+uoRePgfZ7f2/JxTtklF8uW8J7kzZ2aFzMCukv0Jk4eRiqQQ84hhnt+LdvT6kGJrdUMkkUb9xvswvUOCfEv+0iQBBVPYebS1bHPeaOWEzhdOM8Coi1tC8AU9QnStPF//qbE17TgmbnQdypvAHAqDHHkbdsSg1VDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vigem.de; dmarc=pass action=none header.from=vigem.de;
 dkim=pass header.d=vigem.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vigem.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UL4JV10Lx0/ubKWd93Uqbl9IOSpgrlEkeyrS9C8YCA=;
 b=LRQLMy/uXVPP9ujLZ0qUJXdo4cos96ugiW7GBqS0f8DQ4gCLhwADYuBlWBI3arW3KD98fTqvi0lsomHhGcg23T4nH8mgQbfzUfTSMOndXa4BUZ2wvaMkpTTqIuVS45FoK19rsXK3zogTApJ7eEOvWd92QIgotHex57FEohgM2U8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vigem.de;
Received: from DU0P190MB1930.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:3bd::20)
 by AM0P190MB0644.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:199::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 14:00:32 +0000
Received: from DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
 ([fe80::ece:ddee:45dd:492]) by DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
 ([fe80::ece:ddee:45dd:492%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 14:00:32 +0000
Date:   Tue, 13 Dec 2022 15:00:30 +0100 (CET)
From:   =?UTF-8?Q?Sven_Z=C3=BChlsdorf?= <sven.zuehlsdorf@vigem.de>
To:     Rishi Gupta <gupt21@gmail.com>
cc:     Randy Dunlap <rdunlap@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Enrik Berkhan <Enrik.Berkhan@inka.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: NULL pointer dereferences in hid-mcp2221
In-Reply-To: <79152feb-bcbc-9e3e-e776-13170ae4ef40@vigem.de>
Message-ID: <ef597e73-ed71-168e-52af-0d19b03734ac@vigem.de>
References: <79152feb-bcbc-9e3e-e776-13170ae4ef40@vigem.de>
Content-Type: multipart/mixed; BOUNDARY="8323329-960696319-1670604523=:61397"
Content-ID: <ab8bd398-6f4f-9745-be1d-3c54020f465d@sven-laptop>
X-ClientProxiedBy: FR2P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::12) To DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:3bd::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P190MB1930:EE_|AM0P190MB0644:EE_
X-MS-Office365-Filtering-Correlation-Id: 75204c95-5fba-41b6-6dd8-08dadd12664d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ABDQnlRdfwz5NDPkIRjHc3pH5gsPzYbe154iHYU10N6XBJyCaSd+rj8AKie5wBRLj1UOT+CUMIMgHSFaR2LDFnBil8acFjjvl/p/iffArBY5C+drhktFtvsAI5o4N0NrOyNOE7fjnmJx3MUzBBpBaYPz04UhacEhclQocrym/nAIJeUpNFP5Gb8aDFcAyZDHVcVAO0JkXzJxyE6BMNTjNAduz8zK4xClxoIG9Xc2kvFgjcjjeemiiJi+bf3YuYUcXZ7AWUAiHYpgKUbUVXEdySPkAtPOf8LzXGa0JD/LDzUMo34zSPjjn9YB925ArPQnbCfCiIyYcwZPe7nYbau+1XSIv96kRj8TmaKht0hSgoWoXI/4bZ7iRYuSft0uIvOkHf9sOo/1ddc5Hf4EsAmS9GXR64a/Xf81d9ccV9m1FwRWljb+FP0i7E0q+Er04LrTwg/eRCEpSumh9YGCn1ld7i/EcCUXNnB3u3QRxlHwWzJT4tEU4fzz29fGjkpb8NS+zjb9iOKSNLG8+xwasehYenGjXqLA0VZTGlfF4bojkNH0cYpoF5+n6Aq0p5zNBC5tEtKV/LcOi+XJhQMGyv6jmCeuUKZkZd8Ob2dTnfzi7dgZC24droBiTNjK8BOSLM6LL1bXlS1GNImi+F84BPsr0U4rr8T3zB49Rlqzl/GVeSdaQKT8vN4yVZLTIVW9+p30wbUkQWlI5Lm1q9CS3pdLgEOUdt/+yiLYCXpDh4nd3LRCyIsQjU83UjRTuh67zKxq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P190MB1930.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39840400004)(396003)(136003)(366004)(451199015)(66946007)(41300700001)(6916009)(316002)(54906003)(83380400001)(66476007)(86362001)(2906002)(8676002)(31696002)(4326008)(8936002)(38350700002)(38100700002)(36756003)(31686004)(5660300002)(66556008)(33964004)(6486002)(52116002)(966005)(478600001)(2616005)(6506007)(186003)(66574015)(26005)(6512007)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGczTzZOZElnbkk2MnVXYkNDV291ektLNnpIYXRYc1NGTlg1N0o1eEFRT1pq?=
 =?utf-8?B?RlQ1QVBlVkozWkYwQ0hKeERDRGhtTFJiT1kya2lRdGowTTM1cmc5VmwwaTdE?=
 =?utf-8?B?TmVMWld6QzBtTWxscmpBN21NRDFsQTgvVmpVQm1QbTJlZXRZMlJSU29PLzdl?=
 =?utf-8?B?b3ZGZGFqWlVZU1V5SEFwSi8wcVUyV0hyeDJvOWw1L1dwNWZ2aU11Qm5tRHVa?=
 =?utf-8?B?aUkrWG1Xbkl0ZHAyTVJYaVdUSnZSUEFkTXhjZGhVeENsM3ZQcDNHc3lGaitL?=
 =?utf-8?B?RWlhMDNmWkxaMEdhUzVIMElxcnQzYklaeEhRaE5KSzVoWWc1YS9kSUtaWEg0?=
 =?utf-8?B?VDJHVFByaW43RUh3ZUFlYmlUQmpHSk9wK2htNUxyenBnTUprZitld1dSVGFr?=
 =?utf-8?B?Wk1wV1pXR3FoKzUyaXFZd3d2RnBBYW5IZXUvYU14QU0vaW0rVG4rN2E4eFZw?=
 =?utf-8?B?VnA3SVQzMkRqMlV0eTFYZzZFaHlva1BiamxSMmloTkFCckNaRFpaWkNCQnNN?=
 =?utf-8?B?ZFcyUVFJbHBBcEFiVUdBa3dkenNFTmM1cCtIRC9CaUZRdi94S09lUkxRVWRu?=
 =?utf-8?B?ZFBBdHBDVzFtemVHcE1od2lzWnhnTjFLbzJQS0E3OVdid1Y0bnJJMWZPbDQr?=
 =?utf-8?B?anIwN1VpbkVzU1g2MXBLNmwwdUpuMEVaT1I4dWdPME80dW1haHBBT1V6aU5r?=
 =?utf-8?B?SUp3N0FtMHRmR3hsL3NzZFBQVC83cDZXdEIrbU9tM3BENXRSNm9YVXBab0V2?=
 =?utf-8?B?c2g2bGl4b1JBclc2cXYyWnlzVXlUUjYxR3RMMS9zakV3dERhSzBEVFJkYzZP?=
 =?utf-8?B?bVlVVCtOeDBISXpXbi8ycExuVkZxckh0NWo1ZnpTeXkySFRPQ2RBRnB4RzJn?=
 =?utf-8?B?WDlKeTBhQzl6VklaaXNBejM0emlidmx5cmpxL2E3NFF5dFBvZjJZU3VHU2xl?=
 =?utf-8?B?THZLWVZ6MmNoVW5mN3RzdTUxTU9ndEVpR1o5RE1kZEx4bENpUDc3d0dSSGFI?=
 =?utf-8?B?S2lFL0xGRzhWUzcwV1g2cHdLZTVTZGQrTS8zdm5nYTFPeHVJM1RQVGtOaGRD?=
 =?utf-8?B?aEdVZ1p1WFBvL2NmQTV0QlN2YzVVUktkTXgwRFNSVzhXYlR5bnd0ZVgxRWFr?=
 =?utf-8?B?eElqZFI5MnFTMHJndnJDT1FrUGdob1I0Zjg3MTJicGZCOEJqSnBIUU9lMWpM?=
 =?utf-8?B?bjhBVzBFVFpZU2JGZjN5M3Joa2h6dHZiTkNJWUhsaGdpQ01aRUVia1hUQXVv?=
 =?utf-8?B?R3FwdXBHNmZuaDdGSkR6NnBibUVNNFdmdi9Ta2dzdkFRU2ZqK3c2KzVJQmJ2?=
 =?utf-8?B?NkJld05nNC81NlJxZW05aHM2VkJiMGNiQTJLemFvbjRrdG5PSzJobzg5ditp?=
 =?utf-8?B?UTBrakxqZUd0TXlaZ3Zrc2s1ZHJhQXMrSHphRFpRdzZrSVlXMXc5QVR1dXA0?=
 =?utf-8?B?UE00ZFZkRXhrWDFCOElIOWZmZ2dLMHlmeTRpcmEyZnZwVlA3TjdyR1FtaU93?=
 =?utf-8?B?TGFoU1JZM0tIN2I3dTVGSlErQzA1YU40OXBiYUpoaG5odC9DMjRKWm1abXJI?=
 =?utf-8?B?TFkwU2UzNGw0RFBXQjNGQnY1bWZZRFBBVUhud3pDNTNVTkRCM0hIVjkza0t5?=
 =?utf-8?B?aTgxYjQ0bEZDZTNrbmgzKzAwL0lFdWhGT0FYeG1QcFBueHNwMnR5YTREeEpR?=
 =?utf-8?B?TTdpaXhFSU9JWlh5NnZPaGxMTHlzUnc2TFplRHRBTWk2bmsrWkJIcFJHZTlV?=
 =?utf-8?B?dGpXaHM2U29HV0Uwc0ljOHNmTFdETlJmc2YxQmlJZzg5bmEyU2hzT2VOSFBw?=
 =?utf-8?B?QTR0R2VwQXNUclRqL2tlQjYvck90K0NkNmZBUzVJaENuZk5uOWd0M0xqcVdQ?=
 =?utf-8?B?WXNtNjIyeE1VR1lTQXNGV0NQU2Q0U1lZRTNiM3JyL0RkK1dUdTBOY0IzRVdG?=
 =?utf-8?B?b0RMR2R2eHZTVU1qdHhwdTZHSG9LRkRrNkZlL3RSNGxuOERiSERKMloyQVZG?=
 =?utf-8?B?SjlWdVJ0S2ZjUk13dEFhRGVkSys1ZTJZVUNJSjZhR29nampwL04zTGU2QlMx?=
 =?utf-8?B?b00veTI1QXA1a081Rlpoa2JBVnQ1MUZseHUwOEtQL1RQQ2FCWHEvRTd4Z2Iw?=
 =?utf-8?B?NW1EMEptT2NrbHNYeEJVTUFiWEJ3MFBDeFJDbkVUc05Rby9GNkZIRnR4MlRj?=
 =?utf-8?B?Y1E9PQ==?=
X-OriginatorOrg: vigem.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 75204c95-5fba-41b6-6dd8-08dadd12664d
X-MS-Exchange-CrossTenant-AuthSource: DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 14:00:32.4971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: dc3cc44e-876e-4b98-9250-42df44be4933
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6WbWgF92JFps1XqZFZU9+4tq/jzAG/29R3UoeaxrzsZcjGZY/NqqaRu2WRgR9Uy+ZeMqAivZT5Taz+39rJHGTV3sEM0y50S67txK3ZZLkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P190MB0644
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--8323329-960696319-1670604523=:61397
Content-Type: text/plain; CHARSET=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <fff13c79-4a0a-4cfb-5bf2-582716254ac1@sven-laptop>

On Tue, 25 Oct 2022, Sven Zühlsdorf wrote:
> Hi,
>
> I've run into two NULL pointer dereferences when loading the MCP2221 driver.
> Initially I observed them running the kernel used by yocto kirkstone
> (currently 5.15.68) but can reproduce them with a vanilla 6.1-rc1 as well.
> All line numbers below are for hid-mcp2221.c, taken from 6.1-rc1.
>
> The first one was easy to identify, in mcp2221_probe line 874 `hdev->hidraw`
> was NULL since I compiled the kernel without CONFIG_HIDRAW enabled. Should
> CONFIG_HID_MCP2221 perhaps depend on or imply CONFIG_HIDRAW?
>
> For the second one however, I'm stuck. The dereference happens at the top of
> mcp_smbus_xfer since i2c_get_adapdata in line 307 returned NULL. Looking at
> the call trace (see [dmesg output] below), mcp_smbus_xfer gets called
> indirectly from mcp2221_probe via i2c_add_adapter in line 876, directly
> before a call to i2c_set_adapdata. Since I couldn't identify another call to
> i2c_set_adapdata or a write to `mcp->adapter.dev.driver_data` that could
> potentially have initialized that field, I attempted to swap the order of
> calling i2c_set_adapdata and i2c_add_adapter, see [attempted fix] below. 
> While
> the driver now loads without issue, no devices appear on the i2c bus:
[...]
>
> When booting a distribution kernel (Ubunutu 22.04 with kernel 5.15.39) the 
> bus
> is populated as expected:
[...]
>
> In the patches applied by Ubuntu I couldn't find anything that'd explain this
> change in behavior. Regarding their kernel configuration the situation is
> similar: Even incorporating almost all of Ubuntu's additions (minus some
> signing and integrity stuff) into the config I've been using results in the
> NULL pointer dereference in mcp_smbus_xfer. Since this still might be a case 
> of
> me missing some config options, I'll post my config in a response to this 
> mail.
>
>
> There seem to be two recent patch series for this driver:
> https://lore.kernel.org/all/20221001005208.8010-1-matt.ranostay@konsulko.com/
> https://lore.kernel.org/all/20220926202239.16379-1-Enrik.Berkhan@inka.de/
> I tested both, but the behavior stays the same.
[...]

We managed to completely fix our second issue. While my initial patch did
fix the observed NULL pointer dereference, the second patch from Enrik
Berkhan's series could have clued me in to what was missing: The hid device
needs to be started, otherwise the responses from the chip aren't processed.
Patch, based on hid.git for-6.2/mcp2221 3d74c9eca1a2, in reply.

The differences to the kernel shipped by Ubuntu turned out to be a red
herring. What actually triggered the NULL dereference was having a driver
loaded that actively probes new I2C busses for suitable devices, thus
triggering the mcp_*_xfer functions before the adapdata was set. Unloading
and reloading hid_mcp2221 once a suitable driver is loaded will happily
trigger the bug on any kernel.
--8323329-960696319-1670604523=:61397--
