Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645D835D05C
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Apr 2021 20:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237020AbhDLS3k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 14:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244972AbhDLS3k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Apr 2021 14:29:40 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96016C06174A
        for <linux-i2c@vger.kernel.org>; Mon, 12 Apr 2021 11:29:21 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 82so15239144yby.7
        for <linux-i2c@vger.kernel.org>; Mon, 12 Apr 2021 11:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NNAaikW8Ua1Qsyki4qt6W9LRYrIEfVOIKl6VO661t4s=;
        b=xXGnANS77BleJQqUspbV6NrztTu8EihzaXyyEGo77ZHpArnT/G2pomCKN54jeVTZhh
         btngBStW9m8RBSvmH4B9a16+tVxohOwo9kbFdoExelKl5dM6xkfTzes9l1w8p7fEMnVB
         hmWY2srztNr+gGHqPC098hxZD1lGEPdacAI2P1ZGyxo3TpDgrrQLC+HkVMtaP6D5sE/W
         QYEl7ZhsPNWF6z3l4ytIZglVVOaed839e6UZRuojMNS7Umg6yiHdChpqJ4X1VLfWujHK
         AdulFzJbOXje2ADQs1eJiZ5awDSBB7wQnE98zeEzCXkuZ65JrjgxZt7fmgce+LjQ5bnE
         i9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NNAaikW8Ua1Qsyki4qt6W9LRYrIEfVOIKl6VO661t4s=;
        b=Y6VgU9OgaQtUFobxIvly4nWgWmwIwNbFEfWVY7nciLDHb2vQ4wlcykYN11Rmsx4HgI
         472muHHpV0Xhg2Vqh7qM2d13MdZeLBHqCh7eDUeL3LPafPbB4N8TR6ssXc/JeQx2Bvzu
         0YRTl5SLgvx7/SwaZ5Z6lcL2W/5yum9asYteQ1RvNEGzp0PTQX0mf48ALS50JECXfG2i
         fOR6CmcKiCl1e9HLZZ0StpV4V7jhltpPav5mhUVCEbtd5UJ6D6Q6SgR0+bRNXPou8104
         BSbdAqXk+xSVTXw8qS0Fpgnpt2psoKWu3tDeyyOeJEV8CrMPopCyjvvW/5/DFd23bBNT
         PdSg==
X-Gm-Message-State: AOAM532wsTtqQofJcxCjIRY2ov0eM0bmgGsEElP0ww1NuXaNhEWoUsGy
        DZrAXIDOgPn3aCUfx8F/gSbqq2cg19C7rNUobgoSig==
X-Google-Smtp-Source: ABdhPJy8iXpglY+B33iv/1KwDkDgvb2f9yIDEsJ07Xzztw6sGJGc9mmBT0CcBVxIk5bGYZJ0lN2IJi3DbMBoJKI7LcU=
X-Received: by 2002:a05:6902:68a:: with SMTP id i10mr1460951ybt.0.1618252159898;
 Mon, 12 Apr 2021 11:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210402132431.3590-1-claudiu.beznea@microchip.com>
 <CAMpxmJVCOpkn5PfDtw8kc=xdKMFD0+yCs7EzSZDK7YTBZ7G-GQ@mail.gmail.com> <c5f0613d-c937-50ff-24af-d4e4df681511@microchip.com>
