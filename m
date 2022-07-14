Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCD78574B76
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jul 2022 13:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238629AbiGNLDx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jul 2022 07:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238606AbiGNLDm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Jul 2022 07:03:42 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D6F57265;
        Thu, 14 Jul 2022 04:03:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djnEjvbsd1V4W39PxyqLbdkOCYw822HWV3NUUH2t31hkPahvz9Ff43mHcc/dlgA0npIb4r/O3SL5p6ww11gYvEWRVFmqY/amed1fuOkuF0x6UqD9x5gppO3fL8maZELQu7bI/Bb7+W9GEb4Dy7P5VlWc4b5G+5T32xZMsNVPM1e7gMFhs9QGQTxHoqN/z288N8WRIZNtY4bhULOs1TBhZlFmxJ+gikH540jlyibnMCBkOdfZwqEdb/pbxRa9G/VSL4S31edW3sGY5QKNAIgJYF3y9T2LtcuvBv9QFEWNgsli+Fwvo7RhCMjA3jtUbSlKlqhHaO5JTrcTVnBpg69peg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7m3qJoLjSY6jYkLapfHuwG/C0hgQ2GhOjlVznBspQKQ=;
 b=LYqVyu2t0fKXHarl2e48K1S7MhArdNqEyndjbZODozHf0yDkNvndmIlDRtqD/JKB4A6p96EY9kku3WKvAue8J143W3Qn6Dk1zgorGII2WXW2srCiC+YyTiD9isCOv+IMX82F/bf1WSSp7l3OjRvsq0tySk5T6V+o4S6xML9rCpuzfc7umHaiuMINSLKM04g0fXVtha6TyFZBfgzckjllrbEQ7y9fRt07j8ZwYmKgS0TjwbPHEHRhX8fcBXXOYQRTFgKh0Tpu1UIAg7tGv26V32YitzEWOjgiHuxeIAY4sCuyGoZD3dUL/GtayFxTZi0gpOI2lrFwrm0VwqAYWYAYiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7m3qJoLjSY6jYkLapfHuwG/C0hgQ2GhOjlVznBspQKQ=;
 b=kBJnRa6k/ZTnFE0k/C15Xst3N+GwTkxlbGm7hVjVskybVPpEcDkZeAaRovdZle9+IXsGq0yBO8uW/DQe7prDDJx81x1Uz+vIOkR5kEekTMKsEuVQIf/f600KrBxCln1OuG7VSQmOEGhiTrkneWnIGrTRW6trtpH8GUNaUPtkWIbr62+vo/sZzONrVKpn6qpIutQLmF7iZE6f6vIsgXmWjSGB9zJ+3JxEYlIBIendpx+bYP6FDmYyYCSWGMI5f3VBUvrec26EZBUEBCcpHPpSb8EyFBKZAESL7PlbH7n1zTTAc5HIXPnrt2u0hLgRfz11JqnHYRbdlOQlES0mA3o+4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by DB9PR10MB4895.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:2cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 14 Jul
 2022 11:03:22 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::253b:4d66:1a99:f6e0]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::253b:4d66:1a99:f6e0%8]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 11:03:22 +0000
Date:   Thu, 14 Jul 2022 13:03:19 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-edac@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v6 00/12] platform/x86: introduce p2sb_bar() helper
Message-ID: <20220714130319.151e8f70@md1za8fc.ad001.siemens.net>
In-Reply-To: <Ys/xN+6P0DvMrDOC@google.com>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
        <YqBS8I62YBPFC9iS@google.com>
        <CAHp75Ve9Lju8AEQd5huz1aYGg4sOu-ae7tTdyDWCXPCBR=wXbQ@mail.gmail.com>
        <YrGyWCaY+swYAYzH@smile.fi.intel.com>
        <YryAXlZqcr/liN7n@smile.fi.intel.com>
        <20220629191406.35965d5b@md1za8fc.ad001.siemens.net>
        <Ys71dyMdozGUAto0@smile.fi.intel.com>
        <20220713204827.0b290fd7@md1za8fc.ad001.siemens.net>
        <Ys/jz7HqhrxSCOnV@google.com>
        <Ys/ukP8dqnwUoou4@smile.fi.intel.com>
        <Ys/xN+6P0DvMrDOC@google.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0084.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::29) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32011e14-d143-4861-c352-08da658877a1
