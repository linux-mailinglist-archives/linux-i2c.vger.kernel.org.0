Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7083D4616C6
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 14:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbhK2Nmb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 08:42:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243810AbhK2Nka (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 08:40:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A272FC09B12F;
        Mon, 29 Nov 2021 04:21:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 306FE6136F;
        Mon, 29 Nov 2021 12:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D65C004E1;
        Mon, 29 Nov 2021 12:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638188468;
        bh=nt9igO2VIrbX0Y0Juo8eoMFt94e14U8oE0NBFunmCIg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vA/pXtASqP4oik3rnGaIsuuOVwv+ZkbJG0x8CUqsHMBfI4FUmu9hZIrpx44i8lY8+
         VtIFYho5Yh3Z4NBQmBF+v9JLbHCZsVp+UlTbYM7pcyfZtOJqqkdHq8fJRox/XTItpv
         d18lfqfF5Zq4+n5ZeM6BdV6+yNwN6GeqnuHlFhBS0zkba1ZJVyObHOtrmXvSdq6TYy
         G6R0V3Fl/OIZWrpBPIbmdFtF3y6qycYDtWodggHFxh/JuoGBK7HHPv8MujJyfj16/L
         d3/5FqBhfFE832fQG8VKtrsvTcYPdRvdzK7OOIIVSTMvT+QOwx+yjkSS0fzbLJledj
         SDhEh27mLVZFQ==
Date:   Mon, 29 Nov 2021 13:21:05 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
Subject: Re: [PATCH 3/3] i2c: stm32f7: prevent calling slave handling if no
 slave running
Message-ID: <YaTFsV0sIU6BA0ja@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1625062303-15327-1-git-send-email-alain.volmat@foss.st.com>
 <1625062303-15327-4-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RG6K4j9bMxrgHdVg"
Content-Disposition: inline
In-Reply-To: <1625062303-15327-4-git-send-email-alain.volmat@foss.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RG6K4j9bMxrgHdVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 30, 2021 at 04:11:43PM +0200, Alain Volmat wrote:
> Slave interrupt handler should only be called if there is actually
> a slave registered and running to avoid accessing an invalid pointer.
>=20
> Without this commit, an OOPS can be generated due to a NULL ptr dereferen=
ce
> while receiving an IT when there is no master transfer and no slave
> running:
>   - stm32f7_i2c_isr_event
>   - no master_mode hence calling stm32f7_i2c_slave_isr_event
>   - access to i2c_dev->slave_running leading to oops due to
> slave_running being NULL.
>=20
> Fixes: 60d609f30de2 ("i2c: i2c-stm32f7: Add slave support")
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Is this one still of interest? You resent patches 1 and 2 but not this
one?


--RG6K4j9bMxrgHdVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkxbEACgkQFA3kzBSg
KbYw4g//XCjI9PEPvkuiZI/yOpA/zHmd7BYX//rxaUBeKAIzrE4vHos0V0QweIT9
LBBl2edf9sXervjTrNzs6TQ7GJ69VNTYX1wf4jk8xlezAnmKoCiH7L1pNcHpA2yn
ueBi4NqjH9SRVbO9QzilVRODkillt6LD5FqByeqVJtdlmAjT2dsIwA3xsSGhv5EF
u2aAX6IoWPjIwQaAvfQWu8ZQvD6q8hfp8nvIHZyT5gtjN8cEAWJGxuJTv7mkIpkU
Wwv76pfPVpDeAXdqgMaRfhoWPIF37ptbSX6JZgUFRCf4O3Lub3v7FcYi2ckyBqrS
98Hc7a5zSyYUA5/q1AI35BwTtIbHuZObWjH3KwFThbqUgIwG8YJRlCnK3O/mjb3M
2C6CN0g3B3JuEJ3ds1yNje9i4T1N4hMH0KwozcG6xPwA5sKvB2EOwLZ7Gmo4mYu+
yVVn93mMbiX1qV1eWUi/4g51VSMOSaZt3ncA3B1dsY7dtA0EU4ievewJp3Fkbd60
UxEHWOookEfVneDjqWlRa0cuthoLURSXEgQZPlB7xMJf/dfypkN4Dz6lDCu1XCjc
VZRKR5GvE0IBpCohjqeZpu16PVfouCO2jhR6jKgYH+UJ+6425xjhEMvL/w3OKtfm
foq5rqD+2dAJ4KfbE9ZCPcQ8YqrcFByacDOr4dQeW0M+dc8EQJ4=
=cZpw
-----END PGP SIGNATURE-----

--RG6K4j9bMxrgHdVg--