In-Reply-To: <c5f0613d-c937-50ff-24af-d4e4df681511@microchip.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 12 Apr 2021 20:29:09 +0200
Message-ID: <CAMpxmJWRMQ_2cyav1V4HfZf7vuAG8ngQWHrQM4Sap4v_kLoRpw@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: avoid adjusting offset for 24AA025E{48, 64}
To:     Claudiu Beznea <Claudiu.Beznea@microchip.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 12, 2021 at 9:42 AM <Claudiu.Beznea@microchip.com> wrote:
>
> On 07.04.2021 21:37, Bartosz Golaszewski wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On Fri, Apr 2, 2021 at 3:24 PM Claudiu Beznea
> > <claudiu.beznea@microchip.com> wrote:
> >>
> >> Some EEPROMs could be used only for MAC storage. In this case the
> >> EEPROM areas where MACs resides could be modeled as NVMEM cells
> >> (directly via DT bindings) such that the already available networking
> >> infrastructure to read properly the MAC addresses (via
> >> of_get_mac_address()). Add "atmel,24mac02e4", "atmel,24mac02e4"
> >> compatible for the usage w/ 24AA025E{48, 64} type of EEPROMs and adapt
> >> the driver to not do offset adjustments.
> >>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> >> ---
> >>
> >> Hi Bartosz,
> >>
> >> For the previously available compatibles the offset adjustment is done
> >> (probably for compatibility w/ old DT bindings?). In my scenario 24AA025E48
> >> is used in setup with macb driver which is calling of_get_mac_address()
> >> to get the proper NVMEM cell in EEPROM where the MAC resides and read
> >> directly from there. We modeled the EEPROM and NVMEM cell in DT as
> >> follows:
> >>
> >> &i2cnode {
> >>         // ...
> >>         eeprom0: eeprom0@52 {
> >>                 compatible = "atmel,24mac02e4";

Can you point me to the datasheet for this model, google only directs
me to this very email.

From the device tree it looks as if it was just a regular 24c02 EEPROM
with MAC hard-coded at 250-255 bytes, is that right?

Bartosz

> >>                 #address-cells = <1>;
> >>                 #size-cells = <0>;
> >>                 reg = <0x52>;
> >>                 pagesize = <16>;
> >>                 size = <256>;
> >>                 status = "okay";
> >>
> >>                 eeprom0_eui48: eui48@fa {
> >>                         reg = <0xfa 0x6>;
> >>                 };
> >>         };
> >> };
> >>
> >> &gmac {
> >>         // ...
> >>
> >>         nvmem-cells = <&eeprom0_eui48>;
> >>         nvmem-cell-names = "mac-address";
> >>
> >>         // ...
> >> };
> >>
> >>
> >> Let me know if some other approach needs to be taken into account in
> >> at24 driver for this to work.
> >>
> >> Thank you,
> >> Claudiu Beznea
> >>
> >
> > Hi Claudiu,
> >
> > First of all: any new compatibles need to go into the DT bindings document.
>
> Agree! I missed this.
>
> >
> >
> >>  drivers/misc/eeprom/at24.c | 69 ++++++++++++++++++++++----------------
> >>  1 file changed, 40 insertions(+), 29 deletions(-)
> >>
> >> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> >> index 926408b41270..ae2fbcb5e83d 100644
> >> --- a/drivers/misc/eeprom/at24.c
> >> +++ b/drivers/misc/eeprom/at24.c
> >> @@ -123,17 +123,19 @@ MODULE_PARM_DESC(at24_write_timeout, "Time (in ms) to try writes (default 25)");
> >>  struct at24_chip_data {
> >>         u32 byte_len;
> >>         u8 flags;
> >> +       u8 adjoff;
> >>         void (*read_post)(unsigned int off, char *buf, size_t count);
> >>  };
> >>
> >> -#define AT24_CHIP_DATA(_name, _len, _flags)                            \
> >> +#define AT24_CHIP_DATA(_name, _len, _flags, _adjoff)                   \
> >>         static const struct at24_chip_data _name = {                    \
> >> -               .byte_len = _len, .flags = _flags,                      \
> >> +               .byte_len = _len, .flags = _flags, .adjoff = _adjoff, \
> >>         }
> >>
> >> -#define AT24_CHIP_DATA_CB(_name, _len, _flags, _read_post)             \
> >> +#define AT24_CHIP_DATA_CB(_name, _len, _flags, _adjoff, _read_post)    \
> >>         static const struct at24_chip_data _name = {                    \
> >>                 .byte_len = _len, .flags = _flags,                      \
> >> +               .adjoff = _adjoff,                                      \
> >>                 .read_post = _read_post,                                \
> >>         }
> >>
> >> @@ -158,48 +160,52 @@ static void at24_read_post_vaio(unsigned int off, char *buf, size_t count)
> >>  }
> >>
> >>  /* needs 8 addresses as A0-A2 are ignored */
> >> -AT24_CHIP_DATA(at24_data_24c00, 128 / 8, AT24_FLAG_TAKE8ADDR);
> >> +AT24_CHIP_DATA(at24_data_24c00, 128 / 8, AT24_FLAG_TAKE8ADDR, 0);
> >>  /* old variants can't be handled with this generic entry! */
> >> -AT24_CHIP_DATA(at24_data_24c01, 1024 / 8, 0);
> >> +AT24_CHIP_DATA(at24_data_24c01, 1024 / 8, 0, 0);
> >>  AT24_CHIP_DATA(at24_data_24cs01, 16,
> >> -       AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
> >> -AT24_CHIP_DATA(at24_data_24c02, 2048 / 8, 0);
> >> +       AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
> >> +AT24_CHIP_DATA(at24_data_24c02, 2048 / 8, 0, 0);
> >>  AT24_CHIP_DATA(at24_data_24cs02, 16,
> >> -       AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
> >> +       AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
> >>  AT24_CHIP_DATA(at24_data_24mac402, 48 / 8,
> >> -       AT24_FLAG_MAC | AT24_FLAG_READONLY);
> >> +       AT24_FLAG_MAC | AT24_FLAG_READONLY, 1);
> >>  AT24_CHIP_DATA(at24_data_24mac602, 64 / 8,
> >> -       AT24_FLAG_MAC | AT24_FLAG_READONLY);
> >> +       AT24_FLAG_MAC | AT24_FLAG_READONLY, 1);
> >> +AT24_CHIP_DATA(at24_data_24mac02e4, 48 / 8,
> >> +       AT24_FLAG_MAC | AT24_FLAG_READONLY, 0);
> >> +AT24_CHIP_DATA(at24_data_24mac02e6, 64 / 8,
> >> +       AT24_FLAG_MAC | AT24_FLAG_READONLY, 0);
> >>  /* spd is a 24c02 in memory DIMMs */
> >>  AT24_CHIP_DATA(at24_data_spd, 2048 / 8,
> >> -       AT24_FLAG_READONLY | AT24_FLAG_IRUGO);
> >> +       AT24_FLAG_READONLY | AT24_FLAG_IRUGO, 0);
> >>  /* 24c02_vaio is a 24c02 on some Sony laptops */
> >>  AT24_CHIP_DATA_CB(at24_data_24c02_vaio, 2048 / 8,
> >> -       AT24_FLAG_READONLY | AT24_FLAG_IRUGO,
> >> +       AT24_FLAG_READONLY | AT24_FLAG_IRUGO, 0,
> >>         at24_read_post_vaio);
> >> -AT24_CHIP_DATA(at24_data_24c04, 4096 / 8, 0);
> >> +AT24_CHIP_DATA(at24_data_24c04, 4096 / 8, 0, 0);
> >>  AT24_CHIP_DATA(at24_data_24cs04, 16,
> >> -       AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
> >> +       AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
> >>  /* 24rf08 quirk is handled at i2c-core */
> >> -AT24_CHIP_DATA(at24_data_24c08, 8192 / 8, 0);
> >> +AT24_CHIP_DATA(at24_data_24c08, 8192 / 8, 0, 0);
> >>  AT24_CHIP_DATA(at24_data_24cs08, 16,
> >> -       AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
> >> -AT24_CHIP_DATA(at24_data_24c16, 16384 / 8, 0);
> >> +       AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
> >> +AT24_CHIP_DATA(at24_data_24c16, 16384 / 8, 0, 0);
> >>  AT24_CHIP_DATA(at24_data_24cs16, 16,
> >> -       AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
> >> -AT24_CHIP_DATA(at24_data_24c32, 32768 / 8, AT24_FLAG_ADDR16);
> >> +       AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
> >> +AT24_CHIP_DATA(at24_data_24c32, 32768 / 8, AT24_FLAG_ADDR16, 0);
> >>  AT24_CHIP_DATA(at24_data_24cs32, 16,
> >> -       AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
> >> -AT24_CHIP_DATA(at24_data_24c64, 65536 / 8, AT24_FLAG_ADDR16);
> >> +       AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
> >> +AT24_CHIP_DATA(at24_data_24c64, 65536 / 8, AT24_FLAG_ADDR16, 0);
> >>  AT24_CHIP_DATA(at24_data_24cs64, 16,
> >> -       AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
> >> -AT24_CHIP_DATA(at24_data_24c128, 131072 / 8, AT24_FLAG_ADDR16);
> >> -AT24_CHIP_DATA(at24_data_24c256, 262144 / 8, AT24_FLAG_ADDR16);
> >> -AT24_CHIP_DATA(at24_data_24c512, 524288 / 8, AT24_FLAG_ADDR16);
> >> -AT24_CHIP_DATA(at24_data_24c1024, 1048576 / 8, AT24_FLAG_ADDR16);
> >> -AT24_CHIP_DATA(at24_data_24c2048, 2097152 / 8, AT24_FLAG_ADDR16);
> >> +       AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
> >> +AT24_CHIP_DATA(at24_data_24c128, 131072 / 8, AT24_FLAG_ADDR16, 0);
> >> +AT24_CHIP_DATA(at24_data_24c256, 262144 / 8, AT24_FLAG_ADDR16, 0);
> >> +AT24_CHIP_DATA(at24_data_24c512, 524288 / 8, AT24_FLAG_ADDR16, 0);
> >> +AT24_CHIP_DATA(at24_data_24c1024, 1048576 / 8, AT24_FLAG_ADDR16, 0);
> >> +AT24_CHIP_DATA(at24_data_24c2048, 2097152 / 8, AT24_FLAG_ADDR16, 0);
> >>  /* identical to 24c08 ? */
> >> -AT24_CHIP_DATA(at24_data_INT3499, 8192 / 8, 0);
> >> +AT24_CHIP_DATA(at24_data_INT3499, 8192 / 8, 0, 0);
> >>
> >>  static const struct i2c_device_id at24_ids[] = {
> >>         { "24c00",      (kernel_ulong_t)&at24_data_24c00 },
> >> @@ -208,7 +214,9 @@ static const struct i2c_device_id at24_ids[] = {
> >>         { "24c02",      (kernel_ulong_t)&at24_data_24c02 },
> >>         { "24cs02",     (kernel_ulong_t)&at24_data_24cs02 },
> >>         { "24mac402",   (kernel_ulong_t)&at24_data_24mac402 },
> >> +       { "24mac02e4",  (kernel_ulong_t)&at24_data_24mac02e4 },
> >>         { "24mac602",   (kernel_ulong_t)&at24_data_24mac602 },
> >> +       { "24mac02e6",  (kernel_ulong_t)&at24_data_24mac02e6 },
> >>         { "spd",        (kernel_ulong_t)&at24_data_spd },
> >>         { "24c02-vaio", (kernel_ulong_t)&at24_data_24c02_vaio },
> >>         { "24c04",      (kernel_ulong_t)&at24_data_24c04 },
> >> @@ -238,7 +246,9 @@ static const struct of_device_id at24_of_match[] = {
> >>         { .compatible = "atmel,24c02",          .data = &at24_data_24c02 },
> >>         { .compatible = "atmel,24cs02",         .data = &at24_data_24cs02 },
> >>         { .compatible = "atmel,24mac402",       .data = &at24_data_24mac402 },
> >> +       { .compatible = "atmel,24mac02e4",      .data = &at24_data_24mac02e4 },
> >>         { .compatible = "atmel,24mac602",       .data = &at24_data_24mac602 },
> >> +       { .compatible = "atmel,24mac02e6",      .data = &at24_data_24mac02e6 },
> >>         { .compatible = "atmel,spd",            .data = &at24_data_spd },
> >>         { .compatible = "atmel,24c04",          .data = &at24_data_24c04 },
> >>         { .compatible = "atmel,24cs04",         .data = &at24_data_24cs04 },
> >> @@ -690,7 +700,8 @@ static int at24_probe(struct i2c_client *client)
> >>         at24->flags = flags;
> >>         at24->read_post = cdata->read_post;
> >>         at24->num_addresses = num_addresses;
> >> -       at24->offset_adj = at24_get_offset_adj(flags, byte_len);
> >> +       at24->offset_adj = cdata->adjoff ?
> >> +                               at24_get_offset_adj(flags, byte_len) : 0;
> >>         at24->client[0].client = client;
> >>         at24->client[0].regmap = regmap;
> >>
> >> --
> >> 2.25.1
> >>
> >
> > What is the problem you're trying to solve?
>
> I wanted to instantiate a NVMEM cell with proper offset and size via DT and
> make whatever Ethernet driver aware of this NVMEM cell via DT bindings, as
> bellow:
>
> &i2cnode {
>         // ...
>         eeprom0: eeprom0@52 {
>                 compatible = "atmel,24mac02e4";
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x52>;
>                 pagesize = <16>;
>                 size = <256>;
>                 status = "okay";
>
>                 eeprom0_eui48: eui48@fa {
>                         reg = <0xfa 0x6>;
>                 };
>         };
> };
>
> &gmac {
>         // ...
>
>         nvmem-cells = <&eeprom0_eui48>;
>         nvmem-cell-names = "mac-address";
>
>         // ...
> };
>
> By adding this new compatible and changing the driver to not adjust the
> NVMEM cell offset for it but make it use the one provided in DT I was
> thinking this may scale for any future EEPROM storing MAC addresses at any
> offsets (because these would be provided via DT and not adjusted by driver).
>
> I the current at24 driver I haven't managed to find a compatible in the
> driver that mach the offset 0xfa (used to store MAC address on case of
> 24AA025E48).
>
> > The MAC area is accessible
> > on a different device address. The variants with serial and MAC areas
> > are meant to be instantiated as devices separate from the main
> > writeable area and you can then create an nvmem cell that will take up
> > the whole MAC.
> >
> > Or does your model keep the MAC in the same block that's used for
> > writing? In which case just using a regular compatible that matches
> > the size and creating the nvmem cell at the right offset should be
> > enough, right?
>
> Meaning describing the NVMEM cell in DT with an offset such that the driver
> adjustment +/- that offset to lead to the offset described in EEPROM datasheet?
>
> >
> > Am I missing something?
>
>
>
> >
> > Bartosz
> >
>
