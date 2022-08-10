Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7E958E7F1
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Aug 2022 09:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbiHJHij (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Aug 2022 03:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbiHJHii (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Aug 2022 03:38:38 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140055.outbound.protection.outlook.com [40.107.14.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63DE6AA2F;
        Wed, 10 Aug 2022 00:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/R6wHDx/oZAajmFb0FPeYFH5othmLpEtJWQ0z028i8zht2J7ZArQnRh8yATH8Wu3P246BzXh+KMBPf+Ke1WpN+lbB11e8X4rDZ/xUQs44roTetZ6OregPfe5RbuAAtRokG2uwRWismxxolTAsg3ObwTKtXNYFrGNMa7BL8g42fbzzoMz+KgMHaHJJTkp/GY1BDhYXno7sQPPhv4x2wmAUlBA8jdru2olbPHdFAunOlCl2RGvAmYDv4KkSLZWYHb/sanuQXmWljBS0s7kLCZK6mv+Zjxx0nyYx7eGFQqozbd6KVJskBwaHffCb0PFD1+BhltO8keFnxafMDloBZyPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOoxyoMqcEwWkSjOWVFQ3ffQBahuzfZDU+4pYZpg34Q=;
 b=UTl0UfYaQTPK7G6qbet1+7ZkkyMrO2AmhPDDSQAvaZlmGA+F6Arh4y/36LmKWSLEr2BpAwSpKivb30ZC7kjsYwd77kmHcePsw67Zgy13dK0KeGxGs2ZzwAVPdf6pdiShbOF19mVS87MbMFUQN6a+Tl8iVfaSw/D0B1XqxUI9qbSLxf7M2gFeIMbC3FupJtpHJ7lwzJSPkP3LZPWd70NDyrc2jy1Ik4300w1SYxJfkG2GexGW+R9IOJ+32Ci5Fvmnf1wM1CORgxBEtgBrB+AhLFnUQBRfEhXxo7U+wh6am/zQZoIDHhOkuEjZeFNb40JErxaZhEXFsumBlWRNPDBsAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOoxyoMqcEwWkSjOWVFQ3ffQBahuzfZDU+4pYZpg34Q=;
 b=HeT6XY8Gm5z0PrlNpJ30Tk+ZWPI9rNcIx52aMFNGZIOjTql2HlNGQUnq3qUDQaB65SkZrJ7Yc39tskAsbXAGxSGWyrETEHRno/IYtjErRfiBSxvSWn93w7GivJRUQ5SwSb3m3WgAdh5pkSwsoxUrMTcVykksghHPwPVw0RvRZBQ3S59APBTwEMt8p70Gim7PGl6H2D7y8qCcUniQwrkjacYnkxOYalVeBKtIEOkF1aTFFFCZo3uf1v7/ise+JcCZKyp39UWFKJoZyxwOzRtjW8qQCGFud5l7Go+GSsJWy6y8iBtXiWOUbUAo+BqvZbiAVB+dlIaqe/n4zYVEiQkfIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by PAXPR10MB5382.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:286::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 10 Aug
 2022 07:38:34 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::75ee:d5d2:6b1d:150b]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::75ee:d5d2:6b1d:150b%3]) with mapi id 15.20.5525.010; Wed, 10 Aug 2022
 07:38:34 +0000
Date:   Wed, 10 Aug 2022 09:38:20 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v6 00/12] platform/x86: introduce p2sb_bar() helper
Message-ID: <20220810093820.24ffd920@md1za8fc.ad001.siemens.net>
In-Reply-To: <YtVBViMLFIUfFpXa@smile.fi.intel.com>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
        <YtVBViMLFIUfFpXa@smile.fi.intel.com>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0047.namprd04.prod.outlook.com
 (2603:10b6:610:77::22) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2f72177-d797-40b4-258e-08da7aa35439
