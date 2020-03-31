Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4421F199CB1
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Mar 2020 19:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbgCaRRh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Mar 2020 13:17:37 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36068 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgCaRRh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Mar 2020 13:17:37 -0400
Received: by mail-pg1-f193.google.com with SMTP id c23so2241704pgj.3;
        Tue, 31 Mar 2020 10:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ICG30y4zNo3hKOg/q4ebTZ3HatLK/FPtksBkCKfh5oE=;
        b=lwFH5kmT+xLvy9HSwYOt8c/RcSf5tLMxfoJsICsjA0usmFsli0bz/+4fkqdmDJ5jBJ
         JUC5rh5EnE7CoBMWczQaQu7OMUhQDZ6zyfUwOwWo2M332Y64DVimNpsOHsbdiAfrSKsj
         K8pOGk/j3JYJTa4P1eRVAu2p/rr+RT7QhE3StZPZiKLkg8WvC5LNs/+Ih5oGSQzyolyO
         YNNPQAYFNaea9PXB+ZeI7H3pYAJBT4ARacB9ILpO0JEWsJSqw9wQvd+GcDe7z/CD54bc
         XvxmLWPInyTqZ9U2/hpPLq0EuGY9/gQDEJRiF3ic4THAw+n3MtLiJQmFVEKm5wqB+6mV
         NISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ICG30y4zNo3hKOg/q4ebTZ3HatLK/FPtksBkCKfh5oE=;
        b=ifp5Xix2fpM3r3zSNGKlE5gUnjL/ebDk38n/MGdXNHitWU4wqIOCgEMSfWXFONvrx/
         ewQIPQwHVh615nHTVACKF3Dvify1T/OvniqVZJAH7AwvSVrrNYnhHZIbTvgkMD31Dhxh
         PFC+Qgw9eWA3W9JFNkjvMwYIHHKFKETNdveLbvhupekIvKkjYBINM/ok1871qZohW6sZ
         OT4c5Egydc1HO/jlwCsH+018N8sGAIEo19Foth3Yv6oPx9soVOeHmhOViVfH1RL7U6e7
         QdMSvhrr44C1Vp/zKN1mY4AzbCN0UxzxE4vcnJEVIEjhrvEXo1GdSB7dSU7tarmyeKPW
         ZhhQ==
X-Gm-Message-State: AGi0PuaHbbtyH1UN7a5uCQ8c13Jum4/oAmJwSU6liay0PIlWyuQgnxe4
        dYT32YnPj1xiGoZOWyDPtf33jtx5sCmVr+q/oDCv7590u1c=
X-Google-Smtp-Source: APiQypITqjeLzwW4boEvUSsGDOoC+q4vHjDm4i1oNqkLNQ44cl3FP6ZfCeBQoQoj9BDo8xbrDf6MQJrhnGaIPsTBxno=
X-Received: by 2002:a63:7b1d:: with SMTP id w29mr5024588pgc.4.1585675055307;
 Tue, 31 Mar 2020 10:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
 <20200306135451.4AF0480307C4@mail.baikalelectronics.ru> <20200331114824.e3uljdymvsjuh6wh@ubsrv2.baikal.int>
 <20200331142530.GM1922688@smile.fi.intel.com> <20200331162813.dnpmyzs35tvkeavx@ubsrv2.baikal.int>
In-Reply-To: <20200331162813.dnpmyzs35tvkeavx@ubsrv2.baikal.int>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 31 Mar 2020 20:17:28 +0300
Message-ID: <CAHp75VfOxRdEZ81-rFUrAiQDdruKqhJn_Wh+PJnyB5WL2vMUCQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] i2c: designeware: Add Baikal-T1 SoC DW I2C specifics support
To:     Sergey Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 31, 2020 at 7:29 PM Sergey Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
> On Tue, Mar 31, 2020 at 05:25:30PM +0300, Andy Shevchenko wrote:
> > On Tue, Mar 31, 2020 at 02:48:24PM +0300, Sergey Semin wrote:
> > > On Fri, Mar 06, 2020 at 03:54:45PM +0200, Andy Shevchenko wrote:

...

> > > As I see the others have not comments.) Anyway I see your point and h=
aving the
> > > regmap-based interface might be better than the approach I've suggest=
ed
> > > in this patchset particularly seeing that our DW i2c IP registers are
> > > hidden behind a system controller register space.
> > >
> > > In order to follow your proposition to create a dedicated regmap and =
to supply
> > > it to the DW i2c driver, I have to redevelop not only this patchset, =
but
> > > also an adjacent drivers. In particular the changes will concern the
> > > MFD-based System Controller driver (which will instantiate this DW i2=
c
> > > controller device), Clocks Control Unit drivers set, and a few
> > > others. The whole alteration I described in the RFC:
> > > https://lkml.org/lkml/2020/3/22/393
> > > You've been in Cc there, so fill free to send your comments regarding
> > > the changes I suggested. Though this time I hope the solution will
> > > satisfy everyone, who had issues with patchsets I've recently sent.
> > >
> > > Getting back to your comment in the framework of this patchset. The a=
pproach
> > > used for CHT Whiskey Cove i2c isn't fully suitable in our case for
> > > the reason of the DW I2C controller nature. DW I2C controller is a ge=
neric
> > > controller and used on many different platforms, while AFAICS CHT Whi=
skey Cove
> > > I2C is the SoC-specific used to access a charger-IC. So in the former=
 case we
