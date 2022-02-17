Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78D244BAA0F
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Feb 2022 20:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233004AbiBQTpP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Feb 2022 14:45:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbiBQTpO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Feb 2022 14:45:14 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A731A41FB2
        for <linux-i2c@vger.kernel.org>; Thu, 17 Feb 2022 11:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=PLV4LWdDj/u4ldrwNJYwwtOs/CoI
        lUCOXcXS6q9IYUo=; b=fJL2ikFxTOLyTXIRNVEYrWc0XWEN34j1CyPK4lhiH+rY
        /9XQ8S2Qp7qxN2GdupIvJ9LbAX7m59ina+JE/ZcEyS5CZF1Rn+mY3j966OJwrHW7
        QrJ87kXFw2LIK0RqAefXtu3QnG5iYSKr1/gCLMZLk3dyVUK74zEoUh8h8SwMmuQ=
Received: (qmail 507920 invoked from network); 17 Feb 2022 20:44:54 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Feb 2022 20:44:54 +0100
X-UD-Smtp-Session: l3s3148p1@9M/h/zvY1uogAQnoAFSyAKtB1T4Nf0Bd
Date:   Thu, 17 Feb 2022 20:44:51 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andrew Gabbasov <andrew_gabbasov@mentor.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
Subject: Re: [PATCH v2] i2c: rcar: add SMBus block read support
Message-ID: <Yg6ls0zyTDe7LQbK@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
References: <20210922160649.28449-1-andrew_gabbasov@mentor.com>
 <CAMuHMdVVDpBAQR+H1TAnpf65aVbAL0Mm0km7Z9L7+1JuF6n1gQ@mail.gmail.com>
 <000001d7badd$a8512d30$f8f38790$@mentor.com>
 <20211006182314.10585-1-andrew_gabbasov@mentor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2acm5ptTzxcRBe88"
Content-Disposition: inline
In-Reply-To: <20211006182314.10585-1-andrew_gabbasov@mentor.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2acm5ptTzxcRBe88
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

first sorry that it took so long. The reason here is that my original
plan was to add 256-byte support to RECV_LEN in the I2C core and enable
it on R-Car afterwards. Sadly, I never found the time to drive this
forward. So, all RECV_LEN things got stuck for a while :(

> This patch (adapted) was tested with v4.14, but due to lack of real
> hardware with SMBus block read operations support, using "simulation",
> that is manual analysis of data, read from plain I2C devices with
> SMBus block read request.

You could wire up two R-Car I2C instances, set up one as an I2C slave
handled by the I2C testunit and then use the other instance with
SMBUS_BLOCK_PROC_CALL which also needs RECV_LEN. Check
Documentation/i2c/slave-testunit-backend.rst for details.

I wonder a bit about the complexity of your patch. In my WIP-branch for
256-byte transfers, I have the following patch. It is only missing the
range check for the received byte, but that it easy to add. Do you see
anything else missing? If not, I prefer this simpler version because it
is less intrusive and the state machine is a bit fragile (due to HW
issues with old HW).

=46rom: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Sun, 2 Aug 2020 00:24:52 +0200
Subject: [PATCH] i2c: rcar: add support for I2C_M_RECV_LEN

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 217def2d7cb4..e473f5c0a708 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -528,6 +528,7 @@ static void rcar_i2c_irq_send(struct rcar_i2c_priv *pri=
v, u32 msr)
 static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
 {
 	struct i2c_msg *msg =3D priv->msg;
+	bool recv_len_init =3D priv->pos =3D=3D 0 && msg->flags & I2C_M_RECV_LEN;
=20
 	/* FIXME: sometimes, unknown interrupt happened. Do nothing */
 	if (!(msr & MDR))
@@ -542,11 +543,13 @@ static void rcar_i2c_irq_recv(struct rcar_i2c_priv *p=
riv, u32 msr)
 	} else if (priv->pos < msg->len) {
 		/* get received data */
 		msg->buf[priv->pos] =3D rcar_i2c_read(priv, ICRXTX);
+		if (recv_len_init)
+			msg->len +=3D msg->buf[0];
 		priv->pos++;
 	}
=20
 	/* If next received data is the _LAST_, go to new phase. */
-	if (priv->pos + 1 =3D=3D msg->len) {
+	if (priv->pos + 1 =3D=3D msg->len && !recv_len_init) {
 		if (priv->flags & ID_LAST_MSG) {
 			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_STOP);
 		} else {
@@ -889,7 +892,7 @@ static u32 rcar_i2c_func(struct i2c_adapter *adap)
 	 * I2C_M_IGNORE_NAK (automatically sends STOP after NAK)
 	 */
 	u32 func =3D I2C_FUNC_I2C | I2C_FUNC_SLAVE |
-		   (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
+		   (I2C_FUNC_SMBUS_EMUL_ALL & ~I2C_FUNC_SMBUS_QUICK);
=20
 	if (priv->flags & ID_P_HOST_NOTIFY)
 		func |=3D I2C_FUNC_SMBUS_HOST_NOTIFY;

Happy hacking,

   Wolfram


--2acm5ptTzxcRBe88
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIOpa8ACgkQFA3kzBSg
KbbOpw/6AytfzBlrI+AZSPjgcsIAOV/p95TJu+PcUIgOeKtyleBeoMzd2r29bfuV
1hrMdmU145BUZHmpiwGOqILZwihZa7TKoZvHB+ZZfSI/5qvCCv5jNyLEx3u8MiOX
sl0CT5YcMPYCyfDO3AsPAN9Oxq0VdDTbpPv2TZ9MBycl62UDoFbGfYPHfxyKy3CQ
Bp6QxT05cWiw1yRRK2hF89nGb4oeWeD1EV3ELIkJAIQtQSunJmu0lymr+lJJR8uz
j03LeikTmgoU2hgW23Y6GLQJe85LyAiQZhGT6g2kXabsJQJv9Fu1YLTwJvcb5+Np
wQ9daniG9wsqjTvpOkVlPzrAQCyoAZ0veQwkKd9FrCgZZ3K+hXdujkAMY/tHGmvC
9/kW07yO6a0UlJ1S2QD86Byc5R8+t3WI9xU6y0fQgHKxcUoMfxrnapOMATLb0kEm
w/Q5RQzgLKaj/71SGf/92/tc57D1Li1i+uG6rVmNLPHHGbqOfSInRDkut8Ac/TJh
AUft/52hdAVQPgaj2vDXlw43gwfgfrouwBEwjn6thjJ27BQlp+onwkwjuThop8zP
8erJycPp5fqqSh7hObVQSzZjBljVAuWNIyDM76/TcTtekR+s3AkHmt1D9Z9WeyJS
+zRaqQD016MwwX/r/oKO03y47DzCDg+Vee3h3caQjAVXlLFWmtk=
=QVKF
-----END PGP SIGNATURE-----

--2acm5ptTzxcRBe88--