X-MS-TrafficTypeDiagnostic: PAXPR10MB5382:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RggTqx8SbSVSn3PGKMVm8L8MP5ossP9xO8o85XrJKsxhzfnbblKVtHG9K6jAHo222HQ8pWOAzXn12szotS9H7NPL61KNwB7foRzqV4UNSe/XHuiWUOC6yFN0UyGvIaHRFafP/gOqvGHDrRnGae4/8ETb7Ov++CdWtQn9e7WCvcqonw/N18eJu6olok8vLJEXMCuqbAjvtsSIHLw27hM0YkfYGRJQwGX+9uP7b9KpaDcpAGh/k0NuPzrAthGJVFMo70CQhBaNLS1w1EsYxicOyrjrtIKBbAiWUF6MB89jep1Eg8PGhnO8A+XVvBKe0osixkqSUFppt1wURcmkwDBmqRnqDYpiLRGRnRMERdhKkJxj3xRUTMdjFwRv+eZtkCFwzpGzaev+VoOs0yQfZ0/QGJwYL2lm8mcGrgNe9z16FKrkXGWLm0Lk/qL8oXrjma5dO3sZJ1itjpbhXvKAutwx21pCaxONEGounJq9zYNH9ahBJtEjyA+sNI8gHi4b1DBgsOLKn8hn77Y9q6JhGr+Luobxmix8uYhV5wBN2I85psdr4cdBo/nW3/xCR0egFUzEnaaVUCRtxERcohUAKHwkgCW25eCYhQvMaBkGGDf2QA5K3925yzWNZu14NOiFz2LZ8t+be5ipRSs9F80+5xaBWVQM/yaYwzSX9/5N8MTyM1e3mdGZZEEa9w4yWfu9sF1WQGbOezqHF3dZrRzR5Rdq3Mnum2vv3PXhgbY28982kT8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(5660300002)(44832011)(8676002)(66946007)(316002)(6916009)(4326008)(9686003)(66556008)(6512007)(7416002)(2906002)(38100700002)(66476007)(8936002)(1076003)(86362001)(54906003)(41300700001)(6486002)(478600001)(83380400001)(6506007)(82960400001)(26005)(6666004)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pYVB/0N2V0h1e8tFr1dYPd1zQrwlbnyu2Ue0GiR4xxgXkg4NO1JpFItfKGFl?=
 =?us-ascii?Q?d+lZUkjD+2iqTKs2QBEi2VAPY4hcUIifI2N2OusIZcyrSOYrKjprVyyWaDlT?=
 =?us-ascii?Q?tcW3jIzJXcAUaublDO/CLriqm9WhEuYP8OhJaoEbSG8QbK68WNYdZaJiTSaK?=
 =?us-ascii?Q?1cAlbOymzun8kqDzWxKUVRdcyvsfRkH83LYsb92Ln7s2HBUTEIqVoIi2kvYR?=
 =?us-ascii?Q?Xe6E1duPKuTevQdrD1VHvvWpL0yb2zJaozZZK1t+AdOiZ6t979n6t4euExmk?=
 =?us-ascii?Q?rtf64zqwi8il5v5Xq6rOsszS6u5bPzqPXHSc4rvbD+ydPkd/0hPZlNaCkSHJ?=
 =?us-ascii?Q?1dRFE1aBik9a7VuR0jdtbu+0MMzijiLPHjUWHS0Zc24G1DAWdO3eqlmXYl6s?=
 =?us-ascii?Q?uk+GknNO+Kb3ZrkHmJgmZhwZbyB5oozLC0LLYDZaCKB2bb+gvnNA2SYzj5lP?=
 =?us-ascii?Q?0HBR/5BGAqJItPo9QKXp3I9cOySXdNGUV9CNlKPKxOMoevskZFoy8MCd7Ls4?=
 =?us-ascii?Q?2TYm7ZbRyUFrpJy7VQxVPO0rkDZpSuK5piW0Kmkm4fua67Cpcydsz4cai2pB?=
 =?us-ascii?Q?k+5RK+WthlN85yWjn17t+tAPitszJ+kRMksbTGsXUBWNWMoZGqBrBVZVZQms?=
 =?us-ascii?Q?Y2Sh8mC2gXpS72LtNw1RdSj+xwFEIDR6GqfiRtAQ5KpDwnB/KMysDfb7JfqT?=
 =?us-ascii?Q?T7Mtm90bXwCmWWPmoUzsTfmCHAchWlqUCeIspNQEtjDrNN3Hlb6XjjxXcrph?=
 =?us-ascii?Q?1YwWiGziP73Dg0nFPh9QwmjTaxLQw2LeOD+wGlRA3/pIzYgMOTkbf63uo+gS?=
 =?us-ascii?Q?oiEzrOzzG3PqNy5qnlrJWeRVd45009pUorWTD5Ematy4sgV5jlfO+lT07OxB?=
 =?us-ascii?Q?rAm0DMBEAkd934z8QQ7MF8PCJeD247StgxxoCb/0kixO5N4OMmtvNCJT5yr7?=
 =?us-ascii?Q?mfWrccJkZ03JY/hjGa0PaqAEAslJ392XV/tqcD/IcUbZ/fdqpBSChiLIDbFB?=
 =?us-ascii?Q?zduHnOWos+8MCOEC82fYkXo4BUx2BpKrecidNCIDD1xj2dqXEC0JhSySgqKw?=
 =?us-ascii?Q?rXMIOX9MW//3qBSsi+9CNKjSaWX5JNXOMQjXJT+y3B2scH21cvQGUXLyiyrB?=
 =?us-ascii?Q?tBm6jC2BmVRWrB3i2Zdlp5n7+TopLc9cfioPPGQrQoA86IUXRP5F+aKI2CBK?=
 =?us-ascii?Q?Evk3fielETPl+XsnwT+q+hl6zvcHRHCOko4lgGB0LfuVrnlZCE8ZwpTKK+nF?=
 =?us-ascii?Q?PmGqrR2ESdk8VwTwT/JsBUfioMlaKG1kTIkZ+FY4oSg1oVFYopTw/GwrYmJI?=
 =?us-ascii?Q?8yoTQBgrPp+Rof8JLb+rb1RrEMDdPDQNIDRoP6DRNMtaqDIJfFri6xZvID7G?=
 =?us-ascii?Q?oC4Wg5ggoHdFmi9VMDjz8MO8GkhRdCavyT0cQqJS448bfvnj+YBPvlJ1KnPd?=
 =?us-ascii?Q?1mR+pDWo1U9dHN3T4jgEkbOxsUvFfYMx5e8HZmuNQfAt6R6ZO7OcnTgKPICW?=
 =?us-ascii?Q?CZ0KqSZ7aKSo5+hlbCTflKW5hMW0BrSpqnyIyixvBuybw+arF16Q1qv0bp5U?=
 =?us-ascii?Q?Q8Q4vCFgEwMM2fj/X1CTiPoXLrcB8dIDvhL4Zh5js9Fxc2p9/hgXo0CHJvHR?=
 =?us-ascii?Q?gA=3D=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f72177-d797-40b4-258e-08da7aa35439
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 07:38:33.9822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYIuC6p1FK3m68hpWRNCtlJk+ze+buKQLxwezKIoAMljmoXHKvydIygQq8CEoBuN6QMLdDZ39z74dKvRb2t422mpRS1F9iMebaPFXkF35XQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5382
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Mon, 18 Jul 2022 14:17:42 +0300
schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:

