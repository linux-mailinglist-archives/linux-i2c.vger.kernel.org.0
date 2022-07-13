Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3261E573CB4
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jul 2022 20:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236674AbiGMSsj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Jul 2022 14:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236815AbiGMSsh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Jul 2022 14:48:37 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C5A108A;
        Wed, 13 Jul 2022 11:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPfdWgT4EO8MRa/v1PMAFPPvjL7Jl7fSCRihph/qLDSew/etIptVWsYO5rM+5obfKkr1zvIw7OSAuKx1nKzaqa8J82zsgAMfnX8t/Gfc2h6b31TI4Rl/rgGbd/ogUHzYcbXB2+ic495cr+FVlNQJ+6aEaa5cpMI8IOoysR4CWmRi9GaY385/6m6vStmdNv4jbWhZhSjb+CLK5Vg+dCwqD9iuGjLAbUDKcDCFnltrv4UERQVOL5lino/CUVIv03pWNiQMGhxGtD/NV6EVFuyPYAhtqlFsxI6mS/0UNqUckIUA41jIBpSRm6PUKfZZC5U6qdLBo9fVOV2JAeSkZkpuXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmUQ6Op3ftGWXuoEqXzUDJxm/UuZkWsahpfSpZeEFPk=;
 b=ctpKkMOZRGTLDwHU9+2N5O4BeeTKU2SX3ZLIC29gM0lZ+octeywiZ5M0Pl4iuqnJZkCchl2V67OfaS264IzKTC/ChNoEkOerKhqlJljwUmMbpa5wG0ONnSTN+jVh9D9Dr3Bgr31H5yyoIQEEpgefK3F2CT57Qo9ziDp4Aco79BtxDxk7+qiADg5jrpnh3FQk23CTTyTaxCsAb5oBLow94YgGzSQPe8VIlhX+7ph+ILyU5BvEz/c+mUpA+FLkSXk4Q8s3tmgoe8PJ6AC85Ia26VfbIq7Tvjhknl9cU2W9UhXUFzT3dEg1bo3Wg/ytfmMUyhEPZcZrigYxZ46keMIVRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmUQ6Op3ftGWXuoEqXzUDJxm/UuZkWsahpfSpZeEFPk=;
 b=xGq4fI1h5bUnqWZxFyUPOsNNuvZQ1Ts/0tTJmoSZ/iZHFZExi+jIm7DWDZHh3WFk8DmyRPw2DwTdUacAg31xV9NPjfUUuBAs2888PA2dRp8rEklYwnl5g11RGlCXUE3Tkm+ZMh9bGO3vZeC8c+BpH0VhWuzuqLk9FLRbmj+wCxLUVOekaSagQgMuNq/QXcNOhfnKrt0jZLEcGYGuKawSUDp2ULZbfWf72ojAdW1muabXq9alS5qfXRmXhd1SWEJtszI1JPNDAJ0IoMvOXAC7bClkmn05PUp6j3S5z2R2bUyZxbMEmIF9T9TJAJEZocPGiUAJWb7YMFdR7aqq7M0Jjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by AS4PR10MB5149.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4c0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 18:48:32 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::253b:4d66:1a99:f6e0]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::253b:4d66:1a99:f6e0%8]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 18:48:32 +0000
Date:   Wed, 13 Jul 2022 20:48:27 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
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
Message-ID: <20220713204827.0b290fd7@md1za8fc.ad001.siemens.net>
In-Reply-To: <Ys71dyMdozGUAto0@smile.fi.intel.com>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
        <YqBS8I62YBPFC9iS@google.com>
        <CAHp75Ve9Lju8AEQd5huz1aYGg4sOu-ae7tTdyDWCXPCBR=wXbQ@mail.gmail.com>
        <YrGyWCaY+swYAYzH@smile.fi.intel.com>
        <YryAXlZqcr/liN7n@smile.fi.intel.com>
        <20220629191406.35965d5b@md1za8fc.ad001.siemens.net>
        <Ys71dyMdozGUAto0@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::10) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fc13ef4-299c-4419-2891-08da650048be