X-MS-TrafficTypeDiagnostic: DB9PR10MB4895:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jR+9W3O5uQlgFPNwT4XprIUF3ZBFXKdA32cI46TZYme2qQR8b1bKoaVbXQo0FHTSlG9n+3pIkdousBubXfK1SrHboYF9gidQKRO69aQjeVIJVfu7ADt9y0xOc+R1+Oats4pV6JWRNUsGxJ4fA4jSGtqCvmkVDIJEK2CWGF8LqqthfQgjo4MURM6AJr6b6Hx2KRqhRigPMEA0eiVxe0rN8FEVDR2PQVBG9/j8B6XYxmdaswF+1ar0mMi7+poUVB59lWsZVMf29V20Wr/HMcvjdOy1Mg0YaVU9JOLNi+SxCQKU9SZBqX24QoLoDDjugpCo88mWaLvVU8xN8y8mtbhLlCu8YHgyy9+oSY0rREQWdW050CNDBRW3ikCPkTbijbP3ka81ipMKVmDKlyN/kSlylVOOSb50SPAX6GkACPxTZ8GxHaP5gg1rK0Ua6suDWUenk41OHVPFPp/+6Tcwoug8jp86i5GzVH9vfZUBHQUhTXiSx7ydq2zqM/W3KwPltswQPegxOC8nBPXHTD9HyU7cWa0Rc0qlZd9TicZexzh1EVzruR+Ym86Pl/ZCLISSbfCDiP0MkQuO6JoYqGf7mc+QTMjiiDvHFR2heFwNbxJovBxCZEwhm1TGD8fpL/dVSYLEXrGtjY0AEd8gdCgwxZbfa5dTvTM2op7IQU1ys9d2+jdlshRZSUcLddX5ALsmZeR0nNVuQEMdXn1ToA1jAZKCEgi8GrGkXK9wrih6DyZ726zQ+Cj+S87qRPulg0Bvr+CdLZjqfvlFBKkvZfCRE77irxrmHY7B3tiVWF54G8a1e1Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(41300700001)(82960400001)(83380400001)(66556008)(966005)(316002)(38100700002)(66476007)(4326008)(8676002)(66946007)(6916009)(54906003)(9686003)(186003)(6512007)(6506007)(6666004)(1076003)(6486002)(7416002)(478600001)(86362001)(44832011)(2906002)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hhnwa1CJuOS6nH2BMuWauW5F89OV2hX/hU5DUu+ygBF1Jc3GKUKYGCP5kuvM?=
 =?us-ascii?Q?oExfuHgCGd/q7qLWfEIVdOCMppVT+DEPRmBg7UgSybaUsLHUH2TMMQ4UvfCm?=
 =?us-ascii?Q?CGzVR6CVbiOHn7nhhaZ1Ijltc5joG+G7wM5ozt2Araj+vK2nkCg2M2eaHeiS?=
 =?us-ascii?Q?2CwwrjQzh6GJ0HA/kanbVFL7E82gKjTPrMqy4xzO5FJVzpvBWdaBIzlP4ZV3?=
 =?us-ascii?Q?EV4ETFOcB9o2+fulhWWXqW2UqW6XcJNPFYvPk6bOReTKxezt+geP+A9SBVtC?=
 =?us-ascii?Q?DfS/4axdwvg/kOBY8+DWSJ+7WxQqCcbodldojD9i27z+5IxkmwWRZNaLZwZB?=
 =?us-ascii?Q?Vc0jOQ9IDpy/eFK9VS4m3QirZl78Z7BsmZjT8iReP11W23PLnZ6yUKTdhFoC?=
 =?us-ascii?Q?Jp1iVjGTIJssFz5bLCeY7/pT76BiSe1ISicz67AMXnRuqTmBQkhAE/fTR20A?=
 =?us-ascii?Q?ptkygmx8SKejTaN+jVksvUFbKZsquvG1shN378vFagws8qD144jpFoeVGHxR?=
 =?us-ascii?Q?zOhcQUFDlIKsE9lerWyzauChnHocykkW5L4datrg4GejB/tsdH6B3sTp0nbu?=
 =?us-ascii?Q?ZQfkh5fbuK1zHZDQZaVqVKk93yZNZFTeQmFjBrKvFzOFnIL0H8MpHwdwMSMl?=
 =?us-ascii?Q?7Hqpd3TSxVQ2UePXk7AVIq19BzHjO4KLuI42IUTtPsr6bTjFQQpO46V1bX9r?=
 =?us-ascii?Q?2UB9/selil5xpBDcbDHE5XIttgDzYhVipdEkWkZoAPvQMHA719BgXlu5Tzuw?=
 =?us-ascii?Q?4hEvJNeu42PxGrwB5EfCzhzt5Qu19IBsSqoCHlp9rOByKjwA2dGdFUfW38v+?=
 =?us-ascii?Q?2+iSuiZxLKHr3oa83rSOdas7onYl7nMQzh7HIaWj7nrM7DlS/AWsNjeqDWyz?=
 =?us-ascii?Q?WRlW7cxagJbSYxU/v2qcxam2JPi6nc2zJHNffvENHPNC/BlxbAau9FQ1i9gM?=
 =?us-ascii?Q?gGNh1nYfxP0a8SXCv0JlzjzpOymBw6VNlJUMpjt4LGaC4Gfz9Eqfk+ZUEMfy?=
 =?us-ascii?Q?cycsVG4oyJfgJ88fCLkr4O1BcA9GDtHmi+qJkm1xY+C+fZ22lUMNEkE1zzRm?=
 =?us-ascii?Q?d/+sCfqtbTKMv6HiHWOA2wfzP2pAtb+X130g1J9kL0RembBcvI/N395R89ql?=
 =?us-ascii?Q?T56HanSxvpLLf714c5iSYYJykpo2tTqbOw2C6IA9J/C01XrGQVjSMBybFAPG?=
 =?us-ascii?Q?+rbifaPsLbS4G6ieHrJi5mIV5meaQyqgHWv9s7+iqr27+lFUqDj4cP8oG4vo?=
 =?us-ascii?Q?Ch0J7vfeczPeGkdogwGDNqLkUnLawTuLrDPGTFrxqO01UxOQFflIecootM1v?=
 =?us-ascii?Q?utbQnsh9u5d5uMYhO3ev/A+JUmCBNJQNoNWcyODflMC2UN8S+hflX3OC9cwk?=
 =?us-ascii?Q?nhL6XdbYoYtoenza/fX/0kIeSQBJ0Cg0bPmpQgtP0a9yulNTdB1M5VYssXEQ?=
 =?us-ascii?Q?2xp0uwETGO3m0Va+QexO4f/q9Ywj2Jun/gRpmJCiKG5PCvXuGZ8GN/41DoWT?=
 =?us-ascii?Q?yLqFCIN/V0F5+TmnPPxCc8+FeK16ebq4+zqZIBhMI40I73cQ69VPjRR5B9XF?=
 =?us-ascii?Q?dzRuGDz/9WchDBHLztuagoWTQuYz+Qn1alI4PqHObJsUbEpzJExbRlYFlxLH?=
 =?us-ascii?Q?t7i1HRE0vaful+KUCOeZyNLmv49BOdNaDkv9dFW6q2PtxOQnA/EY1UAxhkPj?=
 =?us-ascii?Q?9VOt3Q=3D=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32011e14-d143-4861-c352-08da658877a1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 11:03:22.4956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7AeeEpCz9U++D4NSSTF07eWYzxXlJ2wdACQSyXXfb2mtLDNGAiueGJZ7Q2eb8MQVAEk2sIUU34JWiHjXT1vg4uyqiiqnwVY8fXpfCb7GdxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB4895
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Thu, 14 Jul 2022 11:34:31 +0100
schrieb Lee Jones <lee.jones@linaro.org>:

