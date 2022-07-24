Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 156B557F358
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Jul 2022 07:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiGXFXQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 24 Jul 2022 01:23:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiGXFXP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 24 Jul 2022 01:23:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F053415A08;
        Sat, 23 Jul 2022 22:23:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8B253B80D2B;
        Sun, 24 Jul 2022 05:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8CDC341D0;
        Sun, 24 Jul 2022 05:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658640192;
        bh=RAHIHNSOfIgQI4SiS074HkTYncM9nG+nBTwHYJmjkqY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lEgZOr8wlcbMjfqiuA+ldnyg4PHxODPat17y8KE53EjNpHwYshQAFXg0XF+brFsLu
         UXXeRQaLorVR4KvgFffsqQq1YgHPdL05mNn6yHEWP3IndMINNEPyhsufj+SQD7azwM
         PwUOlNXCc9tJcvLxKlO4owIkE/bUQGcXpdTTQaBGXmdexokVuhGjR5cxnO9DrPuS3t
         OpyXAhYH7Ddkz8+HVfyGYGIX6iT0VfCM3CXlAylk3iPH1mAOAs6X5cF6WjyUnIBkhz
         oNU/1uKqc6iKJvODdUhsj/dMMUc5YDFpwbPiZ/u/YO/vdpGvh3YDMpUrIPDiK4Pmyh
         Tkh9TEFGtKHQw==
Date:   Sun, 24 Jul 2022 07:23:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: qcom-geni: Silence NACK and GENI_TIMEOUT
Message-ID: <YtzXO71zIAUThyF1@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
 <20220717035027.2135106-4-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ey3gVGb55yj7kN7T"
Content-Disposition: inline
In-Reply-To: <20220717035027.2135106-4-bjorn.andersson@linaro.org>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Ey3gVGb55yj7kN7T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 16, 2022 at 08:50:27PM -0700, Bjorn Andersson wrote:
> Turn NACK and GENI_TIMEOUT into debug prints to silence the kernel log
> when running things such as i2cdetect to scan the bus.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

As mentioned, I squashed it with the previous patch.

> +	case NACK:
> +	case GENI_TIMEOUT:
> +		dev_dbg(gi2c->se.dev, "%s\n", gi2c_log[err].msg);
> +		break;

Additional note: the dbg messages in this function are superfluous. We
already have all this information with the tracepoints in i2c_transfer.


--Ey3gVGb55yj7kN7T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLc1zsACgkQFA3kzBSg
KbbwyBAAo1CUG8AaksBPxE4qgTDMbpOT31fizK/DhMSPpzd+jNrXT57TxpjCmigN
8Gu5bED4LLZUGbJ13w7gLLq7i40ClTnj4s0BfcIfMRXP+2H9bl9MsmIWFppcPVtt
ig2ofOWqBExACexy61FRkcNJOKSTnNS7WPxYy/tjdsPJgoT+WSVGn/+0t7TXdXms
gvnRboIkr5+6VHzTR3Qr8oKOXoy3i8UMDbkDpL7xhat5wIOVAW0OS60KVIUDnefj
50flz+CEWYDxbhnGtDLQyqthq1Qd+AqcH0Yw3t7sTnQjdPea7Kd8MbSvf1Dz8mxf
UJgicWxCfJlPcO0/6b2hdlYiPVpQGuvsqpCRD4eDQJbC0VTUfG8fJB2ddeO/5i80
a1Ars5F56mWbcdO7nUyDoEPRLKQiR2R/4UWOYUbNqLIJpHrp0bm68fjmxFMyyCTg
SkQ8EC2T1SAGXd3KPDs4n2NUPo5+5gHE+O2JVWEAQpxTOwJ8s4Jt+N/B+ub13/iU
nd2Je4Q7EfeeYEwRy1rykKH9weuw6u0uzFgvKGTnF90I9L9v5M8xyvuXFdfBHd2Y
GR5Yj7IeOj3FsEnq5WdaLM8GrVlLKj6IFItdvZ20aptnuEQuwm6DQIKU+Pd8RW5x
OEKrUuB5HfGWVE+e0UQBdC/0yIR2X4NzZN84GIKhy4rlCSGFDCQ=
=3761
-----END PGP SIGNATURE-----

--Ey3gVGb55yj7kN7T--
