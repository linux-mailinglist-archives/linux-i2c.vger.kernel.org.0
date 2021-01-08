Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98AB52EF06B
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jan 2021 11:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbhAHKHO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jan 2021 05:07:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:57350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbhAHKHO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 8 Jan 2021 05:07:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A008235FA;
        Fri,  8 Jan 2021 10:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610100393;
        bh=0seG1qL20nPxGrYmWcmVzd36Vq7VdNi0HGCeEa/IXx8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ugUrqP8e3xpsSeS41GNHnQitoUH1xd+2b3XfGcvpvtTlYBVLUQ35ZZed6g81SOXqk
         WAcWhX4i7DuClqJrpksigj0/TnCyWhSkVaAqIpfzvp2IxsxjUf7x3W+yQC9BtaMfuR
         S1JUL+acrLSjoYhdfpRp8wSEszOOkZhpznkUFvZEh1aPcaDVHR21RKmESmGEoeCmGN
         Fhui58VwJuH7enKjDbppKcUoy9VtMARgW5VfGQzp8obdOQcreMkvZDSMuwj0w22M+I
         F/IUSOI/gcxbuwmXgQXg215+ry8MCutM4cmVXUHcatPjcdIQVZ8R1vdX6tP2LuG9Mk
         dVQsVlaQnHGdA==
Date:   Fri, 8 Jan 2021 11:06:30 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     rojay@codeaurora.org
Cc:     swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        pyarlaga@codeaurora.org, rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V7 2/2] i2c: i2c-qcom-geni: Add shutdown callback for i2c
Message-ID: <20210108100630.GC1223@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, rojay@codeaurora.org,
        swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        pyarlaga@codeaurora.org, rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
References: <20201221123801.26643-1-rojay@codeaurora.org>
 <20201221123801.26643-3-rojay@codeaurora.org>
 <20210105152747.GB1842@ninjato>
 <d3e53aabf39e888d8184faa2981f7837@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="96YOpH+ONegL0A3E"
Content-Disposition: inline
In-Reply-To: <d3e53aabf39e888d8184faa2981f7837@codeaurora.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--96YOpH+ONegL0A3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > The use of 'goto' is not needed here IMHO. I think:
...
> In context to the previous comment [1], I have implemented this way.
> But, yeah anything is fine for me.

Thanks, I really think it is better.

> In geni_i2c_abort_xfer() function gi2c->cur will be made NULL, so copying it
> before to "cur" is needed here.

Okay then, thanks for the heads up!


--96YOpH+ONegL0A3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/4LqYACgkQFA3kzBSg
Kbbwag/6A5M3A+2Q2jivtmmhNGGh4pVc1ok5Joih+D1lZqAQVbSKjqPPZNyAeuOu
0a2ouMt6rjzDrKgZ8rWDcuH6PTbFwtSKcwK1vyLK10ehhP8/lr2uVK5MqWJ8ydXS
PcTBZI1NXLdK+cf6fIpfhcCYZG7mBf6Pc+riFDPNIgRv2Gs8sXz7/qNKrOE98XAv
mqGuAbKTu6GqvfkFA5aRrT2hK/+p5XGzzAMX1zW7Gei+XyicABSko+aY1UExv/Bn
uZrBYlG4xwW89gKNeqBDibZcXd1vPVhhqA8FVRGarwoJAQ09x9LN5G9iHnrZn1AW
ID5BIu243HenHQkMDlOCVutNxEIFB7FohEK3UYY1uPR88VXunnMsaIcQWt1uoAHg
IiS8AxZ+cEnePxzJC1HP1IjnisT3SP37KXSZyXzLpRhWk8P2rUOWIClEsVslSC6y
uVLUpDiSc93lgQ1zmPYp8RUYrOeYq+tEmNnuSTC5JydlmjiaH0gVrl5769Kar8SK
RdNB4LYPOG5+BtatssGfLzsMLN0vBiOV2GUxSWktCR3Xx179VNkd0ftyqJvUK4XE
e8SeeqqvQJLAbSlE3UC5EurheaKN6dOXhvnjfh9zVDNh3swfQ0fYl4dbINnGaORr
Sywbt3JRJ41iEaOvTy0QJ6kcEuV6qh6oXPjMgrsUednm8zpmJdQ=
=3G2X
-----END PGP SIGNATURE-----

--96YOpH+ONegL0A3E--