> On Thu, 14 Jul 2022, Andy Shevchenko wrote:
> 
> > On Thu, Jul 14, 2022 at 10:37:19AM +0100, Lee Jones wrote:  
> > > On Wed, 13 Jul 2022, Henning Schild wrote:  
> > > > Am Wed, 13 Jul 2022 19:40:23 +0300
> > > > schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:  
> > 
> > ...
> >   
> > > > And maybe there is a way/process to escalate to another
> > > > maintainer. Does anyone even know what is going on with Pavel?
> > > >  
> > > 
> > > I'll take the hit.  He had his chance.
> > > 
> > > I'm happy to move forward with Andy's review.  
> > 
> > Thank you, Lee, much appreciated!
> > The patches (9..12) have my SoB, I think it should be enough, but
> > if you thinks they need my Rb tag, I can reply to them with it.  
> 
> That's okay.  I've applied them and they are currently in soak.

Very good news and thanks so much!

Henning

> > > (Side note: Seeing as Pavel hasn't been seen for 2 months, I'll
> > > also follow-up on  the LED ML to offer to become temporary
> > > maintainer for a bit)  
> > 
> > This is good news as well, because I noticed there are a few series
> > there stuck as well.  
> 
> Feel free to reply to object or in support:
> 
> https://lore.kernel.org/all/Ys%2Fkruf8DE4ISo8M@google.com/
> 

