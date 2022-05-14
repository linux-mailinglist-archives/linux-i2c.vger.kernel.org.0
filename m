Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB28C52718A
	for <lists+linux-i2c@lfdr.de>; Sat, 14 May 2022 16:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232927AbiENOEf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 May 2022 10:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232890AbiENOE1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 14 May 2022 10:04:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BEB1409E
        for <linux-i2c@vger.kernel.org>; Sat, 14 May 2022 07:04:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E70CD60F00
        for <linux-i2c@vger.kernel.org>; Sat, 14 May 2022 14:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61A3C340EE;
        Sat, 14 May 2022 14:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652537065;
        bh=fLmh9v/8tBIB59+1j3VtnSsTU0ItnIoNNZu1xV3/0Hc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kjTMGkUEKuVEP11oBs7SRtVET9XhDyuZcUYWcnhPPzoN9S8+ORJTsAx2ihdI06tmE
         40V7PC8m+/GQeOfZVaL3v9PTbwb3lw7j76Dh3LxCjwu2KwunBDLhD4p1amid5ksa4n
         L6tvMDpWxr8jvsfPEI3EOc0xY7LeOd/PfG6gHOP6X2J6Qblw9jK2PnDziESvpvBCkY
         ISZu6nFBXjeYqz9UDiNomfTxPoKqXjJtNGkza5QU3G3UIUqd6vlkR0iFux12kZtldn
         uX0eDnkeo+hnFf1mhxV9c3XgL45X4aHv6rovaqVFWUHl5tHrztWPJXwzag+LShv5Jd
         X7BTx4hfSeSTA==
Date:   Sat, 14 May 2022 16:04:21 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-i2c@vger.kernel.org, git@xilinx.com
Subject: Re: [PATCH 3/4] i2c: xiic: Correct the datatype for rx_watermark
Message-ID: <Yn+25eC8sre9RVH9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-i2c@vger.kernel.org, git@xilinx.com
References: <20220420075924.14546-1-shubhrajyoti.datta@xilinx.com>
 <20220420075924.14546-4-shubhrajyoti.datta@xilinx.com>
 <29058bda-e040-2b69-7dd1-33e52ba431c5@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ejs1y04uAST7l8rO"
Content-Disposition: inline
In-Reply-To: <29058bda-e040-2b69-7dd1-33e52ba431c5@xilinx.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Ejs1y04uAST7l8rO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2022 at 10:50:32AM +0200, Michal Simek wrote:
>=20
>=20
> On 4/20/22 09:59, Shubhrajyoti Datta wrote:
> > The message length data type should be u16 as per the i2c_msg structure
> >=20
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > ---
> >   drivers/i2c/busses/i2c-xiic.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xii=
c.c
> > index 16a7e3164e68..eb4d34e7c0fe 100644
> > --- a/drivers/i2c/busses/i2c-xiic.c
> > +++ b/drivers/i2c/busses/i2c-xiic.c
> > @@ -576,7 +576,7 @@ static int xiic_busy(struct xiic_i2c *i2c)
> >   static void xiic_start_recv(struct xiic_i2c *i2c)
> >   {
> > -	u8 rx_watermark;
> > +	u16 rx_watermark;
> >   	struct i2c_msg *msg =3D i2c->rx_msg =3D i2c->tx_msg;
> >   	/* Clear and enable Rx full interrupt. */
>=20
> xiic_setreg8(struct xiic_i2c *i2c, int reg, u8 value) has u8 value it mea=
ns
> I would expect you will also recast it.
> Value can't be more then IIC_RX_FIFO_DEPTH anyway that's why it shouldn't=
 be
> a problem.
>=20
> xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, (u8)(rx_watermark - 1));

Waiting for v2 here.


--Ejs1y04uAST7l8rO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJ/tuUACgkQFA3kzBSg
KbZjQA//VgMDkT9ReM4CTI45C0Q+lJkcrKdnMtr3Z8jRDgR5LVZaBJnAytEEN3iF
K4VOb+ePX6GOEyvEPGIfat5nn+yZQOYSC4IIdXi8dZOheRMJhlR29Ls92Yo7BW5e
wfkkdLWCwKQZCU1GX9KsNVBPsOmnVg2Tclr+wVhcsgegW06gVmlbidTxPCqGfoRN
gnfUdt8SJmnzNjdgn81fEsQKSxWMLfJ6oE6p9h22In2GZE7NLhYXtTyg0/WmPRbt
6CtJWs6hh4PQGJOi8cwAlx4JubjZnstxsw+VM+7E8XJu52RkU1HvcWQNkjA9tLRN
1sUeEPOWSJj3Zn5kN0ZmKOGvOGCeRw0pwNvZUutO8qB4K3h1roXc6gKqCGy0ielk
TRoEbJPV9y+VMe7Juntg7P2IrY/uaasGxx3xg9eJfz2aZLqyQoNoCVY8l+14RUci
2jbG6Qgka/9COtLeYNTsBxgnhMCYv+gC+Z9vQBxoLci2clIpOgnA9UQZvM35deiW
HZfUfHeCAyDs4E2MDwiUSuD4OXvCDU6wBxt1XuwcMnba2DeduGPKkrn2GPZ1jS5B
X3O2seNe3NAYFeEN1u9sgnnYP/ej6AKEm67cH8AqyOHRmbueywScWcq65/9pg/kt
AU00ZPp4Ow3l6l71nh+h6xD+seqw7/ZaoPlLsj0LEey7dzaVjx8=
=DTYd
-----END PGP SIGNATURE-----

--Ejs1y04uAST7l8rO--
