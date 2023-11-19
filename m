Return-Path: <linux-i2c+bounces-300-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AAC7F0971
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 23:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86B9EB2092B
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 22:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DCD101C0;
	Sun, 19 Nov 2023 22:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I4IZVNTX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58BA72712
	for <linux-i2c@vger.kernel.org>; Sun, 19 Nov 2023 14:26:38 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5c8c8f731aaso20181157b3.0
        for <linux-i2c@vger.kernel.org>; Sun, 19 Nov 2023 14:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700432797; x=1701037597; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tKHAEH8pm+mdyGm3S8xcZ989PK/m0lepxYWwzGVtNa8=;
        b=I4IZVNTX0ygDZDKVM/J603yMk/BFo3x27THdutavhHj5IAMmas73N4xlBnlh4mQtL0
         0+sLj3C8fj+WXELL1ue7tB0L4FiKPJqL+itsDKhD4+I3QgAhXh0KT0wLMo+h2zBkMLnc
         L7fXqJ7NzSm0CJvKxCMPMLThkG2yFfPUyxABW55wP5wM1e3T0xFIq/paV2uSutzxw1AV
         kl2qdXCKJAaIvwVstCUSWaNx9IXsOgFjjzyuBw/KTOcm5rgfYsj1TUsrAh+BT+Pl28X1
         FIzknd10AVjDSy4laEZvCEa5+CKEQb/x5kYUxV9/FWKOPNbvFoxadzyYzTQQMMsSDfTk
         GCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700432797; x=1701037597;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKHAEH8pm+mdyGm3S8xcZ989PK/m0lepxYWwzGVtNa8=;
        b=Wt3KpU6PTLDsR0n9Z4ibmvr+Xm39gR3fjqLg5FEpiEINHSAzj6StKPDRY8yxQfyX32
         GHYkuenKgcYqrR5p7tVtORmU1m3HI8EaseC/ML4T/VvhSDyGF+AAefKf48guPsUKTD+P
         QYX5kUnkwZ11dygFFdwYhrmO1RsjarCqgNzIM1U2K7cAuPps73IEr02m/zJa/KPDpnVG
         xp/9C0/Oc0yl9zywSj5zzBhp3LXtk29hEDVKe0naTPraxk+xINpEJtbxQEv2S81tvxrO
         EDRUxaSgYH4scC9P2PsULQC6hVT2TlL2QnDxuDsfWham2jx+RoJ001xpgW8VHa8WK8Z6
         HVDg==
X-Gm-Message-State: AOJu0Yz+nugtv4/BWdkq7gcHA1fCsvS5svwPehLRLM1Do6mcaPjPbi2F
	ko8cZ+hUrC/iCEbJ/L+W7uTwM83Wr2heYOCoo1k8Ug==
X-Google-Smtp-Source: AGHT+IEtI+WRNtdT4PtRIsdb7Gg1gy47h39hKWZ51B3OX/a2prMfArKvd71uD8hG3OuEWkkjavfqqMPGUN001gM/ruY=
X-Received: by 2002:a0d:fb86:0:b0:5a7:be61:d52b with SMTP id
 l128-20020a0dfb86000000b005a7be61d52bmr6291046ywf.24.1700432797500; Sun, 19
 Nov 2023 14:26:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231119112826.5115-1-hkallweit1@gmail.com> <20231119112826.5115-15-hkallweit1@gmail.com>
In-Reply-To: <20231119112826.5115-15-hkallweit1@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 Nov 2023 00:26:26 +0200
Message-ID: <CAA8EJpr6uVn+MA=yzFrCybKx7j2YDXALV1i-Gh01PaR84qRkXg@mail.gmail.com>
Subject: Re: [PATCH v3 14/20] drivers/gpu/drm/msm/hdmi/hdmi_i2c.c: remove
 I2C_CLASS_DDC support
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Rob Clark <robdclark@gmail.com>, linux-i2c@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 19 Nov 2023 at 13:28, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
>
> Preferably this series should be applied via the i2c tree.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I'm fine with merging this patch through any of the trees that picks
up the rest of the patches.

>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_i2c.c |    1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
> index de182c004..7aa500d24 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
> @@ -249,7 +249,6 @@ struct i2c_adapter *msm_hdmi_i2c_init(struct hdmi *hdmi)
>
>
>         i2c->owner = THIS_MODULE;
> -       i2c->class = I2C_CLASS_DDC;
>         snprintf(i2c->name, sizeof(i2c->name), "msm hdmi i2c");
>         i2c->dev.parent = &hdmi->pdev->dev;
>         i2c->algo = &msm_hdmi_i2c_algorithm;
>


-- 
With best wishes
Dmitry

