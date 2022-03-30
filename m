Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 048934ECA96
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Mar 2022 19:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349273AbiC3R1a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Mar 2022 13:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349274AbiC3R1Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Mar 2022 13:27:16 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D9A6EF798
        for <linux-i2c@vger.kernel.org>; Wed, 30 Mar 2022 10:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=oqtBie3dlm9MOj71uFZRCPRdbRdo
        1E8ML5EWmRUUbiU=; b=IUCM3L8etIs867SwMnXdvslF0gNHtz+gdauWMnj8oCiP
        3Kc/tfaCtD9KsqzSHbnmlKvW9w6sjVi+U5Ux4dQMY14owP3N0f7SzrQbgvOU8h/O
        YNlOnNTWt9lU7F74JYTpY4uoJaFzyXyeUS5lVNx2W9tmoZmRSmH2ZTr4hUxFixM=
Received: (qmail 2281766 invoked from network); 30 Mar 2022 19:25:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2022 19:25:11 +0200
X-UD-Smtp-Session: l3s3148p1@dFzc03Lb4qkgAQnoAFSoAOQGPeMhapNB
Date:   Wed, 30 Mar 2022 19:25:10 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH i2c-tools] i2cget: add mode character for SMBus block
 read to manpage
Message-ID: <YkSSdmTBKbTsCJSv@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
References: <20220330102028.36187-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wE2lHtadamPLw178"
Content-Disposition: inline
In-Reply-To: <20220330102028.36187-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wE2lHtadamPLw178
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 12:20:28PM +0200, Wolfram Sang wrote:
> The text was updated, but the mode character was forgotten.
>=20
> Fixes: 789af53 ("i2cget: Add support for SMBus block read")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to master, thanks!


--wE2lHtadamPLw178
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJEknEACgkQFA3kzBSg
KbZi8BAAtAjtCBlIuiSMZovW6zCw/bZBvPgfhZ8CYQsDq0L0OTS5/25uuHtIM6qb
B3yuSH5Theubzah+7N6wjI3fdZ/CsWwAef6fTNKP3DaIEE4+YxGn47LstzSHDqK2
QUiO+M5UJHsWoYN1Wk1ArpWoSU18FUIIcy/sToIJP9pBFhYwyVSpn41A+TyOjkvU
OI5eNXbxo8/52uMiW4BibY0C3xkTCZUPDB9wp9QMBQvUAxrf89q0HuWccD58YbKD
XcgpDOmzmb1JYRJgWMtapNPQlDQLi/KYboZHO1jmkUZhfFGTWT0UjMVSuGHpSceM
Kbyyts8sZa5esnzYzdZWUbrxk7YIDu3LxwAP7S1G6kz+QsGP7+Jv4J0mcmGnHHbd
MolaRGDu4q9q+Qc3XKNkf1lCr+EP90JC0QWIn1Plm1QIoSr3LAn59RNTO/uF25ny
rQ/P2VlpGuHEzAy/yu8KdZzSsv9o98VbfElAMZ2nDzVV1/Lp7NTASZ1DP6rHjeVX
wB5XNsh815dl2hnbwOX9GlzasxtCL5HJ6EqEYgAIyzhadnZwGDuUso68BVULsMcA
rJyHgyyshTuyiP+43GPwSV67lfVl4I0lAMTjlfKvfct+Q4bzgAJlrHyeJbYzt9YB
DtMMWNl/f5Ru4N2np/582IfPoKY5es4QG/cjxfJWT2Q4wGlgVfw=
=rYRl
-----END PGP SIGNATURE-----

--wE2lHtadamPLw178--
