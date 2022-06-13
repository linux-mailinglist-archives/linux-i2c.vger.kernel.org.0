Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95D6D549BBA
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jun 2022 20:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242035AbiFMSjD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jun 2022 14:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343691AbiFMSiW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jun 2022 14:38:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA584EF4B;
        Mon, 13 Jun 2022 07:58:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D44DBB81058;
        Mon, 13 Jun 2022 14:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE5EC34114;
        Mon, 13 Jun 2022 14:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655132324;
        bh=AtniC0eJkDR5/lLb+bWQNBve4k7kz60lS+Lip7itflA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nDFMY9QYfPxcap0I7w9dv1UnAtXFCEkntc8tqkQ+Q7XX615OrKZnE/y2xbFFGmT+m
         dDMRgrkJrtnBXDBCxnytqfdd/8EjVuFLxl5u0nLulRP8enviTFhN/ZdPw13DL9LDih
         9Gnp7+t9s/it9oXt/uEOLsYqEawr0pyBufjguQnUPaaZTiSKRWR+GdxHa+oX5r9Z/0
         aDRvnX2vthNldQ5OqUFFVwiKp80z+k5ZPxaX4VzcUGUyjqtqQon5hNaiZgHc8NVUDR
         MYgEQIB9sngtbbqGOpavFkJbe2tkDHUK1u4fjyhSE4MU01r07GwbsqpZaYD4uh9v3E
         WEumYYTd+NwnA==
Date:   Mon, 13 Jun 2022 16:58:40 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Codrin.Ciubotariu@microchip.com
Cc:     peda@axentia.se, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Ludovic.Desroches@microchip.com,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, kamel.bouhara@bootlin.com
Subject: Re: Regression: at24 eeprom writing times out on sama5d3
Message-ID: <YqdQoJbsgwjQ9PYh@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Codrin.Ciubotariu@microchip.com, peda@axentia.se,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        kamel.bouhara@bootlin.com
References: <074b39c5-55fc-2bc1-072d-aef1070e284d@axentia.se>
 <2bb4868b-90ab-887e-bf13-9de8b79231bd@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4y9tLbk2+pC88VOo"
Content-Disposition: inline
In-Reply-To: <2bb4868b-90ab-887e-bf13-9de8b79231bd@microchip.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4y9tLbk2+pC88VOo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Codrin,

> could you please apply this patch-set [1] and let us know if it=20
> addresses your issue?

Any comments to the comments I gave to [1]? :)

Happy hacking,

   Wolfram


--4y9tLbk2+pC88VOo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKnUKAACgkQFA3kzBSg
KbbfLBAAmTZMUsDejonz6ghBqRZNjxQUHOkBjzcun2R358W/QmpabM3JhLWxoYF8
7d8BQDy28IrRYXgWvAdqZ7X9GzrO4J8+cP7ZnfafKWTlhUJDqFqeJSl0ZnJ0GsZk
O/+LB0snGoP//zos2d30AdBeTL5OvVIDYNSlrXn0TjQ3SMGibvvaXzbcS/+9oNNS
MqynO44hsKdeToTxE3PHsRIzCez03PXdhWQ1YiKxxMvuZW+1DRZwlS4/5cygEiKQ
9AGL/Hq25VGkzVhypCLJBG8YVj8NZ+yZDKsSHe7297XGKURUC3rAmob6diviB7VH
UX9DDZNpLer+umAE9mFIuL0cXM5QQR6Vj2HVFffpy1oQJqlNA6K7Zu9sxbUFs/jl
meih4rLEMeSgcV8OKmUhcp3LT9hkd6kTUPWwIWML5xE+x+04gMfuenzebUUI/62H
VDRapubhMOYCMRIWDs10T7293//q12QAJtiXWfPqMAr1zkNGPGte8y8snMpYs//S
7FawMiCp/FEr25dT5DgF1YQveg9HALh5SQ+YIlWNVapdRCsJxXERGhCFnsUS6Wja
kCJqVK2Vyn+Za/uGd4Ejt6vJ8LRrbrS4ZAlrVT7UwGv7S8qvwbTAXz0zYRnTVozj
pMHJxXSi57O7EV3XSA2uFWrj4qIy7c/3/0sey87hAcGe46BYSqQ=
=GnAC
-----END PGP SIGNATURE-----

--4y9tLbk2+pC88VOo--
