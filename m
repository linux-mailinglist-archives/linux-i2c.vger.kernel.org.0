Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7BFA950D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2019 23:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730873AbfIDVXm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Sep 2019 17:23:42 -0400
Received: from sauhun.de ([88.99.104.3]:46340 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730863AbfIDVXk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Sep 2019 17:23:40 -0400
Received: from localhost (p54B337F1.dip0.t-ipconnect.de [84.179.55.241])
        by pokefinder.org (Postfix) with ESMTPSA id 285352C08C3;
        Wed,  4 Sep 2019 23:23:38 +0200 (CEST)
Date:   Wed, 4 Sep 2019 23:23:37 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>, alokc@codeaurora.org,
        agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: qcom-geni: Provide an option to select FIFO
 processing
Message-ID: <20190904212337.GF23608@ninjato>
References: <20190904113613.14997-1-lee.jones@linaro.org>
 <20190904203548.GC580@tuxbook-pro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kbCYTQG2MZjuOjyn"
Content-Disposition: inline
In-Reply-To: <20190904203548.GC580@tuxbook-pro>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kbCYTQG2MZjuOjyn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2019 at 01:35:48PM -0700, Bjorn Andersson wrote:
> On Wed 04 Sep 04:36 PDT 2019, Lee Jones wrote:
>=20
> The subject implies that we select FIFO mode instead of DMA, but that's
> not really true, because with DMA enabled we still fall back to FIFO for
> messages below 32 bytes.=20
>=20
> So what this does it to disable DMA, which neither the subject or the DT
> property describes.
>=20
> Also missing is a description of why this is needed.

Yes.

I am willing to help to get this resolved soonish. However, I have
issues with the approach.

It looks like a workaround to me. It would be interesting to hear which
I2C client breaks with DMA and if it's driver can't be fixed somehow
instead. But even if we agree on a workaround short term, adding a
binding for this workaround seems like a no-go to me. We have to live
with this binding forever. Sidenote: I could think of a generic
'disable-dma' which could be reused everywhere but we probably won't get
that upstream that late in the cycle.

Is there no other way to disable DMA which is local to this driver so we
can easily revert the workaround later?

>=20
> Regards,
> Bjorn
>=20
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/i2c/busses/i2c-qcom-geni.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2=
c-qcom-geni.c
> > index a89bfce5388e..dfdbce067827 100644
> > --- a/drivers/i2c/busses/i2c-qcom-geni.c
> > +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> > @@ -353,13 +353,16 @@ static void geni_i2c_tx_fsm_rst(struct geni_i2c_d=
ev *gi2c)
> >  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_m=
sg *msg,
> >  				u32 m_param)
> >  {
> > +	struct device_node *np =3D gi2c->se.dev->of_node;
> >  	dma_addr_t rx_dma;
> >  	unsigned long time_left;
> > -	void *dma_buf;
> > +	void *dma_buf =3D NULL;
> >  	struct geni_se *se =3D &gi2c->se;
> >  	size_t len =3D msg->len;
> > =20
> > -	dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);
> > +	if (!of_property_read_bool(np, "qcom,geni-se-fifo"))
> > +		dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);
> > +
> >  	if (dma_buf)
> >  		geni_se_select_mode(se, GENI_SE_DMA);
> >  	else
> > @@ -392,13 +395,16 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_de=
v *gi2c, struct i2c_msg *msg,
> >  static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_m=
sg *msg,
> >  				u32 m_param)
> >  {
> > +	struct device_node *np =3D gi2c->se.dev->of_node;
> >  	dma_addr_t tx_dma;
> >  	unsigned long time_left;
> > -	void *dma_buf;
> > +	void *dma_buf =3D NULL;
> >  	struct geni_se *se =3D &gi2c->se;
> >  	size_t len =3D msg->len;
> > =20
> > -	dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);
> > +	if (!of_property_read_bool(np, "qcom,geni-se-fifo"))
> > +		dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);
> > +
> >  	if (dma_buf)
> >  		geni_se_select_mode(se, GENI_SE_DMA);
> >  	else
> > --=20
> > 2.17.1
> >=20

--kbCYTQG2MZjuOjyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1wK1kACgkQFA3kzBSg
KbYdkBAAgFs9RXf2jczJ4+RRvtmpQ2kMs/T+w039wUaHrptyk1cujtkKBxIzzaQ5
PuTTxkEAxUQdfp8NX2fpjFDU9OJZPMwtXJ6kDLDINm/o35+dVZeJ/d2OealTBHwn
v3yDd7w6vR/ilOUW395nT0RF5ngxXMKOr9Mcy1qUPygIf7WJmhSUqL8Ps0jLai2F
xgV3dSHPAXjtciwzNwV7uhsSGEQl19COjYxG/CeQqRQrWy31i/3Pr71xYiTEre0K
mgg0O23T7h0TZvoXFYrWb62XqpM/kk2z5YCgYx2d3Zy9mVMCBVhoZkAnlzZ8aigb
nvPaO6y25m6kFeI4NlgMxqQH7IhCqCHWGx5Y2fdGFOqCt/2nTYwBmzaQvRozrXoa
q6oL30dW5dewd8sTN9RMH0C43TXApsPOOUFieARIIcszOZPJBRWuvAx69UEMEYdw
/U9Q5uknA9K72KMoNfQwRmK1SlQur5sZ0obxir8hvbDdg3+11oek+2h90fom2ZZy
Jdcg9i51an87RBRHe6YIXwOVstFWuq0GwOvB8gTT0m9v8TcnoFALWNrYlGaCmt1a
HvBw24Ds4n25HfcM4OCPnsxDJ1LN9/kAaupXUGwUbo6X1XVKRPQG1OzrYxhehQW8
N4v1tQBpjvVEN5DK5+hfU8zJozEAu8kqOVBWQJ4s12GvFYy18/0=
=Qcw2
-----END PGP SIGNATURE-----

--kbCYTQG2MZjuOjyn--
