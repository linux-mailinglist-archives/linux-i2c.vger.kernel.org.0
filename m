Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7782E64B69F
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 14:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234740AbiLMNyK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 08:54:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234027AbiLMNyI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 08:54:08 -0500
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2054.outbound.protection.outlook.com [40.107.15.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C695644A;
        Tue, 13 Dec 2022 05:54:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZWmCJUqfV7z2FfCklL2Rk1QXfmFNVs1HSKIYP4S0LNkc8Ci1fnriOBrIKcFVJGnmWLgaVudLvET5MIPDGl7aNMcvXWuOQVPF3MbsNsKe473/Vbj1UYx87ff547oElCicErMR/1ndLlJP17hUzu2eiSzsyevwcjmHTLU4omd58/1c2IEkweUiRO5MgURtwFxaYpgxUBSr9aN6ySSf5Fm7Jli/3nvvKWP+O7c56L9Dt4mYTgyakUAw2uo21ddb0joM8fNpdr2xGDRm2TDp3xYNzhOHZsAnHlpgHwP/x4V8UPpd6ft52sBVCQ4GSGdSGqTWH8qsFNcTms7LzzMQNUSCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHcoosJowlgNQMM9ynjzPeuTyjBgWV6xXfdpASlUAzc=;
 b=FirHx9BOEJJuyL5fXLtefE7z6Vh6aFa+eBeGDbJWaZZ5vsf28XN7BnAEYzWLLVzb0dszizJ3ng9POJ1CaOlAkRZE5CKv6zhq/+KQpcaexm14Mycy37+zIwyoPNFJCsvCU5zYh5SPv7V2tanu+n16Wns1mR9XrTba+Glnuf0S9sp4B3Ag+iv7cm6YuPike60BJ6ZWPWTrWzew7nC5xVUeGOYwGvPqhwggEcqM6NVh09TuY9ot3vXV5/o1Qam0KJ4azJ0NpZz81f2axLVC1z2R+XOrzz8v05laA4kgjvzC1vq+ZO3IZV6Nt0kPg26X/ytBRDA2fCcU+eh6XJI8BNFblg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vigem.de; dmarc=pass action=none header.from=vigem.de;
 dkim=pass header.d=vigem.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vigem.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHcoosJowlgNQMM9ynjzPeuTyjBgWV6xXfdpASlUAzc=;
 b=gS42pg5Tz0sf5pvO+lV77Xwp7GmX3sHR6x2MOtIlR3e/7ActWGfxvI9iaSC6/AKL+YdyLCxXdhJL0rr7wGL5TOiLgyfy2B3I3kBgGPDcD8f+XpIvznO5XWsktOslQmrkJa39vwRC04XpiJdl3DwqIK54MfxCHBtOlr39lpvu6xA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vigem.de;
Received: from DU0P190MB1930.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:3bd::20)
 by GV1P190MB1921.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:51::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 13:54:02 +0000
