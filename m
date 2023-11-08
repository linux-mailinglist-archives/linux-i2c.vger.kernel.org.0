Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01E0D7E5283
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 10:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235476AbjKHJQv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 04:16:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235408AbjKHJQu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 04:16:50 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12CDF92;
        Wed,  8 Nov 2023 01:16:48 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F33CC433C9;
        Wed,  8 Nov 2023 09:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699435007;
        bh=Uyo/fe9L3givN13VvXpLahGfLtRfH9/ftSHaq1Ecsjk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TGagmRWwqyeWELZw86f4nLPx0IazSVUU6IREpNTQXdeJWkGQOIcaRUyBccWXhUXI8
         8ksGyfj268wvHCGkXczuO58cESjFyWFwgXDMKnlRz5yGsILQi3o68JPsmAlZ3wTNgF
         N9W/gCalm45qShVO7UzyifE/EZb2C4vviT/Mk/ZGEpyMT7H/V/WGKKaWZ74fg6u1pB
         6BQbOX+yvHqkNN3cMj3EvTwTiwvayp22FbqJCROv5IxkgpaQrWgKbM5ESucOnT2JFx
         3rjWoLQRNHLxXYitWJp1u47srM6ZkcWAlCWGXBrsiQmqC0eaI5Ze0Rus+ecmzSf5Kt
         J5xUMKMjdTuZA==
Date:   Wed, 8 Nov 2023 10:16:44 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Vijay Balakrishna <vijayb@linux.microsoft.com>
Cc:     roman.bacik@broadcom.com, andi.shyti@kernel.org, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: iproc: handle invalid slave state
Message-ID: <ZUtR/Jan+0sE3QVb@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vijay Balakrishna <vijayb@linux.microsoft.com>,
        roman.bacik@broadcom.com, andi.shyti@kernel.org, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230824212351.24346-1-roman.bacik@broadcom.com>
 <ZOzxJSeHhB1vrXff@ninjato>
 <6231246b-f8a5-4a6b-a7b2-dc2815ffa85b@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ldSLwsX2k/yfiJ2p"
Content-Disposition: inline
In-Reply-To: <6231246b-f8a5-4a6b-a7b2-dc2815ffa85b@linux.microsoft.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ldSLwsX2k/yfiJ2p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vijay,

> I don't see this patch neither in I2C for-next nor in linux-next.  May be
> got lost by accident, please update.

Yes, I am sorry. This likely got lost somewhere because of an error on
my side. I'll apply it again. Thank you a lot for notifying me!

Kind regards,

   Wolfram


--ldSLwsX2k/yfiJ2p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVLUfwACgkQFA3kzBSg
Kbbteg//a3GyhJ9/7FHetY4CuhdpxMZsrIgGbZTpHPE5tvASRO8zehmUfKboB3is
BWfgbXFCsmhR0YBze0+1FrThcoDa88qWnR+fDgG7gNx8hDZRzPT35JkfrD2sjWsF
8Nd/uCBilGcKX3WWIIK8P1KJcDq9xWQXGIPqLGt/Kisg8/pAiJ0PIrFDpKayVL+o
KXTTRYUHZ3AgYfSsVlSrVsh2PfxjE52HmtSGuxpYJT3V915v2VF+TcFlEMlpig5L
LTpvCdWeSSkdC7lWYhfytRZG35eD3haNmLx77xvQPW+LZcCBbXAO5DAjMcRPj4xn
a0jcGDZfr4nk4AzpqPHXtczdUWsiiiDc/L98868o31+GExT8d/xLcKXkC3YDcrBy
fvlVntq0Lqlh8ufl/Q5nqYp9YZG/0Wqpc3xSLGk/pPVuZNkezSqnEbxBj04Wmi6d
z5ml69UVaxRczmR13b0fa5w26uqlvdeYO6FjkKoxn5pmb0ONw0DmqcQk1su4iD+r
1DDU4iInABKe/4lLOQ5Yf/+qSo8c74hm9ZjV8Yed95iOivEZoCR4ZvIkF/KwkWeH
DaSWVWPH6SaORkU4CP1lxYigx7nCTPTU7Mp/VeQLLltDHldmMjKxFbb+kIvsY+84
4KeV9BJGCZgHoQ0IZk3ycsmpVZbR16LPJ1us/oN81YSlmqeYc00=
=v1ug
-----END PGP SIGNATURE-----

--ldSLwsX2k/yfiJ2p--
