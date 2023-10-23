Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41C597D3ACB
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 17:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233097AbjJWPam (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 11:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233111AbjJWPaj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 11:30:39 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096A9DF
        for <linux-i2c@vger.kernel.org>; Mon, 23 Oct 2023 08:30:36 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272F7C433C8;
        Mon, 23 Oct 2023 15:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698075036;
        bh=XyfpdNDvubt7VnnaXaRUy+Y4CWfWOk0Uoqeb8DZcKAY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gMtX+RDbLzf9amlshj8uImbXVbci8/MOSeMTPy8C+toSYFujYjuN1s6pwzUycf9fD
         JKLgvfUtMSSq1B7w0hq5D7fCBWxGpg5x0eEFKMC52bXFoLoolosr7emZJh9pNqdWIN
         GUTklx4atYETgBeoFF+vENkaDYnSHNtXKoCJARjJ+g4t9/rgb1g0+o5J2cvEY+8qXd
         6N11u6TeiRf1phH9Ehae2MeeqJ2aQg4VBx+uxzqhyNrJsNcHfQ4UN3eOveAsCIrDyB
         zLL0ej7i7hDZUIDCdIdVLJz83dpfgE0G2cJUxcBW7W2kfoBcXckF2UmG8uqkLtNg3r
         A+Y5hj8CeP8Eg==
Date:   Mon, 23 Oct 2023 17:30:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH 12/15] i2c: busses: stm32f7: Use devm_clk_get_enabled()
Message-ID: <ZTaRmeCYE+9hoSG4@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-13-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WpXSZ0mZsGZEZcbN"
Content-Disposition: inline
In-Reply-To: <20230611225702.891856-13-andi.shyti@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WpXSZ0mZsGZEZcbN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 12:56:59AM +0200, Andi Shyti wrote:
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
>=20
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>

Applied to for-next, thanks!


--WpXSZ0mZsGZEZcbN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU2kZkACgkQFA3kzBSg
KbYTJw/5AXItbjVZFtPdZekNyHCYqdOGhKeC/bxRkdiSvoj3luddsTQilR93huGq
+MHl2hhf0Ry10y1IXhcWkozK2Srb3t6VWGBAo/eFcue6pkh6MF5B1L33ELFZPnNG
0Xje/fnKzmImKxO6dxriJ5MrHZ7UGaXpcKojQz9WpQ2tunatUFP1R9ukIN5X73n5
6tgLeO77gwYLzNvr/nskduUwmj9W3e7CcMABidIgDJJtSkKYyFOW5y/afD794QvJ
p0biylXFAaI/n4N4sGtqGFc+7dhqLpiQjrhWo6Qp0NjnN8gJ3tmvUuamngrrD0JH
RLVjf1Aai4w3gfay0QUrWlQ+qiea+IXiVu4kuGCiZaJ2PrYYfvs2XtYquoM1/Qku
e4UEsjrZFVqiNP/HBkV46oW6BLus7os8hCYNyYAd9b+nDgSyYXmBBmRvcsuDsZ1k
R5gHo9krng2DSQoSEFLdl0BwX+e1sDRFY+2DBSPgDi2J8oBt6xMEDp/n2KHeEdGr
hha8kKmJ449y3lt+alV0FZGQL28DlPWOf6QzOtjF3EHnIN8VfX0/FXKHYv00FARS
oxt8IghNn223k9oVxfD5UtUcTd/YnGCDzetqjK9Wq/Zv7YkLMBZRoj63pAwTXYj0
Xc1VoOA1MKzsnic9pMMCH+k36Jcdj4hmV02G68HKd9AvM9qMEIA=
=0jLW
-----END PGP SIGNATURE-----

--WpXSZ0mZsGZEZcbN--
