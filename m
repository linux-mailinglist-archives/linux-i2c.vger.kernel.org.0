Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0039757F3BA
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Jul 2022 09:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238411AbiGXHau (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 24 Jul 2022 03:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234930AbiGXHas (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 24 Jul 2022 03:30:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18CD15FCF;
        Sun, 24 Jul 2022 00:30:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D28B4B80D2D;
        Sun, 24 Jul 2022 07:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD39C341C0;
        Sun, 24 Jul 2022 07:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658647845;
        bh=9KrIL4JIVhAeYY7DitjagINlLfWWPK4HLr+UJatCfpU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L0yuhuv10mSuOIefwVKEmhL0LhbibMr1zRwQYfYDTBpxWpxvU+Dbi3T89amolmWAg
         hG0jCdfEAe5ZkBMl3OCoXpI71ZSy8QtdbJ1wMvWpmkql62H4/js99mk2hV1J4t3b+7
         EihECu/WWmZ5WGZ6J1KoIEdHRw08+Eg3A6JUG/TWXOJmopPPCFxKOoip1rCIVThQ+A
         etbY6IYV7/s99afC31nGzrx6U2h+K7/S+ss46fLEIpSNqoX2hi7fUGP+8/V+2t99wg
         neFs5ojQ+numug9uGGaBIxqWLDG/3NyTvdnE9V75qDAHtCyuLDejVIBEcIivgMLTZF
         BpHhpXBJPhLKg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oFW4j-0007LX-B8; Sun, 24 Jul 2022 09:30:53 +0200
Date:   Sun, 24 Jul 2022 09:30:53 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: qcom-geni: Use the correct return value
Message-ID: <Ytz1LUSwyZ/8LiN6@hovoldconsulting.com>
References: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
 <20220717035027.2135106-2-bjorn.andersson@linaro.org>
 <YtzSzKmakEWe1usg@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SCcni7T232IeqbHy"
Content-Disposition: inline
In-Reply-To: <YtzSzKmakEWe1usg@shikoro>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SCcni7T232IeqbHy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 24, 2022 at 07:04:12AM +0200, Wolfram Sang wrote:
>=20
> > -	return num;
> > +	return ret;
>=20
> Not quite. Kdoc describes the retval in i2c_transfer.
>=20
> 2136  * i2c_transfer - execute a single or combined I2C message
> 2137  * @adap: Handle to I2C bus
> 2138  * @msgs: One or more messages to execute before STOP is issued to
> 2139  *      terminate the operation; each message begins with a START.
> 2140  * @num: Number of messages to be executed.
> 2141  *
> 2142  * Returns negative errno, else the number of messages executed.

And this is exactly what the driver is returning after this fix.

Note that ret above is assigned based on the return value from two
helper functions that return either a negative errno or the number
messages executed.

So I believe this patch is still needed to fix the error handling.

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Johan

--SCcni7T232IeqbHy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCYtz1KAAKCRALxc3C7H1l
CBHVAP0UEiURyG3ZhQ8PSe/GPPDFlqH+xvSr8mdxxD4xF88HgAEA8ZIUri/6FFa+
4us9bAiitlXLdlyS7lHfWeAQhBmemQc=
=wjOq
-----END PGP SIGNATURE-----

--SCcni7T232IeqbHy--
