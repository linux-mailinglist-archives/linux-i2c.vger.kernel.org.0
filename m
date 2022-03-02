Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E88CE4CB146
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Mar 2022 22:27:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245283AbiCBV1y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Mar 2022 16:27:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245292AbiCBV1s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Mar 2022 16:27:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 781AEBF95D
        for <linux-i2c@vger.kernel.org>; Wed,  2 Mar 2022 13:27:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2543EB82240
        for <linux-i2c@vger.kernel.org>; Wed,  2 Mar 2022 21:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE20C004E1;
        Wed,  2 Mar 2022 21:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646256421;
        bh=llHE41UJhD2Kv3pp3e8fNyL4NjRhXLgQ5DW4xL/covc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oi9HB2iVkNm7m727tMrHmMl+ePWOI3AoBFE1+IkOAMoY+kWodWZIVJETlVuVVi1cy
         h2OgdSuw9IuAZbHNsNPer8NE0ZaiGVXrPA5nXmPE8trRcrQ91tpaZklb5YJQa/w8Er
         VkiWSfCEw8VnWAla9d6bXtnadM0KnKIb08RxUE3D9MkmQMcPWPTkSz4NNVnkPnjqxt
         /5PX3/1LlHrBtuSB6NPiHgDliIQT8cY346jlx63N6HrfGzTJtbTad3Zh4qrlkIymqj
         7HJsCgSM7YOFHp4t9gQxwpk0C+7xTl2BwUCDOzUC4udO4TQqdElvjRtMFF92G1MVA9
         6tnFu5xX8EOfg==
Date:   Wed, 2 Mar 2022 22:26:58 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Robert Hancock <robert.hancock@calian.com>
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        ben-linux@fluff.org, richard.rojfors@pelagicore.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: xiic: Make bus names unique
Message-ID: <Yh/hIl9CRP8gkc3K@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Robert Hancock <robert.hancock@calian.com>,
        linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        ben-linux@fluff.org, richard.rojfors@pelagicore.com,
        linux-arm-kernel@lists.infradead.org
References: <20220127175013.3689724-1-robert.hancock@calian.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="12z37EMSCvCYktyg"
Content-Disposition: inline
In-Reply-To: <20220127175013.3689724-1-robert.hancock@calian.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--12z37EMSCvCYktyg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 27, 2022 at 11:50:13AM -0600, Robert Hancock wrote:
> This driver is for an FPGA logic core, so there can be arbitrarily many
> instances of the bus on a given system. Previously all of the I2C bus
> names were "xiic-i2c" which caused issues with lm_sensors when trying to
> map human-readable names to sensor inputs because it could not properly
> distinguish the busses, for example. Append the platform device name to
> the I2C bus name so it is unique between different instances.
>=20
> Fixes: e1d5b6598cdc ("i2c: Add support for Xilinx XPS IIC Bus Interface")
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>

Applied to for-next, thanks!


--12z37EMSCvCYktyg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIf4SIACgkQFA3kzBSg
KbbgAg//ZNNjlf4ZJ2N/nI4KZUshWHf9dHFtzFoWCbLlOF6BfCMNJAj+TqaIAl/1
g5nPMdrJLQ3cwAfPqLb05yA1SvXGQB+ONKngcMfCbp0PoICTZoznSJF8ei0NYudL
RVcmXS5UtavUiLO8FDbp42e9IWFdU5fLqWX0AT9KhlewHjCA/2/gAHgXVt7QVbOC
AC6XhBtLGo0dE+HwO2vGAn0VosvRuFDqHQ0aj1xfvnKodrii4ugfOPHHTCHIzDeq
Szz7TIGT1Uf6v+5v5WSL2FycSSXhe+hwP2fmShTyMuQawQ05M8R45StzX+Zl4jR0
XMusin/xOk8jmMpI7DeCxzFqv1jtfrn+YahhyrG5Qssdi/eEkJmZkH5BFNrqVg0g
gVbS5T+yQ1Yc0Bkb9DmbC6xFWk1k5x3OmkFO+9soUFpKavQ711frJK47W74BcwJW
SJM60DE5PAGbix3EQzHQpr2eYJzItvjcB5bCQ1hr8iVGtSILzW3GRdvTxzfkpaPJ
pS+LdQYWzjGuZ9zWvzy8nrh7UCZ/S6zdeywAaWhLnaM8tK3loq0fP+yT6FWQu5hk
BUlH4Ax+SZ+MIwRnq1AdEf3jkSROpOfuF3rF7x2m/9V8TzJpBA83DcduCZMGzJrD
+9+FKb1D7ND/n3+w9GDOsR+Lq7oehQvkIZwPjXASpsC/xShmX/8=
=96qj
-----END PGP SIGNATURE-----

--12z37EMSCvCYktyg--
