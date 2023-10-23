Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 608207D3AB8
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 17:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjJWP3D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 11:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjJWP3C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 11:29:02 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B69B093;
        Mon, 23 Oct 2023 08:29:00 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02557C433C8;
        Mon, 23 Oct 2023 15:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698074940;
        bh=koKN+16K55fZmX3YR5+oQ5/Z6wG5u6tTuhKR/YAgwAY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NMW9YWef0k+qWNhCkYpdu20jcBQKZij4pHz2AT5Y6/fA8pgOyblbOuK/Wf73+Ti4y
         wvUWtl/fskmbOoZ2pwKqZjK3BIQ1ISlVTM8MPYunkXKep4V/ANDuQStLRAhnhBH4xp
         zM9R6X6IuM4nXJ49IFyOurdJUK3UGU4NxI3tjsvEd5q43cG8hUR9Ff5IcvrhGJqDBh
         rSSaMjfVvAWcti06SX6QACbFwwh9CVrHq2CqAeuAXvv5GjttnZsPvlVcuDbSBG0NEP
         L7boQ5c2peMom/XVSp9qhfH8n7JHr9VwTWeHluUgx76b3m3YrXvg7xVG4keK6SgAvW
         D4sYJ1bPAOkRw==
Date:   Mon, 23 Oct 2023 17:28:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: stm32f7: add description of atomic in struct
 stm32f7_i2c_dev
Message-ID: <ZTaROXi2sImFxJZK@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231023085015.2557849-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/XZhbe094dlICOwa"
Content-Disposition: inline
In-Reply-To: <20231023085015.2557849-1-alain.volmat@foss.st.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/XZhbe094dlICOwa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 10:50:15AM +0200, Alain Volmat wrote:
> Add missing description of the atomic boolean in struct stm32f7_i2c_dev.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


--/XZhbe094dlICOwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU2kTkACgkQFA3kzBSg
KbbQFA/9HWl7TYBzNXVk4BftOhgOrCcxgiwQWnOtz8jTOWEufUD1/JYaI1DoDm9v
nTX8YiXNZRRJ9ULbk7ZVkiUOdA9iCOYoamngKglBbEO7J1w0hGzKjKebtqfqBvTT
zHFTV8iTweq1McUXQsbgorPr1HzoeMaG0OVezezIhfWViGuhQWIlmg4OYJIxWniX
Y3cW5LRVRJ8Ud1UZdYfunGK7nKp3++WugSW5hNAis9DLDCzQELLYDc5FLNcCE2mU
0RzF1oh9m8uMw0rBDIW2dTBZ/YPRhKakgbDHfxwpnLv8SvH0kal98k5FT00C+7YQ
DDCH1pGOqyG/n1W1aG96ka1g7tA5c+Zj1+05J/3aVpxbwoXnzS5lslUvh9MDp5ip
bzIKP0AYPooepy3/yXF0rCPcAKF/OT6jVCC726A8kW07dHHJCVGlaNk3HLQdHVPw
bgz+JBuoAYQdPhQ44DChMzaTJBSO7f6zSI5252x6dGczEktXxqAYsqvYthDl0t/m
lffOGChIRdTvazFDibomJ9SE1XTJmV3dvVPJEFwfE31XKtBbztb8/5wh3xZhdaPI
mzi/D4rYQcYP5WpHbTdquLcCplmLtQqYNbYHGz+F3HQq6znh2QrVk9n1ybNceUUI
HkT/oWS9zahwVehqItYmtlDh49C0z5ImoNm5IWMTsHLV3ipaR6s=
=XGSe
-----END PGP SIGNATURE-----

--/XZhbe094dlICOwa--
