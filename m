Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F332863FB82
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Dec 2022 00:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231908AbiLAXBZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Dec 2022 18:01:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231879AbiLAXBG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Dec 2022 18:01:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB55CA790;
        Thu,  1 Dec 2022 14:59:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E1F9F62184;
        Thu,  1 Dec 2022 22:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3905C433C1;
        Thu,  1 Dec 2022 22:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669935570;
        bh=0Q6h0ed5CVC0QVvSPzxIJurFaXRKPTP5j60mgVA2BAY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G5t7LFCAsO6+7Nc2MF2sOWx0hRAQbXveSDBDxcedeYZLxIR2Us7at/BKWGJPLr+Yz
         X7G16giKDBHIsDDS1gk7vtHlNMXUeT0OfhPX8OQEE8OfI7r26I2/Wa/dIxNQsxXAVT
         QMA31GvOF/FEaSCVN06VudDHyW6iked+oDVC23zpj/6bW/Z+5XQutM4WJfOZUqTFev
         ZuVVdNTKK2j/WXnoWBArJrI55TqYzXZ0+4qhl7r1fYm9foxf+SlUtcf4tYdHj5Nz2M
         2tVO+bPGi2ECMeTQ1emZzh3rypAKmmr99jwxoaUsGIlBZSi/xgFSEZoGN+JK/ZhGD9
         HWp3X0zPL7ztQ==
Date:   Thu, 1 Dec 2022 23:59:27 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] mfd/i2c/extcon: Add Lenovo Yoga Tab 3 support to
 cht-wc PMIC code
Message-ID: <Y4kxz+fzsLduXaUa@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Lee Jones <lee.jones@linaro.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221127182257.104410-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QhIvpwkjd+QgQrxo"
Content-Disposition: inline
In-Reply-To: <20221127182257.104410-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QhIvpwkjd+QgQrxo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Wolfgang and MyungJoo or Chanwoo, can you please give your Ack for merging
> these through the MFD tree?

"Wolfram", please. Will do!


--QhIvpwkjd+QgQrxo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmOJMc8ACgkQFA3kzBSg
KbZT6A//fuwlkXcd1rehMWzzLR2KF3PCFbtYxyUGxa5fT73AZ+XpzpMZu/4RfODC
p+7DkdG/kHkK9HitcgihsdBBy58lM/zswzipM6ta3uhQam+KbQsu9tLC/YjsJCnO
EJrrTLjNnwZ4iqBfM00x5o4E/oorLatHw2fI5ZduPgdovP5CPuQBrbi210itbQQY
ZulyBPmzaTIxdxQEI6JenRT8Nu/WWQTowakLVfR6MMOfJROg7lKbZKTLsTKZscBE
+Ui+gknakfU6/d4NrTW3MiTwF6x9bYnHxStuM0Yii5O/dUSJMZ7G+tnabeh5DPY6
SnvPB8qiNK8nIYQFHGIBgLdSPLgvjOJLEB06ew1z/+EoM2qFMZoF41n6zoRUqKm1
GWTizoYLQ/ObIEyNX5VQ2WOC56uMvY9dq8x1o4Ox099nqm3y7DZ/3xC1SVVhOOcl
Y67HXdNN94zaROB2HetkocDPDXb1ri9k1J7WzrPLd9xvExSnOPqwD4QT/RE/lElF
HyDsER7+OjCHnP5dKV5wy3jJgiSUY7vDbpgk88UHnyDJpN1pzcapHMkcAnAwHVdQ
1Ej2pUsxz53/1Mx+40drrt2+AadVPiOqR0l59b97VMLXX7DNJazdU6Du4F8d8y+6
shqcb5Tsc1XReWNy8PURYtYwsros2SGMCkO7akSb2IF9Gkdy2VM=
=UQbT
-----END PGP SIGNATURE-----

--QhIvpwkjd+QgQrxo--
