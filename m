Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5802609CD7
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 10:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbiJXIgT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 04:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiJXIgS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 04:36:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E9CCE0A;
        Mon, 24 Oct 2022 01:36:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6313CB80F92;
        Mon, 24 Oct 2022 08:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E641BC433C1;
        Mon, 24 Oct 2022 08:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666600187;
        bh=3+MFoZ1i8NaN+dGJz+LHBPaBW3YyJRmXeIrLriHr5xQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=RiB8m5v2Qo963Y9TM7sqdS/sz90bczwv0sbW+buMGLeLSyYnI26QbFVsJLaUQydpq
         toXUpsxA3qVv6X7wPImgP3+x/rFpSwPQBScUGG3wDn6uzYN7gYzjbW/uG08Rj/tX/E
         MTe0AeHB0nEEHw2+z1ZSfpP9ZeO2mKQSo0cAhmYimHGoTtLFpvSOmid1j/8jxgSm3a
         X4iQyeOwRcKNkI31Og8/0wBf/OG1S9A9stB0Wg/dGiCC7l/EgK75j/PWg/sBOUZZ5w
         Rut4rbxkyrgLPqyG4Ymuj9Xp1S8eFdQ/X/yMaq3iloiC8O1jolCJ+iDD3TI1EEah96
         Sd2JpFcF4JFUg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Wayne Chang <waynec@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, treding@nvidia.com,
        jonathanh@nvidia.com, thierry.reding@gmail.com, ajayg@nvidia.com,
        kishon@ti.com, vkoul@kernel.org, p.zabel@pengutronix.de,
        mathias.nyman@intel.com, jckuo@nvidia.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 06/11] usb: typec: ucsi_ccg: Replace ccgx to well-known
 regex
In-Reply-To: <Y1ZGZ2H0/ug3se6j@kuha.fi.intel.com>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-7-waynec@nvidia.com>
 <Y1ZGZ2H0/ug3se6j@kuha.fi.intel.com>
Date:   Mon, 24 Oct 2022 11:29:27 +0300
Message-ID: <87czaheiag.fsf@balbi.sh>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Heikki Krogerus <heikki.krogerus@linux.intel.com> writes:

> On Mon, Oct 24, 2022 at 03:41:23PM +0800, Wayne Chang wrote:
>> ccgx is refer to the cypress cypd4226 typec controller.
>> Replace ccgx to well-known regex "cypress".
>>=20
>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>> ---
>>  drivers/usb/typec/ucsi/ucsi_ccg.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/=
ucsi_ccg.c
>> index 139707a2f3d6..5d3099e6eb77 100644
>> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
>> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
>> @@ -1358,7 +1358,7 @@ static int ucsi_ccg_probe(struct i2c_client *clien=
t,
>>  	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
>>=20=20
>>  	/* Only fail FW flashing when FW build information is not provided */
>> -	status =3D device_property_read_u16(dev, "ccgx,firmware-build",
>> +	status =3D device_property_read_u16(dev, "cypress,firmware-build",
>>  					  &uc->fw_build);
>>  	if (status)
>>  		dev_err(uc->dev, "failed to get FW build information\n");
>
> This will break bisectability. You need to first add that
> "cyppress,firmware-build" identifier without removing the old
> "ccgx,firmware-build" identifier, and then introduce a separate
> clean-up patch where you remove it when it's safe to remove:
>
> 1. Add new - This patch.
> 2. Modify users - PATCH 7/11.
> 3. Remove old - *missing*.

will it ever be safe to remove? What about potential products in the
market with little to no upgrade path? There are likely to be products
with a DTB that will never be updated, no?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEEg3wK/NVnD14JZqsmho6y4DXKpEQFAmNWTOcRHGJhbGJpQGtl
cm5lbC5vcmcACgkQho6y4DXKpETKbhAAg5C1ownOUJ82waG7ngsOPNNJyNnWWzed
43ejPV1pnND/jUAdJSOrLNCKaz4yp6n53TCnRlbjKxARL1UF7l2RvpsNdBuJ6w66
xZAuM6N33hL0BC4hwmGb4PLc86qz82FClw15Iz0jHICeMHir2mZ2eOhWVJcnvWLh
VTwJ3FJiTPcl2LFOzB7aoyYGAEQAYFfIv7fpDLoEawUilglOGWcs3Ltxhs9LswZI
mwzSjzXrs/vs7iOa4fxhbtO2/ET3DoUUGMTQjXbPg4dsIN7Zw8FElayi+Go9wz5p
xAoaAVZH8c0U3cKFxjXFRiiZnDIJFnhakyVsju/putdRpqSKYTs7DhmHufbRlFHm
q2ivC4/fM0ZB8UbdvmVitfIli/caTyETNIpZaMjAPeBTlmqZYjoI+/+IMP/24k53
GPoGXv0aTGqlcltZdnXw+gK/lSLTv6dNH+uq6WofjMm1f+4eQqnozWhzdC3siVMc
euVl6PaYndTJT5ZKusWMQF1TBXiskmgD9Ydi6sMz5nQQZruiGq4RFBGIM/Ip/Bp0
pOwcDgiKiijJ/M88nG6NrEaFEI8HNBRXPO0o11AiehMla/0Qstko5G0fhIlwlFT4
CHUVsacTMLw1GYNXSIkHqGS5drwOP3SEXSSqOHmAsNpVf/h8TZiE0OCR1My9dRLt
49hqCxIw+JE=
=OxAo
-----END PGP SIGNATURE-----
--=-=-=--
