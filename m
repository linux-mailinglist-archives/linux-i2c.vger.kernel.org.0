Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 025B311E640
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 16:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbfLMPMa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 10:12:30 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34701 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbfLMPM3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Dec 2019 10:12:29 -0500
Received: by mail-wm1-f67.google.com with SMTP id f4so6209690wmj.1;
        Fri, 13 Dec 2019 07:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tX5Wv/+UhrHaxE6+OU6uNpOsiYcHwXYxk1ZdJgWmWa0=;
        b=Rc3mmhRF1ng+AN7Ut+/an+d2y7DQn267Ww/7O7WMm2QHg0cjjBiT/tGaScLooUCoe3
         lNq+rX8ENFIDZJGK5c3VM7ihpkptkiahaJgd1ia5rgmKtaO/qyDION3EHoxWlbGf5DC+
         ObNgH9D09PVYq08lzQx5ZJ9TIrUkppG37WIpQK6ivd30xlkJ9b89fmWGjkcEUayH9B9/
         hR+Lzc/Zqq2aMKD3SeG7wiGanNzdINWzHKliZFOsfyL3zlgLXCRdULaMHZHuwOScilKh
         Tw7/e/HDPWaKkfsH0P6cRNRjxJhIKANGL8+fX7OgKj9iY7G6H+pgMQTp9WvQHneFaJZf
         JYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tX5Wv/+UhrHaxE6+OU6uNpOsiYcHwXYxk1ZdJgWmWa0=;
        b=R/FFsP/UC8BhbKQwg8ozsplB4U3O9QhLIFkVPQdmxABes7sl279YeiatfzTd16fxhe
         MrwqpNTv2pb9qnZqUdA2qP/pPctGAd7B5qyTDjSP1aLK/iBL8nmwWDVDYueIGST7jmEr
         FhGhW8psQ6dmQy4jjkzLs0BdXrxUYMWumCwhCY59pEmUvEq29OSHzZOlAnEbTsp3coHA
         m9So+MnY7ugegzyXS823IoEwRXlbu6KHzvHpblIdgBpfTn7C3fa2a8/bHFWifxgnkBis
         qIqBil9QwjHz7T6uDwbZSb9CzxMf0s5lbvrVj9LPq1ppISN/Q0FquugszfPAouz/gqnZ
         FLNw==
X-Gm-Message-State: APjAAAXYAz46gmcxPi6PwPjmobOqoMd8QzTGY8KUjLiUn1hdOFNiMNQe
        dvKqQOKobYkNe7yvi1awhGY=
X-Google-Smtp-Source: APXvYqxpxnTmWAzw3dEdWjYZ1elcKuHlD5m7+duOEacbw6evKDacTYOiF+lcoem8fY5VhWQNSWG8nQ==
X-Received: by 2002:a1c:4e10:: with SMTP id g16mr13741309wmh.94.1576249947079;
        Fri, 13 Dec 2019 07:12:27 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id e18sm10274572wrr.95.2019.12.13.07.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 07:12:25 -0800 (PST)
Date:   Fri, 13 Dec 2019 16:12:24 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to
 I2C_PIO_MODE_PREFERRED_LEN
Message-ID: <20191213151224.GD222809@ulmo>
References: <20191212233428.14648-1-digetx@gmail.com>
 <20191212233428.14648-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="F8dlzb82+Fcn6AgP"
Content-Disposition: inline
In-Reply-To: <20191212233428.14648-3-digetx@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--F8dlzb82+Fcn6AgP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2019 at 02:34:27AM +0300, Dmitry Osipenko wrote:
> DMA is preferred for a larger transfers, while PIO is preferred for a
> smaller transfers to avoid unnecessary DMA overhead. There is no strict
> size limitations for the PIO-mode transfers, so let's rename the constant
> for clarity.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

I ran this on the test farm and the results are all green, so:

Tested-by: Thierry Reding <treding@nvidia.com>

--F8dlzb82+Fcn6AgP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3zqlgACgkQ3SOs138+
s6HWYQ/+Pixr7HSMd237gQrljywWaHn5qJa8HcAhiW/UKmZKDZNHsYSpYCeN8JGe
qHizf5L5PLPgin43IOjvAXd0QzdVUqGNSoZEr/UjoskZTYCLe/KiUvXLa8gTp498
kUEPzgmXC2z8ifixzDpS8cELWl+Qh+ihwXqiGjf223RUlzDzN5m/fpbPqNIBFF9a
YvzcNDzOY8P0xm74UR3aO7B4TsYgUEVJttWbZRjJwHAbG3A0eY1K1CFT5SRGT5O+
vms6FfGwPpw9xNFHV0qfdGDedR6FVC3HxYQ6/dH0j0pqOt9L1kIhNsrlz02SaZbK
/pPBpotoXoqO2Zxzy+izHR/ziTi9lLVs4EFLR9Uoa0JMDnM35dxWn6QA3KtEoXBm
ncPCoOsIzm90QErx5/AO9A2Ny0k85ykogHBWFh3Kl33uG8SjYZHnuHplHGwSRlKv
gYcoxcuQW9ONd/EDpJn0XVCcHsEqdPejYXWL1J7iq2DjvJHvE2S9iefg2aIN68JD
646Hztb7idQVBvdAE+TgL7A3WThw9JfkpexyiQrxbZjoVOoBzCduCouq6us4H5Ry
hNU33u/r9mnsPbR6YBCs78j2pdedu46fPVjmZFEEuwUIX3SDTWtr0e9XtG3U658u
GCBvXxSUIaMUSq0g+NFuj9UN6C/CVuty4f7A8kJf5X0axafkxds=
=0Y5T
-----END PGP SIGNATURE-----

--F8dlzb82+Fcn6AgP--
