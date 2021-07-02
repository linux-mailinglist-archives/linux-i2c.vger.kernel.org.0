Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD573BA62C
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Jul 2021 01:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbhGBXEJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Jul 2021 19:04:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:41716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229648AbhGBXEJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 2 Jul 2021 19:04:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6060F6140E;
        Fri,  2 Jul 2021 23:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625266897;
        bh=bM3A5UidT8fI6f1r1MObCSjrzfca4+FhgMz0lIMssuo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SwAZBx3pnTXfMJvjSDD1MamyR9X/kTrvJrydc80c5GGiIYE2oOqN2U0XDUD7zg/Ij
         C3n556WogQvNi+5r8zClpQ37GbfaMeJziANpnrSqaY/rIp6yaylWJ2+cXGF2fje43I
         bF5AzESLroFh2WBZoQbd0xM33r3tj7sW0XN8Vwyz+2uU5udB96ThjoohzsYePVeP5s
         opHy1zcI3gtZNxTEQ8YyRTVvipNEL1gU0/7+FAAnjWp1pfvA57kcnxt3EHjCAHpd8X
         K3KCI9MX6l0pPbO41zLD3/oTvFMnnLcHCLkTjEMK10ptcgnoU4l+GcrgTmY3GPsViT
         FWD8tZWXs2k/Q==
Date:   Sat, 3 Jul 2021 01:01:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, yu1.wang@intel.com, shuo.a.liu@intel.com,
        conghui.chen@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com
Subject: Re: [PATCH v12] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YN+azpQsgAK9MbYd@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, yu1.wang@intel.com, shuo.a.liu@intel.com,
        conghui.chen@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com
References: <f229cd761048bc143f88f33a3437bdbf891c39fd.1625214435.git.jie.deng@intel.com>
 <YN7jOm68fUL4UA2Q@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IxARlzPRJnfyHLX0"
Content-Disposition: inline
In-Reply-To: <YN7jOm68fUL4UA2Q@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IxARlzPRJnfyHLX0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> It's _BITUL() or so from linux/const.h.
> https://elixir.bootlin.com/linux/latest/source/include/uapi/linux/const.h#L28
> You may not use internal definitions in UAPI headers.

Sorry, I missed it was an uapi header and gave the authors bad advice
with BIT.

If I get another fixed version by Saturday evening (CEST), I can still
squeeze it into my pull request for 5.14. Minor details can be fixed
incrementally, but we definatel need to get the uapi header correct.


--IxARlzPRJnfyHLX0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDfmskACgkQFA3kzBSg
KbZLBg/5AeU6TjKkwB4I79xJ8UhpHUBAJ0CQWQgCo/7pcojSqebMzQNv0Y9052rJ
oXT8uYDUEbGUayMp8Vd/MKLXjvJnPdHMtzyICtj5w83/9pZyhgd9ObbNfXJcdM5d
ViSEIzWo+9JaeN7eNHk1iFmgqgKw6OIZtdfnsJXD/DrkSrULFdUWKGZAii9mgS0S
XMeq+Wbt6xb+bhmIfi/Pn5O79CcPRkMRZZ1ClGlm+KciLaMKl09YJyua69oWlXrh
0/vOmRMwyI9j9gWunrzgBZGq6k7it/7Y3xewkak1o2La7snoN3TMu+FFQ0pftbPD
A5xvI9Ffi4s/suFYTAcdLjHfTZ97qDkxNHBnzlbPy7nVPWN61XRoxj2RXmqdLg0h
aoW+8dTLDT8qTV5zlqm+KnJpe6YHrzPnvr9rfpPZrWV2vMVfEyhoHCiWS+sDZoFH
VB8jWe6SiUQD46pW8NZzySO5rYIIVPFrz8ZuZUY64RxUGXBUU/S9SD59itVJwfk+
BMVB2xespgxuJ+V6bpECUZW41S7hXyDgVPaFKIfT5KC6wVeiOlwfYAEvUEtRHs7d
cRUC67Pieypuuc5stD0HuG8e93BJZDdYXXO/q7Iz7/PHR/hxm26ou13o3YTDQzJb
xlhSTHGAAjbICjwaaY5W09lxYoB+1TTtKVIrHmMP8TzvHIOSkXA=
=uVsf
-----END PGP SIGNATURE-----

--IxARlzPRJnfyHLX0--
