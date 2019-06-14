Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 510AE46B43
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 22:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbfFNUxY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 16:53:24 -0400
Received: from sauhun.de ([88.99.104.3]:56910 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbfFNUxY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jun 2019 16:53:24 -0400
Received: from localhost (p5486CF81.dip0.t-ipconnect.de [84.134.207.129])
        by pokefinder.org (Postfix) with ESMTPSA id D46602CF690;
        Fri, 14 Jun 2019 22:53:22 +0200 (CEST)
Date:   Fri, 14 Jun 2019 22:53:22 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Fabrice Gasnier <fabrice.gasnier@st.com>
Cc:     pierre-yves.mordret@st.com, marc.w.gonzalez@free.fr,
        fabien.dessenne@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: i2c-stm32f7: fix the get_irq error cases
Message-ID: <20190614205322.GA17899@ninjato>
References: <1558020594-1498-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <1558020594-1498-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fabrice,

> +		return irq_event ? irq_event : -ENODEV;

Maybe -ENOENT instead of -ENODEV? I mean you have a dev_err there, so
the driver core should probably also complain?

You could also shorten the ternary operator to:

	return irq_event ? : -E<whatyouprefer>;

However, both are minor nits. If you prefer to keep the patch as is,
fine with me.

Regards,

   Wolfram


--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0ECT4ACgkQFA3kzBSg
KbaP8xAAiUUQ1YDf9eeO9qQ5B7FKo7kXJ7iUA/RbGjfpC5zhjsoVgb7DdHvc7npe
PSrQ21fAXNJtFz4N1CcQ6A38C2/IYZ+A2NnmwNyzMhqL5W5Ah2gPl6UP7S6USF4J
4NnHw0/0eeH7/i+F13uiVGJudC+MVesWYPZgOBq9GGqgwxp7IztsjSOliBDRkC6c
6RtdlqXD0UfUt60sxIJz/Oy+SYRKc0V78KUeybe7+fT5gisBfF3E1Zs3OZFieupk
BIRuhXDNBQUTb7Cy387Zh4Im2uEzUb1qBIqC3azfJhNVyMm9fyiFGgysXNhkgEJ5
1CKiXadTzhYJQJUpxNDmYQcmk8t/cM69R9NKBXou8XCeutIbe4BA6myz0U0hz1Np
E7iBJ//LJpXAptZErq3n2VzDFHKKFWn4hyIJKI7LOZIdO2t/I/6wzJPMKxHJSOTv
soWDgPcS/D1to1Glq4+CPqwNicEXLm5q1H18UE0SjBskFaGwCwyjNFAvwwjmhJ4f
73uuuJBC3Oq2W/JqnYY+IFcue4GO/VS6ZughqW8iebSmwaoArzN00L844leXDkHN
0dBGj3bT/lcLrR+d7jLsWeHt4t6J0dTJAkIxBivl+dK2nta7NMalnqp6cFp/nHfY
R8KQhpWqlKhaoFGQzW1XiLNlKq+ZPC4MGq3h3thFOc9Z4lo96KA=
=VE/8
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
