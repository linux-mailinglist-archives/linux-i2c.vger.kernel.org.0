Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E515D43E0D9
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Oct 2021 14:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbhJ1M0W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Oct 2021 08:26:22 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:3532 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhJ1M0V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Oct 2021 08:26:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635423834; x=1666959834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Oq6s7AaG3bBjKwD3GLU5KykTSVALr5XWLndoODjwLU=;
  b=Rue0PgcyZZgsrKknQdIrkBaZNzzj46k7JGO6pSQhVMuqPR24GtgSaY6w
   D8B196oXaGEELWZ7iDgzJyuovmItZ+2kiw13s8B6JoestoMK1HZR0bmpw
   S+Gq/iUsqAT3tqJZbIjY7AOxiZ6DV62vCBGfivua8RzhhccK05QTYe+k3
   1aCHrnYL7i3rAaikCo3Brc7OUJplavf6DVF+fQ/Vd5irBzHKXcb421XAI
   hJDtv2d9vrXNrpIBJI3n4A73R1AIh3WPOUXXSjvCC/iLn+PlmEDjGeDbx
   xQQKhofBv2WIvL7MaE2Q0PWzrKj3+IGXndwlZ3v46USFzQnjE+zDoUX+J
   A==;
IronPort-SDR: Jvt9IWyJhVgbyC8C7YE7fAwf8FOQFwPQjJpYGNXGuvyTt+PIMFEcAa6JTDfEyUoGL2Hfvmaq2w
 zkokjxpdqcdZObeGyaYVsgJDNYsblmTlPAvakcUsV+KKlllU6BinRfLW99C4jvDTOLFiiJfRNd
 MuaTB72RiiUYZb1UKPwsYqdHulv250M1Fj7u7iXdc8JRinM0ukID43cpoTx4oBSVfpmEeqrKXk
 a3JA/6HV4WJHaB+8NhaQfxMC7DVbsb6Kjtf+DGbo02g+Sq2CK/YcuGIc3zi4lkIrTWnMTcUogx
 H2tJA3Ns9EAQWxB0z8je9So2
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; 
   d="scan'208";a="134648670"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Oct 2021 05:23:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 28 Oct 2021 05:23:51 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Thu, 28 Oct 2021 05:23:50 -0700
Date:   Thu, 28 Oct 2021 14:25:33 +0200
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     Peter Rosin <peda@axentia.se>
CC:     <robh+dt@kernel.org>, <peter.korsgaard@barco.com>,
        <lars.povlsen@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] i2c: i2c-mux-gpio: Add support 'select-delay'
 property
Message-ID: <20211028122533.4o63fuguyqfua5tm@soft-dev3-1.localhost>
References: <20211013141003.2388495-1-horatiu.vultur@microchip.com>
 <20211013141003.2388495-3-horatiu.vultur@microchip.com>
 <9fe92c02-40af-a077-4189-6f0c0a934745@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <9fe92c02-40af-a077-4189-6f0c0a934745@axentia.se>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The 10/27/2021 12:41, Peter Rosin wrote:
> 
> Hi!

Hi Peter,

> 
> I'm sorry for the slow response...
> 
> On 2021-10-13 16:10, Horatiu Vultur wrote:
> > Use select-delay property to add a delay once the mux state is changed.
> > This is required on some platforms to allow the GPIO signals to get
> > stabilized.
> >
> > Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
> > Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> > ---
> >  drivers/i2c/muxes/i2c-mux-gpio.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
> > index bac415a52b78..1cc69eb67221 100644
> > --- a/drivers/i2c/muxes/i2c-mux-gpio.c
> > +++ b/drivers/i2c/muxes/i2c-mux-gpio.c
> > @@ -13,6 +13,8 @@
> >  #include <linux/slab.h>
> >  #include <linux/bits.h>
> >  #include <linux/gpio/consumer.h>
> > +#include <linux/delay.h>
> > +
> >  /* FIXME: stop poking around inside gpiolib */
> >  #include "../../gpio/gpiolib.h"
> >
> > @@ -20,6 +22,7 @@ struct gpiomux {
> >       struct i2c_mux_gpio_platform_data data;
> >       int ngpios;
> >       struct gpio_desc **gpios;
> > +     int select_delay;
> >  };
> >
> >  static void i2c_mux_gpio_set(const struct gpiomux *mux, unsigned val)
> > @@ -29,6 +32,8 @@ static void i2c_mux_gpio_set(const struct gpiomux *mux, unsigned val)
> >       values[0] = val;
> >
> >       gpiod_set_array_value_cansleep(mux->ngpios, mux->gpios, NULL, values);
> > +     if (mux->select_delay)
> > +             udelay(mux->select_delay);
> 
> Use fsleep(mux->select_delay) if you don't know how long the delay really
> is.
> 
> However, you needlessly invoke the delay even if you do not actually change
> the state of the mux. In order to fix that, you need to keep track of the
> current state of the mux, but that's a chunk of boring code to write. If you
> instead switch to using a mux-gpio from the mux subsystem and point an
> i2c-mux-gpmux to that instance, you get that for free, and you can make simple
> changes to the i2c-mux-gpmux driver to get this sorted properly, basically
> exactly as this patch but with this
> 
> -       ret = mux_control_select(mux->control, chan->channel);
> +       ret = mux_control_select_delay(mux->control, chan->channel,
> +                                      mux->delay_us);
> 
> instead of the udelay/fsleep in this patch. That will invoke the requested
> delay, but only if too little time has gone by since the latest state change.

Thanks for the advice! I will change to use i2c-mux-gpmux and make the
changes there.

> 
> That interface (mux_control_select_delay) is brand new though, but available
> in linux-next and scheduled for the next merge window. But, since I fumbled
> this series it's a bit late for this merge window anyway (sorry again) so
> that should not be an issue.

No worries, I will try to send a new version.

> 
> Cheers,
> Peter
> 
> >  }
> >
> >  static int i2c_mux_gpio_select(struct i2c_mux_core *muxc, u32 chan)
> > @@ -153,6 +158,8 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
> >       if (fwnode_property_read_u32(dev->fwnode, "idle-state", &mux->data.idle))
> >               mux->data.idle = I2C_MUX_GPIO_NO_IDLE;
> >
> > +     fwnode_property_read_u32(dev->fwnode, "select-delay", &mux->select_delay);
> > +
> >       return 0;
> >  }
> >
> >

-- 
/Horatiu
