Return-Path: <linux-i2c+bounces-6220-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A1B96CD81
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 05:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 347831C22F78
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 03:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E115014BFB0;
	Thu,  5 Sep 2024 03:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RFQew6v2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD88713B7AF
	for <linux-i2c@vger.kernel.org>; Thu,  5 Sep 2024 03:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725508368; cv=none; b=ruSgFsxSjCxoMvA9O93Uz3a5UJdGOQFDuKhasPNSkNcKu9YbOC8mFrQ214IxMEmpcMzieO40MKyfvMvVwgQU9ZzrxhVESc/JHM4i32CwDlOTMkYAP+KYZxUFSNg+XlqqHxqN6Vjh7/paMc/tmlybpMFAn0h5wK0yjrj37BTrwY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725508368; c=relaxed/simple;
	bh=su/8gj6ks5K85/I3PIYZHz4bzmuYkE7mRyHvpRMnZhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AdwqZjtAVUtReFys/pw3GmXuT1OcZErUkKnQnk8zI3rqy3moZH7h9yhSGaiZCTn34lNCk0/69jKOQnsI1dgpzZgmesnQwmYj8ywUEcR/H544VnEnLVrjivf4QeC2YDZqxx+310pjnm9taAxZ20cG5c+j9hGhbB87PqnV0t3szbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RFQew6v2; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5353cd2fa28so236809e87.3
        for <linux-i2c@vger.kernel.org>; Wed, 04 Sep 2024 20:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725508364; x=1726113164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRIIgJ7S3hsBk6289/S+wOJS+zjzXBK17nuyOQXg1gQ=;
        b=RFQew6v2H2RSVsC5zXcTD6NPoVUP8rC4ngRO26FnEtEXE33zWqplCFXsAojoxCDk9w
         3jKXMjTvIWiDfBjZwGOtERjZmGe79jhk4jXmbQ1YGWP3zUHPs8ABv0uqZSY67QOYzk/B
         GUUu82pqiF1qtQbMBvsiHC9N7CNp/owZhwEqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725508364; x=1726113164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QRIIgJ7S3hsBk6289/S+wOJS+zjzXBK17nuyOQXg1gQ=;
        b=VupK7TIKm75ww6wA+VjUrCYei85cFVYbuJiEvA8KXvNAtpzWxY4vuD4QbT7jPL26s/
         yYil8rv1EUsGUcZ7HOkT96ZQo1VMIrOwuX/zMlB+PwKKB+RMD6D3EmCrUyGaD8ls1GEm
         PiknDRVYoJNBNF/Pe1mRfBXwkdl0zGaXfy7FSTefSnzz3dkbjiJHgaRpe7MpQE0cHfIe
         MKfQ87EUnJCNWp4C0y3NWssKuVhZkoPAPeqpPCrVKF+So9v8cnPi8mGvMsnXNVUnvyLr
         IqR5q9QM5HyQxpg8tOE9KyaflvToK49bPfSgErLnDjRHwn5Ux67/CzvvWhLPnvjoLKP1
         6iFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8lr2IpODNYcW3Xv6c6E/YGhbFwQcgmy6GyW0utksbpRaoW6mgINbC7tfkFHPazpdPzVi5ptu9QZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa2C9jMWZK+guzlqiKoEK9DJey7W5/okyVgn3SnkCfz8NDCyVZ
	2hhRjynAeHHVVBaRgHpSwCbQ33xxJMp9maXojiRmzfT0f6Lf0v7a701QkVuME0jUAytga3ulij7
	HuuWhQNXPogWUFfhCY6YWkUfVVyGXasTvAPvg
X-Google-Smtp-Source: AGHT+IFf4LunjDbLMZ4JbahUyowVfro0pxQijuaHaPzJX7btNK9HgFjL//PjfHIonl230ee/BtNVKcZVy4RESHnFt3A=
X-Received: by 2002:a05:6512:350e:b0:535:66ff:c681 with SMTP id
 2adb3069b0e04-53566ffc733mr2025998e87.48.1725508363601; Wed, 04 Sep 2024
 20:52:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-12-wenst@chromium.org>
 <Ztgxlmhnkn7NVC81@google.com>
In-Reply-To: <Ztgxlmhnkn7NVC81@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 5 Sep 2024 11:52:32 +0800
Message-ID: <CAGXv+5GpKu-b4_dbRcuSG4NxQi_FKh9p7iMh6DfgavkLFdLLdQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/12] platform/chrome: Introduce device tree hardware prober
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, chrome-platform@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 6:08=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> On Wed, Sep 04, 2024 at 05:00:13PM +0800, Chen-Yu Tsai wrote:
> > diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/=
platform/chrome/chromeos_of_hw_prober.c
> [...]
> > +static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
> > +{
> > +     for (size_t i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++) {
> > +             int ret;
> > +
> > +             if (!of_machine_is_compatible(hw_prober_platforms[i].comp=
atible))
> > +                     continue;
> > +
> > +             ret =3D hw_prober_platforms[i].prober(&pdev->dev, hw_prob=
er_platforms[i].data);
> > +             /* Ignore unrecoverable errors and keep going through oth=
er probers */
> > +             if (ret =3D=3D -EPROBE_DEFER)
> > +                     return ret;
>
> Is it harmless if some of the components get probed multiple times?  E.g.=
:
> comp1 probed -> comp2 probed -> comp3 returned -EPROBE_DEFER -> some time
> later, chromeos_of_hw_prober_probe() gets called again.

Yes it is harmless. Components already enabled will not get disabled
in the error path. And the prober that enabled that component will see
that a component was enabled, and skip doing the whole process again.

So something like:

    comp1 probed -> comp2 probed -> comp3 -EPROBE_DEFER ->
        comp1 skip -> comp2 skip -> comp3 probed


ChenYu

