Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 149CB4B6737
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 10:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235066AbiBOJOr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 04:14:47 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234763AbiBOJOr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 04:14:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3189825EB6;
        Tue, 15 Feb 2022 01:14:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C898BB817FF;
        Tue, 15 Feb 2022 09:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B75BC340EC;
        Tue, 15 Feb 2022 09:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644916475;
        bh=W2EKMWIHDO2D1je2siJexYza4c13DLLpm9bQgrNu3ds=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CxKyCm+ZtjsXZ4XQbvSa5Cn3MJo+uFVrchR6luTYHDvMfGX96UukhDCi+bFbkkpZw
         WMaezu2bhcP5OCnleQ8muUgdDkqN+G84mpLqM6wIlZiKMitSrGxK1TAnUlUweX7EGd
         yWlGew8GMq4dd8smbjcIRGau/o8TUE6My1LBqg/03ixb2ppCG5uct4r0EmpFYy+/MD
         IcNVXFmHWyX2CPs8EXuZEuEWWaCu84YqD76l34wyGekpeuDb7eXpSOlR3nxGAWFfeI
         twJT3MlN3Fo4wg5Nra3iNCv/IMJXEcVnJ684YlYoHZFwWRJORMInhju1DdlznuPxxi
         9STDKI/hnAGBA==
Date:   Tue, 15 Feb 2022 10:14:30 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: cadence: allow COMPILE_TEST
Message-ID: <Ygtu9oCmtqtS56TY@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220212194549.11021-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s4Hqu8FByQIFegwm"
Content-Disposition: inline
In-Reply-To: <20220212194549.11021-1-wsa@kernel.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--s4Hqu8FByQIFegwm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 12, 2022 at 08:45:48PM +0100, Wolfram Sang wrote:
> Driver builds fine with COMPILE_TEST. Enable it for wider test coverage
> and easier maintenance.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to for-current, thanks!


--s4Hqu8FByQIFegwm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmILbvYACgkQFA3kzBSg
Kbae+xAAsNo9gt8OvMN8IKKDnG/dBsFX4soZhM6gFl6J9XApb6XWUZfsLmFxqPw1
u2M/7QGotpxpgnSt23VH5SvEuYlPUvlFWL9bfdQkm5cklHg9OWbiB7mvctM+G3Np
nD+tkCAdHcghqtCZj8J9JgHkbINIhxPQwGcqeGrPPD3lbX11nQlXHj4IvDjytJky
Cw40kymaH7/Qqd0hQaSTHok6/rIdFS3udSN+00WeGimiSEoytlG61v7GKJNqmaik
GYikffgPtmPzw/kwTxEyVlZGa19SYkmf7D+3zJeN4Fui9CI2KdrmcimYAWa1gdyb
efBU234d5B/yquMOox8v9N2gqyAJiqznscJjO2xahecvneEuixRVlPZULqgTCjcU
n0DciNewd2/WcvQizf8Ww7bp9u0Z3n+VYGO7GwDuoA3f3hVM7vvAFJdSobMU5alh
T8UXJhGBUzpxfPnM4AGrf7oAo1VUNaHe6fbOgEirfhk4hdbGeCBRTZunz3he+BFl
q4HAQVa4Lp9aHYpI1EmBsQlV72vNPlA1+8sOhQxP62JT1MC4yK4ffKu4qEQw6XJ8
Nu5lMYXw8E6ADbhpE0nKxwTo79fMqIhU73s72S81MCmofVB7RGF7+KmS1BLimue5
8GMYoShw2hnTaWsYt2bfsvpjktOgyWPoXNGQvUZq6UwMoN1tyZg=
=WvF9
-----END PGP SIGNATURE-----

--s4Hqu8FByQIFegwm--
