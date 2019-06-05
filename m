Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1942735599
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 05:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbfFEDRb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 23:17:31 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:37545 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbfFEDRb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jun 2019 23:17:31 -0400
Received: by mail-it1-f195.google.com with SMTP id s16so1421334ita.2
        for <linux-i2c@vger.kernel.org>; Tue, 04 Jun 2019 20:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nR+fw+sm8IO1kJHf+eZ+FfOpYY+0Uj1n8xQS2155FaY=;
        b=O80GZT44V5PHZ2H7WNemGa0JyrlFf+swZ9K+OFhDphLc4Vv1CIzO+etNqF2zZgPr/E
         llNMUuND/SFEZ3emXR3rPeag4piQ2uI8hjCsJb84mr5IprJlagwZVNcYLE3rnUoOuQf/
         aZHi1XsB6+BH7eHGaUfKyAz5oMkmo4e4nTwixdgS82mP5UvPMt4xRpEIISLhF/0F6ekm
         5wLsZqs5f1EmASxf3tRT3aA1Sk7PR9sFNR+zxJWm56kNVaNzqLmaHI9krFjYh8VHUVXg
         fN3GuBNP3p5DR1ykqgnyXPeEUidCutuiCrDbntNRP7bpqvD5Nu+YX2ClG+HB+gKf7m7L
         ABbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nR+fw+sm8IO1kJHf+eZ+FfOpYY+0Uj1n8xQS2155FaY=;
        b=re5FcdSTLmrnUyg38oeN7nYtouBLv0ubhTMs3jmxrQ5TBhJDtKmNtNsoBy7QYIrTke
         EOCS4lmuy7DzXf0yZU2vDMMskeXYcr3wKH0qV5nITOnD0S58kodOZadCLA9M6Pu9BIng
         CUPv+u9iVGVbeqHgpZnCA/Qo/cfvjEPKLWBhVFutpBuzehF64p0vg4FtW0kR+tzvzXh1
         0lXEVAInGsv74jteUqbSG4Xqn7+vVeC8Ex80550wJL0RRbHMFqxala8vtl9vby06cqij
         GWWqYLMFtySMb9oQydiGkabiEADal8DgaduSdo2BeVYQhdZ19cfnsxL241hcUHPeysqL
         eCdA==
X-Gm-Message-State: APjAAAWh8DcFVvs5y5Cnf8bE1u+p4eWTjfm2Ab/hJpac3frQrvWS9poy
        BWRNQlrq9r+KmGEJ019wEzh7gktKBesVJM3mb/gJV8q9
X-Google-Smtp-Source: APXvYqyLbE2qjepqrPZIIMK74pFLv6SAD9LCvqXxdYToJrgls5v6ziGhlx2TviwR6aRkp/n8WNYemZXD58Y7hfWgixs=
X-Received: by 2002:a02:5a02:: with SMTP id v2mr21790706jaa.124.1559704650317;
 Tue, 04 Jun 2019 20:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190603055714.7203-1-oohall@gmail.com> <e546c15f-07a9-656a-ce11-4f9a24795d9a@linux.ibm.com>
 <CAOSf1CE5J93rai-VcZJJWkU=N=1=STtV2XqKQh_yLvQpXBKkHw@mail.gmail.com> <e578ae92-baf0-f55a-1cb4-82c992851483@linux.ibm.com>
