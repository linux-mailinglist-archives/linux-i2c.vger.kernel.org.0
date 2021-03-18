Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0B0340407
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 11:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbhCRK4G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 06:56:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:49052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230394AbhCRKzl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Mar 2021 06:55:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56BDD64E07;
        Thu, 18 Mar 2021 10:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616064941;
        bh=DnDnR/amy0tbA1uOOeuAEvRXaySTXCSy8QbqyiVcoFM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NbV5iHQfjQjT8vKHPrSs7b0Y4WA2kl9hpA6d2WjiBMnR8aXebHNboo/qZP+7t1//m
         s6PZ2HxgEXNhGB1yZiRcDwsUavh0q4EnWnxWY1Or8cRgcqv6tYeJeekkdKm/Q1s516
         Y/c6oIqCsSoCR+1GAHFDs2P6v8xR8BxaQlIV0irfFxQtvEDlRXn9irIovjgPZuyIyx
         TKGYYm3UtKtYs7FXiKOWV/sPIB46gmaeqBIyN2E+nanPu/5+QMH3U0Yo4xnIA6wuoZ
         /N4B8IsV5KPALvHYLmJyngLdcWhxNSokVcnodwvhrdLb/PtzFqLoVHUpMMf100KoET
         UUvzSHMHTiL0g==
Date:   Thu, 18 Mar 2021 11:55:37 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com
Subject: Re: [PATCH 4/5] ARM: dts: stm32: enable the analog filter for all
 I2C nodes in stm32mp151
Message-ID: <20210318105537.GF974@ninjato>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-5-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="K/NRh952CO+2tg14"
Content-Disposition: inline
In-Reply-To: <1612515104-838-5-git-send-email-alain.volmat@foss.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--K/NRh952CO+2tg14
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 09:51:43AM +0100, Alain Volmat wrote:
> Enable the analog filter for all I2C nodes of the stm32mp151.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

I usually don't take DTS patches, but they can go in now via arm-soc as
I applied the patches to the driver.


--K/NRh952CO+2tg14
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTMakACgkQFA3kzBSg
KbY7aA/9FQ41fh4wwSbiUTFPrcQMfKbF9cQPBfLGXmFBBGN6/baEyWZUxDWcOfFk
Q+XXFTWInRwTNgsiA0RsXokke2zn8Pq2Bi7Aq2rzmI+sPJMHCSsa4Yvm/rYdFcnR
ckuOqWr+sifZ/y0yaVyH9V7aFbIbTLcs0TQaqEpi+mvFTRCFQZiJLarHEDLYelU6
/s5sVO5AKgWP3PSKn2Xpngt3dldXzT16aj3zB/V5K93JtqqsGfIQ+DFeV4/WUnl8
8cnNRNqQnsXzbw7tsuoBkU1hwZuW2nKWzc0GB2xghHf5mAixBsj2IfPS8ZIUHhF3
ZTNB9u/3Do22tylCYxrZcJi2QgdW48HxWAsblSgYD8Wx9v+WBeQQZRK0c71+y7nZ
DXWt8TkiJpOymkbqpI63Z9Qf+4aY1VgO0aNHQevJoX78kLeo+SrIh6Ok3472lybR
DteS/lkUm4kKHKtJiQPqVOpjkzFIBOHRuCvZgq09TyIz/yKTVw+xkXKPxIhVjzUp
8ihrc0YgfKRzJTu/5sZLTv4lryQHuIy/M20GkoYxzJLRiwE3FW+SV2oxFjiqu8Am
n8WtIQpG7wHtsPFlaXIgKotXIibbNlUxxd2aACYX6//FkDhPbdQBEuajfq810Luc
p/ux85f/vDCzGXFdn/QjTACvCuz84NuTpUKir+d9WW0QQsSC7Oc=
=kVvg
-----END PGP SIGNATURE-----

--K/NRh952CO+2tg14--
