Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38BE957E4E9
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jul 2022 18:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230501AbiGVQ5h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Jul 2022 12:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbiGVQ5g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Jul 2022 12:57:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 440FA2ED4A;
        Fri, 22 Jul 2022 09:57:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CE3FDB82916;
        Fri, 22 Jul 2022 16:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42CEC341C6;
        Fri, 22 Jul 2022 16:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658509053;
        bh=2JPvXW4Xs4y082sNgh7Jgp6vGpJzfM0B/xZSitHtnnE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KrfcOJ0bCYkOI/T5eju1dyjyQuhaCVKs9rz2XK2Gj98yTr7Ne/svMoJWcFvmCdypN
         2xR3KCs0UCn99fXyo8Ydvtk+EiLc4F9TmuGzDL4MOl+5kRv1W2A6H1hZMFhhfwu9wV
         ZCy2UddFbpfe+pbeQMw0sN7voWUPhW/sWqQOkvxffBIqfy6cvC8EDa7cPIfet1//aL
         dIrwn5stol3VkKgG1Lfs5sDlJnk66EPyarE5b9N5KgIB+4YUgRHdtxepmFm1qw5M8s
         XavS12IHX2/uHTrHwxKMz2x9XW/EXe/XUSDwtD6DL0YpqNrmxTkaOJTiGZ2yBlt4hR
         f/iIVQNxl/IEw==
Date:   Fri, 22 Jul 2022 18:57:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BRCMSTB I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] i2c: brcmstb: Use dev_name() for adapter name
Message-ID: <YtrW9aT3loXCRPDq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BRCMSTB I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <20220719040611.13979-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cayvkFeF54kDgeU+"
Content-Disposition: inline
In-Reply-To: <20220719040611.13979-1-f.fainelli@gmail.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cayvkFeF54kDgeU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 18, 2022 at 09:06:10PM -0700, Florian Fainelli wrote:
> This make it easier to disambiguate the different i2c controllers
> present in a system, and then correlating with /proc/interrupts allows
> to know which instance is interrupt driven and which one is not.
>=20
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to for-next, thanks!


--cayvkFeF54kDgeU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLa1vUACgkQFA3kzBSg
KbYWIw/7BCfCCQ1Jb9DYSQ6jhixPh0Onwd5mRIIgb5BNl5AA7UU9RiQcVTvRH7wv
29zxqYBBo8UGGJMJpAbiijpXgxiZHvDk97INvVuTGRKe2uUbMLC+HrJyb8hdtUgB
8Xs6FHv32rvVQ1buKt0Chww6RFd/jwQnUfWojwiKSsjbVHvlZ7WYv/++gDZnQomO
MwyJhp4NVNEJAw3b6WZXnjZgI9LXuYlgS4ClSZ3Bfj6n3TiuEB3+wVUloX4yAtkX
1AfcUqlnQgUYs3lThVrDgMML+uHPTuXZT6ebQD1/7KRBRDxsQnHAioiE8yBuQLVZ
3xi/J3IKwtwF9FWOfUdLuf/PGgASC+hCscvDFhBjlu6mcTpZfGZ5COh8IeWPKdKp
ck0pXPQ52DDlL7BJuTa7MQ5w97rWjbUpuxFYfURvz2nShwLxaPiKLWd/I0LTfZCG
J2B+/tygDlzg5KcJXMYZ82clRHcj/WePzXU9qiNcEpsgdDbr0vEt8ezgyEdJAJ71
iit5yZ7SEBoHQu/4igvMY4kXv+I8RgoH8UBri613E8lgSuhqj7LzrVGMQXDiT9CC
4+nicHb3N1VKm7q8kJXeoYOpB7bjfVNK2q0dxsmWOnGjsUqFm/K+8HLKMf9iibWm
Cek7CMNlVOM7nwiG3xQcL6OKJ10e6O8+qaQp7OLUPCKjkOxFKjY=
=XECj
-----END PGP SIGNATURE-----

--cayvkFeF54kDgeU+--
