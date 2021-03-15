Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A04633B32B
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Mar 2021 14:01:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbhCONBV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Mar 2021 09:01:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:37186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229588AbhCONA4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Mar 2021 09:00:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCF3C64E38;
        Mon, 15 Mar 2021 13:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615813255;
        bh=uwWz6aWi1jhFKw28wj/LBxRRrhUwhNkyvusOnaoyIbc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ja+NES0ImoZkKrEO/YMBgBi8eb1pBtDIoBJ2SEiJI2DUpSjRyoErqeFixEEyp5HUN
         0jo91BP1t8G80j45Q96DnSNvaST1I40GVJTxXinnCqjmu0ePLMuhzg+XxnwTa5+kQS
         AbrWYNGoveE5GkaN6iis2ntFVg/LmyetJ5+4xvagV8kbW6ac+jFakwJVtsIXqhZs+m
         L4idcgPQ+yXSY66VOzxNh/fotNezbImMjFN2wq6LWWsIxZ5QyF9UXTo5FRiCFCVCFE
         C7/s3PN8c2oKdhEIoyMFZ5SX2KvWrO75HJrBZ0gWYyrp5d6bLci1+nxu+OJd+198ot
         etRMtsEivXiUw==
Date:   Mon, 15 Mar 2021 14:00:50 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     dillon min <dillon.minfei@gmail.com>, pierre-yves.mordret@st.com
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        p.zabel@pengutronix.de,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Alexandre TORGUE <Alexandre.torgue@foss.st.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-i2c@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 4/4] i2c: stm32f4: Fix stmpe811 get xyz data timeout
 issue
Message-ID: <20210315130050.GD1182@ninjato>
References: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
 <1591709203-12106-5-git-send-email-dillon.minfei@gmail.com>
 <CAL9mu0LJPnxA0JSmV3mogvPA5xRRYCO_4=P7pqpAO7R=YaJX5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Km1U/tdNT/EmXiR1"
Content-Disposition: inline
In-Reply-To: <CAL9mu0LJPnxA0JSmV3mogvPA5xRRYCO_4=P7pqpAO7R=YaJX5g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Km1U/tdNT/EmXiR1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 08:43:54PM +0800, dillon min wrote:
> Hi All,
>=20
> Just a gentle ping.

Pierre-Yves?

>=20
> Regards.
>=20
> On Tue, Jun 9, 2020 at 9:27 PM <dillon.minfei@gmail.com> wrote:
> >
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > as stm32f429's internal flash is 2Mbytes and compiled kernel
> > image bigger than 2Mbytes, so we have to load kernel image
> > to sdram on stm32f429-disco board which has 8Mbytes sdram space.
> >
> > based on above context, as you knows kernel running on external
> > sdram is more slower than internal flash. besides, we need read 4
> > bytes to get touch screen xyz(x, y, pressure) coordinate data in
> > stmpe811 interrupt.
> >
> > so, in stm32f4_i2c_handle_rx_done, as i2c read slower than running
> > in xip mode, have to adjust 'STOP/START bit set position' from last
> > two bytes to last one bytes. else, will get i2c timeout in reading
> > touch screen coordinate.
> >
> > to not take side effect, introduce IIC_LAST_BYTE_POS to support xip
> > kernel or has mmu platform.
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> >
> > V4: indroduce 'IIC_LAST_BYTE_POS' to compatible with xipkernel boot
> >
> >  drivers/i2c/busses/i2c-stm32f4.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-=
stm32f4.c
> > index d6a69dfcac3f..97cf42ae7fa0 100644
> > --- a/drivers/i2c/busses/i2c-stm32f4.c
> > +++ b/drivers/i2c/busses/i2c-stm32f4.c
> > @@ -93,6 +93,12 @@
> >  #define STM32F4_I2C_MAX_FREQ           46U
> >  #define HZ_TO_MHZ                      1000000
> >
> > +#if !defined(CONFIG_MMU) && !defined(CONFIG_XIP_KERNEL)
> > +#define IIC_LAST_BYTE_POS 1
> > +#else
> > +#define IIC_LAST_BYTE_POS 2
> > +#endif
> > +
> >  /**
> >   * struct stm32f4_i2c_msg - client specific data
> >   * @addr: 8-bit slave addr, including r/w bit
> > @@ -439,7 +445,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32=
f4_i2c_dev *i2c_dev)
> >         int i;
> >
> >         switch (msg->count) {
> > -       case 2:
> > +       case IIC_LAST_BYTE_POS:
> >                 /*
> >                  * In order to correctly send the Stop or Repeated Start
> >                  * condition on the I2C bus, the STOP/START bit has to =
be set
> > @@ -454,7 +460,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32=
f4_i2c_dev *i2c_dev)
> >                 else
> >                         stm32f4_i2c_set_bits(reg, STM32F4_I2C_CR1_START=
);
> >
> > -               for (i =3D 2; i > 0; i--)
> > +               for (i =3D IIC_LAST_BYTE_POS; i > 0; i--)
> >                         stm32f4_i2c_read_msg(i2c_dev);
> >
> >                 reg =3D i2c_dev->base + STM32F4_I2C_CR2;
> > @@ -463,7 +469,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32=
f4_i2c_dev *i2c_dev)
> >
> >                 complete(&i2c_dev->complete);
> >                 break;
> > -       case 3:
> > +       case (IIC_LAST_BYTE_POS+1):
> >                 /*
> >                  * In order to correctly generate the NACK pulse after =
the last
> >                  * received data byte, we have to enable NACK before re=
ading N-2
> > --
> > 2.7.4
> >

--Km1U/tdNT/EmXiR1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBPWoIACgkQFA3kzBSg
KbaufQ//Ys3IspQl5ZmHUiYQNXTgpssUevIjsxXi1RZF4eaFk+YV3swvOuYgsRgD
VAws9zq1iBYtQ1UVJUSYYXOG+fE1hIES4FHHLfD0jvIgkNU7MQEsSlx/4So3ns4d
DSSYhfam+Ido8zuePoP5QR3MQJRAqG6gg0JCyM/1aSmIOn72sDn57y84swvNSnWc
0Ej5IFGvPH3CpHrpx3VeVk+TrapWiDaNCIoZbZFfE2br4OxBvRamSS0oNtyW13vQ
Ui+AEnAsxtjU+I+xWDtLagSAQyiUSAvXdV49OAqXK9iJyQiXSbSCB8KEjzGOTHcn
0sc0KAVl06ZdpdTQn/X7rgb0pJZ2FR1AqG9EfnDTc3bBOG/I7bwJCR/md7NegGWC
RB0Xd8mSnkFZsZg5uzjsF88yU3pL/n85pOWz3Cc5cPm5kOQprgOQ/WNhh/49RtWi
g1VAfPGTKtCY7MA0j/pacIkqCdyMDUCRnmPhW8KhavCiZyene2ROPIVvfQHt0dpl
f+vZv9PF1nrubIEOLt6iB6T4qnuBOAEJW+YVUtht7HoaINjYQtUoc8IZRFU2az/R
wU3n1GxN5TNb5u+aXIdt2dwvAwDq7jbu3WVvFMAUWD0Z8ofMefQMaLBw/wocLhMD
/6wcjf8ViWZUWjPNAn8ahvsGhf649DemH95FBW5Y+S7YjxFnbFQ=
=t5mo
-----END PGP SIGNATURE-----

--Km1U/tdNT/EmXiR1--