> > > may have an arbitrary set of i2c-slaves connected to the controller o=
n
> > > different platforms, while on the latter one - there is a fixed set o=
f
> > > slaves. In addition due to the same reason the DW I2C IP might be
> > > embedded into different sub-blocks on different platforms, while the =
CHT
> > > Whiskey Cove I2C is known to be a part of Intel CHT WC SoC PMIC.
> > > For instance Baikal-T1 SoC has one DW I2C controller embedded into th=
e
> > > System Controller with indirectly accessible registers and two DW I2C
> > > interfaces with normal memory mapped registers. Due to this in case o=
f DW I2C
> > > driver we can't just "suck" the regmap out from a parental MFD or
> > > anywhere else as it's done in the CHT Whiskey Cove I2C driver, but in=
stead
> > > we should somehow supply a regmap pointer to the driver.
> > >
> > > Taking into account all of these we can utilize a combined approach
> > > implemented in ./drivers/i2c/busses/i2c-cht-wc.c and
> > > drivers/mfd/intel_quark_i2c_gpio.c . I'll add a regmap pointer field =
to the
> > > "struct dw_i2c_platform_data" structure, so in case if there is no
> > > IORESOURCE_MEM resources available (platform_get_resource() fails), w=
e
> > > try to get a regmap pointer from the platform data. If there is no va=
lid
> > > regmap available, then completely fail the driver probe procedure. Th=
ough
> > > due to this alteration I'll have to change the
> > > dw_i2c_platform_data.i2c_scl_freq field usage a bit. In case if it's
> > > zero, then call i2c_parse_fw_timings(). This won't hurt ACPI or dt-le=
ss
> > > platforms, but will let us cover a case when regmap is set while i2c
> > > clock frequency is supposed to be taken from the kernel firmware (lik=
e
> > > dtb, etc).

Whiskey Cove case provides an I=C2=B2C controller with specific access. Tha=
t's it.
In your case you will need similar glue driver which will utilize
DesignWare core driver.

> > > So if you are Ok with this, I'll send a v2 patchset with correspondin=
g
> > > alteration implemented.
> >
> > I was thinking about something like this:
> >
>
> > 1/ core driver (library + master + slave) is converted to use regmap
>
> Yes. I also intended to do this just by altering the dw_readl() and
> dw_writel() methods to work over regmap IO methods if regmap is
> available.

Why? Simple always use regmap API calls. Moreover, regmap provides
update() which may give a leverage in some cases by dropping r-m-w
code.

Core part take a pointer to regmap when instantiate (probe) a driver
on the device.

> > 2/ platform and PCI driver may provide regmap MMIO
>
> Regmap pointer will be also a part of "struct dw_i2c_dev".

Yes.

> So if PCI
> code intends the regmap-based access to the controller registers, then
> it shall just initialize the regmap pointer in the private i2c-designware=
 data
> instance of the dw_i2c_dev structure.

Why data is being involved here?

> So, yes, this is also covered by
> my solution. Though the PCI code will be left untouched, since I can't
> predict a particular regmap-related use-case of it.

> > 3/ your glue driver will provide different regmap accessors
>
> I was thinking of developing a more generic version so any platform
> with a specific access to the DW I2C register could use it just by supply=
ing
> the regmap pointer in the dw_i2c_platform_data structure.

regmap is not a platform data.

> Our DW I2C
> controller also perfectly fits to the generic i2c-designware-platdrv.c
> driver, so implementing an additional glue-layer would be too much seeing
> the difference only in the registers mapping.

Register accessing, mapping as far as I understood is the same.
However, with regmap layer it just an implementation detail of certain
glue driver.

> Let me explain the difference of our solutions. In case of implementing
> the glue layer, as you suggest, I would have to do it in a way like the D=
W PCIe
> driver is designed. I would need to move the code of current dw_i2c_plat_=
probe()
> function to a dedicated method named like dw_i2c_plat_init(pdev, !regmap!=
),
> while former method dw_i2c_plat_probe() would just call
> dw_i2c_plat_init(pdev, !NULL!). Then I would have to create a dedicated
> glue-driver - i2c-designware-bt1drv.c, which would be bound to a
> "baikal,t1-sys-i2c" device, try to find a Baikal-T1 System Controller
> device node (though this would be just a parent device), then would get
> it' syscon regmap handler, then would initialize a dedicated regmap handl=
er to
> indirectly access the DW I2C controller register, then it would call the
> dw_i2c_plat_init(pdev, !regmap!) method with new regmap handler passed
> (though the new regmap passing could be also implemented over the
> platform_data pointer). Also seeing you already have a platform-specific
> parts in the generic i2c-designware-platdrv.c driver (like ACPI-based
> platforms and Microsemi Ocelot SoC), there might raise a necessity to
> unpin that specifics to a dedicated method, since my glue-layer
> wouldn't need that checks and initializations. Such alteration won't
> be that easy to implement and regression errors prone, since I don't have
> other platforms to test it.
>
> In case of my solution the whole glue-layer part would be moved to
> the MFD-based Baikal-T1 System Controller driver and a generic
> platform_data-based interface would be implemented, which would just
> need to alter the registers mapping part of the i2c-designware-platdrv.c
> driver. Note that that part would need to be fixed in case of any solutio=
n.
>
> So comparing these too approaches, I would select a one, which would
> need less common code modifications and would provide a generic
> solution. As I see it would be a platform_data-based design. What do you
> think?

I think you may look at the existing examples how drivers are
utilizing regmap layer.
Along with that look how glue (or let's say quirk in your case)
drivers are implemented, for example USB or SDHCI comes to my mind.

--=20
With Best Regards,
Andy Shevchenko
