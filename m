Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5425777BCD1
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 17:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbjHNPRc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 11:17:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232648AbjHNPRC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 11:17:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 353A11726;
        Mon, 14 Aug 2023 08:16:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5B61363D27;
        Mon, 14 Aug 2023 15:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E311C433C7;
        Mon, 14 Aug 2023 15:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692026197;
        bh=DRzdPIKUmbGcvAzpJ59Jaz3VgU+um32k/6LTcjJ6FDI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P5LvcNE7N91sDfLj0zXRy9zX+HGhLvEe+yhLsN4PGJAJTHOLjiysAfzHtRRh46ZjP
         dNCF4mmYla2l/otHE4OdPM0xNzBOnXkxxBlkMXkF04Ql6Y3pktqBIpr3BhDtiIeTy4
         23y4n5Q9gKlUWzlcRo2WyX3GajD4QhKVh6cZeUASCvCOoTr2G+Qd+J7r+wJgGBkjYa
         cbBHzO1QvLnQRAU82h2ewJPdrJm07wn3TXWBVROeOL6sui3e26+B6Sp6aT8IJJVhAt
         0lQopZHlKp5YwABbKJJjYEhT8iMwfvmM2y+61+bldQJWcUfhmfqsnIMAdckEEZxjFT
         gUZy2SbRJvyaw==
Date:   Mon, 14 Aug 2023 17:16:31 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     florian.fainelli@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        yangyicong@hisilicon.com, aisheng.dong@nxp.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, kblaiech@nvidia.com,
        asmaa@nvidia.com, loic.poulain@linaro.org, rfoss@kernel.org,
        ardb@kernel.org, gcherian@marvell.com,
        Liao Chang <liaochang1@huawei.com>, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 0/9] Use dev_err_probe in i2c probe function
Message-ID: <ZNpFT18MJh2cyEZY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, florian.fainelli@broadcom.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, yangyicong@hisilicon.com,
        aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        kblaiech@nvidia.com, asmaa@nvidia.com, loic.poulain@linaro.org,
        rfoss@kernel.org, ardb@kernel.org, gcherian@marvell.com,
        Liao Chang <liaochang1@huawei.com>, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230808012954.1643834-1-liaochang1@huawei.com>
 <169165547667.2480436.2965071341321476080.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8+NiwAwBgQFDWghu"
Content-Disposition: inline
In-Reply-To: <169165547667.2480436.2965071341321476080.b4-ty@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8+NiwAwBgQFDWghu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 10:19:35AM +0200, Andi Shyti wrote:
> Hi
>=20
> On Tue, 08 Aug 2023 09:29:45 +0800, Liao Chang wrote:
> > Use the dev_err_probe function instead of dev_err in the probe function
> > so that the printed messge includes the return value and also handles
> > -EPROBE_DEFER nicely.
> >=20
> > NOTICE: dev_err_probe always print the second parameter that happens to
> > be the return value, hence the return errno will be removed from the
> > third parameter to avoid a redundant error message.
> >=20
> > [...]

Applied to for-next (via Andi's branch), thanks!


--8+NiwAwBgQFDWghu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaRU4ACgkQFA3kzBSg
KbbgbA//VfSSnUFBZKU7yYg8sAHg81guMfRmL9es0zCaT7kpvdl+MQjcMZPzm5+b
BUoxuyW4xnHiMYQtCuXTsUv5N5LC/XEw/qypExq10hQ5xeKk9TZnmYOdJaiCo6y0
dRjHGHaIkwObj1Y4NhdsOKFAb5LzD6K/MWn+0/79/qm4AzHGqcwL41xugowg2hH7
/WBrKKPtll/xdUGBU8yQzl/WpumtEXY1xZnxSRKfaMq3Pv0ow5lUb/7KT++qYys5
KGTP8XjfTv6s08wyZa+qZTQ3PLzkoyddXOgNiLvjdVbNMehXTwXW5vOXG4pTDxi5
sfP3i0JPBJg6e8vf4b69Qc8UWCihq+XF2wmLfRX7AJoI3XJERYBkslqb5xdHSieB
FP4ajNydI7aEOWfdJA7OwBcrW1p5/HXaHJlx35AAsfzR4G4IeCC3ixbmVJqU6/gv
3mIkwnujrYDBYtO5D22N41COi9F393CmKKfb6XsIJrLIqvhkaRZIiuMWRfngnmhA
1Pz7LvW7vjcRYv0US4fXgYkMtCNmvDgxPtMcFpuqc9wUywXk7MVzL95Kz8WmIDZb
AKFC7Fg8v+S7qtBNSyT9UdOwbUVRv2TImM9sCu7UvLSPBZyaqjeunesSSWYKSNVl
9vDeEIi9idvSQw9T40OxQFqf+af8HFZtoVQ1ofwzmln5Xth/jvo=
=+Bmf
-----END PGP SIGNATURE-----

--8+NiwAwBgQFDWghu--
