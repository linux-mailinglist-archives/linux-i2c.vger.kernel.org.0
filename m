Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AECC7BD86A
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Oct 2023 12:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345537AbjJIKWN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Oct 2023 06:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345535AbjJIKWM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Oct 2023 06:22:12 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E2099F;
        Mon,  9 Oct 2023 03:22:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsGZb2pxkezlw/UAdV5Vb/mAdwMNK6Um5iPuIT0hmJqWxtMBkZAI55+JpPWZdR3TDHxjF9rk23Nt50QUU/mAxhxxg5pJCRA8B2rP54Ty8VxFjbn9gEo8hKUOh73m4W353dGMNsi84SSRHdxGds125Ih+2HBWv4JvQ+OwceDz5wjta1UxDkzmKMZSS4arc2flOg10PLuisjkV3eDiKH8QYmecU896Z8H+8wUfljE1MkfUupB1tPwSbPq0bZQqEGMtUkpbOCk6yBFB9U3Q5eEwf+BQKaBpBpJxNPwKEc/cyGr1nRPeTHkgdFLadQ6zQYVO6u601NiAJQcYTJzBJXfHKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cw3IcPxKO/a+biabGfCLAQjFkoBIAQg+XR4EPlklovM=;
 b=J0G0rnsIdmq238ulAoMLs+7mlHjoY8YWMaLkS3KhUoIuoQhbP5t90lNxnMSQY11rC8B0FzfObwmRsCqkhrYxEMzDvZ718NsigmcfJB29YSC+JjgaohkBSkIIoXlorr2HoT9AcqI7u4tfJWcWix3G2ZWCLWja5lNjHZaKwZFoaoF9rl2k49Z3Kf7d0PxUTUYBcQBfgEpXgPYvk7Kpc3KDY4242jZb9Y+392w8vcXjRpeedPJK0oCKnaWLSIJuIv1tzbX1VXugSbMbgnICfBrWkNobdlqUfQxoQ1PJheTT22WHmzt69G2hX5Ub42qxzhUuYiHAJQoiPfja8wfFVd/2EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cw3IcPxKO/a+biabGfCLAQjFkoBIAQg+XR4EPlklovM=;
 b=mRFPzkXXcNocKabw/7f1RXuHBW1sBbgM8C4mvuSBHLs2sNg4xcczIKq6gIxXFg4ZnSoH4VkHp3nV4AePrEgMsJq5DkTVRh3C5HWYzE4viKUdc+vaQhuHvehoNsd7M4RU4Frm57PaRSJ6vfQKKSDkdCanVE56twRpP89emz8MeeX5rSulfEr6etW9lHQFhD55tT6lJjrJH8lVCd7DElLjhZJoxa5Ehu0/Zfb25ERw9NAApWq4l9iyAEtY2GYpe+G/QDBj6oeRLNQFlNKCOU/HEK9CJsWDOsFAqqowsXAkgqASYaxzWf/mXPNfhr1H3inULoaPA1oFgO75bY2oM0Vl5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB8PR04MB7097.eurprd04.prod.outlook.com (2603:10a6:10:12a::11)
 by VI1PR04MB6830.eurprd04.prod.outlook.com (2603:10a6:803:132::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Mon, 9 Oct
 2023 10:22:04 +0000
Received: from DB8PR04MB7097.eurprd04.prod.outlook.com
 ([fe80::5ad2:2cf9:afd5:99fd]) by DB8PR04MB7097.eurprd04.prod.outlook.com
 ([fe80::5ad2:2cf9:afd5:99fd%2]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 10:22:04 +0000
Message-ID: <a32e996a-a9ed-4332-9a07-46bf66913db7@suse.com>
Date:   Mon, 9 Oct 2023 12:22:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 1/4] usb: Add support for Intel LJCA device
To:     Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
        oneukum@suse.com, wsa@kernel.org, andi.shyti@linux.intel.com,
        broonie@kernel.org
Cc:     bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
        hdegoede@redhat.com, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
 <1696833205-16716-2-git-send-email-wentong.wu@intel.com>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <1696833205-16716-2-git-send-email-wentong.wu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::20) To DB8PR04MB7097.eurprd04.prod.outlook.com
 (2603:10a6:10:12a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB7097:EE_|VI1PR04MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: 3262f6ce-89b2-48ac-2c5c-08dbc8b19510
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NVKqTPwRUioHpaIz2BQ2gMkIefKi88E/RIsy70j5sy+EsyTnIQvNnM2PRLX1YY0mPSk/anHCcd1a0ES3g1MoZk8YB2f42zleqw0fLbF4nlRdXWyPbtElYxjliJI2tXmZImcyQSRkHeE0yZ+tM03b80XJV2COpS941F61LGDh0aZye24wbGH6VlJrAB4u2zfPzFy2a5pz9foGVbg5QfYe3wdH34rbiaGMrPULvybLkt9INjoQ9+wTOy9+F+20fKGZg6pdSbkrfe1Msj5mqiX0mzPESNVmwPdFcCx+6AEjSpLA36Ek+sJKjjGr9c8Xa+Dul7WyQd6QCZUxwDlRIaiqzse0IS8J+p4GeqkI+43AwXP5GYR1ceg8EeSfTRvIM06j560SpCxhRgryU20mpD65VH7ThDPW+qTKEiK8mgjQKmJq6B/ZJs8eqPLcAEGfqI6xoNVwqlEsUB2/myeiX7dc1vMDW5Fl0TXs+OOeFllIr1+Uy4mj5NC4Yy6hCdnYWq8ow0yTT9P5M5yG2DnbmhvHihW0IdvV4S/H4IzXoRrXHkxfATssoWz4L4U+Sjn4rmC91Xem2vSMW/qsLygW1ocyvp7w/CGjdnE9K6e3P9LTvqumHY3TzNroE/mA8J6hPj475Po78Hveu1KnXBScbfQzTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7097.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(366004)(136003)(39850400004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(53546011)(2616005)(8676002)(478600001)(6506007)(6512007)(6666004)(8936002)(83380400001)(7416002)(2906002)(4326008)(66556008)(66476007)(66946007)(6486002)(5660300002)(41300700001)(316002)(38100700002)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3pZTi9wSWtoQUJnUk13cWl2ejlPRitySmlXWk9pdXJRVXdQQnVQSUYwbDFt?=
 =?utf-8?B?dUdEQVVLL0tQSTJYNDZaNFB1blg0aWl5T1ZNUVk0dGgzQlBtQ0VycWVaSW5G?=
 =?utf-8?B?V25CTG9zaGhCS3lyYXVVdnpoWlZ0WWN2K1dnYlE2V0orZjkzRENyRDVVMTZi?=
 =?utf-8?B?SU5IWkdWRHRmQm9paHNMM2FRNFRFLzNuZG0rZkhkR3UvTjlGNURENkpZMzJ0?=
 =?utf-8?B?SG9sNmdZbThDenpUeWp0ZU8ydWgzNVl0WnF5SUVKMzRCMEluYUtWRE1Wam93?=
 =?utf-8?B?aHRCVHA2UVdHVVhSRWNlVUhVVnZtT3BOT0lYeHlHenNHV040eStiamJJUmlZ?=
 =?utf-8?B?OTBiZ1VEckRDZUNQc1hYL1dHRTlid2FWS3hnWWd3TEJ0YWZDMyt5RUpnbStR?=
 =?utf-8?B?V1NmVmswK2VocVBDMTdvZDMya2gzS1J0MEFVREFOSTZkY04rK3pDQ0creU5v?=
 =?utf-8?B?N2tlR3M5QkwrTjNDanVrUWVuaUhyMklyWGJJM3ljWk5sVHdoVEtKVm56eEhK?=
 =?utf-8?B?NjhDbzI5ZnZPaVJORFMrL1RiNDFQQ0x1WG40eXVhVUlCNzdtc0FzQmZMYzNa?=
 =?utf-8?B?T0xPcFNSSndhMjdNYjE2MHhuaVRXbVhpQzRUc0l4cGhYZGRhQ1FHTlJuNkM2?=
 =?utf-8?B?dXpNemdYclJwVnp1VEswTkhBOEVCei9OSldXbkRmdmlPZlo5Qkt4eldyYWs1?=
 =?utf-8?B?ZnZlU0F1cXh4aElJemZhWGsvMkJIUzg4OEoxb09UL2l1TENQblBrVkhXQVhV?=
 =?utf-8?B?QURQeEJxVXFFRWpoa1R6a1JEWTBNeVlPc0xXRmUzRjJoR1MyMEcxQVkxVk9y?=
 =?utf-8?B?SVFWdjZpL0VOZWFQRmVhSGV3a25ObkRHVHZKZm41Q0I0U01zSlRNYzVhc3hu?=
 =?utf-8?B?MmY2Y2VMb21zU2gyT1dCaytRT1NuMFVIMGdsZ0Y2MEc4aXJpS2RhQmxPbDhO?=
 =?utf-8?B?VjVEcnJ2TXlEbFgvMjhYa216Wm52NUpSQ01FT2ltbVdITlNVbFBsRnRRUUhl?=
 =?utf-8?B?aHlDaXdzQ2QzcHlWNTBTVjl2Tk1wMUxyRzlpV0lYWVI5QnErckl5WmVCcXlB?=
 =?utf-8?B?Wk9Rc0lIL1pSM01GMkF4S1VROWk4b0lpZzdLSDVrNUlKOUVMVlozZzNrY1oz?=
 =?utf-8?B?RDQ4VTJUUWlZV3VYQmFYYkJPM1IxRnJTa1FrQ29GeGg4d09oNStRREVFQWp2?=
 =?utf-8?B?aWtKZ2FEbWxza1JRN2ZYc2pyZHpDTHVpcVdPTC90UHNBYWlHL1JQQjRyV0M3?=
 =?utf-8?B?d3JvZ09vbFJNU0I4USttL3NWeVBXbzNicWMyQlV1RGViakRzWWJtbUM2UnNI?=
 =?utf-8?B?QUdBYWljR0ZyZzVKS2l6ZW0vUFNQQk1lRCsxYzQ0Mmo2VnhlcDlaSklYTm1I?=
 =?utf-8?B?SjlxcUlvMnBqalBYazYwcnBLamo4dTNIazFqWXlLVC9KSjdHVFRqOVhEK3VL?=
 =?utf-8?B?OEpQK0Z3ZnozTng4UlZsekY1OWc0ZmdDbkVKTWY1b1dYQVRFbTJTbmYxb2Rw?=
 =?utf-8?B?aFo5RGxCeFpXS3FqdDZ6WHg5QWxrTmNVS0ttVzFFODBsbHV2WEtOT3dnWk9K?=
 =?utf-8?B?eGhOaWJMTU1VSksyd0hGNlVjMmxPR3hPdTI2SjUvVGs5cnoxd3VPOWE3ajdI?=
 =?utf-8?B?dkQxVUk4bmlwb0RMTHlxV0NwdWJLckdTdG5lZGt6YmtwWitQd0p1dzdjSWgr?=
 =?utf-8?B?cE5tUUtzd1liTExVeHpqZmQrL0hiaHhXbmR6QS9aN0wrRy9HdHhHWWRrQjUx?=
 =?utf-8?B?Q29Uc2s4c01xaS81SWRpYktEb1pwYU5odlpFNzRCb210b3VKY3lEWVB4YnRC?=
 =?utf-8?B?Z1VtMzZIODROSzQvN293a2E4NnlGa0VXcUNHY0YyRzhVd1VHSWxKSzBlS0V1?=
 =?utf-8?B?WUF6U211NEJncjJqS3UrT0hmTGd4TlpmS2VSaUduS0xtQldwSjRVRGordTRF?=
 =?utf-8?B?b012aExzR0VOTGRJdDM3WmlyT3AydGdNeGRDR3QzOGRxakM3SURMdTNMRUR3?=
 =?utf-8?B?OHpjSEVmMjlzRkNnQkp3anV0RE5KQkN3SHRCTzFsTEN5a3FkRGpJZHl4UnlK?=
 =?utf-8?B?NWRQMkExMk9NWjdOcHdoQ3ZybmpQQXdPV21iRU1HSWFueDh6VTNvN1dQUVJm?=
 =?utf-8?B?T1BOREcxYW9HcmNlVnFQYWpyc0h4eHVOVHg3bzNGb3kzMHlpMmtPV2lac3Rr?=
 =?utf-8?Q?Bt7ofvezEB4zNnyjsqncchsj20zxCbtG+XpYxs9INI5M?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3262f6ce-89b2-48ac-2c5c-08dbc8b19510
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7097.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 10:22:04.1193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/lrS4zfxai+e4ZnMNfAZABcaJ6Fcx2l+Q5Y+e+piNLkLGouk3kmyyceDJSF8m8Qip90nz9xjqXSLLvQ5RO7kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6830
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09.10.23 08:33, Wentong Wu wrote:
> Implements the USB part of Intel USB-I2C/GPIO/SPI adapter device
> named "La Jolla Cove Adapter" (LJCA).
> 
> The communication between the various LJCA module drivers and the
> hardware will be muxed/demuxed by this driver. Three modules (
> I2C, GPIO, and SPI) are supported currently.
> 
> Each sub-module of LJCA device is identified by type field within
> the LJCA message header.
> 
> The sub-modules of LJCA can use ljca_transfer() to issue a transfer
> between host and hardware. And ljca_register_event_cb is exported
> to LJCA sub-module drivers for hardware event subscription.
> 
> The minimum code in ASL that covers this board is
> Scope (\_SB.PCI0.DWC3.RHUB.HS01)
>      {
>          Device (GPIO)
>          {
>              Name (_ADR, Zero)
>              Name (_STA, 0x0F)
>          }
> 
>          Device (I2C)
>          {
>              Name (_ADR, One)
>              Name (_STA, 0x0F)
>          }
> 
>          Device (SPI)
>          {
>              Name (_ADR, 0x02)
>              Name (_STA, 0x0F)
>          }
>      }
> 
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Oliver Neukum <oneukum@suse.com>
