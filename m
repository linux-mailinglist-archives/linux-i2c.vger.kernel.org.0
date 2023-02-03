Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A56A6689F63
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Feb 2023 17:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbjBCQfx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Feb 2023 11:35:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233186AbjBCQfr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Feb 2023 11:35:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36C821290;
        Fri,  3 Feb 2023 08:35:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 86A2DB82B5A;
        Fri,  3 Feb 2023 16:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8512CC433EF;
        Fri,  3 Feb 2023 16:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675442142;
        bh=pTbTPJbYWwczDyf+apoEywN1esrdcO9kPkvU1Zx3gdk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MlmD6fvYdvE2+t5UoWTXTLqmmbPwqQoTO+fgaUh+iTfNvq8JH6Wnx+FdyWP1PAoVu
         1thtCMM5mUy5gQ5IhMETnMJ3sS9x70aiRXPqMgIH/f8CfBC2rZVq9Fjp/5e4Vyy4+h
         fquZvvhfZd7CbIwVk8tgfMCf8j7qicbOJEfbtjr52HKm2qMEIaUZXE0D8tJg3kGvWv
         01MGMvvQtJwIRtBsyEAQTH/7KXCRWsjZG5ifFA2CJFHJd46G+jxnKGLrFFsbrH8SJH
         wLIolA3Vuf6206kkT6ll2pHGcDNb/o4ExntoTswlrXZEgIODdAcVf6NQHjGhxFq6j5
         ZFXXWz1DxXUYw==
Date:   Fri, 3 Feb 2023 17:35:38 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc:     michal.simek@xilinx.com, michal.simek@amd.com,
        devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com, srinivas.goud@amd.com,
        shubhrajyoti.datta@amd.com, manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: Re: [PATCH V4 3/9] i2c: xiic: Switch to Xiic standard mode for
 i2c-read
Message-ID: <Y9032pA8GVFbWJ0I@shikoro>
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
 <1675330898-563-4-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3pXYBDXwne4CtMpZ"
Content-Disposition: inline
In-Reply-To: <1675330898-563-4-git-send-email-manikanta.guntupalli@amd.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3pXYBDXwne4CtMpZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 03:11:32PM +0530, Manikanta Guntupalli wrote:
> From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
>=20
> Xilinx I2C IP has two modes of operation, both of which implement
> I2C transactions. The only difference from sw perspective is the
> programming sequence for these modes.
> Dynamic mode  -> Simple to program, less number of steps in sequence.
> Standard mode -> Gives flexibility, more number of steps in sequence.
>=20
> In dynamic mode, during the i2c-read transactions, if there is a
> delay(> 200us) between the register writes (address & byte count),
> read transaction fails. On a system with load, this scenario is
> occurring frequently.
> To avoid this, switch to standard mode if there is a read request.
>=20
> Added a quirk to identify the IP version effected by this and follow
> the standard mode.
>=20
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> Acked-by: Michal Simek <michal.simek@amd.com>

Applied to for-next, thanks!


--3pXYBDXwne4CtMpZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPdN9oACgkQFA3kzBSg
KbZwqRAAl4R+zhs1OOkJtWIwRw7CG6afKFfFngnA/fXBADLpXKYFV8bemkPFGGel
aevtILVkvkvNT3AvCIl6mNWTSwDmewwAXQhos4KHEHc+Rjssda6GRFPmuICqn0IY
Liy4EyMqeIYUsQcIxd3uOKaWxujiZ3fT+/PUgNip1Q0cqWc24Ji0nC1XL9Tk2Yif
QLAsyNUOmLRl3XqATwZWGaNX5wVjr/oeuiyDL/79wgdQIKab6bZhl5YRcccRL47x
uaVSNPiUptBk98WJYGBhOMLIU1+m6pCRqTbWIFRCLh5tCyg8M9tBFxBHHJ6BgMSf
Xy8TF+zYhBJPL8A7fb2UPgVHgHIlcmM2zo3WQaTTrqdTgyVMbI8HZOsSu5Dlmhn6
7TBCNRiGLAoyvxQmrKWtZcC/CHMkIpk0RTrVKn71cuLg68TTpR6/t5dpl/2e8nil
9FK7FP6XgYYX50XupveVln0BifomqZS/OUlXbv7QoQBAKLpouUCAOyisRgbHps9a
xtgDio8vizymh9xrOVpWcv1J9W2dwbqUubzBcMOe6SzN3Yo9QV6dZ3W6Qr7U17le
DAEsefeQfQDJsJR9itiGCGsWI98igvlGpoY2bjTOSV13xeceTGq/R4KeUSz25JIK
OuLSnCnKQPjirYBrLT8vKiN4H6sHxadCZ+LLQUtls61z4VORzO0=
=fLGm
-----END PGP SIGNATURE-----

--3pXYBDXwne4CtMpZ--
