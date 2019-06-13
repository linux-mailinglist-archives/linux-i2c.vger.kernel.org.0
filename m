Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D51043EFE
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 17:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390048AbfFMPyT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 11:54:19 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34005 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731566AbfFMIxZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jun 2019 04:53:25 -0400
Received: by mail-wm1-f68.google.com with SMTP id w9so6099715wmd.1;
        Thu, 13 Jun 2019 01:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/OgU2TpfXEeSpwkFFZhBsXGi+MN32/lqmv7BcTIi3FI=;
        b=USazJQPkklCfeKwWu7WagGrFt+KbbFSw6ITSivwBX+ZIniGirMHPtvBHKpQuPaDyz4
         W6WOkQQy3IHIUidyTh0Adu0sut3YnkEisBWWo8Bx3iwMVCa80WBbCnsNaOdwfAIpUmNG
         CAzg0G+xNBVYUco2YhRYW3ypuetByRwosrXKXr6ITlzZbOMp6uat5vyCTSFv2CrEGs9F
         AxA57V0WogIf0XqvoDHu7TfFo1WzSv5C2La7ISkkohtW7d/+4258YH7C4OztDDsIXBFf
         x1dezGbIu1xzKokNJgkvdb7RSTx8zJwvXdHe9fbLUr/tNhZwtAGw0NyM3YUKLvio7mPb
         H/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/OgU2TpfXEeSpwkFFZhBsXGi+MN32/lqmv7BcTIi3FI=;
        b=rI9m6sVu2JPgA5ZAKjkd/i3WPg5Qx9nD9GOM4KnbLggy7hyaPz2xAfqgwiH9mvs5M1
         tLQsnj3E4JRfqpKzXsoaFHBQsH6F4yGJvUcjY6XkyTNnvemMl3v6ZlC4fbmb3oHQxDr/
         a+n6eDVgtiA8/D4XAUsAW1KDCm1lY9EdgaN4ICzrMAYc+BgQXMmfXx1NO8Ejnwnxt0R4
         UefmqKMu9mt+aV/0gW3AvyF8gA5nt7Upajr3H2RdEJU16b0wYvF2ykgXHAb0FQ1RMsLC
         gXBt/qcUwE43KT8+4XDHnmJv8GavWXgdMx3XOnLiKuQz3svJjWm/tlrDM4H5uKhFAjZ4
         zoHA==
X-Gm-Message-State: APjAAAX0vYJ2KtqHDGy4EGzya1ESbE2qA+JSMbcr0cwzOx+DiEKX6e6X
        ad0yiqZF9Qv1hBPrdKBu1ho=
X-Google-Smtp-Source: APXvYqw6Kjh0hiMNmclneqev/DiCYw6yuOi8A+C+DQ65yxl2fqr1dNeigLLp6R43aVGCaFl3a6dpTA==
X-Received: by 2002:a1c:9d86:: with SMTP id g128mr2936562wme.51.1560416002865;
        Thu, 13 Jun 2019 01:53:22 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id h90sm5178879wrh.15.2019.06.13.01.53.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 01:53:21 -0700 (PDT)
Date:   Thu, 13 Jun 2019 10:53:20 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] i2c: tegra: Avoid error message on deferred probe
Message-ID: <20190613085320.GB30664@ulmo>
References: <20190527102939.7616-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline
In-Reply-To: <20190527102939.7616-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2019 at 12:29:39PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> If the driver defers probe because of a missing clock, avoid outputting
> an error message. The clock will show up eventually.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Hi Wolfram,

any comments on this patch or is it good to go?

Thanks,
Thierry

> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index ebaa78d17d6e..6bfd5297f425 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1517,7 +1517,9 @@ static int tegra_i2c_probe(struct platform_device *=
pdev)
> =20
>  	div_clk =3D devm_clk_get(&pdev->dev, "div-clk");
>  	if (IS_ERR(div_clk)) {
> -		dev_err(&pdev->dev, "missing controller clock\n");
> +		if (PTR_ERR(div_clk) !=3D -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "missing controller clock\n");
> +
>  		return PTR_ERR(div_clk);
>  	}
> =20
> --=20
> 2.21.0
>=20

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0CDwAACgkQ3SOs138+
s6Huaw/8DLbY+/OI6PwN9jtoWHGbyhVXpxvkBSLVhozT9JgwZd55mRFCWTUWo/5X
NvzLpFarCawjpz2qIb+lGKX2GA7oIFIAVwmJ5XBrS7lB8LEHbx0z5Sz2Vfi8pmQ3
OgdNBVw1JMuR8N6NxvBRdN0oUQ2WLRn/4iDuaKWA2/DsoyDvA7WTdUJUsXrqK+iR
gPjWbcow+fxanOVZQdgrv6zeooxWF42wkeo+dbrOegPZnwuX6DYoQtGENynAg0jL
feeX5hfXJNHKdFVrY4Q+njUHF9Sb0ZeoJOOtIuviQTAZ6+MhVX0ipXlD24vXyYkH
CGJWIrvWcRoNeVQ08gWrNSjn1QsGErprzhJTq9VfeAgYtdkEaK/Jp7xcIhyiu00Y
BWU4N48ee6GwuAArDmmgKjKNYSsn1MLq5GNk60+39aH7IxkajmW0JRwjQ7aIwgPN
OLr3DXIG96Ych7TxKjpvYINIRKXmNrB7qnbUM4sCZuVkPbExujkzWXymG/Nu+ogZ
9geaL6nYwuIcc+xvUnJ4hVBKv1iT9aVSv9aKClLr+FJ8DHokbjCeWk7Wt4o6DTeP
oRH8g3DKqxbE/NBBsL/jLFJJ6kAPzgB9TZi1HJ5UuEvNLMUjIQJ7Hg2qZ92Bax8h
ZtvTrzwJBpp93VjlidVhoXClxJT7VLC3MHdFTZ7RZctAv3KzTXk=
=DTRB
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
