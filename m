Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 233048D7C9
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 18:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfHNQPS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 12:15:18 -0400
Received: from sauhun.de ([88.99.104.3]:50502 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725828AbfHNQPS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Aug 2019 12:15:18 -0400
Received: from localhost (p54B33326.dip0.t-ipconnect.de [84.179.51.38])
        by pokefinder.org (Postfix) with ESMTPSA id B927A2C311C;
        Wed, 14 Aug 2019 18:15:15 +0200 (CEST)
Date:   Wed, 14 Aug 2019 18:15:15 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     lingyxu <lingyan.xu@nokia-sbell.com>,
        Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wladislav Wiebe <wladislav.wiebe@nokia.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>
Subject: Re: [PATCH] i801_smbus: clear SMBALERT status bit and disable
 SMBALERT interrupt
Message-ID: <20190814161515.GB5816@kunai>
References: <1565577634-18264-1-git-send-email-lingyan.xu@nokia-sbell.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline
In-Reply-To: <1565577634-18264-1-git-send-email-lingyan.xu@nokia-sbell.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2019 at 10:40:34AM +0800, lingyxu wrote:
> From: Lingyan Xu <lingyan.xu@nokia-sbell.com>
>=20
> In current i801 driver, SMBALERT interrupt is allowed
> (Slave Command Register bit2 is 0).
> But these is no handler for SMBALERT interrupt in i801_isr,
> if there is SMBALERT interrupt asserted and deasserted,
> i801 will have an irq flood for the related status bit is setted.
>=20
> So SMBALERT interrupt handler is needed, and also, SMBALERT interrupt
> will be generated from time to time if slave chip have some fault.
> So disable SMBALERT interrupt is also needed.
>=20
> About the solution,
> please see http://www.farnell.com/datasheets/1581967.pdf
> Page632 P640 for more.
>=20
> Signed-off-by: Lingyan Xu <lingyan.xu@nokia-sbell.com>

Jean, this seems important if it fixes an interrupt flood. Can you
review, please?

> ---
>  drivers/i2c/busses/i2c-i801.c |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index f295693..033bafe 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -661,9 +661,11 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
>  	 * Clear irq sources and report transaction result.
>  	 * ->status must be cleared before the next transaction is started.
>  	 */
> +
> +	outb_p(status, SMBHSTSTS(priv));
> +
>  	status &=3D SMBHSTSTS_INTR | STATUS_ERROR_FLAGS;
>  	if (status) {
> -		outb_p(status, SMBHSTSTS(priv));
>  		priv->status =3D status;
>  		wake_up(&priv->waitq);
>  	}
> @@ -1810,6 +1812,9 @@ static int i801_probe(struct pci_dev *dev, const st=
ruct pci_device_id *id)
>  	/* Default timeout in interrupt mode: 200 ms */
>  	priv->adapter.timeout =3D HZ / 5;
> =20
> +	/* Disable SMBALERT interrupt */
> +	outb_p(inb_p(SMBSLVCMD(priv)) | BIT(2), SMBSLVCMD(priv));
> +
>  	if (dev->irq =3D=3D IRQ_NOTCONNECTED)
>  		priv->features &=3D ~FEATURE_IRQ;
> =20
> --=20
> 1.7.1
>=20

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1UM5MACgkQFA3kzBSg
KbbKShAAgHQ//ioHF5ivdpcdozotMV3e/P41u3Se2raGd/cDF/ImlZvHh4hlOyn9
P7jp8dpeq9GfUeHXiE26jaGHZyHP9i80FMU2fO3LIludY4P7MsAV4fcTfJKzMZIC
FxUmXkrgmYeqDcDnW13NU1AaSEfTGb+T08ccOF8uhpZT1JC16eXd3ILZ5dlXujmO
XzwqGWRcJPof8d/xXbtl6yo3LaX//RqS7hPVz+pFAvOGE0IV2EOGGHeUgWU99UTu
+a7mNXOSCa/IFsDIKMF5B9Qg942nRnQZNbleNCPfO3jOAYgvLrv3a0RrK+PIoLl9
AwSHl6ts6HjqibPkqaMFPkXkRCseXmbIgV7QCuv8jHsCE1r4cRPpuzoZTWZI3pur
DYqOP5/T9gZgR8GaKkNL74DC1G7/8sRuZX077nHOwCEpDO2ckqjLpVxaOBGsIzVw
pjsGIjEMVlcAXD1rZWSCw/m8HEvDbdwAwfpUVx6KJNuUfOnDM6ajPQvos86ybfzR
INkMPnDAxAu7HrYEkhGy1w3yzBA8qH6vSl+Za7KcBrdmXRBQVfgtDHBI0Sfmz/Ig
tJZGX7LQ9lo3aK4FuMWRKBGKnejbj4EzaGOnxqseDvmcORK+KGqD9MjbhcFjICUq
bgjs3RPpIoeTGQ+3F1FmY+woRDb/bOvcAIHYNvxxCgIUAU9GrPI=
=/1k8
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
