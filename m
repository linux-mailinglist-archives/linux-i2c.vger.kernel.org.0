Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 138BC727944
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jun 2023 09:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233258AbjFHHzp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jun 2023 03:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232417AbjFHHzn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jun 2023 03:55:43 -0400
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D67A810F8;
        Thu,  8 Jun 2023 00:55:42 -0700 (PDT)
Received: from localhost (120-123-142-46.pool.kielnet.net [46.142.123.120])
        by pokefinder.org (Postfix) with ESMTPSA id 1034DA40E46;
        Thu,  8 Jun 2023 09:47:41 +0200 (CEST)
Date:   Thu, 8 Jun 2023 09:47:37 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Kevin Hilman <khilman@kernel.org>,
        Sekhar Nori <nsekhar@ti.com>, kernel-janitors@vger.kernel.org
Subject: Re: [linux-i2c] Patch notification: DaVinci: 2 patches updated
Message-ID: <ZIGHmSvptAC0cWHD@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Kevin Hilman <khilman@kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        kernel-janitors@vger.kernel.org
References: <168613080300.11524.2783831689498520603@legolas.ozlabs.org>
 <8af5aca3-184f-2561-bec7-c4950fdbaeb5@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GQEOI8YnKp1/dR+r"
Content-Disposition: inline
In-Reply-To: <8af5aca3-184f-2561-bec7-c4950fdbaeb5@web.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GQEOI8YnKp1/dR+r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> May I know which changes superseded my update suggestions (from 2018-02-02) here?

http://patchwork.ozlabs.org/project/linux-i2c/patch/20230515175042.495377-2-afd@ti.com/


--GQEOI8YnKp1/dR+r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSBh5UACgkQFA3kzBSg
KbYg4RAArgl3g2yUy70as5mpUHMy7SnPZlKgpErhukuRmNJiobOBoJAAwpMDgtd6
q5A9gwE6FCnZQdwxGH1gCt54y/u8JY9uWEzZru1BeINmfzcqSTtXPRJUTGrFMiqD
72SMSLkmyj2b4euq1KO8mGY0bnrZSBPe+OlREvdl4nPloaHDqKnruPFSitw4d1fU
FtpAajG6QX1T09Ko+FSTPeBd2g8BVNAiFY2pXEfpkowYC9izoooIpC3GocCEBAs/
hMQ89EvVI30ZGEwmZbi/fYUjL2UucvR1mShRF0Inasg5RAXHBYNVD5ZcNFPhIywt
SFKKnoh5wTcpm/mWj8k+McCnHK1lI+CoYj9rfZonEUfA4aVoHcA6Jlzeog0qD0k3
7NPK/fN4wJeRGTmZPcyFgHKJLVid1OEisM+p6OwPN93UAwh1TrN9QK4WjQ+a6+XB
OGujU65OXgc5DHcU1LzhJTRaZ7HloughrP+C/90poPf6ifHgnb2MjS+sC252lBgt
KWwKvg3YibChdh7fig3bsg8rPaTlz3+4AL4lhAlmXSlhSf7ag1/oLYBXcWCQJMrv
WJCgZPqODrnuYkJca5H5LWRujqyL8iDcyIQScUgH673AnwzAUohyDxWzZdlUAjM8
XT7Q5XHZ5cdvtpYK8SScQGzzR286psKKPGTX+8pTkqUvgRXY/uw=
=Hfjf
-----END PGP SIGNATURE-----

--GQEOI8YnKp1/dR+r--
