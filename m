Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D58724A9F5D
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 19:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377635AbiBDSmX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 13:42:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377640AbiBDSmX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Feb 2022 13:42:23 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED393C06173D;
        Fri,  4 Feb 2022 10:42:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 6A9ACCE23D2;
        Fri,  4 Feb 2022 18:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800C6C004E1;
        Fri,  4 Feb 2022 18:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644000139;
        bh=gbXlMQkTm6wk7+jYJvwk8s0/hMYzA2jyIoBYYozqmyA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dGWkBTcMQktwcODnovOxids+lkqYf6w6wqbtDvlu51ixa3+5XGKWPXquW/srC25Q0
         bMaReUQYWC/zycxF12aq1/o85PINE5Eb1pfaa66382MgvoF+pE06XpZzmtXdIOnDtX
         1K74SR0l6L0tgkt+GhSgMKi/ujNp+7eMnUmAFCugyQm27OpFci1jHWraMNlC18x9vY
         HcTyqlbcaMDdSmEs1dDV/mKtBhboEzMy+bQU5OUIGgZUD1zKX6Nim+Kjucq2CkkHo9
         hThdYWCXtzVcn20bIlOMQLRl0Lpm0nbQOMgkz3sb4ILVH5fOv+YtJLDeHXrVaYq+Mj
         9UFuzTrFSMO3w==
Date:   Fri, 4 Feb 2022 18:42:14 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linus.walleij@linaro.org, Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: i2c: qcom-cci: add description of a
 vbus-supply property
Message-ID: <Yf1zhojUSxlMNZgV@sirena.org.uk>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164629.1711958-3-vladimir.zapolskiy@linaro.org>
 <Yf1q+wlXo2LAeZX+@ripper>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d/jMTsDZb3DWepCt"
Content-Disposition: inline
In-Reply-To: <Yf1q+wlXo2LAeZX+@ripper>
X-Cookie: Torque is cheap.
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--d/jMTsDZb3DWepCt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 04, 2022 at 10:05:47AM -0800, Bjorn Andersson wrote:
> On Thu 03 Feb 08:46 PST 2022, Vladimir Zapolskiy wrote:

> > +- vbus-supply:

> I don't think "vbus" is an appropriate name for his. Perhaps "vddio" or
> something like that would be better.

> But there's a bigger question here, this is not a supply for the
> i2c master, it's simply a supply for pulling up the bus. So it's not
> entirely correct to specify it as a supply for the CCI node (which is
> also the reason why the name isn't obvious).

Does the device (controller?) not have a supply that the I2C bus is
referenced to?  If so that supply should be named.

> Typically we don't don't mention the bus-supply because it happens to be
> pulled up either by io-supply for the block, or by some always-on
> regulator in the system.

If the bus is being pulled up to some supply other than the supply that
the bus is referenced to that doesn't sound like the greatest electrical
engineering ever...  without any context it's hard to comment about this
particular system.

--d/jMTsDZb3DWepCt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmH9c4UACgkQJNaLcl1U
h9CM6Qf/WkwweKjs1czu0qwHwz5DI1EMVc0CWDqBRE/GBJQ7YC6Rle27N/g6Kff/
IftkieaWxTG5zJsP9y5vs3BJd2I1ArDug4kfZFjg00PeUuizJ/5VcTmo/bLlYz4o
UWCH0CSX3SJ6kPXxzx+9NBzYy/rytf82p4yWEJDg3D4bHwqVCbNTSAUN/IL82kXx
D+ao+thL+lEN51KyPlhCtsCUXlua4TPYMuDBoFXOFV7NyWRcamyz0YFPVvEPmBGL
JsDe7uH2rkj697orgYRYkyZFOlkvee5pFS/uIFamTXNg2kUGby+0bbjXAmGTQu0i
8esmqS0psl9WN6h+VKqW+NA5v6VuZw==
=ueXi
-----END PGP SIGNATURE-----

--d/jMTsDZb3DWepCt--
