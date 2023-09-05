Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A34C792626
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 18:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233692AbjIEQTn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 12:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353948AbjIEIqh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 04:46:37 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2088.outbound.protection.outlook.com [40.107.22.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99072AA;
        Tue,  5 Sep 2023 01:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7QcVB7xM4XlOTdNcwlr3lL3xl97C2/7brnxac9Qo/A58rJ1x/6X23va6PMnDE2fvUHsD/iR8vfuwyjsXid8t3pBHO7fmwwmYpK11RBHa6gP9S8dg7K6x/v3v6cLnSZW7FJkr2hko0OBBv3vD+1jdCvqtacKvVnfKTgTJFEyNC2lnHgIRHzZsQ0hvndOEEB3m4510voSjLJIrFAI3TvpdM3PQ4Ba876kl1DwB5YzR8l9jbc7p4p9/qFDs1qzv/gRtD4Jl0ICtK1drdqgaxtmadwq1pHbJz/sg6/kycJpYg68JunIA4vjhogp0cXMZ7H/BwJU0aV+oxtv1+GKd3ob5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QjJV/RlNI5CHxVvdsJYcoGO3pScARBJHXf0yEu5GVA=;
 b=ggnucjPrbddjMm384kv2XThuJm8AkKkel2zoQAjojK2dui3j5r7CIyc4nXZH4rHTRQnP9IT7VGoXO8lto8I6MxmKxv3JH78hkiH/ux+BfW+k01duDnRIDcT8O+pw1/RUhl/otRSAvi2hSO8mdaVOszBTPw96Mt3yzI8XMAZGq6pOVeI9kOtDLMEjQbZN7BdLZ1bscoUEYwW3mb9UM4D8g8nLObVz9wxQFwgDHFts/Om/czD/kiE2s+NnLnnBWtzqKFBPWQE7jec8sUtGjbLz9ESnm/GAW0EArtaTjlox5gwHgGiutswc4CaAesq3JGmB29pWgqSp4mEq6iNEHNzoeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QjJV/RlNI5CHxVvdsJYcoGO3pScARBJHXf0yEu5GVA=;
 b=cC12dPj8TSHSNi48d0sAwaSc42Z+nmDiRGIWkYfiGPkjE1FdVhzqb9eN2ZRiX6Ly6OkcmsLu6F0+Iv9/Yjx2pLcev9+PjKh8mENxb+IYi/7SKgxjA0TTl2DLdqCDNCZGx9zcfFH9G1UCQfMqwwCIApC2zzk2hgj39EQPu4yxn6T6XbwdHsvtRjlMNn/I0o4DwXRnio9bfu3A41CsxhYK2R6Jb0A6b2bASKB0CcIFVBGbNdWL8/uKGISaKqBd8n2JQ0VmKccuwv5x7HwRMSW0wzjfRie+iFKiKRScjVTbpp+IPToYUBlKZiNbuIvoNcYtfITnL/LaYvMyE2JSIhvJ8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AS8PR04MB8849.eurprd04.prod.outlook.com (2603:10a6:20b:42c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Tue, 5 Sep
 2023 08:46:30 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::cc91:7bb7:2f06:1cb2]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::cc91:7bb7:2f06:1cb2%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 08:46:29 +0000
Message-ID: <f6f8a9c4-faf1-f9da-e688-a29eb267fabc@suse.com>
Date:   Tue, 5 Sep 2023 10:46:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v14 1/4] usb: Add support for Intel LJCA device
To:     "Wu, Wentong" <wentong.wu@intel.com>,
        Oliver Neukum <oneukum@suse.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
        "lee@kernel.org" <lee@kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "kfting@nuvoton.com" <kfting@nuvoton.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "maz@kernel.org" <maz@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
