Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 557546ECA7A
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 12:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbjDXKiw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 06:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjDXKiv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 06:38:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FF20B7;
        Mon, 24 Apr 2023 03:38:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9F2CF61261;
        Mon, 24 Apr 2023 10:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A03C433EF;
        Mon, 24 Apr 2023 10:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682332730;
        bh=Ec7qT2CJnK6Y6+hGlVn+L75gseCma+/M4hHB5L8PkM8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SYXMvbrZ5X2RHuJbIlJ4orb0T32s1f7Egq3qCQpduvecihiJQWTWhAfEPOZ8nLLCG
         J1rwP0myh8X+67s4R93AV0tCAKaUJHn+rCYFg9LoH8sREZrz38O9n+0WVjyxUyv/nE
         nqoo7IBSoRzcoQFiJy5pvtV5FZyxfPgT5zl5b/BTLJrWvhddKulmnzF0nmNHD2+J2R
         7v39rHz9qD/gaQAz3cy8XVUuUvJoVcRNRx9eaYCl58hUvQivRnVfudIhGEikbZ279m
         W9GVfrtRSBgdEVK+255vxv7mzxfu2fnirRmDRZACEOCsFnqTpJD1REVACUX+JkRtr2
         T2g7zrOCrBDNA==
Date:   Mon, 24 Apr 2023 12:38:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Stanislav Jakubek <stano.jakubek@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: brcm,kona-wdt: convert to YAML
Message-ID: <ZEZcNfSYbhjbyOf0@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230423143024.GA10503@standask-GA-A55M-S2HP>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qjMj8koEHh503b7l"
Content-Disposition: inline
In-Reply-To: <20230423143024.GA10503@standask-GA-A55M-S2HP>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qjMj8koEHh503b7l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 23, 2023 at 04:30:24PM +0200, Stanislav Jakubek wrote:
> Convert Broadcom Kona family watchdog timer bindings to DT schema.
>=20
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>

This went to the i2c list instead of the watchdog list. Please use
'scripts/get_maintainers.pl' which will help avoiding such issues.


--qjMj8koEHh503b7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmRGXDUACgkQFA3kzBSg
KbY0wQ//RvkEv5ZiFJXEG9yFGhLjeLkuCEXJtWi4E2mBzzVBOa+VqgLBP6WY1ksa
j/jNvXbKIECuz+K6S8+oie1RmgKYqaPdas9CIN3XxbxZUrkhqV2uWnVnzS5YPN+k
qFF9+JVGGPDTjG6aLJ0mEk2eUxe/EYq5T6n7LPkHlqIcDBS9vJUa574h/DVFUYxZ
5b2knMz7+ybK/+1F1NRs6a4XFMxY8Z/hDxGARPLRjTGhPV74tD4DTyusmdPWBX+5
hm7c5lvc6MFT6lSkZIbOoz5duuw7GZjlv3Vm/Rt7r/s+uStHQ/rVaehaJtydSOtl
KlyK8DcePVosQER18vIcdWWvr/RHd/oVtvKvocWextgPD17T330pAL73f9+EMLbp
PSqBb1UdPAbKh9SIebGDMUv8YjTqGTvEiwTeQ70mgVJhOb/03j6buTOwS6ku38Mi
ID7XOseGJJvGUKXghycCveiNEt8pf9AfqO0UMzyLZVTmH4amyhME5Hlpy994p3l0
KMXxi9hKOybERs16nlAullKNwxge7QknP+oPyKzS8RcaLUAzD/i0FCtxCETihU8E
Lf85LAtKafggf4uV2W7G/LQxgpvTy0TJetDl5Scvr/LE+mRvD6rRId3lG7n/d/+D
+RqSdBVLzx3aIynNCkH15eTuxXoo3FKknwMd2We4RyqpWzRoTRc=
=ShE4
-----END PGP SIGNATURE-----

--qjMj8koEHh503b7l--
