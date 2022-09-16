Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F96F5BB309
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 21:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiIPTzK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 15:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiIPTzI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 15:55:08 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6D241E3F5
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 12:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=8vO0sYAQyjXUfh7bzm7mZTxwEA/Q
        PNdjrsC7Byiv0+o=; b=YLICeyFST0UtT85zSduSqtpb+GEpkMucgeCp3dvX9HIb
        i1vxLQgcc1a0AF7CAqyF5fR5C37PJ+V0zJW77YwmWZDTxp+vuh9f5d1b253Ik6IH
        jB+IvXaoeJj44diZh40dhH/m6zt/c+7a8hg+mtcH5xDdg7tHjxza1FuPDq7WcWk=
Received: (qmail 3519109 invoked from network); 16 Sep 2022 21:55:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Sep 2022 21:55:02 +0200
X-UD-Smtp-Session: l3s3148p1@/k7JvNDoOsVSjfsd
Date:   Fri, 16 Sep 2022 20:55:02 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] Documentation: i2c: fix references to other documents
Message-ID: <YyTUlmkyImVxlg2w@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20220913100552.3080-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ajPOdY1wIjopBLRI"
Content-Disposition: inline
In-Reply-To: <20220913100552.3080-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ajPOdY1wIjopBLRI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 13, 2022 at 11:05:52AM +0100, Wolfram Sang wrote:
> Similar to commit fe99b819487d ("docs: i2c: i2c-sysfs: fix hyperlinks"),
> make other links in documentation consistent with the preferred way.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--ajPOdY1wIjopBLRI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMk1JYACgkQFA3kzBSg
KbYMfQ/+LGk/FPMvZjBk5hNlp7lT8YTRWIAHIl+3GCdfsW1At5Kuh410KeyoUYW+
ltH6kQN4DesfR2kEndkfoyC8RdlCsrZbMS1xfmbs5JNXhG8KgadExHYDYN0QTXIw
YdSpDorfEweGs4gCfQmRSmK1lFfaBo1BKSWLGCWd5ELmDs2wQwHkTZMf1apNoBX1
yyGHd1Dpj3fydxgNf3z+fcRq3VqJmBuHq7r99zcUIIfFz1yQFOZ8ppk7SUfal/yH
RmfIE+YMcm4VubsYXOz4JPU8NWoeg7znCsmABZxnfsjsbNH6NcjG4Wvk/dD92fkp
hc8EYpwfKfTme8IXKY5tS4IgqviyRbGwh4/jaUlviKPwBKDcp/plB8lbQe/3BXdg
6fGHEhDTnkIwEVFQ/aaR09T1nB9n/7qv9ktdYyK53ZJS2JWOGz64YO0bue4Lvfo1
aSd6MbNISujWoaDlkJ2APAFJcapWvwDq/J5DecPV4xmJhh3zT2tdb74s1DZL0uil
Vc2z3owP4lYZI15GHtckL+zy42TLTckFwvh1r2GRm1MwwoedPDBx4OKrR/gizIbn
sWHK97XzO7DIP2CZ/+60vGj2DFtPzIaVYaUcpww4ZDlyO9bYmH8gPNc6GtAaDYRC
QLx5iZ3Z3hvEV35HzxWMfp/SamfZPcjCm55Hs9Oh6FS0ksDYp+s=
=bWZK
-----END PGP SIGNATURE-----

--ajPOdY1wIjopBLRI--