X-MS-TrafficTypeDiagnostic: AS4PR10MB5149:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4iA4fdTwXJnPY1gmL7LbQvTrHYl6Iu7Tkn8+7qdhdyMP65njtWXbQIl4AcFZffSMSYu28c7lsEuUrT/NHUEFqEohOGMwEoO5JWXG5SF2yjGhm+myaJYtRHxulwZdoxrJlFY6xmxR+JqrcLumeU9lIuCyinLm6U6COaxGO9eLOK4AncVuTHQTukho3AYDSebZQvl9BAUNea9ObGWOxs8RwR5dqJodlpM0cgok1YkCQ8CcbO3uzEtmKp9K+Eu9yFBl9z8jg7EdDV724vZjHZs5SiJwPWgOhztXtIhYeQii3C71acd/IlexEIiue0X8jnUM84X+0hB4ZRNQd1DjON+qnRd0Zb34I1ds5mkKzy0RmUfMHMX2/fzlYbFJXIR7xs9TjdAxi7EfzXlWXiguqeydcO8iH9AvU5b0F7wSbhjUSXF8nULEevTWPO0MfPkAug5+jZBfNMqzXZQwuVYD9Izra+k10quc/JK7HMkZhW/zCh32/0INXdfTBBiJy41bsEDTHCkQ4CNUgnIpRATpYWsCMd4Z8yotzYHPyVsKLaao2AXENCr7dz5CSy+5jmjZLbPSaABoyDKN3bDiAHCc6RwB8q7vZ+j1+pPnSnvfTEExQDABHzpWkywPtaclu9ccd2uwSnDef3wTf0ucci+RUhlqmFRggkhGTFaM4B8+0aEaGzd48L+PD3m5A4IR35OYo5/GuhgZGloWshQdf25GXvnbNMP0qYgSK1IBfinN5wAMTCwEwRf9RYlDoBWERxJh8MzMg8NUOLUg4+wm/MNqtpXHPIOpBzSWgLmjyhB0BMPpRNNh159hwInAki0DFhLbhrOEVXMBNXoJ84Xct02fbLmH/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(966005)(6486002)(6506007)(86362001)(83380400001)(6666004)(53546011)(5660300002)(6512007)(478600001)(186003)(8936002)(9686003)(1076003)(44832011)(41300700001)(316002)(38100700002)(2906002)(66476007)(66946007)(4326008)(82960400001)(54906003)(66556008)(6916009)(7416002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hae5Q3/EZbaEt2KI8jPeMpl9Q29R4PZYzlFywf1CQpvY5zE7McU4vbJal8v4?=
 =?us-ascii?Q?rILvp7NXlvI+42qGB+HRZc3pTjGNm7eWjU8GhWrX24GPMFm/Q2kdbuUMuxxi?=
 =?us-ascii?Q?ts+GIIiZzOGx1ddK8ZZmjSseSlNTJTMa87dyB8rI5FWfnDpIleNi039M4aio?=
 =?us-ascii?Q?TO8jvY6EsENFrM4l7nJg2GsVNi06DMnUG+Wlb7D53goJHZTXBVAsDhjoTCEG?=
 =?us-ascii?Q?vY8nbK8FmGxpvdCDK5JXKEIZlnDkVWsTgjiBfbjj4ojnyrsVLhF0C4Ghd2aS?=
 =?us-ascii?Q?wdLHuebrUyON6bopYIRwX9JS3V7ARpr9+TD1oEZS6vVseKweQPKHJRAsQBfy?=
 =?us-ascii?Q?/PgrgqwGnO9ocZLgW56X3aZ8KFBt3FV74JxwSZVGDp/E6e6GvBpj58Ps0dvE?=
 =?us-ascii?Q?znFDfMJVswf8rv2LiqhflDUPnSGfymQcmbjwCP9Mg/1xKln+olMEp+6engtj?=
 =?us-ascii?Q?2KUJAeUBeJnXQiHx2tq3gGfzTb1IoSTJ3HrrFPK/i+BADxHCOI55zRFKr0Br?=
 =?us-ascii?Q?7OMZ6C9FQbuM0MfVFTu0A9UYss+xuVHtiz3GTZd+uemwvOxl2R+AUqtSeoMC?=
 =?us-ascii?Q?cWZsPkEW6HsU9SQbn8drgIlomZsvde67h5ORRrvqEj1X/pEgNNpkVBnoSDE8?=
 =?us-ascii?Q?B4XhvzvRYOt3hZ1fLca6QD6t1fp4MWQcjxb3FhAK9afR70XjNqyvM84/sSOU?=
 =?us-ascii?Q?LN1lHpZjEbqQWDIYT+hmuI+a6a7EnNBNmt7TMh4CbjWPJzs03FToOFRNcnCx?=
 =?us-ascii?Q?FHeK6u8Xb+CsGvbgi60MUo+Q+/8/exQlPU01dHMuecgR8XLOxm/kwO9sWanH?=
 =?us-ascii?Q?/wQT2xqZmY3rn9gdBIv+POu1ntT3BsVdm7fxw0/SP0uF4/UQYdB4rAnOrs/S?=
 =?us-ascii?Q?kKs4rAw1IQcmLytqbzxc2kxoWQv+csRdslyyVZKNVPMdCAN0SHGONO9fZL4w?=
 =?us-ascii?Q?js7YyhCQcgslsqhzoBN5UDGwK5nqZJLZvpgGJR8L86m4uy1+ZgxssxoiLxi7?=
 =?us-ascii?Q?Q6Nr01n0wKAJ/ksSnjLrtLtcSidGYKc54AymVMzFg2w+tF2UV0S0t05wWSYC?=
 =?us-ascii?Q?xG1woGcNWLnh3PTKD90wOlCAoGKc03vTUwAjbqwwf+J4knumCNQRjAIg2YeL?=
 =?us-ascii?Q?B3MySVNJfjmU2gtQMqKYUAEkZUIPqdVqJza4xF6qkD9DlUXdBJyWowX6M6Qi?=
 =?us-ascii?Q?6vCU22erIted+nehF5koiuZIHHszEXqDd9UGV97f2M4gHeA62wFbsH98cntd?=
 =?us-ascii?Q?8bSaYecJz4nyVaaQ6IaTD1E0JT8+KXt50JCNLNDe/ueSvZh7PPUZOEOmb6PR?=
 =?us-ascii?Q?8WrdhO/fA8nV7nzzReSQUiIt7RduM7SkTCsJSjvrZ/S7Ln7LLtR6Q0pv9nVy?=
 =?us-ascii?Q?HSuJa9z98CRM6CinQahrWM89o1tc1jBIb2ZP0E65J5hYVsQF+1k3/CW1cPCK?=
 =?us-ascii?Q?9zF5UO5CUFzeKm6Nvjl4MCARpzEdDf/92J1/yh2r4pD1rAB3bsZ9ShjS4TwS?=
 =?us-ascii?Q?oTqnpmU3dvXxEGdgkp1Ygy3gihCfE4s/NRPAjDCQoJmzR2QXD6ItkuT0oXtA?=
 =?us-ascii?Q?GN66gAVLkvXa0bHtbm1CJHqukw/PrghD8dK6GvSpr9t/VHsj3eUFle3dNvNn?=
 =?us-ascii?Q?+FXXraj6u8m/oUKwIIZyrWtV/Tt44u9Z2IUAxYGUZBv7Un3B5Ib8QZtM+PEQ?=
 =?us-ascii?Q?IJiM4Q=3D=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc13ef4-299c-4419-2891-08da650048be
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 18:48:32.2892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tp2wda2qvMNQcSzdgupwbAzVfKY7JSUp+0FDg2l4aUnxRxgu8Y00s12xVH4XpZsWgrOtcCrnwpGfiYJcyd/qpnDLvwGle1CmJZcETKYWyUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5149
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Wed, 13 Jul 2022 19:40:23 +0300
schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:

> On Wed, Jun 29, 2022 at 07:14:06PM +0200, Henning Schild wrote:
> > Am Wed, 29 Jun 2022 19:39:58 +0300
> > schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> >   
> > > +Cc: Rafael
> > > 
> > > On Tue, Jun 21, 2022 at 02:58:16PM +0300, Andy Shevchenko wrote:  
> > > > On Wed, Jun 08, 2022 at 12:50:44PM +0200, Andy Shevchenko
> > > > wrote:    
> > > > > On Wed, Jun 8, 2022 at 9:42 AM Lee Jones
> > > > > <lee.jones@linaro.org> wrote:    
> > > > > > On Mon, 06 Jun 2022, Andy Shevchenko wrote:
> > > > > >    
> > > > > > > There are a few users that would like to utilize P2SB
> > > > > > > mechanism of hiding and unhiding a device from the PCI
> > > > > > > configuration space.
> > > > > > >
> > > > > > > Here is the series to consolidate p2sb handling code for
> > > > > > > existing users and to provide a generic way for new
> > > > > > > comer(s).
> > > > > > >
> > > > > > > It also includes a patch to enable GPIO controllers on
> > > > > > > Apollo Lake when it's used with ABL bootloader w/o ACPI
> > > > > > > support.
> > > > > > >
> > > > > > > The patch that brings the helper ("platform/x86/intel: Add
> > > > > > > Primary to Sideband (P2SB) bridge support") has a commit
> > > > > > > message that sheds a light on what the P2SB is and why
> > > > > > > this is needed.
> > > > > > >
> > > > > > > I have tested this on Apollo Lake platform (I'm able to
> > > > > > > see SPI NOR and since we have an ACPI device for GPIO I
> > > > > > > do not see any attempts to recreate one).
> > > > > > >
> > > > > > > The series is ready to be merged via MFD tree, but see
> > > > > > > below.
> > > > > > >
> > > > > > > The series also includes updates for Simatic IPC drivers
> > > > > > > that partially tagged by respective maintainers (the main
> > > > > > > question is if Pavel is okay with the last three patches,
> > > > > > > since I believe Hans is okay with removing some code
> > > > > > > under PDx86). Hence the first 8 patches can be merged
> > > > > > > right away and the rest when Pavel does his review.    
> > > > > >
> > > > > > Can we just wait for Pavel's review, then merge them all at
> > > > > > once?    
> > > > > 
> > > > > Sure, it would be the best course of action.    
> > > > 
> > > > Pavel, do you have a chance to review the patches (last three)
> > > > that touch LED drivers? What would be your verdict?    
> > > 
> > > Lee, Rafael,
> > > 
> > > It seems quite hard to get Pavel's attention to this series [1].
> > > It's already passed more than 3 weeks for any sign of review of
> > > three top patches of the series that touched LED subsystem. The
> > > entire series has all necessary tags, but for LED changes.
> > > 
> > > Note, that the top of this series is not done by me and was sent
> > > for preliminary review much earlier [2], altogether it makes
> > > months of no response from the maintainer.
> > > 
> > > The nature of patches is pretty simple and doesn't touch any of
> > > other than Simatic LED drivers nor LED core. Moreover, it was
> > > written by Siemens, who produces the H/W in question and very
> > > well tested as a separate change and as part of the series.  
> > 
> > The code has been reviewed and is in fact pretty simple. The only
> > questionable but pragmatic change that might catch the attention of
> > a pedantic reviewer is that i did put the gpio implementation of the
> > driver under the same/existing kernel config switch.
> >   
> > > I think to move forward we may ask Rafael to review it on behalf
> > > of good maintainer and with his approval apply entire series.
> > > 
> > > Thoughts?  
> > 
> > Thanks for pushing this Andy. I was wondering how and when that
> > story would continue. Technically these changes should really go in
> > one badge or we need to find a way to separate them somehow. I
> > would try to go that extra mile to get out of your way. But i am
> > kind of afraid such an effort might also end up touching the same
> > files and block us at the same maintainer.
> > 
> > Did anyone check whether Pavel was active at all in those last
> > months and maybe other patches waiting for review? Hope he is fine
> > and active and just somehow forgot/overlooked/ignored this one.  
> 
> I have send a private mail to Pavel and have got no response.
> Can we move this forward, let's say, by applying first 8 patches?

I am sorry that situation is now coming. Both simatic-ipc and that
appollo lake pinctrl driver compete for the same device memory. That
conflict was known and we agreed on sorting it out together somehow.
Not applying my patches could leave my LED drivers simply not working
any longer, or worse ... them making the apollolake platform stuff act
up somehow weird with unexpected EBUSY.

The series can not be split, or we have to write additional code to
properly deal with the conflict. I could envision my LED drivers still
accessing raw memory and ignoring EBUSY (very hacky! ... and touching
"we need Pavel code")

Another way could maybe be. Do the whole P2SB but do not make
apollolake pinctrl come up without ACPI. Somewhere in patches 1-8 there
is code which makes the pinctrl stuff come up for certain CPUs without
ACPI. It is really only some out of many CPUs which have pinctrl, and i
am not sure i remember what that has to do with the P2SB helpers as
such. The helpers are a refactoring, while the "bring up apollolake
pinctrl at all times" is a functional change ... now causing conflict.

And maybe there is a way/process to escalate to another maintainer.
Does anyone even know what is going on with Pavel? 

Henning

> > > [1]:
> > > https://lore.kernel.org/all/20220606164138.66535-1-andriy.shevchenko@linux.intel.com/
> > > [2]:
> > > https://lore.kernel.org/linux-leds/20220513083652.974-1-henning.schild@siemens.com/
> > >  
> >   
> 

