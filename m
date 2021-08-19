Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 757D93F1F00
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Aug 2021 19:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232117AbhHSRZH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Aug 2021 13:25:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:44310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232969AbhHSRZF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 19 Aug 2021 13:25:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB38261075;
        Thu, 19 Aug 2021 17:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629393869;
        bh=KbzYgF4Sy53ZuirB0lvneIh/3iisHVfmHDhYsyK4XIU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oyiyF6X3LCqd5jewhmU+5HfJ9QivtiexrD6RIeRsIvfvPR0Xz4ZBSjSuAuDv5PRau
         jCPFlgMHda3n9k580KXa8o8Mi2y7by8OLvmgdUtbQv6H9HsSrF75kAdU1vM5wu+ZVL
         u/EevEv7StSaB3MED4smjVUBDCmhhdRIrDQzy5v2ai6K0mc0fjPVOD8gNVxANfI2O1
         5fcoUHyZbJfgLHPOtLu0zliS01rcoCy8ensuJ6VTND9+By/HopqC0/EVhAgIkGlFrV
         kYA/SvVBfHq7o4nAMRAg66+8TUlyUJtkAbFghdCWXFmOdjXIkJJedJScVwMMDij9bU
         MFyD6s8K8FMFw==
Date:   Thu, 19 Aug 2021 19:24:26 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, viresh.kumar@linaro.org,
        sfr@canb.auug.org.au, conghui.chen@intel.com
Subject: Re: [PATCH] i2c: virtio: Fix the compiler warning when CONFIG_ACPI
 is not set
Message-ID: <YR6Tysn548x+2Szz@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, viresh.kumar@linaro.org,
        sfr@canb.auug.org.au, conghui.chen@intel.com
References: <4309f869890e70810f2c40a8d60495240e318303.1629333590.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="flWGK3gheJDnxcoG"
Content-Disposition: inline
In-Reply-To: <4309f869890e70810f2c40a8d60495240e318303.1629333590.git.jie.deng@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--flWGK3gheJDnxcoG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 19, 2021 at 08:48:41AM +0800, Jie Deng wrote:
> Fix the compiler warning "drivers/i2c/busses/i2c-virtio.c:208:17:
> warning: unused variable 'pdev' [-Wunused-variable]" when CONFIG_ACPI
> is not set.
>=20
> Fixes: 8fb12751ac78 ("i2c: virtio: add a virtio i2c frontend driver")
> Signed-off-by: Jie Deng <jie.deng@intel.com>

Applied to for-next, thanks! Since I need to rebase for-mergewindow
anyhow, I might just squash it into the main patch.

--flWGK3gheJDnxcoG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEek8oACgkQFA3kzBSg
KbY07hAAgITMkKNwCFQbuyyywSxWgjPihrseu1b5U5SxyHR071H3L0Ec0qwz3YpW
inPAANbk0RtPEQaDfY2euP42A1HPA8BA2P2QG1wrG7j+mkE+e5E/pPJ6Fm5Gvmrw
WXPtVuGv3FePr4Adc3PTGeE3R3/t9Xdm/Lsgl3Gm80FsEYolQWpinpiiyu6/r6Lr
ZLtR/yi8h+diXx/qB59k8nKNP3S1g/ywF4TTwKkncitahj6N0/Ii1AzI7qme3rbX
0arhenE8vqq23rpcYIZoCXT9nYMa1q36oS1peO4U789gTH4EsjyTykUhk/ZmgLxo
t7Y7od8C18NWv7iqsMmxiKOmPIXxH+I3cQYrC/BcsU6C4OVk6dAeHnO34ZY1gccC
Dt6CEKp9S690RWR7J+sYEg/F6eXUOnZhX5LGCR7jQpf+9vctmKaeIUH3FHSmz/VF
LyxbrC4Sg0STRfXu7gYv6R+DFRJXYbas90ylvJn+zc+FLE6lPDxS5DWK3mXbxger
/Rl33o0NHKJlP3nWNuB/Wb8DcQBeoKXQi/QzkceTFSDdG00MYhsmxtcmO5kpVGZm
wzw7hGGpbPOjKIDsjEfoZdNfobtCYCBoNSwjndfFhaalkLz5jFX3iGE+vyVKyrNh
Eqc40XmBlY5SbG/sXrfEd5duskq+moJyBKCaywzKPE/alTjmmt0=
=WFAy
-----END PGP SIGNATURE-----

--flWGK3gheJDnxcoG--
