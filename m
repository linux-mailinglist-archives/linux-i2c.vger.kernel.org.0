Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEF776E1258
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 18:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjDMQdq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 12:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjDMQdq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 12:33:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C59A926BA;
        Thu, 13 Apr 2023 09:33:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6103763FE5;
        Thu, 13 Apr 2023 16:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E69C433EF;
        Thu, 13 Apr 2023 16:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681403623;
        bh=/Bux0X6rPJyUlWxJRs+XE116oEsnQQ9zIaaxo+qKnlo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Br6uw/IoKL9fzgy7md5eN2m7Cp6uXiot11VLwb/lLm2uYBHK40JjYzk6EfsScRDIl
         63H4VsxFAwzK2nnO8uTQysPS4boUv+sU3KPyHcJ8NXl4rUSSYCGa7ZBWQJnMEXsEwH
         JNwjjJTPBc/Qa1aMo/kmebDOjewQ1iUWT9b7JiXUyY7/9uD0TGNUDEXjH5K13XL8W+
         vICerruYQz+tLCPBOD8BGJygqr3ZrpbzHZ0OpVCMsrWEbyi3nxl77MBnrS3j/tDJSO
         jYqqZ5eiQcgzEB+QOQ88n+uvif9iZkHD52wJ9fyOc63Zi3B0aWfA+YgmdO3ap6RnJD
         Ry70NS9KAFJbQ==
Date:   Thu, 13 Apr 2023 18:33:39 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Federico Vaga <federico.vaga@cern.ch>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@ew.tq-group.com,
        Gregor Herburger <gregor.herburger@tq-group.com>
Subject: Re: [PATCH v2] i2c: ocores: generate stop condition after timeout in
 polling mode
Message-ID: <ZDgu45b/tN4On+8o@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
        Federico Vaga <federico.vaga@cern.ch>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
        Gregor Herburger <gregor.herburger@tq-group.com>
References: <20230413093737.15303-1-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y5zp1yi9Gcj7gXLr"
Content-Disposition: inline
In-Reply-To: <20230413093737.15303-1-matthias.schiffer@ew.tq-group.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--y5zp1yi9Gcj7gXLr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2023 at 11:37:37AM +0200, Matthias Schiffer wrote:
> From: Gregor Herburger <gregor.herburger@tq-group.com>
>=20
> In polling mode, no stop condition is generated after a timeout. This
> causes SCL to remain low and thereby block the bus. If this happens
> during a transfer it can cause slaves to misinterpret the subsequent
> transfer and return wrong values.
>=20
> To solve this, pass the ETIMEDOUT error up from ocores_process_polling()
> instead of setting STATE_ERROR directly. The caller is adjusted to call
> ocores_process_timeout() on error both in polling and in IRQ mode, which
> will set STATE_ERROR and generate a stop condition.
>=20
> Fixes: 69c8c0c0efa8 ("i2c: ocores: add polling interface")
> Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Applied to for-current, thanks everyone!


--y5zp1yi9Gcj7gXLr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQ4LuMACgkQFA3kzBSg
KbZMpA/5AdpLkRX/rjzS6kMU4oLlfJr7u0f9cI/LyMXSxS2BoRNr7raFFVybmVp1
onlRFYfpwRrx8QIFXY7nIPBytQHdEhK5Ns72Psbb82XBr9gNxw+BuxIwt+X6kCfS
sArTlXBhQpgiTHqb6M7/ORIDBYfCevxUYQ2GmhhUTX32gnQIqmwqk97CmgXTFvc0
1au5vglKU46tPk7tpzQzixoU9LJDvzUeny9QsEWweP3UyDNIzTRqXt4+rNlD5clg
GS4VaylPP1sX2XK53F3CkYGAg+8aJxgclll/xxLZfRVV8ZsW61yHyhjB+Bueo4f+
1CL70KWzc41VZv3DcBELAlQf/XPK1H5i3Wh2gyNzr7YR9mvkgFNNzk7e0+CM9GvM
pb0X+lLbPHlSzj6nDj5B6nKkvKYaeWb8uUy2atoNtcDE+4MyD3bWWag5Rv1HtV3k
bAOrWxbFfijmqh1U5XzQXAmcFKzRxbSDfAfdHK58hNBMGK7dRHuLnltFPeWeEZa0
usYCQd3TKaa8/X8vcOSBS3Y899WPB0/Cilgw5etjKyEF/casJewQofiIxdnnnprQ
+h8D009dpaAuFUyXqvDzSSFwMX7bvqz6Gf5V1rwUxwyrNUXgGpUEl76t1+N1GPSh
WrkuKO7BHpkidDy1xVIuJpjUjqt/VNLCbOtco4kA4FPT+QVK/Kw=
=nqC2
-----END PGP SIGNATURE-----

--y5zp1yi9Gcj7gXLr--
