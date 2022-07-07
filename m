Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B818A56AD3B
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jul 2022 23:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236562AbiGGVJX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 17:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235575AbiGGVJV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 17:09:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071591C108;
        Thu,  7 Jul 2022 14:09:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B1FCCB823FD;
        Thu,  7 Jul 2022 21:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C348C3411E;
        Thu,  7 Jul 2022 21:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657228158;
        bh=6krTAHwFw5x0U7lXZFEFY+uwkkZbcGAH15gDhbYLZwM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ga/Eg8he1VNjTwBK41B5yYfJYSptChGMWMA+R6lCpztF7tZajil53T7Qq6HpZskYi
         Dt66uiBvx/L6DBZoQhh3reKkpIXFjf9TEtHVu2iujHESQe6IqCKLdEv0b2qdCtzuAz
         QHro3r5Os2Q0y8XV/8KpK5CKWuXiCfjky1t5i08QIJk65RnbChP3oa37U3M960I+L1
         CmmrOKdaQ8LtgMRp/ah3lp2UJTOziUimDe5XlODUkVFLelit+55xchlMFDiG7zyegi
         joDUwMMMnnHXHnVpYxVIBFHi6f6FxrXX8/7t/gREyg13EHBvgn4J2aJkM7bY1xCek0
         3xXWMZ8DY5xMg==
Date:   Thu, 7 Jul 2022 23:09:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-i2c@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 1/1] dt-bindings: i2c: i2c-rk3x: add rk3588 compatible
Message-ID: <YsdLeaGJGf7FFIK1@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@collabora.com
References: <20220623163136.246404-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6ILHCh8oIcB1AeoY"
Content-Disposition: inline
In-Reply-To: <20220623163136.246404-1-sebastian.reichel@collabora.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6ILHCh8oIcB1AeoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2022 at 06:31:36PM +0200, Sebastian Reichel wrote:
> Just like RK356x, RK3588 is compatible to the existing rk3399 binding.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Applied to for-next, thanks!


--6ILHCh8oIcB1AeoY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLHS3kACgkQFA3kzBSg
KbZbdxAAh0HztJSdWzgE6pvvDl4NPTDHqvu/WoFDZb4u8b3JEuS5aBbnq/88tdXd
ZvEuui8kTRfTdlFtOhg8Hwht0JDWR5gIxoQUn4t/wXos7pACFutNe2aB4PqgU+JR
wG2rNirDX0xKW9zkUcZkSBH9cjvWxrAbUuAwiek+cc7jJvARTLe90PgVB7pe4yP8
rYPUEXXhLsBxQCTxneyiiqVhm0SrivIJtGBMg1ZenNxvcuwJheURRVakm4CTzw14
FMWMfCAYnqNvfw+4FiHKowrL0PzggoFCUZm/5Mn0mBa2cpj6nXtBpkahBwJ3qoZN
wngs/Otsmsnzm5jyAjV3SlPuYjVpsWAvijkMIuGhIyLwHV19QTy7DkArTrpz4NKL
r0u39rnxauNqnrV1uD+Nbl7vH6J6sowm94iDGb/Vv20DBFLRHPYBbxAU3dW9Iyjz
HRJCKAKsDybpYcyIVp2gWWT9sINkYTxV0EQeNnCIJSCy8UUDc3zYcq/j5Nz4HYZt
lMzEwSTUpdm1yzvFFk02ewmTkraoos4QouLuljCP2qsMdlhyvdl6RdS35Gt34iVE
qncRgVU6s0Xq5ELw1H0VCsL4w3cI8LLGDcIA2lLg07PzrQ30hIakOPikmK6YL/Lw
W70ueL4eaj8eFbU33cueytdy/W4/bWkw9Hz/DpD8f0/qriulrmA=
=OzcX
-----END PGP SIGNATURE-----

--6ILHCh8oIcB1AeoY--
