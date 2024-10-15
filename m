Return-Path: <linux-i2c+bounces-7407-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F330699F4CB
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 20:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 745331F26AEA
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 18:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735A51B219C;
	Tue, 15 Oct 2024 18:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NzFK8/Ud"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948ED28691
	for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 18:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729015525; cv=none; b=Afh7wupbxzU69mg0sOLvZP/o+B4J9MEiJEwktCdBz+jDFEkZ3odcSZr9L0O0p4KcVaymerZFhAuJODaRwJzyhDTqpSc3PtNr447U+XRxwXZCBa56286OMJ3WVSxC1/TyIr99XfITAnVMIyQw0fHG0vlp1Xg4hum1aGSVoIHdrV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729015525; c=relaxed/simple;
	bh=14O5MDyat6CX8O123WRU/kCYMtgocuRDZbVVnnkI2Yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GW3eFPRFnqHq0D8KZAUwWxj5G/XWhQ4hhXenObWAPghvbiqVtxwvxxpkvqvsrktGx4OndM7q3rAJd6mvCwu56a4uuZyY5Im2fealnQZqzlo9sWA7fYJnXhDgf2bygf6zVxquoKNxB5H35uT+1K2Jw2QqgWI5kQnPufy+XQNAl24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NzFK8/Ud; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c962c3e97dso3951751a12.0
        for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 11:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729015522; x=1729620322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Yio/gvv50Y6PZv0Xv308n7irKGS6U7Q/Fl4Lj32yaA=;
        b=NzFK8/UdWR20Acf5gQKRELdbAF93JZS0m1B4Pv7EZwbkixB9ygX1xEryyuP08PgKmN
         R9Q+xH4A5OKGR7eMOkbJx8UIZ6SRGBNkb13L9R0Lh9Ojr+eKP3T0iCSD4xSCWwvD6QBZ
         xCl/nLnJ2OYyFeHo0PQhJ6j1g4/kK0Hf0sYpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729015522; x=1729620322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Yio/gvv50Y6PZv0Xv308n7irKGS6U7Q/Fl4Lj32yaA=;
        b=OsW1aLbegva44Ys8Uak1t7TtnP6mA5f4qAxLUReuXmy+lqdf/Y/TiliK/1dbHb2bxB
         qbjsGFeUTtFhcBRV+oCuxz+iWVLQfXiil7Dt5j90HlMUTyUzg0vau92C5xV6v243bm5j
         Rin1DLEtfiJbGXqqbHF+QP1GA1pb3hwmbzYTuBQ+fbMUlDdSEB3Tz0GXojgGNvBRE4JM
         5i5PsRMBwni0JkT4dq3eQZ4RkjSN78n3WnqYefxxcOHTvOhCfYmPOJomp9icQUKZGbo4
         IKrIrYiAkD3i27pdOQYlaRUY+0g2Xact99Z4Onip+r7+sh/t725CFwIImhQUA7M5T8b1
         qG3A==
X-Forwarded-Encrypted: i=1; AJvYcCXCerAN7egxARQnu3E5CJ8TkhRGA++QP01c1nX66LNQyjyWSVeeBtwg1/TV72ID89fhhWpKQXjoW0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzFEGR/n5gzWRjTtRHqxI1+6XM+OiW7D9Q8+9pRZvZzg6O+AKA
	8s0/PJinVVRhe6nKiI2YgUuGoII6rpBoelkrbHE4+r5DWtxWm0/x6ksFQelBRyd3LtAp7KZUqFQ
	GkqJa
X-Google-Smtp-Source: AGHT+IH4Tny3Kkn1C1AMAfGCn7r2xESOXaw3QNw7LU45cJ7Ee73MikooWhNbRRpYSWFttyO+ZDsdag==
X-Received: by 2002:a05:6402:2714:b0:5c9:7dd9:3eda with SMTP id 4fb4d7f45d1cf-5c97dd946f0mr6468449a12.5.1729015521672;
        Tue, 15 Oct 2024 11:05:21 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d4f9dc2sm930434a12.38.2024.10.15.11.05.21
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 11:05:21 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43144f656f0so7010735e9.0
        for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 11:05:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZGFH9QxeCUTladSvKU8ZtuwElRl90DtSX+K0YDDFh0BOyfJmN2tbL/hkr6mMvVXIGd0ttd1gLMdk=@vger.kernel.org
X-Received: by 2002:a05:6512:2c95:b0:539:e94d:2d3d with SMTP id
 2adb3069b0e04-539e94d2ea1mr5104630e87.7.1729015125333; Tue, 15 Oct 2024
 10:58:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-5-wenst@chromium.org>
In-Reply-To: <20241008073430.3992087-5-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Oct 2024 10:58:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WRSjk3U9Kau0wqkgv3KB=9jM6wCM9Gs-WxWai35sfxTg@mail.gmail.com>
Message-ID: <CAD=FV=WRSjk3U9Kau0wqkgv3KB=9jM6wCM9Gs-WxWai35sfxTg@mail.gmail.com>
Subject: Re: [PATCH v8 4/8] i2c: Introduce OF component probe function
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> +int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe=
_cfg *cfg, void *ctx)
> +{
> +       const struct i2c_of_probe_ops *ops;
> +       const char *type;
> +       struct i2c_adapter *i2c;
> +       int ret;
> +
> +       ops =3D cfg->ops ?: &i2c_of_probe_dummy_ops;
> +       type =3D cfg->type;
> +
> +       struct device_node *i2c_node __free(device_node) =3D i2c_of_probe=
_get_i2c_node(dev, type);
> +       if (IS_ERR(i2c_node))
> +               return PTR_ERR(i2c_node);

I'm still getting comfortable with the __free() syntax so sorry if I'm
wrong, but I _think_ the above is buggy. I believe that the definition
of the free function for "device_node" is from:

DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))

...which means it'll call of_node_put() to free "i2c_node" when it
goes out of scope. of_node_put() handles NULL pointers but _not_ ERR
pointers. So I think that if you get an error back and then return via
the PTR_ERR(i2c_node) then it'll crash because it will try to free an
ERR pointer. Did I get that right? Presumably you need to instead do:

  return PTR_ERR(no_free_ptr(i2c_node));

...or change of_node_put() to be a noop for error pointers?


> +struct i2c_of_probe_ops {
> +       /**
> +        * @enable: Retrieve and enable resources so that the components =
respond to probes.
> +        *
> +        * Resources should be reverted to their initial state before ret=
urning if this fails.

nit: might be worth explicitly noting that returning -EPROBE_DEFER is
OK here because this both retrieves resources and enables.


> +        */
> +       int (*enable)(struct device *dev, struct device_node *bus_node, v=
oid *data);
> +
> +       /**
> +        * @cleanup_early: Release exclusive resources prior to enabling =
component.

nit: change the word "enabling" to "calling probe() on a detected"
since otherwise it could be confused with the "enable" function above.


-Doug

