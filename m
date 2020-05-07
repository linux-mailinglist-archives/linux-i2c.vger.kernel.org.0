Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572C21C8655
	for <lists+linux-i2c@lfdr.de>; Thu,  7 May 2020 12:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgEGKDV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 May 2020 06:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725809AbgEGKDU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 May 2020 06:03:20 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 431F2C061A10;
        Thu,  7 May 2020 03:03:20 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id i15so5182722wrx.10;
        Thu, 07 May 2020 03:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+uhxHnWowmeDt3C8GfzyBsv3dkXsqrc1/v3uHuJHr7o=;
        b=L8CQkdC8okVL2d9SAJg6pLHx+UnoWW91MNvpTzJ3tGBTNNhtxo3/tHwZsavqQXZGw7
         n6f+Z71LVq2T3+cQcJrQ3MZPJsYItrF+cJXFJ7ZkHBS0Shr+fZ9/2xuzQ1d1jYud/Kj1
         JyGkJLw4pG57Br3m4U4zopZUkPf1mSMbSpAVDJhZFmMovXNroC7YjHOJMtayttNGyiwp
         yGNr0jn+RCINiZCqGy2UCXXnKJiA2hjWbN1/nzmKGgzTSHdhaOLOpNwOdp7vNFVmSAye
         x/RUozMwVrd2n0O7eqTInwgEpWXrUhwLcUZayEbay9w4JS/f34WBD3+2Qw8kbXLaPoE7
         ce/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+uhxHnWowmeDt3C8GfzyBsv3dkXsqrc1/v3uHuJHr7o=;
        b=ly6Ey5Np9e9zoNullGtyqrssz6sGHsVWqR52p1VDyLcy/NQPVmoPonS2too3y8v95Q
         rgASup95mtQfM2P+9nv4o2nVRJn3LnMx1k5/4dJ2VGTMe6xwYbxmFIYrBtEvB8nSUiGW
         kkxsK3mP09P1AdARyR+LkrYBlNzgMVKN9M5QHgTn1WieVGumLUU50Ig6ZEtt5Saf7Th9
         bPGXTrm33QJ/LIDF4Mmxud+adZZBxJV+TM85NwFKsCqpLPImmfKZ0JvwIfyQ22omDL2l
         aAMiYJuokcQ+w1lVKt2J8OAcQElpbaZd0bRsln03S99DXoMRz68HAfpXtXZ1EbMX7lXR
         +5+A==
X-Gm-Message-State: AGi0PuZStkmgPqoC0otuRFhlrGQL90ms+dIB8kUQDmXqsHoKzUDN75vR
        AvAjkb1zwUb8hvEMRBzSZws=
X-Google-Smtp-Source: APiQypJpjuztjkwjxr3N7HRPfRs9YuV1pyzn/GcRjpPqcNrPpX4ebefO5LoNnEwIxciozyQnCM1/7A==
X-Received: by 2002:a5d:4248:: with SMTP id s8mr14292309wrr.216.1588845798856;
        Thu, 07 May 2020 03:03:18 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id n7sm7197780wmd.11.2020.05.07.03.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 03:03:16 -0700 (PDT)
Date:   Thu, 7 May 2020 12:03:15 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     mirq-test@rere.qmqm.pl
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
Message-ID: <20200507100315.GA2890327@ulmo>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
 <20200506193358.2807244-3-thierry.reding@gmail.com>
 <20200506224336.GA23423@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <20200506224336.GA23423@qmqm.qmqm.pl>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2020 at 12:43:36AM +0200, mirq-test@rere.qmqm.pl wrote:
