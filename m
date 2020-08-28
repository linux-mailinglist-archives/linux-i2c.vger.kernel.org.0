Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1602556FB
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Aug 2020 10:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728548AbgH1I57 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Aug 2020 04:57:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:43274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728362AbgH1I55 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Aug 2020 04:57:57 -0400
Received: from localhost (p54b3345c.dip0.t-ipconnect.de [84.179.52.92])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DDF642071B;
        Fri, 28 Aug 2020 08:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598605076;
        bh=pAusFcRyXdLAIqOWXjDwv7l61XTyyrN9JtHq6bnbc+o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j7xye4qSDrONmNxUwpayzCQk7yRjuAlIuHhaL4TP4oZaG3rsbEvYO/oPDvTxxTGDI
         21Z3lhsUZDF/qPQg3o8kNzoHFfwb5I8jKROF81V4HpQIsj//zdOZQ1ylgGe4SAbuZd
         fGZsWk5gqoa+8jnlvIJctoW45Z3qEhM98WuWvTbQ=
Date:   Fri, 28 Aug 2020 10:57:53 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [PATCH] i2c: i801: Fix resume bug
Message-ID: <20200828085753.GH1343@ninjato>
References: <20200825191303.4a258073@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fmEUq8M7S0s+Fl0V"
Content-Disposition: inline
In-Reply-To: <20200825191303.4a258073@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fmEUq8M7S0s+Fl0V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2020 at 07:13:03PM +0200, Jean Delvare wrote:
> From: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>=20
> On suspend the original host configuration gets restored. The
> resume routine has to undo this, otherwise the SMBus master
> may be left in disabled state or in i2c mode.
>=20
> [JD: Rebased on v5.8, simplified a condition.]
>=20
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> ---
> I noticed this bug in a QEMU x86_64 q35 VM booted with OVMF. OVMF
> doesn't initialize the SMBus master. After 1s of SMBus inactivity
> autosuspend disables the SMBus master. To reproduce please note QEMU's
> ICH9 SMBus emulation does not handle interrupts and it's necessary
> to pass the parameter disable_features=3D0x10 to the i2c_i801 driver.
>=20
> Note from JD: I can't test this.

Thanks for keeping up with this one. I have one high level comment but I
hope Volker, Bjorn, and Vaibhav have comments/tags, too.

> +static unsigned char i801_setup_hstcfg(unsigned char hstcfg)
> +{
> +	hstcfg &=3D ~SMBHSTCFG_I2C_EN;	/* SMBus timing */
> +	hstcfg |=3D SMBHSTCFG_HST_EN;
> +	return hstcfg;
> +}

What about putting the write to SMBHSTCFG here, too. When I read the
function name, I assumed it will do that.

> @@ -1961,8 +1965,11 @@ static int i801_suspend(struct device *d
> =20
>  static int i801_resume(struct device *dev)
>  {
> -	struct i801_priv *priv =3D dev_get_drvdata(dev);
> +	struct pci_dev *pci_dev =3D to_pci_dev(dev);
> +	struct i801_priv *priv =3D pci_get_drvdata(pci_dev);
> +	unsigned char hstcfg =3D i801_setup_hstcfg(priv->original_hstcfg);
> =20
> +	pci_write_config_byte(pci_dev, SMBHSTCFG, hstcfg);

And on top of that, we could skip the 'hstcfg' variable here.


--fmEUq8M7S0s+Fl0V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9IxxEACgkQFA3kzBSg
Kbbg1BAAoWPrtp77x0Zy8dOYQiVNUV/LpiLUt5IAqDM0a8yjnACNLMo+9NJpeJjZ
913m0kz7wyVqn+3EDfY3xH1QE+5AZi4NxtTA55VcivHHftRAe38u2QmGKgf2Q5BJ
wGOZ8PysbH/h8yG7DIhfWjEVkAWfwQT0bBngOj2xBW2OdleD7Eg/f5pocUzhR8Qk
4PuOI6aNz6ujGmKfs0Eil3DbO+IB03RWKhmxBEurCvjwkhcE6M6YUcN/2qyWLT0H
WVDi5U8ALpDXjfmBunxyAuD4vaosTkgb96vxjlt4Q3Fb5+HyNNsETXM57CjW9Jyz
I1IDqh580B24UWApFN9ZxFyBLVYiugbkj+HKkENUvQU3IgUImPH5ZRd7rodd8Zw/
wccHKUKRZwKrYXqz2nfocSOqMsOcNfzaopP43NOWJy86snbzPoSKqHovVSnG8LJH
rhvgnRdk3wkbRbOb5xG5ypGy9/pf8jgFyaLFo4iAkdd3zMx5iG/5Ch0/83sbG4Gn
FUsTp5kAft91jac6BFwc15L5v10s35ZCv0uQ8rCXN01ylAGYXK95ZG5IrSEVMUEM
vszA/D9JGSwCXLJ4ZbtBFq0WZ18dIogy7ofejL+05zqo6N9KYGguygjZTX3EsAFN
G44FOdZBZ4gmp8km6XRdm2uzYLZF8VHMX8bPhu+Q+j90iIGZ8p4=
=StAo
-----END PGP SIGNATURE-----

--fmEUq8M7S0s+Fl0V--
