Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED856AA053
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Mar 2023 20:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjCCTue (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Mar 2023 14:50:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbjCCTud (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Mar 2023 14:50:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D16584BD;
        Fri,  3 Mar 2023 11:50:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A5451618C5;
        Fri,  3 Mar 2023 19:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B697C433EF;
        Fri,  3 Mar 2023 19:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677873031;
        bh=skvuE4TTFMibNLUPAu/zv3xd+K2m+Il1wb3nlXTkHeY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Suf9n9hjoabhuFHaocnG9Dqqe++PL3etBXpWXEqC5zKHL+mmM5/tnA9fyTU+Ywa83
         OM6Tsd2mWMF1sGfiykLgYL9JX7Dt+JgEa18EZ22XwaDxEoHNKEsNL/JL6zQA4utAdG
         sLFm6ihDby8lGjd6xKO3JIXQLGnocu9OKCmWiprC0JNrLqh+aNB1ShVsDstXq2zx4i
         L13nvndTU2VJYwqKOBXwIWlvcqccw76itmSN+xbjE+d2sd+eZ08VNvEivWE/3bJ/EQ
         skO8m3G9tRuieHcto3C6mY0muMlV3bHXhju8wrYG6EVNhZRLTARpySB2yRjOLjj5YE
         y4Q13rYm5H+Xg==
Date:   Fri, 3 Mar 2023 20:50:21 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: i2c: include all I2C bindings in the I2C
 entry
Message-ID: <ZAJPfaY5NxxS6v3R@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230303082530.11878-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5UzlFTmsW+OHxgRE"
Content-Disposition: inline
In-Reply-To: <20230303082530.11878-1-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5UzlFTmsW+OHxgRE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +F:	Documentation/devicetree/bindings/i2c/

This entry is already present a tad later in "I2C SUBSYSTEM HOST
DRIVERS".


--5UzlFTmsW+OHxgRE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQCT3kACgkQFA3kzBSg
KbZyeg/9HGgtVwIZ5hdzbIgeB3QeobXF7+D3WmIwb6HGn/A+IC153BZRnTp2veVp
LG3lMgnC8woz31XGgW0MMBllQXvKNEnRnEDNpdAmMiUOoL/cvWZf0U9YU5lpCP6p
x4AYE6IHHD6A5Q7qnAs0it2KQ4s8DkQxWv930zQN2QUtn4C2hBgHkEiQpulHBWMz
BLc15pQDDSW+OAdCDikVo8nGQow80D0CTltKvbUAF05gJWK2jNDHyQXiZOrvF3sa
STfsUy6Hrh439948Kzth+j27x5FBzIBJZ/7vEAFNC5KOL6PQL4jygOO+O9ggbUWG
miYO7X2bFABxjPFlAAPMzmwusx91+3vxtIulEzfA8+NflEbb12UwS1p0MAfoV0mo
r+6Jn8KvHzl6vRW3VU6Bo0I+kKB4XIo41KpkhEDJCxBwpfUpv60ww3UZTgLS9u3D
ci+wD30V9F14Ti2cVwTt4y8L6QRecNldN4UfUMGJwXdlVWWXBiA06txboT9F1qAc
13RFg/OdeD7VsHaXI9B8bwQAvRPv0OBE5FHuYVEQGONyINCeQpR197l6K7M1PJfi
MKFxKnp99hluWmHBq8lrtb789es94eNRmL3Yet34l7BOtK0M8dYLbJXTwBudMLmi
WR9PkVvlSLgokZ7qR6wulYhJ0KI24M954tgWJjIWDIHgPpQP0BY=
=dxxo
-----END PGP SIGNATURE-----

--5UzlFTmsW+OHxgRE--
