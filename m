Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 479CEAA4FB
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 15:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731653AbfIENto (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 09:49:44 -0400
Received: from sauhun.de ([88.99.104.3]:57390 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731008AbfIENto (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Sep 2019 09:49:44 -0400
Received: from localhost (p54B335F6.dip0.t-ipconnect.de [84.179.53.246])
        by pokefinder.org (Postfix) with ESMTPSA id AC7102C00C0;
        Thu,  5 Sep 2019 15:49:41 +0200 (CEST)
Date:   Thu, 5 Sep 2019 15:49:41 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, agross@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/1] i2c: qcom-geni: Provide an option to disable DMA
 processing
Message-ID: <20190905134941.GG1157@kunai>
References: <20190905102247.27583-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jt0yj30bxbg11sci"
Content-Disposition: inline
In-Reply-To: <20190905102247.27583-1-lee.jones@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jt0yj30bxbg11sci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lee,

I understand you are in a hurry, but please double check before
sending...

On Thu, Sep 05, 2019 at 11:22:47AM +0100, Lee Jones wrote:
> We have a production-level laptop (Lenovo Yoga C630) which is exhibiting
> a rather horrific bug.  When I2C HID devices are being scanned for at
> boot-time the QCom Geni based I2C (Serial Engine) attempts to use DMA.
> When it does, the laptop reboots and the user never sees the OS.
>=20
> The beautiful thing about this approach is that, *if* the Geni SE DMA
> ever starts working, we can remove the C code and any old properties
> left in older DTs just become NOOP.  Older kernels with newer DTs (less
> of a priority) *still* will not work - but they do not work now anyway.

=2E.. becasue this paragraph doesn't fit anymore. Needs to be reworded.

>=20
> Fixes: 8bc529b25354 ("soc: qcom: geni: Add support for ACPI")

As said in the other thread, I don't get it, but this is not a show
stopper for me.

> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>

I'd like Vinod to resend his review. Because IMO the change since v2 was
not trivial, so the old rev-by has to be dropped.

Other than that, the code looks good to me!

Regards,

   Wolfram


--jt0yj30bxbg11sci
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1xEnUACgkQFA3kzBSg
KbZADQ//bVc8JLCde99ZKqUN8Y09DkUCfN9nWo2ec5DwxFmDGC8HdJ6mtz50/MLV
jBJDWvml349aU4YwpmGf5ON51GWxey0iWmJ0Fo/km09XZp3JVHObxS+66M1y7p34
T60tKi6kct3QpVwT+jaqMimTvGDGY6W78cG/GCVErlFbthDEEeDfPzy1iuU0D/OW
j/rdRGz6Q8VlN2CvN6EPPn9njVwBQBIgsSAGeUULgGxb6dUs9oVp6CbRvPQMzwPV
7sPJzdV5bZ5YPWRaExFUiR6AfCkeDtJwK26jWKVVVLh2Xfc+FMSJ/pOQrQfzoGDA
Dv50xlVGa3oQV3zeyHzOIFhUZpjsTChbfzVNSt0GGzgYlc09U3ltyWZBR6iEyPfm
00x/oA1oyMjLpsaOq3xf5+AP7+PScfvB0910iujc+nPd2agCZRRDtl8hCmCiisBK
W2RB7RnLd3ZKf09bqU0xwkMNUXHSllk0bZK27lxdGFXIK8XCRjf9SJ6bQe1jvXWO
P5FG1/PuaQIjh8l7u2t15uFpzISvYvKAhypuSpV1Sbgc9fOfZSlbo20SrVkYAmd1
Y2JcfmTJBjlmRfpyXoVEzOGJclp1AlyrFQd955dzl/LAVBUdvDlHLaFkZ1molQF4
Ou0LwmX7yn69/N//1QKohUFuLjAkW+tJHd17zYtqMF/HAPcmZl0=
=pZZv
-----END PGP SIGNATURE-----

--jt0yj30bxbg11sci--
