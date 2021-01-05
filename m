Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3052EAE29
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 16:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbhAEPXn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 10:23:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:59086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbhAEPXm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 10:23:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B5F1622B49;
        Tue,  5 Jan 2021 15:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609860182;
        bh=26Lu8Y1KwcsryytQMRnbB2efHh103hoNJOBRXR3UfEs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WhsjtFoaxgZCJPGLvcnfpQXhT2MvWT3p74jUOTuh7yI5zjv0LmkGmTpcXOANcFXep
         s51y//vLkbN7Ky9ss2IAwHV8ogPkv5fiqNwbkkhgZ6tOZfDYyswzzJpSRYo5IgZXML
         +JCaoWgd3IkuXSzx2mDuDGOGpV2O0h90L23A/IdF2UhU+AoZpK+zWe4NnnmPMGSd2k
         5gbB6oWIcPg5if7wyx62FV2jzkgJ0iLs21MBoX4wbmK6CPZFx1Pv78/EpTO8P/0vW3
         CtZTWid0SSLKTJeO5OZziFRUbH3S2fo6rV+0SFwGxeueNJ5TjPn6iOtCZnWOIStJGY
         grIG+2wxlUXKw==
Date:   Tue, 5 Jan 2021 16:22:52 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        pyarlaga@codeaurora.org, rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V7 1/2] i2c: i2c-qcom-geni: Store DMA mapping data in
 geni_i2c_dev struct
Message-ID: <20210105152252.GA1842@ninjato>
References: <20201221123801.26643-1-rojay@codeaurora.org>
 <20201221123801.26643-2-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline
In-Reply-To: <20201221123801.26643-2-rojay@codeaurora.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 21, 2020 at 06:08:00PM +0530, Roja Rani Yarubandi wrote:
> Store DMA mapping data in geni_i2c_dev struct to enhance DMA mapping
> data scope. For example during shutdown callback to unmap DMA mapping,
> this stored DMA mapping data can be used to call geni_se_tx_dma_unprep
> and geni_se_rx_dma_unprep functions.
>=20
> Add two helper functions geni_i2c_rx_msg_cleanup and
> geni_i2c_tx_msg_cleanup to unwrap the things after rx/tx FIFO/DMA
> transfers, so that the same can be used in geni_i2c_stop_xfer()
> function during shutdown callback.
>=20
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>

Applied to for-next, thanks!


--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0hEgACgkQFA3kzBSg
KbZAIxAAr6ON6sRM0AIDU6gtWzCUU8IbeiOr5solqqptjvfZxSab7xG5idCpkI0z
lkzBA17KicyFJ9IdpIMXc0PtWC0qNlE/kUSKkEXAbGMFyY3vXQvaw8XPAncuwrqt
c1yGASBJmU7+lB3DbjAQjHz8i0g4q022fH6H6wAreogpnlo4mSRBt3Lccm7Mo9Bp
cECCM3SHjSkRExT/OBzCAaK1ZP1zMwnwdd75M5VyTZE5XgONzVMgtQ/O+POXYZRl
T/d23YAPAti5eIUqM0brJgCT9/AmADmn3O7V1aP66bSmqvZmdLHMuWevAgbuY94K
o8ox9BJjTZiWZL8ftp2Sh8ZpVLN0nd0wCGghWPfsIxHIHrzEueTsKC27XGkahgS+
gnHy981lU0hP9RDVCqjsgZDj5F4Rvp5asGcaAOhdOym8beY8U978eiOPtFzhtbxE
7gaDb7Q9/qikyGABT0tEQwVHOEXiB3F4keDCBUc0saH5T1HHKJ73779DoPw3wXgV
1D98KfVceZc1EvVTNxn6Bq69hwu91sE9sSEg/o9QiInUDv1pKbSS7KxnDqVi1Fto
T4YOah5GSvb7PoivBU+YZy0JZ9xjZvubeyjyEFlQk0WvvmtVD/XiL0TZEgGbfQ8m
zmitcnRtofrgOsxHfAuNtWgldCOkPtFeA/6y0fz2BR5MxpGrY68=
=h+QZ
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
