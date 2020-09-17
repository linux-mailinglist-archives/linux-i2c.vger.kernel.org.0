Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE15C26DB69
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgIQMWx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbgIQMVL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:21:11 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F034C06174A;
        Thu, 17 Sep 2020 05:21:11 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id c18so1826407wrm.9;
        Thu, 17 Sep 2020 05:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CYQqreqmPY+DdlI4/LMZT7n9HFySUCBTaZzOmy+nr3g=;
        b=DZr9ss0fgb2wj2gUXhmJok1/Q/Q4uiYxlTW3iX6Inp9/ElTtZBw5O7hulX/W5L69Bs
         MIBfn49IkSjttHs4u8HiC068gprnMI5YJ2UB24eFGNckWq/F3KkCX1eooK1asqjyBrnP
         bigRyNbt4HXEFSyQVrquOKYPnF7GOyaYgjIdu+U8moAlA+k22hhtLfV+ivIRezj8hV3C
         CsWx8nmRiJ58HTrjHSKTmCSQgzsGb2xaky0Z6xg4RvV/2xeyL5kwgcp+b8Ara2pVpwkQ
         R3bdUazVy10T++cD0TLJ/zWJ45w72Ddc1zfRg6QpINTNYGB7JW8D89ClBJIj5iAohLcw
         tokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CYQqreqmPY+DdlI4/LMZT7n9HFySUCBTaZzOmy+nr3g=;
        b=NzajggZwb180xJtJ+ueR4gzYK9EmSz+vTUExHhs/V8lhCpTnoEo0W2hUNOss4k9G0p
         Bzb4i0chi9WfnLkDHLxWTeaqxI0eEcTqF8St3eoM8+lugV4+BRpi2Ot2WR6nkqwfV1E7
         tXt7BsatCEuxv5G9LLH/XWscWHkdkLtrWGUrl04nPquV0sakrcJIlrHnwfFny8qZKRO1
         mexgGyXXM5XH7bRgmjnFTnRuWrQU75qYz3oIy/l5214EN/bUUTlUV4UUQWfRqO9BAqK3
         7ELqdnTlfbxVdd2X3dlsps/Jo/OBe8mbJvl1qlnd+t5L+srY2PCLnPSY1Z8rXlQTtQd4
         PrZw==
X-Gm-Message-State: AOAM531JSssUA2UJo4GKA8FBQoCAfxGSqHIYYFHtWE1JoigNXbwvB8Ld
        esYA7eUZOGzh7QrQFIDtYV8=
X-Google-Smtp-Source: ABdhPJwqLArPanxVYGT0wrN9q+h5qbgQQV95mKlf8JZyrm5TDMv9t3ePg13PltUi9ZLLsL25B/fK5g==
X-Received: by 2002:a5d:4e0f:: with SMTP id p15mr32223970wrt.155.1600345269703;
        Thu, 17 Sep 2020 05:21:09 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id m23sm10978706wmi.19.2020.09.17.05.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:21:08 -0700 (PDT)
Date:   Thu, 17 Sep 2020 14:21:05 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 30/34] i2c: tegra: Clean up variable names
Message-ID: <20200917122105.GI3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-31-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XLWMkxR+mZNQ4WTO"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-31-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XLWMkxR+mZNQ4WTO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:40:02AM +0300, Dmitry Osipenko wrote:
> Rename "ret" variables to "err" in order to make code a bit more
> expressive, emphasizing that the returned value is an error code.
> Same vice versa, where appropriate.
>=20
> Rename variable "reg" to "val" in order to better reflect the actual
> usage of the variable in the code and to make naming consistent with
> the rest of the code.
>=20
> Use briefer names for a few members of the tegra_i2c_dev structure in
> order to improve readability of the code.
>=20
> All dev/&pdev->dev are replaced with i2c_dev->dev in order to have uniform
> code style across the driver.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 173 ++++++++++++++++-----------------
>  1 file changed, 86 insertions(+), 87 deletions(-)

That's indeed a nice improvement. One thing did spring out at me,
though.

> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
[...]
> @@ -1831,20 +1830,20 @@ static int __maybe_unused tegra_i2c_runtime_suspe=
nd(struct device *dev)
> =20
>  	clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
> =20
> -	return pinctrl_pm_select_idle_state(i2c_dev->dev);
> +	return pinctrl_pm_select_idle_state(dev);
>  }
> =20
>  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
>  {
>  	struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
> -	int err =3D 0;
> +	int ret =3D 0;
> =20
>  	i2c_mark_adapter_suspended(&i2c_dev->adapter);
> =20
>  	if (!pm_runtime_status_suspended(dev))
> -		err =3D tegra_i2c_runtime_suspend(dev);
> +		ret =3D tegra_i2c_runtime_suspend(dev);
> =20
> -	return err;
> +	return ret;
>  }

Isn't this exactly the opposite of what the commit message says (and the
rest of the patch does)?

Thierry

--XLWMkxR+mZNQ4WTO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jVLEACgkQ3SOs138+
s6GC6w/+IyW7glSDNb080etzU2+oeqx/jVPyinPTxjE6/IcKuvVd5LWJNFLOaJ4W
FeumA7waD71+2k+On9pJOyGUJNzIBJZkxE/ZkeWEE2ZnVMT4/OMEYce25dY7pYO7
ZS28oqIIJxkM1B9m8uxaMEVaaoOGNtowVK/gQSvfdfm4tk5P11RaKb0D3HjXa6cL
2oITcSdciVhHVTP+qeSLYNIZ3mNinplUn4hmIgkhr9d+SyLRf33riqFOGerKsCEW
u96fPqydLev4TQWyMs0TuMAzgC8Xer40i/Cn5OS6WLj2x3/WBISWL4WpMolykf4r
iMhmTStys/yN4EVJD6qUJ0XGqTtlTNAvPPSon2hUOIbjKzhi6Zxt6VleYLbPhOFE
Cs2r8ouMApBBvU4TBgG7+H29SChKHGHOtpjb9CmETdu/DHwVvUz3ShHAR8ae3RDm
YKj1NlFqAMgshb7GtFa1p0lVXOhxNNZKYx2dbX7bCeM6m4N4OW0S0Wo8beODDPZF
Wfzrx6P9+1xMiZjw+gNZoa4TgHVNWePUgfNN1jBO1BXgi52ciIvMErble5RuRClG
5nQ2M1glVLMlC5O/LakR2Tb9usscH2d9vu2kSLWst+u7IYXY5ympuAFvXrHCc608
bSX8SZnvB4SIA99lozNyzRhnXl5l5/1ytKEoi9Qd/2Qua4urTUQ=
=dMIY
-----END PGP SIGNATURE-----

--XLWMkxR+mZNQ4WTO--
