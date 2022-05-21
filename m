Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 287D152F936
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 08:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239956AbiEUGR5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 02:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233827AbiEUGR4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 02:17:56 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B556116D5E3
        for <linux-i2c@vger.kernel.org>; Fri, 20 May 2022 23:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=GexhmR8fuRKD3b+S4/D7CbJsLI4z
        ezFTQ5YocGtEIE0=; b=IboYFbzGM7XeAXO1HP2XLfykmbh6vPNVcLQ+plNY6xJq
        y4F8vjkDboHuhL7m9RJAedZYjm9S5PIPO8KEiO4xF6EnisGKKYUBVMynfRUN+G0a
        RKnhlw/yQTcqcy00Spgita/pJZpQA+yLlWoRTumoHanrJ5qGKM4RaqOcfEB8fHM=
Received: (qmail 4061187 invoked from network); 21 May 2022 08:17:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 May 2022 08:17:50 +0200
X-UD-Smtp-Session: l3s3148p1@5dT7kH/fuLAgAwDtxwyXAGMY7IbT6g6m
Date:   Sat, 21 May 2022 08:17:49 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] i2c: rcar: fix PM ref counts in probe error paths
Message-ID: <YoiEDa+3GeqCHD9z@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20220520095421.51742-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UA5DlfkSyAwajt42"
Content-Disposition: inline
In-Reply-To: <20220520095421.51742-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UA5DlfkSyAwajt42
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 20, 2022 at 11:54:21AM +0200, Wolfram Sang wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> We have to take care of ID_P_PM_BLOCKED when bailing out during probe.
>=20
> Fixes: 7ee24eb508d6 ("i2c: rcar: disable PM in multi-master mode")
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--UA5DlfkSyAwajt42
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIhA0ACgkQFA3kzBSg
KbaV2A//ZjUV+HJf9HAmZTzcNbwNO1azMVWyrVnuBfhl4AnUQCkhbfP80q3dYCCw
JfoCEYDvSCVDEv0IhleoiM6yF7zBwUnlZqOxlsz2pq4SCLOFqDOHPV7w2K/Y3q2K
NcQBvw86oI4isyvtzu22URvlHfcloY27lKrRvSAgV9Jnu77MSaOD/7GgVC1Aj31U
riYMYmYI1CfVSSi1oZxHJ8goDCI1cbUrzPpPM8NtEum+8IG1Qop4DjmuXYQ1arQ+
ZFrbTBTNY25JTZj/+VgL/NmcizM3RUWU6DadJdRxQtzX5oNhyb3mhH3810VsJ8Ev
adJ4W4m1dEAbagUreSW6bxFIE89yGqV07c14ALUJ3uPtNfc4n3XHCd2MsdUuibOH
LD5CTVMmXiz9/tuH9ymBVDbsORZb15w5DtQ4yocAuU+xguJGMKajoyPkVD8b46uc
vkttao8Cfsh/aVv3SjC2HL3i7uC1bi88Y2DtoGsp7Xm0ZRs4CDVES/PqXKeRzD2N
kpsVo70k1xISf5KMcvAvQeKv9NEa4qngJDcfESgFcZsMDH7FsLHR3Ww3wtXCrCfw
pP6pYymkjZz/h8ws8+HBw5iXcUp78znX7S6YT2RSnwScm+IgFRdDFCybPaI1ph9V
qkk5Rmf24h+3i8V0SNnbD1ogJoNYc3Ss+sBa4063B4wPIQ+UugQ=
=CnxV
-----END PGP SIGNATURE-----

--UA5DlfkSyAwajt42--
