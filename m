Return-Path: <linux-i2c+bounces-13890-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E2EC1CA84
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Oct 2025 19:03:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B51521888F42
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Oct 2025 18:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8F435505D;
	Wed, 29 Oct 2025 18:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWs0dk9C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B1B2F7ABE;
	Wed, 29 Oct 2025 18:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761761022; cv=none; b=NCai6uhjHHK5EcG62ttn/8vUQklix/GSfMd8lNy1rYhBRXjrkDTCvdSp9s+btCcQ95SxHC1PgZb7H8foQSbeQ3446IWgqiLE9XZp/Rndf+g1yZATngiEF1tBHHq/3CwnhLYck1uful1LmGHUUs4JinFVrAZ/35ArWWMIzZFaZtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761761022; c=relaxed/simple;
	bh=p2p1mExq+VbfFKSn6yZ7QGZN0xXJpJitifw6k/WPVOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drVcAaUhFzhEsna+DLZhyXF9y9qbzx2DfVBw9bPT4us91ge5nB22K9pxVsogEbnp344fuCJiYH4/h/KuuS9h+pt8OswXg0c/Fw/dMDV/XWMhSVSNqkPC02JW+q3HWJ9QEhCK4LbFN6ZV0MHai+kwXeJdAmvYx4MFdxwmVpOKrUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWs0dk9C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06BECC4CEF7;
	Wed, 29 Oct 2025 18:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761761022;
	bh=p2p1mExq+VbfFKSn6yZ7QGZN0xXJpJitifw6k/WPVOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mWs0dk9CVveUACfVBHLnH0vvLET//9eyp2+mEZOh0A3qXzZ5Xj487wNb//CtU6nsM
	 MA7Gzw6qCg3Av8DOuxrluoQSF9/pGWc7D6gaS742ePZ285RAKm0AxTfFZCXUieNM/v
	 6VAr3hlQUI5DT/RbH6LK/QlzdXUYiXpVMvSJKzksFmhznx6BL7V+5ROyZF7C05X4iN
	 ldvUO9Fqjq1xtHRuB0xP1Uf59f6gRIgSkhWaGN1jCUjpdakgDgbx1PfQcC7TKFhGgb
	 E8eJ2PrOrmLvefy1cxgoFrMVBvvrQZtjIELEoBcC3QEGKzDJl7RkJ8Xff7heUvEngZ
	 lUSIHtZaRw+qQ==
Date: Wed, 29 Oct 2025 19:03:35 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: i2c: qcom-cci: Document msm8953
 compatible
Message-ID: <wgxgjhzbkkzbjz64bshooo7mstnpm7ames66e4ctjwjyx3p52i@j6db4r2x64nm>
References: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
 <20251028-msm8953-cci-v2-1-b5f9f7135326@lucaweiss.eu>
 <48a217db-b85a-411c-81f2-3106b60da86f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48a217db-b85a-411c-81f2-3106b60da86f@oss.qualcomm.com>

Hi,

On Wed, Oct 29, 2025 at 10:36:16AM +0100, Konrad Dybcio wrote:
> On 10/28/25 5:40 PM, Luca Weiss wrote:
> > Add the msm8953 CCI device string compatible.
> > 
> > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > ---
> >  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> > index 9bc99d736343..ef8f5fe3a8e1 100644
> > --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> > @@ -15,6 +15,7 @@ properties:
> >      oneOf:
> >        - enum:
> >            - qcom,msm8226-cci
> > +          - qcom,msm8953-cci
> >            - qcom,msm8974-cci
> >            - qcom,msm8996-cci
> >  
> > @@ -146,6 +147,7 @@ allOf:
> >              - contains:
> >                  enum:
> >                    - qcom,msm8916-cci
> > +                  - qcom,msm8953-cci
> >  
> >              - const: qcom,msm8996-cci
> 
> Sorry for only bringing it up now - could you check whether
> all the clocks that you defined are actually necessary?
> 
> It may be that you can do without CAMSS_AHB_CLK and/or
> TOP_AHB_CLK

I was about to merge this. I'll wait for Luca's confirmation.

Andi

