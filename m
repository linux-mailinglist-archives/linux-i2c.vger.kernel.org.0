Return-Path: <linux-i2c+bounces-1350-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D74830482
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 12:27:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A75881F24F0F
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 11:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C891DFE1;
	Wed, 17 Jan 2024 11:27:16 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EF81DFCD
	for <linux-i2c@vger.kernel.org>; Wed, 17 Jan 2024 11:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705490836; cv=none; b=VUMcujp6E6XjKUKcf9z/SoOxZScYGKe6lDB0rZZatcdGf5068yUlIKNclrOqf0xv3o8F54oyvtW+8jGBkz8J5gYHyLwQdO13ItvHKLDpMXZ5gAMxBAnFtnFm9jKJB+ugArcPPYfZZbSSB4hip49534AdKMlciMAgYa3o/uUQAso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705490836; c=relaxed/simple;
	bh=jBx3eKRjN7Z9dDzc9bnlFlDn2eT7AJ7HfCKi7xPOw+c=;
	h=Received:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-SA-Exim-Connect-IP:X-SA-Exim-Mail-From:
	 X-SA-Exim-Scanned:X-PTX-Original-Recipient; b=uG3gc55/QoinByvHZNbtOZRGyBIpcOX2qOd9M0xVzl3xLK6MCYxl2Z7ZVK1VlwCaVZ32AnczCyNrR7mUU7tzWUZTtx0hUieHsqYeGsjQ/qdnIwHFsDhqyIr3/nhbjT1JlR3hTtZ2lObjURXCa3PKpw1gLgrVjlxHClamkIgmC7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rQ44L-00031s-OS; Wed, 17 Jan 2024 12:26:53 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rQ44I-000S37-Tf; Wed, 17 Jan 2024 12:26:50 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rQ44I-00054q-2g;
	Wed, 17 Jan 2024 12:26:50 +0100
Message-ID: <5ad7badb85bdece735901a0f6317183b1d628a68.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/5] reset: Instantiate reset GPIO controller for
 shared reset-gpios
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami
 <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Peter Rosin <peda@axentia.se>, Jaroslav Kysela <perex@perex.cz>,  Takashi
 Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org,  linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, Sean Anderson <sean.anderson@seco.com>
Date: Wed, 17 Jan 2024 12:26:50 +0100
In-Reply-To: <20240112163608.528453-3-krzysztof.kozlowski@linaro.org>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
	 <20240112163608.528453-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Fr, 2024-01-12 at 17:36 +0100, Krzysztof Kozlowski wrote:
[...]
>  struct reset_control *
>  __of_reset_control_get(struct device_node *node, const char *id, int ind=
ex,
>  		       bool shared, bool optional, bool acquired)
>  {
> +	struct of_phandle_args args =3D {0};
> +	bool gpio_fallback =3D false;
>  	struct reset_control *rstc;
> -	struct reset_controller_dev *r, *rcdev;
> -	struct of_phandle_args args;
> +	struct reset_controller_dev *rcdev;
>  	int rstc_id;
>  	int ret;
> =20
> @@ -839,39 +1028,49 @@ __of_reset_control_get(struct device_node *node, c=
onst char *id, int index,
>  					 index, &args);
>  	if (ret =3D=3D -EINVAL)
>  		return ERR_PTR(ret);
> -	if (ret)
> -		return optional ? NULL : ERR_PTR(ret);
> +	if (ret) {

I think this should continue to return optional ? NULL : ERR_PTR(ret)
if !IS_ENABLED(CONFIG_RESET_GPIO), for example by just skipping the
of_parse_phandle_with_args(). That should allow the GPIO fallback in
patch 5 to work as expected.

> +		/*
> +		 * There can be only one reset-gpio for regular devices, so
> +		 * don't bother with GPIO index.
> +		 */
> +		ret =3D of_parse_phandle_with_args(node, "reset-gpios", "#gpio-cells",
> +						 0, &args);
> +		if (ret)
> +			return optional ? NULL : ERR_PTR(ret);
> =20
> -	mutex_lock(&reset_list_mutex);
> -	rcdev =3D NULL;
> -	list_for_each_entry(r, &reset_controller_list, list) {
> -		if (args.np =3D=3D r->of_node) {
> -			rcdev =3D r;
> -			break;
> +		gpio_fallback =3D true;
> +
> +		ret =3D __reset_add_reset_gpio_device(&args);
> +		if (ret) {
> +			rstc =3D ERR_PTR(ret);
> +			goto out_put;
>  		}
>  	}

regards
Philipp

