Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B16025ECD35
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 21:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232078AbiI0TyZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Sep 2022 15:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbiI0TyY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Sep 2022 15:54:24 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9BAAF50B7
        for <linux-i2c@vger.kernel.org>; Tue, 27 Sep 2022 12:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=MzGOC4Hqsz0+YsPfn22O6xud2Ti6
        kOq3kcuBfbmizbY=; b=uxX1CbX2twrJ6mxqXLzxJBJ16FrD2K8QKJuaWTCkb3rg
        bLpGEKXU5hlDKPenpJ1yyB1WbF9IYBhh/Qa+sOMAuxcePsQM3QSTEFLtlzzWMeRT
        wVTwVqksLiluBg8DBwUcIcOAdf3R2Fqj7WiA91Rnu2jlBD4TLBQAOfEhX5vijSo=
Received: (qmail 3700080 invoked from network); 27 Sep 2022 21:54:21 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2022 21:54:21 +0200
X-UD-Smtp-Session: l3s3148p1@qP2WAq7pf9cucrEr
Date:   Tue, 27 Sep 2022 21:54:20 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/5] i2c: i2c-mlxbf.c: remove device tree support
Message-ID: <YzNU7L9CWI+mTxRZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220926194507.24786-1-asmaa@nvidia.com>
 <20220926194507.24786-6-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FQWfs2mVYa7LO0Ng"
Content-Disposition: inline
In-Reply-To: <20220926194507.24786-6-asmaa@nvidia.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FQWfs2mVYa7LO0Ng
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 03:45:07PM -0400, Asmaa Mnebhi wrote:
> BlueField customers have to use the the BlueField firmware with
> UEFI ACPI tables so there is no need to have device tree
> support in the i2c-mlxbf.c driver. Remove the device tree
> binding documentation as well.
>=20
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

As buildbot reported, you need to update the MAINTAINERS entry. Also, I
think you can add an Ack from Khalil because he approved the change, or?


--FQWfs2mVYa7LO0Ng
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMzVOwACgkQFA3kzBSg
KbZzAA//Uz8i8/A0RhDko1aco9DQt27ZCFg4KNsbvLbhkN0CmpCNlOzkd8XrOqXd
hPB++oc+SpA3vAtdTbHb3IoJd6COEQh5PZMxe4vaLG9oIIG+0ArsiZau6Ymy8H51
FEzojZ9El2YRdzAoEdo+y2vfGACjWkcOJRaHVU9Gzx5Iqp8F9IqVoJvUVNl40KN5
T9ETbKe1bOsyKg2NbNumbsGBuIwlu+tAQFVTcMEDyxsmi04UUlvZaSkseap4N+TC
G8Qu8H5gLoII4nHivziR9Q91cJLwl8KGiXFaoM6EESTMHqs7cECc44+UfuGxhNtg
sBj6ha7j69hVwdEoHBddf5un05ln4f5fCoJ0DA18+EUZCA7+eY+5DEHqZxL1UTep
yZm9zKQCNOwB8ZNHJTmykqPCemjTc21DqjQxRtoXuIWriaC+AL93oMUNAhFcL3v2
oV4VSn37Oey4iC8thYGILyRCNQW6ijyisGqNGIUHXeredMde8nUqkjJ0G0cQCIUG
TkRj1bNVg2EOcm+VhgcB2ekjo5Apv62rogM+OyYB06aKOGy8ZCGXEwqw7DkXGOTz
A8QIkum390V0HKSR2ozKMuKWgtUljG3hqIIC/O2cROuuMBRSU4VjdwQjRcGNsbbM
Xs7Q94KJRMyONI34On+or/QiYlU+y8g7m72hA1lwZf77o6GLb1w=
=bKSH
-----END PGP SIGNATURE-----

--FQWfs2mVYa7LO0Ng--
