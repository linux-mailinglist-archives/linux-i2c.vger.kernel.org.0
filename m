Return-Path: <linux-i2c+bounces-6381-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D6D970C00
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 04:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA390286085
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 02:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4CA16D4EF;
	Mon,  9 Sep 2024 02:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RDsGTMsD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06591422A8
	for <linux-i2c@vger.kernel.org>; Mon,  9 Sep 2024 02:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725849598; cv=none; b=nT0R4F1i4AUMBFaITuaVRnikv+DXX35ROnO2RqYo64h8rhMAt9xKaSB/c/XiIP6wpWPc8PdnUqCw+LZT4+14TNNDBhsI4LKJcb/abUh4e77+Z6awZFCZf7o7PsXmMlleBVlsDvhbFQxFmsEaOWPYTfT4dgwSPe6hydFD2nr3miE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725849598; c=relaxed/simple;
	bh=CXncZPiQ0Stl5rweg8akghGFSW67+FTjXiBapm0vHJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c05ciIIwOIRMbTLIjarLVxpFmvFr9AdvV9nElMnl3j2wWeQBIMU2RLdezR6Xli9Jw8ff49WPv/99i2BqRMUUNQKC4w01O4PKBBWMQVTMpulo/VF2Ja8cc6UFI6oVycCdr+WUpLlvNERXJGL7eoqN9OhPAo1ru/8yr0gTTvkxmQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RDsGTMsD; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-535dc4ec181so3436091e87.3
        for <linux-i2c@vger.kernel.org>; Sun, 08 Sep 2024 19:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725849594; x=1726454394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cFi5jfefYj2+h0zGqYNyKUh3On9Em31F3FUiHDsAPI=;
        b=RDsGTMsDebBOAnErFPlrVX9n/rc/IrgmyzA+ead1woeWXDbLxHNIJw8E6MgFYG0dlV
         wvSu8IOwvbGt3KE3vpR5Ybdl5nMxTWWHoOhv9BI78Jf6+oWB4xKttPwZS+B4eDwRYTaP
         AIgsEmU9DOYMjFDbUlerCc+3LUvfpDNZfz+NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725849594; x=1726454394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cFi5jfefYj2+h0zGqYNyKUh3On9Em31F3FUiHDsAPI=;
        b=X1ZWRUbelDVQ8qh4nYhqwSNfN6o9SI7GmjihOZOc10pnk/jIgzky5D97nY13jXma3J
         5zJD14S8WPbLJ6as81EyG+JFusaUrcyerwjFks7gvG4lCOYxE8FWpnEPnfS7n6e5iNEo
         z/KF3NuFl+yPwXP3Eq1HNpI4ZZVzA/F1XEPNMNY6oSo4k/OqhOTEn2BsHSEhvG4rqkSM
         M/TS16Ii1oIajpk19IDzJsSRjKtJdX+eQniL7oNNz0HKfH7tGJpGluYK5ye8lnUT8cK0
         ifEbkDKXkfWZlJdDkLiqeDiqaBILzpDeh0bhB33U6rYthCEVR8FnAJgU5nZ+TLIVEY00
         2TeA==
X-Forwarded-Encrypted: i=1; AJvYcCWQX+kXW3coGpARMsqEk25i3PfqFZMaUXqTXSmdTvg18wjIASjUuhTxpnApYIF40eVAUNYEN8VWFGs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa/wxFr0Wm3FVIsuGL9f7B4uUYiYZDYml3poa6ob2KQwSzhI9l
	h/YtFjfWqbEjtwGnwdaqTvZMQdtJ/Giejzi+efOuNhh3+PeI2OD6vt2bAI3Mwx1VOATKTHu0El7
	zz2yOia78aa5C3zSRzuFqsjGRAWtx0MPb96HO
X-Google-Smtp-Source: AGHT+IHlN5GLZpAnPwP9Nfh6dJDXv4dqOvMPNVAV72HrfVF/EPodSu+G81D645T++W4Kv1SPpVAmGlS4gT+SnusBNKU=
X-Received: by 2002:a05:6512:1384:b0:52f:413:7e8c with SMTP id
 2adb3069b0e04-536587abe8amr5156459e87.14.1725849593704; Sun, 08 Sep 2024
 19:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-6-wenst@chromium.org>
 <Zthc8r62z2eaR8k0@smile.fi.intel.com>
In-Reply-To: <Zthc8r62z2eaR8k0@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Sep 2024 10:39:42 +0800
Message-ID: <CAGXv+5FCctBG5uOSvH_-0z2Jgi36zRs-Cg0_P+q8aikxLcwmbw@mail.gmail.com>
Subject: Re: [PATCH v6 05/12] regulator: Do pure DT regulator lookup in of_regulator_bulk_get_all()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 9:13=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 04, 2024 at 05:00:07PM +0800, Chen-Yu Tsai wrote:
> > The to-be-introduced I2C component prober needs to enable regulator
> > supplies (and toggle GPIO pins) for the various components it intends
> > to probe. To support this, a new "pure DT lookup" method for getting
> > regulator supplies is needed, since the device normally requesting
> > the supply won't get created until after the component is probed to
> > be available.
> >
> > Convert the existing of_regulator_bulk_get_all() for this purpose.
> > This function has no in-tree users, as the original patch [1] that
> > used it was never landed. This patch changes the function ABI, but
> > it is straightforward to convert users.
> >
> > The underlying code that supports the existing regulator_get*()
> > functions has been reworked in previous patches to support this
> > specific case. An internal OF-specific version of regulator_get(),
> > of_regulator_get_optional(), is added for this.
> >
> > Also convert an existing usage of "dev && dev->of_node" to
> > "dev_of_node(dev)".
>
> > [1] https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@g=
mail.com/
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Make it Link tag.
>
>   Link: https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec=
@gmail.com/ [1]
>   Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Ack.

