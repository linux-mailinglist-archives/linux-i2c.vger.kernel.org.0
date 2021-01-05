Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A300C2EAE44
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 16:30:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbhAEP2b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 10:28:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:59642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726151AbhAEP2a (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 10:28:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63F2422B4B;
        Tue,  5 Jan 2021 15:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609860469;
        bh=rlbfB9avIivMtS6hjB8SAE55AFbkBF7zJzZHYTJX2fI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Up4Za5aziRYCLHgdPXgS8tct+y4kb0EYjPVAlBVx4BVz2n9sP5pH/6amlRXMzmx2Z
         HzfV5BpfcWP7tQYel8nNNgt2j883kJkcAFTu5mt/qNu22cFzLY5cBpC6CfXfCEQsT6
         /RNWJj1XWRNzcvTYAD+1JLjJJrg2ZPJ971rno8A3SJ866ZvLHbOEvkrWl3tK5e04qM
         pqKhPROdFcDrXO1ONAaRHp96PINcCXPZnLHV6o94456CA9B5BUouFQ/8vBFxwXregr
         0K1xoyhLQyGgA0Ey2XdLErgyK1OYMIbrg9txOXPZSbMZnoK5iL9TodgFRp9yXXlW4J
         fAK2ghPfD+Atw==
Date:   Tue, 5 Jan 2021 16:27:47 +0100
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
Subject: Re: [PATCH V7 2/2] i2c: i2c-qcom-geni: Add shutdown callback for i2c
Message-ID: <20210105152747.GB1842@ninjato>
References: <20201221123801.26643-1-rojay@codeaurora.org>
 <20201221123801.26643-3-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Content-Disposition: inline
In-Reply-To: <20201221123801.26643-3-rojay@codeaurora.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	geni_status = readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
> +	if (!(geni_status & M_GENI_CMD_ACTIVE))
> +		goto out;
> +
> +	cur = gi2c->cur;
> +	geni_i2c_abort_xfer(gi2c);
> +	if (cur->flags & I2C_M_RD)
> +		geni_i2c_rx_msg_cleanup(gi2c, cur);
> +	else
> +		geni_i2c_tx_msg_cleanup(gi2c, cur);
> +out:
> +	pm_runtime_put_sync_suspend(gi2c->se.dev);
> +}

The use of 'goto' is not needed here IMHO. I think:

	if (geni_status & M_GENI_CMD_ACTIVE) {
		do_the_stuff
	}

	pm_runtime_put_sync_suspend(...);

is more readable, in fact. Also, I don't think we really need the 'cur'
variable and just use 'gi2c->cur' but that's very minor and you can keep
it if you like it.

Reset looks good!


--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0hXMACgkQFA3kzBSg
KbZUDQ//bfbDro72OlBzRjWSG17tLd2nH0ssMcm1nM85D3R3qew61g7ywjTicNqF
vwZroD0K08MYxNsH5xP20TEtWpj/L5crLLFzbLiEdrX9yMNN5IFFEQyQj1j0oanO
vLVgd9i0CCP8bLyMJ59+TFtJFtYffEH4i/RmTxeD/LIWQNZFcGszTRYkr5kU2hHi
C13ToRiqckAjsxfkmZj7OeoM2n0d7pj0etJ60uVT0mEU7q8SQ00vcv5WK0rj3mcK
6I9QDAWlP8yLgB1IErcq/Sfy+Ga6EAk5qh4nIa3fyHoD47+8K7kAIynGWPkolqqj
czszRtGvmimYkPeLodby4BAgVPEKFcjNvTiKqpl6oOEpkO79yzfmk2c2wVi5VpvU
KgUfgHk8QHGT239ouB0G5FvTRWVIdNblkgipaRsl1biner8hzWl1yk0ZDJxD7rso
e1tR3LrBcv0jPloLRH8Kh7Sb5lTtDBYS87moBYknyajpokzU0eNM0GZqD/swuLP/
2Ni7aVxzG8RZhMQAnMgqG5+6Gl+R78yU4876+A+ZCZtDDACe4j/QaqXRB4/bvHG/
BlArAYAWhWweMi+fD1jug21mtxsAmQuPkzMo4byj7OvK1t04nQqeyQ6lyvI7IZU1
iRxdi94opHS0AOG8rXAVXKlivCvF10pVdEW5LpEif/6eY3yJVqQ=
=TnuI
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--
