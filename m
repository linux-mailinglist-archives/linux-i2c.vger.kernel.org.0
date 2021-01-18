Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 441A12FA3A3
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 15:53:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393083AbhAROw0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 09:52:26 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:53804 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393077AbhAROwX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 09:52:23 -0500
Date:   Mon, 18 Jan 2021 14:51:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610981499;
        bh=qt2x5rgrpJue2xHPYqaQ4C7ABTsoce3bhOjz1FhicmU=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=pZBYgsbrcbcAlwRreIIzd7K09ne/a30fnt1I38L3S7wWkVfApM+oshWHpvErqPg1/
         sL5OS3Y0TndIU3J3PtbU8x4FDmtwqkbU4uGotikqUVAdjhxSO82csOil4HEdw3zE4h
         d0JRD++/HF2CL+FmFYsPSOVDR0TDwMCMXIlrJCLQ=
To:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "devel@acpica.org" <devel@acpica.org>,
        "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
        "lenb@kernel.org" <lenb@kernel.org>,
        "andy@kernel.org" <andy@kernel.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "robert.moore@intel.com" <robert.moore@intel.com>,
        "erik.kaneda@intel.com" <erik.kaneda@intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
Message-ID: <w3qrFtorGLZ_wMnr_Mi7cltli9g8jsMtiQ7Z1Usnj2IKfJ1MJz6-wxlIAEQ-ErgU1x6IBxdAIHBHtQ3OOT_FJOuUYheILlUc20ysNL_zroo=@protonmail.com>
In-Reply-To: <20210118135121.GM4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com> <20210118003428.568892-7-djrscally@gmail.com> <-GKrxu8GJvGe-PlKkLpblw9N-DtVtS7i87BOCLgJR72yf4hUFpUgiOlGcFero_gqgUxJrX2gxtLOnz_31hJugfam0SXXmXxIzGIhS162mhI=@protonmail.com> <20210118135121.GM4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

2021. janu=C3=A1r 18., h=C3=A9tf=C5=91 14:51 keltez=C3=A9ssel, Andy Shevche=
nko =C3=ADrta:

> On Mon, Jan 18, 2021 at 11:12:34AM +0000, Barnab=C3=A1s P=C5=91cze wrote:
> > 2021. janu=C3=A1r 18., h=C3=A9tf=C5=91 1:34 keltez=C3=A9ssel, Daniel Sc=
ally =C3=ADrta:
>
> > Have you considered putting the source (and header) files into a dedica=
ted
> > folder? I think it'd help manageability in the long run, and it'd be im=
mediately
> > obvious that these source files form a single "unit".
>
> What would be the folder name? Because, for example, intel_cht_int33fe* h=
ave no
> folder (yet?) and here it's kinda similar case when HID describes somethi=
ng
> else than just one IP.

I think "intel_skl_int3472" would not be a bad name for the folder. And I b=
elieve
"intel_cht_int33fe" could be given its own folder as well.


Regards,
Barnab=C3=A1s P=C5=91cze
