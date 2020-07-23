Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29EF722B704
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 21:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgGWT4k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 15:56:40 -0400
Received: from sauhun.de ([88.99.104.3]:47484 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbgGWT4k (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Jul 2020 15:56:40 -0400
Received: from localhost (p5486cde4.dip0.t-ipconnect.de [84.134.205.228])
        by pokefinder.org (Postfix) with ESMTPSA id E31D52C0654;
        Thu, 23 Jul 2020 21:56:37 +0200 (CEST)
Date:   Thu, 23 Jul 2020 21:56:34 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     swboyd@chromium.org, msavaliy@codeaurora.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: i2c-qcom-geni: Fix DMA transfer race
Message-ID: <20200723195634.GA908@ninjato>
References: <20200722145948.v2.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
In-Reply-To: <20200722145948.v2.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 03:00:21PM -0700, Douglas Anderson wrote:
> When I have KASAN enabled on my kernel and I start stressing the
> touchscreen my system tends to hang.  The touchscreen is one of the
> only things that does a lot of big i2c transfers and ends up hitting
> the DMA paths in the geni i2c driver.  It appears that KASAN adds
> enough delay in my system to tickle a race condition in the DMA setup
> code.
>=20
> When the system hangs, I found that it was running the geni_i2c_irq()
> over and over again.  It had these:
>=20
> m_stat   =3D 0x04000080
> rx_st    =3D 0x30000011
> dm_tx_st =3D 0x00000000
> dm_rx_st =3D 0x00000000
> dma      =3D 0x00000001
>=20
> Notably we're in DMA mode but are getting M_RX_IRQ_EN and
> M_RX_FIFO_WATERMARK_EN over and over again.
>=20
> Putting some traces in geni_i2c_rx_one_msg() showed that when we
> failed we were getting to the start of geni_i2c_rx_one_msg() but were
> never executing geni_se_rx_dma_prep().
>=20
> I believe that the problem here is that we are starting the geni
> command before we run geni_se_rx_dma_prep().  If a transfer makes it
> far enough before we do that then we get into the state I have
> observed.  Let's change the order, which seems to work fine.
>=20
> Although problems were seen on the RX path, code inspection suggests
> that the TX should be changed too.  Change it as well.
>=20
> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm=
 GENI I2C controller")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Reviewed-by: Akash Asthana <akashast@codeaurora.org>

Applied to for-current, thanks!


--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8Z624ACgkQFA3kzBSg
KbYZog/+MH7CA5qU2jQ/+0weiqVJl7p12RN7zBbUpOE/pKjaRgenj6KQEDkUqwGM
Dv7cGBq91V2SYEkhbvWXisWZiqhF66F4tmy8JaTCU+oozVw6suyqosPMjs9g5RFv
PLoKK4rgcfLByYbXSXdX0tbPe+e2P69s+fvttOvPQsOCZ8Yq8RAZubN9HiPIHpXP
93tFSF/O0BFb5awmHKgBeFcMhawUhjiUojC/mDhrww3vRXmSMvHtBKiD38HHTut6
0js9RnUFs/GDpdFo2LPl73Wrb8oPopMBYv9dODXLy2aRDzxHXPiEEXCeRv9Ekxr1
2smfexvpPdn6//eNcQXTJc9Dk13xuASWBdb9sS1czNlONSMPqzdhVqW/5km1kzPT
NLsYLyiX5IeiWCuyZw4+MtB6iB3bEMMmmbPqYeNwW8S5kIIv3xOagn5/AjzNrH29
c/u+6QBfvahomXLOWq1D9U7KnvRsLLQxmx00K7tmDd6HUCnk9LygqogXESXXxpRs
OxNt+b+yJM8hIKtXx2o4fFIst50IuCboZaat3fxl4c9PcSjOR/jzRNSwuVGcf2zB
Me8uXilaBUqrbcI1KWVT1CaRihWEDykOdkXCJ24asGEW04HvnYkxEzqRxtMl9iMM
cdeJcy+Axgx2kpPWEE3FVFyvRkfjvYSILinMKwiMqHri98IqBHQ=
=l0IS
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
