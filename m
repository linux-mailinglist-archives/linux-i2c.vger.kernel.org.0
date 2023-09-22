Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1267AAEEB
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 11:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232783AbjIVJ55 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 05:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233017AbjIVJ5z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 05:57:55 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA47199
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 02:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=vphj
        gEX6222eYl7DnRcsf2dmTdiOspEmfCBqp7f5TDw=; b=BcI46jU2fa8p+mX/IcXJ
        3CXO6eLMPjnu61dpP8Y0y6XglMtytSwr0M/0StMMYYo5ECIeZGoinO+8m1tlEUk5
        fTWAr/jJDO8XtE/CSB6FxUCNpfb0wlCiDjS8G3KTf5k9fQ8UqSJCP1s+aWgeJCCw
        puLbpWcW5noLAJ7T4VIjD59MzYcR+nO99sOQqk4kZr3GgynxXsOz6iE0p/l8J04j
        3oKbbNzvuNB8wFLCtr4w4UGFazStTLswWG51VTly2jkBRdo/Mcp9/Km6RT0v4NzL
        1Gzuu5S/Tc0HwRLGp1ocLYi6f3k+DqcUsT+hHuVrAZsOKlSEuyFjaUIAfM2xMsLv
        UQ==
Received: (qmail 1349057 invoked from network); 22 Sep 2023 11:57:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Sep 2023 11:57:47 +0200
X-UD-Smtp-Session: l3s3148p1@lXcJpO8FbuQujntX
Date:   Fri, 22 Sep 2023 11:57:47 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Minjie Du <duminjie@vivo.com>, Andi Shyti <andi.shyti@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: gpio: remove error checks with debugfs
Message-ID: <ZQ1lG0iMfvcIqTI8@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, Minjie Du <duminjie@vivo.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230921084016.3434-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aYPCe3ixxaG2dlV8"
Content-Disposition: inline
In-Reply-To: <20230921084016.3434-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--aYPCe3ixxaG2dlV8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 10:40:15AM +0200, Wolfram Sang wrote:
> debugfs can handle error pointers in subsequent calls. So, remove the
> error checks as suggested by kerneldoc of this function.
>=20
> Reported-by: Minjie Du <duminjie@vivo.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--aYPCe3ixxaG2dlV8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUNZRsACgkQFA3kzBSg
KbaznBAAhtrZUHGmrRea3RLeMAXBJj1z7IDXEOPjYVwYozbWm04MXFEeIQfssQaY
Mi8QZGyeUojLIgqwHwA+hvqA8quUGi1DHzuu/A4NrIOFGB9tbKXLmxKujGdEyN+3
PRwW0kg7OTCmpJPlapsn36jf+dPzJmqRj5OH7kWR3dCOMPf24J7rixTbzBHCTOam
YC5PXnke3mfjH6ADeBSdH4ndQi1HYYWn8tsE43/NSx55sbaiwv3hLBxKntjQ5BjX
rEKhr8WsKM97iN4gTDBVfytp8L/u72XdUxOYhDVu9I3ZhwCL60PaUvyQUaZeNk8o
z5YJcNm5FcPWZ8nuj8lGrYT0l3pWMf7Rth9YrWSU74IesdU+DwG9p9UOwLiIHyyH
9bsS/8Ns0IkWRbH/WcA9mnODTDU0OshLACr0OFFM2A3R90h0VsWxZDT1lHKvIhP9
FrGtlKOatRks5YHFcKJTK/dz3X8cvqo663ZHycWuoNU0smcoCw5RE8r9Id+bBqoz
xXcIhfomoPlBMGVCX5yANPr7dOUvM3ed7bsQxoABN8Cl4zfH67MofSfYn2ecTQL2
czjySg1xon/+/CxgBXdcI/nQf5QiGUjhpNHOeK6yh3AeJW73YZ3lfkRdWyjvVs13
5Sc9TWP623KmVdpRpJ3TamPFmmNRR/bRzjUxEQb4h2yew5UJxOQ=
=Ied4
-----END PGP SIGNATURE-----

--aYPCe3ixxaG2dlV8--
