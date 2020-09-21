Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1BF3272237
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 13:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgIULWc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 07:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgIULWb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 07:22:31 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D843CC061755;
        Mon, 21 Sep 2020 04:22:30 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id m6so12347147wrn.0;
        Mon, 21 Sep 2020 04:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oPPZz1AH+B+pzy9uf97FlVlsH5jEjW4Z8ULdGGR3v/E=;
        b=WYkKZXBMn8cZ1kg36OG2jSSHuJp4sKfKdcaKFh5jDTQdfq5lte0MexbOTz/lrAVaZz
         ytFBUFKGQ21JoNQ1wEHSrI4Dm5j/TWdBLZpA8IkSVXPG548lqZ0w7FzAr6ch79HO2rK6
         73QKkKfyAV7s+idMqI3QpVScU8c/0ILtET28wUVTxNopxxK+CAWDUYc+DAesMcbEaOJj
         OSdW1yL5NhPK+upwErsca64jaxZ/+VicgZVsptQAoYnjOuA0Txwmx2Zr87GuxA8rDCV8
         3wu0LM/Slrw/JxUG8YNlNoILdeklzgI3hIVSpBvLxTprJLXNQGTsEDJniLKpDzyJQN+O
         +8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oPPZz1AH+B+pzy9uf97FlVlsH5jEjW4Z8ULdGGR3v/E=;
        b=ejp3ey7kiYuCpfUUWghOmYsX2oMLn4OEQAnCVONdMmylZpLHy1i1L5ZBxzB5p3uwAT
         KRueqc4aImp9TJ8ZiWDxAFZ435DH3ULimERokEJcth6coSsnylzvg/jK30TaYnYDsP9J
         7bV+8we+gqsknUelWMmm5BurWG0Jh9MA0kBzOniIGF7l2Wkiw/5dtPjkOSx408vDLv0X
         KYdFW0sLUkWprSyg1wZbOdHbr8KG+CdzMNoj0eCnoyKbYx3Cq2xpCzeZsTWNggpOL6t7
         LJm2qHChJ4HfUE6+Qg5tAt+kwXVsgy1tw4GBUPDmL55Zcr3eVZBYHSi4jvwIr3ovZFaA
         ehSw==
X-Gm-Message-State: AOAM5303CXe9Vabgqw6YKdaCYuSOR4Be7b2S1lzXh30eCu7dDQ9rb5f8
        WQQZmUVyctZgxCBNak34m7w6o1vCjk0=
X-Google-Smtp-Source: ABdhPJxlHhUyVIIxEJAtlMCCGY64YaSxz1PPv86LoIksd4ktSDr4FEckv2yIU4RPxmWcNqMoW2qjSg==
X-Received: by 2002:a5d:4a4a:: with SMTP id v10mr47383413wrs.72.1600687349585;
        Mon, 21 Sep 2020 04:22:29 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id 70sm19517494wme.15.2020.09.21.04.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 04:22:28 -0700 (PDT)
Date:   Mon, 21 Sep 2020 13:22:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 25/34] i2c: tegra: Factor out register polling into
 separate function
Message-ID: <20200921112226.GJ3950626@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-26-digetx@gmail.com>
 <20200917115802.GD3515672@ulmo>
 <de0bb416-b5c4-1f8a-d703-ef2e5466ac53@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QnBU6tTI9sljzm9u"
