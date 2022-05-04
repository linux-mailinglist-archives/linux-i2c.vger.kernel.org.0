Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 523CE51AF8B
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 22:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238250AbiEDUox (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 16:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378311AbiEDUov (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 16:44:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA845132D;
        Wed,  4 May 2022 13:41:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C069CB82936;
        Wed,  4 May 2022 20:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7E9C385A5;
        Wed,  4 May 2022 20:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651696868;
        bh=Q5ZeVyHPlBwvUJJ9NjV3GKUL+y0ckrRNTyeyprzieIA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hXkix665SljJ3kbo2wwoLAwc9NEJVRfuS2UFJRvf+UkSxFXDkLmlsbICaTtk5wFFX
         IB7DqQ52eSqnPVNVfxhscu3ltxqJSv0F3xkW+iEfV7k7CVjIk3hK39Hy8wOIkxKci3
         0zF0ViipQubzEHwOvB370Jt3x3McLPHiQ6ygIbuF4Aj+kqQULf00P6p8z3EW1/CPrl
         G2D0fd/ui7F6QrSrern7dCs+AtVktjaR5JsEPGWhWlXzkCNVG5QeTQne39fnXDqAkM
         DLVsmhh4sO6DBKIi1Xu+JRsMgrn8Xqq1G6zI2vBZ/VBLJhEqssC0y36jMoeUZMN/0p
         GwyaQFniQDibg==
Date:   Wed, 4 May 2022 22:41:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     cgel.zte@gmail.com
Cc:     nsekhar@ti.com, brgl@bgdev.pl,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH] i2c: i2c-davinci: using pm_runtime_resume_and_get
 instead of pm_runtime_get_sync
Message-ID: <YnLk4QoNqpauMg4a@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, cgel.zte@gmail.com,
        nsekhar@ti.com, brgl@bgdev.pl, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Minghao Chi <chi.minghao@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
References: <20220414090727.2542000-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="um7TN/yvFwwtqlmp"
Content-Disposition: inline
In-Reply-To: <20220414090727.2542000-1-chi.minghao@zte.com.cn>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--um7TN/yvFwwtqlmp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 14, 2022 at 09:07:27AM +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
>=20
> Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle. This change is just to simplify the code, no
> actual functional changes.
>=20
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>

Applied to for-next, thanks!


--um7TN/yvFwwtqlmp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJy5NwACgkQFA3kzBSg
KbYLfw/+Mr9FWFQUI1+rX3T6j8kqcWg9Z21nkUgf87gBGXr60jcDRotDPi+5C3mA
7sJMheqJiST+F9HCnnitJzEqZjoSdqVicx1JSOORJ6jquFabS616paznmmVyuv5y
XrCTTOMD4Latl2pX3ONhGaVnRrcVydGeOFwty/6BdMB1loluA0lrGVYcrLzWEK89
c7wPXCziP8fhOorpYPrGJaeQDcojoiLbC58Rfa5LM/TqhvWsf9WRCzj6LI0tB5Yl
g1TEaBuaDsNRXc3BFTNAd1HkruGXEhrPcuSUGWtuhrtcne+UjBXgOBi4sNHRQz+B
rR9NV7MfR0vbV3yUsSRpX7C7AxyBJQ+E6Qm0okDmiEq1jn/gn+OBnooL+p4khonn
k+wQUPVXEkWIlt4fWj7ndyD4xPWwqsG2LUoXqjqa9oL7vCOoYBqMB8V/SIFeXdOl
2z3U8H/Bsxcar3dHsOlTz7o0lOUJUwgevtItcw0+AQ5sgjIkRcB+sEidAEahLeRF
UburjF4n0fNKWvP5G8DNgTeGsB1iFSNDynknUTRuwHYxiQ47nHFTqKNNrIyke+kt
P4yP21i5tQDHSDwrS+YOKsKMtoq1kBfT8aNhjbDCSRqpjHPAG8YNXPr0MhvizkDz
E1dzPTwKQ4Jh4WffobtSJTgKAq1URe9mNBNiZTJzg0QT8KM1784=
=V1tb
-----END PGP SIGNATURE-----

--um7TN/yvFwwtqlmp--