> On Mon, Jun 06, 2022 at 07:41:26PM +0300, Andy Shevchenko wrote:
> > There are a few users that would like to utilize P2SB mechanism of
> > hiding and unhiding a device from the PCI configuration space.
> > 
> > Here is the series to consolidate p2sb handling code for existing
> > users and to provide a generic way for new comer(s).
> > 
> > It also includes a patch to enable GPIO controllers on Apollo Lake
> > when it's used with ABL bootloader w/o ACPI support.
> > 
> > The patch that brings the helper ("platform/x86/intel: Add Primary
> > to Sideband (P2SB) bridge support") has a commit message that sheds
> > a light on what the P2SB is and why this is needed.
> > 
> > I have tested this on Apollo Lake platform (I'm able to see SPI NOR
> > and since we have an ACPI device for GPIO I do not see any attempts
> > to recreate one).
> > 
> > The series is ready to be merged via MFD tree, but see below.
> > 
> > The series also includes updates for Simatic IPC drivers that
> > partially tagged by respective maintainers (the main question is if
> > Pavel is okay with the last three patches, since I believe Hans is
> > okay with removing some code under PDx86). Hence the first 8
> > patches can be merged right away and the rest when Pavel does his
> > review.  
> 
> Kernel test bot seems found an issue with dependencies, because
> selection of P2SB is not enough.
> 
> There are two solutions that I can see now:
> 1) move P2SB out of X86_PLATFORM_DEVICES section (like PMC_ATOM);
> 2) add 'depends on X86_PLATFORM_DEVICES' to the affected drivers.
> 
> I think the first solution cleaner, because it would be strange to
> have the dependency on the drivers that quite unlikely be on server
> platforms (e.g. EDAC).
> 
> In long term perhaps something like drivers/platform/x86/lib which is
> for platform libraries or so and independent on X86_PLATFORM_DEVICES?
> 
> I will send a fix soon as per 1) above, feel free to comment here or
> there.

Hey Andy,

is that one on the way already? I meanwhile also found a possible
configuration issue in my patches you carry on top. And i suggest to
include or squash
[PATCH] leds: simatic-ipc-leds-gpio: make sure we have the GPIO
providing driver

in this series.

I am also working on adding more models which have GPIO based LEDs. All
the patches are based on this series because it is where i currently
introduce GPIO based LEDs for simatic. I would not want to change the
ordering but at the same time i would like to meet 5.20.

regards,
Henning