In-Reply-To: <e578ae92-baf0-f55a-1cb4-82c992851483@linux.ibm.com>
From:   Oliver <oohall@gmail.com>
Date:   Wed, 5 Jun 2019 13:17:18 +1000
Message-ID: <CAOSf1CEA-S8ond9Bwk+CGQ9=OGwV9EevJRn7LB075615rbz65A@mail.gmail.com>
Subject: Re: [PATCH] i2c: fsi: Create busses for all ports
To:     Eddie James <eajames@linux.ibm.com>
Cc:     OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org, Eddie James <eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 5, 2019 at 8:57 AM Eddie James <eajames@linux.ibm.com> wrote:
>
>
> On 6/4/19 1:14 AM, Oliver wrote:
> > On Tue, Jun 4, 2019 at 12:15 AM Eddie James <eajames@linux.ibm.com> wro=
te:
> >>
> >> On 6/3/19 12:57 AM, Oliver O'Halloran wrote:
> >>> Currently we only create an I2C bus for the ports listed in the
> >>> device-tree for that master. There's no real reason for this since
> >>> we can discover the number of ports the master supports by looking
> >>> at the port_max field of the status register.
> >>>
> >>> This patch re-works the bus add logic so that we always create buses
> >>> for each port, unless the bus is marked as unavailable in the DT. Thi=
s
> >>> is useful since it ensures that all the buses provided by the CFAM I2=
C
> >>> master are accessible to debug tools.
> >>>
> >>> Cc: Eddie James <eajames@linux.vnet.ibm.com>
> >>> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> >>> ---
> >>>    drivers/i2c/busses/i2c-fsi.c | 30 +++++++++++++++++++++++++-----
> >>>    1 file changed, 25 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fs=
i.c
> >>> index 1e2be2219a60..59a76c6e31ad 100644
> >>> --- a/drivers/i2c/busses/i2c-fsi.c
> >>> +++ b/drivers/i2c/busses/i2c-fsi.c
> >>> @@ -658,13 +658,27 @@ static const struct i2c_algorithm fsi_i2c_algor=
ithm =3D {
> >>>        .functionality =3D fsi_i2c_functionality,
> >>>    };
> >>>
> >>> +static device_node *fsi_i2c_find_port_of_node(struct device_node *ma=
ster,
> >>> +                                           int port)
> > Turns out I had a pile of compile fixes staged but not committed so
> > this patch is totally broken. Oops.
> >
> >>> +{
> >>> +     struct device_node *np;
> >>> +
> >>> +     for_each_child_of_node(fsi, np) {
> >>> +             rc =3D of_property_read_u32(np, "reg", &port_no);
> >>> +             if (!rc && port_no =3D=3D port)
> >>> +                     return np;
> >>> +     }
> >>> +
> >>> +     return NULL;
> >>> +}
> >>> +
> >>>    static int fsi_i2c_probe(struct device *dev)
> >>>    {
> >>>        struct fsi_i2c_master *i2c;
> >>>        struct fsi_i2c_port *port;
> >>>        struct device_node *np;
> >>> +     u32 port_no, ports, stat;
> >>>        int rc;
> >>> -     u32 port_no;
> >>>
> >>>        i2c =3D devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
> >>>        if (!i2c)
> >>> @@ -678,10 +692,16 @@ static int fsi_i2c_probe(struct device *dev)
> >>>        if (rc)
> >>>                return rc;
> >>>
> >>> -     /* Add adapter for each i2c port of the master. */
> >>> -     for_each_available_child_of_node(dev->of_node, np) {
> >>> -             rc =3D of_property_read_u32(np, "reg", &port_no);
> >>> -             if (rc || port_no > USHRT_MAX)
> >>> +     rc =3D fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &state);
> >>> +     if (rc)
> >>> +             return rc;
> >>> +
> >>> +     ports =3D FIELD_GET(I2C_STAT_MAX_PORT, stat);
> >>> +     dev_dbg(dev, "I2C master has %d ports\n", ports);
> >>
> >> Thanks for the patch Oliver. This looks great except some older CFAM
> >> types don't report the max port number, in which case this would not
> >> probe up any ports. So we probably need a fallback to dts if the max
> >> ports is 0.
> > Hmm, The oldest CFAM spec I could find was v1.2 which is from the p6
> > era and it includes the MAX_PORT field. When I was checking the spec I
> > noticed that I mis-interpreted the meaning of MAX_PORT. It's actually
> > the largest value you can write into the port field of the mode
> > register rather than the number of ports the master supports. So zero
> > is a valid value for MAX_PORT that you would see if the master only
> > has one port.
>
>
> Yep, now that I look at the specs too, that is correct.
>
>
> >
> > Do you know if the old masters only had one port? If not, do you know
> > what version (from the ext status reg) of the master doesn't support
> > the max_port field?
>
>
> I used to have some more up-to-date specs but I can't seem to find
> them... I think I see what's going on. Some versions of the CFAM have
> the max port, or "upper threshold for ports" at bits 16-19, while others
> have that information at 9-15 or 12-15... I'm not sure we can reliably
> determine where/what that number will be. I'm open to suggestions!

I had a look at the various docs I've got and they say:

CFAM 1.2:      9 - 11 b =E2=80=98000=E2=80=99
              12 - 15 Upper threshold for I2C ports (Port number - 1)
p7 pervasive:  9 - 11 b =E2=80=98000=E2=80=99
              12 - 15 Upper threshold for I2C ports (Port number - 1)
p8 pervasive:  9 - 15 Upper threshold for I2C ports (Port number - 1)
p9 pervasive:  9 - 15 Upper threshold for I2C ports (Port number - 1)

Keep in mind these docs use IBM bit numbering. Translating to normal bits:

  binary: 01111111 00000000 00000000
bits set: 22, 21, 20, 19, 18, 17, 16 (7)
 IBM 32b:  9, 10, 11, 12, 13, 14, 15

And dropping the upper 3 bits gives you 16 - 19. Are you sure it's
actually different or is this IBM bit ordering just screwing us again?

Anyway, while I was looking I noticed that between p7 and p8 they did
change the layout of the mode register. The baud rate divider was
extended from 8 to 16 bits and the port select field was moved from
IBM(8,15) to IBM(16,21) to make room. If we need to support the older
masters we'll need to fix that too.

Oliver
