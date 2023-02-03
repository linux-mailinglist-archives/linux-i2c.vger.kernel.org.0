Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45820689F5D
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Feb 2023 17:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbjBCQfb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Feb 2023 11:35:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232356AbjBCQf0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Feb 2023 11:35:26 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88027A8411;
        Fri,  3 Feb 2023 08:35:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1C97861F7D;
        Fri,  3 Feb 2023 16:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6A5C4339C;
        Fri,  3 Feb 2023 16:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675442124;
        bh=/xuLcChyU7Pzr2vcsg493O/hVSbnaqC1sOgZcvm3wb8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JwFKDf9O6ztCdu09S6c3i156FoqGbMGLjMOh550zDhq9gmif4NtgqWrs7uBSGSlJq
         ylfB5yKVouipjPafxjns3jGiGU6epzMow/pYVqaGcPsKBnbjffJc1EIPOb7YTWSS3D
         qTvLXJf34OQAQZECd/krqTUkEXAb610fmVqhAEuL+MtVburpBXL67gRTC0AMJopZjn
         ypekEwNlaXIg9ZyEPzDzKOELZ4APziq7PRWs1eH4YD4SG66hWP1d+TFFwYPFnc2PVT
         Tak556qfq4fhscrLp+TKsaTB+72u9Z4coJ4zzqbAITuLEunZJsXRjf+1BE+5/QJ3w8
         IajnbZrEghb6g==
Date:   Fri, 3 Feb 2023 17:35:17 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc:     michal.simek@xilinx.com, michal.simek@amd.com,
        devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com, srinivas.goud@amd.com,
        shubhrajyoti.datta@amd.com, manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: Re: [PATCH V4 1/9] i2c: xiic: Add standard mode support for > 255
 byte
Message-ID: <Y903xcqw6DXnrvbS@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
        michal.simek@xilinx.com, michal.simek@amd.com,
        devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com, srinivas.goud@amd.com,
        shubhrajyoti.datta@amd.com, manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
References: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
 <1675330898-563-2-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jfKArVcXu/70hkcU"
Content-Disposition: inline
In-Reply-To: <1675330898-563-2-git-send-email-manikanta.guntupalli@amd.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jfKArVcXu/70hkcU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 03:11:30PM +0530, Manikanta Guntupalli wrote:
> From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
>=20
> read transfers
>=20
> Added standard mode for AXI I2C controller to enable read transfers
> of size more than 255 bytes. The driver selects standard mode in the
> following scenarios.
>=20
> 1. If a single message request comes from user space, requesting a
> read of more than 255 bytes
>=20
> 2. If a message set request comes from user space consisting of many
> messages and if any one of them is a read operation, irrespective
> of the size of transfer. (This is done because it is observed that
> repeated start operation is not happening in dynamic mode read as
> expected in a message set request from user space.)
>=20
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> Acked-by: Michal Simek <michal.simek@amd.com>

Applied to for-next, thanks!


--jfKArVcXu/70hkcU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPdN8EACgkQFA3kzBSg
KbYD6RAAo+9VdhdbWabq4Bh4ga6uNf+ompDhTZ82L9PP8bMG6Q6m1o1vdH6Qo6mK
0ToFeDFBP3wSoRNWo6pVwCn7N+8aefGhsFbUXPnqZi/pGjZjosCFYn4fI7YQJdFZ
ETJAkIBhKTYHzg1sw+xOxVsDilAkE4JpWdM8HK2L4dmFMgnyFeQSjrGvEz3Pm3mV
qsZaZDstktFw4YzKimlLBINSV5QtWsZq8KeCo/SkKNLW//lBtoOlIfsdU2vcYDh6
WPsV7DPy8JhPTVkCs5fjg2aRZEmxCznQmoPVFtt2Mb5aoJi0la3r2pr0KmS3kkBr
QuECjc3BDoPS5tuegXUVULcvtQmyzVBS6J6VmxEONn/D0tCjZAm7qMdArXe/S3ns
FvK6X8hLmKTFrasoEdDtK99zs0780dlwlznSJVFobs3WpdSIeZ1IZpTiNYf6JhT4
o4sfWhXXbOmfqs3mPFHEx1JJLtftEZLN/75Z74mJgnnNKzfVWAsncj/Qwgyc6GMV
dyP5/1Y+6TNN57wX6PemptkUadK8gaqbxOeXktzmR7Eul4KE44qrcMzpHLGKQIv3
XIilGPexyvwivS0eF6CRUwTXbf+4dRW29D3oPNDdFw+M10ntcHy7v+lyJWJ/rqm4
s/mXEShk3ur1CT87WazmaBg7Cu/DuOov7DYSBXR59VLnsMufvTI=
=84ht
-----END PGP SIGNATURE-----

--jfKArVcXu/70hkcU--
