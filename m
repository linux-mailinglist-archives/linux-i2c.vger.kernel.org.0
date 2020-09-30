Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77AE527E088
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 07:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725320AbgI3Fl5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Sep 2020 01:41:57 -0400
Received: from www.zeus03.de ([194.117.254.33]:57354 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbgI3Fl5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 30 Sep 2020 01:41:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=zce5VXd26q/Uh7mN+qov3Mk0hq6f
        hWWKKuCFoCfxmlE=; b=H3KuDFU75wxglRUI+ElQCAiDxYiK10VyxWWHWDfYnVbi
        0VwprcRtyqYMNp1jbUGOrnZG3EEBeI4FmpEkzQD8RSVJS5RdiyLIOWiNMXqIr/T5
        XuIn6qnv0LfR0OJ+aHPntAVj17opAYgQeFlgKCiOX+bwHEWTOy8n6a+AxmFOfyU=
Received: (qmail 470484 invoked from network); 30 Sep 2020 07:41:55 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Sep 2020 07:41:55 +0200
X-UD-Smtp-Session: l3s3148p1@OVJ1W4GwfLggAwDPXwWbAOGROCa5sBbW
Date:   Wed, 30 Sep 2020 07:41:52 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Khalil Blaiech <kblaiech@nvidia.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: Re: [PATCH v11 1/2] i2c: i2c-mlxbf: I2C SMBus driver for Mellanox
 BlueField SoC
Message-ID: <20200930054152.GA1305@ninjato>
References: <cover.1600804577.git.kblaiech@mellanox.com>
 <69651f24de181c7ea766a41bf7ac7a2539368ee5.1600804577.git.kblaiech@mellanox.com>
 <20200927135445.GC7298@kunai>
 <MN2PR12MB36160C5BC782D9AF3A017D17AB320@MN2PR12MB3616.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
In-Reply-To: <MN2PR12MB36160C5BC782D9AF3A017D17AB320@MN2PR12MB3616.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 29, 2020 at 10:45:56PM +0000, Khalil Blaiech wrote:
> Wolfram, thank you very much.
> I have seen that you applied it to "for-next" branch.
> I 'll address the build issue as soon as possible and post a v12
> with the appropriate tags.

You are welcome. But please don't send new versions anymore now but only
incremental patches which go on top of v11. That is the normal
procedure. Thank you as well!


--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl90GpwACgkQFA3kzBSg
KbY27Q/+K3DpoWGb1JqMkU7vhxpVyqPmNBy9hzQNBx/poJeo4LzB9HJPW5D10UZZ
v38kaHB9pN/fP/yQuNALeRkPP8tptJYCHveILuO7pyLTPiv23C6INyJRFPvYRVdT
FlPQM54mZPXlPWst6yAKKuQkSKYh2hM9OqZE01F2IP2FpbwpZXjvT4nRLdxKsec2
P76qb17YeIofNkUBK6la7XL64Zi5EzVDqMz3NPg1lHKqg4JScO/zpTkXagBJvwNK
fhQTFiVPMNgmxuvD9ly4SUAYCalvPUKxjfbv5WJZojK7rb23DeOl72bOhoc3aK/b
V54ZrjopMxRj4Vem+OfDwIBtqnDJSVxa4GiyNYOODzoJtiIoQ9iBrCSV6jf3mZUn
+UR/AVpuC1wkc6D/gD9gGqSBoy49yH7ZtF/bvnhyD0w4vCcMHXsu/GXYTWTqnjEr
TKVU8iqtGzxXA1INDC1+LMT1jpzC7gLG2j+lYQ5n32CygQaNRuT6+LChXSAwXJyi
ZiGha6WPeVFE15wG7ue9fRWkc3wwZzahgEuYkqrebLTYY7qp+qp8zY1bo2/X+bBK
EzDd353UetLmLc5sQo4eWKUEOAq4BStVFz8t5PsPXVnoU2PdN+kajNCHMe8I6thN
QQuLRbgCb2Pcpdsh/bB7muXp6z9sGShkRk4lP6pOkX3GQM6ANyQ=
=Z00D
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
