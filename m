Return-Path: <linux-i2c+bounces-7687-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3979B8288
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 19:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 369DDB21FA5
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 18:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD6E1C9B9A;
	Thu, 31 Oct 2024 18:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UVoVVPG+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128B61BCA05
	for <linux-i2c@vger.kernel.org>; Thu, 31 Oct 2024 18:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730398994; cv=none; b=PNBJqhtbYYqfNwXIFlOl4AbzSHBzFI8icTYPsDmOjVsmWvtzGE7WT60G6nqTT7AAEr++CDtyiTQymLZeGu2USJqGHQJNMox72vDaUJwT458IqGuBbwziRSbyn60+HaBP+WyCGg1YEorK3++EqN/dnLE30Hes2FTWpck12zKsM5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730398994; c=relaxed/simple;
	bh=OB6s1nAC/DchLbBPGMjThIla6sAG/IuVlX/Cm9GqCag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=piRqwpC8puNs+m+DdOL2qussEsvafIvbTc1UFIqbhLsz8/JCohzyNr6rFqOT5jtBlbgNtByVbU8c3q42WV0rzwRSXEjVilCYfimBdVae/yk2igD7eBQJjmbiS9y3WPDCTj6w4VI5tzZNGFgjuAtJ5GiG86AZSQXbxBQEEpMyJ/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UVoVVPG+; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ea0b25695dso9933297b3.2
        for <linux-i2c@vger.kernel.org>; Thu, 31 Oct 2024 11:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730398991; x=1731003791; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oyFaR/Nqjo7VFSddLUYVyYGruB0Du5lv6wuap1vCS68=;
        b=UVoVVPG+630ZfSRCJv+YxjWY2+2aoZqSmG8qfgMiXpk937x5cqdaJgal8ZEBS6K0qJ
         FR0J2ZrWbob9HPoxon9amFnBXIKKnxF2mVECfw/+sqZ/fCgg5wvL/FImuilBx3Xnle+p
         Bel2ktwWBkED5DtYKpXxAQJxLYuEIsIa4Y/DzdejRw/fizU+EtKcspp27pWKn51omhZ9
         7teG2YPeW7UxqNMyMJbBYlfNrri8Bv2mm4PbL1C0tpjI6SIsO5AgpCCC1yOFK0S/ft2X
         YkYU8WFMJQ9xAd/H3RCp+gkPB9fcrhSEXdvb7F0JEd0YvW3KoBNW69NAl+k0xs3tKx2y
         RRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730398991; x=1731003791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oyFaR/Nqjo7VFSddLUYVyYGruB0Du5lv6wuap1vCS68=;
        b=fzDZdds6ayozZx/lRoTb0ax4pQFTF9TXCPsM7Apbh69H2c22doV9PeDekvtobBLZf8
         UILdzAIQ9ARqR8WUzdETEZmfnOgSL8Mqh8vaIMoR11uO8Ww2WM/AcbTGtotYRERYMLG2
         SAv4phnJ/trzBmy9K/cAm7RANmsnLmRF4IqVcSNay/8auKx62o9QrXy8B+nETJiad29h
         MfHPWUgq6C8J6LYRu1Q7GmCno4ryAVXBN7nZn+o4BZD6p/I4YtYDcWCVZ86/RIvzKh8E
         95IF8VlC8abMhXX5GLxBb8I6ytjD5ryccyPUYI9OoETYtGtxqQbatYBDjsh8hTp+8mng
         ESlA==
X-Forwarded-Encrypted: i=1; AJvYcCXW9E0v1FLW0ZkGR1iwCwXBa3Zrm8xC3as5Jb/O/UfioFHSQ9oKlGl1jM04Qh5BVKtk+WQ4wP7RuQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyChmPMAxgKMe+P2KABU2QIJMU8obnyIYfWAvhENcEt+WjG1nhd
	RYOQgD159fe4t56vNMdU0PUtoj6qhWz9l18QRLaNAiaSsCFmi8pMZIlVbsjHL5yPpUV5bowDNdT
	A4vUvuRTYf4TYPHgQQ7NtUAzJf47t71oXHyys5Q==
X-Google-Smtp-Source: AGHT+IFq8R0CLiSKN/KyW3w8yrGdFcwHeCP7az6vUpHoYzraiFHMKDOSyj3hQcHE8V/hDNjDyyFp/YsnTwuwz+WSQKo=
X-Received: by 2002:a05:690c:fc2:b0:6e2:a962:d7ec with SMTP id
 00721157ae682-6e9d88e8babmr217442787b3.6.1730398991054; Thu, 31 Oct 2024
 11:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030010723.3520941-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20241030010723.3520941-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Oct 2024 20:23:00 +0200
Message-ID: <CAA8EJppKou84MZm0JS_4bPveMO2UxpMs5ejCoL7OMWd-umtDmQ@mail.gmail.com>
Subject: Re: [RFC PATCH] i2c: skip of_i2c_register_device() for invalid child nodes
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, freedreno@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, swboyd@chromium.org, 
	airlied@gmail.com, quic_jesszhan@quicinc.com, lyude@redhat.com, 
	simona@ffwll.ch, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Oct 2024 at 03:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> of_i2c_register_devices() adds all child nodes of a given i2c bus
> however in certain device trees of_alias_from_compatible() and
> of_property_read_u32() can fail as the child nodes of the device
> might not be valid i2c client devices. One such example is the
> i2c aux device for the DRM MST toplogy manager which uses the
> display controller device node to add the i2c adaptor [1] leading
> to an error spam like below
>
> i2c i2c-20: of_i2c: register /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
> i2c i2c-20: of_i2c: modalias failure on /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
> i2c i2c-20: Failed to create I2C device for /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
> i2c i2c-20: of_i2c: register /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
> i2c i2c-20: of_i2c: invalid reg on /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
> i2c i2c-20: Failed to create I2C device for /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
>
> Add protection against invalid child nodes before trying to register
> i2c devices for all child nodes.
>
> [1] : https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/display/drm_dp_mst_topology.c#L5985
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/i2c/i2c-core-of.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index a6c407d36800..62a2603c3092 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -86,6 +86,8 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
>  {
>         struct device_node *bus, *node;
>         struct i2c_client *client;
> +       u32 addr;
> +       char temp[16];
>
>         /* Only register child devices if the adapter has a node pointer set */
>         if (!adap->dev.of_node)
> @@ -101,6 +103,10 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
>                 if (of_node_test_and_set_flag(node, OF_POPULATED))
>                         continue;
>
> +               if (of_property_read_u32(node, "reg", &addr) ||
> +                   of_alias_from_compatible(node, temp, sizeof(temp)))
> +                       continue;

I think just of_property_read_u32() should be enough to skip
non-I2C-device children. If of_alias_from_compatible() fails, it is a
legit error.

> +
>                 client = of_i2c_register_device(adap, node);
>                 if (IS_ERR(client)) {
>                         dev_err(&adap->dev,
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