References: <1693806261-12958-1-git-send-email-wentong.wu@intel.com>
 <1693806261-12958-2-git-send-email-wentong.wu@intel.com>
 <a8c8af1b-9399-6ca9-ea3d-b71e6ee68cad@suse.com>
 <DM6PR11MB43166D27FB15905CB02DBC5B8DE9A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <7755c3ee-9d7e-8ae5-1cf7-a5247cc4e6e5@suse.com>
 <DM6PR11MB4316C70D7C14B56ED349F01F8DE8A@DM6PR11MB4316.namprd11.prod.outlook.com>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <DM6PR11MB4316C70D7C14B56ED349F01F8DE8A@DM6PR11MB4316.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::20) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AS8PR04MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 658c581e-1672-4664-f81c-08dbadec98f0
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q16hJjK005Jhku+haSo84orDoyZAdgP6Vple/z48XaRj+rgu4G6jtRcMAjeEERqmF4WezuEk4kz1dDIZcbqx4lrdQC63QyjVndaW6tQ9BxqqoZ3IvHmYppoFhXOzQa69U1giaTeafGr7aFycWxh9XRj2X/FZlPMjG9u2gm2SvMMQOB8UrVjchpzQXEeeyt2+lTfEMW+QaG7dWO7YUAGm6Pxtv2vqOXQmlOE/gPp6SnBCktzPhr7isZED+9iEiOUukyaGA2x2NMidBEism1AVA8WxGYdTPEfofTgPKbi/rLhbgwwSt5FF3s7q3BnHfYtsZqP7/lb1GPKX0sq/hUgGY3cBgsV4BcZxbVedymXm/YxJ0XOgOgMk4wsNkjUjKPazeJOa1+NJIEMVDcgdGAcGGdKAFELfWvt4EtAkze8luKrylOYcQTWVW7/Sfea1tzhjalnIzIdNn2LyGBQ4NggT+oRp0qQbEFPn1HtkDngtvcLKCrwVUM8Kn+F4v+NxJSGCLpwUNTGWSxXkjhOJ50h1rz3oTUnNXErNX++Ftedx3zxsmJhBmU4WcveOAGCAB1fXZqbOWCqUdUGAdsRTKRI7J9uRP54Btd3X/k08+0ckZv72SjObl4RRfk3l5hurNOeVQ2mnMSkkgfys4NvIjXMrQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199024)(1800799009)(186009)(31686004)(66476007)(66946007)(2906002)(36756003)(110136005)(316002)(86362001)(31696002)(54906003)(66556008)(5660300002)(8936002)(4326008)(8676002)(41300700001)(6512007)(2616005)(83380400001)(38100700002)(7416002)(478600001)(6486002)(53546011)(6506007)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3BQdDkrek5OOERnOURSNk9BTmJXS3Vxa0lYczUwN1NicW5LUE04aUxZSjIz?=
 =?utf-8?B?Ulp3NHltclZZVTMvclBBOFRlY1VvMCs1cnJmNnQwOUlsV1B3WXNTUDVPVW9o?=
 =?utf-8?B?NUxzejJxTzREek9jRVcvSzhtTElwTjRDcDVrTllxeHp6TmZjWmdOZUdiUkF2?=
 =?utf-8?B?Wk94UmhLbVN2S3FqSml4YlcyUXd1SFEwTWMzVzhUSzhRQ3Ewa3FnSXdLai9j?=
 =?utf-8?B?R29BMnZJM0xaellGaWJIU0JwVThKSzNUR0EzajdlTTIvUW5WQmh6cFJhRFZD?=
 =?utf-8?B?amU2NVZ3QXh0VnB1R0U3OWREWmI4cEFZUFZPNFpaMlUwNXcxL21kamNhWEJt?=
 =?utf-8?B?Z04xY0s3c3UrR29nMWxQOVpXTllFMDhGei9qMGFkYjF3RmpkV0NyZUZyY0xl?=
 =?utf-8?B?ZkFQUnJrQStJSEZESmNwK1Fka05JSFlNS005eXFMWVQ0c2Q4SXZieGtSWEJG?=
 =?utf-8?B?YkJ5ZWR5VmJoS0FZQXZSQytTbDUyczZWN3N3MGJnaTVpLzZ2V05EM1hyai9P?=
 =?utf-8?B?MnBITWRxbUF4dXhtbGI3SHpDNjBsZ3Q1cUtxNmt4T3pHSDJtZjFMTzNOYmw2?=
 =?utf-8?B?c3lmbnB5R2ZCd24zZXA4Znk1NUx1SHo5WFNNNjRJNUdzaVo0ZmVuTTF6S21y?=
 =?utf-8?B?bTg0M0drYzljUkdlSys3UHJJOGZOcnd6OUVEYnZFYlpETXdaTytPc3c0eU9i?=
 =?utf-8?B?QytpTWRWWjM5YnpmOE5KNXdBTzFqekswVjZnU1JzeW9WZzYvNmkyRldqU0pH?=
 =?utf-8?B?akRjTW1YYmJqK0pUNU0zQmljblR3L3N1djJSZTFRbzZMUmlyZldmZFdrbjEz?=
 =?utf-8?B?USt6c3AwNkwvc0M3MEpMaWI3b1dHOVA3MHJ0dkJleWNub0VmY0g4UUxXd3Fo?=
 =?utf-8?B?bHAyQ1BQVmFwV0VxV2F5ZGkvcjZZRU9pN3lGVWhQVHdyeEc0YWxVb0o5TGlw?=
 =?utf-8?B?anB5eFdVU2JHMm4rVkpBSUcvb3NpS3Y4VElhRXFPdCtrejJ1b3lCSWRzcC9y?=
 =?utf-8?B?dlBuaythQTA1VjQxbi81Umh1MUtmWTBNdy9HS2tJQXd6eEJiUEw5TEhvRmdo?=
 =?utf-8?B?VTNJcjhtNk5YMWRyMk1mOUJVaEhDWjBnNEU5NnUrYWFjdHk2RHhzNmo2akJH?=
 =?utf-8?B?cTQyQkFwYWRVOENlL1M4WjZIeXZEMHIyTXgvTE55R3FqVEdDZEM0RllCL2g1?=
 =?utf-8?B?SlpOZ1pDMm5UclJ5SlJoQ1J3RnRRMkpXMTFGK2JZWU4zaDB6WHdnR2tGd3F0?=
 =?utf-8?B?NXNsN2J2N290TjhrUC84TUMwTDdBQVA2UVVLV0p6UVdkWHViSWJTSmZHR01L?=
 =?utf-8?B?S3U0Zm5wR0Y0aTJpQkhjUFM1K1BJaUF0ZHNFbEl3cExkS0pzZWhPWEIrMWRi?=
 =?utf-8?B?MTc4Ui9PTzVZUWl4WmduTVlTdlk2dEdKWU15OUtvMU80bzFFSFFjaFhoNFJD?=
 =?utf-8?B?aU5IUlFEaEh6VG02eFowUE5mQmhRYUVSc0Jock1ZWmROL1VtakRkaXpCNjFX?=
 =?utf-8?B?bm1nV3hQbjN6S1pCeFNiT1p5RFRvZmIxWWpxcG1uSmxHandsV0VSTjRPTWJZ?=
 =?utf-8?B?S1Bqcm5PNEY4Q1Z4bnBHVVgwM20yQzZDRTZoWHczVGRlcURIZnNoSTYyWGo0?=
 =?utf-8?B?ZXluSWY2VXV4RzNXUjhaTTNZdnlTVHo4UEFUZ1lXaE5BNjNIK2RCWHJBK0lv?=
 =?utf-8?B?WDQ5UGZENlpNemZCUG5PMTBKajZWNkpNZzJSOXFodDczbTY4ZDVkWFVVSnll?=
 =?utf-8?B?WnRocHQ2TEFRQVR0UU5HQUl5c2VkU0Fjc0lPeWdIUmJiM3F0czNtQTczaDdW?=
 =?utf-8?B?SnNFZFNBanhLRjRvSkQyN3VsZ1l3UUZKQVhLUXN5UnErL3I4TFpyUjJtNHh4?=
 =?utf-8?B?L1R0SEp1SnVpZUpTcHRKVUJJRWYrOFViREdoUm5JRkRNb1VEMUxBVU1MUVR5?=
 =?utf-8?B?TzREL3l1S3g2eDRQOUE0SWY1Y05NSUpleVZxa1NSQ2NOMUdBMFZhREF3RzJD?=
 =?utf-8?B?enZTVEFlVVhXdUJHLzZMQmdneGM3R09jekZPWk1HQm5nV1haSVAyTDkreW9W?=
 =?utf-8?B?OUo4TlR5ZEoxS05sakd2UmRkK3lPT2RlTE5PWG1TcytwYmxlVDMvd0tLSnVs?=
 =?utf-8?B?RmZJSDlvQklEVjNZalF2QkFFV0hESWt2eEpXd01LNjZNbE1yd1pMNGVXMGtB?=
 =?utf-8?Q?GjttAVyJoXg+85mzKIqGpKqbu53IxxqFC/7cnFm73b4d?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 658c581e-1672-4664-f81c-08dbadec98f0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 08:46:29.8121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38pwlBtccMJmk885kGFUgnI4AxV1Jb96jVDTrfjg4IrWvbBI9yn1wPZhBtklSKCQho9G0ZO0ILmc4t8E0gv4ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8849
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 05.09.23 04:20, Wu, Wentong wrote:

