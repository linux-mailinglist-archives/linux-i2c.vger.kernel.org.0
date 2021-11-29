Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E02461180
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 10:58:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234647AbhK2KB0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 05:01:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232901AbhK2J70 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 04:59:26 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 070CCC0613FF;
        Mon, 29 Nov 2021 01:37:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EE1A56120F;
        Mon, 29 Nov 2021 09:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB53C004E1;
        Mon, 29 Nov 2021 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638178666;
        bh=Fnp3RhDbBTd+N/Si0zHCqyEEQ8HNT8WuTFzETcIGm3w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lIpx4Bua/YUGNKneTex9+IKZz93W8DKDgMNvLpA7/YIm+CI6Fo1nsCTxThnzgcrmq
         C2AxEOpxrU1/CVdYNjK1r9S/rNsbciftD9jIxnolz2UMUUGEJQP9pCOr/vht3yIiME
         xpCWtiA7hZhER17SB3PEnfpGrinP+D/dtXB+gknWMry9D/QrCDGovzv+VCt54k9E/N
         BOI+KVYFjqL+hF6j1K0ZNLYjqGTauHWz1hM7dUG/tmID0i+e0AYePRluK+dqvG6X2A
         6A9fb1/Cq3o5cSG+W+/gEI4T5LugIS72Z2DRUqeXYuIPe7IeewlidBbuqV9hLNtMn4
         hYgoR0lI7URnQ==
Date:   Mon, 29 Nov 2021 10:37:43 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Ondrej Jirman <megous@megous.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "moderated list:ARM/Rockchip SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC support" 
        <linux-rockchip@lists.infradead.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH] i2c: rk3x: Handle a spurious start completion
 interrupt flag
Message-ID: <YaSfZxtYtV+SfJqL@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Ondrej Jirman <megous@megous.com>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210924111528.2924251-1-megous@megous.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dHdtOdyzSVAJRQNC"
Content-Disposition: inline
In-Reply-To: <20210924111528.2924251-1-megous@megous.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dHdtOdyzSVAJRQNC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This causes I2C transfer being aborted in polled mode from a stop completion
> handler:

I wonder why this only happens in polling mode? The question behind that
is: is it really a spurious irq from the HW or is it maybe a race in the
driver? Because polling uses the same interrupt handler but just
periodically polls it.


--dHdtOdyzSVAJRQNC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkn2MACgkQFA3kzBSg
Kbb2jA//exKS6aQIdTvjz8ryB2xg8jb2xyVFPoVlmNgzqLv5zTKeG6F0sLFEgMWy
sAtUESQl2OHpLbG+XhfN7/hVgIOng97GmAuPQgEluKe75E+U5HUc12izmMEsBdM3
Y/3A1tutxyW+Zv5hddgRE9imPAAgVo+YQw3oc02Sfx+MWhqRgq3zN8ahNnE5EKhL
HwsGqD92nC4YkhENS2DqSbVQdW/FXxqYEHitnjziOploo/M3rbAlGMsZD7y3ZsEp
aSzXw86DWDzzmrLGPaeldx2hr86wnx87ITR4fDqDdFXEGv6HW1x4Kudl8aZGILRL
nbFOd9wN6lFudmSiZL6SRRJjZnz/weghpgG+5XZAWD64YydsmcL5/X/aE1U7Zv1c
UujkXwcYwYySXh9wOFHMJlxAq7A49C+Hu88M8DS+QAcsLUtE/CC+X8anHdEyDbpw
agoocQE2WnQzGRvEo3eJWyk4fHYgPPbyxdNJfOIXy+07XbFluJ1lEkjuDBV/BOjm
tLUrrouuJD4teX10rXDsLHHHmxhYOi2322s3KqTqlPgLuixVbCxJuRD1ht4tVxL/
eKwp+QW8ofgnm9HJpylOo3+/PMK/L44+H41JstGW3rzC9YslypSkit7hXNSk6VzA
AhTZ7APBX3+d4WMONyBE0pNktrz3xync2/B0yrEY8J7FRMvARV0=
=pHYp
-----END PGP SIGNATURE-----

--dHdtOdyzSVAJRQNC--
