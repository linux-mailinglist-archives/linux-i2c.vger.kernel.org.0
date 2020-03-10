Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFA8B17F3E5
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 10:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgCJJmD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 05:42:03 -0400
Received: from sauhun.de ([88.99.104.3]:46710 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726202AbgCJJmC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 05:42:02 -0400
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
        by pokefinder.org (Postfix) with ESMTPSA id 6125C2C1EB6;
        Tue, 10 Mar 2020 10:42:00 +0100 (CET)
Date:   Tue, 10 Mar 2020 10:42:00 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Girish Mahadevan <girishm@codeaurora.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] i2c: qcom-geni: Let firmware specify irq trigger
 flags
Message-ID: <20200310094159.GG1987@ninjato>
References: <20200204193152.124980-1-swboyd@chromium.org>
 <20200204193152.124980-2-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JbKQpFqZXJ2T76Sg"
Content-Disposition: inline
In-Reply-To: <20200204193152.124980-2-swboyd@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JbKQpFqZXJ2T76Sg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2020 at 11:31:50AM -0800, Stephen Boyd wrote:
> We don't need to force IRQF_TRIGGER_HIGH here as the DT or ACPI tables
> should take care of this for us. Just use 0 instead so that we use the
> flags from the firmware. Also, remove specify dev_name() for the irq
> name so that we can get better information in /proc/interrupts about
> which device is generating interrupts.
>=20
> Cc: Girish Mahadevan <girishm@codeaurora.org>
> Cc: Dilip Kota <dkota@codeaurora.org>
> Cc: Alok Chauhan <alokc@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

All patches look good, but this one doesn't build because dev is defined
in the next patch only. I also can't apply patch 2 before 1, so please
rebase and resend.

> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 17abf60c94ae..3e13b54ce3f8 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -549,8 +549,8 @@ static int geni_i2c_probe(struct platform_device *pde=
v)
>  	init_completion(&gi2c->done);
>  	spin_lock_init(&gi2c->lock);
>  	platform_set_drvdata(pdev, gi2c);
> -	ret =3D devm_request_irq(&pdev->dev, gi2c->irq, geni_i2c_irq,
> -			       IRQF_TRIGGER_HIGH, "i2c_geni", gi2c);
> +	ret =3D devm_request_irq(dev, gi2c->irq, geni_i2c_irq, 0,
> +			       dev_name(&pdev->dev), gi2c);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Request_irq failed:%d: err:%d\n",
>  			gi2c->irq, ret);
> --=20
> Sent by a computer, using git, on the internet
>=20

--JbKQpFqZXJ2T76Sg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5nYOQACgkQFA3kzBSg
KbaZ1Q//bEqT5U1ii86pzp09TaBI3QzrPc5uzlHnrBieB7gZ0pkytJrO1PSXyfXk
kozWfv5urS2U0jj2jnRAD30N7jPTxmUw/2OUTM+pXWVAg1/gMEPJ61VDMfEpl8JX
oLSbsw3nGVWHdcdI5RvjECqBYie4V969Qy++vo4CE3+Ojcf2LhEDT3rXMoM3sLt2
YYF+VhArh5D68UwJ+0XeP2A2XZNc08qFN+bpPcHr/vDpzfgkq5L5Es9NATAvUUww
fNrq8qywVHlC9ylepuaqKBN/4YZVlwMSkiNZyKLhWkoWbINtnSadpHGd1oQ63J6P
f0FTch18NjURIJchZaAeSpPsPQCAG9yl3TV0AZBv4MlzSvgOT2C+lezzDwT0oSG5
/ZnXHr/yNNeXxYOU2Ya3cQ32Uoo3g7hICuKnOiBDR1TNPnY/ymfeeKdZAMyqcgxj
+sSs9OMf4l97luaFdoDuA0MzqdVV7ZY/n0tpsR6Zqpuz2ATW4PFc0zmaci3Kp1QZ
2Mfma5Zn5iUl12EjS1zS/VmFcFO5cAfBPWSBymeRFZ6fhP5sSdqSgaVsDP6eq0dS
uWlLsjNPv9XI8na981XdbD5Wggdolxzpkyn48vgbLr/PBcrKfak9eUKevqRH/M5V
EIDZe9RakIgD2VIvm+n+L3RzhS+FZ4fU0oOdhOdgCxjoilB6tKk=
=T8mr
-----END PGP SIGNATURE-----

--JbKQpFqZXJ2T76Sg--
