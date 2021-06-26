Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89B5C3B4E13
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jun 2021 12:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhFZKeT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Jun 2021 06:34:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:50824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229556AbhFZKeS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 26 Jun 2021 06:34:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AC0961931;
        Sat, 26 Jun 2021 10:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624703516;
        bh=oidf+dnO3JeOCkZEe7ykQGbmQd+Jhf4t3Yufa3Pl3jc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j5+CyxbhquJd+IUyEY2XKYSugk72oljAuu1KtREMhm1vBwr5VPGqqbiqXAf815aCJ
         2WJbXHSp5WQWuRYaXJNMv1WdvL1mn6Mj75zv39syRXOcITzplkGRcTkpRxaOHzppmf
         okfpQdMFSykZ6UoI+Ws9HyZOpSZqt+1hgcsK83vxc0etxNvOxbcUW2n1/eIwPrAMel
         pGLlrALJqs2FSkja5I8RxwNLIQabxWIFevLKee5oi90of1CY911gHkpmncCLE6AucF
         6Utb9pqJKRykc6Zl648+9akMItzVavFdCXQjZNlid2+igcnOVpmHDolKCu3CSNXhfz
         bKKZKHk95x6HQ==
Date:   Sat, 26 Jun 2021 12:31:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjorn.ardo@axis.com>
Cc:     linux-i2c@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCH] i2c: slave-eeprom: add an of_match_table
Message-ID: <YNcCFxzGVkTQMs/x@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjorn.ardo@axis.com>,
        linux-i2c@vger.kernel.org, kernel@axis.com
References: <20210504135209.4757-1-bjorn.ardo@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="H/x6YAY0Ao66a1BU"
Content-Disposition: inline
In-Reply-To: <20210504135209.4757-1-bjorn.ardo@axis.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--H/x6YAY0Ao66a1BU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 04, 2021 at 03:52:09PM +0200, Bj=C3=B6rn Ard=C3=B6 wrote:
> This is needed since commit af503716ac14 ("i2c: core: report OF style
> module alias for devices registered via OF").
>=20
> Signed-off-by: Bj=C3=B6rn Ard=C3=B6 <bjorn.ardo@axis.com>

I'm afraid we need a YAML file, too. checkpatch says:

WARNING: DT compatible string "linux,slave-24c02" appears un-documented -- =
check ./Documentation/devicetree/bindings/


--H/x6YAY0Ao66a1BU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDXAhcACgkQFA3kzBSg
KbYkHw/+MKIWhsn5CuAlK5E7l0WXnmxRB6GvJZLTija7xCE4EWTBeemKlr3yqeCL
2h9Z+GSH5H5mikzzQ7bhNSsJbXC1+b3SlVn4qD8bQX0JPYMXvymh/YTK5KmjOzPw
n8rjEn6dRdyFC0CQV5XGwJp5qfMwe3Mp8EcnfnHK3PxQBFGJct2evzowmkFTBBu0
eBqttDtPxXk0yJSqMB/2+61WKhJqu6eULuwwbcN2XEi27N6ru7CtjiuuKBr+FH9B
Nc7jhmR59meG+FbydNWyXe+W2zpfh2C+pZdEgm5OWzJgd1LoTxwsXpLeXwUxsk1I
EdzS6/DzqaHE6CgOsdh1Mub+YMLdO7OWxpTZ7p5Jp9tr6DjCzoZgZH1d55T4O8GH
E/e7ckOg/H7rjWufko7ZO6uqEQCB3vOsPJ8ZBWIuBHG/RCe+AttGG5z163Cg0x3Z
sEwtetDqblC2ph6t7V01l9l0oGKAB121mo+IBb54yYS88DgdwhEvbT5Bxw8Fdlkg
/tFtEA9SNSpGh+57NiFdx1hsbLgydN3ZWGtlat6s8/YzC5xrke3EfMVSbOtw8J5R
qSBzT+AE5DJ+miMrs6Mr4YcPFHFpANxjVmgAjgvu3IHLu5ZCbQ9gYrFBgddj9kfG
xXHV9ySrT7QbZEC+6cw1hf/PvQYDmcb/wVA2wfhCEqCqje8BVgA=
=vqym
-----END PGP SIGNATURE-----

--H/x6YAY0Ao66a1BU--
