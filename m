Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3575BB310
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 21:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiIPT50 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 15:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiIPT5Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 15:57:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D19B6D68;
        Fri, 16 Sep 2022 12:57:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 182FEB82919;
        Fri, 16 Sep 2022 19:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2545C433D7;
        Fri, 16 Sep 2022 19:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663358240;
        bh=vCLtuY1TpVMliumE5DbT2WWZvJ7/teLjaPmFO/zeNJs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IOX0u1Ga5jI3fyqBR9wRY7ly+OLINlk+lX+/BsGejMs60jVRDL8sIKqdSt3XILF3S
         3K8SPRau6FUTQjVtbE6TEJNBmBOBPcPVQXi8OX57u4C0HVoKJPkMEEJ00ksU2lEwGs
         eneNMJ1+ZnjxnQkCh/cvuyCe2+sDYCEoDJMO2dCn8QTVKtHj5HclYZhNhoQ3rUjl8F
         tLS/O8FsgwubYS4qOpznp7bdKsC95dfNfY+vQCoCjDHNxc5H6XhL91QFFlfKlKIRzu
         6tQdmHN/uGcOz3u/YXt0EebKPWSOF1vo6zXrc1qJQEZh8QfmRKs6RTMPWgVqS4lGYT
         5hmw0V5iFK+MA==
Date:   Fri, 16 Sep 2022 20:57:18 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     kever.yang@rock-chips.com, sjg@chromium.org,
        philipp.tomsich@vrull.eu, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        ulf.hansson@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, kishon@ti.com, vkoul@kernel.org,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        gregkh@linuxfoundation.org, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        zhangqing@rock-chips.com, jamie@jamieiles.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v1 02/11] dt-bindings: i2c: rockchip: add
 rockchip,rk3128-i2c
Message-ID: <YyTVHph1bCF/gfjL@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Johan Jonker <jbx6244@gmail.com>, kever.yang@rock-chips.com,
        sjg@chromium.org, philipp.tomsich@vrull.eu, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        ulf.hansson@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, kishon@ti.com, vkoul@kernel.org,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        gregkh@linuxfoundation.org, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        zhangqing@rock-chips.com, jamie@jamieiles.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <405db21d-154e-fed0-7524-ace1cef0203c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Vbp8ZsxZHEPG+tBR"
Content-Disposition: inline
In-Reply-To: <405db21d-154e-fed0-7524-ace1cef0203c@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Vbp8ZsxZHEPG+tBR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 10, 2022 at 12:02:30AM +0200, Johan Jonker wrote:
> Add rockchip,rk3128-i2c compatible string.
>=20
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Applied to for-next, thanks!


--Vbp8ZsxZHEPG+tBR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMk1R4ACgkQFA3kzBSg
KbY8YxAAqkmITIjJchmw2BH4eehoxFiSAW8VYh6gojn2S2RgQjSwZsHnR8E8FMIu
eUeROZH0Wd/Mihi8hLz9Fm3/aTSxUss5Zj2hzFr2RGOHqsicHtx622HwdTakfM08
6NFWuuBya9tGX4iujN+oQsnI1NA8mDPNEIE8tMEh1wBzOY5m/ijAJLIALJ/cB/qj
4MGIK9aKg9PfU3nSd0b+9Dn7iZDClo6CnBeKCAHhUeF+DoKzdLsl3FQzNtcIxS1+
+NL48AB8Kst01hfZHKpuUriTDT2lXfBeQi5NEKNRyc+1fEWBshPat1tYRlEfs9BA
WAHNZkh3q8qsSDPh2lufGmmOhuX3pUumWAwHfHgbZksNtPj5ldSTXhUciPPHeufb
Rf+Ne4WaMMX4JOJJ70wMKn+ycaJYRulfiOacroqTqTH7rSX+NuioTEtITA2KMa3q
4WfMmHrJe3qLPhEkLXabhrYwMcAWkHaPDJ6dJJbHfxRtR0F8y0DMpyJrCRsF9TcS
+8Hqcq+y5bxc9n/eDxSrSQXXoEQLBFjGeJfCz4D+n6oOWv/6dxMe8dZyU7vq/Ea8
0DApwW0esWTGZuuV5r2xmncP/4+spn2C2FCOI1ZqCPs2T3Kd7DPBEMPnp7UQRZFO
cVkNoe0c0N9yQjMEVi9+aqqDWefE6imYt3d3PXqcHEYoHYqHON4=
=t7C7
-----END PGP SIGNATURE-----

--Vbp8ZsxZHEPG+tBR--