Hi,

>> That is that you will hang arbitrarily long in disconnect?
> This routine isn't called in an interrupt context, and it allows sleep or wait
> something before the real shutdown like many drivers' remove() or
> disconnect() do.

It is, however, in the context of a kernel thread. We can wait, but not for
arbitrary periods.

> If we want to speed up the disconnect(), below changes is to complete the
> cmd_completion if usb_kill_urb() has been called, but there is still possibility
> ljca client init one more transfer before auxiliary_device_delete()
> 
> @@ -206,7 +206,11 @@ static void ljca_recv(struct urb *urb)
>   
>          if (urb->status) {
>                  /* sync/async unlink faults aren't errors */
> -               if (urb->status == -ENOENT || urb->status == -ECONNRESET ||
> +               if (urb->status == -ENOENT) {
> +                       complete(&adap->cmd_completion);
> +                       return;

I'd say you'd break suspend() by such a change.
You cannot complete in the interrupt handler, unless you can determine
why the URB is killed.
  
> +               }
> +               if (urb->status == -ECONNRESET ||
>                      urb->status == -ESHUTDOWN)
>                          return;
> 
> perhaps we could add one more 'status' field in ljca_adapter to represent
> disconnect() happen or not, and it will be checked in the beginning of
> ljca_send() to avoid any new transfer.

That would be a solution.


	Regards
		Oliver