Received: from DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
 ([fe80::ece:ddee:45dd:492]) by DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
 ([fe80::ece:ddee:45dd:492%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 13:54:02 +0000
Date:   Tue, 13 Dec 2022 14:53:45 +0100 (CET)
From:   =?UTF-8?Q?Sven_Z=C3=BChlsdorf?= <sven.zuehlsdorf@vigem.de>
To:     Bjorn Helgaas <helgaas@kernel.org>
cc:     Lars Povlsen <lars.povlsen@microchip.com>,
        Rishi Gupta <gupt21@gmail.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        UNGLinuxDriver <UNGLinuxDriver@microchip.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Takayuki 'January June' Suwa <jjsuwa_sys3175@yahoo.co.jp>
Subject: Re: [PATCH] HID: mcp2221: Fix GPIO output handling
In-Reply-To: <20221129153933.GA716319@bhelgaas>
Message-ID: <477db3e4-ff7d-ac9d-9786-76aba31defc3@vigem.de>
References: <20221129153933.GA716319@bhelgaas>
Content-Type: multipart/mixed; BOUNDARY="8323329-1626605204-1670602151=:61397"
Content-ID: <377e7981-3f29-9f98-490b-89af369751b4@sven-laptop>
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:3bd::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P190MB1930:EE_|GV1P190MB1921:EE_
X-MS-Office365-Filtering-Correlation-Id: 865fae80-7d86-4d39-b7aa-08dadd117dc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0QygLC1ZIXPVY76x7lB8zZVwtX2NnwjhTSgHMTVu7saMz2uyOTYu4ZE3uTu2rYjh+ZET8n2kD15/OzlvNr1/N7AUFW70CYRKmgGOkpP2Zc6lp9qWqBAlZJVz4jEMR20ddBHDAQ/Cngi5dspaxFMCUX/JN2AfKY8Xu+JVo5oDAWyhjooKHY4b3L0XVDyhAbITo1jEoIktI64GMaJo/vSBKWt1qcRaRju+IVMTbcI0ryJZgctH6gmv+FP1b+mK+3HMikMhmid1tvrvWhFsRsb3xDNrUZYf+abjLtibPEfR8KDu6H87jWHYUfPRwceU6dAIL3YPjgM0jgiTETNIDvBZluxF/5rACxu4i6BPAFSBijLuMmTJwmQV73p1hUXSwFRlmBx8uz8FQRBvArjzfJg7PBpjvajoWlSIvbPU3LKT5g3r33BUxWZfOFECmwSLzc1OxAKz1ft9wmOywQ3kThHK0To42+cPnKVjsO0/0zOzfa5uaxExiyxhuKTj1c+mXxR1AOV0ONEKAMENOKIi/qDDOFMVPzJ7nmDYrwzmoN9z2CfY2vq1xwUQ09Y5G/zQMtgEfzJ/lUBoKeDOBQNFbyXduVYiDmlfx11IbE80eXTr7/onWtdJ1oeiHIQE855ukPKDd4YwZB2tLqIxD+tQTW8z1fdstZMkCH0LDua00+Gi5hjsnIm2PzNsry7iJ9LdBOOAKBu07+B0a9NHjlYYQ3Nm6+A+tbYI7Olgxub9sDre9LMEtTKiL/NozxB5kDbfdqkn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P190MB1930.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(39830400003)(346002)(376002)(396003)(451199015)(31696002)(36756003)(86362001)(478600001)(52116002)(966005)(26005)(6486002)(6666004)(66476007)(5660300002)(7416002)(8676002)(66556008)(4326008)(6506007)(66946007)(6512007)(2906002)(8936002)(41300700001)(316002)(54906003)(6916009)(66574015)(38100700002)(2616005)(186003)(38350700002)(33964004)(31686004)(83380400001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHhMYW1sSHh4N2JQZUNNc0ZFWHUxakJWS0MzbXdaeDJJUkJIdVBOL094RFhv?=
 =?utf-8?B?SVJVZUZ0VlV2eXY1RFVZSkVodEw2ZXFPb3pJdm13WHR1WFBlMGViOUJjelI5?=
 =?utf-8?B?WTZBaGpPc3pnN2FnS0tqSjJwRlNOSWk4a3FrQTZUQnJXVzNzKzdONWpvMlJR?=
 =?utf-8?B?UmJVT29SSE8vdzdHeWRWZ3NNd09PVCszOENxRkx6Mzh4djV2V0ViVVJXbE5p?=
 =?utf-8?B?VEhEa3lrOFR4UjhMWmczRmJVUVJCYWFpbnNuY0wvV2tGSUxldVBlYlZmMVFi?=
 =?utf-8?B?UkV1SGNMR2ZaZDVwaG5PbTlHd0FzdTY0b2JsOGJlUGQvTVFHTTUzaEZpMTdZ?=
 =?utf-8?B?Zlc5NXFtWnNoZEJtUzBlMHZqR1VaQjFMTGtjVWxZcWduUVBBUWw3cDd2SkZu?=
 =?utf-8?B?TXBVNGxmY20xd0ZhSE5qcmVwbmtIbytQZTFEekJTSnpFbmNHbTVRVTRWanBL?=
 =?utf-8?B?OExScEZoNXpYeGduK05BeDVaQktjc2ZMZFpDN01yMzVYM1NITWk4a1VSaExl?=
 =?utf-8?B?clUwOVdUVU1zTlQvRm1aek5qN3FhZzUxSFViZWU0M2xKbHd5c2Z6a25GWE5o?=
 =?utf-8?B?RkFWdkJ1RzE1bmNWVTJzRWc5REowWVFPdFJ4Rjl3UE5VWWZ2UDE0cWU1dEc2?=
 =?utf-8?B?UVN2aEs5QmFVU2Q5NkxNcWo0MlNNRStsUjIrUndoU2hyczA0NDVSNTZzUU1p?=
 =?utf-8?B?LzM2bGg0V2R2R0s1WmtDeXhIOGRUc2pkMDdDeTlqSDJseFN5Y2FwcDR4WWYx?=
 =?utf-8?B?ZHAxWDF5ZXQvQ3JTRG8xZXpsUVk4cXh5eDRJcktyeEd5WG1QZXBSK0h2clNP?=
 =?utf-8?B?TDQyVjJ3Y0pEcmVXTDJKRFVFcXV4SXBLMk1HVEwwV3h1dmdtWXBINlFCZHc2?=
 =?utf-8?B?VU9DakxlMTlLTmJESCtZK2hOWkdaYWJ0eTZaM3NyVXZaclYwNVdLbVlkT00x?=
 =?utf-8?B?aXptMTNuUFh1SUM2dXFmekVLNitLYVc4WE1hcmVLU1R0K0ErMWZ2Nll0SnFM?=
 =?utf-8?B?bmx6d1NXVVdRalBYNTZKQjRJRUVQbGdwN3RwdklLK3pEbzVDaGFObGIzMDNv?=
 =?utf-8?B?RTkrRkF5MFFaMVNHa29kR1hVRG93eDFGeDRJVkJsRWU3OG5xTWtLV3dlOG9o?=
 =?utf-8?B?dGdDM0Y0V2RaWVo0b2JDWFdob0FQQVlUQjJPa2w2QTY4Z29SZjZDay8rU2dO?=
 =?utf-8?B?azVBallSOTg3RjVVUFBPbkt4emRXQi9zTnRpUTgwY0w3anhNdlVid0tMbjRO?=
 =?utf-8?B?NElSeDJlRkN1RkNwWFU3b05CSmcvUFpDSEpjN0U2WUhxY2dtWDYzTVRCYTVQ?=
 =?utf-8?B?YkpLcUhYRk92SzdyTXo5a2NGYVhYV21jVVgwbENKY3dpbkE3WE8yQW5Wc1My?=
 =?utf-8?B?L2hMdGlpSlRHQUtnSnVlbUhwSmc4ejBBeVRFTHBPU2xvOFE5Vjg0bEdJZ2VZ?=
 =?utf-8?B?Tk15Z2FvVXBNbXFCVTJDZHd3ZmQrb0EyVHE1M1pYWlY1RCtYY0lJaGIxZG1Y?=
 =?utf-8?B?THBZamZPS1hsWWhtWmMreUhTSktLbzRIUWJFRUpSUG1lYVV2eGZ3QXBYemhJ?=
 =?utf-8?B?Zk9qNndHUUlqeVk0eks4ZFdNelFuaTZZRUdwVllmMFpxK2JhQUJHOEVJbnpi?=
 =?utf-8?B?UXpLcW9XajhQMmoyQUR5UzdZbWVPN3E4M1ZCdDF4MHd2a2VTdjlSanBCOU1V?=
 =?utf-8?B?TkJFa1dlNERMNFN1TUNKaUdiQ09WL1FoNXlLUzZ5VEs5ZWJ4U3drRStKVmJY?=
 =?utf-8?B?WDczQUVoR2M0THhFb1Vhb2Zra3V2UVRsTmpBYUt5aEo3bENaS3J1TWZySkkw?=
 =?utf-8?B?N05vcjJaQjlObUs0Ukd2by9kckFIRGZZWXVYTzdDY3RNTHhGOW5Bbys2eVFl?=
 =?utf-8?B?NHVONGp4RTc1dUZld1YrMklyNU1NeExycmM2dWNpOGt0RkN2eklzVFhRYlVK?=
 =?utf-8?B?Yzc3NEgya3lYYVFNL0xBYU1VWU8rNktNa3k2TVVOZzE0VHA0SUpzdXR6MW1t?=
 =?utf-8?B?a0JnUjEvNjdtQTVNOTIvbnRQU1RUZTVxbFloakhSMGYxdHZJZjNZTUdBb1Ax?=
 =?utf-8?B?K283Vlh3Zk41cE1TNXhvcU51aDRJWEdNckdtbXMvVUlUZEdpb0tsbHpyTzJM?=
 =?utf-8?B?Q2I3Rld2SGh3a2Z0dCtNWHdUclJCbWs1VU5rcmZPU0dkYkJHVG80cHJYd1ZO?=
 =?utf-8?B?VWc9PQ==?=
X-OriginatorOrg: vigem.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 865fae80-7d86-4d39-b7aa-08dadd117dc2
X-MS-Exchange-CrossTenant-AuthSource: DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 13:54:02.2160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: dc3cc44e-876e-4b98-9250-42df44be4933
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvsyFf6CnY/yiZGH1zKtuQbnlaDU7E1NYCpCE2oE0pa1pd/rLlNIO/tnus7p7byiRvQz/C5aGqj8JrcRv0klTFvtCDzReSTP7okEcxQhrkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P190MB1921
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--8323329-1626605204-1670602151=:61397
Content-Type: text/plain; CHARSET=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <a7027915-b330-bfde-3074-542c83bd80ba@sven-laptop>

On Tue, 29 Nov 2022, Bjorn Helgaas wrote:
> [+cc Takayuki, thanks for your report!]
>
> On Wed, Nov 04, 2020 at 11:02:23PM +0100, Lars Povlsen wrote:
>> The mcp2221 driver GPIO output handling has has several issues.
>>
>> * A wrong value is used for the GPIO direction.
>>
>> * Wrong offsets are calculated for some GPIO set value/set direction
>>   operations, when offset is larger than 0.
>>
>> This has been fixed by introducing proper manifest constants for the
>> direction encoding, and using 'offsetof' when calculating GPIO
>> register offsets.
>>
>> The updated driver has been tested with the Sparx5 pcb134/pcb135
>> board, which has the mcp2221 device with several (output) GPIO's.
>>
>> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
>> ---
>>  drivers/hid/hid-mcp2221.c | 48 +++++++++++++++++++++++++++++++--------
>>  1 file changed, 39 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
>> index 0d27ccb55dd9..4211b9839209 100644
>> --- a/drivers/hid/hid-mcp2221.c
>> +++ b/drivers/hid/hid-mcp2221.c
>
>> +/* MCP GPIO get command layout */
>> +struct mcp_get_gpio {
>> +	u8 cmd;
>> +	u8 dummy;
>> +	struct {
>> +		u8 direction;
>> +		u8 value;
>> +	} gpio[MCP_NGPIO];
>> +} __packed;
>
> This bug report: https://bugzilla.kernel.org/show_bug.cgi?id=216736
> suggests that direction and value may be reversed here.
>
> Mentioning here in case nobody actively monitors the bugzilla.
>
> Bjorn
>

I can confirm that the order is reversed when compared to both the data sheet
and what I can observe in the hid reports.
The patch from the linked bugzilla bug fixes the issue for me.

> --- a/drivers/hid/hid-mcp2221.c
> +++ b/drivers/hid/hid-mcp2221.c
> @@ -74,8 +74,8 @@ struct mcp_get_gpio {
>  	u8 cmd;
>  	u8 dummy;
>  	struct {
> -		u8 direction;
>  		u8 value;
> +		u8 direction;
>  	} gpio[MCP_NGPIO];
>  } __packed;

Tested-by: Sven Zühlsdorf <sven.zuehlsdorf@vigem.de>
--8323329-1626605204-1670602151=:61397--
