Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 232B34B17ED
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 23:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344801AbiBJWJ3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 17:09:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241875AbiBJWJ3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 17:09:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD36E7B;
        Thu, 10 Feb 2022 14:09:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4D474B8277B;
        Thu, 10 Feb 2022 22:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E016C004E1;
        Thu, 10 Feb 2022 22:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644530967;
        bh=+4yvyX7PL/o1aUlKtZM+y5DyMbqKBp/T0joxRm70QJM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RYgDhrZ/8e10s7o31z/gfptXJi5wydGHjl4gOa69iXCSPzpg610dL/NEfD9AsiwPl
         QXYc643G6SB54pPui5ZBRR46KAUopwFvIm1thxGsDDbK6YumH4PaYW7ubqKE76TAos
         z69fPQyEWMzhXp7gGD0xiejG26y67gtjd+ShzGqcsid7T0JM0weZUkgFRUZAlxBwl/
         2LH463pvowaZJM+36t/Sqd+WQWzupGDVTSWrNW5aCjmpFkI9J+iXXbZmYmzOTWtR+R
         on7m3UcnQ1HzUUaLbPM7lWA4/WTEFYCTkHxjNCD/3V2iDt3g69tFESxDoA9hrdc0JN
         cCCrD6IOFw8bQ==
Date:   Thu, 10 Feb 2022 23:09:23 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jan Dabros <jsd@semihalf.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, hdegoede@redhat.com,
        rrangel@chromium.org, mw@semihalf.com, jaz@semihalf.com,
        upstream@semihalf.com, thomas.lendacky@amd.com,
        alexander.deucher@amd.com, Nimesh.Easow@amd.com,
        mario.limonciello@amd.com
Subject: Re: [PATCH v4 2/2] i2c: designware: Add AMD PSP I2C bus support
Message-ID: <YgWNE05eVK+LijL/@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        hdegoede@redhat.com, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, upstream@semihalf.com, thomas.lendacky@amd.com,
        alexander.deucher@amd.com, Nimesh.Easow@amd.com,
        mario.limonciello@amd.com
References: <20220208141218.2049591-1-jsd@semihalf.com>
 <20220208141218.2049591-3-jsd@semihalf.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TzVXNhoD/5i1HVBQ"
Content-Disposition: inline
In-Reply-To: <20220208141218.2049591-3-jsd@semihalf.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TzVXNhoD/5i1HVBQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 03:12:18PM +0100, Jan Dabros wrote:
> Implement an I2C controller sharing mechanism between the host (kernel)
> and PSP co-processor on some platforms equipped with AMD Cezanne SoC.
>=20
> On these platforms we need to implement "software" i2c arbitration.
> Default arbitration owner is PSP and kernel asks for acquire as well
> as inform about release of the i2c bus via mailbox mechanism.
>=20
>             +---------+
>  <- ACQUIRE |         |
>   +---------|   CPU   |\
>   |         |         | \      +----------+  SDA

Applied to for-next, thanks! I fixed the following checkpatch warnings:

CHECK: Please don't use multiple blank lines
#232: FILE: drivers/i2c/busses/i2c-designware-amdpsp.c:92:
+
+

WARNING: braces {} are not necessary for single statement blocks
#361: FILE: drivers/i2c/busses/i2c-designware-amdpsp.c:221:
+	if (ret) {
+		goto cleanup;
+	}

Please also use checkpatch next time.


--TzVXNhoD/5i1HVBQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIFjRMACgkQFA3kzBSg
KbaLFQ/8DKZmeRjUSNfLZh6Kfbjk1tQaIbq2RFIvYtX6aDyJdr2WAfzwqYg4yDNZ
2lP1LlqgaAJfbUjw7MucblsRy96TBS5qa8DfzgSQ7CHd1kJ+4gJTrJipozmyt/0d
AWh88pnH+zTz0cfL9VXgzXMETLJl9NHar69mox5e9dunsEJphkr99sQCpAbVYgac
EyuplJGGGhqyTV2dB9Twtb7jx4mIN4JGbpP0HUJwbVscqrzgzc2ChK5eCYkwagZ8
H2+kLVs4DyEtmP0vI00xiB56k3xAXDCuj6TpZBq0W9kSUvDtrJHLVNi1yWbKomIH
nGSiN+xqz7Pcy9Od+95mgVCgZ1QyfvbghIGG2MwKn5OWAfcoSTOE7nyouGw+9Hku
ZcciytjnwuzMmFkWU3JRz/MoMrHljlekGE2mT1gnUL0DmVdumb5MZAskJurPTXYh
0Gine2IZCLRgokO4Dm8Z0qZslaRzVrByMggnU36nLX4auqV08LdhS3w0QrfCRKZc
lcvHdBNNoR2Uv1GnAbuhSRwHsDy4dcO4Ug1n7sVOJEZ5Dxmleqz8VME1RRFwjZhu
QftepRfZu5VKLlX57ELq6iWylDeY1m8/SmaRQjQK842QqhTyrKX7t2gW+d/WcO/k
MTiJ5tpwGsHqPdtbcJozfmGBPb5e2Qo6yPunc3xUAFDIVChYZTw=
=gemd
-----END PGP SIGNATURE-----

--TzVXNhoD/5i1HVBQ--
