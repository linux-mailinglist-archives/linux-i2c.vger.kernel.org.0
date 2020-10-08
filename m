Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 626312874C7
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Oct 2020 15:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729869AbgJHNEw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Oct 2020 09:04:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:38668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730154AbgJHNEw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Oct 2020 09:04:52 -0400
Received: from localhost (p54b3300d.dip0.t-ipconnect.de [84.179.48.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4DFD2083B;
        Thu,  8 Oct 2020 13:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602162291;
        bh=ASgWedu6TAR+2NxULnjFNczobY3wsbEPfYsc85da2JI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bu1MZEzncti+rh2+k6qNinYOcjHRVm734X7vio/bcaXfQCod9zhiiyfbe0VBU6HLN
         1Y1l9ZJZ94ZV0M3dHKLaxMCAv4pKMnS/juPWXptW56fPYlVNswvb2W7nsB0RKBgM9C
         rL4pP3g+NhXrDCE/HpTkIQCSh+DHA8SLm9YX7Fc8=
Date:   Thu, 8 Oct 2020 15:04:47 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        vkaur@codeaurora.org, pyarlaga@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V5 1/3] soc: qcom: geni: Remove "iova" check
Message-ID: <20201008130447.GD897@ninjato>
References: <20201001084425.23117-1-rojay@codeaurora.org>
 <20201001084425.23117-2-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6WlEvdN9Dv0WHSBl"
Content-Disposition: inline
In-Reply-To: <20201001084425.23117-2-rojay@codeaurora.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6WlEvdN9Dv0WHSBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 02:14:23PM +0530, Roja Rani Yarubandi wrote:
> Remove "iova" check from geni_se_tx_dma_unprep and geni_se_rx_dma_unprep
> fucntions as invalidating with dma_mapping_error() is enough.
>=20
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>

Applied to for-next, thanks!

The other patches need updates, it seems.


--6WlEvdN9Dv0WHSBl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9/Dm8ACgkQFA3kzBSg
KbYeVA//Y6rXaoICwSJU8D3g9fDiYZFl8NleWfxdukOlyBzvFtS9xXg6QQ8Ba0o7
oPo8rqQe4q7nOTWxtO8p4t2riSamZGbq2R95slgxGKh/zpZ1aGh8Dize/cnxr7/m
jR97jqQHW5V/F+qSYzgyejgqt59WqmB+5zWUyYurf+zTjlPTnpHLjAY6vpOn/Ifn
ybPqsPTnuod8uxLuk9nAtd3IyB+mByMGo8ipCbnudAZK6ebde0DBAAZH9InFmPmW
2Ba+zuf5+GV54WTv5YL1Qu0aTKXaQPK/0mvobu3z8D7c6gbrwNAJaX9eJzufTO1Z
ubLFJnRZ8nSP9uWX12NVwqKgpiPxReyb8L5bwuyJfh+8ZmmKy+77ZLLR4b5lSOOu
hGZvPsvE8v95ju0QlkbJXMc8rZU56rstJmw2kWAOOmTJnXoT/dcC4KAPqRW9L3m9
/HYiRYMpgaOADWqsaS35ViQmn4uG/3hzaU1tHGcKnPhVUOxdfyLHx3w2rEDWkCSc
489Mm63+B6xSkGLAjlR425ZIHUKnrCyhZ15zJn+/XH3fetATHu1sghE3oMHh9L6B
c4xeYug4AeowRf7YOJ0yEAtfS15gZrJXmV+j6o8ac/934jHOgv3SP/VTWni87Oiq
Xn0mfxBApf/sNBqziH04jG5GrSJoRCMemhJsEKtFRjK7aSy7ag8=
=zSze
-----END PGP SIGNATURE-----

--6WlEvdN9Dv0WHSBl--
