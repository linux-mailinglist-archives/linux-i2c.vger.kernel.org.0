Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C18A677B98F
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 15:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjHNNR7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 09:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjHNNRw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 09:17:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B945FE71;
        Mon, 14 Aug 2023 06:17:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 56C0363961;
        Mon, 14 Aug 2023 13:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CAAC433CA;
        Mon, 14 Aug 2023 13:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692019068;
        bh=Zu+nYFivnIyJBVmd9b2maEPz1BzwjwbDv8hvATQ73JI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sszso1jGIBB6fpMRCDr1mkGTp2Huv5tvDZFAoF1lO4sPRm110q5OkGGUM0AlvjRn4
         OU1utseulPmibm+Dtw6wBDW3Zjqqf9fA9HovPcriyzbYN4+c72kAst58ixl7yWqy3m
         4kab72ez2y1FHs8KLAnRHK6TCH1pAXLh6qcL3zWTv+BO3MEcHN1I1ZaYnD9eEx8Qwf
         A/IgLYoAQ8GoBORr18a3hpbCaeWNZA4wVUoFaI0uMZ5MrYwGfw/zvdOkFyIrTRBa/1
         QoYr0CTTNcjVs1SFWrR5vQPQkoLv8PFmDcLq5fOznIrwujvNqYMwbJskhqCytxtEuj
         KBFx8E/dzObRg==
Date:   Mon, 14 Aug 2023 15:17:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Till Harbaum <till@harbaum.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harry Geyer <harry.geyer@devtank.co.uk>
Subject: Re: [PATCH] i2c: tiny-usb: check usb base class before assuming the
 interface on device is for this driver
Message-ID: <ZNopeSzg+BNyzlNL@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Till Harbaum <till@harbaum.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harry Geyer <harry.geyer@devtank.co.uk>
References: <20230727162255.21551-1-harry.geyer@devtank.co.uk>
 <169100653071.1957828.15637150072710562078.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AYdEv6v9LxLBvmow"
Content-Disposition: inline
In-Reply-To: <169100653071.1957828.15637150072710562078.b4-ty@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--AYdEv6v9LxLBvmow
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Please note that this patch may still undergo further evaluation
> and the final decision will be made in collaboration with
> Wolfram.

I chose to apply it to for-next. I don't know how many clones are out
there and if they all have the same FunctionClass. So, I'd like to give
this some testing in -next and during the next release cycle.

Applied to for-next, thanks! Thanks for backing me up, Andi!


--AYdEv6v9LxLBvmow
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaKXIACgkQFA3kzBSg
KbavWBAAi0dffNHOMMIzxcSpTYLDwqr4gZlmEk90WI5z9usTGHGYxKs4fb/D2KaL
f3rOugon//aqIcNU88RvGlGap5WIV4A9+nys4+SK9j5UfGD/3s9/9vVvePHn07+T
NXJhYzm2EIhK7nj0TOZKdxXibFG6jSRLYW1a9BdLaJjNnPbbtJRoUeIoWzmTwQ8N
k2kjkz+TJKfu8affAMl26u9qZsxNIAxfCLI7XV4krajMtjIpEU/0dK/QM5Run+Lb
JL0VT9bDZUrZ0V+bEvF1SAlvubDk246kNgPf3QgKegwcmP1MFyySTeLcDHaNcP/W
CTxuy6+inwZQqTv5RwEXrv3AkStTLu3rwdJHRGeRQB69rl+Z7ixTrq+qUMHyr0MV
MQvpCfoGac6jpJbS/7ax2wTHLE7fKdlm8/9/9ZW207474c2V/xnydrH1pTO4Yu+0
Yl/0hrcuoR8rOG72NnKF8qxaKgMfry5apFtUNTynToJN/kQxzpTulg5sRycy7QwB
l4vh4zEFuQ4xcLmQk8FW+ZdmYhxGRNZ2BwRpx0D0bZb5JZBD+GwEH8jnCYcQWoUw
hAc5ex4LpyMksw6yfnimf7X4n22egifE99UN+dHkvBp09PiR9dl4UnXReVMp8xzr
pODuP4c4POqbY4HxPSbrVCYAdXJCLX6ttRbwqgBzime2rQvrJqg=
=gQSI
-----END PGP SIGNATURE-----

--AYdEv6v9LxLBvmow--
