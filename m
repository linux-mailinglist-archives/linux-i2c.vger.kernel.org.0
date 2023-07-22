Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF6275DC5E
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 14:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjGVMHP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 08:07:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjGVMHO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 08:07:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 637E99B;
        Sat, 22 Jul 2023 05:07:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0147D60ADC;
        Sat, 22 Jul 2023 12:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505F9C433C7;
        Sat, 22 Jul 2023 12:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690027632;
        bh=LHu1mcnkLw/wuOC7LXCvVU6Rvr+BEi9/IVyMC9fsb4U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SViBSP2YUDRJc016X31tSNtmsh5rUmAESOoSka4YrBXSDvc2QDnUOVsTliGJOiKrK
         G5VeP7UaoZkb5gZmvBX75MWjuj+2uRKAoETBSuaECqNvWdjwsy5W2iyAt0qmCdCSPA
         wx+afve347o8vjijstygxQjFCB04WevUeuaZJ2/4m4UqHBDxJQq+1ROkXkqR3wcFjD
         YWPRvK+6g84h7ZO7pwDdE27BjKTOs0wOihpa+08vg+w2BWUHsumB3RPKCX9X8qScAH
         y4lSJNZkF3VS1sUhNOJzR7/yg5k4/qMVsZGVLSX+jOBNxUD2Qh3gPhF0Q48Ib4l+nN
         35kbaHIQ8j/6g==
Date:   Sat, 22 Jul 2023 13:07:08 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: i2c: arb-gpio-challange: convert to DT
 schema
Message-ID: <20230722-overlay-molehill-4213d2143609@spud>
References: <20230722095710.17496-1-krzysztof.kozlowski@linaro.org>
 <20230722095710.17496-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZlpMUJot7nwCApJ5"
Content-Disposition: inline
In-Reply-To: <20230722095710.17496-2-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZlpMUJot7nwCApJ5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 22, 2023 at 11:57:10AM +0200, Krzysztof Kozlowski wrote:

> +description: |
> +  This uses GPIO lines and a challenge & response mechanism to arbitrate who is
> +  the master of an I2C bus in a multimaster situation.
> +
> +  In many cases using GPIOs to arbitrate is not needed and a design can use the
> +  standard I2C multi-master rules.  Using GPIOs is generally useful in the case
> +  where there is a device on the bus that has errata and/or bugs that makes
> +  standard multimaster mode not feasible.
> +
> +  Note that this scheme works well enough but has some downsides:
> +   * It is nonstandard (not using standard I2C multimaster)
> +   * Having two masters on a bus in general makes it relatively hard to debug
> +     problems (hard to tell if i2c issues were caused by one master, another,
> +     or some device on the bus).
> +
> +  Algorithm:
> +  All masters on the bus have a 'bus claim' line which is an output that the
> +  others can see. These are all active low with pull-ups enabled.  We'll
> +  describe these lines as:
> +   * OUR_CLAIM: output from us signaling to other hosts that we want the bus
> +   * THEIR_CLAIMS: output from others signaling that they want the bus
> +
> +  The basic algorithm is to assert your line when you want the bus, then make
> +  sure that the other side doesn't want it also.  A detailed explanation is
> +  best done with an example.
> +
> +  Let's say we want to claim the bus.  We:
> +  1. Assert OUR_CLAIM.
> +  2. Waits a little bit for the other sides to notice (slew time, say 10
> +     microseconds).
> +  3. Check THEIR_CLAIMS.  If none are asserted then the we have the bus and we
> +     are done.
> +  4. Otherwise, wait for a few milliseconds and see if THEIR_CLAIMS are released.
> +  5. If not, back off, release the claim and wait for a few more milliseconds.
> +  6. Go back to 1 (until retry time has expired).

> +  their-claim-gpios:
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      The GPIOs that the other sides use to claim the bus.  Note that some
> +      implementations may only support a single other master.

Where does the maxItems: 2 come from?

--ZlpMUJot7nwCApJ5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLvGawAKCRB4tDGHoIJi
0jJhAQCbYOZez/5kf9akM32O2aDza6i0f9bNeZ80SrDUech7fgD+O0SMp9cHjbFS
IVJ6YbJ/S8pfSac/P2s09mqXwsGiUgU=
=Wp9x
-----END PGP SIGNATURE-----

--ZlpMUJot7nwCApJ5--
