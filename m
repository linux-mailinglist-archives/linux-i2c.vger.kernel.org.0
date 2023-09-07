Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 153BB797A68
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Sep 2023 19:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238383AbjIGRjo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Sep 2023 13:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245256AbjIGRjR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Sep 2023 13:39:17 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18CC2119
        for <linux-i2c@vger.kernel.org>; Thu,  7 Sep 2023 10:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=8xxZ
        uv9GIrANFMsofrRh7CURyjPBHHbgRzgxc3GM/Mw=; b=lJReuQhuYKROiru/8mub
        F9bLEuskgD+9MQaNut49LhvUKC7nAJMyv4Apzt7csqEC7wz4Qm8fTtMtwDG2ar0z
        HzqOXHtUayp8rfUyF0HrngVHnHU9DL9/IoiPPlosPkjvgWBHQqvHeDPpHUwqOJ83
        e03YtZ/DnnqYzVqrf7Brdh/lwHSj3QnPTmJM1rzM+SPxXec8fp7cAHA05HT4xBx3
        Q78De/smmG71LG0Sj5NgqBEfcPGFxJj4kYLhuhK1bI+YFadUfAum1vJnEjMCVr5/
        rxRBJM72U+aO3NWn/nO1dziOzhKwCuuznepauN8C7hv3JGdtVwHBDvMitZh5LZfX
        ng==
Received: (qmail 3140429 invoked from network); 7 Sep 2023 14:11:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Sep 2023 14:11:34 +0200
X-UD-Smtp-Session: l3s3148p1@EzXSwsMEuuRehhtN
Date:   Thu, 7 Sep 2023 14:11:33 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: rcar: add FastMode+ support
Message-ID: <ZPm99Y5E74EuxsFE@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
 <20230904135852.12146-4-wsa+renesas@sang-engineering.com>
 <20230905213710.3dv5h6zvwu4tpnby@zenone.zhora.eu>
 <ZPgl4eLYTyDFXiyC@shikoro>
 <CAMuHMdV3Ka9fh6fmyYj7j5xdm3LEYsMjgXDk90be3AC7gDFozA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9MkUAISzK4XZcD10"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV3Ka9fh6fmyYj7j5xdm3LEYsMjgXDk90be3AC7gDFozA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9MkUAISzK4XZcD10
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This may become clearer if you first introduce support for ICCCR2
> on R-Car Gen3 and later, to improve i2c rate accuracy, and add
> support for FM+ in a separate patch?

That's my plan for the next revision of this series.


--9MkUAISzK4XZcD10
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmT5vfUACgkQFA3kzBSg
KbYRfA/+NTkiIKWLTfK6Gz1R29urm5cSKMa4CezvU5xnQ3kfwlgwAcEVnPE+tyu5
t754lAuS63fWoQuHe57166GozM0CnN36hBKpM58cfitb7whYTn2XS2JSe8dnTMHL
PJQo264BRYj8a2Bw//97AL6tmy5S0GTKojjiRMK5Pv0oeBG28xip7N6sR1ObUETS
L4gO4ynLPqx0HKKPiYMcYN4dEoVNsryaC3C9+aAFtsL6l7id09A1z2hKya/gs/dY
siv1ZfaoIro1JFRU/vvZGQzHpMe8pjdmsatKj7fjaaDx+nDqJLTl1axUFdwLv8WQ
Wff0wqAUroxNS3cLUUh+RQ0cDFyKzBTTBWs1z8XpCVWD003VUk/eWcz/gdcIwTdr
jqCDMITxxd5V4fqPKLOzjotipN7B1BoJuCm/fgqT4kMB/ChRhfuoL+Ysp5PhWYCT
SN2PbN+Hl75BawtanIpaiErtRuu+o6vjc8QT5ZYAeKzQYLhzCIAQy09LJRhqvoSn
KrgVmI4ZzCC4Xg1HDc0dfw7rfmhtAlct1o0oEd9Z1xhgT0VZnZKwmBKzG+uwi4ws
aSDy+tN0FYC6+x7/bcXDxYMDpoO16JedJtq7u1eimC5vs0fzJ/angJXm7Bb0TUBl
WvjpfzQzzCChvwDQP+qE3J6snrX9MT3SUMgm1pCi5uENapIlDOc=
=bSsp
-----END PGP SIGNATURE-----

--9MkUAISzK4XZcD10--
