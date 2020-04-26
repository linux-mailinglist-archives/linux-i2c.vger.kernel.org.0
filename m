Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8461B8DEB
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Apr 2020 10:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgDZIae (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Apr 2020 04:30:34 -0400
Received: from sauhun.de ([88.99.104.3]:43528 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726108AbgDZIad (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 26 Apr 2020 04:30:33 -0400
Received: from localhost (p54B33954.dip0.t-ipconnect.de [84.179.57.84])
        by pokefinder.org (Postfix) with ESMTPSA id 36E3B2C01E8;
        Sun, 26 Apr 2020 10:30:31 +0200 (CEST)
Date:   Sun, 26 Apr 2020 10:30:31 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
Cc:     Thor Thayer <thor.thayer@linux.intel.com>,
        linux-i2c@vger.kernel.org, tomonori.sakita@sord.co.jp
Subject: Re: [PATCH] i2c: altera: Fix race between xfer_msg and isr thread
Message-ID: <20200426083030.GI1262@kunai>
References: <20200410.100640.1949609603287475131.atsushi.nemoto@sord.co.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2xeD/fx0+7k8I/QN"
Content-Disposition: inline
In-Reply-To: <20200410.100640.1949609603287475131.atsushi.nemoto@sord.co.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2xeD/fx0+7k8I/QN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 10:06:40AM +0900, Atsushi Nemoto wrote:
> Use a mutex to protect access to idev->msg_len, idev->buf, etc. which
> are modified by both altr_i2c_xfer_msg() and altr_i2c_isr().
>=20
> Signed-off-by: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
> ---
>  drivers/i2c/busses/i2c-altera.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-alt=
era.c
> index 20ef63820c77..3db7d77c5a1e 100644
> --- a/drivers/i2c/busses/i2c-altera.c
> +++ b/drivers/i2c/busses/i2c-altera.c
> @@ -70,6 +70,7 @@
>   * @isr_mask: cached copy of local ISR enables.
>   * @isr_status: cached copy of local ISR status.
>   * @lock: spinlock for IRQ synchronization.
> + * @mutex: mutex for IRQ thread.

I think the name 'mutex' is too unspecific. (Same goes for 'lock' above
which is not part of your patch, obviously.)

>   */
>  struct altr_i2c_dev {
>  	void __iomem *base;
> @@ -86,6 +87,7 @@ struct altr_i2c_dev {
>  	u32 isr_mask;
>  	u32 isr_status;
>  	spinlock_t lock;	/* IRQ synchronization */
> +	struct mutex mutex;
>  };

Has it been checked if we really need both, the spinlock and the mutex?
=46rom a glimpse, it looks like the spinlock became obsolete now.


--2xeD/fx0+7k8I/QN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6lRqYACgkQFA3kzBSg
KbYrxhAAsv46elvMYMWlR52N3GOWyFj0H7kATctv08Gaib99JR535Ub0XxSS1pil
k/fwUOir5x9G6X4wVQm6nKXlLDDZK5IBM+k4sQWofPfWCmn/JbJSZhjaQpHqdxiM
JMvuEX7X5XxRmCVwwcgsDEQdGUbf4XD3ogp1mZKQbU9X/WyKunIUyXvzNa5gfcZw
TBW8GmvyoANf9JvJRTUxrqg5pZvzMcV1/ktQ9xBHnWLrif1tpUR+En+cXE388Cn7
cqAZzyT0VpstsDYBBSe3CMuZYA2zZjvIQYAPKVogTwb3ZLtJUvbHCczYPAVuldA4
M5NJvWHmP9YCok+QN7e6FKf4fV36oD+Jj2u4gwa0wKkQtKbsDXYagswBqh6OI8Mz
LvAXI+Cq1uuxEN6E866ULVqwjVg19rD3ac874wRLhspr+anQ4l+cPP4bILi03Kaf
Fav3lalmHGSVr+ebUKjQrpPV8jWiWxwM9+acvmzymjabxiwcTU5sAdvI0XfeMR5h
bVdGI3YzxJU39lYA0CRVVLksVeqiW3GKv9vRSVim6VKVfyK8wdJ8wXQAAVn1GcVm
LiicbwypbNamJ4uPMrL8omsT7gQoK0tAZpUHgas16GOfyyUpvROatEcKqXAphasN
wLDpr3E+T/X6TfKeL9Zz5hURZxck2sldGwGsxZp/dhRgUumIsrc=
=bRL2
-----END PGP SIGNATURE-----

--2xeD/fx0+7k8I/QN--
