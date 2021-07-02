Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 641FC3B9CC2
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jul 2021 09:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhGBHN7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Jul 2021 03:13:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:44174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230061AbhGBHN7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 2 Jul 2021 03:13:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D38761413;
        Fri,  2 Jul 2021 07:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625209887;
        bh=Mibvu62IOZe2Lkw6vM0fw4PIqKEB5Yf0+oQ0fBY65rA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FGAanDMohkU6HiTxQoEN6+rBM8ZzqNW2TlXN0ah/6M/RH3wmp39OIIKTXyvtQlkRl
         0q0S3YZCTH1It+JcHuKuU4Jsr0t0kyQt2IhrqAZOsTOA7JqGBwqeCpShIxcL5jdHUY
         9WBIv7/9X774gqAlb94fpHRq7C2rD33HKC+znENS9Cm2kifEmXxU0zjG18jhq+KRze
         0Cmrj6YLyw60cYdlT1q2G2ICz54Z2e4etIHvCUcONBfdAkN1yxSQSj7bWJ7/2duVhm
         7iMRYUKtOLTl5x56/OtS/pzpNfyX0iGnWd2mTDgTaBWWO2fik/YBAw/WY5YodYaJ3E
         fIGlTHICsWHWw==
Date:   Fri, 2 Jul 2021 09:11:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
Subject: Re: [PATCH v11] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YN68G3zjSuvTuanF@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
References: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
 <20210701040436.p7kega6rzeqz5tlm@vireshk-i7>
 <YN4WeJCepCrpylOD@kunai>
 <20210702045512.u4dvbapoc5a2a4jb@vireshk-i7>
 <409b6cc3-3339-61b2-7f42-0c69b6486bb3@intel.com>
 <20210702065625.qielhnfyrlvrtrkk@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/XUpIFFYNKrrMPwB"
Content-Disposition: inline
In-Reply-To: <20210702065625.qielhnfyrlvrtrkk@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/XUpIFFYNKrrMPwB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The i2c core doesn't club requests together from different clients in a single
> i2c_transfer() call. So you must assume i2c_transfer(), irrespective of the
> number of underlying messages in it, as atomic. If you fail, the client is going
> to retry everything again or assume it failed completely.

Ack.


--/XUpIFFYNKrrMPwB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDevBcACgkQFA3kzBSg
KbZbeg//aCI91lCZMHm+uJ6uUzNvwe3b/KoXnF+kTdGaJBIMvjRh401GcCHNQhMk
LLif2oTFCKdGOR1bzHcxedFlk7JSD1QjOYz1GWskXYEmdFVUcm6+0WQY6+ljaH0D
F/1Nef30Y+BbQsWt8hSgzpRWtLlRtXJ2r3I9Oux6jQ8YzclR4kFe0FokzppZDzt9
EIT/eb2IAgoRdGraEkPR4XwzaPDRMd933kqtihb5FaH9Cd3v6pAogrfP+xFRpqW5
VFl6NSg05jBbDvvH1SQWqpcAOJ+tDqibEMdPHjiXBhrv62TgWzXEyvpFVSbUS8pf
iFPQDrL2W/N5DG7Js1edD/hgia9STt8Vd/GXf8FVAXDDK69bkW+NFXHf0AQ5sdAA
5fzlc/LaLqekFwMy57nlv/uX23jVe/4K6A9Ptz9M5HujIKV4/KReArQbcldpAaxT
lbq5jhyhhJ6RaEY43EjENqCCKatkd7Ztbo25zIJeQfvv0FRsqw0Bj67Z/smwZF3U
rkK2awmvT0NgfkTRZ5ARMyPjRVO2rctwekv5PXICODXWRxEo8f7ngYSdvWAZx/WF
K/Be4l3FkdBgTPJO5fBUX/pNgMC++36r9mfMLhzi8iYesmF7+75sMrfzi+ZJ6EV5
tXSXK794Tfi/vFfXftBRstRb6q/IrgA1xfi1uDSEgdpk6x4WcXw=
=w867
-----END PGP SIGNATURE-----

--/XUpIFFYNKrrMPwB--
