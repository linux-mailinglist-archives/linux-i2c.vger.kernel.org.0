Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6E2323953
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Feb 2021 10:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234602AbhBXJVS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Feb 2021 04:21:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:40382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234349AbhBXJVE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Feb 2021 04:21:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE3B064EA4;
        Wed, 24 Feb 2021 09:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614158423;
        bh=IrLAU3ugJrfvTSrSD1TnLn5QGUShe0MmumG5QwEaAtg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IhFb1Us4ZRrPR8xB26Zf6ZMsVs81djq8l1k661frOd4t14tK9mSSRVf9+NLd7LA2D
         tGTQs1tvXJscTYZRCFOwYJIvZBR/uL0Cy3tHPLvEvDeEdHn4yXb661IZG0CYc0Z22q
         f6Xa9yjUg4N2+sOOsgB4BdxbbpFK2hf7m5K0UiYIw3RS7itEXph7jM8N+t7aJs09E1
         6LuYESp7BZub3jIP3mQ3inj6SdkjB7kbGEHuD6bj4YM5W3I3948hcvhdyS6QNpSJHD
         xIkN/IH2gHEV4HjrhRxHtcBTM+YhgPGrTMwgbl3p71GSI6cvdw3hZgyOlquTlDgTaF
         r/M5WEYMwRJfg==
Date:   Wed, 24 Feb 2021 10:20:11 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     rojay@codeaurora.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V8 1/1] i2c: i2c-qcom-geni: Add shutdown callback for i2c
Message-ID: <20210224092011.GA1992@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, rojay@codeaurora.org,
        dianders@chromium.org, saiprakash.ranjan@codeaurora.org,
        gregkh@linuxfoundation.org, mka@chromium.org,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
References: <20210108150545.2018-1-rojay@codeaurora.org>
 <20210108150545.2018-2-rojay@codeaurora.org>
 <161052087940.3661239.14609415796697267628@swboyd.mtv.corp.google.com>
 <9ec10130df230a0ff078d9eec47e94b2@codeaurora.org>
 <161415039142.1254594.3043511127113195221@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
In-Reply-To: <161415039142.1254594.3043511127113195221@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> BTW, I see this is merged upstream. That's great, but it seems broken.
> Please fix it or revert it out.

Sorry, that was my mistake! I was aware of this discussion. It seems I
accidently applied it. I'll send a revert and we can reapply it once
everyone is happy.


--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmA2GkcACgkQFA3kzBSg
Kbb7HRAAl+AJ6t9lEHOThuxIHyeFSriAePrTQu7CluRht0vaAuVSPQVLqmTpQXPm
NscbTGR86BgfOK4iFDRejsTojodP8LDl1iCwcOyNkhtE2lc5j+hnxbmo0NTnNmGE
cew+KMgeXOsrVFibH5P2YFwS+ZyqHb5l4ZirRcMlcVNqXtTdSiu9O2Gjlx4Pkl5I
Pj/DpCvcLJAFqiHXGfn4jGHmoM+DK4OmeWmlKHMelNywzXcr+jm0CBfPTS38O80e
/Kiadj//Cug4f5IMCvUX0mMoiv5QVYXEyW2Lm2Vrk7O6SDT4/6He9athGwbVCYiU
29tsDJPpeUCitR78/sPac8w7SJF8ETyZjZGLELbLeghNy2d+k3UTV6xUqt4X58mS
IT5WIJtqaoAL4o3J2qQUXPN9e69h64GQXelWCmI28fjmkrvV+lXMXe8qES1a9eUf
JSNhKc/9ocNAHFdTJOfYGqUzUsxLR/FzQNOOIPxbMamD4gO50VVJfUmQknV6muNh
yDT/s1Zi+v2m6t1fpoUdU9hjGDJeeuaDxkhEyU8iSGypGnlugWK/u6hGOPeL/G0o
EMSLQZH7Fw+JKXosY2nhOStaMD9kNOPVNatZ1lmMyArwA81ulML9JiLQQ37aqrpV
+o1j+SCvmBqF/ePMn+wln6nl4FTziK47e+jDHajC59wwzIAAfnA=
=XMWR
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
