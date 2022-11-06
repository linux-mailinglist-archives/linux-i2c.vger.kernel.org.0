Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E35E961E512
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Nov 2022 18:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbiKFRur (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Nov 2022 12:50:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbiKFRuq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Nov 2022 12:50:46 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DFFE18F;
        Sun,  6 Nov 2022 09:50:43 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id o30so5673271wms.2;
        Sun, 06 Nov 2022 09:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y8NI89KLXLUXJoqq3NauzSYIHtixTqflQ9ilDraLCKI=;
        b=P5bhDOWN9gh8J3b9Dv60f0h5zjSZdKTbhPgy6YKdj66TmDV0Jj7metJu6VxOuEtZsO
         Cp10SSKDNFng/K3UBPE5lppc2VzsTth3bT38dIu9eQM9Ypdb9NVNqQC6Bn/NouN+LzU0
         3NEFsaqnjfHk1xK/vubhD+YlMUgWj8cR6JrBF8Hk4ZKTVQOEXkLTonOSkPQqOSSeT9Z6
         tzthTbHbKLzMt7jRM7wFIIXsmQ7EdYTZ6IW1cCQuhr7jnAjy11RtDNNIMwRqzCspzJvu
         eXESYGhJS14RHD0caNCP5dQAYdA1K6q/dwPgv4jIlNnZolp+dKlhwl0q+RON+PzwIXb+
         xp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y8NI89KLXLUXJoqq3NauzSYIHtixTqflQ9ilDraLCKI=;
        b=jQSTQ52Encdzra8rg8MFRtSIDTazywX+Uhb4zfjlML48OcgMCu8WErk9BndU4z4dVC
         oFUkF2ZKCPq9vvpW2Cw7ewq/JAvurw1ky/dV7QkN/8og6L5bHWq9bEZ4XfR4mjb5oBHq
         n5bg2NuE8MJijyXldvLBCaGeMwjsVDm6NQsV3CqvRSxwyOV3fA5GTbI8zapAm+CnBw2G
         P75zIBKANcjUVaQT9zhnvDB/CIkGD+BfG2hvl2v/0nfLIXy5cu+332PXFU4gdh2HQQF/
         aWO4DQXVHcmEp3B3ZZTYqtAM04sHdmINqCiY68FWPWw/0MZ1UGCeyQnqLLPRYjNxDn21
         f4FQ==
X-Gm-Message-State: ACrzQf3wLa+9ueiOcnSdO6Z1heHNjxQA9H9/P6xpNqaC+iFEuPa5zCVU
        zLh1N4eahrFN4TIvmxSaGsw=
X-Google-Smtp-Source: AMsMyM4MvXoTIr0PSU3qzPu4EnfNvUVv5WsNvbliwvNY17gMm4/1ztCu62Se4b8KcxSG7gjKUnqBMQ==
X-Received: by 2002:a05:600c:1c0d:b0:3cf:5fd2:1fd1 with SMTP id j13-20020a05600c1c0d00b003cf5fd21fd1mr33027652wms.8.1667757041329;
        Sun, 06 Nov 2022 09:50:41 -0800 (PST)
Received: from DreamMachine2.lan (188.red-83-35-57.dynamicip.rima-tde.net. [83.35.57.188])
        by smtp.gmail.com with ESMTPSA id v14-20020adfedce000000b00236883f2f5csm5153643wro.94.2022.11.06.09.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 09:50:41 -0800 (PST)
Message-ID: <6b8bd5b63a69390a7facba39339c75255f57f2c4.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] i2c: core: Introduce i2c_client_get_device_id
 helper function
From:   Angel Iglesias <ang.iglesiasg@gmail.com>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Date:   Sun, 06 Nov 2022 18:50:40 +0100
In-Reply-To: <20221106172249.30241713@jic23-huawei>
References: <cover.1667750698.git.ang.iglesiasg@gmail.com>
         <bb8d7f33c6b9e960d542c3951101587b4ddfaef6.1667750698.git.ang.iglesiasg@gmail.com>
         <20221106172249.30241713@jic23-huawei>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (by Flathub.org) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 2022-11-06 at 17:22 +0000, Jonathan Cameron wrote:
> On Sun,=C2=A0 6 Nov 2022 17:42:24 +0100
> Angel Iglesias <ang.iglesiasg@gmail.com> wrote:
>=20
> > Introduces new helper function to aid in .probe_new() refactors. In ord=
er
> > to use existing i2c_get_device_id() on the probe callback, the device
> > match table needs to be accessible in that function, which would requir=
e
> > bigger refactors in some drivers using the deprecated .probe callback.
> >=20
> > This issue was discussed in more detail in the IIO mailing list.
> >=20
> > Link:
> > https://lore.kernel.org/all/20221023132302.911644-11-u.kleine-koenig@pe=
ngutronix.de/
> > Suggested-by: Nuno S=C3=A1 <noname.nuno@gmail.com>
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Suggested-by: Jonathan Cameron <jic23@kernel.org>
> > Signed-off-by: Angel Iglesias <ang.iglesiasg@gmail.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> Trivial comment inline - otherwise lgtm
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>=20
> Thanks,
>=20
> >=20
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index b4edf10e8fd0..920676e62c22 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -2236,6 +2236,21 @@ int i2c_get_device_id(const struct i2c_client
> > *client,
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL_GPL(i2c_get_device_id);
> > =C2=A0
> > +/**
> > + * i2c_client_get_device_id - get the driver match table entry of a de=
vice
> > + * @client: the device to query. The device must be bound to a driver =
or
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the function oopses=
.
>=20
> Maybe don't state what happens otherwise if something changes to make it
> instead do something else unfortunate, this comment will need updating.
> "The device must be bound to a driver."

Sure, sorry for the trouble. I'll wait a bit for more comments and then sen=
d v3
fixed.

Thanks for your time,
Angel

>=20
> > + *
> > + * Returns a pointer to the matching entry if found, NULL otherwise.
> > + */
> > +const struct i2c_device_id *i2c_client_get_device_id(const struct
> > i2c_client *client)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct i2c_driver *drv=
 =3D to_i2c_driver(client->dev.driver);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return i2c_match_id(drv->id_=
table, client);
> > +}
> > +EXPORT_SYMBOL_GPL(i2c_client_get_device_id);
> > +
> > =C2=A0/* ----------------------------------------------------
> > =C2=A0 * the i2c address scanning function
> > =C2=A0 * Will not work for 10-bit addresses!
> > diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> > index f7c49bbdb8a1..d84e0e99f084 100644
> > --- a/include/linux/i2c.h
> > +++ b/include/linux/i2c.h
> > @@ -189,6 +189,7 @@ s32 i2c_smbus_read_i2c_block_data_or_emulated(const
> > struct i2c_client *client,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 *values);
> > =C2=A0int i2c_get_device_id(const struct i2c_client *client,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct i2c_device=
_identity *id);
> > +const struct i2c_device_id *i2c_client_get_device_id(const struct
> > i2c_client *client);
> > =C2=A0#endif /* I2C */
> > =C2=A0
> > =C2=A0/**
>=20

