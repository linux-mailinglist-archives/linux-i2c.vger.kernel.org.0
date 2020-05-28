Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E861E6716
	for <lists+linux-i2c@lfdr.de>; Thu, 28 May 2020 18:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404789AbgE1QIR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 May 2020 12:08:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:50182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404688AbgE1QIQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 May 2020 12:08:16 -0400
Received: from localhost (p5486c949.dip0.t-ipconnect.de [84.134.201.73])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4BC92071A
        for <linux-i2c@vger.kernel.org>; Thu, 28 May 2020 16:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590682096;
        bh=2G0phemWVhI/eVN83UK2rLXzZbbYOT4yQHHITI3UTLM=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=gkCmvZ3E1XUEO2ZrEQ0Tay5cG7YBMPkLKXG9VcWO4E4VLztKZHHYYb8cCXpVs+Hb0
         RUKDg1bqnaZGf7SUVpHXl+pdkvce04eVSM+tc8yAMxVYooP2j9rQSCsW6ssXMRPKb9
         HsiXY+CHqcgB0V5SPyh9Y0RpGwpK0KHXhNpc7N8k=
Date:   Thu, 28 May 2020 18:08:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: avoid confusing naming in header
Message-ID: <20200528160813.GD2875@ninjato>
References: <20200525120504.23338-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HWvPVVuAAfuRc6SZ"
Content-Disposition: inline
In-Reply-To: <20200525120504.23338-1-wsa@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HWvPVVuAAfuRc6SZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2020 at 02:05:04PM +0200, Wolfram Sang wrote:
> i2c_client pointers are usually named 'client'. Use it here to get rid
> of the ambiguity of 'dev->dev'.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to for-next, thanks!


--HWvPVVuAAfuRc6SZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7P4e0ACgkQFA3kzBSg
Kbbg0g//TjlOWhRsj7xhTH3Zb6xm88IjaArC5IL6Rm5KfzVUD44GC4CkKD6mk9Nu
PBzJDYaFQDo3pMIOGXbJ+Bn9thL7GRV/dXlV6e2cAVMcQV3xb6WBCjbI7j8lekV3
/x3U+jKETbIyB3DR2REig1DMZxkH1ULTUuSojPFPxnFzgFWhrOILfr91uqYXcsuw
JZi+wMA8rWpVyJcnZNYGxZvdDFJ4DQWuo3dTpSdwn1nGSb0wN9EyQn1eYT9QQOtq
hQFZpP1xMkT7oHM4TiQXbwrNyCMEVJGqEKn90DkMoldgRY2Vt7JCUnasFpcSn6Dp
cJ8meWDxElKJ8jBdSdmZli4FHAoQXUfFyZsprfqYBP4mUwmQt0THF3gHx1xMGaxO
lWEwvZdTohjkWVODRvqK7YNCuyIVKbvy5eHaDpcwnL8vdKayWafuvJckz533n5Zd
R6HaeRts095DtOJXml35A4+9Ck0tmLsW7QrrNlg2O4bpqo7dzTXH9DQ578Sgz9Js
A7Zt5PLYeluKEoF2bxTJ/2K4FmjoI7Eh2xu6EkX9bG7HlerKw8lzmc+XOuaIzWMX
rZ7OOThcTqQ/O2Q+TxFE10Kefvverhsj6Q7zhtaV1Q08AtSlLQgez7czt40+/QRO
aI/DfRzfRCtRN2ylIs1T4TGeBPslLtieou5VWCGWoaX0yQ+zArs=
=02K0
-----END PGP SIGNATURE-----

--HWvPVVuAAfuRc6SZ--
