Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 894F527D728
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Sep 2020 21:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbgI2Tp1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 15:45:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:42692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727758AbgI2Tp1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 29 Sep 2020 15:45:27 -0400
Received: from localhost (p54b3311a.dip0.t-ipconnect.de [84.179.49.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7B4620774;
        Tue, 29 Sep 2020 19:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601408726;
        bh=Soet9P57gA78D46fkz8p/ZW7RggrzHRQhcNMOl/7jXA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FDraZpqel5v9eqODi0cXJO+4TqLjB9Gc3hOM/4bj4Y9gfbeRsPO6v2Ezx2A89NoYT
         cY1+8SoGWGN4auoOGif8cTPn+HgGdGwIIN9tkbZ1bws9kDhxYuOsZLYiR8SNPs9i21
         5DTXq+tyUg3JDDhvIWoC7W6lmrmUT/DRcrQvp/QY=
Date:   Tue, 29 Sep 2020 21:45:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
Subject: Re: [PATCH v2 1/1] i2c: busses: Add support for atomic transfers in
 Actions Semi Owl driver
Message-ID: <20200929194523.GE2010@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
References: <b6c56858854805b0f03e29b7dde40b20796d5c93.1599561278.git.cristian.ciocaltea@gmail.com>
 <20200909151748.GA11397@mani>
 <20200909165915.GA387239@BV030612LT>
 <20200910030225.GA10495@mani>
 <20200910141223.GA447296@BV030612LT>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="imjhCm/Pyz7Rq5F2"
Content-Disposition: inline
In-Reply-To: <20200910141223.GA447296@BV030612LT>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--imjhCm/Pyz7Rq5F2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Sure, I can handle this. I assume this should be a separate patch, to
> be applied before the current patch. Should I submit a patch series
> instead?

Yes, just do it. And please remove irrelevant parts of the mail when
replying. Thanks!


--imjhCm/Pyz7Rq5F2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9zjtMACgkQFA3kzBSg
KbYLhw//Yn21wF9FzyenX2h/pLxOeAwFCzpOqboAkiJ2T+PS/dqFZTNZbxCfgaTe
ynhD7+ZRlJekYU5M5NiSrq+kKW+6Q5tQAvD6nkDPx22aXf0zrRxE60g+vvarCftV
uwtx0vgY1PgMLeOGLWYXXO+Sx7WdW3Cn/fxnwmtL5rp3T3bTwLfBxD1Kc+79sDhI
+6J/uaLB77bDVCexG5yjLL2nANsreuopXGaikornbNOxDSBBgtYXjZV1CLmFxJvB
jgt2AfJBL5XR7597l3K+HpW5UTSoBmJMLj9YY5rF+xk5kiH6N06OqOH90lb2Munc
jpvF7uI7AmsajEDL57u0ZLHTVQs8Rlu7ot77+OFnyp261JJetuvgR50lbjo60aU3
QidNWf4uShznRRwAxAcWrefuFVmNp/LcYEtiTDaMZ9OI+raGL5dUW84z8BGWIi9v
yhU+dEVNd3E3rK4/dTS+0l5t5o1mA5qJxwRnyC9qYGlI3SjxC0I9aNEXBPE1+HZb
aDRqM1DY7D6SfVcVLbWgSHq+o+Qxif487GVXNwKNMffXJHoaHNgM+zDJu/3eSUp7
HSNk0k9Db24z9eCIhmssASTk+wVKP89c+oGi+IxedpYUMQ4Frh6b8lwDWMjJbAwI
AEkFyxDyHmbBZsnWYwVpPwBSperzJCfpxhnpIw8gAjo3w/M+kE4=
=eaRf
-----END PGP SIGNATURE-----

--imjhCm/Pyz7Rq5F2--
