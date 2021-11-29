Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5A45461FCD
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 20:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237844AbhK2TGf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 14:06:35 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:35070 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237628AbhK2TEf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 14:04:35 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id C209CCE13DE;
        Mon, 29 Nov 2021 19:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4C0C53FC7;
        Mon, 29 Nov 2021 19:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638212474;
        bh=LI3uzx9vdel0e6nDIT5a2zojnOZrdhJyAQH/EOVBkBo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f9kRWRULFdRNQwBgjwjcmLGKTulxrL6R4TnNzp3rrqnzJkuvvggCmX/TivIMm+fIG
         5HUOOku7tuIE6tH+sCn2lnMFbInLJi88KRMITuroKGq2LNq9O7nB8sD9DGuuRrLy2W
         ys0qx3uF1Of8yqOG0Clst6rMzFxrdcUCSLsU37NJpwd0XfJS8rn4uWtkf48nAwa4M2
         bvJEBfQRAPRNDekzfKXc05WWrF5NGxE+qxGQRIZDepONRlbJD7p1Kqx8YBvQfbLOYt
         hMYhWVTk8ptNweh3hyhBaG5PC3V6bUow93p/x90doNiYMQFG2txwBNlpKKVDunHqxR
         BJlKgwkyDqdzg==
Date:   Mon, 29 Nov 2021 20:01:11 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Richard Laing <richard.laing@alliedtelesis.co.nz>
Subject: Re: [PATCH v3] i2c: bcm-iproc: Add i2c recovery support
Message-ID: <YaUjd747t94Ge/VA@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Richard Laing <richard.laing@alliedtelesis.co.nz>
References: <20210603052515.11178-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KsO1SrJz6NmBFB0C"
Content-Disposition: inline
In-Reply-To: <20210603052515.11178-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KsO1SrJz6NmBFB0C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chris,

sorry for the long delay.

All looks good except for this:

> @@ -806,6 +954,7 @@ static int bcm_iproc_i2c_xfer_wait(struct bcm_iproc_i=
2c_dev *iproc_i2c,
>  		/* flush both TX/RX FIFOs */
>  		val =3D BIT(M_FIFO_RX_FLUSH_SHIFT) | BIT(M_FIFO_TX_FLUSH_SHIFT);
>  		iproc_i2c_wr_reg(iproc_i2c, M_FIFO_CTRL_OFFSET, val);
> +		iproc_i2c_lockup_recover(iproc_i2c);
>  		return -ETIMEDOUT;
>  	}
> =20
> @@ -814,6 +963,7 @@ static int bcm_iproc_i2c_xfer_wait(struct bcm_iproc_i=
2c_dev *iproc_i2c,
>  		/* flush both TX/RX FIFOs */
>  		val =3D BIT(M_FIFO_RX_FLUSH_SHIFT) | BIT(M_FIFO_TX_FLUSH_SHIFT);
>  		iproc_i2c_wr_reg(iproc_i2c, M_FIFO_CTRL_OFFSET, val);
> +		iproc_i2c_lockup_recover(iproc_i2c);
>  		return ret;
>  	}

I2C specs suggest recovery at the beginning of a transfer when SDA is
detected low. Not at the end of a transfer.

Happy hacking,

   Wolfram


--KsO1SrJz6NmBFB0C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGlI3EACgkQFA3kzBSg
KbbDzQ//cwibsOuDJHpe5xXhY+J5NHxJ10LpS8bcVXHwhuwxf3WiyiNgFxpymoJi
UU2t/vIsS13UMGbRI2sDino8dIURnQC2a0p59FlCQUMeYXKef7uPew+idxKHvqV6
t5gP5ihKCZvEa8y9037qe/635eW4+TkwWV9srgPxG61cRNogG8oIIyNwqbyUfqZC
2dkwVC7liLDINxWUEmQdHh6uzwtEklvUYBnJgvwf5kkKyiaFHehP8vrb3yvJKhhz
eZPdPZWHKV1Mw1wzYmZulqyG/Ic4fDwmSCmL0fPZXVumypA5tqFj89NYQMJ9u4h9
2nZDtZC3pMts9XHVJrJfpkQu1ZOQ3GUyrixhWtpMyUx5dw7Fw4Olg+CBxlwwSoE4
odx7BuqK3e5A21QMWqyhe/+HPosYOCbesXumJyu9BcAuG6ztOW027nOhCuY+I8yS
WLYwjE0IKCtEiHI9AhUCIDFxRUC1serwSo9L+EYZ0uQHUsbGixcCNz528QTykl51
W18kqGABzlhm5+jov/BPft7daHafdjBpdGO3HUb+EHxSqgZJrRZBKbIdGZO9o0sv
14EZr1oXCQMiSCNJ5bBoMdcXU7f93inX9TMjTvoQ10DNReopMZKVpwrTVZ2XXwxA
0F6RzcWwSeOThH/HYgjeTMPkl8SyBTtep8KbMhbOS5wiDPMxOYM=
=qV9d
-----END PGP SIGNATURE-----

--KsO1SrJz6NmBFB0C--
