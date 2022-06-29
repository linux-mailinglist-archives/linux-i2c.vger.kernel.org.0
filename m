Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4682256071E
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 19:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbiF2ROP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 13:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbiF2ROP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 13:14:15 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44FC33C72B;
        Wed, 29 Jun 2022 10:14:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jcz5T5N6TlilAOgd+rVXyfAGvjkP71Wy3uCXV5tE8N970PHvM7apgYV8EyXXFflHw/mNoivnuWXbN5eaKteMWmpX9CS0JGcGvnCQLLX7qNMaHCtWDcc+EbOuRx7vnyVLQb/7/bD7AMK9C/bQHomlKeFFgz6U5Wbs7/Zid/oDEkRGHGGoBGif3OdrX29JNxCvC5ibmV44fvZ6t2cuw/6M/tWX/yZKg7ItHv7vghkt81XXwFRdIFzBasOVE6gNM2Skm1MB+LFsUfIeKmHEv9sesvzCDdHvQt0eYK2dup3TQm7bYcAJWY/vHGMQkZpGgstENE2O9cAetMQxpQnOc+44Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8omsDunYQL97n9dRdmwVwFDA4J80HJWNSHA1nNPCKA=;
 b=a74O9S3H+jUDDWuqY+Ak4VaKCTCyXr3f19eQFgpC3ktPsNkfovgOeixY8pNCoFTiQ4GxVuweCe62c4i61AbW7Dr/D2HN22UfsEHC6wArE80G+3BNCeuK66LGuTyXjgRDwoMXomNnkutMA9e0jKhJTQszbp0AgjmBWKuM3WMMam2rHFud0eXF4mhuGPwb3MaOZHqEnzpDVsDg1HFKh/Dk3RoIiLeKn5QvtorkmZCi5kVR04w894zplaGDEma4rj8Ylyxp7MLImzhsIog6sfREjjngFxvwbPBiBMnyM9baQ1zT9VYzxIzFxhtIOQlLUJnc1ux3thVpPNEvlPeNFmMeZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8omsDunYQL97n9dRdmwVwFDA4J80HJWNSHA1nNPCKA=;
 b=PMCkLV6m2uE6l99L7t73BsK4zK6g4nFmRsgvbb6K8yr2WsJ03BE/AyIZHFgoVy9FNwFScOBcim+XF6vLuDmvgg38UhX8o2kVtSH5X5AloLrz8moYuD515aFfH65smbv16cg6VRG6kTmdvhO3LUXmr4zZJc5S73efmJFuRylLd/vef6Svs5j90hNzHOAXCgr1zUbOHk43aG8m5fZVsg7zpe7VEBJEHQuLfGRUZI4rNR934OtqcJGfkFLKfkE1nOPxdhAFdN0MB1OvJmeCIql7KI3/XVb6UCMfZ87WWgdNRkobJw4derCqsjXasinvGauS3JqJ2u+zV251lQJBg+FCYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by AS4PR10MB5918.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:519::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 17:14:11 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b925:3d3d:8f5f:c4d9]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b925:3d3d:8f5f:c4d9%8]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 17:14:11 +0000
Date:   Wed, 29 Jun 2022 19:14:06 +0200
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
Message-ID: <20220629191406.35965d5b@md1za8fc.ad001.siemens.net>
In-Reply-To: <YryAXlZqcr/liN7n@smile.fi.intel.com>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
        <YqBS8I62YBPFC9iS@google.com>
        <CAHp75Ve9Lju8AEQd5huz1aYGg4sOu-ae7tTdyDWCXPCBR=wXbQ@mail.gmail.com>
        <YrGyWCaY+swYAYzH@smile.fi.intel.com>
        <YryAXlZqcr/liN7n@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d29b2d8-63ac-45d8-8a9c-08da59f2c8aa
