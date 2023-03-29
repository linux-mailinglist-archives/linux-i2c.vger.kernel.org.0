Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A98336CF2B7
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Mar 2023 21:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjC2TGw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Mar 2023 15:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjC2TGv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 15:06:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4283A1B9;
        Wed, 29 Mar 2023 12:06:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E5A49B8235A;
        Wed, 29 Mar 2023 19:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA82C433D2;
        Wed, 29 Mar 2023 19:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680116807;
        bh=q/U5avzn72Jn5Q/eZEikryn+q8BmIt1YiCsEgFl3/q4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AbHMyTqw+EzYqxGMFMS5I4x+xt8Omd+KNiveCVi58tp208sw723CMhCR72QxKVPCW
         qBxYcTYyzCmn7KGDNniEqe/tbr8m3khIFQXX3wOXFlihIoicGA+aO4k9TTaKxLRzK7
         OQoUS6pxwOsIZZaQ2BozIofbzwZbiJPgZQs6QQGiWCwnkTPKu5TmqS0ZTR5xM2nmuh
         jG82Pc0trRzth7s73APG/kUmEQMooyGpVNZtZdkTyP+z3xzFso5M3tecnMAakmmjCS
         wvou73Cnjv5HRHlAuvgcFacvapvo2ZolaA4JllRXwT8qQxn6KQG5QLXSjT0evFv+T5
         xKIRDmzaNJkEg==
Date:   Wed, 29 Mar 2023 21:06:43 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v5 0/3] Add the clock stretching i2c property
Message-ID: <ZCSMQ223Org0nYCI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
References: <20230317233338.424864-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="h6PxPVkC6JBTngwr"
Content-Disposition: inline
In-Reply-To: <20230317233338.424864-1-andi.shyti@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--h6PxPVkC6JBTngwr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The DTS schema has been applied in commit c83dd2cb836e ("schemas:
> i2c: Add the clock stretching property").

Everyone, A general remark: If bindings for the dtschema are added,
please include the linux-i2c mailing list. This binding is OK, but it
would be good to have the discussion also here for additional input.


--h6PxPVkC6JBTngwr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQkjEMACgkQFA3kzBSg
KbZFnA/9E1rmom/5Oq9OcK38Z/sRouazvDHkaGmt5ICNiZP4a+Ygy2U/tecFObyF
4GDytiFHUlacjttJy1M2/dvIHQqJcKJV7P30ShVMs9kKMDu5uRO9g9jkWoO3DIEc
/xvCQgTia4mkWBoa5VLOLgYXbSVdEkpa/hYIDmDHizAVOTTZkK+ER8UfwW1i27rc
ujKD6mMyFGDMik0fGTgASllwZqjrCZvSziRtQnv2D+XCqvCQmxTpP+EBe8BrfWSu
c7RfPYVsBEyIsrLUM4qKuQbGOAJ7B9hNlPKX2LdydsN79dsSKeI7f8unOoH8le+z
cqPiWdQWG5HibDnpSZ/lUxqM1eYW8FoQuSVuhdoJrKI3sIzU7HDOzYLhOGsooVMe
Unk/fzAyBHfCishWbJUv5e4cCIa1xJCohfRhwqBcTheh4B++mfcIK50+JsUJybJV
bl7Alhshp7AM3Tj427PPXDMx+WTzic2Wk6NPsgkmwhda/MYpn9elT+XLS/qKz+rz
3oVEm2cRCF6o/wOSNH3Xi2kKMD804VxeC1HNxj5PaaHten6zFDm34y+Vz9/yjcxU
gFJzoSn8DOPPTgRDoYu8GHhDLrQmV+2n6QvdvuwuUuC4ZEdhzGiMQmYxQcwQJOGj
nWluzRQfYeyyMDOsFRO/426PTAKazSDmDT/Ccs00DyhKNVG/LZ8=
=67NN
-----END PGP SIGNATURE-----

--h6PxPVkC6JBTngwr--
