Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE1467B342
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jan 2023 14:26:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235018AbjAYN0O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Jan 2023 08:26:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbjAYN0O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Jan 2023 08:26:14 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF3BCA3D;
        Wed, 25 Jan 2023 05:26:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 45F3B61449;
        Wed, 25 Jan 2023 13:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522A0C4339B;
        Wed, 25 Jan 2023 13:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674653171;
        bh=4knBTTiGJRaC5brOKaa73+KxU383zntAlCPiXzrwpwY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ncNsVOtK6e8FtF0HtPIoVliygz3BlwNpL4niAjDpRDHrFJRKd2H877Pq1/iFh7M81
         mbMTnKQ/+7N+ZM0qXMeCf8PYG0klzXlpnQVjZMj2gr55+qaRdFFzC2c5hUFQuJ80pT
         rD08onpfJVqTNj/svbnFwlM9aJH40JR6zalz4bAs4p/FGYnV7JNtLaubt9RSHUN2ej
         A39hjg5x/J+9WxyjYBVYV3SEUje6/187EE1WVlnlDyMFCWJKyKlBnk/SOXM8eR+ltz
         iULGsqn5khkeDBRjASmB86VuGJTL/TJg01fZxI0Yuztj556k/IjuOLkJf9tmnMftua
         J6+PBlZ9VmIuw==
Date:   Wed, 25 Jan 2023 14:26:06 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend 0/2] i2c/extcon: intel-cht-wc: Lenovo Yoga Tab 3
 Pro YT3-X90F support
Message-ID: <Y9Et7nlUmiiPrFUQ@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230125111209.18343-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IPNI/dOR7wHBaljP"
Content-Disposition: inline
In-Reply-To: <20230125111209.18343-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IPNI/dOR7wHBaljP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'm resending these 2 patches since they seem to have fallen through
> the cracks.

Which tree should the patches go via? I am assuming not-i2c, but maybe I
am wrong?


--IPNI/dOR7wHBaljP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPRLeoACgkQFA3kzBSg
KbYx5w/5AbRWMIf4Uu2pAPcyNVmQyy4QuF4BJagxdaz+M2RXNaBlSIb2aI2zP28S
VFFlKL34HsOaOFWREPQpYGTbh63xvh/CZ6aMDmpXROxHFPdwhgwmWj4giEwfsdeq
2hlA6l0+CJBAHHxJutdYvl+NesNWnEQ1dEVAU82MQ4Ox4LYqDvskaOggGhQ+jZoZ
Jh4ZdNPXc8t/fULGfXc/9300eHNGo08Zkl0s1FTYLSsaSO+KutJYwmP96ZNTFBU8
L/sRqe6Xs8IXF++Mm7QkDSTrdROhAeWm8iZVmducHlQ0HDublqWNDJyZ/QUl9lMC
ydx/mMY0nPdZWAFijCXzCnCFoWzqmgEovoVTD8s0Lc5CZdgn2JMEchyts3x/zia5
dWDPfyjThZmMyKEoZEQ0xPjWV7gdNLyb0wwoUINMB+GtbFIm651qQyXBXIYDjrgn
n8ncDeL2YWMD3z68cVhydt1ukTuquOt2Hy5Q0/dHZx077BzZ7cz8Ve3fySvuOyL2
8LlkBOz5x/SmA17jWBsJkf3Y8AP1Fm1lyO2Micn2PWA/Kn9DIHcZOBL2uruKyF7a
JNGB0tTNzNxl++K5XYUelah9Bc9nEowWnRLm8TNLSOcCFFyLTUQYxfpD3A1KrQZZ
MmHQIKly8LKaOUzZBsm5jmFbMvQxYq3e0ZGQiQxQ9bqbZ+yYWMk=
=ACHY
-----END PGP SIGNATURE-----

--IPNI/dOR7wHBaljP--
