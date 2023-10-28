Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED2B7DA73C
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Oct 2023 15:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjJ1Nad (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Oct 2023 09:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjJ1Nac (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Oct 2023 09:30:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A63FE0
        for <linux-i2c@vger.kernel.org>; Sat, 28 Oct 2023 06:30:31 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207E8C433C9;
        Sat, 28 Oct 2023 13:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698499830;
        bh=pcALMgoNudSRFlg3PZieRpjFDqdQ28oJgKcE+lzVpXA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b/PbmTkltpQgn5nbOrPLE2pr44baoNy/riT+1jPRlJNbdwpbium8Gdh+lhwXqlmN9
         PM6d5hp7mRofSeWu+SWvPexM57QqNklLpXEocV5ISOlR3msTCKP139fP0yq75wGri4
         +RCCPKRvTzNwIN+eYbLnZu0c3tmHVSF2G20t8GfabkFVTQdUItg5wu/auQ6Rm9iLpS
         Qqicuy77q5IpVvxt8wfoxUjyE1hgpBrPJCLrTsm2BNg0+sk6kw4b6XluPX2jsVuDOc
         tXQrodGK0KxWwUxnQsBn8ub1wo7XAa/wOwHRIM/wLygAYiVFMn3AiohxpDD7i1oSaB
         GZpmu4c9way5w==
Date:   Sat, 28 Oct 2023 15:30:26 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-acpi@vger.kernel.org
Subject: Re: [PATCH 1/2] ACPI: Add helper acpi_use_parent_companion
Message-ID: <ZT0M8opwbPxTV3zo@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-acpi@vger.kernel.org
References: <90bd1071-317e-4dfe-b94b-9bcee15d66c5@gmail.com>
 <6e935761-5b36-411a-ac82-cbc394bba7b6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="muWSw0Tqy8JCNnD3"
Content-Disposition: inline
In-Reply-To: <6e935761-5b36-411a-ac82-cbc394bba7b6@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--muWSw0Tqy8JCNnD3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 15, 2023 at 11:34:25PM +0200, Heiner Kallweit wrote:
> In several drivers devices use the ACPI companion of the parent.
> Add a helper for this use case to avoid code duplication.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--muWSw0Tqy8JCNnD3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU9DPIACgkQFA3kzBSg
Kbbfaw//R23F18DRMoi7RSNhP+hFe3C3AT6pKFsze12si5LEps2batAjqDfShYy+
rQP224tXZPro4W02CS7lGnemwzpfGz7yoJSC2fbGueh8/8a7qroLxoQ/y4voovGO
5ceP/Ar1Fx3Sg6FLVXZCSVzvj5whlW49z457b9joGmAy/UzgEr6EVJvhRa/nS1c8
0Tpq93th9eSVpTE0i6JCXRzYthHy9u6CXU2pKgwCys5eSwNHAJkjXOG8T65ogkBD
SrtPfG2FrHNspvKE8SdMhsHgHjj4neaxAAr+WVwGUibTKcsoFETJ6gmopSJOcfoW
zic1TYMMTyIv33DmJAba8ss81zgLAQamFMev6M/x6BsvagVR5y7UL9rmdhuam2fg
8Iu/+EBe/p0ktP9auFVJxciwptRvUMu+dBUPrTiBAfWgzerf9FeNb8isIFUWyUS0
79JfrwK1Tk9lSS0HY98P5l3GTiBdo7FMlHd3XbelSqQP8b6eqmgBntAA3wl7gxQs
/2LluZZdPDGsbjhNmd/aUoFAkLiTbgBm1hrMAeHbuUpGCnl4r0eNHTig3dV82lZd
u6/zF7ktzaeYb/HWZSAbE1dHAfYtg38qV2IjmkhHjq1A3EXfA35/q+oDuoQbDSpm
gvhsy8IMfLrEEjj2qgh2KMM9wLflcobkfc917pFUrKk4vGSrl1I=
=eE0d
-----END PGP SIGNATURE-----

--muWSw0Tqy8JCNnD3--
