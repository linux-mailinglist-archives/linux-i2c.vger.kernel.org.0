Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 710D34EA9EE
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Mar 2022 10:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234350AbiC2JBA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Mar 2022 05:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234344AbiC2JA7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Mar 2022 05:00:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 199181DE59A;
        Tue, 29 Mar 2022 01:59:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AC4E7615F4;
        Tue, 29 Mar 2022 08:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6B3C340F2;
        Tue, 29 Mar 2022 08:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648544356;
        bh=u4u0Oj/nXBybt46EJgPF/pPuLsbdH4xX+S6TUsf5Bws=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H/SGEVIrZnSvAuZ7Zt1Wwnc++TUokR+j+blPDTwsaWEoGGfzhC6gev1tedRFNUm4Y
         dblH1Kj4FvHxmJFE/tKcxekXq+IGDaw+1XFioR97CX5P8aHxYovlXw5ihm/mCtrbTu
         AYocTsmoIZHJfaONSCbH6dsCx5CBQUfhFzl/h1C9k/ebQFXc/A369MjwsqeQ5Wj7gP
         ADdu9Y1tAz8fEm5+j1Pk+MBuAkuo6wih2jFl51An30SkB9+k/HKuC9hhGPp6bk5d9I
         78lPIjdZwnsUxamf8pNQTN6Vi8wxKOSKW6wvzC1L4GttdhQWR3F37i4b8pfCCpJkno
         5OzsH1WezM6uQ==
Date:   Tue, 29 Mar 2022 10:59:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Nyekjaer <sean@geanix.com>, devicetree@vger.kernel.org,
        Jose Cazarin <joseespiriki@gmail.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1.1 2/2] iio: dac: dac5571: Fix chip id detection for OF
 devices
Message-ID: <YkLKW7pIQcf2Qbji@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>, Sean Nyekjaer <sean@geanix.com>,
        devicetree@vger.kernel.org, Jose Cazarin <joseespiriki@gmail.com>,
        linux-i2c@vger.kernel.org
References: <20210724000654.23168-1-laurent.pinchart@ideasonboard.com>
 <20210724154308.55afb03c@jic23-huawei>
 <YRwfpOuyVEstwsza@kunai>
 <YRwhej9Hz00qnvlQ@pendragon.ideasonboard.com>
 <YRwi62E4xYcMyyFi@kunai>
 <YRwoAgie/mDDunn9@pendragon.ideasonboard.com>
 <YkF99t+NlO+IKMXg@ninjato>
 <YkGIJ5MQoZ7RN6Y5@pendragon.ideasonboard.com>
 <YkGogxobUcRddA4L@ninjato>
 <YkJWZQJ2f2tyS6sH@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4/xIa57C4s+C0PDg"
Content-Disposition: inline
In-Reply-To: <YkJWZQJ2f2tyS6sH@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4/xIa57C4s+C0PDg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I've had a look, but it seems to be problematic. The name of the client
> is set in i2c_new_client_device(), way before we match with a driver.
> The name is used in the uevent sent to userspace, so changing it
> afterwards is likely not a good idea.

Okay, that is a definitive no-go. Thanks for checking. Seems we really
need to update i2c_match_id to handle the extra case as you suggested.


--4/xIa57C4s+C0PDg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJCylcACgkQFA3kzBSg
Kbbq4BAAjwfwH/GzKBWMz7XQORgDgxHrlNlEoHGfwSgnzTHsixbAM44xgl1ZoyGx
h4sMczAPYMs9SWhnREBahx3V80gzgbgrXcInPPaHO9twpxkzyZ5uPsFq2E3YO+Ud
Jw1BJH+ssyNl7Z9qLU4v2miY1eXP5aCyOPy9McUhrykI/hpMjfpQjOuKEKpw5ldA
C8hQGjNQOr7jLgC5VHSyCvCjFWERR/QKcfOlB8aB7TfwBIbclQsgsN5kBBLo+XmG
x272UmrFnICJp7TSYqqoUybfiSDRB5IrYx/ed26oZ0db6ZpM20zPb3iokkWH8Cyx
N9WWA4HeoAyYGhT1Bpz8koWtcKrOSb5IxFNxxdvBJJ4AsD+QOH9WaWZMxNnf/QCu
BLXg4SENMRckUxQC3bWCL0/VGCBsVOfqp3kHyHCQfWufsvCYaMiR0H/XKUnmQuU2
UpaNA1pNctcbI3TzHBJvnmtAKWNXoso/CUXFQV15/XgIs/FTpEtR9e38MJn1qUKZ
jiB+Y65DCtlzp53FBJ86CwzguOWhDKVg5tUSLqxL1y8VOjHPACzsrpGQawPLFv/q
E6uTF5cep7cI38x5Tr42VhFChjgUf2SS0eLo1e2fXzCbi4bxMWskaE1rTpDllSMw
yFUXOc0jIzuB+zWU6vaRmtPCGSehZvi12lssd1f1oJoL0UR1uBo=
=RA6W
-----END PGP SIGNATURE-----

--4/xIa57C4s+C0PDg--