X-MS-TrafficTypeDiagnostic: AS4PR10MB5918:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kkxqzysfY0fVmQw44YEBe99Nm59oLpp5S8yFjEdX8m7AMXo4oWkZTelqEZg1KcYnJToDubP6wvPVSnn6myknCADNqxe3bkxBKegLWsKwR26KwhlpQy9i8WLbNOdMW/HP+lbVSkLwfBKXXhKFCI4l2q88P0G2mJ98dJrMLKMocNpmHfuFALHopvsF9utvQ6rQ7b6fJe/4daTq+WyWxgfh7hQWD7n7mDeRZ984NKD3s+YAKIUDoxrMhq9YeYr1aXm0Av0tvS5M8IJZDyN8wzZt++vgUEsSwmnf0SO8kaHo6aruDCLiNxnU2OwHK5Gtozo2oRF/3j6DUfyGIxgWGOQYdNapWoUnQR6k+cuN6tfBut1/jpGKJ0F8XvHOJxnE+hS3cOh6aa6rwORIkt2jrP21rMeGhxPi1tS0nxYNLMsAIsWmghgPOTtA5TuX/u546iOTmeltsxTk7+LumzGT1C8N/ZKDPiW66npnAJ1nmW6kwuv8V04l+ZrQd57gigYyIl1sJHtKpnK+DV5lWeXhhohBIXAYCrOKdWjk6XyDcmpfQFkRlXLGspaPLgClRZLiVDDv9fe6S0uqIaAJ9dqum5Vv2UstbmVevXkhiKDBzZnnKvyQ5D/F22nZWL7LZXj2AmAWpw8qTJIQbSXDr936i0Poja1C73VjyDxHt1QtGD+Rzjc3jndPh6QthFA7lYojItsRB7fK8ilGLyD8Vkhao0HCGOzeLIo5RRxDpe7NqALB2cj5H4AderrxiiUk1YtdH2upISAuIFNFdSS6b2N0KiqAaYtWKr6T5Kn9gcrI6mgB/VlA2SONyC3gFFxVxbvsX9Lk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(1076003)(6916009)(54906003)(6512007)(2906002)(6666004)(83380400001)(6486002)(7416002)(38100700002)(186003)(6506007)(44832011)(316002)(966005)(478600001)(82960400001)(4326008)(86362001)(41300700001)(66476007)(66556008)(66946007)(5660300002)(8676002)(53546011)(8936002)(26005)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9mEzpXbCqciwSCaV2+C2tNA376Haaws4HTdRrO968INARZf3ND3dGdfsLhbL?=
 =?us-ascii?Q?p1y7MFgLaLpnTRwLynrHqOIiWtrAQZhXoenWGEsnA0GeKI1CNJh+GQb2Mdhu?=
 =?us-ascii?Q?d2gcjkeaejFydHeSufvXq6/SLpI/rdfKFo6VlQUda8UbHLkGcqOBzuYi6/yk?=
 =?us-ascii?Q?7WM5vWw+IwdECgls2bb1dzOwPkj6j9qBxJEzN3Ifbvj3sYn15eC1ZAvQMfui?=
 =?us-ascii?Q?joPcyMrkrQa+Zet4aCzZKFD5rWi2l27bcIvHbQBnLG44f7nThbefELUDn5e8?=
 =?us-ascii?Q?i/D2Bv29u2uVcQEBCYF3SWf6aTlxJA0eIIicjL4qjCAEH9GMA+qFLnSJuIUH?=
 =?us-ascii?Q?f43o9jp3b7dLEY5V5oQIxECLcghtDX7LNziNasymp6Ch4XR5bmBWzNrzZH4v?=
 =?us-ascii?Q?VEWjwHDbdXTWSeN8iw7Cy64uHpT8crcWsmTQ8goghqJTmaJj3/IpbPFKmAog?=
 =?us-ascii?Q?azrA2jn8ejEkmlQTD/NxTCTuqq/Usqwnk/d0b2ZQBWC+BVe1ZuVfUx7DTIt3?=
 =?us-ascii?Q?2LrhboBh98ysqq8eWnmt7jKZAHigAGqq5EEi9FMic4omxHAbaTxCoLLVZbrA?=
 =?us-ascii?Q?/jfFrztqiFrlMbY4HUcrzUjbiOnrTUSlzG4zLBkmUdri7RFCIkzCoOJsTHhh?=
 =?us-ascii?Q?B8TbdfouVFTGeYrFlkXJiGAGGfEoxH4TdPv/ItY116xIXF2ZIgGpRshL7WS8?=
 =?us-ascii?Q?UFG2T18aifUtZkuZkvfwo6GmUHoAI5QSaMhKGyH4oeTRlT6IPpYDEkVjTDcS?=
 =?us-ascii?Q?AbES/b8YDfFAs8Z2GfV48iPmlPlNVLEkX+thAeo9/5azti3y4xSyHc+0SxwT?=
 =?us-ascii?Q?sxKmtckYaQXXS7HJ5lDuiRDmANINTx5Ak9iJY9cRo2KHxCMBtlrY0L9bVNcl?=
 =?us-ascii?Q?VIjRnKwqOuBR12VQWQPcdD2NU/jEIgXKNvUaXiQIafZUpHLSVHs0XImwvbQK?=
 =?us-ascii?Q?eFPFzTcoRHOENFX/BmQ9ZXVoiqIByCBfxxKRBrHa89OzJKU/AH9m/6sqovJy?=
 =?us-ascii?Q?dFhE9SIczVxTJKlkNz4uCDKExT/Qv+VfZTlYbFabtkxz8IFKOzHE1FPb8g5C?=
 =?us-ascii?Q?607y22d/FLbOqezTOiY2Rm896Ti+gLD8DGOc1qo9gNibzMhgvXlKBQ5DOJj9?=
 =?us-ascii?Q?WNx9y16zWM82+qZ1linGjOmIiF6ysRaIZolu7GGMqKEw6+57Z8aiHR5D5NB7?=
 =?us-ascii?Q?aNZeqBtHPXrpmCAed1xUVOfLcWl5jKl/NeBs/14EQ/5tKicAwXXurReK9fd/?=
 =?us-ascii?Q?m+wZiTdZcuKiQnTwmdOE9Zl0ak4+tTa4x0rxYf4DeZuXuwMGG53Hbkc4vcYL?=
 =?us-ascii?Q?ttSVWUhLO45JgKC9uwQhQqRGMkwCCTmjUjMa6y7gbg3KNIrHQHR/gJZXVvp7?=
 =?us-ascii?Q?LZbx7iazuqeQlMtuydulXZbmi8po8XBgop0lik3q16JdDxgjKh2wzkb/hTl8?=
 =?us-ascii?Q?Iy3bbv8BKgH0LLHd3tphZUKBnswpkVbhVJU0WXp+LtDPUAzmuDiOD3+Gwsoz?=
 =?us-ascii?Q?Cge7msOR6ZwbCruv9weSWphQe9JQNDyKkmlUM/1IXpkDsc39iVUe4ihbZRTw?=
 =?us-ascii?Q?oufHs7EwVihptUA7+r+saFCg6CcsE+2WAQbfraTeLAHaHSXesPPsKyEZBv5r?=
 =?us-ascii?Q?ng=3D=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d29b2d8-63ac-45d8-8a9c-08da59f2c8aa
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 17:14:11.1131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29z2JyTXzN6dF70Kp0VcieGWsNTHac3TrGXWsfMfSSxCx/QvmIJGIltX1fHSXSGaApb7i6loWHAr9AVrZ8EWsKlBvg7qJiEiIygH1TzvuvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5918
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Wed, 29 Jun 2022 19:39:58 +0300
schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:

