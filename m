Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E28D14C8E80
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 16:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234077AbiCAPD7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 10:03:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234347AbiCAPD6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 10:03:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A7D22DD5A;
        Tue,  1 Mar 2022 07:03:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B68E661635;
        Tue,  1 Mar 2022 15:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6426C340EE;
        Tue,  1 Mar 2022 15:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646146996;
        bh=6VT7ZZJE4eWH69e6J3p5kOcPN+nEhh3aFJ++ueF3zUw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S+tQe4FjIdeps0VYDJkSNfO5UCzixWi4v3DyOubRtW9YCDsH3GqxnWyoX2lh+1utd
         hft8Lnmq2DuUL/j0knLDy6aIMrR+2dgDhdNIU0bOVoJ/t/0VkkNom29QiJVGC9Vtlw
         pAEbl3bw8KC5RIpZIonko9Bp/mBDM2d9Xy7vrmczGQnO9s208Lax4exXNOGuS7Y+qH
         j6AuS7rHwTyrWa15JXgFrNsGWHI+T5uk6WAubqnVO/nw+RHXXgxRTFGQTr1vwFEwfb
         V9HuLLIf8XF3m8MRR2onuEHFux9AFTwIV2geLi/VHo7z52tq/7JxFdeYXB0dWd6NOL
         6ffaV6uYIQWLg==
Date:   Tue, 1 Mar 2022 16:03:12 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: microchip,corei2c: Fix indentation of
 compatible items
Message-ID: <Yh41sLhyhxwxfH+l@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <365d32c63c2fe080866be60c32dddd0f3634d19d.1645705789.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BVBLWRpeC9NpsvkP"
Content-Disposition: inline
In-Reply-To: <365d32c63c2fe080866be60c32dddd0f3634d19d.1645705789.git.geert@linux-m68k.org>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BVBLWRpeC9NpsvkP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2022 at 01:31:21PM +0100, Geert Uytterhoeven wrote:
> make dt_binding_check:
>=20
>     Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml:19:9: [w=
arning] wrong indentation: expected 10 but found 8 (indentation)
>=20
> Fixes: f1bd6661946b20d1 ("dt-bindings: i2c: add bindings for microchip mp=
fs i2c")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Applied to for-next, thanks!


--BVBLWRpeC9NpsvkP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIeNbAACgkQFA3kzBSg
KbZpsw/+JLQL5ZthwQqog4jI4XxWkbADS4uk/hkQ4/BMRjORDB7JaZFLhOP+bFYw
R2BipPuikXdVhVjZVN/JDkwWArBgPyB7p+QtKdtOCwmB4tdopasy6/nNVKWbXJt5
8Ue3RUq6SRvNGAJPkNdKnORxI1DPXIRuYMoHWgG9AQ84zkVmxUiwtFNP1UcAnOjs
cVEgbw17ZyfTCEWYy9E5BYycXcofb25LcOkLqtQAGZySW5phXXb4WHpdNPciCnQt
zquFrKxTC0NB6faRrkDS2ijdjqlQ9y8nHXcvoqgyAmce98jjHUmT+puzxAM+rM8C
G50R9dhLpdkR0fsZqO8k3NX5HZZvk8Q5oOV3mmiI1gNfIIoghFLfVo7/dG3XHGZT
Qpev6wZiM1bHcqD8PFI4+7+W7mwMUB723cAjYv20q8HG64FtYtziwV5vs54sQh+q
E1LfPKRuUM/IcoQ3zWdqZ3BNqL1crdfKaxwBTrEYIlkZHhNpqUotnh8FaSTUMNYp
jp4lEBXludGP9CyFFry2f3RAPstPIntEH0+2UQyiWeYA9ZFpgIduupjumnA8SOj3
P/9+S8dsWb+fFhs7JlDGCl6OkvXqeV+I6ENbu4apLHQMlPWMuS6VrziFrzBD42/U
7pLMg/nvreUTjw2afUEv8rhw/2lhOF3Dmd32nDL9ickhr/et8dU=
=1Gz3
-----END PGP SIGNATURE-----

--BVBLWRpeC9NpsvkP--
