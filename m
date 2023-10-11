Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE447C574D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 16:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235041AbjJKOtA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 10:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234751AbjJKOs7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 10:48:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECC3394;
        Wed, 11 Oct 2023 07:48:58 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C0CC433C9;
        Wed, 11 Oct 2023 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697035738;
        bh=UB4+HeZ2ctHuAdDSStXTcsIo1PGN3+WxqWufzfEOOhE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ibM2p3PdtWTWtKrJZ018Ia8+4VWj6mgBmyhGh25FqtzOEm2W+Vb3ozfRQ1mP99o+L
         U736adtuq5RXEUXxW4u7+2dt0gs63s4WUoXRmDkhmerLTVD8HX9dK/u4JUjAfQoWkm
         wNP9q5wKEi5FWdcy/tZumD74v1PmyFdL8/0aZB0CIzfo449gl3qgC63q9yUSsBphwK
         +dL/ssvbjKAdWaJ2h+WPvKVZ+Hl9Fr9atJDonMBb+xnSvV1dlZNUXnoUVWzi1AxfCV
         WDN+ef2e8oewDZXPUD0CdMRvhgbONrBJJ9glMnrNTiU2BQhw8nO4VqlXUerhBX3IyF
         wcxkZ1QpNSsnw==
Date:   Wed, 11 Oct 2023 16:48:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Gregor Riepl <onitake@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH] i2c: brcmstb: Add support for atomic transfers
Message-ID: <ZSa10t1kdUBfiVhR@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Gregor Riepl <onitake@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
References: <CGME20231006144123eucas1p111cbbdbd70927ffbd697f7edf6b7ae1c@eucas1p1.samsung.com>
 <20231006144117.4079796-1-m.szyprowski@samsung.com>
 <ba3c0972-2ba2-4df7-826e-a7634027b967@gmail.com>
 <b4b91fb3-07b0-41c2-a97c-d1a045924fdc@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AVdLZ6OvLmwsPHz2"
Content-Disposition: inline
In-Reply-To: <b4b91fb3-07b0-41c2-a97c-d1a045924fdc@samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--AVdLZ6OvLmwsPHz2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I guess that i2c core takes care of NOT multiplexing atomic and standard=
=20
> i2c transfers.

Atomic transfers are only used iff the system is in a certain state,
check i2c_in_atomic_xfer_mode(). Then and only then, transfers are
atomic. All of them. Neither bus drivers nor clients can choose them.


--AVdLZ6OvLmwsPHz2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUmtc4ACgkQFA3kzBSg
KbZLRA/9GJeh1v2sMju/XX7WqJe3CjrSWTiq2qlGJ892PoHA8i+mAwSzCrMBE2FV
+AxFcb2RGy0ON33TeKoeyfDe4iYcRTLqqElBvVd5JFq+nt3SdAH/Pz2gBTa7KYCr
g7xL1e86yLPeVil0lVuuELZbbt1H1UpcCGZqy3G1p24GGekd0Y0CEECfaMbf6TPd
KKILC+oo6xV2RLranqKgl3xijoWNLLRmrXVj+wgXk3o+JknlwjDfQUUvJiZzrH5M
u145XHpmgEa3LkO5kKy+Xj/kBumrb5gzbKiERy2ANfBBkGi1GaV6nIYuwJJ5IOeP
mPlR0N6ihhmiITPcumroZh/bDa5FinPYTsrB3im6ob40CbLN6x+Os2y1PazKusiG
q3MZQjhRFnSA2ZkLhn5Xsni5jwz095XJaD7X3tdxHTZ9as6aEQ4UPQHVVGLqQZQM
HlylRMsvToavOixirPfbQhgvbZz1J1JuVtHQ5vtXFWeDYqo9dr2xlFTDN+L5Tsmo
XvENkvm3d5GxVDltHA+1MMYw/4fTp1ir4VLQPJHQJrpVVDD9jcL17+cYPDKFhANU
lJLnD3zHCA78vxIohGG7j27vlRF0OFYqKuLTI9otcOpNXaZS6hnG4pZA5sdRlfPc
N0ighPzITu2F3eSpp3jesGU8pNkV3ltyN6auYkdeIp9RHXJ4PM4=
=1CQ5
-----END PGP SIGNATURE-----

--AVdLZ6OvLmwsPHz2--
