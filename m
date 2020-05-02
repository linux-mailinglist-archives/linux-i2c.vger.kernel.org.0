Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1FA51C2645
	for <lists+linux-i2c@lfdr.de>; Sat,  2 May 2020 16:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbgEBOnX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 May 2020 10:43:23 -0400
Received: from sauhun.de ([88.99.104.3]:47670 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728025AbgEBOnX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 2 May 2020 10:43:23 -0400
Received: from localhost (p5486C608.dip0.t-ipconnect.de [84.134.198.8])
        by pokefinder.org (Postfix) with ESMTPSA id 709482C052E;
        Sat,  2 May 2020 16:43:21 +0200 (CEST)
Date:   Sat, 2 May 2020 16:43:21 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Message-ID: <20200502144320.GA17811@ninjato>
References: <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427103851.GB24446@kunai>
 <dc2de966-81d6-6ad5-0c51-16dd28ca4165@gmail.com>
 <20200427141922.GD3464906@ulmo>
 <20200427153106.GA8113@kunai>
 <e5a3dd07-97f5-29f1-974e-3037a01cc89c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
In-Reply-To: <e5a3dd07-97f5-29f1-974e-3037a01cc89c@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'll try not to forget about these patches to resubmit them later on,
> once the problem will be resolved :)

Don't worry, I'll keep an eye on these issues, too :)


--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6thwUACgkQFA3kzBSg
KbZiYhAApixyl6FkKtu8ETEtCJm49fxzZ0RJO0lacziIdSScoj7RwIwDxSHMcZqX
w9y9dcI4og9T+d3qTOy1D4ikR9c0/QZvkBWxBpY54P+xbmHixUPX00SdPtvgI23q
GdmeSyNsFyuUM4+6+p86vss86Emz827yXF2km6ao3PLExCdGAbgYDlnTkc4R/oLn
/2BDEt6pQghsJd8i1mlWreU9vXPDb1Zw8UVIJsi0g0LHEPPcda4KY9LJ+RNeW2PY
h/Sg/cC2ZKZDbqHVRNIO+dkjfLvVtBDnHcg6qOhzd7pGQIyl23DQNI1+vO5DlJ73
ffp3ZD0rqajbs0m0BvGVqRR20mJQdbh2uaagsyNZJzssEkHc2Hx9KvwJT3mpaWJf
7T0amY9R7Em0Wex2TTPNXJvIMm/neJiAmmI+5+0E0rg91KX+XTrXHaKsH0Xs0c3u
Eal37gTelNqz8+jDdWZfURKiZ4+uZYpiFhDIpkxn/KhowKe/WOYqo2bhAnhZZLXw
o53kZQ3tFaPXMYbtVNy9o1pt1lZDj00lkO9TOJFFW1vnq+kaC8161e8hUpFX5lHH
jRTVR3CZdB3CpKAcrBOel17OwDVxZVB4F8WxbxJCvGS7NczkKlnRgtFPj1VEhX16
9QWk5r+5AX+c4AvZaeD+Fh459d8pjl6IXjQ3UZXx/8II45wQom4=
=quWy
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
