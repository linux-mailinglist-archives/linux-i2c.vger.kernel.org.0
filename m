Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDDD97C4A8E
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 08:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344777AbjJKG2W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 02:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345378AbjJKG2O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 02:28:14 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B6698;
        Tue, 10 Oct 2023 23:28:12 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB5FC433C7;
        Wed, 11 Oct 2023 06:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697005691;
        bh=QgnMl9B4zUXQNgtEeKROdc7SjfMgtaTbXTJLtuTkjJ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OOjy724LOL/g2rMFhztMd/U097sJw5/ITAB9dZdP+71mDWrQPUKwztmxLASmN3Ajs
         4g5izeRdz3ZIYwn6sfEGHUaTQ23jz8FFLOPdALZ2kUab53JVkXKj4H8ZEI8FM6JRdi
         rtYEBfbvlDmSzJil+MdEd93bhPzb/f768ti3Gydj9BO1vgueHx3o4VDT5haRFzPu53
         TRkherYFcFfrSyGKVSteNaarn1jf9+s2IBEzCrfjrEcZ1g3Lhz7gvKnNYV8llpjdYa
         FCityEoH4kF8qCb37hot67eDTute00tpg29JSbJAoEuXxxs3tyMUHDHfEQ9zFyo5B1
         0SkIxMFvMcdLg==
Date:   Wed, 11 Oct 2023 08:28:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        loic.poulain@linaro.org, rfoss@kernel.org, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: i2c: qcom-cci: Document sc8280xp
 compatible
Message-ID: <ZSZAdfJ8IgFE/cO9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        loic.poulain@linaro.org, rfoss@kernel.org, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231006120159.3413789-1-bryan.odonoghue@linaro.org>
 <20231006120159.3413789-2-bryan.odonoghue@linaro.org>
 <ZSWpm/7xnoFkUn31@shikoro>
 <767bc246-a0a0-4dad-badc-81ed50573832@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+zFGQa6cKiry5TnQ"
Content-Disposition: inline
In-Reply-To: <767bc246-a0a0-4dad-badc-81ed50573832@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+zFGQa6cKiry5TnQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> https://lore.kernel.org/linux-arm-msm/20231010122539.1768825-1-bryan.odonoghue@linaro.org/

Sure, I'll revert it. Thanks for the heads up!


--+zFGQa6cKiry5TnQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUmQHIACgkQFA3kzBSg
KbbOHw//fgu3AlcwV0nymLzbLIhx4OwYcBZr4Fj1qVTdU6wwQjJn2ZLJTxQddxbx
xqHN+s+5hCbBi91FYjvJ/PdZmtKHJeXIDvfY1gbFUWY1qaCgn4gQrxi3wrbT2FtM
wYPspQ3CdWIZWzMkknW3yyt5z5ASsCi2gywjsQimIEMUn8Y6N5kWMI4NEbPDDL3Q
TvG2ee+6LNIGesvBXQ53lTXjwF6eSeovSuFYPORovXRDAIgIMHy+Mqh8NXBr/Xhq
m6yFG2rc9NTeyxJm/WFbqUeGh4mjowfeCOJQSsBa+kZ3Az/IXo7c9krfvUGVwOFH
tfVNWt5mk5G3iGZZbaf19mU/XPmKwsrQutz6zRqJwFp+TRSBvlXbFAjeUo65YvyP
cTtNjVoWPiVrz/sWPDLWX1rH5pZWh4hEdXCwXlvVl5YMQPUNf/M+YbgzWmwO4Px+
FxukBxn9occAHRWCAniQmBXA5djUxUMJNHZYy/DJWwmKPO/+jEsfR1R1zEY4R0Wj
KJeZcsXvDGVu9EjLeRU/YfTKVVq3Im/2N1N9NXEAErTopoc8ozzw4T3OZAiu37Eb
vjYKgu1wqEJW6lij6CuETeKp4J7+mDsHuNws+CiDlmFGSFjVhEat2z6bfM1vpqv+
ZIhC7j5jP4BdTOBCpSHjP0TumOjX448KqYL3jxfWFLWM/yb0vTo=
=hqBp
-----END PGP SIGNATURE-----

--+zFGQa6cKiry5TnQ--
