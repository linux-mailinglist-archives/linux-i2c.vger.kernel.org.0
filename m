Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2172833EDB
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 08:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbfFDGO0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 02:14:26 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:53607 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbfFDGO0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jun 2019 02:14:26 -0400
Received: by mail-it1-f195.google.com with SMTP id m187so5831325ite.3
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jun 2019 23:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mpV+ZLe1Y/pV6FsmPy/Hsmr8nazSfBYPF/FYxcvhXhw=;
        b=O/DwmIQPBDIPzjwyL9JSCCCs2p/EtplyKCC20zuHO0dm833GLj8N3ewOJQclezpH0R
         ZoN1urGpPwl9NEpwrhFMWXUOfVpemmbQiTLulxzL2A2RhGkzlRY5VJAvjSBpE86o1gkC
         L3LiCOrHQfo1vO4jscFmXGHETwE3WANMjo6J2iAPwi8ggiNCkhLhf6pkkfT47UfP6oy6
         f2R0fBD4IdkEA2sKsrxi1M7czswxyvVYzbAboyWLlQueRdKYxMPlST+/2ERCkEZTDZg6
         VejOlNuPrCZB4c78Nnd5PRao7CP2r6T/KLO1Z81YCoZgogDu1F6ckgfOVMXOYl7yj5PS
         nLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mpV+ZLe1Y/pV6FsmPy/Hsmr8nazSfBYPF/FYxcvhXhw=;
        b=a9lsePhxlTxV1ADK3l9Wa1n47BZ4uIxZev/umjB6YgV8LqQasnLqjIR8dU1EyA4SyP
         /rAnSM5is9pgZy7jp/D6OzgckkHQAgA8c/7P+Vokw4WxDg+zMiNj+lLCmFycUvxzzJpK
         lj3UoSdpn4BDrRHs074CErVNxQxkg+ZB9s8RnenjyonyOOeG9nAOO19ug+C0MXzVS1QP
         k8OxuAMSv6bvMr1ZnREodTC9UbhPLy7dK0huTUAvbB8UpLVMmHnXmcY8rlmnSQLAbDoD
         7JDeKxl45lKu2lUX43/fICe9fktuq9c+WdQ2Y0ninswzZCEriyrKjMdIXotj6i/1SauB
         jwgQ==
X-Gm-Message-State: APjAAAUf/0TzRGGKOJl6xDQLp5ILG8hsQxt+JrUf2qCnAfVy1oHEb3/W
        8Q9YGwPykDTQRFpLUd6MQmdbjHVed9OtFfvt4EXhi+M4
X-Google-Smtp-Source: APXvYqzS3jwKCwk/umYAxKFFeDfgAPzZpyp0FAipe2DJGulCx+yBszMTdcmCUYb6hHU0qq+n6pwLJkhfLztu8Czenpk=
X-Received: by 2002:a24:2855:: with SMTP id h82mr13134280ith.15.1559628865436;
 Mon, 03 Jun 2019 23:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190603055714.7203-1-oohall@gmail.com> <e546c15f-07a9-656a-ce11-4f9a24795d9a@linux.ibm.com>
In-Reply-To: <e546c15f-07a9-656a-ce11-4f9a24795d9a@linux.ibm.com>
From:   Oliver <oohall@gmail.com>
Date:   Tue, 4 Jun 2019 16:14:13 +1000
Message-ID: <CAOSf1CE5J93rai-VcZJJWkU=N=1=STtV2XqKQh_yLvQpXBKkHw@mail.gmail.com>
Subject: Re: [PATCH] i2c: fsi: Create busses for all ports
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-i2c@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Eddie James <eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 4, 2019 at 12:15 AM Eddie James <eajames@linux.ibm.com> wrote:
>
>
> On 6/3/19 12:57 AM, Oliver O'Halloran wrote:
> > Currently we only create an I2C bus for the ports listed in the
> > device-tree for that master. There's no real reason for this since
> > we can discover the number of ports the master supports by looking
> > at the port_max field of the status register.
> >
> > This patch re-works the bus add logic so that we always create buses
> > for each port, unless the bus is marked as unavailable in the DT. This
> > is useful since it ensures that all the buses provided by the CFAM I2C
> > master are accessible to debug tools.
> >
> > Cc: Eddie James <eajames@linux.vnet.ibm.com>
> > Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> > ---
> >   drivers/i2c/busses/i2c-fsi.c | 30 +++++++++++++++++++++++++-----
> >   1 file changed, 25 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> > index 1e2be2219a60..59a76c6e31ad 100644
> > --- a/drivers/i2c/busses/i2c-fsi.c
> > +++ b/drivers/i2c/busses/i2c-fsi.c
> > @@ -658,13 +658,27 @@ static const struct i2c_algorithm fsi_i2c_algorithm = {
> >       .functionality = fsi_i2c_functionality,
> >   };
> >

> > +static device_node *fsi_i2c_find_port_of_node(struct device_node *master,
> > +                                           int port)

Turns out I had a pile of compile fixes staged but not committed so
this patch is totally broken. Oops.

> > +{
> > +     struct device_node *np;
> > +
> > +     for_each_child_of_node(fsi, np) {
> > +             rc = of_property_read_u32(np, "reg", &port_no);
> > +             if (!rc && port_no == port)
> > +                     return np;
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> >   static int fsi_i2c_probe(struct device *dev)
> >   {
> >       struct fsi_i2c_master *i2c;
> >       struct fsi_i2c_port *port;
> >       struct device_node *np;
> > +     u32 port_no, ports, stat;
> >       int rc;
> > -     u32 port_no;
> >
> >       i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
> >       if (!i2c)
> > @@ -678,10 +692,16 @@ static int fsi_i2c_probe(struct device *dev)
> >       if (rc)
> >               return rc;
> >
> > -     /* Add adapter for each i2c port of the master. */
> > -     for_each_available_child_of_node(dev->of_node, np) {
> > -             rc = of_property_read_u32(np, "reg", &port_no);
> > -             if (rc || port_no > USHRT_MAX)
> > +     rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &state);
> > +     if (rc)
> > +             return rc;
> > +
> > +     ports = FIELD_GET(I2C_STAT_MAX_PORT, stat);
> > +     dev_dbg(dev, "I2C master has %d ports\n", ports);
>
>
> Thanks for the patch Oliver. This looks great except some older CFAM
> types don't report the max port number, in which case this would not
> probe up any ports. So we probably need a fallback to dts if the max
> ports is 0.

Hmm, The oldest CFAM spec I could find was v1.2 which is from the p6
era and it includes the MAX_PORT field. When I was checking the spec I
noticed that I mis-interpreted the meaning of MAX_PORT. It's actually
the largest value you can write into the port field of the mode
register rather than the number of ports the master supports. So zero
is a valid value for MAX_PORT that you would see if the master only
has one port.

Do you know if the old masters only had one port? If not, do you know
what version (from the ext status reg) of the master doesn't support
the max_port field?


> Thanks,
>
> Eddie
>
>
> > +
> > +     for (port_no = 0; port_no < ports; port_no++) {
> > +             np = fsi_i2c_find_port_of_node(dev.of_node, port_no);
> > +             if (np && !of_device_is_available(np))
> >                       continue;
> >
> >               port = kzalloc(sizeof(*port), GFP_KERNEL);
