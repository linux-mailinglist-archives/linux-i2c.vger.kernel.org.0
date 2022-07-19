Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8254F579187
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jul 2022 05:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235218AbiGSD5g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jul 2022 23:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235721AbiGSD5f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jul 2022 23:57:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4781630545;
        Mon, 18 Jul 2022 20:57:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9447A614E2;
        Tue, 19 Jul 2022 03:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02326C341C6;
        Tue, 19 Jul 2022 03:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658203048;
        bh=bk7kiNkFCjTJlkPO94NstHDQP0wVKlshtC8iPTo6tTM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jqvdJJi2eLu11yA7R710yNYh1SakfUeULGK+XGuSlOgmNfJwlZa2uy+nSWyHmsxjx
         PO8ncJNDH21V7vMtdAh321VHcf7ZNEqcTZfpACy0px0EhGACvOijHqv6ui2JexC83H
         NN1j3NJEPqUl3gCmQmDG4Ymk8QZlt+Sz25J6Y19OvCrI0Q+gBsjc9LiOzP/OceCXtr
         uEcoHIkng4gnxjIf92auTEWTmZ3bjUFN9EGtPWN9pcKkSIx1Ee4i1X2lAVREO+/dQb
         Q6OcGbU5d+zbshoxsXhjosqEB9rsuVTpGBeWfL9s0Ukdwgg6lNjn+KnTjbpueMvwQn
         DRfG4JqjEZHKA==
Date:   Tue, 19 Jul 2022 05:57:18 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BRCMSTB I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] i2c: brcmstb: Fixed adapter named with optional
 interrupts
Message-ID: <YtYrnlmpfRxcWMga@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BRCMSTB I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <20220706172115.224240-1-f.fainelli@gmail.com>
 <YtKxpz7kiER8ydcj@shikoro>
 <03065912-a9f0-6380-6f19-9db2f43be589@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gow9lImvwwFsbBJv"
Content-Disposition: inline
In-Reply-To: <03065912-a9f0-6380-6f19-9db2f43be589@gmail.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gow9lImvwwFsbBJv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I was not sure if we could change the adapter name reported as one could
> argue this is now ABI, but if we can, then using dev_name() is probably
> better. You are the maintainer you so know the rules on what is considered
> stable ABI and what is not :)

Well, then even removing ":" would break the ABI :)

Please use dev_name. Other drivers changed that string, too. We never
gave guarantees for that one.


--gow9lImvwwFsbBJv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLWK5oACgkQFA3kzBSg
KbbkwQ/+NOLKvOH/5XckE2kb+8VHFvBgNdMSJMTz3taSGcC0N4N85TReOXkWBCrk
Q/R9cHH7O9LCNZmNc0RJZu0ilKh+wYqagtDG8jID4/8LTw1jqylhM2qtZS0mNEPT
btHwYYEr8qRipEh2ISn5RNEDDYmdje3HHsPOJPgraRUIo9tVdwyp+yW2bsrH+7h5
r17Lk4klVFqa5Vrw4Q9KtCanNw3AHKRo515os459fIE/dHFMeTIYuFyMxA5WT7wG
QtEgfDCBRGR0YSuUfbAMCt2Xe2+y0heh0P0/0BcGuSqiT3HXAg3nz9gMHa9cV7Pd
vxxv4ByayzZFtpOZnZcr0etLfJPqcRS/LfDXx7lo3z6ZHprfBR+WfRBYZcGyFgga
eqWxMLkavU9ez9dISA/H+SBRljX01rug67ejrfEVzs43XWFugSbSkII5Bbk5nVs6
Z0tv4y0K7jN4vTTMEqcB+gVQ+03XxeU3ORVn5mFe1a7vjN+IiUt3ezKaDSkg192v
wM2QY6srSot3kq2nPjgKuO0VPHOEPHYmMei4kPLOIXUG5p00SdAVVz3othv/octp
7CseCHtVIZhClyFlh/WJ3Uas1kPLp1abZMEqmUoMUviBu0GDwsS3GQY4W5P724du
BM3CfsAx2FjC0wJW5YqGcg/dDJ2zbLBs6DQmT7ikBhm+TEwzVF4=
=6qHV
-----END PGP SIGNATURE-----

--gow9lImvwwFsbBJv--
