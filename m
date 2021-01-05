Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 232222EB067
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 17:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbhAEQpX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 11:45:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:43152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727514AbhAEQpW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 11:45:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1E6622CB8;
        Tue,  5 Jan 2021 16:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609865082;
        bh=H0WZOEocDZIx7q5VbSqoLG/nIiUX+dNGUjjlCqsqE9w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BOkdrYfXl/a9b7kWh4Y8a7cfW9PS5ejg/QonA/DgkOOnH0n/DqtyU7QenBVhg/wAf
         TGI1yIw+n0gEISzK7Oglo6P7C0Ky9O2d0XPVnLG1Y85VVewOGsuDid/jPc2Q5gqOOu
         NpQAeGwOCWnKuIs6TCXFHWnvnZe6olGDRlZgKahHukyKabH4Pe+kG4yk00MugLfyea
         y3qrk3NoN+GnBlyjR7QCjM98aCgrQz3iwDkiJe1ngl/3kdXiZraCKPhpbU1uNvBeQi
         HXt62mWsZFHuu6O3m21bDvyoecepSKR9zoADVh6eGk6H9EKS1W6So6IS+5uUsr135H
         58HO+ClYXXI+g==
Date:   Tue, 5 Jan 2021 17:44:38 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] i2c: busses: Use DEFINE_SPINLOCK() for spinlock
Message-ID: <20210105164438.GL1842@ninjato>
References: <20201228135120.28678-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LQ77YLfPrO/qF/pM"
Content-Disposition: inline
In-Reply-To: <20201228135120.28678-1-zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LQ77YLfPrO/qF/pM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 28, 2020 at 09:51:20PM +0800, Zheng Yongjun wrote:
> spinlock can be initialized automatically with DEFINE_SPINLOCK()
> rather than explicitly calling spin_lock_init().
>=20
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Applied to for-next, thanks!


--LQ77YLfPrO/qF/pM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0l3YACgkQFA3kzBSg
KbarwRAAr4pT2LxG2s72mUctdm0q+75z0Y5ulysn0MJfsW59QUyOND55jWVxl0l6
sUu9dtu7qIeRPRhP3uNfeV1i7YMbh6tWpklXN3AGIMo5drEYrgzz9GSey+wA9Tk3
UhYZMfuDF+erYLrfegaFM7dObPifrSfmvsp/dLxE5CfQcMl9KU7T/VkN//ilu9Dx
sT0sNk8affHvHM28uz14k98aAFWfN9ltrtDAR+0Pd1iBxrw4339nNsrWLwoCKzf+
RcG/s1tJLhvVVV3vZ97lbKAdlVtc7q3Tor8B7y3Y/WmNYUZB0YKhsfOMVbknlXXb
H5RsvQwLqYNBH8EFID79We51vKJ4SGYbGa+IvmTP8SPRad0SurbOv4oAteGqG0ej
igusZssCPPcmawgESvQRrykyYDQrumJqO+h9wCzaEayoQo187ooAUvVAMJzXUUJu
KovNg1V0fsgFwxEPZdg+YY9XaBSmktaqVUZNBZaMVEyoevpU5FBV24XFtuxXl+2l
tNT/lY8ZyFqQSwtedNzJI76i8OKkoQ0LHukoYzvThxwzPkFVFjCRB/ignxcoHBkD
k5MCYV2u9F1PTFCvm0TsoFaeZJKwKuLUesD47uC94lKPASHjrWJxw04Gkm+Q0YfE
Xh2U1X6ucOd5aD/MhKN6Jtk7rqQrrU8c7l+eEBWDSLnaFFC3new=
=w42K
-----END PGP SIGNATURE-----

--LQ77YLfPrO/qF/pM--
