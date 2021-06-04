Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D3139C164
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 22:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231435AbhFDUf4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 16:35:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:36994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231419AbhFDUfz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Jun 2021 16:35:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FF6E613F9;
        Fri,  4 Jun 2021 20:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622838849;
        bh=2AiZEPHkUnZx2ewkkf5d1xYs/yUhMVNOUw0fcFqyBmI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f32hTvOgobE4apMcy5lO1Y43r0LVxS+7/L+pe4MxaMsGb8UH0AAx3ZYdjEGoHj0+L
         noFn6MAYVL3l/T6/oOAld1oub/UVxcKdsWg+QBDlS73ajX/zsNhOg9CBnueVoB8A2F
         bxv44Dh3rDq9Hsgq7hXLNNINI4fukVOo6FO4m1NifjPLzQ9uoMD6oeK8vF9Mi/06qA
         nyPNgEVawoNiurnoQZ4DZlEmlI3cq+D/Uzvowat2Uq3ovUPgwZBW1d4QmkASxnXgGJ
         1MI3OLkhuc9FcubFDtz7MXIvjunwbzdy8iG1+nPqQpnAUM9MOL2KifNhgttUkQk2Et
         57EhVPv9nkQcw==
Date:   Fri, 4 Jun 2021 22:34:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, skananth@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V11 2/2] i2c: i2c-qcom-geni: Suspend and resume the bus
 during SYSTEM_SLEEP_PM ops
Message-ID: <YLqOPhjhRzWU2hCZ@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>, swboyd@chromium.org,
        dianders@chromium.org, saiprakash.ranjan@codeaurora.org,
        gregkh@linuxfoundation.org, mka@chromium.org,
        skananth@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
References: <20210525131051.31250-1-rojay@codeaurora.org>
 <20210525131051.31250-3-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Rpn7vwPFno/zgp/I"
Content-Disposition: inline
In-Reply-To: <20210525131051.31250-3-rojay@codeaurora.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Rpn7vwPFno/zgp/I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 06:40:51PM +0530, Roja Rani Yarubandi wrote:
> Mark bus as suspended during system suspend to block the future
> transfers. Implement geni_i2c_resume_noirq() to resume the bus.
>=20
> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm=
 GENI I2C controller")
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>

Applied to for-current, thanks!


--Rpn7vwPFno/zgp/I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC6jj4ACgkQFA3kzBSg
KbZnWw/9FlN8NE9hRxiqe8/TEjzZVm94y1qmu5YlSmu2P8EGmTaj8UDyRDelICZI
6w/L1OwJTf6tBquWwTnvyDLNO7SVr8Hj3LjJ/8VKD48O1uTw+YSheh43GgODZkkB
Ms6MaX71/i7p2gbDIJtQedNJXPuZnsZyOpJSSvmqhJ0/XS4sYvbIdAN4ntNds8Bt
sUJQppRSn7BKuTS+5a1bAkH+9teKX/WLm2fXHAK69DlzVoVrN+ZxUtPIuPD/1B+R
BO0KDugrMB2pkI0D5sOzRMzHICxf2uzrS4w4hjRwysbGiRuoEUppUaomjTsy/U1A
AhwUSX3oNXA0uIqMOkTwa+cQ40QXZgNwQAl79WauNXHeULIr3raowCX/+SnC4Bbj
S0gexBd2YKC3OxIgeOFG3JQX7QB+a0z/Qx7olYJaxe3Q9ol00pNqNR56+I/TFe4c
LGg6Zg+TjRGcoAmRZjQn5zlGHxtlBUUWzVe+9+DUjRYJe0Th/zIrohxOCENjSGvO
6tW1uQPF9UM663LgAtJxd3L6Vo2t0D0XNWscIhbczifRxhD9QcElkN6UqKD7nBVq
g2ne5Rifjbw5lZxxek3VpqXzQOGjnwbOVDroBlQ0LHWjQO6ll0l9XWPTWf1ViheQ
Q3HUCOQCkp5Wxcp4Pr7wQQbMIC21v+FKetIsUTc8BVb5bEorazo=
=ZbW5
-----END PGP SIGNATURE-----

--Rpn7vwPFno/zgp/I--
