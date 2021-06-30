Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E743B841B
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jun 2021 15:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236370AbhF3NwS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Jun 2021 09:52:18 -0400
Received: from www.zeus03.de ([194.117.254.33]:53552 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236029AbhF3NvB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 30 Jun 2021 09:51:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=aZ8iO9XBy3P3r9iXiFyK52CCdtNx
        JUEpRXml++Cfx6g=; b=aXzYKQ8Gkzzam+WMp5k1pRjO7qvLN91VBiIe35APextO
        agZbM5Qf/IdCH8e44yA1B7PS+hpuFjJJs52twGzHC69ly+8o3rQzyNhX8FZd51rT
        aRPm/lRoi3o6hjJs8/CVd9i/KcVpii2arlUgN1x0Hf31k6OcZzUuPMaJvO0XTaQ=
Received: (qmail 885806 invoked from network); 30 Jun 2021 15:48:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Jun 2021 15:48:31 +0200
X-UD-Smtp-Session: l3s3148p1@Y8kk+vvFAuYgAwDPXwaiAGDoJRk6bv4I
Date:   Wed, 30 Jun 2021 15:48:27 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] i2c: stm32f7: : use proper DMAENGINE API for
 termination
Message-ID: <YNx2K7Eeqm09Vot6@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
 <20210623095942.3325-8-wsa+renesas@sang-engineering.com>
 <YNM/TZMWwCLGSEJO@ninjato>
 <20210630131118.GB12109@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qWmVXpjpnw6hcZzE"
Content-Disposition: inline
In-Reply-To: <20210630131118.GB12109@gnbcxd0016.gnb.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qWmVXpjpnw6hcZzE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alain,

> thanks for the update. If you are ok with that I modify the patch
> to partially rely on _async / synchronize whenever needed and push it again
> separately.

Perfect, thanks!

All the best,

   Wolfram


--qWmVXpjpnw6hcZzE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDcdicACgkQFA3kzBSg
KbaXXhAAmxrPbldmgXhVpi+qevyfoKn/StAf2BS8zj+S+vIDRB2yAVQ/yM9t9ooX
bwPOkJx2oGMcJ1uwFjbyTGvS47iHeW4KAbpIUxr5MmwW5QSXrfn42mfih94g9UaP
HZzIaM3IY+2oP+0sJ4WrGGI0ZqDJ0ISTnGn/5q0jocO5LelzMMnE99qMw5Z7BsUF
2Bi5AwaRzqAyDimWIhjktwNAJBDX+fBZcGpgYbmqVhF2R16UIoIVHCLcVumD23lA
hDU/ows5Wp1bzdh38qadVkaOean/FPSERnTFDx/QkBaGhMc5tz5HQshx4ILGUKI7
hJJsFjPUsi+6GFHoe5gv7sW948ONb48WxKzbhD10KS+D4k5pAzHWs1rmGgdA+UVD
hA90vjuDoB9VIlhcTe6K4LIQGfJBzXZOpo4MYTqLxBAnPQF57GQWcdmH5vSlsxV2
ALPwHYco8CRyxHzpzUU00Q+l/0T9vhuG1lE3LjSRETvUQjB2D4HznNhXqw7SpFxs
vPfT0AodIvOZXEcCtZHCVXZjceBCoGFYKLXHzsM+XAG5XmwcrO9v1FlfTyTqNwr6
EEzsUP+lRpEg1SWRlj00U7ckAkR4mo8CjpQwLGy4ilA74TuIFGI83ILuQ8hPBdS4
Bxdmh62TR6fODqWc7pXdSFx8Jd2EcWqKDLaR6uMExB7XFrVelNU=
=iyIW
-----END PGP SIGNATURE-----

--qWmVXpjpnw6hcZzE--
