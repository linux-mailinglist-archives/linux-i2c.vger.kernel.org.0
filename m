Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9E337A5D81
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 11:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbjISJMl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 05:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbjISJMk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 05:12:40 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6228EC
        for <linux-i2c@vger.kernel.org>; Tue, 19 Sep 2023 02:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=RKXt
        s6deaO9CdcHd7aM42mZ7IZ1W71Utj+B7fp71q3I=; b=BfXajjsgMud/Jc+y33Pu
        8HZ8hElta5M7cY7wZ8wV0+CK08ybKKkgEE//TlN7MJOkTVrhtozMxdtYW1Tz5/i+
        53KK48sAxcqU/MvFIuyILYYe77lKn0uaOwCkpABhWs5iUv6o/NOkEK+f5vkkLOsA
        pjPQjWyaEfEM8V5ItXnL5PEeMMDb+XSz+2GEXzDpxuFXLbHIA+mxSOSA+/EWeraU
        cPkLOJG6nE71TEG+yu7PBoQJPZUwcpfgyWl0F3ZOZyTwUFxbequjEW/N1nsMoFco
        G4Sd99pKNS7oguuXqDSQdc5srn5aPOLlZFr8w+XqfHcZNp1XjKkyFlo8SZxF/rXt
        7A==
Received: (qmail 156313 invoked from network); 19 Sep 2023 11:12:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Sep 2023 11:12:30 +0200
X-UD-Smtp-Session: l3s3148p1@Qr1+qLIF4m8ucraB
Date:   Tue, 19 Sep 2023 11:12:29 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] i2c: clock calculation cleanups for Renesas devices
Message-ID: <ZQll/QTvLQQRkdYF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230906200024.5305-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nbYj2niSzbk1fvHZ"
Content-Disposition: inline
In-Reply-To: <20230906200024.5305-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nbYj2niSzbk1fvHZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 06, 2023 at 10:00:18PM +0200, Wolfram Sang wrote:
> While implementing FastMode+ support for the R-Car IP core, I noticed
> potential for other cleanups. It turned out that it makes sense to apply
> them first, so here is the series. Tested on a Renesas Falcon board with
> an R-Car V3U. The calculated values are identical for 100 and 400kHz.
> The RIIC patch is build tested only.
>=20
> Looking forward to comments!
>=20
>=20
> Wolfram Sang (5):
>   i2c: rcar: avoid non-standard use of goto
>   i2c: rcar: properly format a debug output
>   i2c: rcar: calculate divider instead of brute-forcing it
>   i2c: rcar: remove open coded DIV_ROUND_CLOSEST
>   i2c: riic: avoid potential division by zero
>=20

Applied to for-next, thanks!


--nbYj2niSzbk1fvHZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUJZf0ACgkQFA3kzBSg
Kbbh7w/8CGMLj5rji/CWOhQQGChhr067MXOqKZArXNnDObrkB1hJDN/52GeeqKEH
xyGg2GZripNGRuwmgvBXbtNY0BhfXOVftT4r9VRzUtGgYA4pYYEV8ORYIZp20ft0
7Wg0V4iFkKpuJP8eA8pM+5LJ38czPz6C78hP48vLeEhfgvpDqunmiYJcWxIVo7Fa
mHQHRe3qbHf8yICImzqd/wOoVKufsmftdGq5iImCQ3znvo3FYInk96XVX8Ab7OMB
IZgcmtgNUa0F3aOL0AnGs8tKcnGJs9BjUjlEZuhoah1cvl0/c10C+yKaYWMWp7ED
TdE6ivcIEKHe7+RzrbPzZH9fphBUA3nrl5PJ2GjZPvQV7nPEdAhnY0x4WXtXhtD1
ZwX6A+w/yEnWo96qG5Vt1tzwlk8SN15o+QRONIK9CNzlXHAmdLefWOkNI4VBdi+W
YBs2supJua/pDPC6e1zQZ46D7rzE7fcSd55icJQFLfC4KEKgnDIvltboLhHMCWGt
KjkABA68fs9i/hq8NU0Drw5MKRr+qRCIoX0xer329tBKOzmBQkitKJ2yoWoKogaq
KejlDV0pyXXPmOGi5tF98bMYrqlwI/AvkPxVGWazgKqKfyW27xCPF/mfPygW9jNy
wpOqO/6w5rFReMZb1km9krrOQ+oNXsSBf6N/WbAaiY8n8Z/tHxg=
=ZcK5
-----END PGP SIGNATURE-----

--nbYj2niSzbk1fvHZ--
