Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD4D675120
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 10:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbjATJai (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 04:30:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbjATJaf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 04:30:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E61D7;
        Fri, 20 Jan 2023 01:30:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AEB41B8213C;
        Fri, 20 Jan 2023 09:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA7AC433EF;
        Fri, 20 Jan 2023 09:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674207010;
        bh=3DGw974Ahkba0oy/LMgZ7J8Bjyw0AKlwWbBOCvdlK3I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RrkrLsnKIYiawEAy1z1b12/edSRztop6/uzh8LaTZQIOqLjSqkC30QjesdF/xpbfn
         J5tZ9Yya5t447JigCmqlZtPstDhjH7EFCLgFuH2lMWKmiaVEMBAfrpXAB/Neuyks3u
         L6xP+Rjoy47l73p9fniLdw/0MU1j8DnNlZGq4rySQriHwncHdoOxQIW1/Zg/J2JKss
         7isIRjeULMkXwyAcxLEI4Qdo1Aa8hwQyV1H45Pwh6e4ES3ig67TmM3t0WZDKjgoxKs
         SkPhBQc1VcZlxY2JHRYEdTmZ2KBM6BpEArCFtzuuaGEM3qYPvHPuXYpXgtsg17bB2o
         RNj4eZ6+1LJvQ==
Date:   Fri, 20 Jan 2023 10:30:07 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     ye.xingchen@zte.com.cn
Cc:     f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, stefan.wahren@i2se.com,
        eric@anholt.net, christophe.jaillet@wanadoo.fr,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: bcm2835: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <Y8pfHwL8C0Bc1PCx@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, ye.xingchen@zte.com.cn,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, stefan.wahren@i2se.com,
        eric@anholt.net, christophe.jaillet@wanadoo.fr,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <202301191718471268817@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0BfSqijbPncFMAKs"
Content-Disposition: inline
In-Reply-To: <202301191718471268817@zte.com.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0BfSqijbPncFMAKs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 05:18:47PM +0800, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
>=20
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>=20
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Applied to for-next, thanks!


--0BfSqijbPncFMAKs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPKXx8ACgkQFA3kzBSg
Kba5kRAApY30AlA/i3XsSPcSLVAr/SYL4Kmp4RHEjQd1xghO5QDzFKPw5+CqhlQh
oSDpm7tNh2fK18GAyclLk1sMne8NIm4ZQkD5TcxeIO1WQNat0PWOTMDDepnAK7n1
WxL8dt7Ki43Edam6ebGp60TxzNKVBpnNR1LHu0MOeQs+7rMvBsYtLGmiJR6xH/CS
uIMs5EzgCtKgSg90EHlfpL/VLmFfM3GaKcOoRk8OuaWUk8UMM+CpngO5y5hY6EKm
GHj25rnCQat1U5g/f5BUewgWMpgGSRgY/PhGOmFg053SAvpJWjwSKmPmHo0nl424
ofGG8sLDSdOx5I5T06Fj4omiqNF9v7fdZgv9rIaVUM6hS/LsklIn7RLNyxv0g0V3
RY66bCwMu16Dj/qSOxKHQ5mWvdI4NfkuQwlqU50WLzLVxPP+c/7+k9esI6I1oZOr
RdXpnFDuiOlXOtOmFQlqCQr6N9Jk4mvlnbW6p90J9iIBmfrPur9k2ZvOGCWR25jL
ggd/jcplNPIgewzk8NViT7C/w17A6FKBoz4lAK4qdna/5rY4jcOwCM9g2nKNelPX
ss7WEaZVpvIM1lBI+N3NzBzr7F1PTEcl32LG7gsNmXMP9C8/gUQ3mloZGQnBlsWZ
/XZ0A4u4tkSwDXiyhdS39adjLOtYAoCTFktO7a/gOj11eX0g7n8=
=9Flm
-----END PGP SIGNATURE-----

--0BfSqijbPncFMAKs--
