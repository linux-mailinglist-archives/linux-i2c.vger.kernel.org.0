Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 288FE494016
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 19:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356853AbiASSnF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 13:43:05 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:46486 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356833AbiASSnF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jan 2022 13:43:05 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4AA7EB81B00
        for <linux-i2c@vger.kernel.org>; Wed, 19 Jan 2022 18:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868E1C004E1;
        Wed, 19 Jan 2022 18:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642617783;
        bh=rQeEhrFUuubE+RzMA2M7hGX5G4O0SnGfghaVa8BZX6A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GciTxeZZRHgxbWbIjw5mylnCOpHs+E5AZz4i9/FiKijjMBK8lGkQOIyjTwAmm8gi7
         vujijUIxP5bdBZ31qAelhtU+ZRm2e6JmHdZInigy3+uv12QIQAKOO0CM1fESPueyrN
         TQZ0t82qJRJwIBE/kQc/7XS/DqQTWzEvykxNNPi75veuwFLfDX/th9W9zLiDmhdrVl
         VrK1iurRg3CEA/uDyP8izqqEGINgsr2rdl9hKy3IAb3m+uKAPYMj7f7XgaZkaEUYtc
         JAszm8+i9JBvV9eAYGXOBiV6DQ/7uxyXdhoisWu/CrMwQ9eftGZWy8UPmstipMYDCm
         HjkBtpp8ttvSA==
Date:   Wed, 19 Jan 2022 19:43:00 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alex Henrie <alexh@vpitech.com>
Cc:     Hector Martin <marcan@marcan.st>, Jean Delvare <jdelvare@suse.de>,
        linux-i2c@vger.kernel.org, alexhenrie24@gmail.com
Subject: Re: [PATCH] i2c: i801: Add module parameter to inhibit BIOS access
Message-ID: <YehbtKp6QFoQ3NRt@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alex Henrie <alexh@vpitech.com>, Hector Martin <marcan@marcan.st>,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        alexhenrie24@gmail.com
References: <20220111233151.8484-1-alexh@vpitech.com>
 <20220118134705.6ae5b0a4@endymion>
 <20220119094900.7792c05f94329f584dad934a@vpitech.com>
 <dc6c3b38-dbc1-3d86-fd87-607a2d6a6685@marcan.st>
 <20220119110156.574ae2d96af6b8a722c8c9ba@vpitech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LjCAagdX++XMYiVx"
Content-Disposition: inline
In-Reply-To: <20220119110156.574ae2d96af6b8a722c8c9ba@vpitech.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LjCAagdX++XMYiVx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Jean, please feel free to disregard my patch and to commit Hector's
> with "Tested-by: Alex Henrie <alexh@vpitech.com>".

Please respnd to the mail directly with the Tested-by tag. We have
tooling which collects tags for us per patch. Makes a maintainers life a
lot easier.


--LjCAagdX++XMYiVx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHoW7AACgkQFA3kzBSg
KbbSUg//Vp25YCUuJorpILah9K5SAK9MRifbpe/vSkXY3zv6NWaoUqz/TP5sbkqi
E9zn6sh8xXxSHZbX2sqrOKlAz0/wgXsSTgNIopkDuAmIYpOZjx3DtufBS3brGWes
kHgE8TX4u7uHSxDR7KKJM1j53d9LdJ62UXE2GxxjTTNmrufaELowDi9vajQW0mTF
rJ1x6OWh9z8mQa62/TSUeX0t1EjQtaZVPlsiCAKcbD7JZvPpSQahYBgmx6/aOC94
MNnsKkLrg8P0XdYg0CiE2o4N7pbyVFJ3BjHuL6k2qW8KfBz9pmkE+h2o+gK4Omak
oeiUocJzejIAqP+Onb764FZdvBZTfsu4+Lego0jq/6ErjP1e/WUhZN7GkHl44y5Q
I1SLl+J+eb/CZ8vmH4zYZ+oeMgCTf6MkJcr5d1sPKYXWSIyiSmoOxZPaNiItJvdO
7JgrwNN2Xt7WslY5FyzlywqqPcogZWp5H/j/T0wuUzIRFcTVs+PDSKuRzvI+V9MB
0xXLZwTcFxktvGzJXYW0uMZ2CzPvoRmWk8vZm267wgrCeJlzZslmSJeYVuKYNcZ6
PKiduYtbJVnyTA/rGd1Q4kPBugPevCWPFAPJ/+wrADu3oxcxADZC77YAsz3OFChp
erBf1bOXMqTMwJ9PMsvB4tlMpY0KhvIzDSMyyL9YpBB/cFF5Y4I=
=cBxo
-----END PGP SIGNATURE-----

--LjCAagdX++XMYiVx--