Content-Disposition: inline
In-Reply-To: <de0bb416-b5c4-1f8a-d703-ef2e5466ac53@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QnBU6tTI9sljzm9u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 06:05:41PM +0300, Dmitry Osipenko wrote:
> 17.09.2020 14:58, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Sep 09, 2020 at 01:39:57AM +0300, Dmitry Osipenko wrote:
> >> Factor out register polling into a separate function in order to remove
> >> boilerplate code and make code cleaner.
> >>
> >> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/i2c/busses/i2c-tegra.c | 57 +++++++++++++++-------------------
> >>  1 file changed, 25 insertions(+), 32 deletions(-)
> >>
> >> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-t=
egra.c
> >> index 405b87e28a98..e071de9ce106 100644
> >> --- a/drivers/i2c/busses/i2c-tegra.c
> >> +++ b/drivers/i2c/busses/i2c-tegra.c
> >> @@ -514,10 +514,24 @@ static void tegra_i2c_vi_init(struct tegra_i2c_d=
ev *i2c_dev)
> >>  	i2c_writel(i2c_dev, 0x0, I2C_TLOW_SEXT);
> >>  }
> >> =20
> >> +static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
> >> +				   u32 reg, u32 mask, u32 delay_us,
> >> +				   u32 timeout_us)
> >> +{
> >> +	void __iomem *addr =3D i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, r=
eg);
> >> +	u32 val;
> >> +
> >> +	if (!i2c_dev->is_curr_atomic_xfer)
> >> +		return readl_relaxed_poll_timeout(addr, val, !(val & mask),
> >> +						  delay_us, timeout_us);
> >> +
> >> +	return readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
> >> +						 delay_us, timeout_us);
> >> +}
> >> +
> >>  static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
> >>  {
> >> -	u32 mask, val, offset, reg_offset;
> >> -	void __iomem *addr;
> >> +	u32 mask, val, offset;
> >>  	int err;
> >> =20
> >>  	if (i2c_dev->hw->has_mst_fifo) {
> >> @@ -534,16 +548,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c=
_dev *i2c_dev)
> >>  	val |=3D mask;
> >>  	i2c_writel(i2c_dev, val, offset);
> >> =20
> >> -	reg_offset =3D tegra_i2c_reg_addr(i2c_dev, offset);
> >> -	addr =3D i2c_dev->base + reg_offset;
> >> -
> >> -	if (i2c_dev->is_curr_atomic_xfer)
> >> -		err =3D readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
> >> -							1000, 1000000);
> >> -	else
> >> -		err =3D readl_relaxed_poll_timeout(addr, val, !(val & mask),
> >> -						 1000, 1000000);
> >> -
> >> +	err =3D tegra_i2c_poll_register(i2c_dev, offset, mask, 1000, 1000000=
);
> >>  	if (err) {
> >>  		dev_err(i2c_dev->dev, "failed to flush FIFO\n");
> >>  		return err;
> >> @@ -553,30 +558,18 @@ static int tegra_i2c_flush_fifos(struct tegra_i2=
c_dev *i2c_dev)
> >> =20
> >>  static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_d=
ev)
> >>  {
> >> -	unsigned long reg_offset;
> >> -	void __iomem *addr;
> >> -	u32 val;
> >>  	int err;
> >> =20
> >> -	if (i2c_dev->hw->has_config_load_reg) {
> >> -		reg_offset =3D tegra_i2c_reg_addr(i2c_dev, I2C_CONFIG_LOAD);
> >> -		addr =3D i2c_dev->base + reg_offset;
> >> -		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
> >> +	if (!i2c_dev->hw->has_config_load_reg)
> >> +		return 0;
> >> =20
> >> -		if (i2c_dev->is_curr_atomic_xfer)
> >> -			err =3D readl_relaxed_poll_timeout_atomic(
> >> -						addr, val, val =3D=3D 0, 1000,
> >> -						I2C_CONFIG_LOAD_TIMEOUT);
> >> -		else
> >> -			err =3D readl_relaxed_poll_timeout(
> >> -						addr, val, val =3D=3D 0, 1000,
> >> -						I2C_CONFIG_LOAD_TIMEOUT);
> >> +	i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
> >> =20
> >> -		if (err) {
> >> -			dev_warn(i2c_dev->dev,
> >> -				 "timeout waiting for config load\n");
> >> -			return err;
> >> -		}
> >> +	err =3D tegra_i2c_poll_register(i2c_dev, I2C_CONFIG_LOAD, 0xffffffff,
> >> +				      1000, I2C_CONFIG_LOAD_TIMEOUT);
> >> +	if (err) {
> >> +		dev_warn(i2c_dev->dev, "timeout waiting for config load\n");
> >> +		return err;
> >>  	}
> >=20
> > The deindentation in this hunk is messing up the diffstat in my opinion.
> > It would probably be worth splitting that into a separate patch to make
> > it more evident that this patch actually removes boilerplate.
>=20
> This is intentional and it's mentioned in the v7 changelog.
>=20
> Previously there was another patch that did what you're suggesting, but
> Andy Shevchenko objected that it was causing a "ping-pong" code changes
> where one patch did a change and then next patch changes the changed
> code again.

Hm... alright then:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--QnBU6tTI9sljzm9u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9ojPIACgkQ3SOs138+
s6HrkA//Z8O/baM5Zbrs7z8tr/p5M3EfT9eweSKimo3yqRicziIelsd+eNGq3jJk
PM1Q1LREvZQwX8wv7PtbUoKTMF9PHmP92nVuMa4BYujfbQTNjuaPFtnrqgQ+1tEv
5UQEsiU7y4wqbKSIEBQWls/wEp9fLfY65CrGrR9Prvr0CTzVAWY1Z1vVWsXzr5HR
zM4wFUR78ph78og5fOCSPtwxuSZI5KTJPtxe0vfV1LzBVLw8gcK8fS9WGHT+oDSm
ffh5OansQ3O2QX/1zOs3QGwJ6fhxKegPOnOKptozn04LBIlxfrLQ22RwyWIAlisl
690NBMJqbl2TOIPzBghCw8/0W/O/i2Qqd4da3FiV4lqoZNC3v1VnPEXrvjAZoFkV
8yhWrp28N1pdzuvK4NfSHK2ongiAaaQcSTujZ3ixCt6s/vH4NuUt2GEVDpNFTAgb
0sFmE+JNCXRcMXwL+o3vdLoSLshhcnbMCFMz/IGVDc2HtKIeHOiMaCFMFt2UAq8l
vxTuTphum7QgshY59e+o278f3EHDIEyJZ5eEcYaUlgfR1TYNpDdOjaq5i+owltFt
9fgvTfm4tXtV2Uvt/HW6mxINT6bjv0cH0RSxAxHOjLf2IDz6l2zEIuTCtPmbq2X9
tuwdwDbxVRhMD7IlFlZ72Gsx19eMwYqXmOpFvHEA+thIRKEoyTs=
=VLKi
-----END PGP SIGNATURE-----

--QnBU6tTI9sljzm9u--
