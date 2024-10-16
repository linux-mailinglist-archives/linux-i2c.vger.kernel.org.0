Return-Path: <linux-i2c+bounces-7426-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D13F59A0580
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 11:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93C8B2814B0
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 09:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE59205E15;
	Wed, 16 Oct 2024 09:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HnhzG/Ce"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC09F1B6D13
	for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2024 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729070901; cv=none; b=CfTTVHx+ygg1KHhoJycC4Iz8ujb2JfazZf3shdaGLIdybmXaQbrTw61xAN9T9sEexK0KvCtjbVpCnMgb+sHsK2n28mvI19BB51q9e46O7wKQCUYxvyS4tZ47rkxUcm+sX1K5PHx3B9QOoe0H1dL2WGqjPeUEaM+9krIPoAE/aFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729070901; c=relaxed/simple;
	bh=udOf30ZlWky3uzp/m7PSgXQuHwti7csL/gsXUNukPSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cblLe2MY6tt7/guyxzPbdnSGHiBGuXCdFYhpbxm9G95U6UFk7YLt22GEI5FnivxvXztMk/7HVTSdL8cI+HdyfxKjEc8jeB1597P0QSW7vGtxrmI7+LHkvXcNhJVXoD5vFCHkg6PK0imRy7WKn6/1yXRtLjNotnKOx/UA5illyZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HnhzG/Ce; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539fe76e802so2149087e87.1
        for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2024 02:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729070897; x=1729675697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlvkqeHB10TeR7p0qpAqomrEbyrl0g2iGDmWLXtmqe8=;
        b=HnhzG/CegpiN93X0l8TGdSJk0KARYSY5olJJy7gYXVdUDefGjD7/B1z+Cwi8oHX1lT
         Ju62Sd+yXxy/L8RrM3ZFLKjsqNDwPVf90Cp23hhc+wp9XNodUN3ECttzdlNKCmn70MSk
         r4/qlLmi/SanCmtfug3qu5p1FlK0xi9YE5pLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070897; x=1729675697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlvkqeHB10TeR7p0qpAqomrEbyrl0g2iGDmWLXtmqe8=;
        b=Ctte3FVhrc5cNcp3MHkRNlPrzBbK6U4NmX1/fJ448PNHFmrYqVFLaXmEFR+fdxx7x+
         3KoSoby9DqVtJrAgsy5+MDa/dDQ1uBZyJDhAkPTZSmFpucADimEez00Fypj+5yZ8+g5U
         MRVVj1J1IshEXjZ+d6Z5m3KRqjuI7iA+cHSnDW9s9TgnBDX3l3ozp+eYL7HamXUx5UkF
         udqZxCes94pnTzlBoxPlqK3T1+c53cYJ65nQq5Xt6iF1rRffcvbeGViUgEFUOJOlUAI2
         3MxnNDEIlX4Cqx3dm6nLBOxF3Muv54KZdxj5TlvUcZjcnT55hY0wVUoBBSirY2nhiUQi
         Jn1w==
X-Forwarded-Encrypted: i=1; AJvYcCWA9UY08vkXq04k+/7pDqSk9f2dQDcwtXK7ltrneqqayy1MbQecJuPaKhz9z4+yudeNICgEfSMbD3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv1hN0taN4IoLOV65R0VBW1d4JTCL9dlQREpew2fUXQsxraiL2
	1mjA1Jq1GUlB9ECUXnvso+rfSrKT5PaJsKcvzA2JC/+RqYzGi6hbjg59a9XPY3a8hCOC9Z/GuX3
	8xLrU6v/reX80lkgQDL6BGKJ79UTrlJC95DvA
X-Google-Smtp-Source: AGHT+IEaS5qJnG1F/Na+fPMzIxej3L36Oa+G1Du15MTwKWHu6l9SdRlVC+wBVlX0gEHyVjj7AKsa/2ZIQjZ3p9uU05A=
X-Received: by 2002:a05:6512:b11:b0:530:e323:b1d0 with SMTP id
 2adb3069b0e04-539e54d77bdmr6806437e87.9.1729070896644; Wed, 16 Oct 2024
 02:28:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-5-wenst@chromium.org>
 <CAD=FV=WRSjk3U9Kau0wqkgv3KB=9jM6wCM9Gs-WxWai35sfxTg@mail.gmail.com> <CAGXv+5FW0UTjR_ZiqZ8VEOQkBemt54omtJe_aTj3jvScC-LuMw@mail.gmail.com>
In-Reply-To: <CAGXv+5FW0UTjR_ZiqZ8VEOQkBemt54omtJe_aTj3jvScC-LuMw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 16 Oct 2024 17:28:05 +0800
Message-ID: <CAGXv+5GHDt3_Td8B441xv=-G1=LBfSXp8_sQ4XRRPX1f4VyTMQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/8] i2c: Introduce OF component probe function
To: Doug Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Saravana Kannan <saravanak@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 3:01=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Wed, Oct 16, 2024 at 1:58=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> > >
> > > +int i2c_of_probe_component(struct device *dev, const struct i2c_of_p=
robe_cfg *cfg, void *ctx)
> > > +{
> > > +       const struct i2c_of_probe_ops *ops;
> > > +       const char *type;
> > > +       struct i2c_adapter *i2c;
> > > +       int ret;
> > > +
> > > +       ops =3D cfg->ops ?: &i2c_of_probe_dummy_ops;
> > > +       type =3D cfg->type;
> > > +
> > > +       struct device_node *i2c_node __free(device_node) =3D i2c_of_p=
robe_get_i2c_node(dev, type);
> > > +       if (IS_ERR(i2c_node))
> > > +               return PTR_ERR(i2c_node);
> >
> > I'm still getting comfortable with the __free() syntax so sorry if I'm
> > wrong, but I _think_ the above is buggy. I believe that the definition
> > of the free function for "device_node" is from:
> >
> > DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))
> >
> > ...which means it'll call of_node_put() to free "i2c_node" when it
> > goes out of scope. of_node_put() handles NULL pointers but _not_ ERR
> > pointers. So I think that if you get an error back and then return via
> > the PTR_ERR(i2c_node) then it'll crash because it will try to free an
> > ERR pointer. Did I get that right? Presumably you need to instead do:
> >
> >   return PTR_ERR(no_free_ptr(i2c_node));
> >
> > ...or change of_node_put() to be a noop for error pointers?
>
> Good catch! As Andy suggested, it should be updated to handle both.
> I'll add a patch for this.

On second thought, it might be better to change i2c_of_probe_get_i2c_node()
to return NULL on errors. That seems to be what most functions do. I only
found a handful of exceptions.

Rob, any thoughts from your end?


ChenYu

