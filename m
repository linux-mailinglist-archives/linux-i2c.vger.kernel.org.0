Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1727E2D3B
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Nov 2023 20:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232370AbjKFTwJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Nov 2023 14:52:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232686AbjKFTwI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Nov 2023 14:52:08 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34048D45
        for <linux-i2c@vger.kernel.org>; Mon,  6 Nov 2023 11:52:06 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E4EBC433C7;
        Mon,  6 Nov 2023 19:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699300325;
        bh=8fP6GLqTdmLEslShS6o76vGOPT4vEMCXQQ661Grtkos=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xfppen5ylWyHoRa/uOdXNIBdyeUNUmS+5KOEYRybSxFroOlr/mI70Bsi+LlPvUR8L
         sqy4fQjIrilCelSe31F14SbaXTpSy0/pVe6l40ecFZ0n8oq39XY/u1MKGBBeUv3ZtH
         E7IL3zKR7Dz3K4SW5ym1B9Dv8hhVAgz7d378X+OF5xkTu1i1S9+COfRVPQsZA+F8do
         077aBqP2Rq3lTTI5xULCEWJVJI/jjormppeAUlJgb2x/8NrJu7OzfPgCyFzj88Z0ey
         FKdYJeKXOQoNvzgi9OeVEgFtPlf6lAnOe8uxDNCl8RZ0fnIht2Viau8ULWNu8ZQ6Vw
         xQoFvybpksT4A==
Date:   Mon, 6 Nov 2023 20:52:00 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: PSA: migrating linux-i2c to new vger infrastructure
Message-ID: <ZUlD4FuftkxPxckz@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        linux-i2c@vger.kernel.org
References: <20231106-sweet-heavy-booby-a00a52@nitro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5/8BJdlcGfTaGXZy"
Content-Disposition: inline
In-Reply-To: <20231106-sweet-heavy-booby-a00a52@nitro>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5/8BJdlcGfTaGXZy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

> Please let me know if you have any concerns.

I don't have any concerns. Thank you very much for doing this!

All the best,

   Wolfram


--5/8BJdlcGfTaGXZy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVJQ9wACgkQFA3kzBSg
KbaHlg/9FUaJU7o5Id1RSTGcqOEa9YwRKfreJlmHhKxnTe1y5aeyOxvyfsFN76NG
MlOwZ8M0w+H5KsS+4zmkz7QY+5Ums8YZf6gc7dB9m1bZMoaseUNctTY0V6Vldrxp
dkR3TWjmfkCwgEH09khMYr+Qo7pvrns+unBqTC7vJm7fXMqN2LKTbfanBzGFZc59
aMCkP4BlSCfUNwbrelQSfTwWYh0H42U+O9o0Tv1zevj9+FCJGqofeqiDYfGPhPU/
7/O9ttor+H452pMsIE/J4rgU1j3c2wwaVENjmKiGOX+Yw6Gn7XRDCXJcY6ft6PvS
Btx1KkCart6rdnmqhGOy4u3+FF7HmK0dn+yPJoX6lfc8veZ3OWvUJffOzTIQgKaM
EN380z44qpW/BvoBW0ISb8jzCIRmaGzl3Am0LyFjrVzI2DVCJEKaSPSP9bZNvjUt
BQ6X/VAwUVZCjjM1Tc5yn6XsH2hwkZyRgGRY5ofIy1GVYHVvWabdNiZw2/D6iEbd
wdjd9AqBrFkXhogtr4kXNNj0Z2yUpaJrMYUkv9g+2tz4m3DUAttbPMPVKIyj6gTZ
3fn/ARYHzb5taKbVGD5dvYqJllOYR/7QOquEdinsLbZvJbB1+IwjPb8cFj6CFvV3
lb+sds/Edx9n8YbqWJtD1oZj5WWOTcEP7LdOBM5H8zdpXLaQ6bs=
=/X06
-----END PGP SIGNATURE-----

--5/8BJdlcGfTaGXZy--
