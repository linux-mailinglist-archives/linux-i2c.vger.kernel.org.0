Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFD7F6CF2C1
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Mar 2023 21:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbjC2TIn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Mar 2023 15:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbjC2TIj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 15:08:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E000F49F1;
        Wed, 29 Mar 2023 12:08:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 93777B823F4;
        Wed, 29 Mar 2023 19:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A89C433D2;
        Wed, 29 Mar 2023 19:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680116909;
        bh=WQo7TFtijNQFhoJAM3AwfZHRhJM0xXZ+NbBR2qdKp8Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Htmb89m81hQQ1YjjQApV3FfMLPzw+89o4vUAtGGEgB90ilbdXkajkhguYrFvAE4Dh
         ZPcL0Y5i/O21nSXdq61tkqTBiCH8g+cjU16Q2/c55FMapXTQOP7uEv2kEM+iBcStLl
         A+7VVDtmLQjet2Uos/3231+YlhPykKgypDXmj9OppZIkMzqsddvidKS4DX/PrQzgMv
         88dye+6ZijFwam0nWrI46RosYiuY9eu00CuqBjUrWlMJqpIsTyhO1VcbFvBRDbxWLA
         dTx63a7tdwZR0XG+x0WqSq68Mox4LQ4xuN5j0Vc0LWv+Vp3n8boQ1a95u4s3pD4WA7
         77zIVYUhUDdEw==
Date:   Wed, 29 Mar 2023 21:08:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v5 2/3] i2c: mpc: Use of_property_read_u32 instead of
 of_get_property
Message-ID: <ZCSMqVsd51rZe6SU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
References: <20230317233338.424864-1-andi.shyti@kernel.org>
 <20230317233338.424864-3-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oBOLTajA4eZuuXGf"
Content-Disposition: inline
In-Reply-To: <20230317233338.424864-3-andi.shyti@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oBOLTajA4eZuuXGf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 18, 2023 at 12:33:37AM +0100, Andi Shyti wrote:
> "of_property_read_u32()" is preferred to "of_get_property()" for
> retreiving u32 from the device tree. Replace it.
>=20
> Suggested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Fixed this checkpatch warning:

  WARNING: 'retreiving' may be misspelled - perhaps 'retrieving'?

and applied to for-next, thanks!


--oBOLTajA4eZuuXGf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQkjKkACgkQFA3kzBSg
KbY1nw//cDWSS0cJz6qg5hcZ23p4PlKA3lcW2xPIS1m7myWBRSm6FZVDajhL68q5
Y0HhrMApMSqlsI9itfWxJrEwrPFQTkhK4bBFhmr7YOl/fIFewy8ab+EnMFUB4Oth
47BbX+7l6cHCizY3D/xgnNYCoUe2nIsFPqwZ2OP8+36Hn4bXkfg8ewBW6v0fVrYK
52PempM+W80b7SXHDNWtV9KskUeZeTtBUQtkEv5U9DP0i+utxSBBc0NQRfVPcv2i
N6r1C3gHQmDeRD9A3IwfKHlcCkTfPTUajSKvRIvEOm6+MmcBNWt1xBEjc9Lh8dlp
SodeLsPOA/jwtCLtDlQS98zaDZcgXu0v425SnEufXCLkNU3jxxTeICw7+r00R/Ph
EGFWYAd10aTGUcZmR9BmED4x9TULSuM1W9PXXKY8YkxbH44pqrI8CsSrYosCReMw
pcQxKIHNaPFlWUQCLWGRjwrLBHbkkME5cTRuf7oHUqvjZqYLSRL7L8A43OsWJQsu
dR7LVav+Owv3NWw2YPLJ8fIDM0FbQFOa8oDNVXWmAjFmh8CKD3DipaZ8y8hxqxEo
DAr8EraFmtGBU+VEWmCdieNlcnRfG8k6PCgdkL53CUNqeio94USZpxaSGD5va8+H
jOiBhr0LxSBC9XIzmH4kGew6GQ/YcApmr2c8kjx53Ez097ZcF9c=
=wqpl
-----END PGP SIGNATURE-----

--oBOLTajA4eZuuXGf--
