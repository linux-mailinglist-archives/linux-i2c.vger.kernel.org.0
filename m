Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 306BE636A86
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Nov 2022 21:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237488AbiKWUIt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Nov 2022 15:08:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235952AbiKWUIr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Nov 2022 15:08:47 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB1A7C034;
        Wed, 23 Nov 2022 12:08:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5EF1361EDF;
        Wed, 23 Nov 2022 20:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C98C433C1;
        Wed, 23 Nov 2022 20:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669234123;
        bh=pMYFCDEnrTaheqJWKdnXehbOr0/Y6jGvgtCVjILFdVQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WDxLTTknA0Pw9PHTOTsHBbF7v2f0vAvXcOgRK7Y5+dIkTut7mYHgf8Jv8fJn7Se3F
         bIlrC0q7zp9ydlhEmMapJvWNHY7b6DPLiJbh2Rn+vxpXSYwPtehQpLUh2BWDx7+QVf
         YC4r3y4dooOxRj2Vu/zEHBxiDZ9QrC6s4j7owIMXyL0Wh58nt8+u3WGVAmlY5XY/bt
         YiHMvHbFSPYFejDyCSzjD39Q18YdcPT3hRtMVboxroiuazO31AfVHqITSkJSEQbotZ
         nfwCDDpOpZamPCeePaMleNStqZQKoEOh8r/SdX0ptwK6f/UTuSA23GzvmHR/Rbdvt0
         ZEsGZYZ7PtCQw==
Date:   Wed, 23 Nov 2022 20:21:15 +0000
From:   Jonathan Cameron <jic23@kernel.org>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Michael Srba <Michael.Srba@seznam.cz>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?UTF-8?B?S2xlaW5l?= =?UTF-8?B?LUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 109/606] iio: imu: inv_mpu6050: Convert to i2c's
 .probe_new()
Message-ID: <20221123202115.43162a30@jic23-huawei>
In-Reply-To: <20221118224540.619276-110-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
        <20221118224540.619276-110-uwe@kleine-koenig.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 18 Nov 2022 23:37:23 +0100
Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org> wrote:

> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>=20
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c b/drivers/iio/imu/=
inv_mpu6050/inv_mpu_i2c.c
> index 7a8d60a5afa9..70eaa408e388 100644
> --- a/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c
> +++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c
> @@ -95,9 +95,9 @@ static int inv_mpu_i2c_aux_setup(struct iio_dev *indio_=
dev)
>   *
Kernel-doc (no idea why it needs it for a probe function) has
id documented.  I've fixed up dropping that.

Jonathan

>   *  Returns 0 on success, a negative error code otherwise.
>   */
> -static int inv_mpu_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int inv_mpu_probe(struct i2c_client *client)
>  {
> +	const struct i2c_device_id *id =3D i2c_client_get_device_id(client);
>  	const void *match;
>  	struct inv_mpu6050_state *st;
>  	int result;
> @@ -260,7 +260,7 @@ static const struct acpi_device_id inv_acpi_match[] =
=3D {
>  MODULE_DEVICE_TABLE(acpi, inv_acpi_match);
> =20
>  static struct i2c_driver inv_mpu_driver =3D {
> -	.probe		=3D	inv_mpu_probe,
> +	.probe_new	=3D	inv_mpu_probe,
>  	.remove		=3D	inv_mpu_remove,
>  	.id_table	=3D	inv_mpu_id,
>  	.driver =3D {

