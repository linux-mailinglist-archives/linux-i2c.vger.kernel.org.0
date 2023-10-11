Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD007C5069
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 12:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346014AbjJKKns (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 06:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345992AbjJKKnr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 06:43:47 -0400
X-Greylist: delayed 1660 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 11 Oct 2023 03:43:43 PDT
Received: from stcim.de (stcim.de [IPv6:2a01:4f8:151:40c4::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E5792;
        Wed, 11 Oct 2023 03:43:43 -0700 (PDT)
Received: from [2a0a:a548:37e1:0:a288:b4ff:fee5:f5cc] (helo=porty)
        by stcim with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <contact@stefanchrist.eu>)
        id 1qqWFt-0001zQ-ME; Wed, 11 Oct 2023 12:15:53 +0200
Date:   Wed, 11 Oct 2023 12:15:53 +0200
From:   Stefan Lengfeld <contact@stefanchrist.eu>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     linux-media <linux-media@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org
Subject: Re: Sony IMX290/462 image sensors I2C xfer peculiarity
Message-ID: <20231011101553.we3r73xejvqdql5j@porty>
References: <m3y1gpw8ri.fsf@t19.piap.pl>
 <CAPY8ntASwh3AcRqE+2zF4Df=u+=wJ5K9icAeOrXTMJGDd1+caw@mail.gmail.com>
 <m3o7hfx3ob.fsf@t19.piap.pl>
 <m37cnuvmhn.fsf@t19.piap.pl>
 <m3o7h5tthf.fsf@t19.piap.pl>
 <m3jzrttrmz.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3jzrttrmz.fsf@t19.piap.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Krzysztof,

> Currently, every i.MX8MP atomic I2C transfer starts with 100 us delay
> (just after the START condition). At 400 kHz bus (384 kHz or whatever),
> this is equivalent to several tens of bits. Is this delay needed?

I cannot answer whether the delay is needed for atomic transfer or not.
But I can give a bit of context for I2C atomic transfers in general.

These where only introduced for a very narrow and special uses shutting
down the device/power with external PMICs in the kernel's shutdown
handlers.

E.g. the see code in the file 'drivers/i2c/i2c-core.h':

    /*
     * We only allow atomic transfers for very late communication, e.g. to access a
     * PMIC when powering down. Atomic transfers are a corner case and not for
     * generic use!
     */
    static inline bool i2c_in_atomic_xfer_mode(void)
    {
            return system_state > SYSTEM_RUNNING && irqs_disabled();
    }

So I wonder why this delay is a problem for your described you case.
The e-mail title talks about an image sensor. Why and in which use case
this sensor needs an atomic transfer? 

My understand is that an ordinary I2C device would just use normal (and
sleepable) I2C transfers while the device is in use.

Kind regards,
Stefan

On Wed, Oct 11, 2023 at 11:50:12AM +0200, Krzysztof Hałasa wrote:
> Hi,
> 
> adding more people to Cc: as this is more general stuff than my specific
> image sensor setup.
> 
> Is there any reason for the following (meta) patch to not be applied?
> 
> Currently, every i.MX8MP atomic I2C transfer starts with 100 us delay
> (just after the START condition). At 400 kHz bus (384 kHz or whatever),
> this is equivalent to several tens of bits. Is this delay needed?
> 
> This is on NXP 5.15 branch, but it seems the mainline is identical here.
> 
> With this patch, the 1-byte (quasi) atomic image sensor register reads
> (16-bit address + 8-bit value) are down to ca. 160 us, and writes take
> 120 us.
> 
> It seems one bit on the bus takes ca. 2.66 us (hardware), and the delay
> between consecutive bytes is ca. 4.82 us (I guess CPU takes a fair share
> of this). This is i.MX8MP @ apparently 1200 MHz (1600 MHz with freq
> scaler).
> 
> Fire away.
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -534,xx +534,xx @@
>  static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool atomic)
>  {
>      unsigned long orig_jiffies = jiffies;
>      unsigned int temp;
>  
>      while (1) {
>          temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
>  
>          /* check for arbitration lost */
>          if (temp & I2SR_IAL) {
>              i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
>              return -EAGAIN;
>          }
>  
>          if (for_busy && (temp & I2SR_IBB)) {
>              i2c_imx->stopped = 0;
>              break;
>          }
>          if (!for_busy && !(temp & I2SR_IBB)) {
>              i2c_imx->stopped = 1;
>              break;
>          }
>          if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
>              dev_dbg(&i2c_imx->adapter.dev,
>                  "<%s> I2C bus is busy\n", __func__);
>              return -ETIMEDOUT;
>          }
>          if (atomic)
> -            udelay(100);
> +            udelay(1);
>          else
>              schedule();
>      }
>  
>      return 0;
>  }
> -- 
> Krzysztof "Chris" Hałasa
> 
> Sieć Badawcza Łukasiewicz
> Przemysłowy Instytut Automatyki i Pomiarów PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa
> 
