Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9967E693A33
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Feb 2023 22:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjBLVMI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Feb 2023 16:12:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjBLVMH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Feb 2023 16:12:07 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B7EE1115F
        for <linux-i2c@vger.kernel.org>; Sun, 12 Feb 2023 13:12:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9BB5D60DE9
        for <linux-i2c@vger.kernel.org>; Sun, 12 Feb 2023 21:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DD9C433D2;
        Sun, 12 Feb 2023 21:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676236321;
        bh=EaqlxLIRLGLneL6rb4inn4wdXZG6vsEoju67yA4eiYc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bwnn9XS1Fc2HVQZt8zD5KCT+rwx9QonWT6vfZmkTVu2IIZIJzSs3kKHPASKV5Zmsi
         PaLj8HmW4thxZJIcrD7OiJUX+o9lMxw3U0vLhY16dHoH8xrv0C9VEYI09d3eoEMBbY
         XUvxKOwULUdHeZylXUv8RrafRgFNs+gWMhJOLUTOtmeu5uKIZYy8Km3M+cEBTAcvy2
         +d4cxfvNAPof5NlkqQm5jyHGT3POEpY4i/bei8w79hC0sIo/O9RuDxuOqyaav2X++i
         JbXifJW0Zjnj9YvdCiXsUxYjR7ThF77+efpuCIAIVz1trAJi+uGQQH+n8Jhoqxq4kF
         09KX3zjo3QqGg==
Date:   Sun, 12 Feb 2023 22:11:57 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 03/10] i2c: i801: make FEATURE_BLOCK_PROC dependent on
 FEATURE_BLOCK_BUFFER
Message-ID: <Y+lWHVwSOLSFIMX6@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
 <50f333a1-2f62-4a2d-5527-7a17eb49ec68@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p4YrXufKvD5/RBnv"
Content-Disposition: inline
In-Reply-To: <50f333a1-2f62-4a2d-5527-7a17eb49ec68@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--p4YrXufKvD5/RBnv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2022 at 07:15:25PM +0100, Heiner Kallweit wrote:
> According to the datasheet the block process call requires block
> buffer mode. The user may disable block buffer mode by module
> parameter disable_features, in such a case we have to clear
> FEATURE_BLOCK_PROC.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--p4YrXufKvD5/RBnv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPpVh0ACgkQFA3kzBSg
KbZQhw/+LEky7divbO5u/fgXdh5fTPjgCj8b6RTYvqoH7OjzLaA5PmlOm6lsXdzx
v4DyxiYtMQcVRd4eaA9MfBWoiZaVgLUGNRtWXF9XdFbDWogg8BVZhbXHGn2SRP9W
240QVlyT+ObNymB2kWYW/r5CO/jZKyFUxL+l8KAaRV5Jo8TKcERea7whrgaJWRsy
6fR+DxAf4ur9VFHl/P+2hGLgth4aae+KSPD90tCx60xsAmh/jmnDvI4QakeN4oN9
tSg8voBT94wxrlgONPnyrvXOqQ64t/DFdZcaQYM2j5ZLdvYjZMO+MTI8QloPmwPI
Go3mMv2a//HoDzok5Yt+u+lTLPD8lCylQyJQqPn3yudME2LDwVVT+OcYSuCCHeQ4
CLVtcY6l8DZKLXm8I6UzvYVcVHpd3UqCVa92LDsBpQF8bAZLuCSVPmyUnrL5crSX
vNho8w777ffO23RyL8XsSGFEqCC9yYq3An02wF7dWzwjJJofxlElLIihp2U0pYtO
D73I1uBLE983IVooGq5Wfuha9B/VBDZMhbew5NA5x43GWigkUvqdZQSw3u1rbj+0
BS4wvZuou6d/eAnwMlL1GmZ2CmFI/9nWoyR4F49a4se8GbOybko35fxU9m99jT/T
YPP7iH1b/djCk0EbUV0fGjGAacwbBdcftkQA2xGG3nFda5L9OmE=
=nEVk
-----END PGP SIGNATURE-----

--p4YrXufKvD5/RBnv--
