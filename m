Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61DB1729E77
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jun 2023 17:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbjFIP2F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Jun 2023 11:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231916AbjFIP2E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Jun 2023 11:28:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 270D119B
        for <linux-i2c@vger.kernel.org>; Fri,  9 Jun 2023 08:28:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AEE7365909
        for <linux-i2c@vger.kernel.org>; Fri,  9 Jun 2023 15:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863F9C4339B;
        Fri,  9 Jun 2023 15:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686324483;
        bh=fz1Y84OA0JK1CsGKTJV9REGGfyaryfzhK5y38WrKrns=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E9g6KydCJi9jcfzqgRVRrm9SeZ2lorLZbCLe0uufHaCcW9bxJNq77FJKir5coAGk/
         WuanJiFXhxaSh+JIQiemuhztQkoEh/MxP2ZFVlcmuG8YNX5hv/k/uHLWaU7hs/atY2
         5Cid+Tk8OCx1r32au0xhq2GgcMz3L5iOrgjQjI6htKMOHzVEycP/i7Kzd2lrTYn84D
         41IVuL+R2Lf1aPzHD2+GRufUSIsQWAE4HHw8naHYXm72x15UlB+JFfLcXsJrxALlWX
         jzREvpC3oVVD5yT/PMwcvSmSY/AgPz+pdklAgf+dyYKKR+6C+DrK0kIz8MmlmgEZBl
         4xEaufAENUG+g==
Date:   Fri, 9 Jun 2023 17:27:59 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: imx-lpi2c: Don't open-code DIV_ROUND_UP
Message-ID: <ZINE/42q5HXJYbXa@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230601132532.2749426-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7BWOdHdHqnat6unt"
Content-Disposition: inline
In-Reply-To: <20230601132532.2749426-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7BWOdHdHqnat6unt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 01, 2023 at 03:25:32PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> There is no change in the generated code (tested on an ARCH=3Darm
> allmodconfig build).
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to for-next, thanks!


--7BWOdHdHqnat6unt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSDRP8ACgkQFA3kzBSg
KbZ8BhAAglSA5LQ+VHOKYbALlSjxPmBukgGT3+YCX0u9z/gU0wtzHxnK+Hn4eWFW
BPFd9k31OqMW7UfxRZKjwbRpN/Cv5UwiHPF39EvEBinXDfDfXwSekYzZm28DloCr
IRSW+4b94KxzqsxKo7hJ4ERUOAn8XSEvnrOOE3jdnO2wY6LMyH3y0LQExQBVrrGA
cUXORDz8/YcBIOBXHja/Zzo5WT2PcoFHJPQuGB2duj9o6oyWZjt7Vyu+ID/7lC5h
fka2mKGUWRg4FZHiO3E2N1V3zJUFMGGorbTMfB1+iBfO3FWvgZfEmLgYfpaA8Qh1
lJfaWHq2L0mOWShHVLZ22+X0aIjsEzzo97WNuvcSrBgTXaUsKN3QRZ4x2CrpQSPr
LmEaypf+um9be1lyDZ7wO5cjoEbvImYN5dPNV/mx2wbbsOnr1GDGdAu0tie3Sh3w
Ine3Bhp0+wb2vNCfmB6+b7nXrQyNIiOa9HPcCGjX8Klly3+DPp2IljHh7568lkfG
RMiB7C37uImerl5ZUSPvQAMs69H64wJPQnEkAz9/S7w8w2OUV3jS5Z9fWx0cY5fU
CDKqauOYqgDxEgKWTSvaarHXIjifM371VH2TVUrMI3nmMlCRN9Qq9gmUuRPhCGUD
psNcIcdzYHdu2pibT7dDQRAb8IZCypHBr6r00vqSMMhNDA7BwFQ=
=USLh
-----END PGP SIGNATURE-----

--7BWOdHdHqnat6unt--
