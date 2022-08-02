Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71C2A587B1C
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Aug 2022 12:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236622AbiHBKzH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Aug 2022 06:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbiHBKzG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Aug 2022 06:55:06 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140055.outbound.protection.outlook.com [40.107.14.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056D724F05;
        Tue,  2 Aug 2022 03:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbzpsgMNovr/Ti3gxM3QFxpYEBxDg8Nhdcaphk6ifYsf/a0w0lX/eN7Ix3osvRsREH7KFZoa3Vc8l/oGzQxayGq1R2QnWNwrts5WpuJqGmeg6Ruor3YIP5Vhg9l7wBXv1PlNlB5bTa+vw/mZJZLIbsE7SxoHA//fBO/ltIFIAOVgigawN6T3JJ6GrAVzdb8gj3n1+0HWjJbv9Ne4KLNOuMgwr47xKLF4jOU/k+PgboxAW/hycjcON18fguuH55EQZjaLIOhtT1t0Doj6AECMr4dZiXUCzZDEXeFEXCKTDOS3kAVOgiG7isM6CRAp4Ira8YLU9dy3vXZWVW+JBwc8SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkh86vARxt9tP7ZONABZ/h099NwhvUhAgXCffDxyKj0=;
 b=feE9ttM0GViSv4lGQRi8H2j928IJu+UmNMuQTldUpBj+kEM2/JcpLzaOc5ArHvOgS36jraamUnXLGCbFHaSMwFL8NbjF6ksLUwwa/V6j7WPOwLr0dsN6l7dPH5q27H/LT9Z1euuBuhd0lcEyEUFw6LjtU2sM5FYZLBbtcGszoeTFu/FGSDBnBge7t/lzV0IcLrf151sCWdhlDYSn9LTpRMLHeUehX4v1lVGhoxHM4c1nSChkJSR6yDTvPIUwk8OzHjNE5Um2KVu05z0U5lRj8yWhpuswE6GHBKkOElLA2wWZaa8CULtznMhz5+iFJQrf0aZm8yu8fyCOhtgdP4q7Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkh86vARxt9tP7ZONABZ/h099NwhvUhAgXCffDxyKj0=;
 b=gezT2P5G22uWFGdPpIEh3ED5wQ+XV33CVClKZZBR7gkIlC2WEreASAWtmu+wbuVwaNoDFAlF45gzHkTaHeH0twwQEJOFT4p3oVHK+TnWADnIViIxUKxzpLxncZ7SL3PeHOg9kXUX7KqWutPP8ZgqTVyMCF80KEW8PHwjxRzFOUNBS0gnbbCJDYXR5htcsK6qGV4FLsWFxap18yOiFVeNKqCuLdafHwTI+TERik/cYh94xvEgmHZseOQfwtdDR0ylg1PpKLSgfVImz9xtBhmbFB8iIGOw/y86cRfopUfgM5kUXxQn16TSoacbn2kngvWB2sAA7UHnQQq5VoYKUYDNjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by AM9PR10MB4435.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:26f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 2 Aug
 2022 10:55:00 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::75ee:d5d2:6b1d:150b]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::75ee:d5d2:6b1d:150b%3]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 10:55:00 +0000
Date:   Tue, 2 Aug 2022 12:54:57 +0200
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
Subject: Re: [PATCH v6 12/12] leds: simatic-ipc-leds-gpio: add GPIO version
 of Siemens driver
Message-ID: <20220802125457.73515609@md1za8fc.ad001.siemens.net>
In-Reply-To: <20220801160948.1bb59da2@md1za8fc.ad001.siemens.net>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
        <20220606164138.66535-13-andriy.shevchenko@linux.intel.com>
        <20220801160948.1bb59da2@md1za8fc.ad001.siemens.net>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::11) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26fdd9cd-596e-46a8-d051-08da74757226
