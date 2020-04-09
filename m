Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3BDB1A34BC
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Apr 2020 15:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbgDINUq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Apr 2020 09:20:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:46462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726621AbgDINUp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Apr 2020 09:20:45 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C15DD20857;
        Thu,  9 Apr 2020 13:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586438445;
        bh=UJxB5TdF2s647VvncnacBnt2X8C/0hrZcMPL6ldFmiU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BWF41pdVtvTXUhxJAJmumKrSZizBlL8HPNVuq9rwz+o/sm2uTvs/a/YjWSzMIMdS+
         o7muK5fivLTzYG/1JcHsxSjA7MK2oT+HPUh9YbnlmpLe6dWk88i/nJepulMDa+zDLU
         3Z87ik9Xs8GxCMg6Y+hXZ8BvJzzjovLppTz1uuE0=
Date:   Thu, 9 Apr 2020 14:20:42 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     Akash Asthana <akashast@codeaurora.org>,
        gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org
Subject: Re: [PATCH V3 7/8] spi: spi-qcom-qspi: Add interconnect support
Message-ID: <20200409132042.GD5399@sirena.org.uk>
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-8-git-send-email-akashast@codeaurora.org>
 <20200331112352.GB4802@sirena.org.uk>
 <f896d6e4-cc86-db46-a9b9-d7c98071b524@codeaurora.org>
 <20200407105542.GA5247@sirena.org.uk>
 <48c60fdf-03c6-650a-2671-b8f7cc1e5c82@codeaurora.org>
 <5644ef02-f984-0f5b-d745-eca3c9573726@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="76DTJ5CE0DCVQemd"
Content-Disposition: inline
In-Reply-To: <5644ef02-f984-0f5b-d745-eca3c9573726@linaro.org>
X-Cookie: HUGH BEAUMONT died in 1982!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--76DTJ5CE0DCVQemd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 09, 2020 at 04:17:22PM +0300, Georgi Djakov wrote:
> On 4/8/20 15:17, Akash Asthana wrote:

> > Can we centralize below logic of peak_bw selection for all the clients to ICC core?

> I don't think this is a good idea for now, because this is very hardware
> specific. A scaling factor that works for one client might not work for another.

AIUI a driver can always override the setting if it's got a better idea.

> My questions here is how did you decide on this "multiply by two"? I can imagine
> that the traffic can be bursty on some interfaces, but is the factor here really
> a "random number" or is this based on some data patterns or performance
> analysis?

The reason I'm pushing for this to go into the core is that the numbers
seem to be just made up and not device specific at all (or at least
there's a lot of devices with the same values).

--76DTJ5CE0DCVQemd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6PISkACgkQJNaLcl1U
h9AfQQf/WkrH/6r/MBWHMg4gEKrdNaUWCSjrjiNgPboT5O7nrK2lrL5Tkih16zTO
RHH0nUMIhb9hvcC6Dc7AxkEUZ7ZlACm0W+841q2VsJWhVUo9YdOvGUdbk6krvm0a
f8DthfuTFHVl1aAZodO+Tmpl1/pUtO8qlK2k536SUCJ02sNXjEJQ7KrWjIKmJacV
5M4WhOQFSzyWtoAojcHqgZAe8BEeRPbDgFMBTdLs9fCoeZj9icoejc1qjosC2tu2
9ZLyTxXGRWah3WrRmyhXYPJIQeg8D37X9j+Q8kjd9CbKKlLHEmfsWuvHky8wVooD
CempVL6UyMnRyxl2LbEk0kUS2L6emA==
=du6T
-----END PGP SIGNATURE-----

--76DTJ5CE0DCVQemd--
