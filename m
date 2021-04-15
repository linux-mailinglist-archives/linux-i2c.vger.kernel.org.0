Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1AEA361373
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 22:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234779AbhDOU1U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 16:27:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:38392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234662AbhDOU1T (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Apr 2021 16:27:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2F6461107;
        Thu, 15 Apr 2021 20:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618518416;
        bh=3tAdp4uGytyji5yVTRNxBTZf4mC1S0xgDY+sqQka0mM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DmT1vWrmeMze49BpinMxOu7Q046MbMsEUdgoiENiMZkwdb93IVbFenjydU1d3Znja
         28uuU3HRD87Xdm/hDCAGhD0VsJ+Y+XjJh81NGplMJh158IfkR70RdFcKjr9+H6syyg
         xDB79qicA1mKBTJ0IcXgFiDBPOBLahPec7EW007GZ3K256nzsdZv9xZipQx6ONX45t
         G9ahbT5ECif5hxFMXZzKwQ6JluVZ0bVI65rEStA+cWAIw6Do8Vn+ratk+F5Yy136Vb
         QJqb7XtW+eXWs6fKo7Q3FP6cm2oGISGCERTcHpq+iLskmPSaVW5R6kag9BdbT9aAd4
         dcLB5sOxNpkdQ==
Date:   Thu, 15 Apr 2021 22:26:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH drivers/i2c 1/3] i2c: amd8111: Fix coding style issues
Message-ID: <20210415202650.GA6471@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tian Tao <tiantao6@hisilicon.com>, linux-i2c@vger.kernel.org
References: <1617613430-11921-1-git-send-email-tiantao6@hisilicon.com>
 <1617613430-11921-2-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <1617613430-11921-2-git-send-email-tiantao6@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 05, 2021 at 05:03:48PM +0800, Tian Tao wrote:
> Fix the following checkpatch errors:
>=20
>   ERROR: "foo * bar" should be "foo *bar"
>   #189: FILE: drivers/i2c/busses/i2c-amd8111.c:189:
>=20
>   ERROR: "foo * bar" should be "foo *bar"
>   #191: FILE: drivers/i2c/busses/i2c-amd8111.c:191:
>=20
>   ERROR: switch and case should be at the same indent
>   #201: FILE: drivers/i2c/busses/i2c-amd8111.c:201:
>=20
>   ERROR: switch and case should be at the same indent
>   #359: FILE: drivers/i2c/busses/i2c-amd8111.c:359:
>=20
> No functional changes.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
> Cc: Jean Delvare <jdelvare@suse.com>

Applied to for-next, thanks!


--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB4oYYACgkQFA3kzBSg
Kba+hA/7BzD2TDXd8vIVoiyv0aMsTe1GMderGleC8Q3V8RpSXFEgmAREr3Y+rNnE
VXIEjNeYbA4F2Mps7yfufG1LnEmE85lA55PkKEfbFzcnNfvhm5GRJwIgPRdsQ90V
SWNfVRWb9utd9j9kAlCbxExC4o0BpLm+7s+7VcOcoTe2IeORQe5M1cma+A2XPtUF
f+Dp4WeZp3VYwEZAu7e9FYW7oTrUtWqqK++NA5Flq00JcmmMTd29D6d6ITji+S5j
UBMuYB5Ik5nr6bjQpixHGA5Ec9GE/knL7ikaQj5KKVQmctfIQXj3KfwWF8Sve357
TZXa7D/vzEiVGWfHmi4GnfvEjEB92FZLsFWwXeMB41SdT99N+4kNvldQLFh2hU89
NoEV2ERS2Zp6hmJNZSRjocQdZitsBhAW6Dc8TxsznVJnqZZ69+nfvl9iOJnFpZuZ
a+zfxRKnWkqI426AAstg0gnhOuVGX8u0qhqkhTDWZCe/iZOPlomahNq1OLhEYSaJ
qOqVOc946YNMLEGEzcZuWdFfn1Pr/UHI6He4Yh6gGs0kRcnUENqV97MuoajJFPHA
fSL3BiFx+HAwQie82h65pVE6GhNeQvZg1VoRkMvjQYcWcaS0p/qRT2Gz48wy6tkY
+/RHotJol4ysmkb6c//CM9eHJ6HWcC+dAkbX+izO55M8PErz2aY=
=0O54
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