> On Wed, May 06, 2020 at 09:33:55PM +0200, Thierry Reding wrote:
> [...]
> > --- a/drivers/i2c/busses/i2c-tegra.c
> > +++ b/drivers/i2c/busses/i2c-tegra.c
> > @@ -1769,10 +1769,14 @@ static int tegra_i2c_remove(struct platform_dev=
ice *pdev)
> >  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
> >  {
> >  	struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
> > +	int err =3D 0;
> > =20
> >  	i2c_mark_adapter_suspended(&i2c_dev->adapter);
> > =20
> > -	return 0;
> > +	if (!pm_runtime_status_suspended(dev))
> > +		err =3D tegra_i2c_runtime_suspend(dev);
> > +
> > +	return err;
> >  }
> > =20
> >  static int __maybe_unused tegra_i2c_resume(struct device *dev)
> > @@ -1788,9 +1792,11 @@ static int __maybe_unused tegra_i2c_resume(struc=
t device *dev)
> >  	if (err)
> >  		return err;
> > =20
> > -	err =3D tegra_i2c_runtime_suspend(dev);
> > -	if (err)
> > -		return err;
> > +	if (pm_runtime_status_suspended(dev)) {
> [...]
> Shouldn't this be negated as in suspend? I would assume that inbetween
> suspend and resume nothing changes the stored state.

I know this is confusing because I have now twice had the same doubts
after looking at the patch after I sent it out and thought I had sent
out a wrong version.

However, I think it starts to make more sense when you look at the
resulting code, which I'll reproduce below:

	static int __maybe_unused tegra_i2c_resume(struct device *dev)
	{
		struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
		int err;

		err =3D tegra_i2c_runtime_resume(dev);
		if (err)
			return err;

		err =3D tegra_i2c_init(i2c_dev, false);
		if (err)
			return err;

		if (pm_runtime_status_suspended(dev)) {
			err =3D tegra_i2c_runtime_suspend(dev);
			if (err)
				return err;
		}

		i2c_mark_adapter_resumed(&i2c_dev->adapter);

		return 0;
	}

So the purpose here is to runtime resume the I2C controller temporarily
so that the register context can be reprogrammed because it was lost
during suspend. Now, if the controller was runtime suspended prior to
system suspend, we want to put it back into suspend after the context
was loaded again. Conversely, if it was not runtime suspended, then we
want to keep it on.

If it helps I can sprinkle some comments throughout this function to try
and explain why exactly this is being done.

Thierry

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6z3OAACgkQ3SOs138+
s6EuehAAogxFDT5rRRkKex6Gppi0OnhVKA91lY8Rayw8JdkFPmcaIuNdIW4N+16T
eQdVwiWAIh3lXJLfXzGHg8wiL9HTO2z04tc4KeeFATCQbFVmfQMKiQRgifJIn9qI
8IdRUdRv75fc1MjpWcJqp5Mb2KiOUplopPmwUmdAZjYhJ45BQr/O4/a1sQJd0hvL
RWCXmbDPAiqO/ssmCXudkCmAUTN4fcP9Tk2eaYRAs73nt8VjPnJ4eg1DN3DdeZxk
BngPeMHHPP4RjTCyJ54xHz7iSbymSCaV2C1aIJ3ahYomuX/lelWpYdkgUjo9AS+A
ieEWYTlbHaHSVgVRSj5GyON86ph9JAF3TnaJvdHMlzvIvGyIplcHrjcHTWcE2AJr
zglMh5EnhfO+ILOTUa279lVCc5SQMDFYAtuc66zhJHoFXsv0NnCB6KunqeUw4KYW
DGvzVmGrXJZ8x/cWelSXwInlzVDqqQxF8RFtG0peO8/tnNSNVRx33qFSHUxeIfEf
VTiuc3GUuDoOlw9EHmFVII3+EsZ9PHcfPUDlwRTAEq8Xl9tc5OKiqMLhfpAiiFj7
7Er34qUNL5lIXaLnc4W9jDO3jRfekhVx2xJB43OM/jRuPQ2VwTphhd8TmoZr1xFy
8dJta3tH0OLDX0hOtvTVivc7F2nt9fdwexfdGCPc2CKwUoJ1YXU=
=12NZ
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
