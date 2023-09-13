Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0CA579E30A
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 11:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239279AbjIMJLY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 05:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239312AbjIMJLS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 05:11:18 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35503199E;
        Wed, 13 Sep 2023 02:11:14 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE8CC433C7;
        Wed, 13 Sep 2023 09:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694596273;
        bh=Eut+tfZOH+CMp6BLTDUR/L/vy1LFtLitoZuvnO4kYck=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i8f05yiZIOiGyoOar7UBghTZkyu0V020DXuqWTNert3GWMR4IXD3CNEZjR+bWXFoo
         N2AN7bgVjpHsDRO8nZFAqVAeDljlWGiirnBxsEx+EdOboF+Yxb8oDbzCegSaaVGkKV
         YaBaLHpdQLz4hWvUXn9RgB0YEygNSYmIBo5SeanrHp4Tab2nM4rSSgh2mCL1M7oIn7
         jcw+JQcJ1RC9REeE+xDRI9MTgd5iihdtdB//ZP9rNeioii35HtnRoZzFxKyrV/iMyi
         DaDvwPrKSIyrx0ysypqi+6LA1BGzciq74mnTdUdtDyZt0feGTABrgZep74ZbrJCDoT
         uRMd3KpRR+7pA==
Date:   Wed, 13 Sep 2023 11:11:10 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc:     linux-i2c@vger.kernel.org, git@amd.com,
        linux-kernel@vger.kernel.org, michal.simek@amd.com,
        andi.shyti@kernel.org
Subject: Re: [PATCH v2] i2c: cadence: Fix the kernel-doc warnings
Message-ID: <ZQF8ro+AutgV/+19@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org, git@amd.com,
        linux-kernel@vger.kernel.org, michal.simek@amd.com,
        andi.shyti@kernel.org
References: <20230831090253.9096-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sB8FqMZRydzeOzRg"
Content-Disposition: inline
In-Reply-To: <20230831090253.9096-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sB8FqMZRydzeOzRg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 02:32:53PM +0530, Shubhrajyoti Datta wrote:
> This fixes the below warnings
>=20
> drivers/i2c/busses/i2c-cadence.c:221: warning: Function parameter or
> member 'rinfo' not described in 'cdns_i2c'
>=20
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308171510.bKHBcZQW-lkp@i=
ntel.com/
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

Applied to for-current, thanks!


--sB8FqMZRydzeOzRg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUBfK4ACgkQFA3kzBSg
KbbnmA/+PN+B7hvT/1idPsZdVmC8jzjrcH6JpzaexkiwVxLHM6C7t3Peewb5x48Q
BQfoI7ZkuYu1HRygRcQ98RKdYWthJe1yL7IsJ+AmWODecdYy+48tdlsbt4iw7Kkv
kIcFvc3CdjpRGmYgqyhC6Weae19wpTm0m7/kBJ3dt4zObFsqEQ+pz4AaZor2Qpp4
NFf/kEcyJ3yncfnb27RptfeMsaVtWSwAqxahGOcKZ81c4yPf9uuXmdj7vfWXNfoB
8khZSbJrhV8X7fiaujEqe5YEFLMDigbXBWZoDxg0NSm/ZXHvYiPC9XiNK7YSxwaq
tiGEBouBVB2ELPXn1GUIts70ifF9vxr8CTXZrKgdYoWKiG7ztY02HUo/X48mT6m8
oROQz7ZZER1V9vBPxUUKyfI4CO4oXdoR/9ZP+EL7zMoSaYP7Q0fPUoRRkpJ0ZzMo
SRma0okoo73rvDZvCcH42Mu4ayez86L7Ikmw/g3r4+dhgi7LVkMgNV85SEjAGUCK
MRJucNyB1HTbv2Xx6jKQ36lu0M7fcpU/jHx41CKbg6X/2oxnfakaHRahMYtN0hG0
ZNPlW5WM+8h0dEwI70e7ajerBc/NVD2Xzki706CWNnOPoUw1wf09KQ4J/tKlGJg4
EhG0pmrvYbjXcC6fKX42z1rVoRQYnFc/6fqkf9HR2/1ms8LVbiU=
=8lLc
-----END PGP SIGNATURE-----

--sB8FqMZRydzeOzRg--
