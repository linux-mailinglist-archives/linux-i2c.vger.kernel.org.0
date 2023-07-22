Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 572A975DE25
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 21:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbjGVTGd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 15:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjGVTGc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 15:06:32 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C015E45;
        Sat, 22 Jul 2023 12:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1690052788;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7guB4ZLz29lC5Mz2i2OthYSB2/BMWeO0nASQlIgRzPY=;
        b=vTwlnTIAozIFBeEey9kTSN7kQfGflFzQIMU6ef7N3eHkTi2pT32bhu4G+CSr/HVijfzw9J
        ztjvH+lqV4wKa/Obra29W78agD13UuzGwhonM9pdBQvxum7RPDoXbP0vnFywVliagz7V6h
        zF4lNOGG7a92XX9XY6CG6ph7jYcPFAY=
Message-ID: <96ce584d2ba6cb58ab3d5f8ea64f18ada54de944.camel@crapouillou.net>
Subject: Re: [PATCH v2 21/22] i2c: virtio: Remove #ifdef guards for PM
 related functions
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Conghui Chen <conghui.chen@intel.com>,
        virtualization@lists.linux-foundation.org
Date:   Sat, 22 Jul 2023 21:06:26 +0200
In-Reply-To: <20230722115310.27681-5-paul@crapouillou.net>
References: <20230722115046.27323-1-paul@crapouillou.net>
         <20230722115310.27681-5-paul@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

As the build bot noticed - this patch is invalid as the
virtio_driver.{freeze,restore} callbacks are guarded by #ifdefs.

Feel free to apply the rest (if everybody is happy with them) and I'll
respin this one.

Cheers,
-Paul

Le samedi 22 juillet 2023 =C3=A0 13:53 +0200, Paul Cercueil a =C3=A9crit=C2=
=A0:
> Use the new PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
>=20
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
>=20
> ---
> Cc: Conghui Chen <conghui.chen@intel.com>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: virtualization@lists.linux-foundation.org
> ---
> =C2=A0drivers/i2c/busses/i2c-virtio.c | 8 ++------
> =C2=A01 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-virtio.c
> b/drivers/i2c/busses/i2c-virtio.c
> index 4b9536f50800..c60ae531ba57 100644
> --- a/drivers/i2c/busses/i2c-virtio.c
> +++ b/drivers/i2c/busses/i2c-virtio.c
> @@ -243,7 +243,6 @@ static struct virtio_device_id id_table[] =3D {
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(virtio, id_table);
> =C2=A0
> -#ifdef CONFIG_PM_SLEEP
> =C2=A0static int virtio_i2c_freeze(struct virtio_device *vdev)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0virtio_i2c_del_vqs(vdev);
> @@ -254,7 +253,6 @@ static int virtio_i2c_restore(struct
> virtio_device *vdev)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return virtio_i2c_setup_v=
qs(vdev->priv);
> =C2=A0}
> -#endif
> =C2=A0
> =C2=A0static const unsigned int features[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0VIRTIO_I2C_F_ZERO_LENGTH_=
REQUEST,
> @@ -269,10 +267,8 @@ static struct virtio_driver virtio_i2c_driver =3D
> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.driver=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0.name=C2=A0=C2=A0=C2=A0=3D "i2c_virtio",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> -#ifdef CONFIG_PM_SLEEP
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.freeze =3D virtio_i2c_freeze,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.restore =3D virtio_i2c_restor=
e,
> -#endif
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.freeze=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=3D pm_sleep_ptr(virtio_i2c_freeze),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.restore=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=3D pm_sleep_ptr(virtio_i2c_restore),
> =C2=A0};
> =C2=A0module_virtio_driver(virtio_i2c_driver);
> =C2=A0

