Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503A048621B
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jan 2022 10:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233813AbiAFJ3N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jan 2022 04:29:13 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:52012 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237380AbiAFJ3M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jan 2022 04:29:12 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0D3C661AC2
        for <linux-i2c@vger.kernel.org>; Thu,  6 Jan 2022 09:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96BCC36AEB;
        Thu,  6 Jan 2022 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641461351;
        bh=sFkWcJ+pgWcCd34k/SgKqT6L+iE9l9xET5me3NI3n50=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ttf2RRlossLF7mtUyscACUEPFaeH8SAyw3Qd+BZfDuEOor9GID76T4x9dk1FLefx/
         W6ykBtY9GfWYUte8ZBj+KRaw5CbGahDivf+gethodd9FNvjcL50E1NIloa6EwLIF3X
         aOEIqD1iZq1EA9Nl5RHE2oRF0Tm3Dmf8dMb5/38dj/7pWaauhXMmt/DGcaGk0s7Hbz
         lissSKej2hQVxqzNU0IlQKFQCzHeggSUfrPikCou8/pc9aFJMAWmxT7D+yfx4F92Xw
         iDCRN2/OvmQRWxgz3DNv+s+U/mAU/o4tOABlnOot9YOhJloBJK7yp8BkqgdSI2Fe/6
         sovyv0EPY2PpA==
Date:   Thu, 6 Jan 2022 10:29:08 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Konstantin Kharlamov <hi-angel@yandex.ru>
Cc:     linux-i2c@vger.kernel.org, bibby.hsieh@mediatek.com,
        amd-gfx@lists.freedesktop.org
Subject: Re: Bug: amdgpu stutter and spam `Fence fallback timer expired`
 after suspend
Message-ID: <Yda2ZKhvclIxbrad@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Konstantin Kharlamov <hi-angel@yandex.ru>,
        linux-i2c@vger.kernel.org, bibby.hsieh@mediatek.com,
        amd-gfx@lists.freedesktop.org
References: <7143a7147978f4104171072d9f5225d2ce355ec1.camel@yandex.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l9suco8s8577Jsb/"
Content-Disposition: inline
In-Reply-To: <7143a7147978f4104171072d9f5225d2ce355ec1.camel@yandex.ru>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--l9suco8s8577Jsb/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Should I send a revert, or is there a way to fix this?

You are the second one to report this problem and so far, there has been
no response from the authors. I will prepare a revert and CC all
involved people. Thank you for the nagging!


--l9suco8s8577Jsb/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHWtmAACgkQFA3kzBSg
Kba7qxAAkUtqMhuL7R1RN4uGF+PewfyGLRSLbv7Js+pTSOPJuRrH1wwNX/EH+0EL
Go/DtB4v2368248mVOpj9Ck7DUygUfCzdhc3CbV6TFG+8ouaBdI4KN/vnYOTTRHU
NFhbuymrHbAaMmts3qQA5P18mTVYJFJnTPMYE7uKqnjU9tzDXxDeC7RS8Np9Eb23
sA67mZh9sQe90lXpguHWAqf/YYiSp4iKMHEUsRUQvVgC0NWVVw5ZQamHE9uYrIE5
xI0RaCxC7BsBEaXx101Fjmv5vRRNt4MhJDJpyjB/U3XzysHLFY8vNxIvasND7cWA
vTZuAJqZolEpWA//2ibimkByGtVjeZLpOYBoVhcws34iSHJsYwXOkpY5OC9Z+fk3
o6WHEm6g2nd1fd8YlFf2z7d4d2IPc04wpsFmyfK/j6+EqT4SagqvKC6tGDeFHayB
jWav3ihR3CfGngPqUYxCaRnCmrZ1H8UjlXOY2LqiW+9Uc0DoXq/ZzcSoirBG/iir
AzxcYRKpCS4h5jVzDU0FFKgEA8OswdYQPOFtmnw2K1hERTT6x4yJ8AIIAYOw0/Qq
YUmlAqcNFcIkX9oTa50iV72d+RlCRs0bLIhkI/DpCbkKdo3WCxbqV6dzgAL2n7Eo
5hjgWq8sf70QZsd09ckt6BCWs1/DFMiQ2xZ/bmTl7rose+6hghU=
=nJls
-----END PGP SIGNATURE-----

--l9suco8s8577Jsb/--
