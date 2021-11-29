Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 138854616BB
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 14:37:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344360AbhK2NlJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 08:41:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238219AbhK2NjI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 08:39:08 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 357C7C09B125;
        Mon, 29 Nov 2021 04:17:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 82183CE114A;
        Mon, 29 Nov 2021 12:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F379C53FCB;
        Mon, 29 Nov 2021 12:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638188244;
        bh=MF4pWr2Q+9m9KQijQj8/y5kE5CLSfMRfQm3KSe1TCZY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hGbs6nYN6P63/qzyFkNaJ8lepdzFPoR+5IZRNrqqNUYMKj1sL150IBliUPbE6DHNv
         YcpFpm6b7t4dDMgmGe/gzw1xbK66vvqD/f++myigEr2hbjFwPQCtITZ9L8u/g6eEB7
         /VA+YZcOc/jdBVxc0zSPeBtd7FEkx51GYWE/uHNziDAwt7vxrhWdxx4aWkAnvj0E2g
         R7AsL5hJ++8OzuIEzR1Am3SmJOdplTZ+4drdtQjnjz+s58Q2KTcksgJk94hi7tfJZF
         5s+u8d2W+HY9OGWCFTwSbkeXN4dM8JeKAtRdkaAkXGqhEnHa/B22vdUNa3QGhQe+Lu
         OjAro4Rco0atQ==
Date:   Mon, 29 Nov 2021 13:17:21 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
Subject: Re: [PATCH 2/4] i2c: stm32f7: recover the bus on access timeout
Message-ID: <YaTE0f9ciy5JRZ3Q@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
 <1632151292-18503-3-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0e/kpnV1GKTrdwmD"
Content-Disposition: inline
In-Reply-To: <1632151292-18503-3-git-send-email-alain.volmat@foss.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0e/kpnV1GKTrdwmD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +		stm32f7_i2c_wait_free_bus(i2c_dev);

This does only a controller reset, not a bus recovery with 9 toggling
pulses, or?


--0e/kpnV1GKTrdwmD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkxNEACgkQFA3kzBSg
KbbreA//dH/TKvFG6peSxcSRE8ktcwY1eyHGCEfFXRdOU2Ml0I0KsEkCqSB7se0L
sfsuxAN5mxQfpZdP70KODDZGpRi8s5z9nL4kRyBY/VM7qBzxTwz1J3+TbnTeLXC4
A1VsgIvK8uIamtx/aFiCcpVk1AGd8zXnUJxhJts1k9feRIFAIq5niNBX60A9bbZA
2TTnBQ7qH03ecmKOV0kbRzch+ajceayx29YMWeuUV6hNFmc99VH4uVdBoL0bg3nv
VdqA6nWLS2AEtmR5TVClTuw5NoU5n6KxgVE37Bj9B5FUHHkNeUpljZmWt2y1bHLJ
8HbfkA/q36lO3qzF2iKWSKR8Lxrq87+XTnwhY4duCgUSuP+b8nLvmiTRYhD+Y4bx
4GGATMCAyvZuLD6JdNds26HMgefF5yCgi/DHUf3p7adhghGqeESb094Ewd9oZDGy
2a33eTMcIDYVqmtWV51D+dPafXBkIXYV92w4+vdAPiV1aJUmSUppSqUh9TvYD0Zs
422GgRNP2HLqzN4mawITWLYiGiTH/alzWAcwCI6dsg+fvz5GbIUBO5gc0miSpYO/
6Za169OnI06nOXP44e9LIkUbtO4b7q+XFGsPfW5w8WSCSmG7R26j/C0w0v1zuLy8
34ZjwNpxaCvFraneXFoJQwEDXCE4ayjMr6D1KWYVHyC3uvN32eU=
=k33g
-----END PGP SIGNATURE-----

--0e/kpnV1GKTrdwmD--
