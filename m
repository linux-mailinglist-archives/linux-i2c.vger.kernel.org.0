Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6051869B506
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 22:45:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjBQVpi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 16:45:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbjBQVph (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 16:45:37 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4E64A1E5;
        Fri, 17 Feb 2023 13:45:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7709261FCF;
        Fri, 17 Feb 2023 21:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53401C4339B;
        Fri, 17 Feb 2023 21:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676670327;
        bh=USNORW4F2KLd13StIiUXR1qHnC7J7sEVnUW9KmPmB6A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uQSEvwJeeGZ8oTXsUNHUgrBjVVlOltObrOf1SMhQXgvzJI8sjs1AsE4+X+Y61cqkL
         tPLzihNqsN3/5Yvpgv0/urcILHx/oVe5VfcbPjZPvGeu1Ysr7woYghw5VIYmkv21Og
         69gnj9bEaSMME/ZEybzfoAFCUZoq4hP4GhiwLHEx7TulAvvRE7ymCKwqB0HmOcQ90I
         j/gCp092Br2BhUzOC/B45osj3gYJnSqVJe7z/0aAaEnNCAEup0Y6vmyU6EVhzHkGs6
         xkbMk8+l4ScrvECko2gPywEwB8qeI7xhBSbqptvmhPoBI46qFgmvGb8ercbBFQiEV0
         wKpJ6Q1IsPGIg==
Date:   Fri, 17 Feb 2023 22:45:24 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc:     michal.simek@xilinx.com, michal.simek@amd.com,
        devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com, srinivas.goud@amd.com,
        shubhrajyoti.datta@amd.com, manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: Re: [PATCH V6 3/3] i2c: xiic: Add SCL frequency configuration support
Message-ID: <Y+/1dO03cvNbzfWk@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
        michal.simek@xilinx.com, michal.simek@amd.com,
        devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com, srinivas.goud@amd.com,
        shubhrajyoti.datta@amd.com, manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
References: <1676467944-17426-1-git-send-email-manikanta.guntupalli@amd.com>
 <1676467944-17426-4-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="v9dWdwZ/vqGMAhLb"
Content-Disposition: inline
In-Reply-To: <1676467944-17426-4-git-send-email-manikanta.guntupalli@amd.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--v9dWdwZ/vqGMAhLb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2023 at 07:02:24PM +0530, Manikanta Guntupalli wrote:
> From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
>=20
> From 'clock-frequency' device tree property, configure I2C SCL
> frequency by calculating the timing register values according to
> input clock.
>=20
> After soft reset in reinit function, the timing registers are set
> to default values (configured in design tool). So, setting SCL
> frequency is done inside reinit function after the soft reset.
> This allows configuration of SCL frequency exclusively through
> software via device tree property, overriding the design.
> If the clock-frequency parameter is not specified in DT, driver
> doesn't configure frequency, making it backward compatible.
>=20
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> Acked-by: Michal Simek <michal.simek@amd.com>

Applied to for-next, thanks!


--v9dWdwZ/vqGMAhLb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPv9XQACgkQFA3kzBSg
KbbHAA//bWv7c9SD1ZqJg8loddrZ65QP1kQeG+s8WjWCmnEHcnPg+YdGmahUt+64
6JgM7vFV5KSPakzk1Ra3rK3t56H627STGN1FgAdcKVorGAiS+ZruhXgij49NL/46
7Ut9iStQAAuY22SnT8JoefcRgb2OKs87zJ36hZFZNe0+ifnpmU7KNRfZu1cShxSk
a+1kHshrk7cYzUebZXhieugVWLyHwSSO/eO3zX7z69YDHdWPkwpwTq5+faUDnFaN
ekM+vEwDAAWmpy7VVFF0/xtqMWbRRZq8C2zcCDTbbGK9kTeSLrS6j7JWjcA0Qql0
u/Ej+v4K4u0PvkYUSFzI3Fy7qShIyx0PVkrSUWOtSfrvgnH3dm7daUZ/4kQu7A60
4Q3ACu20/+YcmTtab4MH3hl4FnR0rIxYqL/A9dUaFH6TtcGe5MgthbClICpyZqYi
jLPlOFtnqXPwJN4m+ZuHRYtdYN6cgADZABArqiVcSYbH9bkkSbTRieeho3v+jdTf
DTb91PxLaZ/eY7fQ1EmyLT44Z6w8AqydNuiLa1bmj2bkrd9WPf8YFQljIt5cWfTJ
ZtHgksGE6VrBMdh0bgeYIgnS/AMpNxJPcdyQ080JWPy79kpM8J9DnR+6k00RblrD
t2fAdvmFM5Xngkfqf63SOVEqCsw86ABY96z7l7AQovH1InV+/Vs=
=5+yg
-----END PGP SIGNATURE-----

--v9dWdwZ/vqGMAhLb--
