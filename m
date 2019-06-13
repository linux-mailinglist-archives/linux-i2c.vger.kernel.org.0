Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B495B446F6
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 18:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbfFMQz4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 12:55:56 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39977 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726649AbfFMQzt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jun 2019 12:55:49 -0400
Received: by mail-wm1-f66.google.com with SMTP id v19so10860533wmj.5
        for <linux-i2c@vger.kernel.org>; Thu, 13 Jun 2019 09:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tZfc8mLVEC5bncAZh469gPzADAprTnBYFSgwsbpCrH4=;
        b=HWQawKVZJizoW1IpZQF/gaiBF6NrVs0hc4Kdp7zzkRNXPnZPz00TD/0uPlojhEu5vY
         jld5u50cWw6rlANdh/fYoMG0XwK0b2H2LqMHppTvkYuqkLFtc6ZlS3NBgtkndKOJ+e6l
         ZIU7iTBF+9pjSox64BRr0z0+9iqMIcqpm6ZW3a7Q/coxBEVGsgLJ1/q9pxrTY+jMiCMD
         aJzqC1cln1qV5mzjK6b9eZA6GQMLlooLnby5Agmt7XPOQOZazAOgva/dcrmxQ64ltNJw
         Rp5z8Hjwjvd7/fVi8kgIdelXOiKYgc4163d9nFi1+V6MLN2CbxIBQRbgfaGB2pfj06Ag
         Se7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tZfc8mLVEC5bncAZh469gPzADAprTnBYFSgwsbpCrH4=;
        b=qtdtuIzayfpv1QP7vJm5AUHb5KTyaXWmh9xVISazHrA9dYXT2U/SevhmOrTW62Zg01
         HL3Xx14AKbW/5hCFNH9zw4u7eTSJe5WJ5YVueniy9OKN01r8CYsO++ztvxT09cTjOe7C
         /24dE0d3EIfuOhuQUtfBsLw0oZvfBHqIDbaAIa9ctCHJCeYHywLKILx6WUaB4VfpNEbV
         9exJdE4WgvKJJksnfu2NXONnXesLYlCmTtX0l7YZn7p29kbhOfP18eHpFMRTCSFmyImj
         wNP6Qvt6BV7R1lAX3B/WCFMVlGnUNjC7ct942iq5rxS0QqdXOB+lsqkAMiWEPsomW3ty
         fAUg==
X-Gm-Message-State: APjAAAWGCLU2FbQi7CkCiZkWOIpN5Itda26tmRZoMDKfIDX0dchEJ4t1
        eClq006hwjWS/o4z49Nqbsk=
X-Google-Smtp-Source: APXvYqyYV5XMHiQIzG1TjEpsoAy9FH7945wAp2WVY4Qf7Aa1PVs43yxIIRkzxgdLQ8xeTSRPo5wsbg==
X-Received: by 2002:a1c:f415:: with SMTP id z21mr4851530wma.34.1560444947405;
        Thu, 13 Jun 2019 09:55:47 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id a12sm101730wrr.70.2019.06.13.09.55.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 09:55:46 -0700 (PDT)
Date:   Thu, 13 Jun 2019 18:55:45 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v1 1/3] i2c: i801: Fix kernel crash in
 is_dell_system_with_lis3lv02d()
Message-ID: <20190613165545.h4a6oe3kzhqmmdcp@pali>
References: <20190613164529.63482-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ebten4q5y65dscgt"
Content-Disposition: inline
In-Reply-To: <20190613164529.63482-1-andriy.shevchenko@linux.intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ebten4q5y65dscgt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thursday 13 June 2019 19:45:27 Andy Shevchenko wrote:
> The commit
>=20
>   19b07cb4a187 ("i2c: i801: Register optional lis3lv02d I2C device on Del=
l machines")
>=20
> introduced a new check in order to enumerate some slave devices on Dell
> machines. Though, it brings a regression on machines where DMI vendor is =
not set.
>=20
>  BUG: kernel NULL pointer dereference, address: 0000000000000000
>  #PF: supervisor read access in kernel mode
>  #PF: error_code(0x0000) - not-present page
>  PGD 0 P4D 0
>  Oops: 0000 [#1] SMP PTI
>  CPU: 8 PID: 1 Comm: swapper/0 Not tainted 5.2.0-rc4-next-20190613+ #317
>  RIP: 0010:strcmp+0xc/0x20
>=20
> To fix this crash, check if vendor field is present before accessing to i=
t.
>=20
> Fixes: 19b07cb4a187 ("i2c: i801: Register optional lis3lv02d I2C device o=
n Dell machines")
> Cc: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> Cc: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 2d9f77ea02e4..694eb636b40b 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1180,7 +1180,7 @@ static bool is_dell_system_with_lis3lv02d(void)
>  	const char *vendor;
> =20
>  	vendor =3D dmi_get_system_info(DMI_SYS_VENDOR);
> -	if (strcmp(vendor, "Dell Inc.") !=3D 0)
> +	if (!vendor || strcmp(vendor, "Dell Inc."))
>  		return false;
> =20
>  	/*

Looks good, for all 3 patches you can add my
Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--ebten4q5y65dscgt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCXQKAAwAKCRCL8Mk9A+RD
UogkAJ9/nSu6qnCSn4A46XFM4qIuXEN9dwCfeB6dlBSQhp1/pGmoxHz0Yo4agbw=
=ySXW
-----END PGP SIGNATURE-----

--ebten4q5y65dscgt--
