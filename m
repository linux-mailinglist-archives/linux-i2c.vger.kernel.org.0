Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 066845692A2
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jul 2022 21:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233921AbiGFTcN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 15:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbiGFTcM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 15:32:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20FBF1D31C;
        Wed,  6 Jul 2022 12:32:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BB419B810B2;
        Wed,  6 Jul 2022 19:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2EB8C3411C;
        Wed,  6 Jul 2022 19:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657135929;
        bh=afvzmovXiqWI9n8eFTh9LyptvwDchAs9Ecj3Cw3y+Bs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jWEuo4vphWS4McLLBNdh5U/iRQlwNE2XEpkXQsOSPfYood83zay4eTKLnqgWyYHT7
         VmpHN+eYjB9PS3KbxiW3SeareAbIHi+ZmD/Pd9QNctmDbdbN7p3d21VrJTc/hQF0CJ
         alDVy4XK9VGhm6U31dClRunYpi53Aqah11+rUFh0BE4ny0xbXi7bGXe0SmflTwYony
         TfdTFLUn41sh2tcIYCQw661SFGiG4eQLvpeBlyCwe8Jjd8/HkQqT/Ks9laAe1nVU7R
         gBL05VsxUZr0S/l45KJ1NyYn1CObEAUMQ7AAX2gt36a5IHTJm55aQjtofC3lDw3h+V
         oHp0IO54SuHOg==
Date:   Wed, 6 Jul 2022 21:32:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: scmi: Replace open coded acpi_match_device()
Message-ID: <YsXjNd4qnopeo2rV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220630195541.4368-1-andriy.shevchenko@linux.intel.com>
 <Yr7fuWADLhJSeYdZ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5EO46Sifs0ie7T/r"
Content-Disposition: inline
In-Reply-To: <Yr7fuWADLhJSeYdZ@smile.fi.intel.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5EO46Sifs0ie7T/r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Discard this, a last minute change that makes it not buildable.

Do you plan to send an update?


--5EO46Sifs0ie7T/r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLF4zUACgkQFA3kzBSg
KbYAoA/+MxBNDBn7zOdk0m/CCFYMUjSLsgiFzNfb6fwc6x7ys/A6a2wBb7nygNMA
ktKNtYK1xyzz5lc0xfGba2aoRKMGpnVDEsWbCi1M8TwrKODseeNCOOPUAf3PYtJi
X2E2iV/8KtOdF9O7nKrrWELnSnk6buWQX5ZzO9cW9Ic2/zrm788lZfZ3uIBmQ9eJ
wsW9e4bTNczPhUc1YW0QoMOESJ3NLKkutK8DxC1Qq2rDA3BMiDwZaiwgP95TFRc4
jNmkzWiuzr156cRHpGgvfumEKpPylb1DS/fnLdMmqIkdDKmnTby1+ajYwXI6NRug
ORd8+LXOxkm1t39FzStgZXJft+qQMF3DEGpl9PdbBkwgpBxNhqZfaNkElW0lV32o
Gb1yHyrDis/+oxGTdZDd+fZ1qcG2TrElEVs2j46AlMOUyyRmZv0Yk9KEUldM1OwB
WeMDu+8xUYWiOG1367aAvtl26vUzPX19ShELhbvwpHdLaWJ+0ncVlSCd55ccTNG5
cpDboH2TfsQmp8+lFEDA1yiw8zmEvabTD2iLgLuOP5gvOFOu1d+jW+p+7InmsWzk
h2fnqkoLQT68oVO4LD2sC1PYM1Q7Y1C+xMBhiJalINKVHwUYHgZHVq7nhxaAMpPL
/hYjHMpu9PIJ4w7agNr7XKFVoK0wad2aAgDfvXuoqKT26iirbt8=
=yE5b
-----END PGP SIGNATURE-----

--5EO46Sifs0ie7T/r--
