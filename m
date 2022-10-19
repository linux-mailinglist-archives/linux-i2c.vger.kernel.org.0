Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAC5960506B
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Oct 2022 21:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbiJSTbD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 15:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbiJSTbC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 15:31:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C197689821;
        Wed, 19 Oct 2022 12:31:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5D94961846;
        Wed, 19 Oct 2022 19:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29522C433C1;
        Wed, 19 Oct 2022 19:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666207860;
        bh=lxqUO53FTMvnN5iVWeV2mFzjN5pKJ/WSgIlyQR50yL0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sDfN20lFFoN3iMd2jYr9NaoAv8Ue1YUJhG0Mu3KYeqax98nUawQCjrhOrBUWFJo1T
         sk2CDGFquDA1zYisqL/zhh53aa3atOCiiQjiUGvjdtt4Y0dqvEaTJWTJGFf2QOaQry
         NnMfgBSymaXoxzI/c+HzRO2FqJPzhht5/IgcKD3UEx/uA4QBwBA4r+N10RvXSQOUjM
         EscP3Iu9Yj7V3BRtQ94CzGSF9vOslMIHMFEW9uCzBgsNSZa+R+LKE9FadKQIyay2+O
         e4IrH+zfa9FYKvoSQc/Z0hIdAJeSAj195yCaQfXaeCpunY+q8DJe2LsGbDsuocCRtH
         79CVV8SlsbD5A==
Date:   Wed, 19 Oct 2022 21:30:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-omap@vger.kernel.org,
        Lee Jones <lee@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 13/17] ARM: omap1: remove unused board files
Message-ID: <Y1BQcTerTBNXRBfu@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-omap@vger.kernel.org,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20221019144119.3848027-1-arnd@kernel.org>
 <20221019150410.3851944-1-arnd@kernel.org>
 <20221019150410.3851944-13-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GlgBPxotGBFrEguU"
Content-Disposition: inline
In-Reply-To: <20221019150410.3851944-13-arnd@kernel.org>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GlgBPxotGBFrEguU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 05:03:35PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> All board support that was marked as 'unused' earlier can
> now be removed, leaving the five machines that that still
> had someone using them in 2022, or that are supported in
> qemu.
>=20
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: linux-omap@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Wolfram Sang <wsa@kernel.org>


--GlgBPxotGBFrEguU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNQUHEACgkQFA3kzBSg
KbbYdw//QXhm8BHTPd6JLEkbUsO6b7c71ADV97GkHPEhFYPDntiQuCq5RylfRwvD
MzZAW2/386H1R2Ll4zYM5Zz15/SWt0AoCzQkXJyunIGBGnsWjBCuDPYbMEj+sMtW
rdfbj10dmVHPqKmTPwl0sgawyvj7PxYF/pOUgCLIkYAhxcU+i0cm5aWa5hVZvTDt
FhPnTRIKhhENOqJPFfZAg1VtCmc8QhjaqEGcoyZeEjOLqJL1boaLFLEC73oRWCMU
6z4AFDeLksergb7wY9XxQnxgyeHS1jJadSQWuGgUfSi+OntWO7dGEywv878WwMAr
c/XPgzqBIJX9P9lo/uJgcMUx5vPpLgSExfrqF9Pz8A5umWQCNnbK0dP8I6RNTS8j
YwyTnitP3vmHVcW18VUS8Qyt90pBQix5f1nLBocsavLcCucgYXKZ0zeI3fBOVG4D
Yr34Svz3RTKP/AZ8s1PMC3V00pdpzFEWwbTku3NT0nAChVcfseMzjYxBd6y4M/2t
+gAkVlSK6zkCEwXZIXrWIub+3ubjPG539yItu/EmVIS52FrzokFo2i0bgQyPcfGn
YBe6FZ/IuAz5hTKgctlBQ6RG/lbuZYcs6LwYIbQEIU8Mw0vayaYsrA6Hg/ePQSvD
/jyH5WnL9WFH6LsbO40MQRmU/8NzRWt9lbUJqCs5/yTIlK2x99Y=
=NdiZ
-----END PGP SIGNATURE-----

--GlgBPxotGBFrEguU--
