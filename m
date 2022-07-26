Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F241581B95
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Jul 2022 23:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbiGZVKT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Jul 2022 17:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231972AbiGZVKR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Jul 2022 17:10:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDBBB55AD;
        Tue, 26 Jul 2022 14:10:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4F32AB81E94;
        Tue, 26 Jul 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E12C433D6;
        Tue, 26 Jul 2022 21:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658869814;
        bh=v5jGtt7mTprjQRklJAlQCvOSDiZyJZoNBV2t2UvJux4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pF9YPjEkSZDoYZs4+SxkRk/fQhw6va6jUeRuZO3IEioI3xIQ+04xhw+DaHaZmblZN
         kHFcsHw/FNm6yoljSmJ4+qqbqpMQ61tDFNSpANRlUwJxLDjoYN4ZtsZ+OIsh/aR/cJ
         mPSFG+gYTxb+WXYtRr5LIhb/1QNacK8Mi9dOX2yiXSbAo+CdUpFrPhAUHishEolx8G
         DQicONOn7/br74tKD//JDY2KhQi4HkzSDXqO+0F60f5piajO+5PAnKjQ/19PzLMqUn
         6yh3wsEnmurL9I5qjivDJHn+DVQAoTCj+xZUayaRsR7pfunIVry5G3M7zwi6zk6P3Q
         LiRNnpe1zf0sg==
Date:   Tue, 26 Jul 2022 23:10:09 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jagan Teki <jagan@edgeble.ai>
Cc:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 13/22] dt-bindings: i2c: i2c-rk3x: Document Rockchip
 RV1126
Message-ID: <YuBYMZ8N2GXazKF3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jagan Teki <jagan@edgeble.ai>, Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20220723204335.750095-1-jagan@edgeble.ai>
 <20220723204335.750095-14-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OkwOcuDiD4hVOZSg"
Content-Disposition: inline
In-Reply-To: <20220723204335.750095-14-jagan@edgeble.ai>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OkwOcuDiD4hVOZSg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 24, 2022 at 02:13:26AM +0530, Jagan Teki wrote:
> Document compatible string for Rockchip RV1126 SoC.
>=20
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>

Applied to for-next, thanks!


--OkwOcuDiD4hVOZSg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLgWCoACgkQFA3kzBSg
KbaXnA//aBroGAh2q2ivFSQZSL5UMqCj+lNeKrhEetiPfzUoXybnJZBO/q3qCBKq
mEXvu7ADLc94BTZ+lgWwqSiWpB0zp7vIEHN3qN1Qkl6hOb6cTw6W0XljKnvnZRL5
5C23Q9qyHZDZ38XxEc4u6njPG+ltl+lxALaWvhpvyyCcMMxauooxHlhjPRXcaoJg
92AquZzCguxd9AnKpCWqtFW3F9VtSqou+voJ/+pH4247KSRiJ0AjGhZjTchnMvw4
aT/uDm1Jb1yh8LnbonRrCZGR6h/n5WqQHV1g8B6LtThX3JO4KS27LXd7H8wQoD8V
GCCGFAI2KY4FxmELttb/DkdkG1JV9pmQYwRwnsIO4FaFkY4pXbEAbC7Z721qw34H
ZOaIHIgRF/PlDdbwASaOlelTMsnjqkNKOwM86TRDCvcP/Cgx2IkQ34TMrrpOMbTC
Yhgs6IEe4YTSm/N3wZ3uknIKBRTAz0o6fkZYGl1GZoK5QyR4Zy6qnis851DawHe8
E7IqMV+TUek8RN759KlJLqwNZO702BWoTb+c5ZCB8Mu1GquYLyy4/Nw1raefGF6A
U2Sv2etnlMS3PpyC9+IDNsyY3qy1+PISjM3SuLIKvXKg0x2bn7ThUlrwKA9I0wI1
Bqak5MAQtO5BJVM4YbBZA/j5gpl9aUDDL+c3Wa4j1HZoVBKKCpI=
=REHw
-----END PGP SIGNATURE-----

--OkwOcuDiD4hVOZSg--
