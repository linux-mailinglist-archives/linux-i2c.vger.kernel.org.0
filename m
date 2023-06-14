Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 225BC72F82D
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 10:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243725AbjFNIpn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 04:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243640AbjFNIpl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 04:45:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29ABE1BF5;
        Wed, 14 Jun 2023 01:45:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A5CA3630AB;
        Wed, 14 Jun 2023 08:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7825CC433C0;
        Wed, 14 Jun 2023 08:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686732339;
        bh=qQp575q7upSiKDHMCgjnViWD03r4fcoKdsGOIiMbLyo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PYu2tsXCgZTHSl/7kVU8fayH3gm4kA8bGy0t+mJ5c/acK8WcNMM4eBaq+eeDmmRZ/
         S9zV37LHUEiLlRM28cCcxso3HSUUmKmLFUhMr9JRP3JR98lBgLbItoraKmAHBYxLWn
         Q4zM3TB8nleiCBdTrO8v4EKLZhS23OcevItHuZ6OuLJyhPmBzYku8ByHCzfs3tkOJk
         ocJP2iB3foRn2YOFhmiK0zCzYwq00LPPmrEIWBf1mqjs0FRz7nGNAzgF9VGzSvdx9c
         IZ2P4ydNOb8IRUMSXLzkfsh/up//Vm8debaNDOtyFFduxyj2k2ctMhJ9JRm4gTwBIR
         dPkqwvvZ8YLcg==
Date:   Wed, 14 Jun 2023 10:45:35 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Shuai Jiang <d202180596@hust.edu.cn>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Ivan T. Ivanov" <iivanov@mm-sol.com>,
        Sricharan R <sricharan@codeaurora.org>,
        Naveen Kaje <nkaje@codeaurora.org>,
        Austin Christ <austinwc@codeaurora.org>,
        hust-os-kernel-patches@googlegroups.com,
        Andy Gross <agross@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: qup: Add missing unwind goto in qup_i2c_probe()
Message-ID: <ZIl+L+KTMclMXMQd@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Shuai Jiang <d202180596@hust.edu.cn>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Ivan T. Ivanov" <iivanov@mm-sol.com>,
        Sricharan R <sricharan@codeaurora.org>,
        Naveen Kaje <nkaje@codeaurora.org>,
        Austin Christ <austinwc@codeaurora.org>,
        hust-os-kernel-patches@googlegroups.com,
        Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230418135612.598-1-d202180596@hust.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="krO64uYAB+KZ7qEU"
Content-Disposition: inline
In-Reply-To: <20230418135612.598-1-d202180596@hust.edu.cn>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--krO64uYAB+KZ7qEU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 09:56:12PM +0800, Shuai Jiang wrote:
> Smatch Warns:
> 	drivers/i2c/busses/i2c-qup.c:1784 qup_i2c_probe()
> 	warn: missing unwind goto?
>=20
> The goto label "fail_runtime" and "fail" will disable qup->pclk,=20
> but here qup->pclk failed to obtain, in order to be consistent,=20
> change the direct return to goto label "fail_dma".
>=20
> Fixes: 10c5a8425968 ("i2c: qup: New bus driver for the Qualcomm QUP I2C c=
ontroller")
> Fixes: 515da746983b ("i2c: qup: add ACPI support")
> Signed-off-by: Shuai Jiang <d202180596@hust.edu.cn>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

Applied to for-current, thanks! Thanks Andi, for the proper Fixes tag!


--krO64uYAB+KZ7qEU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSJfi8ACgkQFA3kzBSg
KbbOQRAAjMg3E3JBbJtdqbztOeRNM3Vz6Wz6IG5McYtBwo1FQ1Eg5cllnx9KWpNX
ucOIXhN2mM0ovJSNzKcD+Upkxg7hmQT/S6akdSholHZRG3yof6/j8sTYRzpeZbsE
XXd0qW4L3tNhBB5cJZVH9xqFuOUUshORLZozTGWOEizVwuedqZsxpnLbQOr5EXnN
WvZkuCIxB6M7rN2apyZLoAGOz+/AN42/mZy8vI0Gl8PeL7XtqYCIKw7nLgI0UU0c
JYCUEaevpCYKkZOeZJLpqDN8uxlvFFSVYcs1Vcz+hq5RIRY4/KGvoUGZUw9/meKt
Fs4gQ9kdZgULVEJw/UtGtSHQfRQ310Zd4GecAIzjVBfrKtzU0436v3FWXrRb/oE8
6cIkr4D4gCDbAgLy0n+BcNAXeoAuW7l1+NuH4R/+XosFVPTK8BYUH6x6h1uJKsNR
CAzCQTKgrnNb2WeAX1knQ7+EtrKyPm1Spb/T14dtwp4v3Ik4h5Z8JojAb9snCG68
5gsFdLArpHLBIjC/GZ33R4p8EVHgY+5fBGUMKZ2w1VAjlwYQB8exp3hQ+dadGcow
Q8U0iZaloJobkHy1lSoA+wZhRbsV2Rv46ow3vyafbnof0rpV9H873AkYP7njuuLK
QR9mcJAD1LZ+H0UKadb5Q9gkYy4D0SzMD9bQ1vbKIbM0/gYxPTE=
=VxEP
-----END PGP SIGNATURE-----

--krO64uYAB+KZ7qEU--
