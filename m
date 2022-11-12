Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E47AA62678D
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Nov 2022 07:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234769AbiKLG5d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 12 Nov 2022 01:57:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbiKLG5c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 12 Nov 2022 01:57:32 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F0961BBD
        for <linux-i2c@vger.kernel.org>; Fri, 11 Nov 2022 22:57:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 62ACDB8286F
        for <linux-i2c@vger.kernel.org>; Sat, 12 Nov 2022 06:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3ECC433D6;
        Sat, 12 Nov 2022 06:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668236249;
        bh=mEXGeVkGKj/4iSCfDDvuEVU/OxzlB962tiktRQJtuyg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=onsC1+7utSvQ9TMywoypDRwVkPXHCSkL6Gm/njgzlax+0cX9xJ23q87gztGrjd2bz
         XQ7NE1T0/hncVY5iOFzbnCm88Hoq7LRZVtljO183uJUg19+GK+ziCjPTGpAh6cGj9G
         ItSOuIIn1YWkhawBWcbLzfo4a9ONmfvlkYf+HfqdzXchZHhON+XL2iI/Zk+ce3U8Gr
         P90HswsqKbrjz4Vxng+Fpp4m7qeyYmEG64A9uiU0InUFkRtLe8Y22KRuFS1t3vhXTJ
         PmgnXYByU/9DIzJyEo0pj6Pq12ijXcu953HffpaaSG27+esBvRbmiXx1jhL4iWYTC6
         XiegGfvvSZsXg==
Date:   Sat, 12 Nov 2022 07:57:26 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>
Subject: Re: [PATCH v3 00/12] i2c: designware: Slave fixes and generic
 cleanups
Message-ID: <Y29D1it8tciozt7x@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Michael Wu <michael.wu@vatics.com>,
        Tian Ye <tianye@sugon.com>
References: <20221107134248.864890-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZA1ZVr/fA0QxF7+I"
Content-Disposition: inline
In-Reply-To: <20221107134248.864890-1-jarkko.nikula@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZA1ZVr/fA0QxF7+I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Version 3 of the patchset I sent last week:
> https://www.spinics.net/lists/linux-i2c/msg59046.html

Applied to for-next, thanks!


--ZA1ZVr/fA0QxF7+I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNvQ9YACgkQFA3kzBSg
KbbrQhAAoUGzhU7kh7UfDZXMa0+pOR2cdZ1mH4e27tUEdpPUvk6dsYcCRYvWhDdV
Yj4gNjpWg+9+E5wYLFDNrPsv7O9DfhB4QMDOry0QHxnyqXBJNMcN08VKWnIbfBuX
eo5ccZ2m9oy4jei9l3wodOPJNTLagzvBOvsJaNAv+Y/Gg41yyr9oEWMCQV57p+QS
ooa9YIrnTdYwD+mSnFDEjMwiYv+hwQ8W0hwQd2Hdj435bmXlagw8uRMnUivF63cv
tJ0R3Ke+yYrW3JqF5cYyBZzSagCJWyC6Jw+zv2eR6rJYKW8ioOQoq94/JqvbGSfd
fMZB9p2YfePl5LuLqFrjw7d3CN16Ct5nJvq1acQJyPHrcFFhpm+ClxoFMxTWGkvB
HXdcFImYZe1e+3TRxh1DtNx1dGHUPN1AV/MBgRoH2yBB1fjcl7D1A8PL+mXPCei8
F85dDhGVJaSHLAWPsMH3qtLJXM8ExyAgVLBEj7tmnn/HjqlPXTqkIrqbFCrLEEwZ
BuzRqHTAG67DmOMIE6sQZA298IOD21iRgC45Ek5s/Hjd08HWk8Envzc9cSkbIop8
+Rtsh8iZ5WHEKS245EMla7qQxAUar26qYszGBsysoae925kYFZvNP2pYsgweAs0v
4ey6G0dD9wbHUMdO2GnD2QWy1VRXZ7M5tVBVXULQmSjn/S+GRjs=
=CZyR
-----END PGP SIGNATURE-----

--ZA1ZVr/fA0QxF7+I--
