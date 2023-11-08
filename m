Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 048F37E52A4
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 10:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235408AbjKHJ2Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 04:28:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234592AbjKHJ2Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 04:28:24 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AFC2E7
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 01:28:22 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81304C433C8;
        Wed,  8 Nov 2023 09:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699435701;
        bh=+MszoTLZBXgbW9YUweuhpy/Uvf+wiHY+Vn5CRxPgoyY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u7Cd+pc9xn2QsyYTuKCBxoGOKzMZm3ANHmptL9brA8UJn88kAOEFrV/wza7maysVx
         3yOcR2FmVLHBhf6R+MmUxHj+rL5vn/EFigv7gVgV4bpBLE0hjdh9MfwCKHvK+r2L75
         HAgOSrJK+M0IsMt3tCwOcKVXxpzxUYlGTAOBbQt6NkfN1tgze+7K3ervGS3E8ZK6DQ
         aLFr3FmUFzXvwyJcADOv/byJtRgpdtIEJ/BfB0UfvO2BmFwUbnAgPqZYZSc6A5eSHf
         W//5pNNmFi3J+d24ZkYK//GJI6noifbnAP8kwIFNeBfaUVbljy4hJX0HnwYZpkaWMB
         xk2OXGJqrjCLA==
Date:   Wed, 8 Nov 2023 10:28:19 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: cp2615: Fix 'assignment to __be16' warning
Message-ID: <ZUtUs9rD3TLBQZjW@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        linux-i2c@vger.kernel.org
References: <20231030171910.3447256-1-bence98@sch.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4gJkP/sLXZFJvEdh"
Content-Disposition: inline
In-Reply-To: <20231030171910.3447256-1-bence98@sch.bme.hu>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4gJkP/sLXZFJvEdh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 30, 2023 at 05:19:10PM +0000, Bence Cs=C3=B3k=C3=A1s wrote:
> While the preamble field _is_ technically big-endian, its value is always=
 0x2A2A,
> which is the same in either endianness. However, to avoid generating a wa=
rning,
> we should still call `htons()` explicitly.
>=20
> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <bence98@sch.bme.hu>

Applied to for-current, thanks!


--4gJkP/sLXZFJvEdh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVLVLMACgkQFA3kzBSg
KbYsnA/7B+jSS8qyHvQAXwClbF3kqd3szoOo7IeBU5bC6IGLWrtAzzyHHohq5A9W
AmBedpYLmGeUxzq0UEA9JYbhDRDiXbcF+bPbxBVj6bH+M67Mt+XOJvg0j9r2FJZg
YFMiw6bK+0kZ86feietQ/e/ooLo57Mjmk0GsCiDCNSnHg4rlI3wpHfHB75elkXWB
vxIufrMah7wj0zglf3fd7oGm0KEVMy76XoGHneSqq476mPOCmUm3fs18lAxWPz50
8hwFhjl3JvOnawIeaZxMxb3bS624DR7BuSv4YeFbA3CFkNYd1fLgx67Rb2EaqRwv
n8SWCIN6lUT+eIb4GivH3mEKJX0Lp6ru0qX9zuCcZlcVxLSwO6+Wdm4qK9ml8fYS
lmUUIuctgLQP9dgJdZDwTFDF5+jSRB2Wwl8KmVlswxS8dXJCXA+zOgfdzlUCVcRN
e9b4cOSZSAMqwWaT1RIdjmiqqXwkBQqHx1lA/OI8nJvB+IBUiITcdK7sOjvaI1SE
uxIkJ0TYbHDF0dkv655vk2RJL/fJSFXxjnMUfxVq3DllqShefhhj9LtC+HsM4nVX
nk8Z8Hn2hDZps2l9gyrjE8pHPW01PMcgdd2AcVp0kheIiP+tUq0GPqN0EMIQ4tLW
QIppDacp2HyQ2b2xhP/JK/zAvMTBJQAdATFCn1sDfyyi5ao+IWA=
=jsnd
-----END PGP SIGNATURE-----

--4gJkP/sLXZFJvEdh--