X-MS-TrafficTypeDiagnostic: AM9PR10MB4435:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ETO6482U433LWqWp0AUgthuPbXCrYSQXitvS/G08cmDdCgaanggTi8eXEREM4c+QM8jE7I5d+6K8On/OcTi6tcCkxsTZ1hYZPI7koT0PDHIYg4MTt6uMsjP7jJK/vUPB0m1vXZTGbRdSSIBusJONqCoS+4B6pnqSXq0696bXhjPwqj54vnMN5dBG4Mp0/JPfDXFw69ez/5Lo9lYdb6lKW9ff9keXM8VJLOhUTLY/iYdFXek4ycPjhpurXJowDjYfq3tjitm6iSUP5FuxWkj5hwFnwashCEOrayNFpTl/ypYgqF2aMtuzmhJmYynwhBl2x2Bb/hM2c8k3WyxmzfHfi6hLPnqFAeolLmWzTSHTB2JnDGocu9P32qAA71LzS/NJEGTX0c6ieEM02a7oI5j8l+IgPYffPWdRnPyL9euA5eHMhaWM4MZANkSwJ2cUXlmNc01cXzAejh33+TaLe7aV6jd3eQBbVp/WiXuE5b7oEPSVmnV5iXo6K0ZdRU/hjs0UWD1IIZh/SNmJ1ntV+z76VUWesM9YQsYuedqW/IbHHFEfPeJ4mKVmqFZ7HNogHyOofCxjjTdFg8XJpyZtn525mT+H1q9h/HqfqVaHLB25giogw7+yaVT8REP/MwVut4akTvghAQLtzfdJuRj3a2CpYGbMg14CsJcNO4ULqqmDDSiWcA7Pfzb+mRd1aHkLmw2SEMGyyCQJhtK1nr/6Fz6f2YzgktqD9Z+1YmEMZ5XwbRQPq2vXMMpio+XDRodfNf+M
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(186003)(9686003)(6512007)(30864003)(26005)(44832011)(478600001)(6486002)(66476007)(8676002)(66556008)(66946007)(4326008)(5660300002)(7416002)(8936002)(83380400001)(82960400001)(6506007)(38100700002)(2906002)(41300700001)(54906003)(6916009)(6666004)(86362001)(316002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bp/kMHt8AQ2frZBnkrrROMjS9kV2LcUTNLm0n+jFhnR+Py9fF85gv+NrTL5u?=
 =?us-ascii?Q?O/AJ/BoWRrq5GaWasOlw/8eyQnK4YQD9B81VPQiFBcM6V0/b3BxeC5IzQpgY?=
 =?us-ascii?Q?eL7e1Bqx1VX81Oop3FIdWUt7tVb+i4UBACMQRum12RvEGcY8oFN1QPXlnk0C?=
 =?us-ascii?Q?XtP83T4St/n8f5R+J+623g/u7qpn6m4FTqjGGaJkJTwKxUdklI1PTs38DjGZ?=
 =?us-ascii?Q?DS8pqk7XrjHycwRK10ybawywyAvhqpHcLfZX7sMEBvqNw5nsuYDycBzsZDk8?=
 =?us-ascii?Q?VV+ku6SzK/+LkTXtVYiZ5gA0u+jRQ5qH4knYWPzWKHIkOB5TpN4+JD9nsn9h?=
 =?us-ascii?Q?nVETvvbyjfgPr50Up88nLHbA9ir7ioCLZFgZXijWYxMkJI7No+BkKseCwTcQ?=
 =?us-ascii?Q?T50QXB0yZuvh0H/5IYmcC2IRYzBpaqbTLBip5Kda7pd7HzIyjnF18ujnGd3L?=
 =?us-ascii?Q?8csMrhXYg9DTdi4ixnfG5MvF9lNqVyZJM66oyWfivfit1B9JUgmLFOPPrNdT?=
 =?us-ascii?Q?8JY+KmbjS7TAzGaLG7rtCq0RTFBnDr84ZlvJ9S21ARv1+Deans8Y4+RWjzag?=
 =?us-ascii?Q?bKKDTWrjrT96D6/k17Z90bXK9B49HBfva/CYd2aE36VDFBrPoKi70yCDSA1K?=
 =?us-ascii?Q?oJPE/OBhrrtR2zf3dgc0D/PRZla3Q7u8uUDpwis8myZhfvxRk8W7kBQJ/+YV?=
 =?us-ascii?Q?ff0EdQi8kmyErnSzwjXIgq08GSFlO+A6WLsMhGqhebfxX4p4KPLLoU+/8lQz?=
 =?us-ascii?Q?+imabLW68duvJA5ypm3nhfKT/fiUpccJsq5WVf5LtpwC8sSAZTRZN3RNwXZe?=
 =?us-ascii?Q?QaXgO549Uim2nrOiD7UbeL1bYM8UzaAhflvhyMIxAX6JeM+fTRFK+ap3PV7H?=
 =?us-ascii?Q?eFYGLSki3dY6+UHT1o5gGkmUecfZwT6goENcq//KMimaItAjgT/5lZRr8K87?=
 =?us-ascii?Q?CEjMI0yuxxilo4vODIQdbAa7w0M4nyDQLrKHhX9YQWlbjDbVaIElggHE08Zf?=
 =?us-ascii?Q?sMpmV5Ndkf5C9FM2qAKYPKtNA3qaejyZGrnBdsQlbdya/bqJdbjdKLs7JAHh?=
 =?us-ascii?Q?OfzwS7jlCwtHQDGSlRblV2DTITSCCPFHf6z+2+s+wFKEdGdmAO36OKRDuUcC?=
 =?us-ascii?Q?LfgEGnUF3G0lJYreeX/HQmm5v4D1N7vt0uO+1o8gvlhxIH7hhLrWqX31BG/v?=
 =?us-ascii?Q?ZdUWzTm5xfhNWWdnHDgfoPeETKDTyUHqHlcHSGU5c86PAWgqMLLMpCbN1LVt?=
 =?us-ascii?Q?PPSKm+bsCSPxQcihISo10R2i/FAwdk37WzddTs+28FkNHSN61a4eILv5YRzK?=
 =?us-ascii?Q?Bjb2piwfeHh5QxCJvD1OZE6ozhpNJtHgzLgwjdFP8cq92NW5QUWBPii2hv4y?=
 =?us-ascii?Q?cAz6RCErS4gyD1Y+wpy+toLC2dzgVtx5yzSaSb7NJHniVVeFn9dITR0+Pup2?=
 =?us-ascii?Q?xPcHVo81WAoiw8/qgq9yo1hppQzQocbbhuC4zfUhgXiLzuGyK8TayFY9POvG?=
 =?us-ascii?Q?HjmHc2MgmVv5xTqmPmY6Fd0yBYJ52uBBJoBQgdwN2SLmOxHsysRUYL2LIZ0a?=
 =?us-ascii?Q?8J0V7QniqZAkhyk+EgTMjzKfHq/9fYtekOJbSs4VxsYb07c4VykbEoY0+Wn+?=
 =?us-ascii?Q?2A=3D=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26fdd9cd-596e-46a8-d051-08da74757226
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 10:55:00.3050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3teIglYhOCeQHgO3I7PCnsqv1v8avH0ePaKQURo0QMph2s3pB8gJfZrsWSNbGXHk8vvtnrsWh2O6iJc5y5qdaMI6zA1MtM3h8q4ON00ydA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4435
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Mon, 1 Aug 2022 16:09:48 +0200
schrieb Henning Schild <henning.schild@siemens.com>:

> Am Mon,  6 Jun 2022 19:41:38 +0300
> schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> 
> > From: Henning Schild <henning.schild@siemens.com>
> > 
> > On Apollo Lake the pinctrl drivers will now come up without ACPI.
> > Use that instead of open coding it.
> > Create a new driver for that which can later be filled with more
> > GPIO based models, and which has different dependencies.
> > 
> > Signed-off-by: Henning Schild <henning.schild@siemens.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/leds/simple/Kconfig                 |   7 +-
> >  drivers/leds/simple/Makefile                |   1 +
> >  drivers/leds/simple/simatic-ipc-leds-gpio.c | 105
> > ++++++++++++++++++++ drivers/leds/simple/simatic-ipc-leds.c      |
> > 80 +-------------- drivers/platform/x86/simatic-ipc.c          |   5
> > +- 5 files changed, 117 insertions(+), 81 deletions(-)
> >  create mode 100644 drivers/leds/simple/simatic-ipc-leds-gpio.c
> > 
> > diff --git a/drivers/leds/simple/Kconfig
> > b/drivers/leds/simple/Kconfig index bbf8cff3c3f6..fd2b8225d926
> > 100644 --- a/drivers/leds/simple/Kconfig
> > +++ b/drivers/leds/simple/Kconfig
> > @@ -1,12 +1,11 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  config LEDS_SIEMENS_SIMATIC_IPC
> >  	tristate "LED driver for Siemens Simatic IPCs"
> > -	depends on LEDS_CLASS
> > +	depends on LEDS_GPIO

depends on PINCTRL_BROXTON

Will have to see how to handle the additional boards. Either a gpio
driver per pinctrl provider with a clear dep chain, or some sort up
runtime check like i described in the earlier mail. Or simply depend on
all potential providers in one driver, even if on a given board only
one will be used.

Henning

> >  	depends on SIEMENS_SIMATIC_IPC
> > -	select P2SB
> >  	help
> >  	  This option enables support for the LEDs of several
> > Industrial PCs from Siemens.
> >  
> > -	  To compile this driver as a module, choose M here: the
> > module
> > -	  will be called simatic-ipc-leds.
> > +	  To compile this driver as a module, choose M here: the
> > modules
> > +	  will be called simatic-ipc-leds and
> > simatic-ipc-leds-gpio. diff --git a/drivers/leds/simple/Makefile
> > b/drivers/leds/simple/Makefile index 8481f1e9e360..1c7ef5e1324b
> > 100644 --- a/drivers/leds/simple/Makefile
> > +++ b/drivers/leds/simple/Makefile
> > @@ -1,2 +1,3 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+= simatic-ipc-leds.o
> > +obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+=
> > simatic-ipc-leds-gpio.o diff --git
> > a/drivers/leds/simple/simatic-ipc-leds-gpio.c
> > b/drivers/leds/simple/simatic-ipc-leds-gpio.c new file mode 100644
> > index 000000000000..4c9e663a90ba --- /dev/null
> > +++ b/drivers/leds/simple/simatic-ipc-leds-gpio.c
> > @@ -0,0 +1,105 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Siemens SIMATIC IPC driver for GPIO based LEDs
> > + *
> > + * Copyright (c) Siemens AG, 2022
> > + *
> > + * Authors:
> > + *  Henning Schild <henning.schild@siemens.com>
> > + */
> > +
> > +#include <linux/gpio/machine.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/leds.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +
> > +static struct gpiod_lookup_table simatic_ipc_led_gpio_table = {
> > +	.dev_id = "leds-gpio",
> > +	.table = {
> > +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 51, NULL,
> > 0, GPIO_ACTIVE_LOW),
> > +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 52, NULL,
> > 1, GPIO_ACTIVE_LOW),
> > +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 53, NULL,
> > 2, GPIO_ACTIVE_LOW),
> > +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 57, NULL,
> > 3, GPIO_ACTIVE_LOW),
> > +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 58, NULL,
> > 4, GPIO_ACTIVE_LOW),
> > +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 60, NULL,
> > 5, GPIO_ACTIVE_LOW),
> > +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 56, NULL,
> > 6, GPIO_ACTIVE_LOW),
> > +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 59, NULL,
> > 7, GPIO_ACTIVE_HIGH),
> > +	},
> > +};
> > +
> > +static const struct gpio_led simatic_ipc_gpio_leds[] = {
> > +	{ .name = "green:" LED_FUNCTION_STATUS "-3" },
> > +	{ .name = "red:" LED_FUNCTION_STATUS "-1" },
> > +	{ .name = "green:" LED_FUNCTION_STATUS "-1" },
> > +	{ .name = "red:" LED_FUNCTION_STATUS "-2" },
> > +	{ .name = "green:" LED_FUNCTION_STATUS "-2" },
> > +	{ .name = "red:" LED_FUNCTION_STATUS "-3" },
> > +};
> > +
> > +static const struct gpio_led_platform_data
> > simatic_ipc_gpio_leds_pdata = {
> > +	.num_leds	= ARRAY_SIZE(simatic_ipc_gpio_leds),
> > +	.leds		= simatic_ipc_gpio_leds,
> > +};
> > +
> > +static struct platform_device *simatic_leds_pdev;
> > +
> > +static int simatic_ipc_leds_gpio_remove(struct platform_device
> > *pdev) +{
> > +	gpiod_remove_lookup_table(&simatic_ipc_led_gpio_table);
> > +	platform_device_unregister(simatic_leds_pdev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int simatic_ipc_leds_gpio_probe(struct platform_device
> > *pdev) +{
> > +	struct gpio_desc *gpiod;
> > +	int err;
> > +
> > +	gpiod_add_lookup_table(&simatic_ipc_led_gpio_table);
> > +	simatic_leds_pdev = platform_device_register_resndata(NULL,
> > +		"leds-gpio", PLATFORM_DEVID_NONE, NULL, 0,
> > +		&simatic_ipc_gpio_leds_pdata,
> > +		sizeof(simatic_ipc_gpio_leds_pdata));  
> 
> If those GPIOs can not be found that leads to a pretty severe
> logging/polling endless loop.
> 
> ...
> [   34.017017] leds-gpio leds-gpio: Skipping unavailable LED gpio 0
> (red:status-2) [   34.017038] leds-gpio leds-gpio: cannot find GPIO
> chip apollolake-pinctrl.0, deferring [   34.017158] leds-gpio
> leds-gpio: Skipping unavailable LED gpio 0 (red:status-2) [
> 34.017161] leds-gpio leds-gpio: cannot find GPIO chip
> apollolake-pinctrl.0, deferring [   34.017163] leds-gpio leds-gpio:
> Skipping unavailable LED gpio 0 (green:status-2) [   34.017166]
> leds-gpio leds-gpio: cannot find GPIO chip apollolake-pinctrl.0,
> deferring [   34.017168] leds-gpio leds-gpio: Skipping unavailable
> LED gpio 0 (red:status-3) [   34.017179] leds-gpio leds-gpio: cannot
> find GPIO chip apollolake-pinctrl.0, deferring [   34.017275]
> leds-gpio leds-gpio: cannot find GPIO chip apollolake-pinctrl.0,
> deferring [   34.017279] leds-gpio leds-gpio: Skipping unavailable
> LED gpio 0 (green:status-3) ... 
> 
> This can be seen when the kernel is build without
> CONFIG_PINCTRL_BROXTON. Can anyone please give advise on how to
> proceed here.
> 
> I could do something like i proposed in "[PATCH 3/4] leds:
> simatic-ipc-leds-gpio: add new model 227G".
> 
> if (!IS_ENABLED(CONFIG_PINCTRL_BROXTON)) return -ENO...
> 
> before registering the platform device.
> 
> An alternative could be to try and handle that -EPROBE_DEFER but that
> might be hard because it might well fail a couple of times before
> eventually that gpio driver is up, so i think i will send an update
> implementing that !IS_ENABLED.
> 
> Ideally the gpio subsystem or leds-gpio would break that
> polling/printing loop for me, or make sure it would not happen in the
> first place.
> 
> regards,
> Henning
> 
> > +	if (IS_ERR(simatic_leds_pdev)) {
> > +		err = PTR_ERR(simatic_leds_pdev);
> > +		goto out;
> > +	}
> > +
> > +	/* PM_BIOS_BOOT_N */
> > +	gpiod = gpiod_get_index(&simatic_leds_pdev->dev, NULL, 6,
> > GPIOD_OUT_LOW);
> > +	if (IS_ERR(gpiod)) {
> > +		err = PTR_ERR(gpiod);
> > +		goto out;
> > +	}
> > +	gpiod_put(gpiod);
> > +
> > +	/* PM_WDT_OUT */
> > +	gpiod = gpiod_get_index(&simatic_leds_pdev->dev, NULL, 7,
> > GPIOD_OUT_LOW);
> > +	if (IS_ERR(gpiod)) {
> > +		err = PTR_ERR(gpiod);
> > +		goto out;
> > +	}
> > +	gpiod_put(gpiod);
> > +
> > +	return 0;
> > +out:
> > +	simatic_ipc_leds_gpio_remove(pdev);
> > +
> > +	return err;
> > +}
> > +
> > +static struct platform_driver simatic_ipc_led_gpio_driver = {
> > +	.probe = simatic_ipc_leds_gpio_probe,
> > +	.remove = simatic_ipc_leds_gpio_remove,
> > +	.driver = {
> > +		.name = KBUILD_MODNAME,
> > +	}
> > +};
> > +module_platform_driver(simatic_ipc_led_gpio_driver);
> > +
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_ALIAS("platform:" KBUILD_MODNAME);
> > +MODULE_SOFTDEP("pre: platform:leds-gpio");
> > +MODULE_AUTHOR("Henning Schild <henning.schild@siemens.com>");
> > diff --git a/drivers/leds/simple/simatic-ipc-leds.c
> > b/drivers/leds/simple/simatic-ipc-leds.c index
> > 2e7597c143d8..4894c228c165 100644 ---
> > a/drivers/leds/simple/simatic-ipc-leds.c +++
> > b/drivers/leds/simple/simatic-ipc-leds.c @@ -15,7 +15,6 @@
> >  #include <linux/leds.h>
> >  #include <linux/module.h>
> >  #include <linux/pci.h>
> > -#include <linux/platform_data/x86/p2sb.h>
> >  #include <linux/platform_data/x86/simatic-ipc-base.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/sizes.h>
> > @@ -24,7 +23,7 @@
> >  #define SIMATIC_IPC_LED_PORT_BASE	0x404E
> >  
> >  struct simatic_ipc_led {
> > -	unsigned int value; /* mask for io and offset for mem */
> > +	unsigned int value; /* mask for io */
> >  	char *name;
> >  	struct led_classdev cdev;
> >  };
> > @@ -39,21 +38,6 @@ static struct simatic_ipc_led
> > simatic_ipc_leds_io[] = { { }
> >  };
> >  
> > -/* the actual start will be discovered with p2sb, 0 is a
> > placeholder */ -static struct resource simatic_ipc_led_mem_res =
> > DEFINE_RES_MEM_NAMED(0, 0, KBUILD_MODNAME); -
> > -static void __iomem *simatic_ipc_led_memory;
> > -
> > -static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
> > -	{0x500 + 0x1A0, "red:" LED_FUNCTION_STATUS "-1"},
> > -	{0x500 + 0x1A8, "green:" LED_FUNCTION_STATUS "-1"},
> > -	{0x500 + 0x1C8, "red:" LED_FUNCTION_STATUS "-2"},
> > -	{0x500 + 0x1D0, "green:" LED_FUNCTION_STATUS "-2"},
> > -	{0x500 + 0x1E0, "red:" LED_FUNCTION_STATUS "-3"},
> > -	{0x500 + 0x198, "green:" LED_FUNCTION_STATUS "-3"},
> > -	{ }
> > -};
> > -
> >  static struct resource simatic_ipc_led_io_res =
> >  	DEFINE_RES_IO_NAMED(SIMATIC_IPC_LED_PORT_BASE, SZ_2,
> > KBUILD_MODNAME); 
> > @@ -89,28 +73,6 @@ static enum led_brightness
> > simatic_ipc_led_get_io(struct led_classdev *led_cd) return
> > inw(SIMATIC_IPC_LED_PORT_BASE) & led->value ? LED_OFF :
> > led_cd->max_brightness; } 
> > -static void simatic_ipc_led_set_mem(struct led_classdev *led_cd,
> > -				    enum led_brightness brightness)
> > -{
> > -	struct simatic_ipc_led *led = cdev_to_led(led_cd);
> > -	void __iomem *reg = simatic_ipc_led_memory + led->value;
> > -	u32 val;
> > -
> > -	val = readl(reg);
> > -	val = (val & ~1) | (brightness == LED_OFF);
> > -	writel(val, reg);
> > -}
> > -
> > -static enum led_brightness simatic_ipc_led_get_mem(struct
> > led_classdev *led_cd) -{
> > -	struct simatic_ipc_led *led = cdev_to_led(led_cd);
> > -	void __iomem *reg = simatic_ipc_led_memory + led->value;
> > -	u32 val;
> > -
> > -	val = readl(reg);
> > -	return (val & 1) ? LED_OFF : led_cd->max_brightness;
> > -}
> > -
> >  static int simatic_ipc_leds_probe(struct platform_device *pdev)
> >  {
> >  	const struct simatic_ipc_platform *plat =
> > pdev->dev.platform_data; @@ -118,9 +80,7 @@ static int
> > simatic_ipc_leds_probe(struct platform_device *pdev) struct
> > simatic_ipc_led *ipcled; struct led_classdev *cdev;
> >  	struct resource *res;
> > -	void __iomem *reg;
> > -	int err, type;
> > -	u32 val;
> > +	int err;
> >  
> >  	switch (plat->devmode) {
> >  	case SIMATIC_IPC_DEVICE_227D:
> > @@ -135,51 +95,19 @@ static int simatic_ipc_leds_probe(struct
> > platform_device *pdev) }
> >  			ipcled = simatic_ipc_leds_io;
> >  		}
> > -		type = IORESOURCE_IO;
> >  		if (!devm_request_region(dev, res->start,
> > resource_size(res), KBUILD_MODNAME)) { dev_err(dev, "Unable to
> > register IO resource at %pR\n", res); return -EBUSY;
> >  		}
> >  		break;
> > -	case SIMATIC_IPC_DEVICE_127E:
> > -		res = &simatic_ipc_led_mem_res;
> > -		ipcled = simatic_ipc_leds_mem;
> > -		type = IORESOURCE_MEM;
> > -
> > -		err = p2sb_bar(NULL, 0, res);
> > -		if (err)
> > -			return err;
> > -
> > -		/* do the final address calculation */
> > -		res->start = res->start + (0xC5 << 16);
> > -		res->end = res->start + SZ_4K - 1;
> > -
> > -		simatic_ipc_led_memory = devm_ioremap_resource(dev,
> > res);
> > -		if (IS_ERR(simatic_ipc_led_memory))
> > -			return PTR_ERR(simatic_ipc_led_memory);
> > -
> > -		/* initialize power/watchdog LED */
> > -		reg = simatic_ipc_led_memory + 0x500 + 0x1D8; /*
> > PM_WDT_OUT */
> > -		val = readl(reg);
> > -		writel(val & ~1, reg);
> > -
> > -		reg = simatic_ipc_led_memory + 0x500 + 0x1C0; /*
> > PM_BIOS_BOOT_N */
> > -		val = readl(reg);
> > -		writel(val | 1, reg);
> > -		break;
> >  	default:
> >  		return -ENODEV;
> >  	}
> >  
> >  	while (ipcled->value) {
> >  		cdev = &ipcled->cdev;
> > -		if (type == IORESOURCE_MEM) {
> > -			cdev->brightness_set =
> > simatic_ipc_led_set_mem;
> > -			cdev->brightness_get =
> > simatic_ipc_led_get_mem;
> > -		} else {
> > -			cdev->brightness_set =
> > simatic_ipc_led_set_io;
> > -			cdev->brightness_get =
> > simatic_ipc_led_get_io;
> > -		}
> > +		cdev->brightness_set = simatic_ipc_led_set_io;
> > +		cdev->brightness_get = simatic_ipc_led_get_io;
> >  		cdev->max_brightness = LED_ON;
> >  		cdev->name = ipcled->name;
> >  
> > diff --git a/drivers/platform/x86/simatic-ipc.c
> > b/drivers/platform/x86/simatic-ipc.c index
> > 26c35e1660cb..ca3647b751d5 100644 ---
> > a/drivers/platform/x86/simatic-ipc.c +++
> > b/drivers/platform/x86/simatic-ipc.c @@ -51,6 +51,7 @@ static int
> > register_platform_devices(u32 station_id) {
> >  	u8 ledmode = SIMATIC_IPC_DEVICE_NONE;
> >  	u8 wdtmode = SIMATIC_IPC_DEVICE_NONE;
> > +	char *pdevname = KBUILD_MODNAME "_leds";
> >  	int i;
> >  
> >  	platform_data.devmode = SIMATIC_IPC_DEVICE_NONE;
> > @@ -64,10 +65,12 @@ static int register_platform_devices(u32
> > station_id) }
> >  
> >  	if (ledmode != SIMATIC_IPC_DEVICE_NONE) {
> > +		if (ledmode == SIMATIC_IPC_DEVICE_127E)
> > +			pdevname = KBUILD_MODNAME "_leds_gpio";
> >  		platform_data.devmode = ledmode;
> >  		ipc_led_platform_device =
> >  			platform_device_register_data(NULL,
> > -				KBUILD_MODNAME "_leds",
> > PLATFORM_DEVID_NONE,
> > +				pdevname, PLATFORM_DEVID_NONE,
> >  				&platform_data,
> >  				sizeof(struct
> > simatic_ipc_platform)); if (IS_ERR(ipc_led_platform_device))  
> 

