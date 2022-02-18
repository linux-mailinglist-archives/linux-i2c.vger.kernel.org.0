Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2D44BBA8C
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Feb 2022 15:22:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233216AbiBROWl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Feb 2022 09:22:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232114AbiBROWk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Feb 2022 09:22:40 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A2A1FA7B;
        Fri, 18 Feb 2022 06:22:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 593F461AA5;
        Fri, 18 Feb 2022 14:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016B8C340E9;
        Fri, 18 Feb 2022 14:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645194142;
        bh=w0WZYwLOiEuJNU7GAvFxF6BbgZOag6a6efQqp0DgTlE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JUfbr9jy9h7nHY7610UTWAaGIpXgbMGAXExtIo53fxN8B/HR8dQ3wYdOL+GNClRq9
         vHkZYv8FJdelua1OJ/3svZWzofM9Zoy5ktocNRKN/IMa4+EWAsbqlk7Rj893psb888
         dacEhbQePKjEhLDNguu59LIVmaopLewGwLfBQRXOeaxigJVjQtPEYA6jyX/0MEkN84
         dYelpXzZZCT2BSr1+P1wBSOOSamAICZ2E8HO44qV80Okfy4pUESJJVViPxMXGesV1s
         zroOzi7UhZPAy87iXkcdQnDknvFn5soanLFE1rlnCEU4D2NTmMb6wL0LT4Fo0zgDLB
         I8Nx4xjS/y4Rg==
Date:   Fri, 18 Feb 2022 15:22:19 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+0591ccf54ee05344e4eb@syzkaller.appspotmail.com
Subject: Re: [PATCH v1 1/1] i2c: robotfuzz-osif: Propagate parent device to
 I2C core
Message-ID: <Yg+rm+ZjuhT4zPWB@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Johan Hovold <johan@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+0591ccf54ee05344e4eb@syzkaller.appspotmail.com
References: <20220204151726.8924-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="recV/eJlF8BO4qDi"
Content-Disposition: inline
In-Reply-To: <20220204151726.8924-1-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--recV/eJlF8BO4qDi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	struct device *dev = &interface->dev;

This now creates a mixture of 'dev' and '&interface->dev'...

> +	priv->adapter.dev.parent = dev;

I propose to use &interface->dev here in this patch and convert to dev
in a later patch?


--recV/eJlF8BO4qDi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIPq5cACgkQFA3kzBSg
KbZc8hAAtJdAX75gOJ5ybcR/7FyoCoFu9eZvH1B4TwUazSnn8Dm5JRHeChb4jaad
xOQ1kC1hArvPzv1KY6B5kz1TTeZHREofwtqsTlpWjWUvFHo+/NR38+8ocSX/J5v1
9E19jsAR6b+hdxQydxcr9iASIS1//RKnPvbVcnpfrZFBM52o5CGy+T+MLcrQRCbm
f84knkQRD1DtsQajbj+RTLfd887eKx2N8aNqsV/JnqprDN6jsYXfcTbWvsvrLRGr
c9G1IqlT85VNeEm418TxWe6p1cdFyCNpohzru90yM8Qipz3tqnD/V2eYy7tDveL9
LKusa3AGch1NOJ7ol0Pn7LuKkt0MHiJoCJeHAMXi6RBTgbstL8fBtsM0O8IIcPIQ
qOEqCG29H1WDrm8caLhoWdo+bjHE3Bfx/DDtXiarbBQzD7GXTBWOYUaMKgS9Kyuv
GSpN+BZVupUzXHCopoagH7NM/eCHfYrLFC5qcUxZqxPV9jAI4RYNzkOfyrLPKIq4
o+A9y+i12auEDzhK5DbgEz4eMeImdtLO1/zX/4mLp/5DkzIhxNhI3J9lEZn0w4iR
PQJodOvyJSp3EA9TW8xGdJrSdxZfx6Tfbiu8BfoBsPe6GtAUbk2ZvxiagqdrpO0c
KurHyAXpiWI8HPCAfXyD0BJOEvflXK+yRxUTUXlsd/omqs6pAZo=
=3kUI
-----END PGP SIGNATURE-----

--recV/eJlF8BO4qDi--
