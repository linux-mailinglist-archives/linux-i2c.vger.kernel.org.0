Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D788667511C
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 10:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbjATJaX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 04:30:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231347AbjATJaV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 04:30:21 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E109A316C;
        Fri, 20 Jan 2023 01:29:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 44980CE26E0;
        Fri, 20 Jan 2023 09:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F75C433EF;
        Fri, 20 Jan 2023 09:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674206955;
        bh=brDlj3Fbi7upMkdhiJd32zzx8QN9gAkdfZZv5Lf1Gjo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W8j4vr4NyGHU0KDJCAMomXPRTzRsjAiZTqQWD6Pg/q4KJtPMNiiHpkTK+jnoLpOkN
         RSuOb4UKU0XMvTOBt9Y3e0k3Xzr6Ulmuu/QGAyRY5tO/J/BWT3pC8ogKmyyiA9t0t7
         93Ejw+NCYdBFUZcQZR8ublOTOx6Ok46g1ejvIP41mRxyAdRz392B6uQfrLS2RLa91d
         GMkrM7DuGoSoB9qgNpnU1gxWIiU2HbY4KcvyzmZtBcK1GFT5wdmcYRR4Q3z+Vpxd32
         aFhcLft3d+09gntu8uqh8Dkk0Bmir6ZVgLnCd8oJeWXO201CvuGPyOruleKDefPJir
         SsiFlCMoPqc/g==
Date:   Fri, 20 Jan 2023 10:29:12 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     ye.xingchen@zte.com.cn
Cc:     brendan.higgins@linux.dev, benh@kernel.crashing.org,
        joel@jms.id.au, andrew@aj.id.au, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: aspeed: Use devm_platform_get_and_ioremap_resource()
Message-ID: <Y8pe6PWZQ4TVHlqi@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, ye.xingchen@zte.com.cn,
        brendan.higgins@linux.dev, benh@kernel.crashing.org, joel@jms.id.au,
        andrew@aj.id.au, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <202301191715319948743@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7B4quZu9JV9hqI/T"
Content-Disposition: inline
In-Reply-To: <202301191715319948743@zte.com.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7B4quZu9JV9hqI/T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 05:15:31PM +0800, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
>=20
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>=20
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Applied to for-next, thanks!


--7B4quZu9JV9hqI/T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPKXugACgkQFA3kzBSg
KbbyJw//XiPV3HIZdzP6F3LPYW27GANPJVSQz0jiB9jz7JrumN/9nsWScOx8T15z
RtNzubE0tYP2sq8HxytaRfnjrw7g0paQQqm82vXGlqpCbMRduiZK3RDY3GCuMEuD
tgGMYR1wcY6gv7vYUcfR4eegbRaCaDG327a60lNI7ec2pgBT2sEWbwrmoDlXn9FL
putgoKAGFCoVXq3FgiyKcfNwb78K7EBRcWuIowhMMI1Jv/ZS0PWuWcSFa1UTLnoL
q41vgTgsCNJJBMIkp/ewXUK4r8DXdXN73nR7Ld8El6+su4RcRGSwEOJUiWjq6sxV
w9dy8E2Wrp3jgNvQV4jXFi17XKmos3ueH289nvUKRodwa7GWZLoGl1X+DQa8Ctg+
mqGcsDSs6VAnMHO34tVGHE1rZr2VogxXPO8PI2AddNRUO1Drko5reMPxezzM+LUN
u6oT5v/Siml9Nl4b6mzgGQF02BCuZT7sJp1xaA27a6mqPXqT6NaG8bNz6bZqWd4k
D6KbIRgO7oRgLY3HMXzmXHn/TQfAoEcMcCMjxCsNnCD2YnOzJLOOiJR8AjL0mH2H
IXAKFDh51pBhDPXWjSbzGpr0osZAPoF0jRgFa3NoFQtBu8eFTVkTctPKY4OUDM/7
wR56ThbF3BhDp5L0SuuZGO5vFK8fMQu9IxLX9D+uuzf7SZq15X0=
=AWQ7
-----END PGP SIGNATURE-----

--7B4quZu9JV9hqI/T--
