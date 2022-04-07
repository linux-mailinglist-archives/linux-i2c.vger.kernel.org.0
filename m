Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4514F7DB1
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Apr 2022 13:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbiDGLRK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 7 Apr 2022 07:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244678AbiDGLRJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Apr 2022 07:17:09 -0400
X-Greylist: delayed 63 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 07 Apr 2022 04:15:06 PDT
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18D8CD337;
        Thu,  7 Apr 2022 04:15:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; 
   d="scan'208";a="74187576"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 07 Apr 2022 03:14:00 -0800
IronPort-SDR: YW35u0CJ9tOwnhT1AwcB1e0VhHyElVpQHIFx2BCYlAa+bL2j4lQcYrMf7InxVQIi/NzQDypCA9
 Wr5NdI06U4ajU0ic8IaaxzFijIhCsbFTs+bmo/NQKOI9XeVSWDp2xbu1DE5ym1k43rM8H+hob5
 r30KfSvY1RhSP45nAVn9AtW8eB/GR/RPy9dyKqTr/uiaD6jZi0axZDeA1V30KyojSDztYzmQib
 vwOi3mDd29DXt0pJT+j7dM4hJWSdOP95daLMGFZtt/GnQhNKBfknEK+u6A1sqivTb4ISSyC7Rw
 8wY=
From:   "Gabbasov, Andrew" <Andrew_Gabbasov@mentor.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        "Surachari, Bhuvanesh" <Bhuvanesh_Surachari@mentor.com>
Subject: Re: [PATCH v4] i2c: rcar: add support for I2C_M_RECV_LEN
Thread-Topic: [PATCH v4] i2c: rcar: add support for I2C_M_RECV_LEN
Thread-Index: AQHYSNUQyopoQTRIREK+Oe0vqly5pazkTnWw
Date:   Thu, 7 Apr 2022 11:13:55 +0000
Message-ID: <1649330034935.59928@mentor.com>
References: <20220405100756.42920-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220405100756.42920-1-wsa+renesas@sang-engineering.com>
Accept-Language: en-US, en-IE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Wolfram,

Sorry for late response, I had some problems accessing my e-mail.

Thank you for your efforts on moving forward on this topic.
Indeed, this version of the patch combines all features/suggestions,
being discussed earlier, and looks quite compact and clear.

If you don't mind, I would propose one small "polishing" modification
(re-ordering of statements), that doesn't affect the functionality, see below.

________________________________________
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: Tuesday, April 5, 2022 13:07
> To: linux-i2c@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org; Eugeniu Rosca; Wolfram Sang; Surachari, Bhuvanesh; Gabbasov, Andrew
> Subject: [PATCH v4] i2c: rcar: add support for I2C_M_RECV_LEN
>
> [skipped]
>
> @@ -535,12 +537,29 @@ static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
>                 rcar_i2c_dma(priv);
>         } else if (priv->pos < msg->len) {
>                 /* get received data */
> -               msg->buf[priv->pos] = rcar_i2c_read(priv, ICRXTX);
> +               u8 data = rcar_i2c_read(priv, ICRXTX);
> +
> +               msg->buf[priv->pos] = data;
> +               if (recv_len_init) {
> +                       if (data == 0 || data > I2C_SMBUS_BLOCK_MAX) {
> +                               priv->flags |= ID_DONE | ID_EPROTO;
> +                               return;
> +                       }
> +                       msg->len += msg->buf[0];
> +                       /* Enough data for DMA? */
> +                       if (rcar_i2c_dma(priv))
> +                               return;
> +                       /* new length after RECV_LEN now properly initialized */
> +                       recv_len_init = false;
> +               }

It looks like rcar_i2c_dma() starts DMA transfer at once, including to the transfer
the byte, currently residing in ICRXD register. (Because ICMSR.MDR bit is set.
That was the issue in my previous v2 patch: it copied the "current" byte to the
"next" buffer position too. To fix that, it would probably be necessary to clear
that bit before starting DMA, so that it starts with the next/pending bytes).

It means that this very first "length" byte will be copied to the buffer
by DMA transfer too (in addition to explicit assignment above).

So, I would propose to move the statement, placing the data byte to the buffer
("msg->buf[priv->pos] = data;"), to this place, after the "if (recv_len_init)" clause,
just before incrementing priv->pos.
Accordingly, adjustment of msg->len inside that "if" should be done using "data"
instead of "msg->buf[0]" ("msg->len += data;").

Besides avoiding of double assignment of that "length" byte to the buffer,
this move will avoid pollution of the buffer in case of an error (invalid length).
And will place filling in the data and position incrementation closer to each
other, that looks more "natural".

Again, this is just a "stylish" change, the patch looks good without it too ;-)

Thanks!

Best regards,
Andrew

>                 priv->pos++;
>         }
>
> -       /* If next received data is the _LAST_, go to new phase. */
> -       if (priv->pos + 1 == msg->len) {
> +       /*
> +        * If next received data is the _LAST_ and we are not waiting for a new
> +        * length because of RECV_LEN, then go to a new phase.
> +        */
> +       if (priv->pos + 1 == msg->len && !recv_len_init) {
>                 if (priv->flags & ID_LAST_MSG) {
>                         rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_STOP);
>                 } else {
> @@ -847,6 +866,8 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
>                 ret = -ENXIO;
>         } else if (priv->flags & ID_ARBLOST) {
>                 ret = -EAGAIN;
> +       } else if (priv->flags & ID_EPROTO) {
> +               ret = -EPROTO;
>         } else {
>                 ret = num - priv->msgs_left; /* The number of transfer */
>         }
> @@ -909,6 +930,8 @@ static int rcar_i2c_master_xfer_atomic(struct i2c_adapter *adap,
>                 ret = -ENXIO;
>         } else if (priv->flags & ID_ARBLOST) {
>                 ret = -EAGAIN;
> +       } else if (priv->flags & ID_EPROTO) {
> +               ret = -EPROTO;
>         } else {
>                 ret = num - priv->msgs_left; /* The number of transfer */
>         }
> @@ -975,7 +998,7 @@ static u32 rcar_i2c_func(struct i2c_adapter *adap)
>          * I2C_M_IGNORE_NAK (automatically sends STOP after NAK)
>          */
>         u32 func = I2C_FUNC_I2C | I2C_FUNC_SLAVE |
> -                  (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
> +                  (I2C_FUNC_SMBUS_EMUL_ALL & ~I2C_FUNC_SMBUS_QUICK);
>
>         if (priv->flags & ID_P_HOST_NOTIFY)
>                 func |= I2C_FUNC_SMBUS_HOST_NOTIFY;
> --
> 2.30.2
>