> +Cc: Rafael
> 
> On Tue, Jun 21, 2022 at 02:58:16PM +0300, Andy Shevchenko wrote:
> > On Wed, Jun 08, 2022 at 12:50:44PM +0200, Andy Shevchenko wrote:  
> > > On Wed, Jun 8, 2022 at 9:42 AM Lee Jones <lee.jones@linaro.org>
> > > wrote:  
> > > > On Mon, 06 Jun 2022, Andy Shevchenko wrote:
> > > >  
> > > > > There are a few users that would like to utilize P2SB
> > > > > mechanism of hiding and unhiding a device from the PCI
> > > > > configuration space.
> > > > >
> > > > > Here is the series to consolidate p2sb handling code for
> > > > > existing users and to provide a generic way for new comer(s).
> > > > >
> > > > > It also includes a patch to enable GPIO controllers on Apollo
> > > > > Lake when it's used with ABL bootloader w/o ACPI support.
> > > > >
> > > > > The patch that brings the helper ("platform/x86/intel: Add
> > > > > Primary to Sideband (P2SB) bridge support") has a commit
> > > > > message that sheds a light on what the P2SB is and why this
> > > > > is needed.
> > > > >
> > > > > I have tested this on Apollo Lake platform (I'm able to see
> > > > > SPI NOR and since we have an ACPI device for GPIO I do not
> > > > > see any attempts to recreate one).
> > > > >
> > > > > The series is ready to be merged via MFD tree, but see below.
> > > > >
> > > > > The series also includes updates for Simatic IPC drivers that
> > > > > partially tagged by respective maintainers (the main question
> > > > > is if Pavel is okay with the last three patches, since I
> > > > > believe Hans is okay with removing some code under PDx86).
> > > > > Hence the first 8 patches can be merged right away and the
> > > > > rest when Pavel does his review.  
> > > >
> > > > Can we just wait for Pavel's review, then merge them all at
> > > > once?  
> > > 
> > > Sure, it would be the best course of action.  
> > 
> > Pavel, do you have a chance to review the patches (last three) that
> > touch LED drivers? What would be your verdict?  
> 
> Lee, Rafael,
> 
> It seems quite hard to get Pavel's attention to this series [1]. It's
> already passed more than 3 weeks for any sign of review of three top
> patches of the series that touched LED subsystem. The entire series
> has all necessary tags, but for LED changes.
> 
> Note, that the top of this series is not done by me and was sent for
> preliminary review much earlier [2], altogether it makes months of no
> response from the maintainer.
> 
> The nature of patches is pretty simple and doesn't touch any of other
> than Simatic LED drivers nor LED core. Moreover, it was written by
> Siemens, who produces the H/W in question and very well tested as a
> separate change and as part of the series.

The code has been reviewed and is in fact pretty simple. The only
questionable but pragmatic change that might catch the attention of a
pedantic reviewer is that i did put the gpio implementation of the
driver under the same/existing kernel config switch.

> I think to move forward we may ask Rafael to review it on behalf of
> good maintainer and with his approval apply entire series.
> 
> Thoughts?

Thanks for pushing this Andy. I was wondering how and when that story
would continue. Technically these changes should really go in one badge
or we need to find a way to separate them somehow. I would try to go
that extra mile to get out of your way. But i am kind of afraid such an
effort might also end up touching the same files and block us at the
same maintainer.

Did anyone check whether Pavel was active at all in those last months
and maybe other patches waiting for review? Hope he is fine and active
and just somehow forgot/overlooked/ignored this one.

Henning

> [1]:
> https://lore.kernel.org/all/20220606164138.66535-1-andriy.shevchenko@linux.intel.com/
> [2]:
> https://lore.kernel.org/linux-leds/20220513083652.974-1-henning.schild@siemens.com/
> 

