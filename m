Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88D8269B548
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 23:08:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbjBQWIs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 17:08:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjBQWIr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 17:08:47 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9238663BDF;
        Fri, 17 Feb 2023 14:08:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 222DB61F16;
        Fri, 17 Feb 2023 22:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000B6C433EF;
        Fri, 17 Feb 2023 22:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676671724;
        bh=1t0pBJdP957YXrIYQGiFboKRMoEVDgxPCx5fV+GEnIw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZY22n0IRRnwfr9ehXV/gmTdfk9xQsvfic2v0Gk3tyznJY/LTTF0uA/BvSXOOZwgA6
         nlgyK3XfEv3mpsnrSjLZ1kc+J+BBYwB22taOZuDhEt7GFTN5Lb+L6cuf3FNjo/sENd
         o+VIj0nmIKHnpNC9E8NjdeRCuF697vHD/1ILwR+aTTzQJsWORqEVP2S96SdonkaSkR
         3T2ryz8VYtcpVif6J3gQDIDtNQzW+olnpzrTG1qBy+boHbCoJFnwOxvxiPty+0sAmD
         WblYBdv0AmWm1CcX5IAm/wtDB5YZ/HP7fXPqE8096aRJh/g5/cfG1PvkXK6Sed9B7b
         xBOaAW7nms6uA==
Date:   Fri, 17 Feb 2023 23:08:41 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     nick.hawkins@hpe.com
Cc:     verdun@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/5] dt-bindings: i2c: Add hpe,gxp-i2c
Message-ID: <Y+/66W0e82yLL+8l@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, nick.hawkins@hpe.com,
        verdun@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230217155054.99757-1-nick.hawkins@hpe.com>
 <20230217155054.99757-3-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3eBGNt4B8cREnFZB"
Content-Disposition: inline
In-Reply-To: <20230217155054.99757-3-nick.hawkins@hpe.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3eBGNt4B8cREnFZB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2023 at 09:50:51AM -0600, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
>=20
> Document compatibility string to support I2C controller
> in GXP.
>=20
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
>=20

Applied to for-next, thanks!


--3eBGNt4B8cREnFZB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPv+ukACgkQFA3kzBSg
KbYcvw//YUQ4pnk1Tf/t8imMpJA8OQv/NpMgRhQZ+/AJX9YF21BJBnkGSHfKSdhX
L9XGwPdPbS/UH9srY9m1Rmruw2IbORp04b+UMH9xYqIYB1At6JOqcaQHiDaABz4L
ZpTSG2NoJail+UgMKEM/7FlC/pHr4HFrq3zdFx29/5jtp+DbfcVoY15LZCsmbV2H
cBokLb1yrgVcgJk9RCyFvzkpOHn0xN7oX29hSOYWjh3AFNeRcXtSuTwBCVcZIXFk
8xeI6Yn0WsrdpolG9zNrqGziy/xr0WVw2r/klwY9q0jT3F+ElV8Pxv2dB7hmf3rH
uJFjO7ZY2h435IKkIS3QChvGzwfepNLUp+BNaq1gCdOEUrAcRu6qAuCDwpHOQZ4c
EtKNcMK1A7ph9xLe0Q9+l7lTq3/KSYxLkNDpyb74uGPKpjN20NxjZ6H/tKyCp41n
dX+0o3IDnWn9zGgpM6HgdBwDsN2udPL/8Jb3z4dn5MUFiYwf2YIsXBsIv+ZfU25A
OUG8tpotKoGSg68v2IcG8EANtzBiRPAnjNCAvgcAgXiX0H576nMzcDxTH0gfauNR
BCyC4od/JwZameHbAeI72KuieN+y4ZlVTG3HAPSaU2OqhFGUspo2s4nszbVR0RCD
auS491UvnVP2I9Pm3yHK+Mmj58Mr356CektMKdSltVZXGpoEr1I=
=pHnG
-----END PGP SIGNATURE-----

--3eBGNt4B8cREnFZB--
