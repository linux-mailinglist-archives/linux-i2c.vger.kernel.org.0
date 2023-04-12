Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 063D86DF0F6
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Apr 2023 11:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjDLJtq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Apr 2023 05:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjDLJtp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Apr 2023 05:49:45 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1039F6A79;
        Wed, 12 Apr 2023 02:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681292977; x=1712828977;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=xwU26vqz+i6o48xeFGosEf02x2/+P84gSenez762bBM=;
  b=jg20KNNC4TolaTi45Tbh2JTYJil7rgCB61GGghyhdFeCTfzc23C9DQ0a
   nKkY69SrGYZYtV6tOXD9ASUgS/E+le0loFOdW61mG7OjrWcgb8i35ny3A
   6Ll3DP8zS6xPjKRb9lE2UM4l2JQlnkZmPeVlTHyIVedyx40b+i/bmgcAW
   /GeerVHC++PWavu6z99ZDgKGVprcbnvCJRIoN4iO/MhFVXRSGZpaPqfXC
   B+ne5wbghGpndcUcH7DrTznRqxXyUOEChCExaccTEmS7xxWsnU+TMKKvt
   uzTiiZQfCWeT1Su0XGlzRuvb7q6fmN9AmigYmtR9x8sgfRNS9ofRC6Yi2
   A==;
X-IronPort-AV: E=Sophos;i="5.98,339,1673910000"; 
   d="scan'208";a="30272747"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 12 Apr 2023 11:49:34 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 12 Apr 2023 11:49:34 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 12 Apr 2023 11:49:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681292974; x=1712828974;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=xwU26vqz+i6o48xeFGosEf02x2/+P84gSenez762bBM=;
  b=dC4OyqL7aMsrY/2pSTrDmSklV+rwocj8Q7HNfxbG13aHEIN3F2pbBdvQ
   QKUBHmTBfu8vzFb4S2oSfCWfBio900gYyK2T+e3LZIkBO1ZgPmzsIFnY4
   fCMs8BAsumxaAf7rumObgNqm0LwjJeu5b1hCFt5ONH+sm2qdM9mqPIzNE
   JNB125GfwmKM98wOopHm2v2fwx1ebYjEIjCdmTTBRcdJ3K26Mgajvj1hz
   a7pT2ySFlli9VsGmCaNsNfEHm+TGZGNZ9aDCqr3uOAa+Ijps6ozAM1XyT
   BjlHlWrPvWp0ZeAW2hPOwCSWusqUp8CjynjuvZCoe7qf/EwioWPM/peYK
   A==;
X-IronPort-AV: E=Sophos;i="5.98,339,1673910000"; 
   d="scan'208";a="30272746"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Apr 2023 11:49:34 +0200
Received: from [192.168.2.129] (SCHIFFERM-M2.tq-net.de [10.121.49.20])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 6F4D2280056;
        Wed, 12 Apr 2023 11:49:34 +0200 (CEST)
Message-ID: <a937f0c71497b41dc6b7ceb30dc6fdbbed856714.camel@ew.tq-group.com>
Subject: Re: [PATCH] i2c: ocores: generate stop condition after timeout in
 polling mode
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>
Cc:     Federico Vaga <federico.vaga@cern.ch>,
        Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux@ew.tq-group.com" <linux@ew.tq-group.com>
Date:   Wed, 12 Apr 2023 11:49:32 +0200
In-Reply-To: <20230220161628.463620-1-matthias.schiffer@ew.tq-group.com>
References: <20230220161628.463620-1-matthias.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 2023-02-20 at 16:17 +0000, Matthias Schiffer wrote:
> From: Gregor Herburger <gregor.herburger@tq-group.com>
>=20
> In polling mode, no stop condition is generated after a timeout. This
> causes SCL to remain low and thereby block the bus. If this happens
> during a transfer it can cause slaves to misinterpret the subsequent
> transfer and return wrong values.
>=20
> To solve this, pass the ETIMEDOUT error up from ocores_process_polling()
> instead of setting STATE_ERROR directly. The caller is adjusted to call
> ocores_process_timeout() on error both in polling and in IRQ mode, which
> will set STATE_ERROR and generate a stop condition.
>=20
> Fixes: 69c8c0c0efa8 ("i2c: ocores: add polling interface")
> Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>


Any chance we can get someone to have a look at this patch?

Regards,
Matthias



> ---
>  drivers/i2c/busses/i2c-ocores.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-oco=
res.c
> index a0af027db04c1..28bcda3f7040a 100644
> --- a/drivers/i2c/busses/i2c-ocores.c
> +++ b/drivers/i2c/busses/i2c-ocores.c
> @@ -342,18 +342,18 @@ static int ocores_poll_wait(struct ocores_i2c *i2c)
>   * ocores_isr(), we just add our polling code around it.
>   *
>   * It can run in atomic context
> + *
> + * Return: 0 on success, -ETIMEDOUT on timeout
>   */
> -static void ocores_process_polling(struct ocores_i2c *i2c)
> +static int ocores_process_polling(struct ocores_i2c *i2c)
>  {
>  	while (1) {
>  		irqreturn_t ret;
>  		int err;
> =20
>  		err =3D ocores_poll_wait(i2c);
> -		if (err) {
> -			i2c->state =3D STATE_ERROR;
> -			break; /* timeout */
> -		}
> +		if (err)
> +			return err;
> =20
>  		ret =3D ocores_isr(-1, i2c);
>  		if (ret =3D=3D IRQ_NONE)
> @@ -364,6 +364,8 @@ static void ocores_process_polling(struct ocores_i2c =
*i2c)
>  					break;
>  		}
>  	}
> +
> +	return 0;
>  }
> =20
>  static int ocores_xfer_core(struct ocores_i2c *i2c,
> @@ -387,16 +389,16 @@ static int ocores_xfer_core(struct ocores_i2c *i2c,
>  	oc_setreg(i2c, OCI2C_DATA, i2c_8bit_addr_from_msg(i2c->msg));
>  	oc_setreg(i2c, OCI2C_CMD, OCI2C_CMD_START);
> =20
> -	if (polling) {
> -		ocores_process_polling(i2c);
> -	} else {
> +	if (polling)
> +		ret =3D ocores_process_polling(i2c);
> +	else
>  		ret =3D wait_event_timeout(i2c->wait,
>  					 (i2c->state =3D=3D STATE_ERROR) ||
> -					 (i2c->state =3D=3D STATE_DONE), HZ);
> -		if (ret =3D=3D 0) {
> -			ocores_process_timeout(i2c);
> -			return -ETIMEDOUT;
> -		}
> +					 (i2c->state =3D=3D STATE_DONE), HZ) ?
> +						0 : -ETIMEDOUT;
> +	if (ret) {
> +		ocores_process_timeout(i2c);
> +		return ret;
>  	}
> =20
>  	return (i2c->state =3D=3D STATE_DONE) ? num : -EIO;

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/

